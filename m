Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F35E2E9EDF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947525; cv=none; b=IX1IAU/cVIzK3KSunEBnTFYDUYsXtMGI3fU10KsI9ke/g0ROSJQOPGT4sxM3QGfiYAkb7NAJ9mK70lTFzrMk7puemWd+U5B3SAIr0rLT854irW5JwMYG1lKEs/7bTowGxnAT0npv1x/GDX8JSVfRV6O7Bu6MSLbX/8rpQCZsfus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947525; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XppMwkfiUx2xJ1k2OzLIqSPoyMTfmWthsGfBg1TzLhjr6iNTPjhiFHiyZiUNbJ+g2/sOH0gbky8XqKsfMEdZzuQ0I0tk7nzE89AP+bagx09jAtY/KQLPO6TIiF8CPE6MtGSqvNLU4chF/uZ+23FMRDU2jAWVqb2JG/ePRmlIeGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Q+3XRwVv; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Q+3XRwVv"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a44b0ed780so15341001cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947521; x=1751552321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=Q+3XRwVvifso68eoSPHeTrETilw0BjmE6zi2Qgr/KWOQUOfH9aG8rg/HuSZHJXgHTd
         wyV3MDdwhbSxdKESYk30NvNVq5ESiXh4kuoYkbzInQu/6U2h0DOEAZFAmfYxbS4r1V69
         llhrmTlsZb/ptq1wZF8oMzyz3ddkoAmBNnYoIgTqOlq6qo4rD2mDnRfFBtjdFgtHWwjy
         R4ngaZkuoZ6AxQ/6MNoEuh7cPPDYXY6Mn37gn3iZAJH+3Gu6z/6MFl7zhks5WVswtPKD
         xqYzxbhl6DyP6gscEQvhNrXESret0poR9CJElypMtswv4w6+wwS5lojVE9PjLXlHPL4c
         3xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947521; x=1751552321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=huW9XY0g/QcSCF2aHFBB+WVIgC8N4WS29TfA7W+rH2aszW3ThXrnPDEErdYsF/0I/Z
         0IQ3aU+JTW9QOCyKM4p//wUSKHR7gVUStz6wt6rEAiagwsYS0u7x3DJFNY5uEt+KIutu
         6lPuzbTkdTIz6gXXjsGu+bsGHoCwpHkJVWKQsEow9gtD/2vg+CBbSh15lf4idJZxayPr
         R2rJI4kB8KwdgKvN7NqnOO4AtnxkcNPccDKGOlO9D+voR3de5UK1qD6VCxNgEyECFuxL
         irVfesIGC1MdIi1n1JxOVkvVaom5kKcCDieySvi5DDEHcRLYh2QCawct2DRzCiHQSiPA
         O2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWlgqaTByaoOOJiYPray2271BjG2yMtmTXvs/91R3tMJY8a/c9BL+CgfVI+HkcIyvhFZVyICyc4AFq8E94=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf7jVZezK5oppFX8K7guIjbkio0S1OSK8q/c3G4Cw8K53xgnmr
	DgfCubTL3OgCpn1/hkL72FlmniCxmXuYwFaUhhetOmD8dbpgAx26fhtffrcF9ZvaGsE=
X-Gm-Gg: ASbGncuHnm1JUxKjvAluWIo8qH8ovjGk9XR3qr8t4A9GoKS6DnciXpAWUhLFL4IlbFm
	kb6d35sPCj7+x1dmeOeCkwjEKYVwT5ITtngIfnTe2h+miAifuCjd1FzDYTwC2T3HfnDo1VG48sI
	SuWZr0Lum5SlBatJ2TbyvLR3B4E1RqiNu1Wt9F8/vyINDydGLLoueOa6vCUxCj317OmHSdQ9FaA
	a7CanV/em/aCvzKdgqROKOEHy4/wUKXmf1ZWLo8E4/NVmIZfgWZn/pck8T+YLGrfUTKwFVUj1NY
	b5bsLXtQl93mteo01DdweYFpq1obsIIDt2cZ59dexi9NG6tX9mT+ySImDptCxJCFj2uexJ+n8Fv
	VIShaM4OIap+RzYiHi5d5BWrROeXGbVf33Po=
X-Google-Smtp-Source: AGHT+IHsx3U02C9l97yXNhErNtXWuqZBL2Ji63UbeBAH3WQ3eJzVVCOgX1IG2CL+5mxLNXJrr6vN/A==
X-Received: by 2002:a05:622a:13cb:b0:494:7a16:18e3 with SMTP id d75a77b69052e-4a7c07ca74cmr99997701cf.29.1750947521231;
        Thu, 26 Jun 2025 07:18:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] riscv: dts: spacemit: define fixed regulators
Date: Thu, 26 Jun 2025 09:18:25 -0500
Message-ID: <20250626141827.1140403-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2

