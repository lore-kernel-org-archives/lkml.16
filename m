Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD352F22;
	Mon, 10 Feb 2025 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173973; cv=none; b=urRTii/EIDHnRFuBvOC1XS5EqeNXhTtvjuL2Db1KKc1rEBfrWCWF8kKsXcQuhabiZhvXTO1V4J5MDJU19/r3/OgCGKBgCKNJzkkILe5Oxm6lrqXbeU3HBsUDl17qlBVEJRkq7JE+8WMFMpsF70fPCG214yFhxLl8vZV8XXDhXuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173973; c=relaxed/simple;
	bh=DJdItJntOY5OJ5hvUSmejJSmg9qkBKUePL2xVWDqlXI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HcALA1MtFTbdFT/a2wrQ2dGInJ2MLt2Q17fCKRDPggQo5wjfzyX+/mOXlTSmC3QtlLYXR1FWRr3D6piTJ7t/+kLRVHETFRiBPSnlc4vcD6OgmKykt8jQPWfC+ogsGGgj1eN3vynPmfxBohj4O1Nwk+hPyyteB+Bg95aeyKewpkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vWlhTkWl; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vWlhTkWl"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51A7qegJ002056
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 01:52:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739173960;
	bh=TIoUXv4bvfSaNynsaGquNVj1t+EosXITFmTzVsUQThE=;
	h=From:To:CC:Subject:Date;
	b=vWlhTkWl5lxtoELWTi9isUpA8xKgh0gf3gaj7NvrsfH/PTclYYkAL2vVCNtSApABX
	 D3O+L6EN22FlXzOS4HotIpq3Srnx/8QwG9r+ywscCIX8XUFIiJezWy9uqbcmbwkDBP
	 81UUPOH5bZBBvJZFkzdSN1zL7T7wGflglz+DhfA4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51A7qemJ126469
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 01:52:40 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 01:52:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 01:52:40 -0600
Received: from lelvsmtp5.itg.ti.com ([10.250.165.138])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51A7qaDr063518;
	Mon, 10 Feb 2025 01:52:37 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <jwboyer@kernel.org>
CC: <shenghao-ding@ti.com>, <linux-firmware@kernel.org>, <13916275206@139.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alexander@burningdaylight.io>, Baojun Xu
	<baojun.xu@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Add regbin firmware by index for single device
Date: Mon, 10 Feb 2025 15:52:11 +0800
Message-ID: <20250210075211.5343-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Add regbin firmware by index for single device.
Add more symbolic link for Gemtree project.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 WHENCE                      |  14 ++++++++++++++
 ti/tas2781/TXNW2781RCA0.bin | Bin 0 -> 868 bytes
 ti/tas2781/TXNW2781RCA1.bin | Bin 0 -> 868 bytes
 3 files changed, 14 insertions(+)
 create mode 100644 ti/tas2781/TXNW2781RCA0.bin
 create mode 100644 ti/tas2781/TXNW2781RCA1.bin

diff --git a/WHENCE b/WHENCE
index d2ccfbb2..39b6de58 100644
--- a/WHENCE
+++ b/WHENCE
@@ -8010,12 +8010,18 @@ File: ti/tas2781/TAS2XXX3F300.bin
 File: ti/tas2781/TAS2XXX3F301.bin
 File: ti/tas2781/TAS2XXX8DE8.bin
 File: ti/tas2781/TAS2XXX8DE9.bin
+File: ti/tas2781/TXNW2781RCA0.bin
+File: ti/tas2781/TXNW2781RCA1.bin
 File: ti/tas2781/TIAS2781RCA2.bin
 File: ti/tas2781/TIAS2781RCA4.bin
 Link: TAS2XXX0C94.bin -> ti/tas2781/TAS2XXX0C94.bin
 Link: TAS2XXX0C95.bin -> ti/tas2781/TAS2XXX0C95.bin
 Link: TAS2XXX0C96.bin -> ti/tas2781/TAS2XXX0C96.bin
 Link: TAS2XXX0C97.bin -> ti/tas2781/TAS2XXX0C97.bin
