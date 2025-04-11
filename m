Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3A1853
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744341438; cv=none; b=TsdiEkDxvb0RXBaW2S+J+cavAFgWB9TyPBCeTc1iO8LWsGbblHgVZUnwR5HQKCUSy+srLieoBzMQ1nl8jFWjDzphFFqoQy5aulgBarzec6z02S+Afp4Kzc8DcJ1NNreM2liu2boZ7JotsdHlG4Bm/7hUvg+cauZ9QhoNhGlfDzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744341438; c=relaxed/simple;
	bh=DuO9+hqiGBd+cfzlKQvTpPQkKVqn9qahoQ3y/HKEVlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcPJrcpJ9M5Gj2wl44cOpLxlGniOBPfHhYW1712JIhZzOGrkFjPCZP2YAGbYM7psD/2Ce+ectgp3iClfDfaA3y3pb6ajF3GzLKnDdBniduSjxZ9fTlfAHNiYdgRv/7WjolhFIbiZe01A/GFAcjuFloCHnqMU2K5907CMopHDIWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIbtCLy4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIbtCLy4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG1H5l032539
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=; b=XIbtCLy4dEwZ2+kY
	Slya+eNl1FOqJMgTnBKXIF12Rpho8Mi+dTIiRJQgfes6J3ZhBiKj7E56oaprhHyC
	aj4UlUt46ftJwYcSnQOY5drac7g1klC8VqY96zc0wjkZC6s1936vAWXJrYbwQgqS
	z/UC/Ja4/Xt4wdR8beSdSoylp2sw9f97242gO9nDHE6NxlM4YLtSnNha/+Sw0TaG
	UF75KS2plceWrbjPY9fDXxKljHwMA9qUwYKa2X0oN2n3liZruAGZU0C1P3FTyKvV
	gs8huQG93GAmjYMJm28dn/tOA27pQboBozlbrf1b86AKzNxGMc3O6aofWHscfqqc
	bTTYvA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkrt57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:17:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736abba8c5cso1952518b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341433; x=1744946233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=;
        b=C2jdqWFLh/NRzgi2rGj28j5eR8OpncuIgbbdskREMs8/FW5pGUVG3yp1zrSLd/LExj
         J9JWaXT0jxNXP07pgcTU5Y330H36RlI+yeFKp2hmH6aXP+aYnsiftUVaWW9lmIO9sMGC
         6LD2xAETIdP14M1ATPdwmXcy0ysa+T82nEs+YL7SPXqFeAlLP8MNcrcPF28XCJCaZmGV
         A6bc80gs6CXQ8I5Q+62ZfbFJ1OpHQkqcUPbLNw5UElCaO9OUUZSbuVf6YbeNZPoahSf5
         /aeYruFKgIdgX4d3EhcdLsz5fBEZ+ZBn1jlFp86kkLwrqD6capmPWwFJvTBqPFOtFI7G
         n4rg==
X-Forwarded-Encrypted: i=1; AJvYcCW62oar7VvezkK0ozkpEuxO8+8Z7Lu+K2uSkIt5mKfNv9ly88FP3SD4dx/unpWSXXk0I0ja0g4U1J0sXNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4wCMP4V31Ka9B9QcAiRQLyiBc3CUB/ZAogJ0YSYhfBOE+nyF8
	kb/ZtuvxI4gP8sVwNAyoG/Whk2/+5vgNhKSxgiqIdCS3LJzqudbo8iuqTRN4BiSNIG3Qo+jNxoO
	KknyCcHd36TamxsS1LtWw/k/+tR0/ctW9aBnvlhKf/8mPp8Q1OpFlu7kYzjbW3oG+prrBj+g=
X-Gm-Gg: ASbGncveM+TBuD+8D4A9nRfqsofTP5363R7coVZSbev8pKbXauek3A+NoXXNu4RQ5d8
	8zjh2GKdWbb8xrExyr1ArULUNYkOlwh3qhXhUd1ckpd1MWUp79kw13NpJE9YsCwK+ZwzrbvXfdS
	fzVq7GehIiHNxt6xLIkeJbUo79ggnCpVl/fyaxYxlOCTRqDWPy39i7F7roXrN3rJ5mg0/l/yoSV
	JoMzCXDhDMRoWq45aeQHuFfd0TcyLYN8hJWp/FMgr2PFWhJ9jGubPlCYhCwdK2UtUYk5/R5JjAG
	wX2QgmvxUJyMbQMkhAcWdVDZLCIImlsv1l5pD50wZrgFUY3lY7J2CfmXZNtM8444siOao8WKsY2
	TnTLk+5Qg5y+HhkBxlT4P5eVPS6tLlMScWMU+
X-Received: by 2002:a05:6a00:392a:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-73bd11b4f98mr1556469b3a.1.1744341432587;
        Thu, 10 Apr 2025 20:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv7fAFdhMVleG+iD4udU51UyV+t6xUvvk+0Clkocs2XAyqEabBGSczS5fRIUiwv+VHndMXHQ==
X-Received: by 2002:a05:6a00:392a:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-73bd11b4f98mr1556438b3a.1.1744341432061;
        Thu, 10 Apr 2025 20:17:12 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da35sm375964b3a.131.2025.04.10.20.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:17:11 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:46:52 +0530
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: Use scan link ID 15 for all
 scan operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-fix_scan_vdev_handling-v2-2-b6740896c144@oss.qualcomm.com>
References: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: PJKd-BfomBUreZo2f0H3reUmzLOwpxNl
X-Proofpoint-ORIG-GUID: PJKd-BfomBUreZo2f0H3reUmzLOwpxNl
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f889ba cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=PUz9acJwvWvt2_6aZDkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110022

According to the code documentation in ath12k_mac_op_hw_scan(), "if no
links of an ML VIF are already active on the radio corresponding to the
given scan frequency, the scan link (link ID 15) should be used". This rule
should apply to non-ML interfaces as well to maintain uniformity across the
driver. However, currently, link 0 is selected as the scan link during
non-ML operations.

Update the code to use scan link ID 15 in all cases.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4b3469380fb46a629fad7a9a40a44e761ef33fa5..7d96052bb0ccb1230ac446ffbfd20c5f6a463b5a 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3463,23 +3463,15 @@ static struct ath12k_link_vif *ath12k_mac_assign_link_vif(struct ath12k_hw *ah,
 	if (arvif)
 		return arvif;
 
-	if (!vif->valid_links) {
-		/* Use deflink for Non-ML VIFs and mark the link id as 0
-		 */
-		link_id = 0;
+	/* If this is the first link arvif being created for an ML VIF
+	 * use the preallocated deflink memory except for scan arvifs
+	 */
+	if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
 		arvif = &ahvif->deflink;
 	} else {
-		/* If this is the first link arvif being created for an ML VIF
-		 * use the preallocated deflink memory except for scan arvifs
-		 */
-		if (!ahvif->links_map && link_id != ATH12K_DEFAULT_SCAN_LINK) {
-			arvif = &ahvif->deflink;
-		} else {
-			arvif = (struct ath12k_link_vif *)
-			kzalloc(sizeof(struct ath12k_link_vif), GFP_KERNEL);
-			if (!arvif)
-				return NULL;
-		}
+		arvif = kzalloc(sizeof(*arvif), GFP_KERNEL);
+		if (!arvif)
+			return NULL;
 	}
 
 	ath12k_mac_init_arvif(ahvif, arvif, link_id);

-- 
2.34.1

