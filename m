Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95B62561BB;
	Sat, 21 Jun 2025 18:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750531998; cv=none; b=giJ48X/WsKr+zStQ7s2my7HeJFX4TSOmJ1GrWe9XogiEk2IxCugSARnkiuoy0l9jYu46bJXR0RpNBCfIPdS93MZZwl4ojC1LU9jJ5HrWT+XkSt7mdyvqIkAUSQTNmJzfB7Y1ZLCm3WtSfiabVMO0BP8wObCk01F9s12jDoCoirk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750531998; c=relaxed/simple;
	bh=uxoKRcY2W6kCcNzZ8+R+4JIj5r251Ne/rkyNdGnRGY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sY8T9M86MGCp1qfChj2WfbfNd+lHR8q6zAFSby0P6b+4Pkbjh/6bE++QXlvHGdvQ/MhluNlXvkvgy6Aq31bzplbEMup7UW3ioJnlyZdEEBdtgIaMCkV/9CcP5OlC2DMwolblkDGIpnI6BOM8mJIXJHftLkDv6YCWtiZXyjmHp+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O/Fzwsk3; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O/Fzwsk3"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LIYZgV008646;
	Sat, 21 Jun 2025 18:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Dd9iZj99umaHJEcHImbFxWpsE+0f+
	IXdMuohHxZlqSE=; b=O/Fzwsk3oCw8QyOBgSkKsURbsi3AIghTBVfbcOBuToQ9i
	YvOnSzdRxOdpUAbvQ3BiYSFi/pTlNkqFz9YKblD4wGuQby1DUrLHdeN97h0yTyrp
	pmJ38rziy37BuCKRypH8V7r37RyomFYkCo704U4r9seeGtU5sffX71iR7sbfTJjw
	X7XjwQ2VbUPTAKBFtlv1dpL7M1cwlnxA5k7HQXy0lRyxO11l6fNNiSRE4KvHw00e
	Dt4eiXFii2f9UtAxcFYZReJ1EiUw2L5XAyKEh4UUEu7eiweHpFj1T/WiPaOiZPWB
	9v3+H9wUltsrNMSySW600cm4eCJEsnwOjDr150IBA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7crchy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Jun 2025 18:53:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55LE4TMP034526;
	Sat, 21 Jun 2025 18:53:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47dk67wej7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Jun 2025 18:53:03 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55LIr2XG002700;
	Sat, 21 Jun 2025 18:53:02 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47dk67wej2-1;
	Sat, 21 Jun 2025 18:53:02 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: perex@perex.cz, tiwai@suse.com, phasta@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-sound@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: intel8x0: Fix incorrect codec index usage in mixer for ICH4
Date: Sat, 21 Jun 2025 11:52:24 -0700
Message-ID: <20250621185233.4081094-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506210119
X-Proofpoint-GUID: OEZ8hdpfEkdqASKukuF-8mLYe3dSoj20
X-Proofpoint-ORIG-GUID: OEZ8hdpfEkdqASKukuF-8mLYe3dSoj20
X-Authority-Analysis: v=2.4 cv=G5McE8k5 c=1 sm=1 tr=0 ts=6856ff90 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=96bbWqfXC7VXjgqvvdgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyMCBTYWx0ZWRfX0w0VY+4531sR T+oMjgoTVRmfuruY4b7xt3sd2AZmPM+NrrDuCbWtUf7DMH60UMQxiNdLt+YegzYucPrscONfQDF LSDqfynpTPGROj1lvBDoOb18SwuJXTtxpNBBhSnpyU3kqQkHbb1hensvGqKXtj2YcXj3ku7TdpM
 r/RfXqDA5MEt9R/3SXCWuGY1DQLQwbCChFpxBjc4HGDzr32sKuC0h5/g1lzaVOKQWnOzNm+PVij XG9T+T6WC6l5e3EdFj1RCQqjM5K3DQtCPxW/QnFUSrrv81Xj1HFVZWpwpEL37PiGs1YoMMLB64M 1Fh2DMErlilAS895llH44+MH9mWZNYbSYRjb4Ah+eg5yA13jpsSSJ9JhVn+55UO9P/POxA6ycpw
 0MFgB0ZN1xvFLhefLq5xlqRQiTsqB6dqbhqgntM9ZVRTw0EPi5rQHuI8qTWQyTFkehtZbF7l

code mistakenly used a hardcoded index (codec[1]) instead of
iterating, over the codec array using the loop variable i.
Use codec[i] instead of codec[1] to match the loop iteration.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 sound/pci/intel8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 51e7f1f1a48e4..b521cec203336 100644
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
2.46.0

