Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DAD283697
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846790; cv=none; b=gzArSB3p9mDnyrhFLpJ/j61ucAo4/q8IFpruPtRa3BDOl05SAiGBhzTV93gr9onnJTf+1xiruTthGYMLiajMUmB/ZbSvVxGw1DZ8Mvn5QZ2xmjuwwkXaCR16LzsMxcVytLKhQbZItPM1fBjUfLks7cAMIcEH1nOfIJHR6hd3vFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846790; c=relaxed/simple;
	bh=9h4CHeIz0ZSdcwQxILjDnh9zeRE5JUoePsz5Wo9Q/Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4rZVwznIsIfHPhtGAWEdguxWTRQhuad8b8U8NybRFSEDQpfrDUpsSSRkmX9CP1j42a//DpmyoK9UDGAGxKPFAfhSwd1FrINOwGTpFkQyS+y+rX37acsUs4LoXqWttWkxwFeqV3M6jsuizTZb6Yz9Pd407hZ92ZfXfyJQTx777Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dducDvup; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dducDvup"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XSnN027662
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kRX0zzReklLbdIucEq/kXgD7SAusNflHLJJbjNtjYsc=; b=dducDvupw9M6HT+S
	NLZBjd89p4uVba+8pcxnKSaAs3Z0LBr69gS5YDctaKse9mq5XL/nDfotIShXE/jA
	O0hk8r5VIGyBpJ0iMOrUMV9+whjDsRY0f+LC/C4eDVkz55hZt7KA1/XO+L/01IOV
	U9urxs901PzRLtXs20rr+4NdntsgzQnSGlPprf1vMo6f9U8K+9YudBX7eV+QxS63
	am28kqaAaAOMORLbjPn/tSoDqcyESO6qGAAiRAIlhcuk0gzmtvK2r/HYtiSRXYG3
	ELVEDxQhQqBNcTtkUrgqYhPt7nkcwwbF2u3a07+xU+h7FnwwgiBXwI8mHdrN+s2a
	fG7dpg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9bma0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3108d4ea2edso893310a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846787; x=1748451587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRX0zzReklLbdIucEq/kXgD7SAusNflHLJJbjNtjYsc=;
        b=FH13TVWBz4aIhwz1tXMyQCqGxyQIRwoeEDdKaaa7YS82ZFSx8XCVoD5RLIrx5VGPQt
         KNQpt8mH3tC7JD+BJZ0KyujKvoF3LYy81ysBrWzPlmfNDJAg6jpH53BwkvSQFl0RGmF7
         UZumjMK5bckjmJQ+IUWt+F/RjZcNKwoQpSJ+3BaV1cgecl7bFyditLX1Ic0ZgkRia0Ar
         XPu85MigWgQFCegctdZ4nnthDBI1IMrwoFsN3TpjQjuf3rwA0XGGYLcPYlZeOEVRAC57
         B/bWKC/hjns0/iADw9d3M8WZI6xJi623BEaQPpC12Rg2p1osK9qKXBhgwVHHZDZ4zZ5K
         YxLA==
X-Forwarded-Encrypted: i=1; AJvYcCWQGU2YHpno8uuHQPcarc+n9Qoe02u1SFcJnPJLxrfxUQTDjDsx6ZjV+FKjzpZ4rpi3Sy0z49SddwwZ1vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoYBqSWR0qRFhjfBPA/4xZcZTfpLEIxZcnMkhoBqLoubGs0YYV
	Yud6CtXVq29xXkADL4iLqk2bO3otWlcSBM9LyeIphqA1coT5gcJvPb0J6O6/ulKfNeXn3dNQdm+
	T03JubxFkrcHBPf+M6M+sew4Ea79AALQtzhJDCFq3Cj9330LChG1vW0e+O3XVXRfxRAo=
