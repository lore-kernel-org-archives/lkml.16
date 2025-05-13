Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CAA2BE7B1;
	Tue, 13 May 2025 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152004; cv=none; b=oI04mRplrkMCW3ySSjI62YaE0gSrwjV3cf7+l/7R3uuG8yKXhhridReLW3X0VgdsEy13/0BSA496SbJ71YJ9fhps7HUdRxZ8vEelhCyHhWoQtpGK0seY+hS5yFPcxJH/8jBs4hUXVohNI3MfxkVoWzU8QsrYXYiYqyOdTigbsbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152004; c=relaxed/simple;
	bh=mohnBTgRq5hJWAWvTrGhcgzyELjLPTMvvBK794EokQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X0dbZB2KWYuj+Zg+wvNZxVpBrIG4Qd2d6VUmQZac559zOnySllWz2se/sELvAFX0v25JFnd4Xfh1m7qg+TxSYQPQpb6CKSEkkWYvtyR8IfXHaes9zInAiMslUuWsy0EcwMXp3aMGOdx31s4eoZmgw1bA1WH8LgsHOr93ANpGLvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T+6grY7a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T+6grY7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747152000;
	bh=mohnBTgRq5hJWAWvTrGhcgzyELjLPTMvvBK794EokQc=;
	h=From:Date:Subject:To:Cc:From;
	b=T+6grY7a9XfRcjaFcnPMsUcs5C6Z9b3mtTVCsTePn04YoYMG7E/xf+SCeJCuhc1W6
	 /WgbF5sNpeO7qBqxBwcJ6rGGg5eNyuH7KE3NaiesSpscGRuujV7Gld6nvZL7I2HW39
	 FM6ANw7tULThKMndMSgmA4059gGj8joRhOuaHINIXVS8bXE60O13h90/MIxcUc3r7M
	 Y+9xaEeSgUtazEZGGjnVBrZqFxXILE2gAiG/GCF0TufU1pIhkTE7ypKDIQ+uZvQNkE
	 QBJOyZT1taAT/VIFt7jzNqqU9+8/2Z0JR03joJcc9CtFPni3JLaCEuZlMyhmoT/NyL
	 b+eca/gbUm5iw==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7700217E0858;
	Tue, 13 May 2025 17:59:58 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 13 May 2025 11:59:53 -0400
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Describe CPU
 supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250513-genio-1200-evk-cpu-supplies-v1-1-6f0066bb93db@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHhsI2gC/x3MQQqAIBAAwK/EnltYNaH6SnQI22opTJQkiP6ed
 JzLPJA4CifoqwciZ0ly+gJVV+C2ya+MMheDJm3JKoMrezlRaSLkvKMLF6YrhKMk2LrGWKfJzG0
 HZQiRF7n/fRjf9wNg0uZxbQAAAA==
X-Change-ID: 20250513-genio-1200-evk-cpu-supplies-8c435c203d89
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Ben Lok <ben.lok@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

The Genio 1200 EVK board has the big and little CPU clusters fed by the
same regulators as MT8195-Cherry boards, so describe them in the same
way as commit 17b33dd9e4a3 ("arm64: dts: mediatek: cherry: Describe CPU
supplies").

This prevents the system from hanging during boot in the case that the
cpufreq-mediatek-hw driver tries to probe before the drivers for the
regulators have probed (which happens when using the current defconfig).

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index be5e5f339e811728e91b1ffec45ada25f9b0208b..a71f1b70b0fd61792ac29e9568c30f723ed7c162 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -179,6 +179,38 @@ wifi_fixed_3v3: regulator-2 {
 	};
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
 &disp_pwm0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&disp_pwm0_pins>;

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-genio-1200-evk-cpu-supplies-8c435c203d89

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

