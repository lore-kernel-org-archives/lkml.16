Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668817A318;
	Wed, 14 May 2025 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231778; cv=none; b=fV1krrgG2qW9+zcv6XX8kFePpl9hzMfepaZAcd8g+2XYzutNbLki6TCgnzn9ouevAHr1tqYKeuiipj1Jc//4xJDy+l027alrwRMAWhcQXFt/x0ypLjY3GdAc7yAoLoe2xg3qmSOSYrBerTQfDet7Y/nJ6wA+3MpCcKGwVH4Phdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231778; c=relaxed/simple;
	bh=ayohP8fLe//c57DmTo1TugkicS31ny495LrOOlyv+xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7BpX+kPoV3SaCwLLrZcIf9jAN3kjHZCgY8uAmRaKtkXpi7jHNdvLnGRULYkfdEWEK/r7Et/xCLXHMvTRgtNGXXurn3dhjgwtXoCCJ09HSjJwRRNHwdtdReBRDeA/UKMP1+tqvBBbyCRlIOao4KaazZJz4v1ePVz7SW4OZrNNas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOaqiXUa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOaqiXUa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e6880d106so47680715ad.1;
        Wed, 14 May 2025 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231776; x=1747836576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn73ykHloddZuPbAEU3+QOc70jop2fReDsUopGcz0T8=;
        b=VOaqiXUaFnvLPYQUfxbXw3sQ8Ommtj9sEBrifGPeHKh9Ag1ZkpCOnnEAZb5p4SZOU4
         xBkU5gkcbN/8ZJzVjdZqQfkz46YaHEYc81SlTgYNYmNnFiQEN9nvOHaRm74kxJks/vYW
         K1mq+ZUqm3MbT3EuM7IJOqQ+hNPheYVlD6CLLZ7aMqZesuUN/gctwtTUUtS8vT31Wudb
         AVSwdvlaJSB6f4QwcsS+EG2jqq99FwdRGssQWSWDqgS3hdazncVgIVbxTuvll/1sx5rH
         bTaSCUfQ1k+1zeH/WHR3nL3FHGZWROJWxFCsdes2Z/JOUj/CN3rl1HqRrJQSESi2jpN4
         FWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231776; x=1747836576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nn73ykHloddZuPbAEU3+QOc70jop2fReDsUopGcz0T8=;
        b=R7wqVR0gz0um+U3wlxpveUduFQNs0yTCfVhHlR/hCf7Szfrtxm1oxl1HME79b5h7UL
         AugfDrNeWh43nR0DofohJi4LUO+Ow44wGuwmRhHleBeeyHOT1Yc3InoiolL61P6GoowZ
         Fp6tpMd3TBK/uod35LlNrro4WGq939Yw6trA1yfjjsAFZ3n1yTgG4NvTRv6zE9bbQdjg
         RmiXassKYDNPAjwMaKweitG1CFodh97JNMUhjllzRHjmjXleMkbyexRDtXX+v/pMLNou
         JjQcs8dJTlnLFEF52D09K+qcpfKfXDHe8YX2fXc0YHbhKBDg+m0RcZ3HhB44U1rVRdqe
         CO5A==
X-Forwarded-Encrypted: i=1; AJvYcCWR/k7ETVGkWprJjXZgj+fChKhj9GRFpm+9F6F2+ZAZ1sN/EM3fy7v2LkzZee2Xj5T29Cx+hw/PhSrYY6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNSEyPEPqp1agAewkczxSUS+eZSe369xmGI7jmtfKCMnjIpHG3
	n2mUKWUK7z4VEiobD5M8PB60NQrjxJmYb3x1dN8S0rcHcfItR3eEUBNgbniDGUJrgw==
X-Gm-Gg: ASbGncvlZ296Ydyb6Ux2LEBmAv7IbIKz2hQoocC9ucmjsp/lEq0w98PAXxFnaYmK1nF
	h2dgNMPc42ZaMF3iwcJWEpV1Rh2ZFbUba/ji3z9gcHtgdHNiTGSSoRP3nL99KfZfBAQ0b3dXLj7
	8JkuZr5GH6muintZJnRvf9sQmPuXtBpj6Eav0WLrfzuFEHMYBonOI7oyKTJBT51kRLZ+EyNDvU6
	ZK6P9msjOnXlYkWA2SdYw6qKQdaub9CLBnUhpQSsuQvKcfz4uWcLPH8FJ11NvRniIPTM1dKUb+y
	Q1nhRGgWEZYzqz/NZK11cMsMZ3KIByfZyS0XwOIWFes8dzLrFYGIkjrClOPWqA==
X-Google-Smtp-Source: AGHT+IGYPQ7AEh2PEScl/20vslZRXfRKA3Io3uLpuFyktZVo/du/cwLIS5UZo4wt53W5E1XOpkOfgw==
X-Received: by 2002:a17:902:e545:b0:224:26f2:97d6 with SMTP id d9443c01a7336-2319816e59bmr61090345ad.28.1747231775439;
        Wed, 14 May 2025 07:09:35 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:34 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Add Sophgo EVB V1/V2 Board support
Date: Wed, 14 May 2025 22:08:58 +0800
Message-ID: <cover.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sophgo EVB V1/V2 [1][2] is a prototype board based on SOPHON SG2042 [3].
There are many of these two boards in the hands of developers.

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Added ethernet support based on [4].

Changed from v1:
1. replace "sophgo,sg2042-x8/4-evb" with "sophgo,sg2042-evb-v1/2".
2. replace "Sophgo SG2042 X8/X4 EVB" with "Sophgo SG2042 EVB V1.X/V2.0".
v1: https://lore.kernel.org/linux-riscv/cover.1746811744.git.rabenda.cn@gmail.com/

Thanks,
Han

[1]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB
[2]: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB
[3]: https://en.sophgo.com/product/introduce/sg2042.html
[4]: https://lore.kernel.org/all/20250506093256.1107770-5-inochiama@gmail.com/

Han Gao (4):
  dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
  dt-bindings: riscv: add Sophgo SG2042_EVB_V2.0 bindings
  riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree

 .../devicetree/bindings/riscv/sophgo.yaml     |   2 +
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 247 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 235 +++++++++++++++++
 4 files changed, 486 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts


base-commit: 550de367614f7a9a0c1d40d7e19764aa9305009a
prerequisite-patch-id: 7a82e319b011e5d0486a6ef4216d931d671c9f53
prerequisite-patch-id: 5a30fb99ec483c1f5a8dca97df862c3a042c9027
prerequisite-patch-id: e0da79790a934916d9fc39c18e8e98c9596d27ab
prerequisite-patch-id: 84d1e1637549f632729eaeb7cf935ca78a642fe3
-- 
2.47.2

