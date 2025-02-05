Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8822622B8A5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752420; cv=none; b=NyRiQgX9rv9DJP9Mmcva5sFT74hNcKGkY8fw4fupDNfDxUPTULF6ounC0FtllslvPTd1Oi+G7JvjQpa1GI5jmFQyAMDZ4HpQXbqCkv9ABidU3+ex/t2sdCsGDAdZSbgun3Ycqj0N9HttYMzzjXWkrPRDe3qoPeLXIeeB2Ju6a1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752420; c=relaxed/simple;
	bh=pLQaAdxiE55i8a7lRZUMji7OS6Fm4Czjf/As0IbIEPo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=gvwum/p2MkCS/8W0Ex2XrGk0ip25k4s4hwETfVJRHu39/dKGALsbEpUvnIgEAkj/167baND3iyYW5mlXUqo+NcCgIoHlc5KUaEcWSCJtTXNtKs7i01ItKwioNq6yiDS8Qpf9Q+9Sg3SQcKzeDMaeoKuu3m+/XLcVAJpVu2tReb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dJyif3h7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yx0ZL8X6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dJyif3h7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yx0ZL8X6"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o2R7g9VOermXgevkmryWioN4jfTkm1LF+JTkLefqnXY=;
	b=dJyif3h7ZUGfj6O88VkiTo3qS39T3tJxHfj2flbl7DUEyBSsSSxq9usradjANXhiJSUsbV
	9i7Z2phE8wtfc5rzBK2RlZ0JJq37+9alq1wa7dO5+Utai6v8HZxNfLFV8tvCG7+20k3pDg
	WVd3roRpowXN2r3WL7FhlB9jbc5q0ze8vYegVzjIn0gcOauaaMjIlj4rz3lmyRglv2REQe
	l6238CBI8gu+CfkYTlB9jw1boroegOf6mcVr4/VEpIIRNcSyDCSEnrslLGkmjwlMSsJTM7
	7wz/vEMDkkbixc7nCqN+UEc0+c5Kf3ojuZ2NpZ30l/qGr47ui8GoeEwiBgXI7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o2R7g9VOermXgevkmryWioN4jfTkm1LF+JTkLefqnXY=;
	b=Yx0ZL8X6MmTNMqkrsJq368MsD3cyIIILc1ZShpzAA42KsEvpCXEhi4id2qVMHmzA+z4wjV
	xKKOUUe+sdGQlKBA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Will Deacon <will@kernel.org>,
	Jon Mason <jdmason@kudzu.us>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rob Clark <robdclark@gmail.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 00/45] Consolidate hrtimer initialization - Part 4
Date: Wed,  5 Feb 2025 11:45:48 +0100
Message-Id: <cover.1738746904.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hrtimers is initialized with hrtimer_init(), and after that the timer's
callback function is setup separately. This separate initialization is
error prone and awkward to use.

hrtimer_setup() combines the initialization and is simpler to use.

Switch to use the new setup function. Most conversions were done with
Coccinelle, see the sematic patch below.

This series is intended to be applied to the tip tree

v1 -> v2 https://lore.kernel.org/lkml/cover.1729865485.git.namcao@linutroni=
x.de
  - rebase onto v6.14-rc1
---
virtual patch
@@ expression timer, clock, mode, func; @@
- hrtimer_init(timer, clock, mode);
  ...
- timer->function =3D func;
+ hrtimer_setup(timer, func, clock, mode);

@@ expression timer, clock, mode, func; @@
- hrtimer_init(&timer, clock, mode);
  ...
- timer.function =3D func;
+ hrtimer_setup(&timer, func, clock, mode);

@@ expression timer, clock, mode, func; @@
- hrtimer_init_on_stack(&timer, clock, mode);
  ...
- timer.function =3D func;
+ hrtimer_setup_on_stack(&timer, func, clock, mode);

@@ expression timer, clock, mode; @@
- hrtimer_init_sleeper_on_stack(timer, clock, mode);
+ hrtimer_setup_sleeper_on_stack(timer, clock, mode);

