Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4258827CCE4
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846784; cv=none; b=CNvjUZMWTpeEGSWgJXBIxjJv/eogrNmXLK/iByYuC7+bUdpC8rsgXUWuyqw86Q5pHLvH74aXP3CDNBmaSSRMARiUlM4SsmgdOqjMoHqA81yx7G/2n71CXlfPg34i3AlGXChqV5n2ti9kiskqlM4MSuG9GYf9Qs7yeaE+6OkqOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846784; c=relaxed/simple;
	bh=a22Xg679k47dJlTeZgzeacgRfyEdxBCUNrxpYMuHuYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dc0J9ye5FOyJrMG6aBs0rWlwCd419aJD5JUAOXjVqacmxzNIsR0+qoFCxgWaoqHQJQeqnWIaxVf+RPWGPJUOJQiGTua4t40zfx/7hIfOjoJOzP29IME0IwCcFczim58RBzQ68QMKD/ej3U47+JXlATit1Wc5S2rVIHJ+VD6zgq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5E5m+hw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5E5m+hw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XLSS011326
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9N7o8Gtv5VKo7HD4i4yWeR4Voh2e4WFUyOnmq4cK5Mg=; b=U5E5m+hwpB0BYvuy
	/RGutLbzB2Mkhg+HM8NieZCdUzAhRoxukoR0MkRILP8sWVxk1wkgensqHYZfAhRP
	5FMB0g4GGFbydQBgjdOTeoq+R+v3PFaRyBz6dpskMJM7APmX2DL73eR+ghQY8UQ2
	1kGWvf3L2nuuO5WuOa/7L5q1oYk93zPDFe+oIU7pAWHwOPdfLmkGjXld1sdg4muY
	IMCxTL/w5DgL/Y/x+tRmouuCK+6FAIvSd/U+PZ8S12K8/J6wzB5cfFwQoDqVNWQc
	Bm0tdhDE4Iy4Nr+QIs2FvsuONBDXCv42N3R25AjyK6CKvjDWPYbgVTk3sXgL9z7+
	SC5New==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb3mb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:41 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26f30486f0so6396411a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846780; x=1748451580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N7o8Gtv5VKo7HD4i4yWeR4Voh2e4WFUyOnmq4cK5Mg=;
        b=Xpj8/l0QYKxjPxVGEFyemPrObB7cg5ffNlOSbbZWBpyWls71G60zcHLf30oVwZcArV
         E8zpYjS+vjG2eoIvyKiEAXYTsbNBH7dJNyEJVGr3pSU1qZDaIqQjdr3sGqytmI6Zhwxt
         7UOYARg10PHt7cTHRZ9eTZN0XPP7AfDu36k2g5WercjZTnIXLriRMSbMJ6NBBB29jIgu
         enbUhe8nHWy2n0hplM5+WXHOsxlyZ17vS3s2Klve60oPTs+MeaFARemL7buquHBXt+WG
         yC1RHCmeQPWjW6KwfQTGGna44sd33tTw3vPoVDEKYtedyIYRpU7FXJvuX1nysSEEaniB
         37+A==
X-Forwarded-Encrypted: i=1; AJvYcCU2k6qXQgcb4DKvn9GqtKIQDTV6sb47NKfo07Dw+8H6AwcxQrPy5DhecPdmup4oQKICdQYwb6Pe3EgU2TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfS5AcM0RzFHJcP0OiBuDLv6BMsjDcTvfsoNWIB55DZUJvJttu
	Fnv1gydDr+PPG0SbBq+OKks4u3oBsYzUoMzYlOgRW9M21isur5cW4W1+580+jR+Elm6c9gfxWU5
	bsPBUPjrLXGOAr/yR15zsgaH0YhsEV7XEp70vLfj75HrRGlgbEkX5Zuxv+lVv5qYh2Ko=
X-Gm-Gg: ASbGncsU3eoVus5ZmGyfZv+y56xaq/O0yoXy1XL6YM+ite/CJRNFQCBAeWXMsstrsiw
	vwL5NbLvbjc7UqutmLqFY5n34FbxQe/ROFv4MpeukaqimwzthAy/LGMbIRSZtFjBHofJlxcAwme
	bb89oSRPnjb/xZkL5y14bX3MLqfvMAFFDLoX8w2SdA9gZ28o4iLurLCxpGlZx4uNLWk0kaqtm/p
	Tzs7bfQ70k5tc9SDtZeidxnMlnUErO1/DsOORKM4b6hxrshbeVyrnNlr+OMq9z5UO26jaXlYryq
	0EXbcui4lEEoYcvxp0vQ8h4nPZs9hNCbIh3r6uGpaG+TFWH3S0OEW3V9APbnaTVI2uDsRKzZD+j
	dF3LGkueTLRczt5Nb/ni9fFLt0IBE9XC+Ggzs
