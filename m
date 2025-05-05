Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFC7219FC;
	Mon,  5 May 2025 01:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746407443; cv=none; b=VONa50swpj+XufHLN0eR4JfaWXc4c/lGUibLCrSamo+WhmBIV4hXHB7E4H4kDcjhAKQARa/UoI7sySXKQ5C1AZ1XW7xPDFRJnDukYFZ8GmVMyPx+4kB3Thxdp7/l02r7UUZl7iqnJI683zIXea28JOAfKrKJ2/TeLK0Hi6geUL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746407443; c=relaxed/simple;
	bh=GnMtOEiaMJ5EqwqKBtUZ6Mb7DKA+HNZqpub2Wqmhksg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i8+9KVvTEQ3RbJOvLvI89rUhCHC3pBxmwt5CaUh638tL5SvUQ49SkEAaOWbqT+bN4PPiyz79Ek9sMhlEHVGen64jZBFbHwhtnmebjVtj0qAPtxgYwWAiMqiHF01ZmZr+3JGT6fmUr4NWJULBDLaBPEcb5ck1mPr/MtlNIvRjVLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=cGcS476r; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="cGcS476r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=qklOgQT6Lj8YeWmTpffZOHmCvK1UNYqzUbalYIPxc1o=; b=cGcS476rt1jj6vwD
	VmJgaU7rRWDNcF+nxgOjZnCed9btuR8IsyvVANza1+x0DW5ZDSVT1f56hnZdM0xMueElHLxxrZkUu
	J/sorwRI4ikh9wL8fo55+UsBDfcDXLKlU+KC96kYJgHp1mpI2SpBk+lQ6J8rIsL9lkKzk9wzfqwfa
	1eKSFv7GmYwbH1uq1HUguv61BBofro6lInGTDADa0kbTqTZgrjPnik8WwfU36Nbd5wnSKW94JjErv
	gqRIYSDPJifm6Qsw/LQj5ubyjfd46nNYoBbCTL6ijXZpufyv3hxiVshMbeWUO/OvJfn3F90Oh5MvC
	dOPqjJAlnxNnyr587A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uBkLu-001M3o-0b;
	Mon, 05 May 2025 01:10:38 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ALSA: hda: Remove unused snd_hdac_stream_get_spbmaxfifo
Date: Mon,  5 May 2025 02:10:37 +0100
Message-ID: <20250505011037.340592-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

snd_hdac_stream_get_spbmaxfifo() was originally added in 2015
in commit ee8bc4df1b5a ("ALSA: hdac: Add support to enable SPIB for hdac
ext stream")

when it was originally called snd_hdac_ext_stream_set_spbmaxfifo,
it was renamed snd_hdac_ext_stream_get_spbmaxfifo shortly after
and was finally renamed to snd_hdac_stream_get_spbmaxfifo in 2022.
But it was never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/sound/hdaudio.h |  2 --
 sound/hda/hdac_stream.c | 19 -------------------
 2 files changed, 21 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index b098ceadbe74..6257152fa0ce 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -598,8 +598,6 @@ void snd_hdac_stream_spbcap_enable(struct hdac_bus *chip,
 				   bool enable, int index);
 int snd_hdac_stream_set_spib(struct hdac_bus *bus,
 			     struct hdac_stream *azx_dev, u32 value);
-int snd_hdac_stream_get_spbmaxfifo(struct hdac_bus *bus,
-				   struct hdac_stream *azx_dev);
 void snd_hdac_stream_drsm_enable(struct hdac_bus *bus,
 				 bool enable, int index);
 int snd_hdac_stream_wait_drsm(struct hdac_stream *azx_dev);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 4e85a838ad7e..e7f6208af5b0 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -825,25 +825,6 @@ int snd_hdac_stream_set_spib(struct hdac_bus *bus,
 }
 EXPORT_SYMBOL_GPL(snd_hdac_stream_set_spib);
 
-/**
- * snd_hdac_stream_get_spbmaxfifo - gets the spib value of a stream
- * @bus: HD-audio core bus
- * @azx_dev: hdac_stream
- *
- * Return maxfifo for the stream
- */
-int snd_hdac_stream_get_spbmaxfifo(struct hdac_bus *bus,
-				   struct hdac_stream *azx_dev)
-{
-	if (!bus->spbcap) {
-		dev_err(bus->dev, "Address of SPB capability is NULL\n");
-		return -EINVAL;
-	}
-
-	return readl(azx_dev->fifo_addr);
-}
-EXPORT_SYMBOL_GPL(snd_hdac_stream_get_spbmaxfifo);
-
 /**
  * snd_hdac_stream_drsm_enable - enable DMA resume for a stream
  * @bus: HD-audio core bus
-- 
2.49.0

