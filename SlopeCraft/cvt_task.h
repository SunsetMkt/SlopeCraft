#ifndef SLOPECRAFT_SLOPECRAFT_CVT_TASK_H
#define SLOPECRAFT_SLOPECRAFT_CVT_TASK_H

#include <QString>
#include <QImage>
#include <QVariant>

struct cvt_task {
  QString filename{""};
  QImage original_image;

  bool is_converted{false};
  bool is_built{false};
  bool is_exported{false};

  static cvt_task load(QString filename, QString& err) noexcept;
};

Q_DECLARE_METATYPE(cvt_task);

using task_pool_t = std::vector<cvt_task>;

#endif  // SLOPECRAFT_SLOPECRAFT_CVT_TASK_H