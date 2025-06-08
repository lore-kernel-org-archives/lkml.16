Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DE1D27E;
	Sun,  8 Jun 2025 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749377848; cv=none; b=b305FdU/Td/oyODAZszC3E47WKBQfj2NykREMLHx8oXGXJ88SEAzA3Oey2VD9yPj0wP9F+9GbTJoZfncsH6QydvQn3ciEN9iL271CNPGKrQ9KX9Ghrh423+P27xkJp5nI+rB3PJln6j5l6uvkmZIFIc2yQ1RskIw34ozBi3pWUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749377848; c=relaxed/simple;
	bh=2b8o+zxBFf98Fh2nF79Eg/RK3gHofdF1W+LiLn9zd4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWqwFHeV0B3NkyT2UZF53nmC0OvMgb/2q5sRhxJ9OmIS2oHHDxZcpcVsV7P7Zcnea5Sq3mnhpVyTq/z3iacU3tgtjFwOVc6BasIhqMruUONvvqdEv0orcGIp/XZUhcdHk6ADBU6rZvj4+wF1ia29fh/bV5DhZj+DmmdNoU6w1h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=dbMRLagZ; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="dbMRLagZ"
Received: from localhost.localdomain (unknown [178.69.224.101])
	by mail.ispras.ru (Postfix) with ESMTPSA id D0D55552F529;
	Sun,  8 Jun 2025 10:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru D0D55552F529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1749377836;
	bh=qJ/Aafi9+JaeI4X0yNJ7uopOYlLx+HWqhUHFUXUoH9g=;
	h=From:To:Cc:Subject:Date:From;
	b=dbMRLagZJtYg3UulooFavnrTU5DC0mr6ngHdvNumGKvvFCvyaGEZVkVHngNM5cGk8
	 MDNIUBL1ZSI1IiTOCCJpnm9OJsJckF9G+X5CIotp6cnNTGAYlvxEFFB52vDs7Zc/HE
	 mJguWT4ULe8Gx1hbTt9HRFA+pjRpD0JhZJKSRQbQ=
From: Artem Sadovnikov <a.sadovnikov@ispras.ru>
To: linux-sound@vger.kernel.org
Cc: Artem Sadovnikov <a.sadovnikov@ispras.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] ASoC: hdac_hdmi: Prevent buffer overflow during pin port muxs creation
Date: Sun,  8 Jun 2025 10:17:09 +0000
Message-ID: <20250608101711.2088-1-a.sadovnikov@ispras.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HDA Specification doesn't enforce any limits on how much connections can be
provided, other than amount of bits, which is 8, meaning total of 256
connections is possible, while HDA_MAX_CONNECTIONS is only 32. This can
lead to out-of-bounds write when copying texts.

Commit 15b914476bf2 ("ASoC: hdac_hdmi: Use list to add pins and
converters") also mentions that 'future platforms may have a different
set of pins/converters' which might cause this issue to arise somewhere
in future, even if it doesn't arise right now.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 79f4e922b547 ("ASoC: hdac_hdmi: Create widget/route based on nodes enumerated")
Signed-off-by: Artem Sadovnikov <a.sadovnikov@ispras.ru>
---
 sound/soc/codecs/hdac_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index d8e83150ea28e..92fe199941d9d 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -974,6 +974,11 @@ static int hdac_hdmi_create_pin_port_muxs(struct hdac_device *hdev,
 	int i = 0;
 	int num_items = hdmi->num_cvt + 1;
 
+	if (num_items >= HDA_MAX_CONNECTIONS) {
+		dev_warn(&hdev->dev, "HDMI: too many connections!\n");
+		return -EINVAL;
+	}
+
 	kc = devm_kzalloc(&hdev->dev, sizeof(*kc), GFP_KERNEL);
 	if (!kc)
 		return -ENOMEM;
-- 
2.43.0

