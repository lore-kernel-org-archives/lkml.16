Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437E725634;
	Thu,  3 Jul 2025 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503151; cv=none; b=MMBThITtN3L+t0LJ4hnuRSqJXyEy301IkvqnidadMikMPSBJbv0Xeixa6dAp98kZy7MSkWb94GFe1yDn7o8sGpxsZvyg9bJzsPguxfN66Uf5srz1E/a3hSIn1aU03ccqCTbnBbKO+1uEprSmpjv2YalS3fFZuo8L/6K/hcSYUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503151; c=relaxed/simple;
	bh=1mGmSZ6Q4EQzklWyd+gvDml6HLnkHJsU6FL1hGLgGuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTOpA0i9iUC3+548xzW7zZRg3S97sEkwffKJ4Z7h+U0Bo+e9O2lmj3P8mjfAhykO330XKaBwjSPKexwB3N3jx1GUDMGXi0kJ/ers+Nl+So2DLMihb8h56nZ5Fu1saoNNm0uk+GqvkHV70EAdWgs7EqZ8HIijPF/yaxmIPTp1w70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXbOagx+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXbOagx+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74b54af901bso854419b3a.2;
        Wed, 02 Jul 2025 17:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503149; x=1752107949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp6SVLQWv+yq/FCUnVZXe5xSnWGW/xX2hl0tN5GjdNg=;
        b=MXbOagx+5B4OBiQLi1VNEqJDy1HH5SEe3aAhRXnyoon90mKBc0QHwEgSa1KMfsNFJ+
         1dnMVqmOfcK/F6R1mR0VHiIJfXHe8goz5e6RccUVj0CTwf0mwT/xJhsvDM9LlkH67ZFC
         Ob4cZVzVVOOY9zKshIT4Yus1PysFjXUAkjKWQop408uNf3SudiUvsugXYAmQs/DaLAlt
         63xkdvixnTAO12gQc1Hm3flb7aby2e4KYgfJGFp0ABw3CAw7toUE1eA5mSljuxiTB1ef
         +r2P1Ofybk+6ePyQz4wc6d9P1B05hxAaP2T0/kAQ/Gg2NfGnIQXDL/dLAc8Gk8YXaHpG
         dg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503149; x=1752107949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp6SVLQWv+yq/FCUnVZXe5xSnWGW/xX2hl0tN5GjdNg=;
        b=RNsYeKvPeJ5Er0XoaMhH94pWxaM/JNwdwKTvOL0RQTfa05sGjkeAxT54qYbmXhT5Cb
         iGHASky1P1c65zX81Jvyr1sQfnRc+IxS+mfkGMphCIL+FrC3jH5COpxEu/lH3hksdry+
         uaoUcVJn7E5C+L4vaqtbzeFboccl6zanxmC33dfuKj8SGyrce4CJWyVh42LwAUzGC16C
         ipwNoZaH4vvpQ2Zn7E6h3c/GosX0rrKxuKCtgd+iw/8GAwBlKh7vWIseddW98Axwr4hp
         h2ra6piUaMIdEy5xQbjb/qCMx0bdSiltl9So9ctgUIZfNQ01elFsLyoCE69tQWrWJ9TO
         5sMg==
X-Forwarded-Encrypted: i=1; AJvYcCV4/LsQD9jZyngAc+txA65kIc6V2mdUL/g+BnUPbqjydL59ybWSqArZyUFyhjwj1ghyc8uCvKO7RDfDI7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2YUYLzb+YA6ycUl0Ep54paZQpSO/JvHWwKwueg3/nXH3VgGAC
	BYf2HGfm0JFZ87IhW32Ckjz5YaGxal+wDk+4gQ5Gd4CjoIRigLv3jTCj
X-Gm-Gg: ASbGncsn6S3P86TsT2Ewwow6dHHJNkL0vpvnd3JjjAO1iWS65/tELwEmHhvKdmX5xMa
	0l0wP3UFd4FIdi5qa5aY4Sz6CXm6xNT/89wPDWWwK5YTxjq4TVy3Q0vO+wFPnK5yh07dsFm8k82
	HnsdYw6DAtXJigKWbG3azawn0q523JWwO4xFuNrijtYXdRqu8IkqNqbfdgR+fzRWNlg6pMF/MZF
	nzeVZBuGaKa8bPtKo7BBMEsFX8zCx98lPhue/Fp7IGziupgnuxMbmaWlVES3hGqTbo1FUQ2RbQP
	Y02Qi06o71Ho/q/G/3sFGNfeHST/avxoOYZffSDKIS8SLmVaH9su2DtRPxQOyobaprjDqT2h
