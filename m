Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AD27C175
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744340710; cv=none; b=c7zcu7sgf0arRDBISk8TnJ0Pe8ZNIlky2y4OHNpoHfrH/IuJsghcjQVYmX5OvLIRHtheBhNUXGUGT2znFrSZRXY0VQTleOMOeO8djo1s3KTk+7CSnAQDadxQV8+gP9BoJtlQccIi7rfBzS21CXXPlmQlCVw89aDchWo/gX+Vxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744340710; c=relaxed/simple;
	bh=DuO9+hqiGBd+cfzlKQvTpPQkKVqn9qahoQ3y/HKEVlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejcv4bphw78HoTKCOBfSdo5nt6yaUZPrn1wungTDAtl7nSQewMZncxbDhNuABoGEnpERnH3B1jlhVnltmUFJdlxhVMzEy0Bl7l0/H78P8JiCYfu6K22Rt8cDWoWJAuOjtqcxCEjAj1T3rmOFEn21+BwvNcUnUjudpfZh1UxPN3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAM3cTkR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAM3cTkR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG2G8r030686
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=; b=oAM3cTkRrt19YYyl
	NP2G3HTSNGV/lL176CuStsm1ODbepOTwfwKZuzpRZ7JmzJG+88AyzZdmtuxlhvrk
	gm2BLESyyoHXp3sq+fqj8MfEXerF7shFC/81hZyfOzL7ENLlZlP5ygPxanUcisa6
	A6dV/+vEkyDeY0tMdVLFrlq9HFuyof8/vk30k4wIFIzvjkUYsPWSp9JCQw3v9PEB
	dWsjAVyy125NKFS/dKqDCdARz7yPoCx+fbS+KkPBov3V2dV3/stoUKX9XWQKZt4B
	z1+DSGtYfSCIG6h45jGrHVNF5Zn4q/Z3CBYjQU6Ns8537HQ5wB7YKINXjZ2P7wYH
	ytc+xg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftrrqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:05:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso1811380a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744340705; x=1744945505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN+Uci4EgrW94KJgIsI5THib/jPzDg7I4/82AuQoOXs=;
        b=QYyEmEEybmlpEVuveoOOZ308rm8tMD8I60sH9X1Tg8TrCzGRnCAyo69bRqLahJrZAT
         mr5xhk7aLshGrIDrBumldYRUYMxIwzS/Z+3Aioda8GdnBNZybAxbLiNA/X9MzieOj1T0
         upUDYozzd2ywGZboGY25zeCUDP2WHqlylEr5ysrJgBJXbJqyx1zqV75Xd/3Y6m6x1KPK
         zDVkWnGrncuYM//VvBq16LaxwisuRLtFNCK+3DCJEqd1l3zACPegobjE9/jMrmzQ8v3f
         9DQOuASh/eumQVO2kOGsbV7osc83P0Zs/uSBgzS8alpXYPXn97M4wC/xeNV1xcN6enp7
         T2Wg==
X-Forwarded-Encrypted: i=1; AJvYcCURylVOwDCwB4OiZ08+CgdwvtXHf9zIFtGCMP+ITYQYbv9bJk6G1D1ptliUwyf6nRXbpmMYq9uaniJUon8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj5bghGPV1pGhZiX+2w3+Wn4W58Hs9PaS6PC+9SwXUNBltQdNf
	5hvkT8XaiqWIYxyxhR/Bx0YEjB18phl2MM9Id+hqNZSkDvisdCLDnqxAlOSIhS8imnaCNTdHk21
	raLz7T2cPid5RKCmLZEjoi1Spg1K0ml2oYSdK1ZpBz2YBdi4fOu4aoGow41yWCARanqjJAy8=
X-Gm-Gg: ASbGncvyuEDGbb5GBeUMGoSyfOfpZqcWQf8Z8sU3GsBNuQO51IsH9i7i/sgfr2x+EJT
	WyYrAi40Gwt31vHZjiZfWAQ91kRnLTnJGgcp/nkbm4oObQ8DULcmcSr2k9gI1woKPWKq9LrlDxn
	pI+sVHsvSvtWeG1CX+fjXGiLxwx5XfL+DB66h5w3icALcyd4NP3YjAtSBDBNNL7q0/KrVi/S5BE
	ekaZpKwe1I9B0moSHMIvsMkM54+ZhM/MqdPw4lZWjxX3kT3OfM09SPZ+brHjjwA1zryibjFV9Rq
	GpI9yxgff0hp6oeq65eIWDHbK7spGbMDozReyFlxIPRmnfw6xCCegkQwO/V9Plwm0o7OgZarNuR
	qsCWgtHq7b2X1LDNvdSm03Wdghrvfl0SxbL60
X-Received: by 2002:a17:90a:d44d:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-308236244f3mr1884741a91.3.1744340704763;
        Thu, 10 Apr 2025 20:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw3aUHRcQ8EhaIL95aG+J1wgT0E2sTrzFKeDpRppMCbJ0z8YGzrCZWpdAJnx18k6Dqno47tg==
X-Received: by 2002:a17:90a:d44d:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-308236244f3mr1884712a91.3.1744340704381;
        Thu, 10 Apr 2025 20:05:04 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca88sm38425205ad.256.2025.04.10.20.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 20:05:04 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:34:51 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: Use scan link ID 15 for all
 scan operations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-fix_scan_vdev_handling-v1-2-07d8b4a5d19d@oss.qualcomm.com>
References: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f886e1 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=PUz9acJwvWvt2_6aZDkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: ALQl3Xhu8V9P-a8a82Tql5rhCo-D35Yh
X-Proofpoint-ORIG-GUID: ALQl3Xhu8V9P-a8a82Tql5rhCo-D35Yh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110021

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

