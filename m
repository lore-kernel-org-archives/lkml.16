Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D201474DA;
	Sat,  8 Feb 2025 01:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976626; cv=none; b=rWNMm6/Ax5Qpei5BDQuZNdp0kSTsleye8SzeDGxX7RvBRKYJ8HvRI+XT0UrEBaKrEDRVOs7gOD/fid/WaqCnFNnrCoDkFNa10sRHS8dkKhN2f+SSmM7tBlFZuaECAoTEFlH1GYs7GU6rJ4PVfKKG2bH9t2g8eDVqa88BUjEpx/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976626; c=relaxed/simple;
	bh=OtsO6Z9lH+1FLDdny7dGROduBRJ4anEq15A6eL5dXQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r75cqsMMSoiX1ENC9kDDIdvcPCqftMCe9y/al5nuBapF2HESZm5551QSqduNJZJU80GcoDAj5hHOouPfuAEyg4rvKCx/83rwygdhyEvIrEIwmlBoNyt9sUhNfb8t0CDIC9R1AP4SUw7ewTyyNmlpsh60Y1pWTEeScfUFNI8K2Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXZYIBsl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXZYIBsl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363D5C4CEE2;
	Sat,  8 Feb 2025 01:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738976626;
	bh=OtsO6Z9lH+1FLDdny7dGROduBRJ4anEq15A6eL5dXQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fXZYIBslf6LozJzp94xD7Gt80qs+2lHfEDfQl7GloLN3bpY8HMjP7jZuXqtIF2ZIH
	 tIDoal00d4zJp6y6VXb8XPi7/pHlPYJjo4xatYCBA9fEBqMtyvnClAbf9J+omAxCYA
	 PG1LoPoFlVwJexyCH8q8qVnyajglCRBL5K0kcv32X3nQKIMAnRrux9e3tzRSzjlY8o
	 J7jQVF54rAXJRCrAP5hO1uS9w6MTSP4wbQpwcwxPIEWZv00R1gCKUS4kKA5+by+jSA
	 qssDelYiNTh8JAzBqACIa0vyJlJtlRX7rCWdy67+V+VnkuShSqDPSt/IwcCPJ97xXK
	 T0ZVps3s/iItQ==
From: broonie@kernel.org
Date: Sat, 08 Feb 2025 01:03:26 +0000
Subject: [PATCH 3/4] ASoC: tas2764: Mark SW_RESET as volatile
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-asoc-tas2764-v1-3-dbab892a69b5@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5qB82+UstkZhC0QeOUniShAIrw2KQ4uj8p2DRKpkeeg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnpq1jv3MwaHS8DYc7vi7Xf7etQui4p+oBJJ/wg
 faEss1z0OiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6atYwAKCRAk1otyXVSH
 0KC3B/4mecKiN0X4gtaq7N86iKZZ1IolXLlduqA71F+w9PuiB1mPU7Y+ou8mAR1Lxe9e+E1ONDN
 Am73xtucTFYq5FPa5tuPJ0so6I4qerRsk/ay0mZsBi/GN5Rav39NH9BVLdnHsdNw/dSi5AA1QdU
 ajFxxAWpFCcX6ntbofOclMvpgmDgmomQFyECCQkIMBLDKbzceDNzd0SMSY63W2aJN7dfITqg996
 uypP7Xgh4E3JDqm80OF7XLScUDsLaYSc/kSu/72odG+yJDJDmRnB+AEEve77g/haml9wEHOgY3E
 pv8tySz28SAnuH2iJHnud/Dyb317ESzxaXOyG42h30m7EAMo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Hector Martin <marcan@marcan.st>

Since the bit is self-clearing.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 0b033ab51f7f..d01333c7dd93 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -642,6 +642,7 @@ static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case TAS2764_SW_RST:
 	case TAS2764_INT_LTCH0 ... TAS2764_INT_LTCH4:
 	case TAS2764_INT_CLK_CFG:
 		return true;

-- 
2.39.5

