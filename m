Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950888F77;
	Tue, 29 Apr 2025 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922688; cv=none; b=W9Ft4iU4QJkBQx4nL4c58FPVgEc+E/kwDCzB04/t/YeCsvPqoF497Wd6tiN1msZoGU4Mkz73qiN427OkN7tvOX8h0l1EgiVg5tunlyOjyi+zZwFZ6R1/3HejXUFvvJiizwyOSXeMbyI2jhgU8Trrkh07cEyZUSCcoMiToEqBXXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922688; c=relaxed/simple;
	bh=pOq4jyyMAwCYUnNjX1y8cT8pMjVAwdTys24UfUdPvoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZKTRoKqtFdSWuul0lv/P2seFDjztbFM/hLxSXP9eTSjVxUWHoUcCeYlpYg04B7mCYSvvos2haj7a5WrLjIYH8v+FrOUY4zSkvOxHEprJ2dRMIZLZY9Zqxly8LeRvPeA4OWFq18uqL+Hex/NRGDog4u4cCk54aJSEKWJWTdawhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TVajMxxY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TVajMxxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745922684;
	bh=pOq4jyyMAwCYUnNjX1y8cT8pMjVAwdTys24UfUdPvoQ=;
	h=From:Date:Subject:To:Cc:From;
	b=TVajMxxYZojIFavArpHPf0ZmBHdH9lYLgyb8HWdHJJ5lbPQlCgQWLyR5ydfwprSH8
	 OiCI75Bk5kNdh4Fk6iwvHC9icKpgc5+WrioomTKi79h6weEdahgPaQKkV8BtzyDewv
	 L8fsoEOVvwWM6rx+3REFmh97N+wFjwIA2uWybDHczoCVLQ9pOVRTWOnyMsf8uhBF6A
	 MiKfk5Oytv/mCOo058Oa8EMJvLz3iinwz4GcdxFn40mhH8zrdV4VvAvnqMoADFqdZv
	 k230KIf2G6Q613Ii+x4S96LM3jZTOgl0MACSx1l+oySpMpT/zJoGr3clDc3rpa1zt0
	 HZcqxmvjbxn1w==
Received: from localhost (unknown [84.232.140.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 73FDA17E09B5;
	Tue, 29 Apr 2025 12:31:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 29 Apr 2025 13:29:43 +0300
Subject: [PATCH] ASoC: amd: acp: Drop superfluous assignment in
 acp_sof_probe()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-acp-sof-probe-assign-v1-1-9784f6eb7660@collabora.com>
X-B4-Tracking: v=1; b=H4sIABaqEGgC/x3MTQqAIBBA4avIrBtQ6Ye6SrTQGms2Kg5EEN49a
 fkt3ntBqDAJLOqFQjcLp9hgOgX75eJJyEczWG0H3dsZ3Z5RUsBckid0InxG9GacxkBG6/mAluZ
 CgZ9/u261furyAWZmAAAA
X-Change-ID: 20250429-acp-sof-probe-assign-b1676fe1009d
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The 'card' pointer is not required to be NULL initialized as it is never
accessed before the related memory allocation takes place.

Drop the redundant assignment.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/soc/amd/acp/acp-sof-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index d7b54f12f4062481876f636e483c2922e2029a5f..6215e31eceddf8931ed55c29d8488629e23bcdd0 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -88,7 +88,7 @@ static struct acp_card_drvdata sof_nau8821_max98388_data = {
 
 static int acp_sof_probe(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = NULL;
+	struct snd_soc_card *card;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
 	const struct dmi_system_id *dmi_id;

---
base-commit: 9d9096722447b77662d4237a09909bde7774f22e
change-id: 20250429-acp-sof-probe-assign-b1676fe1009d