X-Received: by 2002:a17:90b:574c:b0:30e:37be:698d with SMTP id 98e67ed59e1d1-30e7d5bb328mr29656795a91.31.1747846780547;
        Wed, 21 May 2025 09:59:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZc+dVjzwwaVBTS3Tt9uMHWT6AEG+rnU+TbXB/vJXuImTmE61jp67BAaSi5VwpwBCimgRn6Q==
X-Received: by 2002:a17:90b:574c:b0:30e:37be:698d with SMTP id 98e67ed59e1d1-30e7d5bb328mr29656776a91.31.1747846780054;
        Wed, 21 May 2025 09:59:40 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ee3sm3875055a91.18.2025.05.21.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:59:39 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 21 May 2025 22:29:29 +0530
Subject: [PATCH ath-next 1/3] wifi: ath12k: fix regdomain update failure
 after 11D scan completes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-ath12k-fix-ah-regd_updated-v1-1-9737de5bf98e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: j_sK0ghJQ4xog32MHrDZmMIOqUTdU35x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDE2NyBTYWx0ZWRfX1SqpFza6+SzM
 hE5zZAuWGndNqMKni4HknS9Emh4hGmV3QbOgAaasDEYFtIBuGGfNL/Db61vrg/Upb6WWN+zmkpN
 gVcpmsWMAzG0phfevHgAE3krvUcnV8Ds8XPS0L2/1agriWDeAnW/k413/EG6wjILiPO54t/yuKo
 Ybm3pof/AivaFEpVtQQ/tfKQFVpMVEUQyaML+WI0OuekSrMRwEzHKdL/WaCCZz3lOAycn8EL0nN
 PWh8HxDWXsFXrbsRlI4W4/WxHDrOOpODoCU/MBnMxwNGqIlIO/zjjpF2veQ8HV+CfOAVaAn3YtA
 7BSNdTVcAtka3KApuF767ini6uSQICeMin3Vf/A3TzXrszsWEEjbCxYrycDKmMJOHcdd26YKAT4
 14YB0Ax62as3jaGrU1RDhlFSPn5jQxO6NskVHDCTpn24JcOMxRq5HHIVApNLi/AFIkiryYnH
X-Proofpoint-GUID: j_sK0ghJQ4xog32MHrDZmMIOqUTdU35x
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682e067d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KP9DAE7PHRlDfdeWwEUA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_05,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210167

From: Baochen Qiang <quic_bqiang@quicinc.com>

In the current implementation of ath12k_regd_update(), the ah->regd_updated
flag is used to ensure that the regulatory domain is updated only once per
radio. During MAC registration, this function is called to push the default
regulatory domain to cfg80211. At that point, the hardware state is not on
and hence ah->regd_updated remains false.

However, after commit 4c546023d71a ("wifi: ath12k: update regulatory rules
when interface added"), ath12k_reg_handle_chan_list() is invoked when an
interface is added, which in turn calls ath12k_regd_update(). By this time,
hardware state is on and consecutively ah->regd_updated becomes true.

Later, when the 11D scan completes and a new regulatory domain is received
from the firmware, the host attempts to update cfg80211 again via
ath12k_regd_update(). But since ah->regd_updated is already true, the
update is skipped.

From the user's perspective, this results in a failure to connect to 6 GHz
APs, as the default regulatory domain (the only one pushed to cfg80211)
does not include 6 GHz support.

To resolve this, reset the ah->regd_updated flag when handling the 11D
regulatory domain update.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

Fixes: 591de41d7008 ("wifi: ath12k: add 11d scan offload support")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 72e7730c7694bc7a5fdcf007fee1310bf67b5654..60e2444fe08cefa39ae218d07eb9736d2a0c982b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6125,6 +6125,7 @@ static int ath12k_reg_11d_new_cc_event(struct ath12k_base *ab, struct sk_buff *s
 		pdev = &ab->pdevs[i];
 		ar = pdev->ar;
 		ar->state_11d = ATH12K_11D_IDLE;
+		ar->ah->regd_updated = false;
 		complete(&ar->completed_11d_scan);
 	}
 

-- 
2.34.1

