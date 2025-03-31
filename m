Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3489B1C84AA;
	Mon, 31 Mar 2025 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413187; cv=none; b=O5Py9ofy26ssww1rCp6RDvuJGZsthflAYH4V+WwLRZPjtNacR1m6UYmIWqaOKly3cqTuiMrZQNZ6Ufs/0atBevDav/b1RtqV4RgErg5mr2q26rMItrVtZPmgYEQZuzuSlvF6QM7nSedCo+BH9jEI+7pUTLCQdm+zAwTilIZJx08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413187; c=relaxed/simple;
	bh=V0QnODFma7S+d+i8t9LUBD0xftnJaXWgg/npE55QrOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iw7tOBEpLEXoKkpZNjnPlmO1UjAlFylETaPi+gL20KYPoVFG3gy9bERuwOieZRCtwBU1sTrAEIWoZqJKtQdfNd58C+7XGLPF0HapejptXJL21jwrykna0gt3d+9gINiGCYVWwupUIWWUlAwXae9pHurwQUNEVemMbTlnoOkDB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XjRCeMaG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XjRCeMaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743413183;
	bh=V0QnODFma7S+d+i8t9LUBD0xftnJaXWgg/npE55QrOk=;
	h=From:Date:Subject:To:Cc:From;
	b=XjRCeMaGKoIibd5ArzvYY4UhDyCmc+Kj4graExuUIoRBv11nQU/oDhdlNiurBiXLI
	 Ycb7NLunmgbgTlsUuncORlnS2ugQVPl3s7SY0dbtFwaNVkAXNqEYDfUcnyKyOegEfl
	 F7e5e993KjP8p2/NEK4Ok8XXByFdKLfAU/KtkxniJOj4jWb4ZtLg4djBAnJPuC9R1c
	 isdY2zmd4Ti8UeAST1RR1WG/lKG6OY69eOgyLyJSysXLOR8yge1qQCe3JGmGSV/d8s
	 1DZcMJ/ibVOCN20YyDU694ylCyx169opo2NlicD8pelofnp+1c59b7iDDvhy82YXb9
	 1WGDAndx+MVEQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85D7917E07F3;
	Mon, 31 Mar 2025 11:26:22 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 31 Mar 2025 11:25:52 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJ9f6mcC/yWNwQrDIBBEf0X23AU1DSn5lZJDNNt0KWqrmxII+
 fdKPb5hZt4BhTJTgVEdkOnLhVOsYC4K/HOOKyEvlcFq2+vO3jDIC1eKnLA3Gget8cE7OsGFhLz
 UOdrBGO+8c5auUI/emWrnL7lPjTN9tuqSFoKbC6FPIbCMKtIu2Hydgek8f9JfStGlAAAA
X-Change-ID: 20250328-mtk-genio-510-700-fix-bt-detection-2711cbcbb2e4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743413182; l=1967;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=V0QnODFma7S+d+i8t9LUBD0xftnJaXWgg/npE55QrOk=;
 b=8e0zsYdWGNiu/yvRlNY1uOiQBoNeYQPzIvLrdLdob0CYYVrRaPu9O2HT1NPa0DBmndQ9/SS0J
 5ne4ZxT0a/8DLY94DhWT3DqJ4Soll0EGLzeupDpS88N3h2aAvP3IozF
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
one but has two ports: one is routed to the M.2 slot, the other is on
the RPi header who does support full OTG.
Since Mediatek Genio 700-EVK USB support was added, dual role mode
property is set to otg for ssusb2. This config prevents the M.2
Wifi/Bluetooth module, present on those boards and exposing Bluetooth
as an USB device to be properly detected at startup, so configure for
the ssusb2 dr_mode property as host instead.

Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
I've tested this patch on Mediatek Genio 510-EVK board with a kernel
based on linux-next (tag: next-20250331).
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551dfe7272f242345138 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
 };
 
 &ssusb2 {
-	dr_mode = "otg";
+	/*
+	 * the ssusb2 controller is one but we got two ports : one is routed
+	 * to the M.2 slot, the other is on the RPi header who does support
+	 * full OTG but we keep it disabled otherwise the BT on the M.2 slot
+	 * USB line goes obviously dead if switching to gadget mode.
+	 */
+	dr_mode = "host";
 	maximum-speed = "high-speed";
 	usb-role-switch;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;

---
base-commit: 1c4df70331c0dc7f82f724166575c16931ec66b3
change-id: 20250328-mtk-genio-510-700-fix-bt-detection-2711cbcbb2e4

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

