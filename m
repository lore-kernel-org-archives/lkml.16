Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA921D59F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551607; cv=none; b=cuw3UJkBiiBLT4TxP7QAsqWgE5o56/hrssM+n7IsbqTk+JhsrXKepXaKt0cRqET5Gwf/lXcuzW9+riClF7JXIeRmRUVgtzv2VGU169LoeuXpHm7hg+6AizKZGV3EERNb1VkttkI57ninuPToYn6KzLw+lBTZ7VCgdpYPsIxiFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551607; c=relaxed/simple;
	bh=fjW0jXCfd6en/Aoe0j4hbOJItolJuWR1YjTBIvpS+Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XbWIyH9kbgtbcO8LE+Dgh20pu6mF9DyCg0qHtx/T833bhQxVnFrouMm5WNrt2W7Sj76xgKPpmze2hK5lA6V9f5jZeFGlNg+lns4opJDetKVlcLTHIp5LZ4wPWrOJkExb+5HfgGC3WHR/UTb4T7Z4W8NXOCAMTUqVE3OYtrZc+rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iI7TSjo9; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iI7TSjo9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749551591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k4cpsN1ugtg9kXyYb6LbiRd5jMU/jLsFcbsMgFqpRDY=;
	b=iI7TSjo9Aaiz/4ey6yBuIy8S1hCJOBJwcUbQj4DdiCg0TA4qLy8ET7bm78qHlm6jAWyv6v
	G8y2UM34I9+5eYXFGMfrRjrIJevSrCI13tO+oaw1ASr3C7vvChkVVkC5uTcEBoEiVX9lcd
	kf306k8/ss+uXwcnEUsa6HyIYLQVQ48=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sdw_utils: Fix potential NULL pointer deref in is_sdca_endpoint_present()
Date: Tue, 10 Jun 2025 12:32:16 +0200
Message-ID: <20250610103225.1475-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Check the return value of kzalloc() and exit early to avoid a potential
NULL pointer dereference.

Cc: stable@vger.kernel.org
Fixes: 4f8ef33dd44a ("ASoC: soc_sdw_utils: skip the endpoint that doesn't present")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 30f84f4e7637..b70cb3793d8f 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1180,6 +1180,8 @@ static int is_sdca_endpoint_present(struct device *dev,
 	int i;
 
 	dlc = kzalloc(sizeof(*dlc), GFP_KERNEL);
+	if (!dlc)
+		return -ENOMEM;
 
 	adr_end = &adr_dev->endpoints[end_index];
 	dai_info = &codec_info->dais[adr_end->num];
-- 
2.49.0

