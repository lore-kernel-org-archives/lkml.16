Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A6328E8;
	Sat,  8 Feb 2025 00:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976143; cv=none; b=MVnds/4GcErSUlP+EwaVAMNBYS2QNQnji5C8URvWQGTh6Q6ePsRIgyhF64Pg0vlRlLZa/00ZuGCTm6DY1ooV62Pt1oIU94hYYP7IvI3GcCGVOP3hpANzSIhwO3zXXlq2DDrgOBq1nx9xFL0EoTr5xmAHpv9vklzFgoWtJAO5hJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976143; c=relaxed/simple;
	bh=eO3QeYOFBUhtV9jmlffq3n48AjIICCnR+YrJX9zLNAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HAK7RXWLyefF1Dv4HQgprVwR7IZGbe2d8NkpfHGX9JUY6YLY1Jj2RLzw1lLo94uGkwTodQP2v6SjjkjgCGSa80D0rEt20/VVfvsYvfHLigN9xP8ZfTSYhGIKPkT7AWOXLL8WhqrXFXTTR8FnfSOgjsxA+eSV7+O+PEDJ8GrJ2EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pg7wUz3/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pg7wUz3/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96146C4CED1;
	Sat,  8 Feb 2025 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738976142;
	bh=eO3QeYOFBUhtV9jmlffq3n48AjIICCnR+YrJX9zLNAM=;
	h=From:Date:Subject:To:Cc:From;
	b=Pg7wUz3/uc/51tBzXp6RkPg8xTH59Ro9j4Hyf+r94uxs5Cc+kavpL18o4R2GYxXzz
	 EQmmGDoDmHIrc7fDVHa/9hex0ZVnPtcEeGywAG/icF+iuXJJkI9gzS0UqTfnlC9dsQ
	 OQJ7SAxrYT6k4dXs1FzA3rmlwHW3BcSRCbhOTEtelWOy9RqmOHIqCR0iUj3d1ev/kR
	 WFJEeBA9sbqfCxi6VNkKB6ykCxcKuFuuLeyn5Otaac67bnCmNe2L4393VIad4OeSok
	 +DQg8J1rAZuefrjGHLvIIdQaqNyR3LmuCG5pwzB3z2yVYHe9RVoghy97NnB4kCYqHl
	 DWc2CsZuddJ/w==
From: broonie@kernel.org
Date: Sat, 08 Feb 2025 00:54:35 +0000
Subject: [PATCH] ASoC: tas2770: Fix volume scale
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-asoc-tas2770-v1-1-cf50ff1d59a3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEqrpmcC/x3MMQqAMAxA0atIZgsxKBWvIg5tjZqllUZEkN7d4
 viG/19QzsIKU/NC5ltUUqzo2gbC4eLORtZqIKQBCa1xmoK5nJK1aDZPA2HvLY8r1OTMvMnz7+a
 llA+eLUk7XgAAAA==
X-Change-ID: 20250207-asoc-tas2770-fb25204b7e8d
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Hector Martin <marcan@marcan.st>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UwEFTFzaQ8FL906Fl11BUh9LZxQsvsjEHgm2uogVoyI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnpquLtugBeYOh077dtCWn+AtlCChkPMylfSqkk
 +cnPY2tlICJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6ariwAKCRAk1otyXVSH
 0C/NB/91CxzrjFCziKBPGmkzVpsLhIODWnMq/Q5oA4k11yhQvTjXocuK/P1pUmVIfmkyZK2Pkfi
 1pNMrYd3+e8JY4AiPiji1nnsGxOVKlJnw54du9/kYSEanGAfXomMeGOYAzVqxQ3QHj76aYuZjqr
 jzk+RAuzN+lcdnjfZ4bP21posrKl4z6UbzD/lvwnj5VUcNmwpC5qe5WTZhJGaJd3s8gGznLG6T4
 iT4uQxLoABNskuktiIWQPR6pnNWrSU+PNqqVbdcFgSwuttKjIde3SCaQWYF0vRN5j+enwWZBH3Z
 T/U0xNIDmv+sapYZ36Ma1f7TNozroSRMWZ0om48fqdTsaQGz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Hector Martin <marcan@marcan.st>

The scale starts at -100dB, not -128dB.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 9f93b230652a..863c3f672ba9 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -506,7 +506,7 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 }
 
 static DECLARE_TLV_DB_SCALE(tas2770_digital_tlv, 1100, 50, 0);
-static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -12750, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -10050, 50, 0);
 
 static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Playback Volume", TAS2770_PLAY_CFG_REG2,

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-asoc-tas2770-fb25204b7e8d

Best regards,
-- 
Mark Brown <broonie@kernel.org>

