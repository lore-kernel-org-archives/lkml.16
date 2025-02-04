Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E00D21639A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688728; cv=none; b=JL+bfGD2Xl4JTeAQYYUfo6nNeyHsOve8I4dofF5DN7dRt4ae4qY7R1843v8f47pCzQKr28PKB8f6AMLIkNzwea6A1EV1F6k7RatlvUGLTAIDn2DJMllyIAV6JFQhKzE8/JECswe7QRSMckTcwKo8AkUkc/0N/CN5g6Oe/IOaDm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688728; c=relaxed/simple;
	bh=dM4Q91rzLBnr4OE5cBXEjGA2EQ/BqqgE9G/59+YtMoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BiCAowx3RK7YS/GnBHPuzdhKuRNahQLei3wqA0SA9uPjVy/Cx0Oobog+zO0OpIAu2jA+5H3vqMY5+Vsf1/+22E0ujZTbTMu8v+WVzU3RgQLx8rWT5KfTtyd+ZFZgRt8EByEYp52eiMif9wo4fADG9zxYjGZ8jj9TyfTumxRxIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUKL34PU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUKL34PU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514EWYci016950
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 17:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQTyuAWmUFPgAQKIR4TL14IlRB58wBIAJ8OSjdQfdm4=; b=RUKL34PUZSk4/Avq
	Ki8be12eYAOTP6ZCwht519p5q4Dm/Kg/GV7q9izxwXxg6SKfmRcdDETcO7zRrw1Q
	uEOCsfrO+HKexurJYBDfNZENiyF0gDd48XhqvMSg9lVROdRDHHs6ynvOeTBnsCUq
	1rtrbNUxzELOPItn7vhzJ7jJxscPtS06PQt5LrULMuKjPymQEX/zzECQQ4bgnfD5
	h2k8MimYLk9biKi6gf4K9EQuLCbs5SAB/o4qYaFHXXIB5+RVI0QrEOMjHzF9G4NM
	xY5pAlVgQKHP0cLa4mj059MyNWHJkEIuNb2bBA146CMoO+8xTHZRcctPRIWsTLKs
	WAhWMA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kmre0cke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:05:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2efc3292021so16516241a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688726; x=1739293526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQTyuAWmUFPgAQKIR4TL14IlRB58wBIAJ8OSjdQfdm4=;
        b=P7RK/IHfZ1j9ld3i7b5Jvy8p0dQnOlh61MAee9c8SXonPMz8GDFr7j8u51+xETOwp4
         504/bnAb2H0YDHPrP8vrenlHHprfyEv+W+LHskKf8ESrjG9tuyAsj83B3SAPtPIYTfIg
         19cYTBdAUGGG/SWJBwElUOJczVn118cT25AgYhTxFN6qE8e9OzmcYR0jQKFc9LbSAyX2
         L0AYZcBUrWqQIAHOr+sa5adqK4XlQD+2MkQDyHLxFarlaLIeefkO/ambV4Zrqt9W92T7
         QU4Q+4tKjHqCbhTXbtuki3X4z1uGxo2c94yyscJlUJuEL+9fF7RiFPJFRRRQ6dxDtlFV
         PsPA==
X-Forwarded-Encrypted: i=1; AJvYcCWigg2Xs8Vb5mrj+gsgDyQ3OwIDba1nzLR66Ftg7bE3slmnqEngmWU0Gven7UcD41oIOQpGj9B8PR6F62U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7GZDlqfuVREdACJ6D6Tj5Rs9VELDhf10HeBp/mIKTufEe5+d
	USrq74oD4pTEVMXgA8ES7Ow2cwfAoG0hsyCNCadBAJt/NaxiQQc+VBMlw2LJ+E6nFIKHJvJRLRu
	peF/WGKRuJOJbWFLLS3ZEkM6qLLA1JjsWvqS5SAAZPzd1GvK6NZrdwVRSdXaux1A=
X-Gm-Gg: ASbGncvPFgRuBUnvg2BNkBGPoNkMBp/b81XH2vX3kMIAtXUFGJKuq6k9aE1puZcV34u
	51vB+FflOO78cwuY7VJvRQe8d2ZW9DAnkFm6j9yOZ1P6+f0BlTIUjyLdhrKhjJ/kDJM5mPToknr
	oLTiQJpWd7jUqXIMPmQA61iR7SaBNlBTr0BEe9N2etk7B8kWkQA7bwGYIsMBlCxXzMdeuweJG90
	u1PEz/TOPyqWve9nrN6asrlm14WTWYSqMfkZoz/mY8oPP/H8J844czZVBwfpUAmET/4P7ge3wkJ
	R/uZwzIXuaaDPaVG8t6E0DODy6R9H6hnr2cO5tnpQWKz2KuN/Hxf3wTw3h7rXm4v4PhVQrJIanX
	t7aQ7eisN8gS/HZL03NZsfA0PVpqFAA==
X-Received: by 2002:a05:6a00:928d:b0:727:3b77:4174 with SMTP id d2e1a72fcca58-72fd0c7f7bfmr40485140b3a.23.1738688725894;
        Tue, 04 Feb 2025 09:05:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWwMmLGyTw18js8RIrutWNTN4NIewNUcg9CwPYOFLN7vXFURF6WhyJs710xW0ZmzHIAw3JFQ==
X-Received: by 2002:a05:6a00:928d:b0:727:3b77:4174 with SMTP id d2e1a72fcca58-72fd0c7f7bfmr40485107b3a.23.1738688725498;
        Tue, 04 Feb 2025 09:05:25 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:25 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:09 +0530
Subject: [PATCH v2 3/8] wifi: ath12k: remove redundant vif settings during
 link interface creation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-3-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: C3PAyNTpzqI_878Ay8PoXYZlBzhKPx_S
X-Proofpoint-GUID: C3PAyNTpzqI_878Ay8PoXYZlBzhKPx_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132

Currently, vif level settings are done in ath12k_mac_assign_link_vif() as
well as in ath12k_mac_op_add_interface(). Since it is vif level settings,
doing this on per link does not make sense and it contributes to redundant
code. Get rid of this redundant code from ath12k_mac_assign_link_vif().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 16e6f2fae943d3fa6a46ab1ba6780c9070418279..7defc2b20fb61dcaec06d0e332c48a1b6cd2f5d6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4022,13 +4022,6 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 		       sizeof(arvif->bitrate_mask.control[i].vht_mcs));
 	}
 
-	/* Allocate Default Queue now and reassign during actual vdev create */
-	vif->cab_queue = ATH12K_HW_DEFAULT_QUEUE;
-	for (i = 0; i < ARRAY_SIZE(vif->hw_queue); i++)
-		vif->hw_queue[i] = ATH12K_HW_DEFAULT_QUEUE;
-
-	vif->driver_flags |= IEEE80211_VIF_SUPPORTS_UAPSD;
-
 	rcu_assign_pointer(ahvif->link[arvif->link_id], arvif);
 	ahvif->links_map |= BIT(link_id);
 	synchronize_rcu();

-- 
2.34.1

