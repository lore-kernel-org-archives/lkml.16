Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F0222D4C6;
	Thu, 15 May 2025 19:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747337983; cv=none; b=cU7+19dqi2rqjYjAtjRTC9K66Zz878hMi4Ce8wX2WbpjdgJUwEfe2h4TD1cMP2tG5Z27TtueAaCNCKhpov/fer/Ng4YtGMOI7VdIjqWFbjJ3aHPa+IEo8xwa5DUvm54GLtp0mVcKGZ5rLj/jBE+fPH8ErCPczvWujIcsyBOe0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747337983; c=relaxed/simple;
	bh=Xr/PvjPEMLBqNumA5DIM03p83Uegeyy87amuQoEaORo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bkb5OGQiOrRjFmEdQpitN6r4ziLgeJ7ez/0eE/kHvg8f2MuvpjvYQwJ241OJtAoHeAVutP7x8P7aKKraxWcFDmQPT/Wj+ZzmY3+C4fz2pv3GoySciSwVgrzo7LNs9Gqhjbw+8uICB+nxFIt/Vo0zlopxCNIfhlhshAFV3HMEVic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmbWAgFm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmbWAgFm"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54d6f93316dso1474443e87.2;
        Thu, 15 May 2025 12:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337980; x=1747942780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PAWbah0yZaLPKt8bN/YzgjbQx6cpILKxwG41q/VxDM=;
        b=ZmbWAgFm02lbvY912Ju3lciMmle3GDCutQiNkFnrBd1y1jcj6KG+2bojlYL3Q6bJL2
         keIIb94y7NX26EHGjOFWOjKu5/MZLkkncKFc7eGDPP3mqSCG7dnb0UlxMgV1vYUuDBD8
         Bx1vB5VDiiNYaPxjXHRZyRVRBpABi/X+i4WYP+JMY6j4RRxVIymid5uB1tDiM7XhXVn/
         4aUMk/jwZGIwtgBsHzOyZ6kphgCI/UoVHVJ9OtOVHi4LQUWzO/MeolGeZGV1iCSExSer
         q+7U8sUzvRBMHeBicN/writK0V0cE6OVeA84MMcTeSJBV4d7K2X0j+QjMt7gx2Hbexrc
         NyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337980; x=1747942780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PAWbah0yZaLPKt8bN/YzgjbQx6cpILKxwG41q/VxDM=;
        b=dY+fHM6EqJIYnFJhQvqu6p5xt7LK4v3Tz8WgZeTvkyufeA25Qc9l4ptVfKG6NpbHRV
         ta66ucCEiB4XI2qGhzToDKlvhrQz7zqFGCCmNQKkTDs8ssx6rs+tMUOZVfOhz7F1olKq
         ZVbg8q+if4DWvEFERd3wTw527mAb9c6gf6aCvvpduNqVH4bI5MfOmUslIsJyEIc4jJSw
         SJAXxC7DtlSp0ChyPAUZi6fyaCqQpfexDoBCorx77ZNs5TqzTxez+nejdKPfDKIqg3Nr
         IhiOOe11I9yEGObKvZsN86ZEAzzTSgDuuCEI0iDmb1meW62qK7yOJqllVrN+3eh4QVHY
         96Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWSyqyKTNwi1knaOaRW8vXpNEWZ1Rc250anOO8EXleUpnKLyStSEl7OOOuUFJijX/h4/y3BdbJQbG05O+Hp@vger.kernel.org, AJvYcCWqFv4Ph/GiHVgfV9v8qL91IA7UY/rrJ+i8RG7IxBR/XIEa7acyXSqZkXZajtNnmc9RDBrUQ2P8Vaxs@vger.kernel.org
X-Gm-Message-State: AOJu0YyigEixb7MdroRqw1TQqqXeXmMEvEQKiQ/W5oPji4asNkmV/U3I
	G34hIp6nNeeJJLKxhU19sFgqne7aAYZBVKy3hBljTBhAL202KXvgQcqx
X-Gm-Gg: ASbGncsVYjHObdX4uz2o6DwI12+gQKuYpqUsZGiaD506ecK7LJsXo3xPfZtSQ6h0HSI
	20TwAV7GaHR5BmG41K7ojmJJJdaJrLg2TzEkyQxuI6DrnCzGtDG+jmL0InBD04nWG1sHcfrPGef
	et+EWWfEmp/FiI0XAEowEetD4s3fGX+eRqZLBjB0xnBGbcNyUHhgE1Uwbe4jV+vfUvo25R4iZ4X
	lSFml8xy6ZC81cnqTdmqeBAP/0sH//c0aO7ZkwUaCeKYIefGoJqRI323swAlLcw7Tah7+pDjGpG
	MfEl9rEnlQiHNIpVEyUUBsQ1WjmpP+QbXA1fe3ZWT3vt68Sed5IbXai4KigW6VLy
X-Google-Smtp-Source: AGHT+IHW9iddu7UpubfDwo/rYmu1JB5MK+HjOhwFmRxU0JW/4FjJ5yJH6hjkqzFW9SjhkNhU1uMdpQ==
X-Received: by 2002:ac2:4c4a:0:b0:54a:cc04:e77e with SMTP id 2adb3069b0e04-550e7232549mr244972e87.44.1747337980004;
        Thu, 15 May 2025 12:39:40 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:39 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:40 +0300
Subject: [PATCH v2 1/5] ARM: dts: vt8500: Add node address and reg in CPU
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-1-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=2587;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=Xr/PvjPEMLBqNumA5DIM03p83Uegeyy87amuQoEaORo=;
 b=2Zj3AzCaYGXeurXVhu3IJqiWl0FbrlZy/9nVqwELkUvoCVo5Vaz62VEojoXvz/Jf7wpSyHU0f
 M+EadJAE+YLDoO55hAklrRt0i6knCbSsPkTFhuLeAFNRLfe+S/2A6n7
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Adjust CPU nodes according to current guidelines, including address
and reg. Set #address-cells accordingly.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index d1dd37220d41becece5d24fbb19aa71b01723e35..3cd86941db90c08ae4fbd3e0b1b079623bce28a9 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "via,vt8500";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 2b1819f0c5412648a83cd3eeb495f68d2e4100ef..34e55b8c2c8b20fe2598ccc9699551dc9c8e69a6 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8505";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 042eec78c085d19fc97d7f0f9721399c0716ff74..b42c77f99c006af31d4be8bbb985f536244edf8c 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8650";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 56342aa1d993a43e7ee766f93151c6d456496262..68e325163061b11e52027fbf291953a170f39469 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8750";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm1176jzf";
+			reg = <0x0>;
 		};
 	};
 

-- 
2.49.0

