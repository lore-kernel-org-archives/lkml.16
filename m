Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582296ADD
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849956; cv=none; b=FXjJXgAOJf8F3Hu/6Dqcs3vIreH4jvqoMlXvs0bCGfiTVADqHlyymNE0qPITOC02SRKYQma5CKw5wDclh38RyXa1tkwUjNo2rUC0TowLmPOiToTSybG0QChm5NhTlqBJ/QLVnB2Yc4H2I59x9JdDI6Wi18XiEOTUiYh0A0yWNeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849956; c=relaxed/simple;
	bh=tpbGa+wb1ROibOMJ754QCVyWSnLkiLu3ogNqXjrQrSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8hPcdg9bj1Tggd8nQ39bL94g79J9Ow/wwZstCL5KwEB1E+/PsyKF0x+mfVPaQzvBrSfn3V3C/k6yl7VgHDLqCLMD6Yipf7HsPB3jX+nkudtbmTA0s/EdJxU09ZGubgH+Dd+aXTNJ3pZou6xBhQVMmDhH/nHMynNgSoKsK7dFJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll4VNW+1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll4VNW+1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so34905545e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 00:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748849952; x=1749454752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0KRsqCQdQxGvJUA1Gb3gOwJAWm93IjHatNhbLpImD7I=;
        b=Ll4VNW+1Ngepsnl/d8olQGqHnHWgL631ZuzVV1RpPrcmh9j7C3JaWuBKXnQn4sW2nR
         pN/Qqfh2W10fp6lSfGGTaQvalCTOBVOkdfMqsTLVhYtdDp9i0/kXzZ3/zpkDxF2H0lAM
         MXzH2nnrFw/o7wig2OqqARmwG5UYuO7Pa0frgZ/dbjuZBoF3i7hOpcNW6UWGmfbqMJap
         7NrPUr8X8eThl3kGlubB500Jx737AW6GoW3AdiCIlbAFYhQK//v/HNMBTpjvXp++Uru1
         6QTucjHmBicfwQHNvITrHyQvdTAqkGuIl2fHUTlYpYX8513LUrT3WfgGOtUBSE2i0ti8
         9xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849952; x=1749454752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KRsqCQdQxGvJUA1Gb3gOwJAWm93IjHatNhbLpImD7I=;
        b=I+6eVDSgx38BS5LBQUCyfFCYWjZnZEv46Fw5zu3wDHJ1VqvSYITJaRg6mAktkmrmuu
         XYd6AapTLqKMEOCbdgoJNOnXEagAnUU2wYL8FJhIg7rQBAwnZPR/AaQDSyKrkhwFMNGy
         2Lbb+6EjAWWoWpmeoo4EpHWGEbkn3llVnJoMUszUtfJOl7kUkmUx6kZVxtmZMOMeR3Pu
         l1FZo0oSahSdeyFIlPtAmC/S40UKQ69ig/hse6v1MCyvoJzaw50HvdHamBakJ4ih9WL/
         O+ZoZ2+Brv1AMWnfnBsbq2iWZttfEVy65QknvgWtQL+QQGor/wQsS81owkU2ItoOBIlN
         nsrw==
X-Forwarded-Encrypted: i=1; AJvYcCW8S24V+pcj1uKxX4jmMdnjgBAIDLjdUFQrGArMC/XKPXfXmwRmhF+A9xCJdLril86B7lus4d3LmOdRg7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg8xxnkIKR+mFlFXP55dIgrNm1kvvlrisg3S25gwM9oKfsZ7Ti
	wHLFm/oGP1joyYUVELCMTedLveOgbD57ibQULkfEPH+KXnIjYDKiQTF7
X-Gm-Gg: ASbGncviNOSk6zVQ9KtFEh572WrBNxNIWbVD7U5U9GFhtmzi7Z9JVunYEtPJZsMwBaw
	Lp9B0jeMGUlwp8PNYulBLrEwwMSfOQNfgVxSsxt7acpwQ3XIx0V6+HpOutQgiM3+n/lYyhFcFjd
	k0eWAjXK3YK+NNRnS5Fr4gixnTufChblsEo6AXaeEaYqvPo2r53kX8hgQkyPlbgBBS1XFbfr1dr
	lLJG7CGE4SlAu46pdLS4PACiLYIf1JDHj7SYKniKkeBiuPXSr4uoGxWXW3ZDq4cCQn/krrTuHre
	CwWe+u6d/9TKVeN7xazej4MRAsdQzaESAjJxtQ+DWNwhtSm9TIDUnlZyrqV4g8CtnzIIQf54670
	AiA==
X-Google-Smtp-Source: AGHT+IE8lDHcTjU/MxOEjrpe1DoCim0M2qp/z/Bda98u1Z+TCcARAjAz1Rb4YJjFowK3otT/SnYu7g==
X-Received: by 2002:a05:600c:5251:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-451221a223emr48903255e9.25.1748849952241;
        Mon, 02 Jun 2025 00:39:12 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f188sm112487005e9.3.2025.06.02.00.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:39:11 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	bp@alien8.de,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com
Cc: pawan.kumar.gupta@linux.intel.com,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	hpa@zytor.com,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] kernel/cpu/bugs: log ltf1 mitigation status
Date: Mon,  2 Jun 2025 07:37:06 +0000
Message-ID: <20250602073732.734-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Log the L1TF mitigation like other mitigatioons. This one is is the
only one that doesn't get logged.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 arch/x86/kernel/cpu/bugs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 7f94e6a5497d..38cb2a1b2849 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2803,6 +2803,7 @@ static void __init l1tf_apply_mitigation(void)
 		return;
 	}
 
+	pr_info("Mitigation: PTE inversion\n");
 	setup_force_cpu_cap(X86_FEATURE_L1TF_PTEINV);
 }
 
-- 
2.49.0

