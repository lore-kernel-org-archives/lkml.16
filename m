Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4ED1A2391;
	Sun,  4 May 2025 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746354301; cv=none; b=k9Quol1SeqVfP3pL5+Da1WuAR/uRFI3BpRPhg6odHc6tTXIbK2Bf2zDxDbAc1s9bajfgQM9Lq/LCkqqlMDgvREWTJw8W1fqmPcJZCDvLdfwU8lmONHkqvC8KZizioZ6TLJSxv2jFlARjWFQjlx76a6aZq22ndve/s9uLrU6swWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746354301; c=relaxed/simple;
	bh=4xgR/nLOxR+neQ8HFSvyc0xNkPTaq4iZpZPllJ5W1N0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iBdrLpjpdfds6S3vsMacT2RkdkZnr/wdmCaxK6INQVaf8sKT3f5nRi/4ptrA/UUhx1o9p3sHtQC6JzHNZaznWynsoAg/xdly0RtttqngOL6cHP+Jh4+vu3QHY3+m0p7bWE398vPg/CTQec1KYxDtcBl1BudRvYKU4Ar9Am+f84Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Zdle94; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Zdle94"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c560c55bc1so422503085a.1;
        Sun, 04 May 2025 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746354298; x=1746959098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PQ7S6mvnJWIgkvAn2u3X6CatMHsWA3MJFpJ2pyOLwk=;
        b=T0Zdle94y9Hi5Oh7n6oaFexQtXaxSHObOFPJ9GtvAukR3QT97k594PE6t7hic4n7sg
         0Tk+hFW+f/HIkbKDN9YoNKCnzkqcrjZ5N+LMnnzfjkoZOtFJeF4+HqAVe1AM5PzZxoWG
         IKYC7l/MeAXQ/PMgIbcH/HmPyU8m1AfNzDAnuQpZHZjI2uW/CbiTwsKpu/LcoCG1udLg
         CiUECpzZhrS67ltiGW6bvgtsvHbyqRGPsbsKRv22MEc5hEMutcEauDosaHvGYkCLBIgy
         NrZO+L9y8u3HwPVtqc6ypdBtWzsU9r1g/BlmRnW6K7wbEFVvFMWw/tnQCJxsXCUmse97
         XX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746354298; x=1746959098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PQ7S6mvnJWIgkvAn2u3X6CatMHsWA3MJFpJ2pyOLwk=;
        b=c8oXT+1pByJ3CeOCJR0eK0z/7rMwb4cO6Pl4oAKA1S+Urd3Iw6llx8isP52U2eo+9q
         0dSD1ScgZLetjOyyGqiJuYLIeJ2JyJRas9ossMFD/7Moc4zxP1by5kn3CCqHYIP8cc7X
         +IGjhaBP5mrt1reQ/i44txPSdgUZscgtX+fNow5c5xTMhJCEwSv/TrMM+p/lu2ympcCM
         UrRpfz8skV2sUSYrc05g78uluOUanhz+Do2vPKgjjjvpRIAlISx+pIoBV3AD5DfLMnPV
         /9RZnZb+bgsFw7GxlHwdKT4kopJyyT51q5z0nbPzolrim6N4xxRdb1o+3B+Jzr0t05az
         IFZA==
X-Forwarded-Encrypted: i=1; AJvYcCV9Ckzqz6wUwNDGF1GjVny7McBrxEyA8TONf5eo8uMSMrGFvs+sclaOtw2GPW+6Nzbk7boHdjkOGxjPNexh@vger.kernel.org, AJvYcCWi2VDykP4QQCSUV+0S7pBF92EQc6ENj/wEj1Lk3bN7ACyhqWyI0JlH+fksD7ryiqumrv0497H7USFe@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcrGutaj/1IpKYa3QE16gf64a/4jOVQjcH7P8CLHtYbhEqO+g
	Zm93oSn34AsaL20HWehV/wXUkkvOJ/JZePNMsrZM/EoKP81dPaho
X-Gm-Gg: ASbGnctP30YOEsbXwm28vjvhtNpLByy+U5c6i+BKWhdbCCd7Oyegm3NlgS1flocLf2r
	/OzYlFwW2AiSYQM07CxpzRCpehoLU6F8hg2fKsR8RhdtCMkN0k+kRrgdzEVhoW6zV9DIikhA2by
	FZKlHQxnFg15V1MSw46mREt/FVlTCiv/V/euuqHXn+JCJXno8rO01/3gOdIy0kvLyeeWArNq2Qj
	2+JZVUeNK2drSQLt8yw5egiBjsXL7hT6QTTkcCQJjR21rnBOugDHlOc7mNsPc/yYhs4zZWcnZk6
	SRp8KakgMdWhrZ1SAbyyEfHzH/E8Nfipvqx7+aSxj/pDOSYdjlDj
X-Google-Smtp-Source: AGHT+IEKTdMWS+jgcgAMuh3WRdpxZw08Q315wtPX2pV7WRyc1kxWG/qYE8O2gr4jHmjNND3M/QRc1Q==
X-Received: by 2002:a05:620a:4014:b0:7c9:4c25:9eb7 with SMTP id af79cd13be357-7cad5b3867amr1038889385a.23.1746354298396;
        Sun, 04 May 2025 03:24:58 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48d6sm429222285a.32.2025.05.04.03.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:24:57 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	inindev@gmail.com
Subject: [PATCH v2 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Sun,  4 May 2025 06:24:44 -0400
Message-Id: <20250504102447.153551-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502205533.51744-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device tree support for the Luckfox Omni3576 Carrier Board
with Core3576 Module, based on the Rockchip RK3576 SoC, enabling essential
functionality for booting Linux and basic connectivity. v1 was posted at:
https://lore.kernel.org/linux-rockchip/20250502205533.51744-1-inindev@gmail.com

Tested features (on Linux 6.15-rc4):
 - UART: Serial console operational
 - SD card: Mounts and reads/writes successfully
 - PCIe: NVMe SSD detected, mounted, and fully functional
 - Ethernet 0: Functional with RGMII PHY
 - USB 2.0: Host ports
 - RTC: Timekeeping and wake-up tested
 - LED: Heartbeat trigger works
 - eMMC: Enabled, not populated on tested board

The series includes the following patches:
 1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
 2. dt-bindings: arm: rockchip: Add luckfox,omni3576 binding
 3. arm64: dts: rockchip: Add Luckfox Omni3576 Board support

The new DTS is covered by the existing ROCKCHIP ARCHITECTURE entry in MAINTAINERS.

I am aware of ongoing RK3576 upstreaming efforts (e.g., by Collabora) and
welcome feedback or collaboration to align with mainline driver development.

Changes in v2:
 - Enabled HDMI node per feedback from Heiko and Nicolas; untested due to
   upstream driver issues
 - Enabled Ethernet 1 node per Heiko's DT philosophy; untested due to
   suspected PHY driver or configuration issues
 - Clarified eMMC remains enabled but unpopulated on tested board, per Heiko

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (3):
  dt-bindings: vendor-prefixes: Add luckfox prefix
  dt-bindings: arm: rockchip: Add Luckfox Omni3576 board
  arm64: dts: rockchip: Add Luckfox Omni3576 Board support

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-luckfox-omni3576.dts  | 779 ++++++++++++++++++
 4 files changed, 787 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts

-- 
2.39.5

