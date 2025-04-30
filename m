Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA36134AB;
	Wed, 30 Apr 2025 01:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745976434; cv=none; b=j4Ts0uPTzrq8gDsnEUDs/E1kSuVWG30aDRg2GIWKoOo0ot8aNPlXJDsyK5CE3F0HqMCBz7F+OMYKMYW757SL0CAB3C5dhuaH8ipV6XZN7y92W28LCRUBt8Wvj8ZvEZCBR/zlXV2cJvy941sMBslcG/fLUInqdgM2DKTSFGtDcPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745976434; c=relaxed/simple;
	bh=FNCl1XiuX89EV3IZ+zbzjjZCqp5spzRh1uj7IBRBvTY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HL5EeESiCnZjFtCo5PFADmWcNMpR2C/hWF8BMNxul1S4Hc89+bCIc78RG/M2ExaQdgfV9i/BthZqXsIpUCKe4NClIGuffNQBDJLAuP0hAYbra7J/iJJDa1Znzh32fSZGPrfxRxq4hrAwBizPs03PVso8diVQNxdOlhWgNEcS9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLIJyX9T; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLIJyX9T"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47691d82bfbso150354151cf.0;
        Tue, 29 Apr 2025 18:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745976432; x=1746581232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qO1MORlZvAIzRB4tDNjI13tses6Kydhdwj9mXuXFn4=;
        b=jLIJyX9TUKFybQh/oKUQKi1XA34s6J3GGxKPaN43iAH14K85WxJOTp6uekFl6uDOqq
         aZ5Gla8uXHWF9wRLqH4ILnCfYNMT6DGxliKtGkHmbGyTEzONojWtM9CBWovF16N/z51b
         RJAwUUGPM6jBOQgzfGond/fVS9WBLGxnaaY/2aeE86doLjWF0U/Xe/7hlwMe0cfaoxD9
         oeWkeZ/pGt6Er+7PDaJEfL9iQU7zGF+87Et6UPoxVCjvQt6Pm/zivAuE+8i+90m51GjY
         z5t4OhJNnFK41BVo0NWFa8AQa7awyVK+oIeaSBPt0+LMkWtkkCMrthO3YAPrjsu/HPYU
         EOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745976432; x=1746581232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qO1MORlZvAIzRB4tDNjI13tses6Kydhdwj9mXuXFn4=;
        b=TU72SL2mHluQqCdGx2ZkxRZUBlPUbzcT0+zR3FIWfw77UtNZjmrlzSw8Ixd1YWPc0h
         S4c+vdPUyq+PiQ7O4VUiJzOyHsyo8Nz3ZCcV9asLHeZPPPbgrl+2HYg5todWdD/hjmtV
         4Ssiba34DyaUr2elWO8xr89+h+CwVOw6DLyk+uSiTTEt2+uKRNsIP5QBGrUslTbaZtbm
         TaYz9uWylo8uryvU+EKIGMt2gpowyXnttx9E+T+9lv2cKVxF/tDWkG4Xtr6173EpaiWJ
         mo191ugBPdISqk5m8+pfllKXDwLt4kwfvX8ubwrfI0lSmlmpnB8Jo7YgzGNAM/3aRlqc
         IAmw==
X-Forwarded-Encrypted: i=1; AJvYcCVeiwJXCCH9/Rdd5tW0C13KcolI8rHrM8emhTxj6yxTO8Y4ogntVGWfcbhnvE/rJZzuQeZeqSu7TpQCRW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGYpOlhoEs7vdLwKY5Q/4BOsbqiTKCGbg7PDc8O9oIhA2lwo8
	LQ7f7suV7vej04ziQaNcTJHiOVAQ29z0kGxjRIXMXe/DVoH0Qvq5
X-Gm-Gg: ASbGnct1g5KE0cta4GQtlxqICdgykLXTPf6PDMqIRVQzlpNvnkMI7pzNAPjfJRXXt3i
	a5+MdB76W8I3qrmf+H2gwaxPvbvPWETvIBwYm053fbO3x7PwaOpzu67wJ5JhbnQS/d3v0JPxOPN
	x8A1SSXsObqZi8OoYW8uoRmGZUeVMM40C6JI74uWJATEygiM5giMJU+3ReLOfGqeUdkWupeKrNo
	OV5gh/zlote2YjEevWXrY79scGWvFSY6iYVqadTh3gWJv/05M9/hNOrWbcV4lxTith5ukDl8U/S
	PZ7oMZVR9+Ervdm2
X-Google-Smtp-Source: AGHT+IGMsLOIjeNBpHyXV8xdTCJ6Im3aMfl/H6Lvwc9epi9BhN+OPpNVARbbu1gwO2GJsJc9Sc/T6g==
X-Received: by 2002:a05:622a:5a06:b0:476:97d3:54f with SMTP id d75a77b69052e-489e4991b10mr12935231cf.14.1745976432132;
        Tue, 29 Apr 2025 18:27:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47e9eaf4d46sm86963441cf.14.2025.04.29.18.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:27:11 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/4] riscv: sophgo: cv18xx: dts rework, part 1
Date: Wed, 30 Apr 2025 09:26:49 +0800
Message-ID: <20250430012654.235830-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a hard time to maintain cv18xx/sg200x device tree file, as
it uses something that dts override, shared peripheral header
and something hard to migrate arm64 arch. So it is time to rework
the device tree file and reduce potential problems.

The part 1 change mainly focus on the format of the current dts
file, and try to make them easy to understand and adpat for the
arm64 arch.

Inochi Amaoto (4):
  riscv: dts: sophgo: Move all soc specific device into soc dtsi file
  riscv: dts: sophgo: Move riscv cpu definition to a separate file
  riscv: dts: sophgo: rename header file cv18xx.dtsi to cv180x.dtsi
  riscv: dts: sopgho: use SOC_PERIPHERAL_IRQ to calculate interrupt
    number

 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 43 ++++++---
 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi   | 36 +++++++
 .../dts/sophgo/{cv18xx.dtsi => cv180x.dtsi}   | 95 +++++--------------
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 43 ++++++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        | 43 ++++++---
 6 files changed, 149 insertions(+), 113 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x-cpus.dtsi
 rename arch/riscv/boot/dts/sophgo/{cv18xx.dtsi => cv180x.dtsi} (75%)

--
2.49.0

