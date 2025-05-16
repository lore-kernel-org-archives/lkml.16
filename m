Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7D82253FD
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391546; cv=none; b=EI2CWYWj5pzboTwnU3mL2JoQQJqIaETdELou+6Ne9u/s21xQBldrfxjAjYL9FcmIjLpKB7aYsjlG/tWNHqwFY+U/wsr8olXIerVJC7lu+J8UA8wEkXgcR7aBNC+cyRwwGI5uz3pa7m5xNVyM87hUAZuogoEFJ5tkQdcpXErzXfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391546; c=relaxed/simple;
	bh=/C0zCFlmoCu6SwB6lcoMtilSssRPYWVKRmqyPdOjwR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ey8MI2VdBHf4Hk+WwrExMOmQDtAJ0pD25CsaJw0v4S/LDrmW3jaD4CkPEvsyued4fSKLnQfkrd9J9eMvt9jeUQvWPN00H2k5zZkPDJOm1r41FjPq1LPaK5myF18PlaHJfxZB85bdkIOEqiz0dcgubSk2BnHl2BQWtUwWjz3RCUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mg7J3dFb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mg7J3dFb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3GnFg001798
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xe4JJpZYL0oQKo4qYAE5I1ncsvjogZQwLUp9nB2aP0=; b=mg7J3dFbSef0ZfRT
	LdOHuus7faZ4JxMkfU8Hg2DHOu+wvy2UOzX7b3KEPfHhpzK3mYfHGOXniDbvA0co
	I3qLz6TFTKVwRtrc6jojmp3QGtvKCnk8pNxwNMUK7n3wglnCDilnmGoIMCnZ0wXy
	nFFsKM1PyLn9TuZgWCdMJFSZupmVdKXBdaMOfvWLXkoTK2IBkU+J2HxhFXUle+97
	kj2R64eh/X+32jtNy4C9VnlcpJe7Zyoih22kZF82yURERhk60jk+LwAxofgdEl3c
	v5IHAbdpN/JmuC3zfQEGSvsgEo8vse5HYC3PGURN1pngu8LdbwdD33bcEy+fxVkH
	hsYoWg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrhfwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73bfc657aefso1490939b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391542; x=1747996342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xe4JJpZYL0oQKo4qYAE5I1ncsvjogZQwLUp9nB2aP0=;
        b=ijoivyZRQb8k7GSYvcDq5YsBoxnTlLFNSnyFv3dj14ykfRy6hWXXTpE1D/LkTf5zMG
         QXLHBBq1l1fUZt9J6VeCUG2di3Yir6V+exbejh0n8Z2vyePSy331n0kdUDYYJI/oUwZe
         hIHhpfYzkW/PJq8p3XyYYy4tEPyeaKQA7NynoqAYiKoZqR2WEXFf4UtYTmuGTGrFo8Jp
         jDjTYXrCi3ismdPHdqOKwAZ+YP3QQIciZqubZ6CB9Al1yRGjWv0e8+B0hmLB0uuRtxQ8
         LCsa6h0qJjBKg5QWU+5j90GWk2dnGMu19VekB36U73V/ZaifiPaCaYakyU3UpovO9KNQ
         j2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVflyRKlQJNSLJljGj097ooTRtG3IajkOfheypUh0CcQyCk2sDV3tIy61oRRi0XnMELHbjLSeQ+mQuFvTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYHzvSxjenw6CiUL2qjMNnzxuRsLjloYflWpMU8Xz8t4MSINLF
	+zHDOT4+DzCCXP6B6caDiqlFdXItLsM/LKRa8hvoji1UbejqWv3wxeSQvJsZfcODHrsIuM10oRK
	yafvcqgcvAtPoJXeX7g3295yr1g3CFAE5BVG1PDIPgKFLmd4J+b36EfeVHwv7gRyE7wQ=
X-Gm-Gg: ASbGnctgY8My2qNKqgZ4l1nyDPi0l1qWuGusrQ9oiEKSAr3LlXKdeSoMiTRdg0blWKd
	MhUqwMnC8O80VqO7sud+atYtX+tYbE1m2RhX9vl7U4qaYSipCvgDmQ//jEsdIo+VE9iL+XNNXCi
	StU0pLYtrchVDaSfw+775w3XEIL90lmHJJDIl5PXQqyN07FDam85rx+Ha2XYhVvpDja2gbH5Tw0
	bRED//uTOg8JdzuTQItnHXOh4l7/ADvucv5QFx2hty1iufYwtWeost6HUEaScm2h1plzyLUbvEr
	z4uaKgari57n+7w8n9hwnvNY23vnwKxsBCX2c+KLy8/az53BoPb6NnDzvGQ9aFB+Lp9SRBNitnc
	ItNdbgIEL8aiAmfTBNHf4LRx2hRUfIFFbvejN
