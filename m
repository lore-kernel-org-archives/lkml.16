Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2BF27F724
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540799; cv=none; b=XRAH1s0WCYNIp9F6sulj1n5gklhuUBNPqQnq0T2ucTBhPX64FxPMY0KXlzD7RnTl+eIWWasp/+9vu/ZENg86lG0oDRbSpbvH/Re6U8Z0IwyUx7Kq/AIle+6QEZbh8g/cBssaTnEeyFadxlBYHT42jKCePMH8M3LN2guIMLIEtMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540799; c=relaxed/simple;
	bh=dvnpBTc5+V4/wKRdMg2GHV3TaYrI7wpbz7l2TiXkoro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joOS+J4FI2q2CcTr9gpUlIUBX5jkIqXiXx+jEXAzHH9ImrrRywyAR0h+/BiNXS4vx3oTqnBWXNhyN1CmpYN3jq9MBM2QeOVkzEdcQQiOncLcFA0/5WVpsfJVnPQ7uM5ip8HBZ6Tt1MDsF86yXRRovXfSKakEt3MEvfIpF5PV+OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KO8PBTyP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KO8PBTyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746540796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UFcgBeXDokvr+kUt+Nx4wd/ULZnjMDwH1N2JLsWAOOw=;
	b=KO8PBTyPZxY9cAOtCPYyFjwSiN/wNOgbWV+YemoYvrx88icew8wprVcvnBJIYwCUEl1SSc
	E49KQswV4JFBup6D7oD7RaIzXQTe+vpASykTR47tmJ+BS7eJerGl/5Y75bxHDVORMXwHQD
	boZbtMLX8l5Ig1ci8aKZ9MHxXYt68Ak=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-8eRdfuFUO0uVso_0NJo97g-1; Tue, 06 May 2025 10:13:14 -0400
X-MC-Unique: 8eRdfuFUO0uVso_0NJo97g-1
X-Mimecast-MFC-AGG-ID: 8eRdfuFUO0uVso_0NJo97g_1746540794
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac6ef2d1b7dso539338666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540793; x=1747145593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFcgBeXDokvr+kUt+Nx4wd/ULZnjMDwH1N2JLsWAOOw=;
        b=bHqtka5MGj4Qx6YYvYeH1HHX1j04vuS8pnc6hdLvqFOPAg8mojL9GDsEfMzZDr+Kri
         cvFw4XcjZv4Eu2vtLfaBBaseYbZrsFtMVtK/idgD+eJE3jV8n+PJhtXKC0eHqe/1mvEg
         jgZWjQsbq06o38eqgw4swqiD+4usNcmv3E37xxI9zSM77cozu3iwvYhAHumCdXxan7DF
         qF4xkerZjpEcFWbJ2qu/whfdmdA79oVKaOm6poVNQpz9xAYUlRIXXnce/mcQK4aFMKSz
         Je3hXfEBiSlD1wCgQ0hOaArLThGXGtwZTEHCamqJFnMQxRBhm7jEWexqv7PT97cUS09t
         GAwA==
X-Forwarded-Encrypted: i=1; AJvYcCX8c6lZLrDaUqRXjBoxOPLD4iUFeM7kqD9286/qsguoN4znnMcdu9vmEU+0Kjh8/tFEH11MAfRjmvrFYS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHQkebncvEyMFqBBtixU01W2hijGYskv1AcwjBSLRNWIovGMlt
	z40LVbuDc7NzLqLBK5Ib3kxOeG1FvsARA8PuIyPOCuaeqvh0zExPyCYvrV6YHvNG+DPXxNRY+/W
	c+2IKAqenHIA5KSnUPISTogcF04cBaZ8BuscWliD/J8zF60MJFw0QDwgWyASONQ==
X-Gm-Gg: ASbGncsJaG3RgqRYjmDutGAUc9VXpIMi1YiqIBrrA5cx+wXYFfjWtoikP/IGSFg3e5I
	EsF5ErL2a8/7ahu9UfRn0cvU1Ct0Q28A6aJv/0v74WHEgbeIcm7z5PbKcSpCarqRLiOviKPiscN
	m+nVc355wzrFrblXbbQWLTW5ZtFh1i2Z2r22E+Tbj/c62Dqy/o7JOB0Nu48HmIOFk5cuu2svSSb
	qJfpAsToVXNKwKdPMb2h06BU+A7cfWRKEMKfl3lwoqHgKCyy7567gKkRpDlHsRd/0TwXzmZgjm3
	uPUYZlZbOBKD024L
