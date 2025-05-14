Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A201A2389;
	Wed, 14 May 2025 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231793; cv=none; b=R4QYW6erONwpOUojYemdL7jb+lOSZoRRtlFg9CtXTiMozIl1jp37LY3ZsYtyQrNDOfMGqxvVdYs2OkV9qacFjZr4+L09F2TUVavs8iGcBhMq2pDPn6kUNcmoQtLUlS7BD5FDHyLUYLnAFZoJ04J117siWtL+G5+uK9SQEW4iTy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231793; c=relaxed/simple;
	bh=4dl5+OZfqhFPLJo/Up9uXG6VoEqoKSsmkzSEs9Y5fSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sj7Ku4AZmyFgDXVRvzYC5qUMCxf1GCOoBZI4P8xsYKG768/LFencYC+uaOpBcreIt2/Imu15Y3KT5kkDHRZPlXtyyj31BFkJ7pHrVaYRf/vnOwn3X5D2XrVGMYVpR3cwNHDJXZHOetAalrnDD6M1Cghu/xdZgfo4fNRwhArG7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7K/RZi7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7K/RZi7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e45088d6eso85776375ad.0;
        Wed, 14 May 2025 07:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231791; x=1747836591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/YcSt7LXpLFIToFcWwcO2jaJLtudxyRIp4lpPUkGAE=;
        b=e7K/RZi7IwRSs4rxRqU0b3DeRLq+Ar1WilvL6FhCB5cZeZ5nzVks3zBZmm4hu79/N6
         lJMSZqeWKG+C5klDM1tpHj/BOLMSpRMqSqdJedeheu+t9/hxG5RYnlnSSd/G9EmBck1j
         LVcgvajiireGLJuF+80eAgMsrtzGfcBTJRSGdjom304xk9A7hvUlwNtrmpVivFSOHgHj
         5Bk4+NUKm4rTkWA2uWALVrCYFHYR/JvuM+xqBliuxh1Cht2RZ9XfHGGVXG9HgG+pfT1o
         +C2vKuds9AWbHyJGlcHkydFqQVMx8x5xUFj52vZCO5qZowBl32c+xp7QeCQevutY2Xl3
         4C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231791; x=1747836591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/YcSt7LXpLFIToFcWwcO2jaJLtudxyRIp4lpPUkGAE=;
        b=CfAFvJ/tvjMdNUpTKIRqcnLlpvW6diVHUl4C7M6jGjTu2d5DS8f0B5owwtDQtoimpB
         9z2wj9VFjcRJ4neZmrHZzPyDn4ui652PtnID+x11LFCpvucF1211Nh7eWQduuBEv2ftP
         egWaghFeGJnN8cUP4h3iPyOu4qkeGCikdv0fek7RA6TvgsLWFabpd1pcI/8thlGkvJhC
         wJYajKjYGHRJxoGKi5mRQFa/TzHP4UD1EMdVvg6P5IBJFCbvZ2XV06MsuP/aM1Vy5Nv0
         mu2IHdAE21sEr2dEJ5LP34NBdLN2WkdweR0scPXNz9Qc7hZVKAN6WDek1Q91J0dtvwkP
         xb0g==
X-Forwarded-Encrypted: i=1; AJvYcCW/fz/RC+7jAa+6KcRLwlG8ThjqkkAbnDp7qz3fyDTsoT4Pos+whRZflcxlSntT+7NdjrYSV1mOohPFVqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwgdCtHLiwr/EiAiuEYxRm/SZnwdWG/2A6B4hAcEcEuGhA4jgn
	NMIJZWUG7D5B+bknw8f6mfIRQtvFVD8ILl9w+R6AkANr9/PCOR/HkU7+IXElv9Cwrg==
X-Gm-Gg: ASbGncvmk+Ob04hNZuCFiDnH8RNCJaJLHTyFKhc+hVesWN1PA5juEvqG8gp5exh1Kqm
	TnHgw5WnMNfXiLtYl6fFfdW8O3w5pBrk+pieZDcRRpHKRpHfIbfm3W/VHxQTiAC7cDZo9SHrmAt
	5skGFJL21h95uO5gInCmtcOmWQTwU/bFTaFUpjl60iEEVNTSGyVeTytMSyFlFdFMRz9LerktAV4
	SCtpHhHzJFAuCoU72/dPRqlM4udJQcNp/Nxh78+SiE2LPMvX/RgUnJA27RxeKFqp8Ey13bCtJXU
	QxicizOpbsJUd89tqpyMIPzNHeqJ+NL3yrg/Cgj6i9wvFt/FZ90NaG/PtCw1dOrsLBAIuwsM
X-Google-Smtp-Source: AGHT+IGE6zR+71PFZJvXrrGxXGU1Je58bhDIMNTpwJKTTEpQE/rNBSGSw+vM8hybiqYQ87lEF5ZG3g==
X-Received: by 2002:a17:902:fc8e:b0:220:c067:7be0 with SMTP id d9443c01a7336-231980bbed9mr43762735ad.6.1747231790969;
        Wed, 14 May 2025 07:09:50 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:50 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V2.0 bindings
Date: Wed, 14 May 2025 22:09:01 +0800
Message-ID: <dddabd3bb2c718a506d2b6669a8252cfe3872fa9.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747231254.git.rabenda.cn@gmail.com>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for the Sophgo SG2042_EVB_V2.0 board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 6c82f89b56ca..cbfd07cc053d 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,7 @@ properties:
           - enum:
               - milkv,pioneer
               - sophgo,sg2042-evb-v1
+              - sophgo,sg2042-evb-v2
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2

