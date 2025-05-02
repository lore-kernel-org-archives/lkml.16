Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6352571D2;
	Fri,  2 May 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200592; cv=none; b=Uy8Jwab9ZyM6WZD/MbT+5AWD6nE7Bu/NW6+BgXl7Ko3ej1akM6DMI0aHtKaqqSdgZpe0gfutoNQPoxoXS+2T/kmHRt8pbttgPm+3GQru3klz2ZY7Kd+L+u2FuGbptM63miGdqFBkVSy9kUNadVLZiJpMToxtvV5B1JcZ5p74H9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200592; c=relaxed/simple;
	bh=eBAnraOpFs24oa8cyCRi8zE49i9v3WmI83Gfc+9VYrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Q5eYWRaNjx/ldUN1T99GLa7xLYMG3qBG0fTLz4XV5ARkAPPC4Onx+2MVuS4X/WbFRlQUuQuUcHySQL9vEB5WsmEUd7IveKCW3OoIvJddjDrCbl1A0LK8ibafCSPjrEfQmRgz5ijpi+9ulq8NqTz9pJ/8Fad6GybeRdX9Alh+MKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CcbBc+cP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CcbBc+cP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746200587;
	bh=eBAnraOpFs24oa8cyCRi8zE49i9v3WmI83Gfc+9VYrU=;
	h=From:Date:Subject:To:Cc:From;
	b=CcbBc+cPJUJUUYJy1zR+8xwwsmi5CT00hhIA4U6hqXH+Jtp2mTuEpDbP5Tz3y0hRY
	 EMXGwA+s1tLxbLSOqQrjIdLLGYcTtq2o4v4fH3KVMtG5lGTn+Adggtj56bVYD6H8wo
	 38YMRcsqg1qOltyDqaqGQsbV+cP3q76KsfsYqIw1QO0ON/8a1zft2wHwzENfnLB6to
	 i12LyVP4O02xuvZ78B9xspba73Kt/iVYLEa4EfJfNw1PgmYUN4ROY8SnmMpjsXf+9Z
	 28TpGBOpPbpcL+350f0W5w5Ntrr2TBomlOmLHhrvZyGrM7ZNBXuLOMMBTVuIBKOYvP
	 HUiDSOAHh+mvQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2727B17E0858;
	Fri,  2 May 2025 17:43:04 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 02 May 2025 11:32:10 -0400
Subject: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHnlFGgC/xWNQQrDIBBFrxJm3QGjGKFXKV2omaYDGsNoQiHk7
 jXLx3/8d0IlYarwHE4QOrhyWTuMjwHi168LIc+dQSttlVUac5uMdSi07Mm3IvjhH80YS95845C
 o9i2XwyccJ2dcMDaGaKAfbkK3fMde7+v6AypRQfJ8AAAA
X-Change-ID: 20250502-mt6357-regulator-fixed-compatibles-removal-16737b35cbc3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Some of the regulators in the MT6357 PMIC dtsi have compatible set to
regulator-fixed, even though they don't serve any purpose: all those
regulators are handled as a whole by the mt6357-regulator driver. In
fact this is the only dtsi in this family of chips where this is the
case: mt6359 and mt6358 don't have any such compatibles.

A side-effect caused by this is that the DT kselftest, which is supposed
to identify nodes with compatibles that can be probed, but haven't,
shows these nodes as failures.

Remove the useless compatibles to move the dtsi in line with the others
in its family and fix the DT kselftest failures.

Fixes: 55749bb478f8 ("arm64: dts: mediatek: add mt6357 device-tree")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 5fafa842d312f3b01e7d71ddc04ef48ca52bc89d..dca4e5c3d8e210c1e118539153e77e2822066da3 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -60,7 +60,6 @@ mt6357_vpa_reg: buck-vpa {
 			};
 
 			mt6357_vfe28_reg: ldo-vfe28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vfe28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -75,7 +74,6 @@ mt6357_vxo22_reg: ldo-vxo22 {
 			};
 
 			mt6357_vrf18_reg: ldo-vrf18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vrf18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -83,7 +81,6 @@ mt6357_vrf18_reg: ldo-vrf18 {
 			};
 
 			mt6357_vrf12_reg: ldo-vrf12 {
-				compatible = "regulator-fixed";
 				regulator-name = "vrf12";
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
@@ -112,7 +109,6 @@ mt6357_vcn33_wifi_reg: ldo-vcn33-wifi {
 			};
 
 			mt6357_vcn28_reg: ldo-vcn28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vcn28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -120,7 +116,6 @@ mt6357_vcn28_reg: ldo-vcn28 {
 			};
 
 			mt6357_vcn18_reg: ldo-vcn18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vcn18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -142,7 +137,6 @@ mt6357_vcamd_reg: ldo-vcamd {
 			};
 
 			mt6357_vcamio_reg: ldo-vcamio18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vcamio";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -175,7 +169,6 @@ mt6357_vsram_proc_reg: ldo-vsram-proc {
 			};
 
 			mt6357_vaux18_reg: ldo-vaux18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vaux18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
@@ -183,7 +176,6 @@ mt6357_vaux18_reg: ldo-vaux18 {
 			};
 
 			mt6357_vaud28_reg: ldo-vaud28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vaud28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -191,7 +183,6 @@ mt6357_vaud28_reg: ldo-vaud28 {
 			};
 
 			mt6357_vio28_reg: ldo-vio28 {
-				compatible = "regulator-fixed";
 				regulator-name = "vio28";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -199,7 +190,6 @@ mt6357_vio28_reg: ldo-vio28 {
 			};
 
 			mt6357_vio18_reg: ldo-vio18 {
-				compatible = "regulator-fixed";
 				regulator-name = "vio18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;

---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250502-mt6357-regulator-fixed-compatibles-removal-16737b35cbc3

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

