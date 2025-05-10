Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631871B21BF
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746885176; cv=none; b=hJPi/dH6dYgeYwRUuMIvaONsjzDkxec7vS7won1O/U/pqYzp8gJIHbHCrJMmXbVnkWOhqTPEPCn3sSdaaRGDnw69b+Vxl20UcJSg5vW/9/iKOoXiKno+bCxM7mxuvGtyvtT1IGwZwNPK8d6JYy6wsaiG3ouosdxNK6NBkbbXP1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746885176; c=relaxed/simple;
	bh=QOgG8NrhX3t1V5A2Lz7iTrszO06Wk/FGbJ857nU+Tes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=efaktnzcGbjsdNsRKniWCrdRy96wfqB6XR9HQavcN0Zbsp4LCke18QBJ6Z41RKaJjZ/YxpTMEIcVp9wJxcmuIiXtfg5h+uF54S/OAW305T6s2kpKVzTTxUFYBcv+fyUdOLZGFVwRV84mBiD49P1KL4/JumFb0/kn8/2Rwc1S4k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hEy1ylXO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hEy1ylXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6C3C4CEE2;
	Sat, 10 May 2025 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746885175;
	bh=QOgG8NrhX3t1V5A2Lz7iTrszO06Wk/FGbJ857nU+Tes=;
	h=Date:From:To:Cc:Subject:From;
	b=hEy1ylXO5eqc7RkukVPzW/NXDPWM5oDfW40JEbVrGNIWIdSEvGg9heSlBSjbKxvYF
	 uMmyOb8EyidbScaNk9suwU86sgsDjWnq7lacVdTL7iU1LIgM2fYfRMZM/t6HOsa4gD
	 tUiBjBbnsFjJsq3/YJna1iPJ56u+NEIWWMKW9uSI=
Date: Sat, 10 May 2025 15:52:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc driver fixes for 6.15-rc6
Message-ID: <aB9aNLzpdHsXMfBU@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc6

for you to fetch changes up to 65995e97a1caacf0024bebda3332b8d1f0f443c4:

  Drivers: hv: Make the sysfs node size for the ring buffer dynamic (2025-05-02 13:59:02 +0200)

----------------------------------------------------------------
Char/Misc/IIO driver fixes for 6.15-rc6

Here are a bunch of small driver fixes (mostly all IIO) for 6.15-rc6.
Included in here are:
  - loads of tiny IIO driver fixes for reported issues
  - hyperv driver fix for a much-reported and worked on sysfs ring
    buffer creation bug

All of these have been in linux-next for over a week (the IIO ones for
many weeks now), with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Angelo Dureghello (1):
      iio: adc: ad7606: fix serial register access

David Lechner (8):
      iio: adc: ad7380: disable offload before using SPI bus
      iio: adc: ad7606: check for NULL before calling sw_mode_config()
      iio: adc: ad7380: fix event threshold shift
      iio: imu: inv_mpu6050: align buffer for timestamp
      iio: chemical: sps30: use aligned_s64 for timestamp
      iio: chemical: pms7003: use aligned_s64 for timestamp
      iio: imu: adis16550: align buffers for timestamp
      iio: pressure: mprls0025pa: use aligned_s64 for timestamp

Gabriel Shahrouzi (2):
      staging: iio: adc: ad7816: Correct conditional logic for store mode
      iio: adis16201: Correct inclinometer channel resolution

Greg Kroah-Hartman (1):
      Merge tag 'iio-fixes-for-6.15a' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/jic23/iio into char-misc-linus

Gustavo Silva (1):
      iio: imu: bmi270: fix initial sampling frequency configuration

Jonathan Cameron (5):
      iio: temp: maxim-thermocouple: Fix potential lack of DMA safe buffer.
      iio: accel: adxl355: Make timestamp 64-bit aligned using aligned_s64
      iio: adc: dln2: Use aligned_s64 for timestamp
      iio: adc: ad7768-1: Fix insufficient alignment of timestamp.
      iio: adc: ad7266: Fix potential timestamp alignment issue.

Krzysztof Kozlowski (3):
      iio: accel: fxls8962af: Fix wakeup source leaks on device unbind
      iio: adc: qcom-spmi-iadc: Fix wakeup source leaks on device unbind
      iio: imu: st_lsm6dsx: Fix wakeup source leaks on device unbind

Lothar Rubusch (1):
      iio: accel: adxl367: fix setting odr for activity time update

Luca Ceresoli (1):
      iio: light: opt3001: fix deadlock due to concurrent flag access

Naman Jain (2):
      uio_hv_generic: Fix sysfs creation path for ring buffer
      Drivers: hv: Make the sysfs node size for the ring buffer dynamic

Silvano Seva (2):
      iio: imu: st_lsm6dsx: fix possible lockup in st_lsm6dsx_read_fifo
      iio: imu: st_lsm6dsx: fix possible lockup in st_lsm6dsx_read_tagged_fifo

Simon Xue (1):
      iio: adc: rockchip: Fix clock initialization sequence

Zhang Lixu (3):
      iio: hid-sensor-prox: Restore lost scale assignments
      iio: hid-sensor-prox: support multi-channel SCALE calculation
      iio: hid-sensor-prox: Fix incorrect OFFSET calculation

 drivers/hv/hyperv_vmbus.h                          |   6 ++
 drivers/hv/vmbus_drv.c                             | 109 ++++++++++++++++++++-
 drivers/iio/accel/adis16201.c                      |   4 +-
 drivers/iio/accel/adxl355_core.c                   |   2 +-
 drivers/iio/accel/adxl367.c                        |  10 +-
 drivers/iio/accel/fxls8962af-core.c                |   7 +-
 drivers/iio/adc/ad7266.c                           |   2 +-
 drivers/iio/adc/ad7380.c                           |  32 ++++--
 drivers/iio/adc/ad7606.c                           |  11 ++-
 drivers/iio/adc/ad7606_spi.c                       |   2 +-
 drivers/iio/adc/ad7768-1.c                         |   2 +-
 drivers/iio/adc/dln2-adc.c                         |   2 +-
 drivers/iio/adc/qcom-spmi-iadc.c                   |   4 +-
 drivers/iio/adc/rockchip_saradc.c                  |  17 ++--
 drivers/iio/chemical/pms7003.c                     |   5 +-
 drivers/iio/chemical/sps30.c                       |   2 +-
 .../iio/common/hid-sensors/hid-sensor-attributes.c |   4 +
 drivers/iio/imu/adis16550.c                        |   2 +-
 drivers/iio/imu/bmi270/bmi270_core.c               |   6 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_ring.c         |   2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c     |   6 ++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c       |   7 +-
 drivers/iio/light/hid-sensor-prox.c                |  22 +++--
 drivers/iio/light/opt3001.c                        |   5 +-
 drivers/iio/pressure/mprls0025pa.h                 |  17 ++--
 drivers/iio/temperature/maxim_thermocouple.c       |   2 +-
 drivers/staging/iio/adc/ad7816.c                   |   2 +-
 drivers/uio/uio_hv_generic.c                       |  39 ++++----
 include/linux/hyperv.h                             |   6 ++
 29 files changed, 241 insertions(+), 96 deletions(-)
