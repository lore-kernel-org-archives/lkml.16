Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E66025776;
	Tue, 15 Apr 2025 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724107; cv=none; b=uC09ivnc9MOyCvM8dOQE+XNtrJwHo0jotqxTPyAE5T6AfdEQI3Tm2LwmS+/wLn+VOzR7s1ePNxYqvhaOZATmZFCOYieFzueAJJwHdCVXTXqomRgnCbhEFt9Msbi8EFTpjXRDC5wYZ3vmHnjMnD1PwQz2YOJe7jqIC9gXxBPDza4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724107; c=relaxed/simple;
	bh=pprMqPez/8Jyc3i4Z+10XDj1QJQemlqTj9hsKCg5+Rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HXG/22P0HIF1EYcQWSaPrKH8XGmHUzf5yKaQL+2pe2A7FNHH5oPhkEbyf4fwXt82RehYkxXt0X5is8Q6k7gn4Tmi89l6PeSAVlQsg6LwImqVcE9vcT2I7KhJ0raqzwT+RberExb/w1gZrV7DtzWjbBCgWRHKBHBgiyueIKSRyiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVc68VCC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVc68VCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE84BC4CEDD;
	Tue, 15 Apr 2025 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744724106;
	bh=pprMqPez/8Jyc3i4Z+10XDj1QJQemlqTj9hsKCg5+Rg=;
	h=From:Date:Subject:To:Cc:From;
	b=YVc68VCCp+TyKnlauoCVe1PpRTMQESUBG8TZpx7VSv8mXVUmBEcO0qYZ0m8oheo8S
	 Jn3tkwEKRFhh8VYk1HM/h99RFLQW35qD4tsC88h4fl49QNhevp+ymRb4Jgc+81DTv4
	 8H45pjfHG5Is55MHAhXFsj00GZCJqGflvzo2LUtaPaLK4jbl9nDAlGsh8LPKiZBu3g
	 E8hus4bBa7w73VjslqgGZ9dywsU0GFU7yrOCxIEURw3+Nej91tKOOr1S0mSeekB2ie
	 6ON6vxH5MjdFQbzCOhbZZDeGOeZ3D6PqiuLGhRw2J2rVjz+xxxFY9hQTUp27XW4xv3
	 P/IL88RWQGmYw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 15 Apr 2025 14:31:51 +0100
Subject: [PATCH] staging: bcm2835-audio: Validate values written to
 controls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-staging-bcm2835-alsa-limit-v1-1-4ed816e9c0fc@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMZf/mcC/x3MQQqEMAwAwK9Izgba2oK7XxEPUWM3oF1pRATx7
 xaPc5kLlLOwwre6IPMhKv9UYOsKxh+lyChTMTjjgvHWo+4UJUUcxtW1TUBalHCRVXYM3k2W27k
 x9IESbJlnOd+86+/7AVfk2x9sAAAA
X-Change-ID: 20250414-staging-bcm2835-alsa-limit-542d1e8f30a9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pprMqPez/8Jyc3i4Z+10XDj1QJQemlqTj9hsKCg5+Rg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn/mCHheEaIqvepD8vxtfR73p/5HvsDsou0ZDAJWO6
 8aqBGvGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/5ghwAKCRAk1otyXVSH0CzsB/
 4ntr+ThqGT8N9GDKVtVmPH1MwfPfQMDniJEv+cyVMx1SuRo5mG2CIF0LL8Pq+y6QmIi5W7RU5XZfDQ
 Td/0SXcm5P4krn6P4PP8LgfgAb2qU4VrVHO2gSR+BuUAiqieuddKnPtom9DbKxdk+ZCFU1csZl29br
 MeCCcGv6beW2YD34b9pWHZoiKsTHi46GgWqu+CjPg5D6YkrsfWoZvBij5tiCFn1VRIBhu3SqlkFmiL
 LfZ8uFcU0kSzV/SD5IZ6JfL6PXp1HeMP41S3V0ogDR7RpY8RSJNtmLoRS+eba4AIZ5tLzDoo+QvPl6
 dFdMd3BepbcO/xDPIApMQIzAbZKCqQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The bcm2835-audio driver makes no effort to validate the values it accepts
from userspace, causing it to accept invalid values:

# # PCM Playback Switch.0 Invalid boolean value 2
# not ok 5 write_invalid.Headphones.1
# # PCM Playback Volume.0 value -10240 less than minimum -10239
# # PCM Playback Volume.0 value 401 more than maximum 400
# not ok 12 write_invalid.Headphones.0

Add validation.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c
index 1c1f040122d7..7d0ddd5c8cce 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-ctl.c
@@ -71,6 +71,7 @@ static int snd_bcm2835_ctl_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
 	struct bcm2835_chip *chip = snd_kcontrol_chip(kcontrol);
+	struct snd_ctl_elem_info info;
 	int val, *valp;
 	int changed = 0;
 
@@ -84,6 +85,11 @@ static int snd_bcm2835_ctl_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 
 	val = ucontrol->value.integer.value[0];
+
+	snd_bcm2835_ctl_info(kcontrol, &info);
+	if (val < info.value.integer.min || val > info.value.integer.max)
+		return -EINVAL;
+
 	mutex_lock(&chip->audio_mutex);
 	if (val != *valp) {
 		*valp = val;

---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250414-staging-bcm2835-alsa-limit-542d1e8f30a9

Best regards,
-- 
Mark Brown <broonie@kernel.org>

