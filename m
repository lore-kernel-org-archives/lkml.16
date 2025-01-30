Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8357483;
	Thu, 30 Jan 2025 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242075; cv=none; b=OLPXhx1I/H2OezzQCgUn9z34B2AJCMdilXWRb+uMDqKQuSKUjT/ElTq3z8LG6O4zNrFRcuzD/3X7eWg44wGlKf76D6/qR2S5SXyd4g8Bsd23EtAVOjR5osTbsEcMkI+9x+aHcgxFgdhATPouph8pSfpGl1Ra4SLlH0MUkfyGPhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242075; c=relaxed/simple;
	bh=VxRkETfKHmTAhNRv4hdfVEutIx+9IVlNgDyAqsRrGpw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VMz1bcRL/P7qfif8Ti0I7sA+j88X6MDssKtHPBZNDamRXvFcuesG45TJ3vhDd7tdyYXZzSsOTik+lqWcHC4iYw0wP5wNZ67Zo7neU6KlqZ+jdksx7Y8XA/32gePjp2h6UbZB81qjdwVQEA0CHQglwfi0VEI1We2d7v+xN4EMlMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VyzKl7hS; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=mbcFpJJx reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VyzKl7hS";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="mbcFpJJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738242071; x=1769778071;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wj58s5CoC7A+ZuNeV/ZGyINoKzUF6v+v74SipQCF2NQ=;
  b=VyzKl7hSpaCYcHiLFtHeADZENyqpKopQClvKvO845GSzUz+Q0nssNe6q
   m+1DPXTKetO+rjqvAv+/EyBfS3XqdOO6vb1DQ4sgBNP+OQdMt5PIy+wmQ
   em832LOpikDdKQ+Md8hlG6BHLWhZV85q65DG4UNSSYM4Aw2im+cHK5D45
   CiA1MsPkTFGZlNsqcNMlCL792+6RolZeOlIDyvw+KLw4v1Nxt1EDi5PxE
   MSRAG7Xc4J0YJU/0+xQ5HXKj+NVyKflOC1s6lGFXszpuLYs/7Nk72+d+F
   OWDl6PE+109HUdZHNdu4v9JDoreefk39MaNxUThPi8cfe45ePM9TAXrgm
   w==;
X-CSE-ConnectionGUID: F346eup2RHyq5Mx9HZjn4Q==
X-CSE-MsgGUID: gyO9Yn/jRTGuTzpjVybASA==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41374596"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 14:01:08 +0100
X-CheckPoint: {679B7814-32-1CE016C0-E589DA3E}
X-MAIL-CPID: 96EE492516499171CB9FDB906F9A685E_1
X-Control-Analysis: str=0001.0A682F1C.679B7814.00B1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54FB41675B4;
	Thu, 30 Jan 2025 14:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738242064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wj58s5CoC7A+ZuNeV/ZGyINoKzUF6v+v74SipQCF2NQ=;
	b=mbcFpJJxFpOyy8kUEWQbTB4M3Gyw3lSYbYE2ZwwM71ysmoV3w6Ji6wTZTN2JStwPupDawb
	8oJm98ESPJuBxIw39klfQBSnrNZW2mpTHF63+7yl6yuDP73OPy8YXaqMgEcFhPvNpUFVGy
	ZpLcDLLIxq99QSzbia1Jq3B3cuVRRsnBx2T+i69+06Z3pVH4LX/noYMF+xa0/G8AUHqNUR
	b5lrSwd6ZPo3I0k+9/9kBk8IwCoZ3KJ0MoMs+qzRWY7N1xZMrffxRfyBBpVMnPTelOeY/v
	MYo3ID28tMD4RHvQ4lKzDIL3/iSBu6gkLjZxn3aHjD5PbLsK3sse3Ip7dn1+Jg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Make i.MX8M Nano OCOTP work as accessing controller
Date: Thu, 30 Jan 2025 14:00:57 +0100
Message-Id: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

inspired by [1] this adds the accessing controller feature to i.MX8M Nano.
The OCOTP eFuse has bits which can disable particular peripherals, such as
GPU, MIPI-DSI oder USB.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

I successfully used this on a i.MX8M Nano DualLite which has GPU disabled.
Without this patchset the default DT completly freezes the SoC if GPU
is accessed.
Using this patchset the GPU is disabled without any DT modification from
bootloader:
> imx_ocotp 30350000.efuse: /soc@0/gpu@38000000: disabled by fuse, device driver will not be probed

Adding the other i.MX8M SoCs is straight forward.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com/

Alexander Stein (4):
  dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano access controller
    definitions
  nvmem: imx-ocotp: Sort header alphabetically
  nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
  arm64: dts: imx8mn: Add access-controller references

 arch/arm64/boot/dts/freescale/imx8mn.dtsi    |   8 ++
 drivers/nvmem/Kconfig                        |   3 +
 drivers/nvmem/imx-ocotp.c                    | 107 ++++++++++++++++++-
 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h |  16 +++
 4 files changed, 132 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/nvmem/fsl,imx8mn-ocotp.h

-- 
2.34.1