---
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Jon Mason <jdmason@kudzu.us>
Cc: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Uwe Kleine-K=C3=B6nig" <ukleinek@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
---

 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c         |  4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c           |  4 ++--
 drivers/gpu/drm/i915/gvt/display.c               |  3 +--
 drivers/gpu/drm/i915/gvt/sched_policy.c          |  3 +--
 drivers/gpu/drm/i915/i915_perf.c                 |  5 ++---
 drivers/gpu/drm/i915/i915_pmu.c                  |  3 +--
 drivers/gpu/drm/i915/i915_request.c              |  3 +--
 drivers/gpu/drm/i915/intel_uncore.c              |  3 +--
 drivers/gpu/drm/msm/msm_fence.c                  |  3 +--
 drivers/gpu/drm/msm/msm_io_utils.c               |  3 +--
 drivers/gpu/drm/vkms/vkms_crtc.c                 |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c             |  4 ++--
 drivers/gpu/drm/xe/xe_oa.c                       |  4 ++--
 drivers/hwtracing/stm/heartbeat.c                |  6 ++----
 drivers/i2c/busses/i2c-imx.c                     |  4 ++--
 drivers/iio/adc/ti-tsc2046.c                     |  4 +---
 drivers/iio/trigger/iio-trig-hrtimer.c           |  4 ++--
 drivers/infiniband/hw/hfi1/init.c                |  5 ++---
 drivers/infiniband/sw/rdmavt/qp.c                |  5 ++---
 drivers/input/joystick/walkera0701.c             |  3 +--
 drivers/input/keyboard/gpio_keys.c               | 10 ++++------
 drivers/leds/trigger/ledtrig-pattern.c           |  4 ++--
 drivers/mailbox/mailbox.c                        |  4 +---
 drivers/media/cec/core/cec-pin.c                 |  3 +--
 drivers/media/pci/cx88/cx88-input.c              |  3 +--
 .../media/platform/chips-media/wave5/wave5-vpu.c |  4 ++--
 drivers/media/rc/pwm-ir-tx.c                     |  3 +--
 drivers/misc/vcpu_stall_detector.c               |  3 +--
 drivers/mmc/host/dw_mmc.c                        |  3 +--
 drivers/ntb/test/ntb_pingpong.c                  |  3 +--
 drivers/perf/arm-ccn.c                           |  5 ++---
 drivers/perf/marvell_cn10k_ddr_pmu.c             |  4 ++--
 drivers/perf/thunderx2_pmu.c                     |  5 ++---
 drivers/power/reset/ltc2952-poweroff.c           |  8 ++++----
 drivers/power/supply/ab8500_chargalg.c           |  9 ++++-----
 drivers/powercap/idle_inject.c                   |  3 +--
 drivers/powercap/intel_rapl_common.c             |  3 +--
 drivers/pps/generators/pps_gen_parport.c         |  3 +--
 drivers/pwm/pwm-gpio.c                           |  5 ++---
 drivers/rtc/class.c                              |  3 +--
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c         |  4 +---
 drivers/scsi/lpfc/lpfc_init.c                    |  7 +++----
 drivers/scsi/scsi_debug.c                        |  4 ++--
 drivers/tty/serial/8250/8250_bcm7271.c           |  3 +--
 drivers/tty/serial/8250/8250_port.c              | 10 ++++------
 drivers/tty/serial/amba-pl011.c                  |  9 ++++-----
 drivers/tty/serial/imx.c                         |  8 ++++----
 drivers/tty/serial/sh-sci.c                      |  3 +--
 drivers/tty/serial/xilinx_uartps.c               |  4 ++--
 drivers/usb/chipidea/otg_fsm.c                   |  3 +--
 drivers/usb/dwc2/hcd_queue.c                     |  3 +--
 drivers/usb/fotg210/fotg210-hcd.c                |  3 +--
 drivers/usb/gadget/function/f_ncm.c              |  3 +--
 drivers/usb/gadget/udc/dummy_hcd.c               |  6 ++----
 drivers/usb/host/ehci-hcd.c                      |  3 +--
 drivers/usb/musb/musb_cppi41.c                   |  4 ++--
 drivers/usb/typec/tcpm/tcpm.c                    | 16 ++++++++--------
 drivers/virtio/virtio_mem.c                      |  4 ++--
 sound/core/hrtimer.c                             |  3 +--
 sound/drivers/dummy.c                            |  3 +--
 sound/drivers/pcsp/pcsp.c                        |  3 +--
 sound/sh/sh_dac_audio.c                          |  3 +--
 sound/soc/fsl/imx-pcm-fiq.c                      |  3 +--
 63 files changed, 112 insertions(+), 165 deletions(-)

--=20
2.39.5

