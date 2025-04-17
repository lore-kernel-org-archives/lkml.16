Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C5D1DF260;
	Thu, 17 Apr 2025 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744932772; cv=none; b=i7c0r5m7jJsx/UQ314LLXENjt+xpkaRpzJ2JfD4un49gPb2gg2wBLuoFRyCqRLQMgM8Nywr4MLnTkYtX+elHZjI/vkrRn7cei2rr5Dw/lY8LxCm5GjCS9AaCqdoy5mUKI+y61wRW9W0mAjGyoffhkvfaqY4tsv4uu0PFlNt6W1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744932772; c=relaxed/simple;
	bh=NjeDRiJTwUo1cP3hkUv6xDm1gfr1mj3fB9ermM3sWkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mSYw/+bmSuVeHS4GnXamFBjIx/U+6A6we4b48Q8TClUjIrCjQH5RHv8mVg42hnslsdi0rS1dt13MTTdY8nLz+KzsUy92SYfc6nPNafLzxoJW2e8V6Ydue5Eb6Wt9qxobty6dvAt1f+Gbn61bHOsFziU+Ay48Fxd4OvmcPyqBGq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OW6CQJvs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OW6CQJvs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31C8EC4CEEA;
	Thu, 17 Apr 2025 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744932772;
	bh=NjeDRiJTwUo1cP3hkUv6xDm1gfr1mj3fB9ermM3sWkI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OW6CQJvs7mRM8Ph4luHzB5TaTF/gDC0wIDwXS+GHSid/HWyY1ZfwUKwWc1BAZgOIq
	 Q3o98pAK+tt/DmxJPBEZuy+EXseDivse2c8XsEUTc7pL/h+VGzVC3FsJqi4FbKvhAA
	 UKA2uDXMHQOtT9j2/8Ege7CcHaLs1ezhtfZCC65c3oBV60Qo614sRF/bb9ajKT0Joz
	 cpuLFja2dsor6zIobA9IS3EVzklgprGS9Dzn5QLu/7S64VbtkNoxDYGbwAcJCcPW3g
	 8hjN65fsgewJ7aAuetF07k+Nb7judNAoXsaBp93TA58OfR8qE3Pe5ADfIvHQIrAa/k
	 8CgSu3zoYTy0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3D4C369C2;
	Thu, 17 Apr 2025 23:32:52 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 18 Apr 2025 01:32:49 +0200
Subject: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
X-B4-Tracking: v=1; b=H4sIAKCPAWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Nz3fyCKt3E0pTMfF0LSwMLE8tki6Qko1QloPqCotS0zAqwWdGxtbU
 AXPuJz1sAAAA=
X-Change-ID: 20250417-opz-audio-890849c8bb2e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744932771; l=1299;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=k/eQQFQjUWyBWBOWbfy/ABZzzwLp3ynUUvGy69783PQ=;
 b=XFDURnfsrz3fEywg3lhFqDKzoRTAi/FcZG9XBdQ96YdDa7CZFBotwe5QPeCWFtnsRKebQD/SK
 u4ZHjkpmgcCB6noff2Vt0VoZe7aulUZBUyOZs83ORW4NTGoV7Puxm/G
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Line out playback and microphone capture work, after enabling the
corresponding ALSA controls. Tested with the Orange Pi Zero interface
board, which is a (mostly) passive adapter from the 13-pin header to
standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
microphone).

  https://orangepi.com/index.php?route=product/product&product_id=871

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
index 1b001f2ad0efd2e77218742efe6d8edfdd18a816..d65ede3dd6ed1206248a39c91e46065684e7ba29 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-orangepi-zero.dts
@@ -112,6 +112,14 @@ wifi_pwrseq: pwrseq {
 	};
 };
 
+&codec {
+	allwinner,audio-routing =
+		"Line Out", "LINEOUT",
+		"MIC1", "Mic",
+		"Mic",  "MBIAS";
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpux>;
 };

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250417-opz-audio-890849c8bb2e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


