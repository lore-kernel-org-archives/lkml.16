Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890942056;
	Tue, 24 Jun 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755670; cv=none; b=safuryLgmGgskqaorOzOTvUyzmuG5KWm7KhrYkq2W3lL7OzuEPs9BpvhI1gl7Jkl4cnsUFqaZwJ+mtPmddNV25XzZJ1vRxY3PaMCnqAdgPeX46gm0AlU9ZAwyUUqdP3iO+dRW0hXyw0sbmUVL7WDIHv2/kqCv67VxNW6J093xpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755670; c=relaxed/simple;
	bh=ym8ZJ8HnMKNuw/1GIATjLymB1F4nNq9fQbsL8uL4Cbg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FDu3YXr7hcxj7+4M+M5hC7ejit1Ly5vy/IljAkW85oaP95gcnvLdCPlh4KOFESvhA0gpToGpJEyodSCNNmZVs/FvdarVEVNFNbFd+UQ1xGb7KaLxYB6l98GMUClwkCam82tlH53dzN46Dh7qyPmDYqTtJ90ocbtlKfhqIUlXdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bbe6c31e50d911f0b29709d653e92f7d-20250624
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:fe8d6283-d40c-4c07-8076-fa4c0cfd3419,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-INFO: VERSION:1.1.45,REQID:fe8d6283-d40c-4c07-8076-fa4c0cfd3419,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:20
X-CID-META: VersionHash:6493067,CLOUDID:29580cf158e892b1abf01c06d477fab6,BulkI
	D:250624170055CA7XSDA3,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: bbe6c31e50d911f0b29709d653e92f7d-20250624
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1371568635; Tue, 24 Jun 2025 17:00:53 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: tiwai@suse.com,
	perex@perex.cz,
	quic_wcheng@quicinc.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2] ALSA: usb-audio: qcom: fix NULL pointer dereference in qmi_stop_session
Date: Tue, 24 Jun 2025 17:00:47 +0800
Message-Id: <86ac2939273ac853535049e60391c09d7688714e.1750755508.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The find_substream() call may return NULL, but the error path
dereferenced 'subs' unconditionally via dev_err(&subs->dev->dev, ...),
causing a NULL pointer dereference when subs is NULL.

Fix by switching to &uadev[idx].udev->dev which is always valid
in this context.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
v2: use uadev[idx].udev->dev
---
 sound/usb/qcom/qc_audio_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 5bc27c82e0af..975c1f93e48f 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -759,7 +759,7 @@ static void qmi_stop_session(void)
 			subs = find_substream(pcm_card_num, info->pcm_dev_num,
 					      info->direction);
 			if (!subs || !chip || atomic_read(&chip->shutdown)) {
-				dev_err(&subs->dev->dev,
+				dev_err(&uadev[idx].udev->dev,
 					"no sub for c#%u dev#%u dir%u\n",
 					info->pcm_card_num,
 					info->pcm_dev_num,
-- 
2.25.1