X-Received: by 2002:a05:6a00:8593:b0:732:2923:b70f with SMTP id d2e1a72fcca58-742a97bd16emr3417936b3a.11.1747391542049;
        Fri, 16 May 2025 03:32:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw+3bj0H7s+N+1VhN7TU4jcgdq8iHHxRkKSKdccszazRmhKVDHpqKbGq8N2Qh/FdfH7ixzfA==
X-Received: by 2002:a05:6a00:8593:b0:732:2923:b70f with SMTP id d2e1a72fcca58-742a97bd16emr3417899b3a.11.1747391541597;
        Fri, 16 May 2025 03:32:21 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a986d8d7sm1247585b3a.130.2025.05.16.03.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:32:21 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 16 May 2025 16:02:07 +0530
Subject: [PATCH wireless-next v2 1/2] wifi: mac80211: validate SCAN_FLAG_AP
 in scan request during MLO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-bug_fix_mlo_scan-v2-1-12e59d9110ac@oss.qualcomm.com>
References: <20250516-bug_fix_mlo_scan-v2-0-12e59d9110ac@oss.qualcomm.com>
In-Reply-To: <20250516-bug_fix_mlo_scan-v2-0-12e59d9110ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ukdvG0-kZWf23XwwF2bM67Zy4V6Z27gt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwMCBTYWx0ZWRfX26kDu6+CjVEl
 FZVs5FTUDVe3LAxCLbUtKgLl8Dl21coPuU/XyBr+I23N+eGU1ewfa4fjf3BHxl+CXz2m6xncG3V
 vIxKX0cQEp2GDQwTG9ghnNWyepwCVeyUdmY5WU8W2KN5DmXdgw+ic3yi4jx9xitJQuTQjkOyXnS
 09tUQmbq/sdNMEoWSAWmiFq6l+fDlUsTSWW+9caQ6UeUDyc4wZ3BMrTz+8C5PggeKTf94AdUC6C
 DzPcpguChkF2iVCSBPgARoGUq6G38J6whlOFGmN4z/BM9NLNNnlf7TvbeTA0/RwZ5WJSsNGdhJ2
 GtEkuRz5ehFti9kRL4YZsQtjgrC0Uh8eOpIrE3iCMcENyCHgXWKEX6htay1Onu04xuVRRmmhwt1
 bPAgcsi6OZd0KN86j9MU51UYK81Q8uvQyyD4XkIQBr5sNbIgY2/HCHqhWNeCbA5UXUXL2Prp
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68271437 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=DDi9Blm5zKVmG00JEVUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ukdvG0-kZWf23XwwF2bM67Zy4V6Z27gt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160100

When an AP interface is already beaconing, a subsequent scan is not allowed
unless the user space explicitly sets the flag NL80211_SCAN_FLAG_AP in the
scan request. If this flag is not set, the scan request will be returned
with the error code -EOPNOTSUPP. However, this restriction currently
applies only to non-ML interfaces. For ML interfaces, scans are allowed
without this flag being explicitly set by the user space which is wrong.
This is because the beaconing check currently uses only the deflink, which
does not get set during MLO.

Hence to fix this, during MLO, use the existing helper
ieee80211_num_beaconing_links() to know if any of the link is beaconing.

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 net/mac80211/cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 05b7296b152cfbe1e81f8981eee52d72f711706c..d9d88f2f283120ba366401d3ac546e59d8c61c21 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2924,7 +2924,7 @@ static int ieee80211_scan(struct wiphy *wiphy,
 		 * the frames sent while scanning on other channel will be
 		 * lost)
 		 */
-		if (sdata->deflink.u.ap.beacon &&
+		if (ieee80211_num_beaconing_links(sdata) &&
 		    (!(wiphy->features & NL80211_FEATURE_AP_SCAN) ||
 		     !(req->flags & NL80211_SCAN_FLAG_AP)))
 			return -EOPNOTSUPP;

-- 
2.34.1

