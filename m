Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C05280CE8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846788; cv=none; b=j+1HZJMsxVDY/MqpVbt2jE7TbGdXEW3nj5IM9QLSHsahZRqtEsh2Sm8Df4sd6H8C6bZ0tgoDQJmdEInXpwz8v3rcf3wYg+PXkQDX1TomlVEQw0mqBYr3z431Gcl4/FOxlL/1es4JsJ8VZfqVH8M0vpcU3y6gtJcATEWr5sX+IBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846788; c=relaxed/simple;
	bh=KjPiR9D4kqo90F2+qJ/NqCDy80W5xLZrMNqVy89mZ+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcncH8hxB7eu3CatC/IKMn4B1wj542PUtHB4WEmzHgWOCocjQkBwTFR1s/LH4k6KBdtW61FWIN6Ffs6Fk8UA3WyP3HosDeNDUGNqj3iCAv5x0zVtjVWQbgNhvq0QdpVXrTw1EeUPXEOIN26+kR82FXR698eBqYT98Tw+qwuhh08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJiyUde9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJiyUde9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XLpp016582
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WL3+vydyMIJ1To8zYn3AtbMFpeDybXOzCHGE6ghysnc=; b=CJiyUde9WmTIwT+Z
	VhlDJwHgGE8NcP284SxFISm4AlBD4mcS4RktaKJFd+gc0LI6FfRHwobFlG8MpLyA
	xsCyEqHIjL8D1dcsDGh2aU7HFWXaMmt2Q6lzrM2rGeyjW1Gu/rgV8JHCRb7mIQHW
	ms8IS826A3NhR+bWK/V+jwOAY+RwxFiQ4wqN7yFk8Ho3S0Ku1itEH+QGLRLlMjUU
	8k3AWwBVYYZE4S/REi4yoT7SLodsD0M3+e4G/x/1KIes9I1w2F+0rgYeyGMaKQ+q
	NSu8452wEs1rBkWm4A+VP57LE1zMer5urgywg8k8mxSGx4UJPuKQrSFO7rvh8DU/
	gHjKmQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9up9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af59547f55bso4276271a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846784; x=1748451584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WL3+vydyMIJ1To8zYn3AtbMFpeDybXOzCHGE6ghysnc=;
        b=MHPfRCZjvqVhMTEGvo44zaXDPoQbb+zLHsZ50aEff7EQZe0WeK8evyiY5cqR1dwcBS
         pB8wGow9I80ldRN6nRaum2jyJCDZoGZVxRS6L0VwBxru2Ei21SkWF9kA8fVm0l17H+qu
         auAcf9jP46EluXFMnAAufKFuCg79fA1B0IGJ/ZippBY+oBiM1aYg0Fj3x38RRXkqdyON
         hpMTJknUtbsB1L5lmw9UQH6pOBbNgXevTEKWAm4FEbCcEBJvyu1P5Ujplgcw69ICQkhq
         6b0jBhbjg2FGfGQIIlIFWCjH/DZFVVR1g035O92ufrxFx2Sawpzck8yPGNmjnh8h305M
         GAJg==
X-Forwarded-Encrypted: i=1; AJvYcCXuPejQ4H4jFd7Le601yPLjpiEd8LQBvH5f7ZlXE0PFrZAXVxGG14fAxf3oJJhAg5MMabmCWZVUA7kiF+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vl+iuQv/SY4Xe+HpLg0EVUINgt48ClHDs0oVUTi8yqr4R5it
	pDBk+yvmBV7Vg08+2OiguwS9gvCfj43MhMGKnM20qSfqImjFgi9TPWOQy5YRzmpmhIXejcPV0LX
	+xF8gpyTmClQ6x5YHWrEaKbAokMW7e0kaZuqxkSNTCloKHt2v7KyOifdQPSbLMve8Byo=
X-Gm-Gg: ASbGncsjzxLVRBPfdo1w0hc6UOTvSriRN9QB2nFBIEMn8wLz45K97QnHygIkaSWWg8R
	kyui5VBLuOI1pQIXjq3m4iQ48zZ0VREwewsO9WMPvLvvwAMUZ72FVhj1lqIwK7cPT2d15Q26KDZ
	1gK7Qsvbt65L+Hfq6mPkLJ5UfpTKstlm14S+WnVLLj4N2s6320oUD/F3XLcxHywh3ZeDqbzIimt
	0MRrKy22HZE9zQD66ax+LY43fx0nJFtJbFSf8wHFk8cgB8zAocCr1BiScY3Mx3LJucRUJl+k6T1
	fUDL2zpUh1En14GIqEbJhK/YJKiZe4kVDTiItqGsbwlk1gaPtZg3nvONpLBVDcz7PXR5o2oTwcn
	5awYLbqIKod+nK1gTqNNCxRgLOKk6+LH61sDC
