Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B41A5BA9;
	Fri,  6 Jun 2025 09:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201527; cv=none; b=poewbzQQp27SYxAZ4s3qxJZU3KYkHLavYB6mT1t7muX2pg0sxxbUtZGPi9AcaRB+lrsIm+ZjW/Mj6wcJj379MzPwzgmvWRmC9dFdAUZSR/oNQb7KSjKlMpUt5F2PVCXrKYAlKS7bpszM+NkSDbIrFV0hsOkBEayJykDzbladKM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201527; c=relaxed/simple;
	bh=PUindHAXEQQlbpUG5MYIfwz0e2Z4ol8KN/X7GV15tAU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uDF3kzuMOTUVUSt4igCUMEYHh0IaasmUuGAQPZrOMwswFgxluNbSJ5YtPYQcJfYtjv0TbYDBH/hkfXKGiY26WputZmw8Z4S8IyMUm8iVFfyHK9S1myXtUFoCSUL/ZLssQ4iXnXmUwfrHmIrTKsizjflP1u8z31ty65E+55M72No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 354b21b842b711f0b29709d653e92f7d-20250606
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0efc04ef-84fe-408f-9e18-ff4cbbc641cc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-INFO: VERSION:1.1.45,REQID:0efc04ef-84fe-408f-9e18-ff4cbbc641cc,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:53816a4433045665c159fbe3fa3a4e04,BulkI
	D:250606171829N6GA982N,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 354b21b842b711f0b29709d653e92f7d-20250606
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 599363329; Fri, 06 Jun 2025 17:18:28 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: nicolas.frattaroli@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 0/2]  Cleanup in rockchip_sai.c
Date: Fri,  6 Jun 2025 17:18:20 +0800
Message-Id: <cover.1749201126.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.Simplify the condition logic in
2.Use helper function devm_clk_get_enabled()
---
changlog in v2:
1.fix capture flag in rockchip_sai_xfer_stop
2.remove err_disable_hclk
---

Pei Xiao (2):
  ASOC: rockchip: fix capture stream handling in rockchip_sai_xfer_stop
  ASOC: rockchip: Use helper function devm_clk_get_enabled()

 sound/soc/rockchip/rockchip_sai.c | 51 ++++++++-----------------------
 1 file changed, 13 insertions(+), 38 deletions(-)

-- 
2.25.1

