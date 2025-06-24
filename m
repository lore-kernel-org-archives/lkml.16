Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE7A1991DD;
	Tue, 24 Jun 2025 06:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745183; cv=none; b=hpnaynZ+wOr0ugNUMlXHdTrbzRKXWvr4o0F3GEKWORzDL1o9cr/9PLrGHbNAFx2a/t4e4OVk37/3NF4ruhC572hWqRZQRD1kjUQoKmwmXJ8kCkkIgN+zk5F6J8I//DXGSno/4Vua9UGE0tN4qfzroWRM+p+ZWqMxXkGPSdhCqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745183; c=relaxed/simple;
	bh=zyuthmMGbNOvqlF/tjoKHpLbIAe+30SOZPWwJpDllQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ej6jE2b8lxUGAoYYbD57KCC4zbsQgAqcl55gAXGFNRF6INK+4oKAne+710MLDOj7fw3xCWsv7sHgNTUMqgzgKhXdfkW5ve+AR78DbxT3IkUso72SVogPZMlDiVr9IUWPYCQn5y3OjS58zX9dvSes5reKB7Y4cKfNwO4MLmaR8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5505a89e50c111f0b29709d653e92f7d-20250624
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
	GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:60ef29b2-48e7-4bfb-b64f-44f3e89c42ee,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-INFO: VERSION:1.1.45,REQID:60ef29b2-48e7-4bfb-b64f-44f3e89c42ee,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:20
X-CID-META: VersionHash:6493067,CLOUDID:605243b45c863a5a1380aab1059dd500,BulkI
	D:250624140613P6WC34EL,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 5505a89e50c111f0b29709d653e92f7d-20250624
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1602980613; Tue, 24 Jun 2025 14:06:13 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz,
	quic_wcheng@quicinc.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] ALSA: usb-audio: qcom: fix NULL pointer dereference in qmi_stop_session
Date: Tue, 24 Jun 2025 14:06:06 +0800
Message-Id: <9da1a13ffee0924e4813ef5b20625a89680ce88d.1750745062.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The find_substream() call may return NULL, but the original error path
dereferenced 'subs' unconditionally in dev_err(&subs->dev->dev, ...),
causing a NULL pointer dereference when subs is NULL.

Fix by replacing dev_err with pr_err which doesn't require device context.
This safely handles NULL subs while preserving the critical debugging
information (pcm_card_num, pcm_dev_num, direction).

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 sound/usb/qcom/qc_audio_offload.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 5bc27c82e0af..556fd9cb4fa6 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -759,8 +759,7 @@ static void qmi_stop_session(void)
 			subs = find_substream(pcm_card_num, info->pcm_dev_num,
 					      info->direction);
 			if (!subs || !chip || atomic_read(&chip->shutdown)) {
-				dev_err(&subs->dev->dev,
-					"no sub for c#%u dev#%u dir%u\n",
+				pr_err("no sub for c#%u dev#%u dir%u\n",
 					info->pcm_card_num,
 					info->pcm_dev_num,
 					info->direction);
-- 
2.25.1