X-Received: by 2002:a17:907:a08e:b0:ace:9d4e:d0cd with SMTP id a640c23a62f3a-ad1a48bd2c0mr1016933066b.7.1746540793555;
        Tue, 06 May 2025 07:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBtjlS6sVWj/jhXomSr6feRAM5taE6rOBhOmzWM1geyTp2Xsw9XEuNk4QndQH7TAg8XB5sEA==
X-Received: by 2002:a17:907:a08e:b0:ace:9d4e:d0cd with SMTP id a640c23a62f3a-ad1a48bd2c0mr1016929066b.7.1746540793005;
        Tue, 06 May 2025 07:13:13 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.145.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914d031sm710777166b.20.2025.05.06.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 07:13:12 -0700 (PDT)
Date: Tue, 6 May 2025 16:13:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: lee@kernel.org, herbert@gondor.apana.org.au, davem@davemloft.net, 
	peterhuewe@gmx.de, jarkko@kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-crypto@vger.kernel.org, jgg@ziepe.ca, 
	linux-integrity@vger.kernel.org, pmenzel@molgen.mpg.de, Yinggang Gu <guyinggang@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v9 4/5] tpm: Add a driver for Loongson TPM device
Message-ID: <2nuadbg5awe6gvagxg7t5ewvxsbmiq4qrcrycvnrmt2etzq2ke@6oyzavctwrma>
References: <20250506031947.11130-1-zhaoqunqin@loongson.cn>
 <20250506031947.11130-5-zhaoqunqin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250506031947.11130-5-zhaoqunqin@loongson.cn>

