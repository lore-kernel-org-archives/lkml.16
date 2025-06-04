Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1A23816E;
	Wed,  4 Jun 2025 03:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749006825; cv=none; b=Kc5LZ2S+paqwDfGXXGMxYoaHiq2kTsru5m0f36q7yxhT2348Q5YcBlU2jYbuIkKj9xvDZq9KY849UNdw402gB6PzSFINX9HJrksMaySzeRNT1134Kw5bFcM/LrtrSP7HgIHS7gKn6qDTi9GlqPPXlnTbRlFpITa/yms3xzjG3KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749006825; c=relaxed/simple;
	bh=FC/r0JJ/ZhZdzoYQi5j0+p5djHJA9NHe0VESR2cG5Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YhIv2q03+yyNI9CgcHRxLqaS5hwbFDt4Xh1ewExG633hNoIg3BD5fajttah/LNEZFBxR5WRWtZJVf866DxfKLV5tBXol71GIYYFjJmaqtfjGQonPzfk6VHQt2gMtjXgTv5Baqz/4daJtyqmKYEJ9lOBunH5Jiy0lOzPDVg4OSWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: e81f4cd240f111f0b29709d653e92f7d-20250604
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:346cf5ee-0cb7-48fc-945a-500199bca67b,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-INFO: VERSION:1.1.45,REQID:346cf5ee-0cb7-48fc-945a-500199bca67b,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:20
X-CID-META: VersionHash:6493067,CLOUDID:9f2decd7cee3c8013ae9919a70940931,BulkI
	D:250604111339G3SRF8AR,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|81|82|10
	2,TC:nil,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,B
	EC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: e81f4cd240f111f0b29709d653e92f7d-20250604
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1639636581; Wed, 04 Jun 2025 11:13:37 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: nicolas.frattaroli@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 1/2] ASOC: rochchip: Simplify the condition logic in rockchip_sai_xfer_stop
Date: Wed,  4 Jun 2025 11:13:29 +0800
Message-Id: <81c7955216f5cc7565a396e50e5474ec8f6e3017.1749006565.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1749006565.git.xiaopei01@kylinos.cn>
References: <cover.1749006565.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cocci warning:
./sound/soc/rockchip/rockchip_sai.c:387:8-10:
	WARNING: possible condition with no effect (if == else)

Simplify the condition logic in rockchip_sai_xfer_stop() by removing the
redundant SNDRV_PCM_STREAM_PLAYBACK branch. The modified logic now:
1. For stream < 0: handles both playback and capture
2. For all other cases (both PLAYBACK and CAPTURE):
   sets playback = true and capture = false

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 sound/soc/rockchip/rockchip_sai.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 602f1ddfad00..79b04770da1c 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -384,9 +384,6 @@ static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stream)
 	if (stream < 0) {
 		playback = true;
 		capture = true;
-	} else if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		playback = true;
-		capture = false;
 	} else {
 		playback = true;
 		capture = false;
-- 
2.25.1

