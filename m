Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91126A0CF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115440; cv=none; b=ewm6S5cIm3lWOhKao9bH9senQLTbIVaU8hAXPZJ1iltmT1nAlAsTYo74uBQY7L6gWhYuBs8mReM8dGXD1rD4qhGxHk5lSiMrGD1IwWCa3TW2XvpfT7xlgJsOTe0ATAbhQGGcGUh+51sUneQenrb71SoBlhMLskRcqVZemFWwAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115440; c=relaxed/simple;
	bh=roYuOsRXxDY1Sc1IojrF0f1x5agxjz7QRE19p5hS1zY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIHbl8TfzExhigpSzL6EdZpP/R4CwCMCsWUh1HH22F4sNtwbR/QXHYPg9pLUdYXfZaxLwbNLB25YkVTy5q/dCrz/g3C83zus3Lf4wl6DoMFQ5tWrThL8hvSq8jr/rD82ScsGDQBiy7YvW4aY9ncN6d8GHqo9DVYlNEScN31K2uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jQMXev8Z; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jQMXev8Z"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744115426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0YzbUZ64DR2mqPefS1VS8O1gHUe6w9Lu0ZF3KUP1TsQ=;
	b=jQMXev8ZfoTE1c7HXYWuAE6Iy3eZPxLUUtrNoDiX7sVrLbhULEUmpElAFD+KpCrm/tGf2+
	1V3yKlksRmSL5b0lbKn+jBnjylj4fqWYR4eLT8teoCi3VdLSrcrbPrMhbvTkRmc6g5/zDU
	lpPhobww3HZ+a4OY1O7zDpx7riYKIP4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: asihpi: Combine multiple if statements
Date: Tue,  8 Apr 2025 14:29:51 +0200
Message-ID: <20250408122954.805007-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Combine multiple if statements into a single code block to improve
readability. No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/asihpi/asihpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 5a84591b13fc..6c32df43d1ec 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -982,12 +982,12 @@ static int snd_card_asihpi_playback_open(struct snd_pcm_substream *substream)
 	err = hpi_outstream_open(card->hpi->adapter->index,
 			      substream->number, &dpcm->h_stream);
 	hpi_handle_error(err);
-	if (err)
+	if (err) {
 		kfree(dpcm);
-	if (err == HPI_ERROR_OBJ_ALREADY_OPEN)
-		return -EBUSY;
-	if (err)
+		if (err == HPI_ERROR_OBJ_ALREADY_OPEN)
+			return -EBUSY;
 		return -EIO;
+	}
 
 	/*? also check ASI5000 samplerate source
 	    If external, only support external rate.
@@ -1156,12 +1156,12 @@ static int snd_card_asihpi_capture_open(struct snd_pcm_substream *substream)
 	err = hpi_handle_error(
 	    hpi_instream_open(card->hpi->adapter->index,
 			     substream->number, &dpcm->h_stream));
-	if (err)
+	if (err) {
 		kfree(dpcm);
-	if (err == HPI_ERROR_OBJ_ALREADY_OPEN)
-		return -EBUSY;
-	if (err)
+		if (err == HPI_ERROR_OBJ_ALREADY_OPEN)
+			return -EBUSY;
 		return -EIO;
+	}
 
 	timer_setup(&dpcm->timer, snd_card_asihpi_timer_function, 0);
 	dpcm->substream = substream;
