Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E8628C2C9;
	Tue, 17 Jun 2025 07:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143785; cv=none; b=tnEElsb1PDVEAN4wrlW1hI5UgtkJxxyF/qHfZenkBhw+QfWn0uF7gkg1dAw63el9uSXkO+beMCkbIOiK9iMrQTBpF0GOvVwB8jRsH63Z82jpOlPGQMBYhMzc2gPpBjOLKeCeW4DITQ3RriQvH3Z4r+TcZBz+4wMIXmY5yavH9Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143785; c=relaxed/simple;
	bh=9uQYlaKrOF8qdMrm3wBT3CKVF83rj42WRbeBiwxnE0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WOJt0Xm0vcfHnMr/k/tbGSggflOu5FTqC4vQXfz8dZv0dTwrxVsbdUhun5fOkvcRuWI9L8wxZa+8q9EyPIdRCvRTUIKfQOmhOSgPTmgXjhtNgu2cwddtISfwPO4Ru2dScYjY4ZKwWtQVods4spMxyyuZ2Rz77pfv3rzHK6KcBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBmgQguV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBmgQguV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23633a6ac50so76348015ad.2;
        Tue, 17 Jun 2025 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143782; x=1750748582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UaG/t7KG9r8h6CuNkV1Xs54wfnnVvv58385nUogNAos=;
        b=bBmgQguVTLAOZ5ajcCrmZHalv/y1BWUNFbq87IJiRRqJIZBzKGcoM9CZFv9WPq1B7v
         h7//vroZNKy5NySUKsIszJ958X3FcpD/SIbe08lIIsg697SMEQUK8LGDaHF43JsTwoxu
         qt1/hiQ3t1K/TiJ0uq/oVCdbX4bYg/x5X0NsElxI3VfIAhsu7s6JufELg+tA2w9ByBJv
         PAIomyKlxM+4gMFf3xOqMxeNd6kA33ciortSrWN44SezxFdcV60ZD4RLX44cxHCFstNH
         noc643idcYQSZkFwyhuPLKJDiv4eDP95Q39A6DWVBAulZti0ZTfsjkarO1yc24Up0iML
         8iYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143782; x=1750748582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaG/t7KG9r8h6CuNkV1Xs54wfnnVvv58385nUogNAos=;
        b=ZUTAuZpch5L00XqnRCLla8wqcGos/yWWD1f9Y6P4pkPFBjy1dNpRQY0lGwkb9KAfPi
         WVjxJ3xV+om+CJR2Cc8ePUmV8HbxxWhEfL1G7HbSEKTpXMqzejwW+j501lTaWluTRoJ6
         kHCs/67SrqfiG4hBOl2/G0BfzLLXlzNVUf/q+QkuLaFPO1oRq+O8HcIIZV5G4gLhYrwx
         tEtfhkKZwSAyxH5xUtsmAgaT4eOTkqlDEGOOuDgeiMY+IbTdEkjH6eVKv0A83VU5Ctgy
         EqFUndFbSGy/6dKeXlJExdO9dtOoG3laC8vIvQjr/lFxUyCtta60pXFcX7xGswtXuGJI
         oXmA==
X-Forwarded-Encrypted: i=1; AJvYcCUWABwqiokyLOPqcjec9706os7/SG54p91dkpbjihYMoco2CcQbAIdj8HV85qFldKGAvP8kE3TaHKG/3lQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8w2hFbxDddErR/LjLf7TNQWZIK0YzZPHYGSJp6FPHnDCbLSW
	CHhglCKziaznx/HStIHVtU+m2UAErlarupQVPo5lSNlaDDcfjWHvMgMQ
X-Gm-Gg: ASbGncuTSGFyt7rLuu2cMhWFxbJ6jlriI3NUnC7FBFVZZ1iqyN1CR5hbVXiLkoAgG1t
	y1NBtZ2wQBTeDvhOP7GUmREAG9ATDhFmnSwxfww6BLBsx3GqsxlekE9LCF0VbMd6rIXuGpf88jd
	qUT8/NqDSnHCV2Phl8nlFiqG+DBrQ1BvNfRBDOkmdg10UFy28L5lB0ZGLvE5g+u2tJjoK5COUMa
	4ArCA5FfrEJz6ZsFvsjacbECfGv5srGofXwiCceELx72Aq2mg8AY9l13VdpHcOW234M54ZI3MM5
	yZQbol2JKyDREdhbwJxv2ksQSao7afiqh91veQQSektXy2GoR5kWAadlcdR6VA==
X-Google-Smtp-Source: AGHT+IGqDk0ZeWL4AT26rDLpFZ8Aq+pamnX39szXBefKiFUBuwuWNS2youv83CQvs23AFpZt39mjJQ==
X-Received: by 2002:a17:903:2f4b:b0:234:a139:1217 with SMTP id d9443c01a7336-2366b3505c4mr146544715ad.18.1750143782107;
        Tue, 17 Jun 2025 00:03:02 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23692e44fcesm6154635ad.169.2025.06.17.00.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Tue, 17 Jun 2025 15:01:38 +0800
Message-ID: <20250617070144.1149926-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Changes from v4:
1. patch 1: convert the compatible as entry of enum.
1. patch 2, 3: apply Alexander's tag.
1. patch 3: apply Junhui's tag.

Changes from v2:
1. patch 3: fix wrong reset ID.

Changes from v1:
1. rebase to v6.16-rc1
2. patch 1: apply Rob's tag
3. patch 3: fix wrong reset ID

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  4 +-
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.49.0

