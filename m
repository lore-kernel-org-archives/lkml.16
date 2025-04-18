Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768252A1C9;
	Fri, 18 Apr 2025 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008122; cv=none; b=aJZLixeGeMaKiLYtQec5YHvI4s494gj+2s+dlNBjnB6p8mPBNELUvZOFq8O4zLEphFiAVwnolV1OGRDbZQFFYgynBHGD2Mo5oxXTAB4JI2XT/K05HuIJJaeC8OTc1UUJusP8sYmrs7fnhDbwP+tDV18dUTH+dXPR6KlvwE0NjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008122; c=relaxed/simple;
	bh=RuioFoYnoKWbVRePkkXFNsFVrOmVWmnElk3I3DxzO8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tKsp3JdvRGE7mYLJdQy2i0AwMwqTk2fXzRM8BiqNhpdI+p8BK23a2xwvPKwaw92CdbRCLEj3xfG3mwpNpLrbyVnTr78p2CeGxkeUZeTecmddJR2PsBK8tiv0IrQE3uQv5sqBf3ErWCWllFp8HTu0p4kWAvAx2W79IlhUTym9Clw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oawa8Hfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oawa8Hfn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51D59C4CEE7;
	Fri, 18 Apr 2025 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008122;
	bh=RuioFoYnoKWbVRePkkXFNsFVrOmVWmnElk3I3DxzO8Y=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oawa8HfnYofsd2nLXgjSpZShip+TlWRE+b+RYt7dlSygCsxVlYuuoXzHBIG5Uj1+E
	 sOHixzhjybWwLiklj9AHOfyU+mp9o8TP+YhxtL2Vu6ikf0TvuwdCIRWbV2IIIaEFW2
	 4rrNs7uzAeLKReQEbz/u1ECXHsR+7sUPZhjUClGniWrFhwzA8wshc1988sRJrYRAxq
	 5DUqvoOwjlswRYS4r4SB/zLr+1qjnWhxpiU+Be85Q9oQ5bNS1oo2vxxxLesdhFZGNa
	 3xyMxjaLciqV30gVibj5GsD8ep2E861CS0iOghlwVpbWlAnnRuZiqQgyED79GWETmS
	 EdnGeJe8lHQDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A98CC369AB;
	Fri, 18 Apr 2025 20:28:42 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Fri, 18 Apr 2025 22:22:04 +0200
Subject: [PATCH] ASoC: wm8998: Add Kconfig prompt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250418-wm8998-v1-1-21c4bead9cd8@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAGu0AmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ML3fJcC0tLC92U1LTEVHPjJGNjIwMloOKCotS0zAqwQdGxtbUA6EN
 tIlgAAAA=
X-Change-ID: 20250418-wm8998-defae73b3320
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745008121; l=825;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=XALZ1vwO3j84k8/8tKGcIPipHuf/haqg80zA+h6cAEU=;
 b=m8KI2nZB1kokmZ/pFqGBnA6F17BLosVjzj+zt8/Fxvr5ikwtcS6hhTZ9VNWofL/DBsr+Z9pn9
 AKqhs4dg9EUB/RRqdR4kFtSE1UMbEZ61MK8g3lgZcSkBX0Mu5cw9Dnh
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add tristate prompt to allow codec selection.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 40bb7a1d44bcfa4c386f2eba0f475efeeedf1bdb..9ecc4bb7f75ff9fce87970d2e46ace72444e55b4 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2479,7 +2479,7 @@ config SND_SOC_WM8997
 	depends on MFD_WM8997 && MFD_ARIZONA
 
 config SND_SOC_WM8998
-	tristate
+	tristate "Wolfson Microelectronics WM8998 codec driver"
 	depends on MFD_WM8998 && MFD_ARIZONA
 
 config SND_SOC_WM9081

---
base-commit: 7e74f756f5f643148ca5537bf2fee6767e4b0ed9
change-id: 20250418-wm8998-defae73b3320

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>


