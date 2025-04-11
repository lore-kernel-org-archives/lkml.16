Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9171A3173
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377400; cv=none; b=MkSpwR7Z1n0wr5N6iZA20IJvE2p2NxfWqlnAH4ITRBX0lDk8oKgYi9LcY27Pht4QTIhFr6JmPMy2d9J8p+9UoZ9xXbaHo6cZKwYBI3fywBz+EFHYr6XT314zhpsDeKoCwOlYhIaXncwQI4AaXIfksH6x8xEUduz+s02MKEpMw/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377400; c=relaxed/simple;
	bh=6n3VL3xR2NW+WiuR1BgpROds4O7/ouFUZ1fFJBmsbDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pym0zQQtl4Apk29R3D387Uk9TlT442zYEvovaw1fzMg5cCZsZYa9DOwGz9i3XEGxzCGig8QGSuQb3M16EchVd66tIY5n07YvjUaHzB40Fl/wb46FkhJoPvFIA6xTPMXkJDe+BNF7JGwudmv8rxB/cP10yf3H62cbqMNMEbJvK0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=t4i04Luk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="t4i04Luk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240b4de12bso26451995ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377398; x=1744982198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63RGI1NwLEiYAeH/RFKeArdRDE2NQgX8WQsa8ntLKY4=;
        b=t4i04LukFjjq2+Jq+254ANtrKvTCGKzpLQxQt7IREewSH882ZSOJCRnybPm7A+oVJc
         z8RX2SuHnQddm3FI+tmDM2EnJSRq5QhFqlsqI/QQRBEXjFwg7d2H6kVfkHgodyTbASaN
         Y42s9k/hzpyNcOO4m8xcJAGRcVI6hMlPSOXfu09Cbs+/tDxMmixK/qcYaiAa01HCDY9g
         yduSO0Q5tfHgeZKEO0zSGm/8DA8zQ5Ma7qdY9DoPRCMOX9shwdQDq5dQb4fP5cSRh4k5
         WfG9WRE8qPFlqAFrOlRPNta0Qh58SvtlLY8RuvVuUsNnOn3Jw1lqRXkMaUjbBkdPZ6wZ
         f5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377398; x=1744982198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63RGI1NwLEiYAeH/RFKeArdRDE2NQgX8WQsa8ntLKY4=;
        b=LNZDfH+1IVURpTaxOp12obNBv065I1sXjr66TGHPin48mAemVX4c+xgnT3CxzQXMwi
         aQ+44cFX/J3MkkauENCeO7aTpG79PzQymaf98SvOhWkeOSXTvgQ2jXOBposr/GOd0Dyg
         UdU9AAGNVbHjZN7azaeaxwiIGk3Hv536SLfVGCDGD4ZIJcfoiWA58QWQu4wodsPhkGRy
         vyAXVUdVj8JNXbNlpCBEix5uBQemiULWGXBX7EIpvKrKB/vS3CulanhCVcv/96DibHaO
         AQ5r/Lbf3DM+Jo9z9wQ4R4VokNjXagEHVa01SAciJWYMM2kwJX9kzKfBNMqFVNnPvJij
         z23w==
X-Forwarded-Encrypted: i=1; AJvYcCUyqKH1N5T9p+hS4MGQJPwdwG/T36ZeOFPt6HwBHM5+sn560ucQ0CSbaRNvITT/Xk5sft7Pf7PdGheMrjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAqnds4BD2qxGrh69Ni5843IYrB0jxXB4I1y+EQvLYG02Ub0pk
	sImb7tc6Ssw5oIj325m7BHT+KWFETrVJ1W1gpX4wTCfKqhCCG3b0ptjSmF/IVZs=
X-Gm-Gg: ASbGncu9xRJYrq0PmMSQvSXHSFEQU3Iyva2TaZlTKSXTfuerX0H/vCuY5QaWpv2JloL
	SQYZNNUxp+ocfa9wQvplHAOfivzDQPJzCLTvRM6KPw40ie0ecbcwuApaRf2kDlYgmQS8aWBHggs
	vgYAeaCTxHtrlDOU5H8TAJx6jCOV/vTnmOdn4E+Tbigo+cV9w9KQ7+INYNPBjwpJXkfjj49n1uY
	qvJNoPHOiHp40GNMAgCTVKBdn/KC4EnPNOrQGz8MddwuvyMkl6mPM0720waX0WJ6o4Kg1HVvrG8
	WrCU0WCD5PWuYQVtRX/apzqNzWnQjx8=
X-Google-Smtp-Source: AGHT+IGdBpii9FqwXTM5hJBzhslBNKfg5Cs2FGnvGr9Q17Wy0FzzwX5fnWry21A6oGkbvSxeOYahLg==
X-Received: by 2002:a17:902:db0d:b0:223:6180:1bf7 with SMTP id d9443c01a7336-22bea4ffb4cmr33239005ad.42.1744377398297;
        Fri, 11 Apr 2025 06:16:38 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:16:37 -0700 (PDT)
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
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 8/9] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Fri, 11 Apr 2025 21:14:22 +0800
Message-ID: <20250411131423.3802611-9-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
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

