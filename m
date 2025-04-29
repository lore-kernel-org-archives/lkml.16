Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D32BE116;
	Tue, 29 Apr 2025 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920168; cv=none; b=cybF6ecslkMXRtLYlCUT2ZUdi1P/mCvxJtHR8sWXZ+qcS3wBoqoMiVlEmMC+4iD6pGPfDCLqfoVYpIlhkemeMRpuyY/0iq2IGqfEiDBm7P8fV/6lC5/r5CBEftdCPJ8fnTn2aAcEiW93xljHzKmt8j/2QhChWvoCaVdKsAyFdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920168; c=relaxed/simple;
	bh=6joDL2Vo/fUbZe8utQ1LxUav+YxGqCsISeLgR7+wl1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NA+6Q7TYKrzhNA/bXqcc6Ndsnn31zU+Px/bwz3oQSKQpwRHh+e76DbSXlvD3VwgJiLEIqMb7B+Cqy0pZJoYuQ2YCiXOK6Re/89c3BKdgUhRIaqhxe0iQMQiboypOweN4OckEaWCIFunQ/C/qe9tem33+cDEiGI0JOtmr48S7SKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=B8Hsvll9; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OK3L49L2 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="B8Hsvll9";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OK3L49L2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745920164; x=1777456164;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZgrNKAkdbRBon+Ncf37uzjmj8oa4MAlxYnddr6Bx77I=;
  b=B8Hsvll978JuMq4kSchMvfi+1xgp7BsG5ukw+7i9hQyJh5iGlr80ttzl
   vDzc3zKjjB8HFMDsK9X1tup0iY1Qt9Kyw4Ro6DwbBjutiQWYhSi54KMbj
   6rNRmMDdUcmzV/2Qd4Q2MXysjmVO4rPtjHCuHUHyT7ebeiTLqIstYdc9C
   PFE4GUgscdubjyOSElZO1OTxbYsuUIQvgszA4G8z6TJ9YthWi96BrA5Gu
   CGzaDDzxbUtLmK/inkvuGitujV8+sLSl6+Z2TuXc7iWnPx8E324hwDcWw
   wNviv0osnP1APFXIL9as08lNRRR3ubl8H95v54h9e76QcecUFMWEGIUdm
   g==;
X-CSE-ConnectionGUID: M3w6EvxQRZS5Re2Pxrs0EQ==
X-CSE-MsgGUID: BixQjAyoQEWP5EygE4UkFA==
X-IronPort-AV: E=Sophos;i="6.15,248,1739833200"; 
   d="scan'208";a="43779209"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 Apr 2025 11:49:21 +0200
X-CheckPoint: {6810A0A1-27-F35B2447-E1635CDE}
X-MAIL-CPID: 18EE1BBC9EB5D7E0625D15A7E9E65DC4_1
X-Control-Analysis: str=0001.0A006397.6810A0A1.006F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB2F01613DF;
	Tue, 29 Apr 2025 11:49:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745920157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZgrNKAkdbRBon+Ncf37uzjmj8oa4MAlxYnddr6Bx77I=;
	b=OK3L49L2eoPvgGxyGMVsa4yAE9C1pwEaxdPQqYRH6n5/DgtQQIWh6BWAy3fNK+xJIRGrks
	G9JPMfo3N34nkYynp0qVbQwt4QNpMeE1d+xDFL6RvEhC7ptRet7M/9z+wc+DUtNLuYBnvC
	XY5WXZ3YRCQCWL0rcF0IL2aPIOaiGKT7SNJkRv70Lj0fsAdTjPsgaj+7Xiy+NQYsGbSw0v
	LG2eAh5PYa8bxKO2AJ+ehZrATOuK08fzvsMRsSTdw3y6ceoPN9575AMr1qt3NumBH1HVxs
	s1nHmTOQX4VrWRuQnuKoCIg+5wz4ooZcSW2REZZEaseDoEJAJBmHJ4jowK19rw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ASoC: simple-card-utils: Fix pointer check in graph_util_parse_link_direction
Date: Tue, 29 Apr 2025 11:49:10 +0200
Message-ID: <20250429094910.1150970-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Actually check if the passed pointers are valid, before writing to them.
This also fixes a USBAN warning:
UBSAN: invalid-load in ../sound/soc/fsl/imx-card.c:687:25
load of value 255 is not a valid value for type '_Bool'

This is because playback_only is uninitialized and is not written to, as
the playback-only property is absent.

Fixes: 844de7eebe97 ("ASoC: audio-graph-card2: expand dai_link property part")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/generic/simple-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a26487dca7640..355f7ec8943c2 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1179,9 +1179,9 @@ void graph_util_parse_link_direction(struct device_node *np,
 	bool is_playback_only = of_property_read_bool(np, "playback-only");
 	bool is_capture_only  = of_property_read_bool(np, "capture-only");
 
-	if (is_playback_only)
+	if (playback_only)
 		*playback_only = is_playback_only;
-	if (is_capture_only)
+	if (capture_only)
 		*capture_only = is_capture_only;
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
-- 
2.43.0

