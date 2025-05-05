Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28DD35964;
	Mon,  5 May 2025 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746407369; cv=none; b=LNw46yV1414cbEqVx/KawwxZRvZIro6+MHUpNpAUilHjUZ19smPYLBXBjQty8k6hIlPVHOKJhyOmE72+V5qlc9rARKHz+/6xejNE3nCwuXJo2k3VFvmtXMexLmkO+e5S+ziVmjbrCmScI8/w6G8UudnfDeEC9hjKDIu3CJyrg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746407369; c=relaxed/simple;
	bh=8hc3F+jD5dTdwviO46VHg79TvslfrTUtAWg8MFGeAY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7Rn9c4JnoQ+muQ4dd6bhGYNHCGQvAqDKs2u5S7kaqOPtG7YH9LXETY0EI8gPuXSUeFQB6scH5UW3dqfmFYg8/5+IzlefnDTz0blcxhzLHaLYBPWRrwhrU08aEzyFhXblFubi46nDb4WeYX19CyRPu5qFlYUMNrl6rgl7oF3Lbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=OeNEKf4G; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="OeNEKf4G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=5NcuI6cPYdj/N7shJLQtUlrygSH0sD1RJd008f4HKH4=; b=OeNEKf4Gkj7+Y+jN
	Jx8Nh2YB3DE6ggdkQ1ZEy59iEgSSp6l5QjZ8qnuMQ5oYNANHs6tRcfVfw61HoQMMbAcdKJegrHYO1
	RjY0DWFKPCG8R8jU4yBG7zCIj+uHOlegAp41O084VOTn6c8hOA/BsKbBZy7oJpsVM3NLdga0Q4XkJ
	UK6ek2Y30zUnjn8nLOklYGCNSV4bzkjcOBi+PLAM/QI7kTuHqRJs6r+P99nknM4kJt2uT8tQInmmF
	lpg4DE+WbUUawrhLCAKbEnxv48I/hJq5OMEgnNYcGYeT8VqlS3vlU9+qTPABVpUdkA+UYV/d/gAsC
	ZcwTEy3J2jLZtBSU2w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uBkKh-001M2I-1T;
	Mon, 05 May 2025 01:09:23 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ALSA: hda: Remove unused snd_hda_add_nid
Date: Mon,  5 May 2025 02:09:22 +0100
Message-ID: <20250505010922.340534-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

snd_hda_add_nid() last use was removed in 2014 by
commit db8e8a9dc972 ("ALSA: hda - Remove the obsoleted static quirk codes
from patch_cmedia.c")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/pci/hda/hda_codec.c | 31 -------------------------------
 sound/pci/hda/hda_local.h |  2 --
 2 files changed, 33 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index b436d436831b..c018beeecd3d 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -1731,37 +1731,6 @@ int snd_hda_ctl_add(struct hda_codec *codec, hda_nid_t nid,
 }
 EXPORT_SYMBOL_GPL(snd_hda_ctl_add);
 
-/**
- * snd_hda_add_nid - Assign a NID to a control element
- * @codec: HD-audio codec
- * @kctl: the control element to assign
- * @index: index to kctl
- * @nid: corresponding NID (optional)
- *
- * Add the given control element to an array inside the codec instance.
- * This function is used when #snd_hda_ctl_add cannot be used for 1:1
- * NID:KCTL mapping - for example "Capture Source" selector.
- */
-int snd_hda_add_nid(struct hda_codec *codec, struct snd_kcontrol *kctl,
-		    unsigned int index, hda_nid_t nid)
-{
-	struct hda_nid_item *item;
-
-	if (nid > 0) {
-		item = snd_array_new(&codec->nids);
-		if (!item)
-			return -ENOMEM;
-		item->kctl = kctl;
-		item->index = index;
-		item->nid = nid;
-		return 0;
-	}
-	codec_err(codec, "no NID for mapping control %s:%d:%d\n",
-		  kctl->id.name, kctl->id.index, index);
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(snd_hda_add_nid);
-
 /**
  * snd_hda_ctls_clear - Clear all controls assigned to the given codec
  * @codec: HD-audio codec
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 4714057dba85..68c31f5354b7 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -571,8 +571,6 @@ struct hda_nid_item {
 
 int snd_hda_ctl_add(struct hda_codec *codec, hda_nid_t nid,
 		    struct snd_kcontrol *kctl);
-int snd_hda_add_nid(struct hda_codec *codec, struct snd_kcontrol *kctl,
-		    unsigned int index, hda_nid_t nid);
 void snd_hda_ctls_clear(struct hda_codec *codec);
 
 /*
-- 
2.49.0

