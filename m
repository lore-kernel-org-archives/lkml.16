Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33F6297A40
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916731; cv=none; b=DgsfGTmsWhORmxXvWFZkvK/fC+HN6BgY76RtdCen8guCaxyXGM+oPSj+XEG6cByQEgUFzhDkPXZuOI3X1JyxMfeUevxkUf8gNsuTR7IC0MxDdlJJDABUZ6h3/GpqN2hjYEDRo4PR5UANoEHLMO0DQ/FfOQ3qJgo9tPtgbZugi6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916731; c=relaxed/simple;
	bh=+TPnSjs8Rsq4uRl5xcYrXceVeJccwtQIFJM7/CmqG6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9ZkAb/5zPW4LpiRqTwl3xt9G3cyAunvh1IQYUzMTwZ37MztUKWt+/B8EGMe9zYi6daZyF2XhPqwDFVgP6sYrqZVuhiPm00kjiBXA36iTKX9QcafYxbVcpdswzCDbvbL5uV+ArbAdwdYBUaV1wrtvV6r8giaWgcP70A0P0LF7Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=U6UvPs1p; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="U6UvPs1p"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so5213637a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916728; x=1746521528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSBQlgtaQud3VdsTPycKFsE/56jYgj1sJoxgbag7Muo=;
        b=U6UvPs1paTyar70Oik57kCSUIKIxlb+rpkLmOPF98ua6rPQ2edpzu6DiGhK9jonCWb
         wOyzrJ1FZTgb/oxDZMRyzGECzG7rdryt5V00ztOwW6617Dtoz6pReEqGhk2tibMXUHZj
         RDaoM2PsfMf+xoITQItuDRvNnTbjHFGFMUGtBxYPeejwYjtJrJLPGutmiPiVHbQ6Chuf
         7ycUhj/D09sI9Yep/wYYZFXiVCl0T0wIB7I6sANbm7xdetNB7woH+o4VPx6R5ncLFWcL
         3MXnWhVaL59NxczQKiRqh5JGnQDgasjmMr/9i0FS/K+QtmVul4or3C15jJoIjtzzgb4k
         DqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916728; x=1746521528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSBQlgtaQud3VdsTPycKFsE/56jYgj1sJoxgbag7Muo=;
        b=kXRG0EI8Ks/94W6MLK9t5+5eja6Wtq6PJ3XbURMKcjqjwUebxKae7UgB+kJGprsuPc
         QV1If1Di5EF1jkVJdw1pecdD6L7QnfFHvMCheULLQLdfiZ+oG2I2M3NFmQwm4b2xyZ/P
         WE6tot/gqCZYd3cvWWFVK0UrauE0ai9SkAxoIBPk9ER/X/JYFBtkBxzHuKr0Yb1tdyYU
         D339Tr50QCoOh1t1I/Z0m+EKnDiGTLOhJxXGMJkPjn2XYkkJ+KMn7klS9Pqqggvo5BwO
         P0TSb24LkJbsBw1Ql3XHShe3+nTMg3TbnWokCG5hU5N1LpvF2hfDIFmNIGn5IvNwhWi6
         eeMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKLVlPtm0weq6SQiGxga/XDgHgPGbPi1017fgdzgEogTc6Qfsy3adIsCR4MYhM33DoOkYoprSJMfrPS00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGkn5txTbl4ct2hNSUgBgEhSFLRoWdIA57XZI8dTuhoOYMeP4
	4HKl6fmfoSn916CzfKEAYVGKNjSGCRdeMGBc01I+mxnt2AtRSl1M3r/d5Fp19sk=
X-Gm-Gg: ASbGncsXVPpgC20X1RBy4jxO1Mvi8EwviPS+Z6s88l9RFaL7vvOhYWGf055KOGmpdxX
	M+H9/mMcaMXvPIdP7Uvw+4/nFo6/vD4xBt/b/nJUJlUwAI8/6vHxYhLZJXSujtEG2894KbHiiEz
	6Y8N9iGV0y7Ng+NKRsL8jw/BSxekcy7Za5pPu19y9BbbeUjHUxJSvOL2WnLfCOgkoWJeot8sKnN
	b36CdvpG+qWkk9A2wtntPKIALjvJQsvg4hrCHCw8glzEEjxg5zmH29Y5hf6gPDPFWU+IycsySj7
	2iDCdzGqeJOBIQdqb/g6XGJqMKWEaqHPKGwZi2/eMWjJ3kK9l9sfb5FqK5ENprtZFcpp9t2MZUo
	CqivtsbY2hV8wX9E=
X-Google-Smtp-Source: AGHT+IFKhORMMaDYdgpl/9rwoGwyfPRj2XbuzQCabPPPwxwDnPG2aYuvtb08xMFG1iEWZeP3qzi2Vw==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:6e71:e55 with SMTP id adf61e73a8af0-2095907d1bamr3201920637.6.1745916728038;
        Tue, 29 Apr 2025 01:52:08 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:52:07 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 5/6] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Tue, 29 Apr 2025 16:50:47 +0800
Message-ID: <20250429085048.1310409-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 SoC uses PWM_PXA driver.

Update the Kconfig file for the PWM_PXA driver to allow
the SpacemiT K1 SoC to use it.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change
v2: No change

 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4731d5b90d7e..6731669e724e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -493,7 +493,7 @@ config PWM_PCA9685
 
 config PWM_PXA
 	tristate "PXA PWM support"
-	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
+	depends on ARCH_PXA || ARCH_MMP || ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  Generic PWM framework driver for PXA.
-- 
2.43.0