X-Google-Smtp-Source: AGHT+IE6EjPWTP12xSibuAaTHAAp7XhOTvQoc548Zur0R4Hz0WB245X9+rq3l6A2vL6aDv6YxuH4PQ==
X-Received: by 2002:a05:6a21:9988:b0:21a:de8e:5cc3 with SMTP id adf61e73a8af0-222d7dcf2e0mr8369054637.4.1751503149400;
        Wed, 02 Jul 2025 17:39:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af541e8fasm15585369b3a.67.2025.07.02.17.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:39:09 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] riscv: dts: sophgo: sg2044: add pmu configuration
Date: Thu,  3 Jul 2025 08:38:43 +0800
Message-ID: <20250703003844.84617-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add PMU configuration for the cpu of sg2044, which is the V2
version of C920.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 91 +++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 6a35ed8f253c..2d21b2881ab8 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -2778,6 +2778,97 @@ l3_cache: cache-controller-16 {
 		};
 	};
 
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,event-to-mhpmevent =
+			<0x00003 0x00000000 0x00000010>,
+			<0x00004 0x00000000 0x00000011>,
+			<0x00005 0x00000000 0x00000007>,
+			<0x00006 0x00000000 0x00000006>,
+			<0x00008 0x00000000 0x00000027>,
+			<0x00009 0x00000000 0x00000028>,
+			<0x10000 0x00000000 0x0000000c>,
+			<0x10001 0x00000000 0x0000000d>,
+			<0x10002 0x00000000 0x0000000e>,
+			<0x10003 0x00000000 0x0000000f>,
+			<0x10008 0x00000000 0x00000001>,
+			<0x10009 0x00000000 0x00000002>,
+			<0x10010 0x00000000 0x00000010>,
+			<0x10011 0x00000000 0x00000011>,
+			<0x10012 0x00000000 0x00000012>,
+			<0x10013 0x00000000 0x00000013>,
+			<0x10019 0x00000000 0x00000004>,
+			<0x10021 0x00000000 0x00000003>,
+			<0x10030 0x00000000 0x0000001c>,
+			<0x10031 0x00000000 0x0000001b>;
+		riscv,event-to-mhpmcounters =
+			<0x00003 0x00003 0xfffffff8>,
+			<0x00004 0x00004 0xfffffff8>,
+			<0x00005 0x00005 0xfffffff8>,
+			<0x00006 0x00006 0xfffffff8>,
+			<0x00007 0x00007 0xfffffff8>,
+			<0x00008 0x00008 0xfffffff8>,
+			<0x00009 0x00009 0xfffffff8>,
+			<0x0000a 0x0000a 0xfffffff8>,
+			<0x10000 0x10000 0xfffffff8>,
+			<0x10001 0x10001 0xfffffff8>,
+			<0x10002 0x10002 0xfffffff8>,
+			<0x10003 0x10003 0xfffffff8>,
+			<0x10008 0x10008 0xfffffff8>,
+			<0x10009 0x10009 0xfffffff8>,
+			<0x10010 0x10010 0xfffffff8>,
+			<0x10011 0x10011 0xfffffff8>,
+			<0x10012 0x10012 0xfffffff8>,
+			<0x10013 0x10013 0xfffffff8>,
+			<0x10019 0x10019 0xfffffff8>,
+			<0x10021 0x10021 0xfffffff8>,
+			<0x10030 0x10030 0xfffffff8>,
+			<0x10031 0x10031 0xfffffff8>;
+		riscv,raw-event-to-mhpmcounters =
+			<0x00000000 0x00000001 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000002 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000003 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000004 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000005 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000006 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000007 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000008 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000009 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000a 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000010 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000011 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000012 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000013 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000014 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000015 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000016 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000017 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000018 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000019 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001a 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001b 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001c 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001d 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001e 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000001f 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000020 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000021 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000022 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000023 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000024 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000025 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000026 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000027 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000028 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x00000029 0xffffffff 0xffffffff 0xfffffff8>,
+			<0x00000000 0x0000002a 0xffffffff 0xffffffff 0xfffffff8>;
+	};
+
 	soc {
 		intc: interrupt-controller@6d40000000 {
 			compatible = "sophgo,sg2044-plic", "thead,c900-plic";
-- 
2.50.0