X-Received: by 2002:a17:90a:fc4f:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-30e83216290mr25433521a91.23.1747846783514;
        Wed, 21 May 2025 09:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL5e8jDdzNZMMd0TV5+CNwRTfOM/yevICECgWpAkW79RdU2B9pfHaXPHxgwINBivapixqfUQ==
X-Received: by 2002:a17:90a:fc4f:b0:2ff:4f04:4266 with SMTP id 98e67ed59e1d1-30e83216290mr25433481a91.23.1747846783123;
        Wed, 21 May 2025 09:59:43 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ee3sm3875055a91.18.2025.05.21.09.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:59:42 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 21 May 2025 22:29:30 +0530
Subject: [PATCH ath-next 2/3] wifi: ath12k: fix regdomain update failure
 when adding interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-ath12k-fix-ah-regd_updated-v1-2-9737de5bf98e@oss.qualcomm.com>
References: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
In-Reply-To: <20250521-ath12k-fix-ah-regd_updated-v1-0-9737de5bf98e@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <quic_kangyang@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682e0680 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zyJjCoAm0S0MJ9WaK7cA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Hjay9-nOE6DQJbkG1WyXCW2qsuSYfXTp
X-Proofpoint-GUID: Hjay9-nOE6DQJbkG1WyXCW2qsuSYfXTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX6f7Ttt26I2jd
 a5P/7APVXRPInpUDHGPS6cJ2Ip0ye2O9mCFLrf7SvjIrCILUGYGAD4JKveA7IUpNJEy3smxXBhi
 DZgQWFrZMfM6HAp3+YO7vA/K3t8QWzPQ3/Fth1MHhwvrj95SpFjHuxz2PtG37OCYg+h+z0/aOnt
 oNZcl+QE1a+4iGyCecqHyG65O0BNSmgdp5h4VTzuU9Nm6WvNA2Eo1NBLe7Ls+a6GPzqYb/IcQBW
 HcUw/RkxZkdNbqguNpm5d2/Me1rqE6ti1iqVA+Pe7zcSseDOnG8n8xFH1Llizf2WAkidU4rKOgU
 EsOBqpXvjFjOJDai6Vqem+mBg77yYejGPqfVHK/OlXFWVluQJIUktcSXn0pPcrd8f2d0xz1FCZS
 hWwNSH+UhMxOa5MC+uyw3jaacbtdVn8YgpHCbch9VkevkFfxlcoH7LfalomXNHTjQGvhXNJW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210167

From: Baochen Qiang <quic_bqiang@quicinc.com>

Commit 4c546023d71a ("wifi: ath12k: update regulatory rules when interface
added"), introduced a call to ath12k_reg_handle_chan_list() during
interface addition to update the regulatory domain based on the interface
type. While this works initially, subsequent updates (e.g., after an
interface delete/re-add cycle) fail because ah->regd_updated is never
reset.

To address this, reset ah->regd_updated before calling
ath12k_reg_handle_chan_list() to allow the update to proceed.

However, this change exposes another issue: a timeout occurs when waiting
for the 11D scan to complete, as seen in the log:
    ath12k_pci 0000:05:00.0: failed to receive 11d scan complete: timed out

This happens because during interface down, ar->state_11d is set to
ATH12K_11D_PREPARING, and during interface up, the host waits for
ar->completed_11d_scan even though the scan hasn't started yet.

Fix this by updating the wait condition to check for ATH12K_11D_RUNNING,
which is the only state where a scan complete event is expected.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 4c546023d71a ("wifi: ath12k: update regulatory rules when interface added")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 drivers/net/wireless/ath/ath12k/reg.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 81ff32d2ce5afce582b78c17fbdf5082e4394798..755546246915cb355fc6f40fef85a87b880e2f91 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8833,6 +8833,7 @@ static int ath12k_mac_op_add_interface(struct ieee80211_hw *hw,
 		ab = ar->ab;
 		reg_info = ab->reg_info[ar->pdev_idx];
 		ath12k_dbg(ab, ATH12K_DBG_MAC, "interface added to change reg rules\n");
+		ah->regd_updated = false;
 		ath12k_reg_handle_chan_list(ab, reg_info, ahvif->vdev_type,
 					    IEEE80211_REG_UNSET_AP);
 		break;
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 2134e72e0812b2a0bdc537ace456ef7af1db0726..2598b39d5d7ee9b24ad8ed5d6de1bc5bbc6554e0 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -139,7 +139,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 	int num_channels = 0;
 	int i, ret, left;
 
-	if (wait && ar->state_11d != ATH12K_11D_IDLE) {
+	if (wait && ar->state_11d == ATH12K_11D_RUNNING) {
 		left = wait_for_completion_timeout(&ar->completed_11d_scan,
 						   ATH12K_SCAN_TIMEOUT_HZ);
 		if (!left) {

-- 
2.34.1

