Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A65189913
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738643049; cv=none; b=WAyMliCMrQjpp+MEvCG+rSI/euLeJPnZKWHjyK/fl/hV9w4MXC9tQAa8cfoNRDoZbt1nQCNolrCWdRIduOppMKR0af58g2ig5GoTw+VMT6rxymougCkY+tstu90aEFf9W8FqjvHNNJEsZpxVaIGwsOR/C//aLMeM/Hu2lt2q+x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738643049; c=relaxed/simple;
	bh=2EiBqGmjjFeGbES49N7jBmM1eqO4+flMSSconJRqC+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H7kNgE0mnS7Gu+WBi9xE6F6kK3P1Kpj9kAFx/femhjxGxyjZQsDznciSjRKoGRmTmQN4ncAUayKZJDQSVGuizXgW2dtojn/1JqXahhk9QMeDrrz/SivCHpjXScJXBgceieMspqyVDjm11jvyfTCUacoQap70wTs7gRxyDjNBoTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZwRpsvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZwRpsvg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513Ipdje005920
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 04:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqFb+cP0lljHDkbZ2f9V4FJId+CUmhUIBF5/NENtV5o=; b=UZwRpsvgE66B5fsQ
	aI5KY/1NRCbroSvbKop353xhUyqvyz3kA8R9jQ7BpdLKAfbEpiCZDJ/2Rb4B5fwM
	jnImr+5dXYuAmrMCRtLUySv4DFzNxvp+8DhF4ukugLnHaQJw9xDjqOQAuKvQHfxn
	dE4Med1rZcNiqmspA/WtX8ibOdPSXNhxL9qTD4ruj7ZcrN2lPUsqJMckov/8qjBD
	++hV9T1rBijs8A8anovBuJLt0aVRhRqBMtfZfd+hRPHX178Ssv7U7DwSuEWvnq/N
	1jmPWeruvr7pOq86V38iXXEPlqhUc3dnroFf8WufdBDqAl71OIMiKKC4W7uD6Szw
	eec33A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3ex10sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:24:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so9994930a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 20:24:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643045; x=1739247845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqFb+cP0lljHDkbZ2f9V4FJId+CUmhUIBF5/NENtV5o=;
        b=lzhzGLNGW0g0IZKJwK74t4M76xyY1bVXX2kD+Zjrvd+0sXGysYRYldjJZSwW2kjg/G
         6OS2aEE1qVxPBAzuut5coQDDlsYGeVbAohWsrnyTfR7douhw8FvTHK7bywGex/3f/bJ7
         osNkXQMIoSmA2zVNQBkCLrigAasBJhjcBnjB/ccR6ukvQB0ld+RtLMCOWYdePFhpPYjU
         GyASYH63cV1yFu/u/686QlQVKs9KBzstgx43yShZ0Wvbp7LP+4fwZqRFCJjPxqjKxsuR
         l5Bp8WxbL3OLLB2lxWGwDizDfc2SEvD4CONeHQ2LiqvxrkKwWydrt1Ik6/Yfmj7GaLzF
         fTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/NSG2ficHvA1eRro/rV4yJdhKBr5g4i1MG2YIh08ayHNXZmNPOJMJh8Mxia7eYT0X9zvbGFIu8R+wMcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKDkRoHptHJnWFSckvPX6Uz4EE8kLTYR0ZL5QL2EtgbzoTI2Wa
	GgjvzNoxmRLB0UU8Nx7qA7YBuIbRFauN47NnsoGZTPr5HTwgR81+YMdgvX31mRoLHAs1BjYM1qW
	MhskMPbM+XVuApI+DNGEaNSBHtv4f+LnFVrAtme2YOf5cg4+i5Ww15/wgKzGUxdo=
X-Gm-Gg: ASbGncskQ2HobixB77C2+UKO1qh/VsShMQO90AxrYheEaU4kd5GtWYkZ5uU2iEM9/AJ
	8rvaaI9QKG2bhy7qhb6VE6GrIGvf5oOjQWDqpocnW4zDsAVeNUD1iDTPAkn31GY2H+a0XWGN3oi
	bVJflCyWiI9NfGMj9UbQcbCuwGzaBHHqKP4UVTNDgM1UXsXgVba40GBGsVEwKPmPnFGVoMvik7a
	BnYkQMv3jBFE0VbwDu9T1xazUWjeWkpcJUQPk/oxCy12sxux0qTTQv1mALzhLA2KkNtpmogRzLE
	7FZUC+CrNYVUqlg6qHfbhAra59nrh6hb2+GAkDz4X81fGs4+sI4QJnwUPobHKtdbVAEzi4FjwEK
	4ykN2TyE+xGgSvms6AFaQBDWTuJOz0g==
X-Received: by 2002:a05:6a20:1596:b0:1e1:ab51:f531 with SMTP id adf61e73a8af0-1ed7a63cc71mr42599419637.22.1738643045162;
        Mon, 03 Feb 2025 20:24:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF09iljl5xk+oLZXpbhxTgvu0aBdVTIyAYQE/2Jkms4zcEywMp0Em1Jpv+9zSV+CcejUShJ9g==
X-Received: by 2002:a05:6a20:1596:b0:1e1:ab51:f531 with SMTP id adf61e73a8af0-1ed7a63cc71mr42599365637.22.1738643044359;
        Mon, 03 Feb 2025 20:24:04 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796e1sm8897144a12.58.2025.02.03.20.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:24:04 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 09:53:43 +0530
Subject: [PATCH 3/8] wifi: ath12k: remove redundant vif settings during
 link interface creation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v1-3-675bd4cea339@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: -CSk0kgU4NxshbAov9BjN-TkqexR1xcX
X-Proofpoint-GUID: -CSk0kgU4NxshbAov9BjN-TkqexR1xcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040032

Currently, vif level settings are done in ath12k_mac_assign_link_vif() as
well as in ath12k_mac_op_add_interface(). Since it is vif level settings,
doing this on per link does not make sense and it contributes to redundant
code. Get rid of this redundant code from ath12k_mac_assign_link_vif().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

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

