Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE92F7CEE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492239; cv=none; b=VV8Cu1seFS7pdhvGac59otN6Shcu3eDtu8WWuw1DP9Z5EsUcXjtyhbjL6yXvDmGu1UFjJa/EUvelqhITfx/QYC6w+DT8envGN4ImllHzrJuyJWINl55ZonTSYW7sV43QJ/INdGUHpnf5bIs4k8pVbIW2qASi9qCJ2uw/xZD5yHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492239; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUIB3xVLzvw13l9dx32ZE2fwQ2EKjY3t8LO83qobCrzSJixJbIgFHwzHtFALJdprteDR01/w1e3C6xiD/KPhPw+mEQ1iUzxRpI4nu41pECAC75Ud8onCTBnck10JAWXHZzuFyYwBfFdDF8NT8wuPzH4wq2WWAB0df3g9ZyYmx8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FcOuPtH7; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FcOuPtH7"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso82483986d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 14:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492235; x=1752097035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=FcOuPtH79xxKK+ahU0IgIjk6Bzh208ghRpWs1IUCv0qPA3Gb2FmuyIyWcFYe9O45Cc
         /rJQA+zRE5jIcp5CrZlW3IoK+ICfaZCMWKm6QSOfWU1+EFrs/w7K84EP+6R8KEsAMSsF
         /pSNEKytB7NO4snwxvaaz7niw9jCnPhTYxtT8fIlKBWcDawmI3M9UBMDAJD0bnZmfWpj
         tD2E4vuLWG8WznkYPS8RP2QQzAhLxeD64Rz+aXDHe2Bvb1czHatqkVg3wLRu0mufd5GP
         /xK05tECyE76vVUHRgUT0uD/+PtWXdAfOenKTU+CfUF3EJgQrGYyEQkU9eS0mCH35F5r
         H+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492235; x=1752097035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=wRqMaa/8H5/ZI9M9NQC86Y9f0rlvW0gMpir4kVJrlxdgH1hSmKazVHJuG4OSOI1OJk
         H+wUnwHvOij3EC07PTG/Cyu05LVOmM9O9gPhr4qAXRoByk6Kx6Vf2+yH6k2d9u7gzDU5
         xPbIerivEchG4/jWHCs9SpRK1J0Me9kDci8YYxnlZ+H8ebaIRobtSzJ0VDm+vca+DDeB
         Hwcnf/r0GYuPgmz3Xftr90hx+ldLOREMWrNvpXl1Os2SdkIbpMCuDUjQnIg8bGTnPYTO
         x8lmlyixDAy7L98AkIboZgcdMDg1M1z5fcJAaGJrw9mvFnrl/A3VrW5eKRTG6HMaA99a
         AEuw==
X-Forwarded-Encrypted: i=1; AJvYcCUkU1n3fEJbezIyYDupLTPfAlRwcQNfmv/fT2knS33gX1ZsGhemfJIkKt+tFQd61YLvEZ3qWUAf6r+0Tqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYZile4bvWxqYmAtYT47fGPODIhohXhc0189y5gCmGnytqiY3
	8SsqWlYglCwvD/RGWB+rFYj6FoOu8hjNozB59UGPD29sTSm7J2Wg1pt7FoWV5RDgqo8=
X-Gm-Gg: ASbGnctnu6FSVWARvh8+yKXS2VNyHxxWnj58BxOWWI+JGRp5MxPIkU/7GGRcNLLMuo2
	3STBeqU4x1Z3gfX0NbRZpqaxqUGKQTR/nKq/BWH4cJ9rf1QW3YNiec/kgqwU2fI/rpcMKRjgLIX
	lHFCDiHhpQppQtNWP8+E0RDXP8HA97yTlrHbkCcY79WxyW4fPF/ufQE0z00iWqMfUdWUKqlfabf
	X5sXQ0Pmm+xCYYwbM98FhQqc4Aq0nrvF2QhwkxFOsai9MsIIR0qTY7v/u4/KAiGVUV3gBYfl22n
	zEvA8dkC6Z2hLLOdLf1jIXswNBU6ewitapTmrxOug29SEbVLbmqFz6S8Cm8KtRdR6zRAejvoh9R
	lzpLwDlvLaapERfhvanNHuJppHclAVcplQ+U=
X-Google-Smtp-Source: AGHT+IHmuE1Hb+fdqWuuRSoeZlf3aoCIg4RErjvlQJxeD9KbYWIor15tIIiabP6Dq/CTktn4FVDAFA==
X-Received: by 2002:a05:6214:c28:b0:6fb:4b54:ebb with SMTP id 6a1803df08f44-702bcbf5777mr14378456d6.14.1751492234758;
        Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:14 -0700 (PDT)
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
Subject: [PATCH v7 7/8] riscv: dts: spacemit: define fixed regulators
Date: Wed,  2 Jul 2025 16:36:56 -0500
Message-ID: <20250702213658.545163-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
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