X-Gm-Gg: ASbGncv6iED+/qcyvorB5j5WVHN2nD5loQ8V3srNOBcJuKx3yHQJPLVHqmiTciIaXkg
	WE/pUeVOGBljWlwBWH8PKkUBiG8KaJGwNehTuBBcKtz/eaU4500PCwMK18+/IRQVf8j5M18oAcQ
	QVvUogwlQk4GMWRB3PuwWKEP6I0IqYl5XxLXHsVn9ERftjHpAhpE+6r5D3k7uJCsrvkF+waOxqV
	szh5jffJZOKltAv3HqM2Ic94jza86RQa6Ucw3ig/mJQ9K63vNwLhYGXyt52Olx56YPUNLTYt0O7
	fNtSqACXKwi9ccCM/+7hGCwFyGWVjeK4GNXWWZfdyRI1A0OnggXBxIDieqkocedbGSyMWU0Wj5U
	wYAtSpq6SvPhiS/A9RwM7G7u38TUkVol4K0Nq
X-Received: by 2002:a17:90a:d443:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-30e4dbb703cmr35546437a91.11.1747846786584;
        Wed, 21 May 2025 09:59:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc2UvuBl5Dz/CL9fnSl4sMzh3CrOMKFOauBAMCgtqfKqZFgw34cOqWHM5pWNQAouNdLkqitw==
X-Received: by 2002:a17:90a:d443:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-30e4dbb703cmr35546399a91.11.1747846786184;
        Wed, 21 May 2025 09:59:46 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ee3sm3875055a91.18.2025.05.21.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:59:45 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 21 May 2025 22:29:31 +0530
Subject: [PATCH ath-next 3/3] wifi: ath12k: fix regdomain update failure
 when connection establishes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-ath12k-fix-ah-regd_updated-v1-3-9737de5bf98e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: GO4JO8T1RtZSaQrDhyskC6a_lzVkKdVY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX8FJCbby4O5Z4
 2MBpyxIgS30IeoUz3HXDXAquRrPk9B2PJumRTSm6M4LsxAPVXZjFr9/SCdw/JgIFab3egeZaoR6
 fi6wJL0SoLHmfmUBE84Pd614t7aAjiAyuYowgP6nvhV2ern95R6W0nsVLtyANK88hzfPiISqc9P
 eyb29Nu20p9izin5R1ruQgqiTCdlSX08IivzNF9ah0xDgEOjDHc+K1r1fKcS8Ufl5H8tXaf6d5P
 1A7aLq3Jabif2dSycL90YHxaSLloQoJiO+hhTbWaerfc5FpvBPnBjOybgjIQ6e9KMMgbuPiYVKt
 BcLdL4sCCw+qK40OXo6BTyJfpzNCHG/518Lk/76Tl7q6EN2XEjRSyZYHWULlYL9WRpIcDag9u9t
 ARd69qUOdBLp5m7kG2ah+3C4vQ1jdN+HP5RnSLGXGqUKHrpAMk2oaC8GBciJ/lETS6KRpHcR
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682e0683 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=EWTaEqaxvK_2CoIRUyUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GO4JO8T1RtZSaQrDhyskC6a_lzVkKdVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210167

From: Baochen Qiang <quic_bqiang@quicinc.com>

Commit 7ed3e88664e3 ("wifi: ath12k: update regulatory rules when connection
established") introduced a call to ath12k_reg_handle_chan_list() upon
connection to update the regulatory domain in cfg80211 based on the power
type received from the AP.

However, this update fails because ah->regd_updated was already set to true
during the earlier regulatory update triggered when the interface was
added.

To resolve this, reset ah->regd_updated before calling
ath12k_reg_handle_chan_list() to ensure the update proceeds correctly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 7ed3e88664e3 ("wifi: ath12k: update regulatory rules when connection established")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 755546246915cb355fc6f40fef85a87b880e2f91..88b59f3ff87af8b48cb3fafcd364fd9ced4ff197 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5860,6 +5860,7 @@ static int ath12k_mac_handle_link_sta_state(struct ieee80211_hw *hw,
 			link_conf = ath12k_mac_get_link_bss_conf(arvif);
 			reg_info = ab->reg_info[ar->pdev_idx];
 			ath12k_dbg(ab, ATH12K_DBG_MAC, "connection done, update reg rules\n");
+			ath12k_hw_to_ah(hw)->regd_updated = false;
 			ath12k_reg_handle_chan_list(ab, reg_info, arvif->ahvif->vdev_type,
 						    link_conf->power_type);
 		}

-- 
2.34.1