+Link: TAS2XXX103C8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX103C8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX103C8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX103C8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
 Link: TAS2XXX10A40.bin -> ti/tas2781/TAS2XXX10A40.bin
 Link: TAS2XXX10A41.bin -> ti/tas2781/TAS2XXX10A41.bin
 Link: TAS2XXX11540.bin -> ti/tas2781/TAS2XXX11540.bin
@@ -8074,8 +8080,16 @@ Link: TAS2XXX3F300.bin -> ti/tas2781/TAS2XXX3F300.bin
 Link: TAS2XXX3F301.bin -> ti/tas2781/TAS2XXX3F301.bin
 Link: TAS2XXX8DE8.bin -> ti/tas2781/TAS2XXX8DE8.bin
 Link: TAS2XXX8DE9.bin -> ti/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX8DE80.bin -> ti/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX8DE81.bin -> ti/tas2781/TAS2XXX8DE8.bin
+Link: TAS2XXX8DE90.bin -> ti/tas2781/TAS2XXX8DE9.bin
+Link: TAS2XXX8DE91.bin -> ti/tas2781/TAS2XXX8DE9.bin
 Link: TIAS2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
 Link: TIAS2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
+Link: TXNW2781RCA0.bin -> ti/tas2781/TXNW2781RCA0.bin
+Link: TXNW2781RCA1.bin -> ti/tas2781/TXNW2781RCA1.bin
+Link: TXNW2781RCA2.bin -> ti/tas2781/TIAS2781RCA2.bin
+Link: TXNW2781RCA4.bin -> ti/tas2781/TIAS2781RCA4.bin
 
 Licence: Redistributable. See LICENCE.ti-tspa for details. Marked:
 	 Copyright (C) 2023 - 2024 Texas Instruments
diff --git a/ti/tas2781/TXNW2781RCA0.bin b/ti/tas2781/TXNW2781RCA0.bin
new file mode 100644
index 0000000000000000000000000000000000000000..9718640b529e324bc5975d7d66bcfbdef8d4ad6e
GIT binary patch
literal 868
zcmZQzU`{#U%krFofsqx68Pj~{%w_~J7~p^z$m#*&J3xE`E;@o3Da8f4hGt2bCA!5q
z`6UMA_?(H6g>eB;qXrN&GcW=nL(EJD76y9;1}-Te4;c2mKrt}~1_nN$5`G|NVqj!u
z1aUZk7^DLz&&1?u6byAsYH~(?QEFOhQEFatDk&}lxn&8^%nBgp0-6epU%n$iI~~y6
z!~$`X0FVZ{i&6Xp&`B%|EMWgLg4rArKqG(v<Tef&kds*$I5Zd>Kw=;^mj{RiWk*27
zA^yPXx1`E~#NuLz7BWeot&EjGy(K`*33eAKDKmrp2@FTLKW{QHBnSY#uLlozeEuWB
JUkq5{3;=u;DgFQe

literal 0
HcmV?d00001

diff --git a/ti/tas2781/TXNW2781RCA1.bin b/ti/tas2781/TXNW2781RCA1.bin
new file mode 100644
index 0000000000000000000000000000000000000000..f92631f8477b78cd8714e9941fa57d8346323df8
GIT binary patch
literal 868
zcmZQzU`}~`QE(3f10yRCGp6~@`OgSqFu(ybkaY)$dw}=`Tyz96JdJ{N4b74=OLS9{
zGxCd4(^894^O93_i*xcz42TN{CI%M9B|xPWK+MI!$N&sez9S3_{0<BZF*6xh80>+<
zT0n6Y1_oYW&<g-*F$V@l@e>R{oeV5sTNuG?4he{jj6l^KG7Jzg4F;e=5H^<wL>{D%
zD*_@8QVUebz|6=8l;i+nkO)YODW$jo>NgU61F-={g8T+@pau{#L(B#H2`C2k6EIzY
z`~>t51IT)QAja;Nq{@QC;$omQ`2ge=Pym$xF(<?=z@*F!4s)Qtk;0rIK>+AJE4bV6
Mg*7NFImi!V0F@^x`v3p{

literal 0
HcmV?d00001

-- 
2.34.1

