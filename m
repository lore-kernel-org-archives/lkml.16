Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA4C28CF55
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293106; cv=none; b=ddPD0LoiQ56oePoa1FONuOPXrO+sySTSfSZEOnKUyxkSasBMUyRHGt/zIuz4/yQze0QIO8xGUKDDrz+VpjVbL1MK2GYmtUaVi0lRUsMjF5PWXRxL2igRdI2Qxe8GRH6aQ1CrvTbX0RkMRULq1MCRYT8ONqjvLceCnoOpjSctbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293106; c=relaxed/simple;
	bh=jjdOFFgqlMZcJK0ENY0EeRcZvGY/PqG+Cg3KwCJxajM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LT+SkUwTtLi/m9pRKX42rJqvpZGDXOD0JP9ClqPOI9azNjTcU1FNJg3Oh8A6iy4Ur284RVMYsm7PUp6EmyBRIQNmUzjB5dIxWZmrkGasY7gCIPf6afTpCvoBFPwDDioHXyzRYM1Xl9zYYfI5C0Vat1VWMmS/bVSnCSnFFnMb+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gfi3aRmW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gfi3aRmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744293103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hirGwPCk5S8fr8wcRk+QWxpexKbLzBx8zDafwqq8PVw=;
	b=Gfi3aRmWaU2PwbOF4asO/LZwJwQ3yoD6Ai2dh0rwLCpC+xBsFMcsrHHneAS2kG2GI11RIi
	+k+65vkXvROTYRENdNzbAisILkI4egOfSl2KC8J+xB4aQaBzOHcBGitgS/URgz3zdPBYaE
	BSzqUr+dC1W+DOFfBRbxwEslYuqfO1M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-rHoxc2yKPPS_ZHS0TyL-Tg-1; Thu, 10 Apr 2025 09:51:42 -0400
X-MC-Unique: rHoxc2yKPPS_ZHS0TyL-Tg-1
X-Mimecast-MFC-AGG-ID: rHoxc2yKPPS_ZHS0TyL-Tg_1744293101
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so7716985e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293101; x=1744897901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hirGwPCk5S8fr8wcRk+QWxpexKbLzBx8zDafwqq8PVw=;
        b=NImr3SfV+OMH78I/COSPXtmCZCvzQ5r1+LIzVWgZJmGcZP3sCCYbwVm9f2gvkodWg3
         TqISqZh7okYn1Xn1ZffzNs24S/qyaTaqjcc3s7oEJ/4EjQkVG3KS2TILepatvrDsyE7u
         C8hRp0FW9A8GKzehw7xJDYwbwjQg7JLm9fNtskGjCqjg3O2H0fg97O5h30En4Jt8uW4y
         dIzlu6Vterj+e8GIkd9k5v+KkZzA6Od+8OgGkVj/6XwfDk/FSAAamwyKXsNAxDDb0KUt
         d9y7M/+ynyV6micu1WtBkGwza+u24rV5BOFeVg50LLJrduMb5xdNLREBFg9p+p/U0F5F
         EMFA==
X-Forwarded-Encrypted: i=1; AJvYcCWK2lNIH1aE6zQng6p5uhpsXyAi9KvoWy/JVXkg90EP75H35OT6XjsS2ED3FyrZeqoGjHjLi2D42LAd758=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg2NWGXk8X1eY7hsyYLh/gciMayZ6uZLKclA+cbG1Vc7UHvkUD
	XAq7rI2DdAoUoPvdjAEvfeYxuN2P1uxreiVOennOXxVFKNpLF7kLhYycQSbCWGA4BUvjIT+cdWq
	QOssklA7bjLtNblXxaE4qoydfsVSONjUz7ybXdbxE/gqCrW8GrfqRF78lIMhvCA==
X-Gm-Gg: ASbGncsby6Wb8rYUi2frvurSMAKsHi1XaLEwrdWoO/7Haobpj8/+1ytN+N8nFtraniL
	38rDXwebgL4ZwdM55AvZBP2zhY1sRdkxR8NI0ad6kL/be7CyGD9UEhcVE9WsxtGeqL+k3tdZaLG
	QoD4nKlF2NYSvBkj/91hyCn/QaS9/wBtuVGj/6NjEX46tk5W+JgTIKq7tjI9KpI30Xduz/JsUE7
	fg1HIl+hxEE8wwD0mGQPKLe+WeTu9ARfSMpPP4bmZ/7MZsetpwVb4yHNuioSvLeWX2m1T4mic8D
	BLhrzQFbrk3qCSPsaIu7+Fa+LaElJwoGAza9I8KZq/RkyegC12uNdEKJAhwqCQ==
X-Received: by 2002:a05:600c:1e21:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43f2fdcece5mr23351965e9.5.1744293101428;
        Thu, 10 Apr 2025 06:51:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW/+UygbSs3rimVhsZR25l1U5u5O39Yy7PeRlqUDpdrrg1Z1uyMNvSAu+c2o2wo8JQdf6sGQ==
X-Received: by 2002:a05:600c:1e21:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43f2fdcece5mr23351565e9.5.1744293100851;
        Thu, 10 Apr 2025 06:51:40 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdfbesm4768782f8f.88.2025.04.10.06.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:51:40 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Borislav Petkov <bp@alien8.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	linux-kernel@vger.kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	linux-integrity@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	x86@kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-coco@lists.linux.dev,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v7 4/4] x86/sev: register tpm-svsm platform device
Date: Thu, 10 Apr 2025 15:51:16 +0200
Message-ID: <20250410135118.133240-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410135118.133240-1-sgarzare@redhat.com>
References: <20250410135118.133240-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

SNP platform can provide a vTPM device emulated by SVSM.

The "tpm-svsm" device can be handled by the platform driver added
by the previous commit in drivers/char/tpm/tpm_svsm.c

Register the platform device only when SVSM is available and it
supports vTPM commands as checked by snp_svsm_vtpm_probe().

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v7:
- added Jarkko's R-b
- call snp_svsm_vtpm_probe() before registering the device [Borislav]
- s/device/devices in pr_info [Tom]
- updated commit description
v6:
- added Tom's R-b
v4:
- explained better why we register it anyway in the commit message
---
 arch/x86/coco/sev/core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 3bc5b47e7304..54272c9777cf 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2688,6 +2688,11 @@ static struct platform_device sev_guest_device = {
 	.id		= -1,
 };
 
+static struct platform_device tpm_svsm_device = {
+	.name		= "tpm-svsm",
+	.id		= -1,
+};
+
 static int __init snp_init_platform_device(void)
 {
 	if (!cc_platform_has(CC_ATTR_GUEST_SEV_SNP))
@@ -2696,7 +2701,11 @@ static int __init snp_init_platform_device(void)
 	if (platform_device_register(&sev_guest_device))
 		return -ENODEV;
 
-	pr_info("SNP guest platform device initialized.\n");
+	if (snp_svsm_vtpm_probe() &&
+	    platform_device_register(&tpm_svsm_device))
+		return -ENODEV;
+
+	pr_info("SNP guest platform devices initialized.\n");
 	return 0;
 }
 device_initcall(snp_init_platform_device);
-- 
2.49.0

