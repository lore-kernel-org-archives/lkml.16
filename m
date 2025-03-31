Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8047E1E2823
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417570; cv=none; b=Ppv7FiCtyADPHTHf369gVv3Q+iRNu/JsU5/07MnC2Zu4wB+Hp84UtEFTMl4fUpMJ746jg8NWjNvS98dCtxQXCmQa65a7BWZtD/TUZHVLnqXqPJaPfzSUNaIdJagU1Ivlz8uv6sBlx44CCmFRTrDvHuJgtB2nN0CawGc/uSujY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417570; c=relaxed/simple;
	bh=VSwSVqTTPnbOpmlHq9MOfH3OWqH+XBMIsW4BP4w9E5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sfEta+Rh1WgimIbtaqnvkjArsx6Cny8aiwjwtIY+3lT5qLcVwQdzVLEerCeWoK70X5ozU7DrNG9VbQb1dhbZjxGCRuglIzByzba47gcRUBATwCo9pOuaYdhqWGVnVGLJwADWmGFxKbEZ/Z5BKnDLE4HWtXXMXLT5Dnt8w31QQUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GZObhcvX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZObhcvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743417567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4fxR3joWDLb15zwEwdHZI3rgw4qmSYJti26bFJQ+VcA=;
	b=GZObhcvXyfF7iA8YydQsQvJbOc3FP9u7DpQdwron7cXoc0RbR34FoF17jT2exALcjMJZ0s
	hxeaTcSPxzmKqXDElD9m4e27WdPNuuMmv0CH3G8C06TnN4qqa1DNBIFn2qRo66VpMgfYu3
	BobWCpL1S9pNbnMIJpF30FAnBgDrwoo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-a6EVyczlOWeZeDLLVrW6SA-1; Mon, 31 Mar 2025 06:39:25 -0400
X-MC-Unique: a6EVyczlOWeZeDLLVrW6SA-1
X-Mimecast-MFC-AGG-ID: a6EVyczlOWeZeDLLVrW6SA_1743417564
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ea256f039so3125485e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417563; x=1744022363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fxR3joWDLb15zwEwdHZI3rgw4qmSYJti26bFJQ+VcA=;
        b=Z7NPVjhI/S2EALaUW/k8Cc9WIo6gV41c/Jb1dm7kG6ylsRZDh/DDt/kMV7zbrU9qpW
         KPXDWfEULvwh7XIF1iowhloB6lyMfhocFOe6V489UWf5kw89MkyaiyAj39Kzy3edfhZq
         sinl8bNVP3q8HpNx93u18YyheClWVh1qHx5PtlqjYHTfRcHCnhFwhZtsPuWbLjduX4D7
         cSlim13KLheZ3Cy7LaNI0713fmHzWUu+947kdubjXl5K2A7nEVy3tHTw6F6J5iRsW6YX
         OP1DiivRanaBY0kH3FDMC+AYEIBI4rAfnwnMgLsjLrzJY9gymKqOCAX/tWL73XC9LVz2
         as6A==
X-Gm-Message-State: AOJu0Yyzfljfpy0gCgVvkzjlr8SzMr5GtO/rlIB+dGkHPmSQQtFFNqnS
	FNXs6ncrlQiQH78nm7MznXO1vfQAKism1XF68q95YzOZxOkK+Vu5fTSabu0Xht6r5q0uYQd+eoW
	G5lk949GcYJeIPaBblOawR2+Z/HyS1eqWX1J5oCLk1xLwdaxyyH1PjV28cO9D70q57kQ7pSPL
X-Gm-Gg: ASbGncuRnJ+SCRR4t7oeEMJv0+bxbJijU7mdOjvVUMpomZYGy6gQEUblRciJMdpUZSh
	TCou8lOtWFhZSEIXRamQhLFsbBBIMs9nhsm6/upchthNqoGA29rmHyFm+2iZWMJ8ecaFcOkuwjs
	2Z59YMiFRXffuZ3ah3GkL1aUPdufFMg4HFeL/D2tEWGDlpoLM0WRZ50teVdIBmzdcXlmgx2p0UN
	wjuZ0xiafbaX6I2cFbx9CRTrShbEiuDKvdVngTAFuI2Pq4h2WTly5nH7ZLkXpMYeyst+CnPY2Wi
	wlps3fFAgwFj3fBKHulrOJuTLJeLDWqyWUJ4LmN99Aa9+6zOaOQ5czPJthdAQZdf0w==
X-Received: by 2002:a05:600c:1d83:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-43db62bf772mr81331255e9.29.1743417563544;
        Mon, 31 Mar 2025 03:39:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSEY2IAvMlONrWW/ecIZqpU4KW8seEtaraLsrYv8QTUi3aO8abB8sFiMZjGmzhLkOrU2UPdg==
X-Received: by 2002:a05:600c:1d83:b0:43c:f64c:447f with SMTP id 5b1f17b1804b1-43db62bf772mr81330855e9.29.1743417563067;
        Mon, 31 Mar 2025 03:39:23 -0700 (PDT)
Received: from stex1.redhat.com (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66363fsm11273542f8f.36.2025.03.31.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:39:22 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	linux-coco@lists.linux.dev,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <jroedel@suse.de>,
	x86@kernel.org,
	Dionna Glaze <dionnaglaze@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 4/4] x86/sev: register tpm-svsm platform device
Date: Mon, 31 Mar 2025 12:38:57 +0200
Message-ID: <20250331103900.92701-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331103900.92701-1-sgarzare@redhat.com>
References: <20250331103900.92701-1-sgarzare@redhat.com>
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

Register the device unconditionally. The support check (e.g. SVSM, cmd)
is in snp_svsm_vtpm_probe(), keeping all logic in one place.
This function is called during the driver's probe along with other
setup tasks like memory allocation.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
- explained better why we register it anyway in the commit message
---
 arch/x86/coco/sev/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index efb43c9d3d30..acbd9bc526b1 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2689,6 +2689,11 @@ static struct platform_device sev_guest_device = {
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
@@ -2697,6 +2702,9 @@ static int __init snp_init_platform_device(void)
 	if (platform_device_register(&sev_guest_device))
 		return -ENODEV;
 
+	if (platform_device_register(&tpm_svsm_device))
+		return -ENODEV;
+
 	pr_info("SNP guest platform device initialized.\n");
 	return 0;
 }
-- 
2.49.0

