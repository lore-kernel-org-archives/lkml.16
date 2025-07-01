Received: from proxy41135.mail.163.com (proxy25215.mail.163.com [103.129.252.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B157C70810;
	Tue,  1 Jul 2025 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.129.252.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363915; cv=none; b=S/2lRR0fNTRWYsYaI/ltGHvOByQk2q0Vu1VwPSGAn62clWUeFf+MKupLP+bfo6mQHL28RAnGFqWCZ7ORLPAHVIg8JirVFpK0pMwh2ESqi5KOvk9wSHPWZ413y6cSB1GlQwUzxjJUW3JWlFD/K9TwFMq7z5vsrkG4zsZa+KjgBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363915; c=relaxed/simple;
	bh=qGNAjoFJG8zm3JGUUR99OuCL/pJOrN39l9GlE/Xcr7o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LxVFoxjZdwD8kku5wPLuEhNN3vp7fgMA/vX9wXQqItTOfihAetmNVn/aVPx0t53jB2HlVCSagFLmCzL9jSktw2Cy1ZmkcFuhAM4Uw7yYG441GlRFpF0wBCLtFbjg0zw6e7psNPQufvpY2niGMDAML3m6fFd/Oh3H3c2r3yveAFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=E2Cdfc0f; arc=none smtp.client-ip=103.129.252.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="E2Cdfc0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/G
	ELPfBEq4QsfPpyB+JepuYTT1ZyBNGagqKrHAXkd5s=; b=E2Cdfc0f2mZEMJ07sx
	Vy1LUqp7nLt3WWNI+Hh4ncWxZ9SbBmCY+NCCeNEFkwnJw1Q1N9jI6dyA8+Ic5pWW
	qHtor/3yLoE/SEvVweOqq23A7ih+Sw0oolGK9KffsN+p8a4FGIUjGG0fy3QbWACY
	0pQBSVjIoEaVQRBJ/gTRPs4Iw=
Received: from mps-HP-EliteBook-840-G3.monolithicpower.com (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3Ohr5sGNotxc9AA--.1916S2;
	Tue, 01 Jul 2025 17:57:15 +0800 (CST)
From: wenswang@yeah.net
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Wensheng Wang <wenswang@yeah.net>
Subject: [PATCH v2 0/4] hwmon: Add support for MPS mp2869,mp29502 chip
Date: Tue,  1 Jul 2025 17:56:25 +0800
Message-Id: <20250701095625.1049917-1-wenswang@yeah.net>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgC3Ohr5sGNotxc9AA--.1916S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry7CF1DGF4ruw4DuFyrCrg_yoWDJrcEkw
	sFgFZrAr1UJFs5WFZrCrn5urWUtr4FgFyxJ3ZIy398AFW3Z3ZxWFykZ3sFya47ArWUuF13
	ZaykC395AF17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU87l1PUUUUU==
X-CM-SenderInfo: 5zhq24xdqjq5hhdkh0dhw/1tbiNBtdAmhjsPscgAAA3s

From: Wensheng Wang <wenswang@yeah.net>

Add mp2869,mp29502 driver in hwmon and add dt-bindings for them.

V1 -> V2:
    add Rob's Acked-by

Wensheng Wang (4):
  dt-bindings: hwmon: Add MPS mp2869 series
  hwmon: add MP2869 series driver
  dt-bindings: hwmon: Add MPS mp29502
  hwmon: add MP29502 driver

 .../devicetree/bindings/trivial-devices.yaml  |  10 +
 Documentation/hwmon/index.rst                 |   2 +
 Documentation/hwmon/mp2869.rst                | 175 +++++
 Documentation/hwmon/mp29502.rst               | 101 +++
 MAINTAINERS                                   |  14 +
 drivers/hwmon/pmbus/Kconfig                   |  18 +
 drivers/hwmon/pmbus/Makefile                  |   2 +
 drivers/hwmon/pmbus/mp2869.c                  | 711 ++++++++++++++++++
 drivers/hwmon/pmbus/mp29502.c                 | 691 +++++++++++++++++
 9 files changed, 1724 insertions(+)
 create mode 100644 Documentation/hwmon/mp2869.rst
 create mode 100644 Documentation/hwmon/mp29502.rst
 create mode 100644 drivers/hwmon/pmbus/mp2869.c
 create mode 100644 drivers/hwmon/pmbus/mp29502.c

-- 
2.25.1

