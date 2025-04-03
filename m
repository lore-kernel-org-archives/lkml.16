Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640A7081A;
	Thu,  3 Apr 2025 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667524; cv=none; b=bctzqxzKYyDV8KcjEOz0eyzApXMyQo5gOylFaDfEDR6FoD5ILraVF/lPs2+g75hul+qhg6+3EwATRMCw+RA4ZZQvbNXSPQFIKbH7a46LHcDvBpNKQjrpYwRn0btXn72j8yLI07v7XRm/VNL3T7H8ZcRDW84zEKM3/YDziXxlJUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667524; c=relaxed/simple;
	bh=3jgx9m/tc8Q/3nq8eQJ9H+Pb7YFZEbjz/3rHdIWLlt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MdkCGdEuE2y5M1HX1JHyjTvOGLdYa8wowKnW9IZIlD47YjuuxMp4GN0VMm/PGWPBkxyahl8Gx9i8H9dxJvPGp1hvlx5iE3AEULZRGwXt4mYHfNxAADm7/lTFccWR7RPNfNSy4MsFELmRZ5iLo14b2oaf+rZ38otZYl2J8KbvUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mOguEV4K; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mOguEV4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743667520;
	bh=3jgx9m/tc8Q/3nq8eQJ9H+Pb7YFZEbjz/3rHdIWLlt4=;
	h=From:Date:Subject:To:Cc:From;
	b=mOguEV4KvjPQo8ewEkVvdMIuyU2YpiHN/rTPLbICbi9j9HAIr26DNSfYQClWtb1K8
	 4IJXR60OeMn2Rt4Tldnppu7rDY4DXP/4YDgpIs5Q9OlXkW8hXOBrR2ngQo6dy6tpvI
	 RTRPHnOLeKpBDx4sKADOG8ErTnhMJDmeT4MQ8wYTuNJV3ya61e6PLL7tdy5zLaETj+
	 KJXVFYAtvURgRHZ5bK9DfV6Y3iFQ8/aTwdAcd/pwPFudmPhgRAlYmAiimYBP8r2tgq
	 NdmuQzfze5Di/rOJZzR/Nyq45mbtrKhQlcPn23L39hcNHHoIR4It2Y/Xa7Ut+JnwMy
	 W3bSrZ9RWJ64w==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BB0C17E00A3;
	Thu,  3 Apr 2025 10:05:20 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 03 Apr 2025 10:05:16 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix pcie
 pinctrl dtbs_check error
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
X-B4-Tracking: v=1; b=H4sIADtB7mcC/y2NywqDMBBFf0Vm3YGofWh/pbjQeKtDMbGTtAjiv
 zdol+dyOWelABUEumcrKb4SxLsE+SkjO7ZuAEufmApTXMzZFDzFqqwND3Di2fpp8o6fsvBsBdz
 HLrAdYV8MVa+cl52pkN/M1daUnLMinffeozlY8f6kbDxG6tqA3Svxnjkskf/pkppt+wHpJwcYs
 AAAAA==
X-Change-ID: 20250402-mt8390-genio-common-fix-pcie-dtbs-check-error-13b08e1706c9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743667520; l=1463;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=3jgx9m/tc8Q/3nq8eQJ9H+Pb7YFZEbjz/3rHdIWLlt4=;
 b=DGJlIapdDR+iZz5p9XnvZUlxdGgftQwKuv0ds4ImZlAWeMW7/VvuzhIpiG7xZddEfaFXHyw1j
 KonucL+EtDPCuNnqQE2RQbWmAxj9E8xpnnwyVyHwHgNhU+lh89/iE3Z
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Rename pcie pinctrl definition to fix the following dtbs_check error
for mt8370-genio-510-evk and mt8390-genio-700-evk devicetree files:
```
pinctrl@10005000: 'pcie-default' does not match any of the regexes:
  '-pins$', 'pinctrl-[0-9]+'
```

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 60139e6dffd8e0e326690d922f3360d829ed026b..e9d57f44475b00f19983a968ae113deb4d86bf12 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -501,7 +501,7 @@ &mt6359codec {
 
 &pcie {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie_pins_default>;
+	pinctrl-0 = <&pcie_default_pins>;
 	status = "okay";
 };
 
@@ -874,8 +874,8 @@ pins-rst {
 		};
 	};
 
-	pcie_pins_default: pcie-default {
-		mux {
+	pcie_default_pins: pcie-default-pins {
+		pins {
 			pinmux = <PINMUX_GPIO47__FUNC_I1_WAKEN>,
 				 <PINMUX_GPIO48__FUNC_O_PERSTN>,
 				 <PINMUX_GPIO49__FUNC_B1_CLKREQN>;

---
base-commit: 9eb5f358d46764a8be92f04a7b4340366f715c5b
change-id: 20250402-mt8390-genio-common-fix-pcie-dtbs-check-error-13b08e1706c9

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

