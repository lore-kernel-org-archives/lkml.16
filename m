Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E46433B1;
	Sat,  8 Feb 2025 01:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976629; cv=none; b=Iz9XidlAd/46+fy75BN6YNCEWTJ6a1DR7wDGt+0SuoEL72awrfOd/NzfiVLiGxycrxsLyJd+wUlVRI1Yiwu6yLEvoKia4PMs9mh5i/0VlYHip6CVp7H2aaWVIqV6prcTq0mUVz1t4OOacc8QKGBvvvmbk8kyamR/I6kXBxvPty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976629; c=relaxed/simple;
	bh=CSJEkYoSHgw6A84OR8krr3l1atnHur4QgCGXV3vANc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8OoUw6qBIvDaOd7J91DlhRGSjfYNNtVM0bRX+QWs6KMs+g932RTZ957jd8A7Gc+6Nsbrsq5U9q248Tkvj5gtL6ZWoU0J1OYSsd8anKmKPFr/fv1BBztlcpYGAdLZk4lLvO6Bf9pNL4ioRUBqfWNit4c6aEpQZCFrAd/khTLuQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIMg4Vyx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIMg4Vyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE58C4CED1;
	Sat,  8 Feb 2025 01:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738976629;
	bh=CSJEkYoSHgw6A84OR8krr3l1atnHur4QgCGXV3vANc0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FIMg4Vyx2VctynyIwBv18ADfdQFQSpFJ4y/o9e3/JjezrZdFaY5/F1jWot+jG76L0
	 /8eAkVqV48Zq8k4h4M4yyvE0sxw1wJP6L+iFCeMzm2b50jePx//SG6DqRDnAbkxGqC
	 qHeuPasGU+lw9x61cKyEHfHj2rk1M+gQs8+dDJDkJ2+F0gDsbKq2S3o3QLvyo08VbV
	 o/pbIYgqMtSqv3zH44qKSXAMh4EXG5VjsP2V0idVu71wPJ7x7q3LPSleHNUuMUV8gd
	 ONl/pltNWqDzVDi+GVV6VQ0tc05YfLMDbYHxEAHrKFgWS3pfWDd0F6LsWGSojqcJGO
	 A/pwSprNO37HQ==
From: broonie@kernel.org
Date: Sat, 08 Feb 2025 01:03:27 +0000
Subject: [PATCH 4/4] ASoC: tas2764: Add reg defaults for
 TAS2764_INT_CLK_CFG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-asoc-tas2764-v1-4-dbab892a69b5@kernel.org>
References: <20250208-asoc-tas2764-v1-0-dbab892a69b5@kernel.org>
In-Reply-To: <20250208-asoc-tas2764-v1-0-dbab892a69b5@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dan Murphy <dmurphy@ti.com>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=648; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QB5fTSuWQRpBnz3TTt9b1t0jCO37QmgQ/WwnFRiQkBQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnpq1jzB3C18ei2mHXnLmDEgPbn3b0h3Qr/S27H
 qFTeJ5wmDyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6atYwAKCRAk1otyXVSH
 0NXPB/4hP+54x8ywEjRgl75Ek2u0RmyrsCz/6qm8/a7B9jJRhfKM/iLG+Bp3Ty4aqDBYk83TiUH
 FCx758Hx2JLR0pUphlEO8lYM/lC3v2NpHPCvOx9pcoi5KFTyhZ9qx9VBpLJoBvBowIoGZLuOphk
 4FkbuFyL4YLh3LQ8xETyMXmrr/UR1P9A5aCiiCyp1v/shpZn/hzKd/ly+fRo9FT64/U6RFo73uh
 L+qXCVzbKaMIeUYOTD8/X5WW9oWlRb+A8m0P0CssSBFZU3AJTvQabAzPqbnc4YYVqviq89vKn2f
 ZSQt7lB+XJB/x/NMcThqKx6we7DbokKlpC/fOzMs6VmIy7US
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index d01333c7dd93..49d32e957789 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -625,6 +625,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 	{ TAS2764_TDM_CFG2, 0x0a },
 	{ TAS2764_TDM_CFG3, 0x10 },
 	{ TAS2764_TDM_CFG5, 0x42 },
+	{ TAS2764_INT_CLK_CFG, 0x19 },
 };
 
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {

-- 
2.39.5