On Tue, May 06, 2025 at 11:19:46AM +0800, Qunqin Zhao wrote:
>Loongson Security Engine supports random number generation, hash,
>symmetric encryption and asymmetric encryption. Based on these
>encryption functions, TPM2 have been implemented in the Loongson
>Security Engine firmware. This driver is responsible for copying data
>into the memory visible to the firmware and receiving data from the
>firmware.
>
>Co-developed-by: Yinggang Gu <guyinggang@loongson.cn>
>Signed-off-by: Yinggang Gu <guyinggang@loongson.cn>
>Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
>Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
>Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>---
>v9: "tpm_loongson_driver" --> "tpm_loongson"
>    "depends on CRYPTO_DEV_LOONGSON_SE" --> "depends on MFD_LOONGSON_SE"
>
>v8: In the send callback, it will wait until the TPM2 command is
>    completed. So do not need to wait in the recv callback.
>    Removed Jarkko's tag cause there are some changes in v8
>
>v7: Moved Kconfig entry between TCG_IBMVTPM and TCG_XEN.
>    Added Jarkko's tag(a little change, should be fine).
>
>v6: Replace all "ls6000se" with "loongson"
>    Prefix all with tpm_loongson instead of tpm_lsse.
>    Removed Jarkko's tag cause there are some changes in v6
>
>v5: None
>v4: Prefix all with tpm_lsse instead of tpm.
>    Removed MODULE_AUTHOR fields.
>
>v3: Added reminder about Loongson security engine to git log.
>
> drivers/char/tpm/Kconfig        |  9 ++++
> drivers/char/tpm/Makefile       |  1 +
> drivers/char/tpm/tpm_loongson.c | 78 +++++++++++++++++++++++++++++++++
> 3 files changed, 88 insertions(+)
> create mode 100644 drivers/char/tpm/tpm_loongson.c
>
>diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
>index fe4f3a609..13f0682c6 100644
>--- a/drivers/char/tpm/Kconfig
>+++ b/drivers/char/tpm/Kconfig
>@@ -189,6 +189,15 @@ config TCG_IBMVTPM
> 	  will be accessible from within Linux.  To compile this driver
> 	  as a module, choose M here; the module will be called tpm_ibmvtpm.
>
>+config TCG_LOONGSON
>+	tristate "Loongson TPM Interface"
>+	depends on MFD_LOONGSON_SE
>+	help
>+	  If you want to make Loongson TPM support available, say Yes and
>+	  it will be accessible from within Linux. To compile this
>+	  driver as a module, choose M here; the module will be called
>+	  tpm_loongson.
>+
> config TCG_XEN
> 	tristate "XEN TPM Interface"
> 	depends on TCG_TPM && XEN
>diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
>index 2b004df8c..cb534b235 100644
>--- a/drivers/char/tpm/Makefile
>+++ b/drivers/char/tpm/Makefile
>@@ -45,3 +45,4 @@ obj-$(CONFIG_TCG_CRB) += tpm_crb.o
> obj-$(CONFIG_TCG_ARM_CRB_FFA) += tpm_crb_ffa.o
> obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
> obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
>+obj-$(CONFIG_TCG_LOONGSON) += tpm_loongson.o
>diff --git a/drivers/char/tpm/tpm_loongson.c b/drivers/char/tpm/tpm_loongson.c
>new file mode 100644
>index 000000000..cbbd9c22a
>--- /dev/null
>+++ b/drivers/char/tpm/tpm_loongson.c
>@@ -0,0 +1,78 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/* Copyright (c) 2025 Loongson Technology Corporation Limited. */
>+
>+#include <linux/device.h>
>+#include <linux/mfd/loongson-se.h>
>+#include <linux/platform_device.h>
>+#include <linux/wait.h>
>+
>+#include "tpm.h"
>+
>+struct tpm_loongson_cmd {
>+	u32 cmd_id;
>+	u32 data_off;
>+	u32 data_len;
>+	u32 pad[5];
>+};
>+
>+static int tpm_loongson_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>+{
>+	struct loongson_se_engine *tpm_engine = dev_get_drvdata(&chip->dev);
>+	struct tpm_loongson_cmd *cmd_ret = tpm_engine->command_ret;
>+
>+	memcpy(buf, tpm_engine->data_buffer, cmd_ret->data_len);

Should we limit the memcpy to `count`?

I mean, can happen that `count` is less than `cmd_ret->data_len`?

Thanks,
Stefano

>+
>+	return cmd_ret->data_len;
>+}
>+
>+static int tpm_loongson_send(struct tpm_chip *chip, u8 *buf, size_t count)
>+{
>+	struct loongson_se_engine *tpm_engine = dev_get_drvdata(&chip->dev);
>+	struct tpm_loongson_cmd *cmd = tpm_engine->command;
>+
>+	cmd->data_len = count;
>+	memcpy(tpm_engine->data_buffer, buf, count);
>+
>+	return loongson_se_send_engine_cmd(tpm_engine);
>+}
>+
>+static const struct tpm_class_ops tpm_loongson_ops = {
>+	.flags = TPM_OPS_AUTO_STARTUP,
>+	.recv = tpm_loongson_recv,
>+	.send = tpm_loongson_send,
>+};
>+
>+static int tpm_loongson_probe(struct platform_device *pdev)
>+{
>+	struct loongson_se_engine *tpm_engine;
>+	struct device *dev = &pdev->dev;
>+	struct tpm_loongson_cmd *cmd;
>+	struct tpm_chip *chip;
>+
>+	tpm_engine = loongson_se_init_engine(dev->parent, SE_ENGINE_TPM);
>+	if (!tpm_engine)
>+		return -ENODEV;
>+	cmd = tpm_engine->command;
>+	cmd->cmd_id = SE_CMD_TPM;
>+	cmd->data_off = tpm_engine->buffer_off;
>+
>+	chip = tpmm_chip_alloc(dev, &tpm_loongson_ops);
>+	if (IS_ERR(chip))
>+		return PTR_ERR(chip);
>+	chip->flags = TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_IRQ;
>+	dev_set_drvdata(&chip->dev, tpm_engine);
>+
>+	return tpm_chip_register(chip);
>+}
>+
>+static struct platform_driver tpm_loongson = {
>+	.probe   = tpm_loongson_probe,
>+	.driver  = {
>+		.name  = "loongson-tpm",
>+	},
>+};
>+module_platform_driver(tpm_loongson);
>+
>+MODULE_ALIAS("platform:loongson-tpm");
>+MODULE_LICENSE("GPL");
>+MODULE_DESCRIPTION("Loongson TPM driver");
>-- 
>2.45.2
>
>

