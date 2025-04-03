Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E777E242936
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675011; cv=none; b=sOXuvGgQFnSQFbjRowobAK29fL+LnCnulGgYtQ7PgFXWQ9KgvVNeWUts8LwsabSniRlwAph674r2fXmELhW8ebg0if9JHhYAVvJ9u/jKlbaSWJTFrwlJgi0P7YP52tiqb0d7w/jXEVmZrvxEhfFHPQ2TxeSBzOOLuhwVyqK4LPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675011; c=relaxed/simple;
	bh=95AbKM5/KwL2zVTjvGMvU2UbnZhLAbo6VoxnM/Vc07I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+uI18ZJ9cMbsyCsCqiXO30ScgmWbI7Sf1etW8fUiOwZZ73wKuZHl2eCdjrORVGtJQ4PCvA+AoEqLGGg2yAWTjdx51IdcoPrmQrOsG0Zdz51x0KieUFVmBPHP7qClOBvxBqWrmrhGfqHZPyW9wmtLHdTsubKSfTi+3bg4c3ZcPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dGWnilcY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGWnilcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743675008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qB/CtSEwcy7NwseWKn2u4Fr2QuPsDAEv+lGIosiLsww=;
	b=dGWnilcY6e6Q4wLc/9BfKyPmm6wst1sylrT4GvYEA6MyXmAnJ35j8a2WNY37Knh+ek+Z+E
	FWTiIg9iMsZ1sDi5pEAqtFepOt/iZuVmVR0CANiLVHzSZ3GJK4fpKQLsJGETNGsP6ol9gr
	Yii1gaGBApxkI6yQMc00gEBiuJAbL/Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-27zLWChLPsKUttsxsdtkzQ-1; Thu, 03 Apr 2025 06:10:07 -0400
X-MC-Unique: 27zLWChLPsKUttsxsdtkzQ-1
X-Mimecast-MFC-AGG-ID: 27zLWChLPsKUttsxsdtkzQ_1743675006
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso567549f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 03:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675006; x=1744279806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB/CtSEwcy7NwseWKn2u4Fr2QuPsDAEv+lGIosiLsww=;
        b=PCxcm0xjzzbgZoBm2QE1B9R2i/E1ABhFir37WmxwAwE0zUdHhxkiYY1SFXt7sl59CK
         75rQYa3bMRB6oWPqaVQTsI+XG/3XacycwZM5SHfW3nKV+o5myXA23tNb24vtAP31mjau
         R26yJOtrhiOqyjHhxgxNhuLG+X2tcQXVFCfkxYX7q9W4e2YopzrhJmKi7la9gH9qp6da
         eWZGM1KeYSirCS6+8LBSneeoMyyPciRLOCrFBk8A+Kckv2g1usaTP8NIfjRff+ZSrNUg
         Z+NTV1IKDvXEBbJCjhqq9KIJidPifxG/M2TKCmgtvoaNDiMxVCwcuoErw4gwcqtrtY15
         AC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLNo/noDlnzsetvGeE5bWWrImYb1GdVbCOXSs6gsL7sWrcOrT/0YXzrzgzQrJAEygVOvZ9GccQ2WSUFBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5pWO8cWWMCjjAVsg5PI/1aAfurq0OLJj3SE5BCGCkyIar2556
	O+MmiuF8FAtmX2x6iGp+mRzXKSv7J7Xgd+hMxr8cyks0RRhezah1GG2S6Sbhf3Y+XHcH8Quqbqe
	q2DKsg8YYqLYLqZHYwrUJZf67rXPWvc2JDDPY8bcc0hDDsoybVrBVwjOofRKZGw==
X-Gm-Gg: ASbGnctnR3x/tLXxs97gM7vnskJXGhssbVPhplY7Bd219ODzJ3/Tmbz9olj6MVBssFI
	1VU4UAA3THG+ERk39tlg/6JHC09EA7mTFhf2MDb/BaZdaBGZ708/5OssgfdyIAWBb2FEEiHK4+m
	iPiiE85Q1MGtvyEdOaRBSvoxkWwH4cIrTXtVdeXqQN645VD8ZjID0YGmjqHn/VFJHSfCgfiy8wN
	ibABsn8PxzPzeY4gTFBtgqQlyFAaEt4+Pu8DfF0wA//3QnfNubLghLdVMSqsLSDRowmMeCTm16A
	H4jn0w0pn3h/DegGotExvyW2+DU0H81w0gjZhHb8eZN56wTA1cDDS9twRTtp
X-Received: by 2002:a05:6000:144d:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39c297e3f7amr4552172f8f.43.1743675006270;
        Thu, 03 Apr 2025 03:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECepLnUWcbOzJjNcNGIqxQwtp6LRHNvjNkwMgWLkILIn8YR8+ktWlYOnrFo0WoqQvUci03UA==
X-Received: by 2002:a05:6000:144d:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39c297e3f7amr4552121f8f.43.1743675005738;
        Thu, 03 Apr 2025 03:10:05 -0700 (PDT)
Received: from stex1.redhat.com (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36691b3sm13702755e9.34.2025.04.03.03.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:10:04 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-coco@lists.linux.dev,
	linux-integrity@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Joerg Roedel <jroedel@suse.de>,
	Dionna Glaze <dionnaglaze@google.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-kernel@vger.kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
Date: Thu,  3 Apr 2025 12:09:42 +0200
Message-ID: <20250403100943.120738-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403100943.120738-1-sgarzare@redhat.com>
References: <20250403100943.120738-1-sgarzare@redhat.com>
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

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v6:
- added Tom's R-b
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

