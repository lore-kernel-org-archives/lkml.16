Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C2A26AF6
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437766; cv=none; b=hW+73Rb4jppZ4haXuS/0TVrrYceuz1oMcvwbAm27jtS7ofP4KVFDzP/57o4rKR3Nzfu20LvaO/5+v6hvQCDpFNBjOj1q4ZaG2nz0ommmtXVdVEL2R+8kLPIYqoX4OBNSMjJbl+60JJvkjEDOk9MK3qhFRjgkI/ChGmMNGzlgTTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437766; c=relaxed/simple;
	bh=zUI6fTqYH/DnZU3D3wD7gOpmhPH+9GO/HBAjmPmp2eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSNCOw2u8ceoQSEe1+7XQ4vRdL7hczUhxF6FEIbMgFV1Jf4eQvO8ctknr54rGgZRARgeGPHfvlYIY7VPjc++S8lINoOWKWHzS3Esbci1kgWtwot4Q6ZlYPEXh0SGakX4YnAhUsEuEEwre18tJ+SeTkTDTyzg47jdlBJw19gMnNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCZppGQK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCZppGQK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2260c91576aso73720895ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743437764; x=1744042564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32bd+4WU1DygbAHbysKUy0FZhXcvnuwbKsO8ps8kv08=;
        b=mCZppGQKQoPgR+ooIpAofPL9zv/Z7VnWFE6pta8Ie1skxbMIjB9XeKHlALqLci3WCU
         4/xakw+BB53XyR4XLzS6ACXBWGAdQ00biKjGiu9cVAnRdRVi7thw2wM3+EMIphiwG0Oe
         Lmt/t1kPxOuoZ8bwQ+iHRIZbEkCfHKVWZpyOBXr5hkZ4SpuBQ9r+tuniOYI70wc+rEXW
         UQnenJc9Nnx5BTNar1NrbSUsq0sVPKVHAg92CXP4EPGQwOJBLjU4NN3VKO8vhYiUwur/
         z36iY90gPJ18NPe/OGsGV4FglLtPgZU8X97XRaKWyC8AGdgaR/+SU4r11lkbM6u7wDdc
         +O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437764; x=1744042564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32bd+4WU1DygbAHbysKUy0FZhXcvnuwbKsO8ps8kv08=;
        b=udx8FeqUMu4bSQKzqQmyyxrWCPTiFZF2tmVTKJ7NB7X4vlHs7bi4e9FJGvZc8ntWEI
         hp0e1bMix47C7zNa/iX2pamwvXCuJ79a5E1I3NDSYyfdC4uxuWl0gei6tK/CgR7qkXbo
         /JXB6LCgEeOokIlKn5t8jKTn65WOdNgCflgRbwGkN+2WJMQexa6XQIFFSHlExvowvrlY
         5bvXS4h0iG4rWKswbD6sCqqj3c5B3VuQxw/onzU2oNQCecCeCh135Ucir2lvnRvbaHx2
         Km98V6u9K8uNh0z+FjN+z8rSK0KuhYo9OS1csITf2BKiwEDlZajouq6DGuXMVnN/dTEL
         vINQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd6LNzQVlF0W8iurmRY6ukZFT9/1iDlCVw55twVXCYtEznovJVapRXUVdZNsGyY6jzKKFAavwvPSf0Buc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+0Ev8+pLgjMPpsp1z7C09x8fz/wzpKAfkmHOzM0UrIl6pMZQ
	4Jo48cVceIVAGi911IUh/XsKpqZAgm08X+VBx6efG3h89PVhNvCV
X-Gm-Gg: ASbGncsz4aV4fbQgbCBvDvizLZnwlRtqsHzmnq6/Rb3jkF9L8EF3QDZ5b5+33+NULg/
	qQAX4GKNpw5vmV6oo7VY0nophTG2us//TRIAiLtSUZF0j6in4Z9jtpHJWdb3malz+YQD6xZ21+p
	s6MVCgTbJJq1I1iHWR5wT9hgmI1jMmAGfc4rt62zMHnLQ+rXmV4ZvViyGhq0guiBbxq1fYFvrvm
	75KDIffmoh/k460nadrVWqO4gomElCOd/RcZjkoLRFQF/63tu7MbsO1M8X2HkE/jdvCtViE/03V
	nVSM6vm1vlesLslmz82cLs9DxAVK8mkw3ww4jmDKd6Xff50A3hU=
