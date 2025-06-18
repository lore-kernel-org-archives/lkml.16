Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8C61624DF;
	Wed, 18 Jun 2025 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274392; cv=none; b=r2aBLF1/Q2JCyN0Y2zwTRG1kHP0oaf6JHs/JQISPxno2kk3KPkMgpYu4qZ4K/K++v2oBcAZ7rt+GiNslvqg0/BrXeI7vAas+aF+gs9ALPyAOYxKmOu1Kmj+8UImVW1ONtm/HlodZzc15zEyyweuNDJpHJ+DoAIxadfTEjfw02Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274392; c=relaxed/simple;
	bh=c4qdY3tnTY9wWZCO2RT52Bky6b3xLh9TnGYkaIovRNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZX7nCX25/dCzcOco8tlxKzGXRhnTgYifK/3ocPV82MYN0QUJQ6+GQZjxrUsIgSOzfdSOW2DM6LEeY0BpiweX9FbNv+wrgCw3snIuooTvwXgGVqD9J7xsAmNisQLEPSbjzvhcHOeyIz93yRGXXKbdXn1InQABXlkgiuQb2jKfwTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HYOxmFEK; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HYOxmFEK"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IHgFEI024969;
	Wed, 18 Jun 2025 19:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=+aW2YSIMxaUjDzZn1X4t6XsLFabUP
	JcRS0G2vvx8WuU=; b=HYOxmFEKR3MgszoCdtqxpVUPdb2KIr/S5ESn1fTihHQhx
	SSLB/2Q8qpalz26irpoVtURqyZuB0BrKDq2tLHNrm/y87H2uc4vNcNa+HjpYZSwj
	afVKvRBGIYlK4cib4xsZbofUV0yNkp/UaRzVKIZk3E+CDtuJq6ZcnT3aSqPuJusX
	Vqe6ermtvRuCCWRwlUoUYMkKLYA3ZBrGoV39yk1yU471SpQ6sitpoxvDa8kTrS7C
	EOLFFMq/wHWyIGWEPBC0KDShz/JqFqS/uNHV6w3wterN6+XdzPVbxbg24hiL75/I
	NCOMt/tY7LvOdSxDShR/8Tl9W27Q639jW5AvK0dQQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r7hs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 19:19:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55IHfuYM000831;
	Wed, 18 Jun 2025 19:19:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhb2800-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Jun 2025 19:19:32 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55IJJWxG026607;
	Wed, 18 Jun 2025 19:19:32 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 478yhb27xr-1;
	Wed, 18 Jun 2025 19:19:32 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: perex@perex.cz, tiwai@suse.com, phasta@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-sound@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [BUG] ALSA: intel8x: Why incorrect codec index used setting ICH_DI2L SDIN
Date: Wed, 18 Jun 2025 12:19:21 -0700
Message-ID: <20250618191929.2382821-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506180165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2NCBTYWx0ZWRfXwgy3gO4DXp5n MBoW9EaGDpR0hG4cYp0j4tiFSM2Bx2mMHV01Fd6olCZzhq/B4N0XPmSmrmaP38RbtineoWXPfkX zCafCYCL8NOl7IWmS4qdq2oV4ZRdacIqC7A2+FWmX30Q8EbiFvG0xzWGds7x3mIp7DTO2t92Z5G
 fOXnvsTBchoIEpF2yQZ4ZYfBb3wOpw0A3imMik0BCevQK25m4YtZZghP3ebe+ppjC3cw4Y8I3ZJ Wjh22WQceGo6jq/8ZvRflVg0d3W4ThJY+OyD8JVPHXu5xtqV5o7NNjC+lfMdgxp4KdCcXis+uY2 bdIeQkq30wEt2Ym/1q9nUQf/9fUq4X4tm1kRzDmYO0hzqcPMsnqy90lKE3Q8UNKp2sHQzUGCOal
 1z1qV1+xRTU0KcurX/f3ecHGcBMlEP2lmQ1/zjRoa1AS55Zo6rFhrIpjuOCaUUevmWu0YlCU
X-Proofpoint-GUID: XRr2tr9Y1BNd17p7D-a1Lw1XW65G2oaO
X-Proofpoint-ORIG-GUID: XRr2tr9Y1BNd17p7D-a1Lw1XW65G2oaO
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68531145 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=ajM-e9yD8c-mEGuaoXUA:9 cc=ntf awl=host:13206

Correct the index to use codec[i] to match the loop iteration, not codec[1].

Is this a mistake or intentional?

Thanks,
Alok

propose changes
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 sound/pci/intel8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 51e7f1f1a48e..b521cec20333 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -2249,7 +2249,7 @@ static int snd_intel8x0_mixer(struct intel8x0 *chip, int ac97_clock,
 			tmp |= chip->ac97_sdin[0] << ICH_DI1L_SHIFT;
 			for (i = 1; i < 4; i++) {
 				if (pcm->r[0].codec[i]) {
-					tmp |= chip->ac97_sdin[pcm->r[0].codec[1]->num] << ICH_DI2L_SHIFT;
+					tmp |= chip->ac97_sdin[pcm->r[0].codec[i]->num] << ICH_DI2L_SHIFT;
 					break;
 				}
 			}
-- 
2.47.1

