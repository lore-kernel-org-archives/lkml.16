Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C119C558;
	Mon, 23 Jun 2025 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688899; cv=none; b=PL77z+3AcgFsXo2FgeEbn9gem6bgmevELNVBjEOT2MFfKPzqs9gm4svrI3svdS+Hwhy5D94N4HLf4M01VtB6ISycASHfG5KGB8DLQ2ieXd+FH3R5QtYrj/TnkTgLGaszSFuWJzPScg9p/eBFHr3n0iUY8RelhQikBsrIJz41DpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688899; c=relaxed/simple;
	bh=KW7I+P97+7L5+rcy92tgqj2+DOEoqItBKDMbPp/KzL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MM1tXLpBGkT1PFOJErO2gGcoCl4i+6WcYBUeuUOsyOLj2EnjfbXhmMP9tjf88QHtXgcXV3QxA4oriJqSNaJ7ThEpH12wcRcif99AMo/aPdW6m5repEm0spcqvy2OKcOTxLAwpveZNaOSyceBtOkTFM3zXlKhl7Q6QuCcbCi0RCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qkQy+iUo; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qkQy+iUo"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NCifMY015754;
	Mon, 23 Jun 2025 14:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=CCDzK9+44iTyH/7mDUQkYK/oAq9ZA
	KVcgzkyjg6eaR0=; b=qkQy+iUo/gx/Y2AU5l24+uYn7LwcRmZwpK4k8SoIli8VX
	/nGb5aK7BIdyA0iKjivt3GOmyHpTGQifEFbirRdR0vlEEFELMC+sRULTyQjyBZ18
	DyIrLMXqirKHk+VNogVuw1XTI02Yy7+2jmz8Y2O8l9wxpSPnFzXEKnFH4jxoBS2W
	yA4nS95EAyA8tp+mBEb1rM7KvRQpi4eiyOX9riQihimFi3UlaFgOBnnZ2aYVkTOi
	+KW5k+oP81uUfhWmRKm5EQqIxJXFZNCI3DdADzqSUwc9IAccrYzH+DCDIeCt2vnq
	oLqL5cbvf7wmbgLwBGLdn74YJC8XioundF4b9ppdQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y2udh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 14:27:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NDlcBI002094;
	Mon, 23 Jun 2025 14:27:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpbwcrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 14:27:57 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55NERvR9012500;
	Mon, 23 Jun 2025 14:27:57 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehpbwcqt-1;
	Mon, 23 Jun 2025 14:27:56 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com
Subject: [PATCH] ALSA: qc_audio_offload: Fix missing error code in prepare_qmi_response()
Date: Mon, 23 Jun 2025 07:26:27 -0700
Message-ID: <20250623142639.2938056-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506230085
X-Proofpoint-ORIG-GUID: TYwJhXHxCklzym2WIU4DUjmx64S24ePr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NSBTYWx0ZWRfX0pEGJ6Le/ogr n4p/gB+dXeV1xcSCb0pMcboviD8WkSyHm5ym1RFPwo9vIVBrO+C3IiFuMzPNWHbgQ47YiO/Jwgr enfOt8wHgHFAVB/Ass3KUoq3VQpiPsamFyXwDGgWaqm/URdiKs64ov3CJ/iEnFt9FK8yFvq9KjA
 Yg+rtcKOdlfn3UQ2URTrs2g3aLhHsvfuajPM7+WCcf/8lGH2799nbZCJOQbeURCyTzbkaCylGuU Zh/MLQ89f3oTvHHwWEO1f82wzggD7eBzC/L1cOoiqs5OvwRlLMer/6gmsB02EYpl4ChfuoI2KFU k3msrRFAYF5dXLuugD9qaqsAiOMVRVmv9Me7U1JO0lAF8URzsuUW9jpaf37gMBg1Pmtvf0FhTcK
 Wte8sKsoyiN+vANfC3pZLcr4l8f2M+NMWlsVprI2bkCJ++beOQ/YNChaoyOOisTYjrYkoURl
X-Proofpoint-GUID: TYwJhXHxCklzym2WIU4DUjmx64S24ePr
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=6859646e b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=yPCof4ZbAAAA:8 a=Qirn1T7C_uplVBtqCygA:9
 a=cvBusfyB2V15izCimMoJ:22

When snd_soc_usb_find_priv_data() fails, return failure instead of
success. While we are at it also use direct returns at first few error
paths where there is no additional cleanup needed.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/Z_40qL4JnyjR4j0O@stanley.mountain/
Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 sound/usb/qcom/qc_audio_offload.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 5bc27c82e0af..797afd4561bd 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1360,20 +1360,21 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	if (!uadev[card_num].ctrl_intf) {
 		dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
-		ret = -ENODEV;
-		goto err;
+		return -ENODEV;
 	}
 
 	ret = uaudio_populate_uac_desc(subs, resp);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	resp->slot_id = subs->dev->slot_id;
 	resp->slot_id_valid = 1;
 
 	data = snd_soc_usb_find_priv_data(uaudio_qdev->auxdev->dev.parent);
-	if (!data)
-		goto err;
+	if (!data) {
+		dev_err(&subs->dev->dev, "No private data found\n");
+		return -ENODEV;
+	}
 
 	uaudio_qdev->data = data;
 
@@ -1382,7 +1383,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 				    &resp->xhci_mem_info.tr_data,
 				    &resp->std_as_data_ep_desc);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	resp->std_as_data_ep_desc_valid = 1;
 
@@ -1500,7 +1501,6 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));
 
-err:
 	return ret;
 }
 
-- 
2.39.3