X-Google-Smtp-Source: AGHT+IFq34IJqsQCFZdeoT9wP/Jnw+8SIAHV25r6mxakLM5VltpGIBIQxBHcz6Kp92UN6c5Ie0iZKg==
X-Received: by 2002:a17:902:ec85:b0:223:54e5:bf4b with SMTP id d9443c01a7336-2292f9736a3mr153317055ad.25.1743437763996;
        Mon, 31 Mar 2025 09:16:03 -0700 (PDT)
Received: from localhost ([147.11.105.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cec2fsm70872195ad.117.2025.03.31.09.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:16:03 -0700 (PDT)
From: Liwei Song <liwei.song.lsong@gmail.com>
To: MiquelRaynal <miquel.raynal@bootlin.com>,
	RichardWeinberger <richard@nod.at>,
	VigneshRaghavendra <vigneshr@ti.com>,
	TudorAmbarus <tudor.ambarus@linaro.org>,
	PratyushYadav <pratyush@kernel.org>,
	MichaelWalle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liwei.song.lsong@gmail.com
Subject: [PATCH v2] mtd: core: add sync between read/write and unbind device
Date: Tue,  1 Apr 2025 00:15:20 +0800
Message-ID: <20250331161542.3040005-1-liwei.song.lsong@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325133954.3699535-1-liwei.song.lsong@gmail.com>
References: <20250325133954.3699535-1-liwei.song.lsong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When unbind mtd device or qspi controller with a high frequency
reading to /dev/mtd0 device, there will be Calltrace as below:

$ while true; do cat /dev/mtd0 >/dev/null; done &
$ echo ff8d2000.spi  > /sys/bus/platform/drivers/cadence-qspi/unbind

Internal error: synchronous external abort: 0000000096000210 [#1] PREEMPT SMP
Modules linked in:
CPU: 3 UID: 0 PID: 466 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+ #1
Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
pc : cqspi_indirect_read_execute.isra.0+0x188/0x330
lr : cqspi_indirect_read_execute.isra.0+0x21c/0x330
Call trace:
 cqspi_indirect_read_execute.isra.0+0x188/0x330 (P)
 cqspi_exec_mem_op+0x8bc/0xe40
 spi_mem_exec_op+0x3e0/0x478
 spi_mem_no_dirmap_read+0xa8/0xc8
 spi_mem_dirmap_read+0xdc/0x150
 spi_nor_read_data+0x120/0x198
 spi_nor_read+0xf0/0x280
 mtd_read_oob_std+0x80/0x98
 mtd_read_oob+0x9c/0x168
 mtd_read+0x6c/0xd8
 mtdchar_read+0xdc/0x288
 vfs_read+0xc8/0x2f8
 ksys_read+0x70/0x110
 __arm64_sys_read+0x24/0x38
 invoke_syscall+0x5c/0x130
 el0_svc_common.constprop.0+0x48/0xf8
 do_el0_svc+0x28/0x40
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x144/0x168
 el0t_64_sync+0x198/0x1a0
Code: 927e7442 aa1a03e0 8b020342 d503201f (b9400321)
---[ end trace 0000000000000000 ]---

Or:
$ while true; do cat /dev/mtd0 >/dev/null; done &
$ echo spi0.0 > /sys/class/mtd/mtd0/device/driver/unbind

Unable to handle kernel paging request at virtual address 00000000000012e8
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 2 UID: 0 PID: 459 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+ #1
Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : spi_mem_exec_op+0x3e8/0x478
lr : spi_mem_exec_op+0x3e0/0x478
Call trace:
 spi_mem_exec_op+0x3e8/0x478 (P)
 spi_mem_no_dirmap_read+0xa8/0xc8
 spi_mem_dirmap_read+0xdc/0x150
 spi_nor_read_data+0x120/0x198
 spi_nor_read+0xf0/0x280
 mtd_read_oob_std+0x80/0x98
 mtd_read_oob+0x9c/0x168
 mtd_read+0x6c/0xd8
 mtdchar_read+0xdc/0x288
 vfs_read+0xc8/0x2f8
 ksys_read+0x70/0x110
 __arm64_sys_read+0x24/0x38
 invoke_syscall+0x5c/0x130
 el0_svc_common.constprop.0+0x48/0xf8
 do_el0_svc+0x28/0x40
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x144/0x168
 el0t_64_sync+0x198/0x1a0
Code: f9400842 d63f0040 2a0003f4 f94002a1 (f9417437)
---[ end trace 0000000000000000 ]---

when unbind is running, the memory allocated to qspi controller and
mtd device is freed during unbinding, but open/close and reading device
are still running, if the reading process get read lock and start
excuting, there will be above illegal memory access. This issue also
can be repruduced on many other platforms like ls1046 and nxpimx8 which
have qspi flash.

In this patch, register a spi bus notifier which will be called before
unbind process freeing device memory, add a new member mtd_event_remove
to block mtd open/read, then waiting for the running task to be finished,
after that, memory is safe to be free.

Signed-off-by: Liwei Song <liwei.song.lsong@gmail.com>
---

Hi Maintainer,

This is an improved patch compared with the original one:
(https://patchwork.ozlabs.org/project/linux-mtd/patch/20250325133954.3699535-1-liwei.song.lsong@gmail.com/),
This v2 patch move notifier to spi-nor to avoid crash other types of flash.
now this patch only aim at fixing nor-flash "bind/unbind while reading" calltrace,
but for other types of flash like nand also have this issue.

Thanks,
Liwei.

---
 drivers/mtd/mtdcore.c       |  3 +++
 drivers/mtd/spi-nor/core.c  | 46 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h     |  1 +
 include/linux/mtd/spi-nor.h |  1 +
 4 files changed, 51 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..a78044ee603e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1243,6 +1243,9 @@ int __get_mtd_device(struct mtd_info *mtd)
 	struct mtd_info *master = mtd_get_master(mtd);
 	int err;
 
+	if (master->mtd_event_remove)
+		return -ENODEV;
+
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
 		if (err)
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 19eb98bd6821..ae879d445046 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -16,6 +16,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
@@ -44,6 +45,9 @@
 #define SPI_NOR_SRST_SLEEP_MIN 200
 #define SPI_NOR_SRST_SLEEP_MAX 400
 
+static int spi_nor_remove_notifier_call(struct notifier_block *nb,
+					unsigned long event, void *data);
+
 /**
  * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
  *			   extension type.
@@ -1191,6 +1195,9 @@ static int spi_nor_prep(struct spi_nor *nor)
 	if (nor->controller_ops && nor->controller_ops->prepare)
 		ret = nor->controller_ops->prepare(nor);
 
+	if (nor->mtd.mtd_event_remove)
+		return -ENODEV;
+
 	return ret;
 }
 
@@ -3649,6 +3656,11 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	if (ret)
 		return ret;
 
+	if (!nor->spi_nor_remove_nb.notifier_call) {
+		nor->spi_nor_remove_nb.notifier_call = spi_nor_remove_notifier_call;
+		bus_register_notifier(&spi_bus_type, &nor->spi_nor_remove_nb);
+	}
+
 	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
 				   data ? data->nr_parts : 0);
 }
@@ -3659,6 +3671,9 @@ static int spi_nor_remove(struct spi_mem *spimem)
 
 	spi_nor_restore(nor);
 
+	bus_unregister_notifier(&spi_bus_type, &nor->spi_nor_remove_nb);
+	memset(&nor->spi_nor_remove_nb, 0, sizeof(nor->spi_nor_remove_nb));
+
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&nor->mtd);
 }
@@ -3737,6 +3752,37 @@ static const struct of_device_id spi_nor_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, spi_nor_of_table);
 
+static int spi_nor_remove_notifier_call(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct device *dev = data;
+	struct spi_device *spi;
+	struct spi_mem *mem;
+	struct spi_nor *nor;
+
+	if (!of_match_device(spi_nor_of_table, dev))
+		return 0;
+
+	switch (event) {
+	case BUS_NOTIFY_DEL_DEVICE:
+	case BUS_NOTIFY_UNBIND_DRIVER:
+		spi = to_spi_device(dev);
+		mem = spi_get_drvdata(spi);
+		if (!mem)
+			return NOTIFY_DONE;
+		nor = spi_mem_get_drvdata(mem);
+
+		mutex_lock(&nor->lock);
+		nor->mtd.mtd_event_remove = true;
+		mutex_unlock(&nor->lock);
+		msleep(300);
+
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 /*
  * REVISIT: many of these chips have deep power-down modes, which
  * should clearly be entered on suspend() to minimize power use.
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..134bfa6fcf76 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -290,6 +290,7 @@ struct mtd_info {
 	/* Kernel-only stuff starts here. */
 	const char *name;
 	int index;
+	bool mtd_event_remove;
 
 	/* OOB layout description */
 	const struct mtd_ooblayout_ops *ooblayout;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..d176af8fe2f2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -420,6 +420,7 @@ struct spi_nor {
 	} dirmap;
 
 	void *priv;
+	struct notifier_block spi_nor_remove_nb;
 };
 
 static inline void spi_nor_set_flash_node(struct spi_nor *nor,
-- 
2.40.0

