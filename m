Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049E264FAF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378151; cv=none; b=fJ9v04ncPtAzY+GLUJGcYf3lUIZkn/8ym4mqpgugpvGePv4J/AqfCE2AIfMEWAAg+Jwf0hRIR/chO7P6SGEeO0ODAQv7NqjaVY//F1aPhAQaassA/Owk1mrM3Bcs2IX9Ody1E9Lgt3MnkvzDCka8wVQyhTgd+EfbqlB/3Ndo/E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378151; c=relaxed/simple;
	bh=6BnjtcaJq47LpGWDNg4juqCpB830XQZ/JzrfG4RiG7g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=imYB0cJybrd+MGq8ldJM2feXAynsqft1ILen9ZDVCOGy3QxohyzWBKhWk2yFY6NKsIqoZq7uLqkXYI7yk7K3oNKldDechhW8oj5GdLv5bL9e5FSM8Lt2FG/CbO3PC8rlDc955talf+MkFq0UET6cKWWOvVz3WBks9K8SpiZeAlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3bb659201ff111f0a216b1d71e6e1362-20250423
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ebd4ea06-b8b1-4d65-83d7-4acedaa018cb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:25
X-CID-INFO: VERSION:1.1.45,REQID:ebd4ea06-b8b1-4d65-83d7-4acedaa018cb,IP:0,URL
	:0,TC:0,Content:-5,EDM:25,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:8a4ccbf394116520290434df499524d8,BulkI
	D:250423111327MU0OR9DG,BulkQuantity:1,Recheck:0,SF:19|38|66|72|78|102,TC:n
	il,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: 3bb659201ff111f0a216b1d71e6e1362-20250423
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 525924543; Wed, 23 Apr 2025 11:15:39 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: john.g.garry@oracle.com,
	linux-kernel@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	xiaopeitux@foxmail.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v3 0/2] clean up hisi_lpc and lib/logic_pio
Date: Wed, 23 Apr 2025 11:15:34 +0800
Message-Id: <cover.1745377493.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.clean up included headers
2.add and clean up comment in logic_lib

Pei Xiao (2):
  bus: hisi_lpc: clean up included headers
  lib/logic_pio: add and clean up comment in logic_lib

 drivers/bus/hisi_lpc.c | 13 +++++++++----
 lib/logic_pio.c        | 37 ++++++++++++++++++++++++++++---------
 2 files changed, 37 insertions(+), 13 deletions(-)

-- 
2.25.1

