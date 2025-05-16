Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507323373B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391556; cv=none; b=G4pTyX451YGFpydsWUfSflvdcsbZRip9wfJ192y/7Ua5xM96A2ZBsLhsRrkkp62yjf/BlSjMqPVEw6fJEkIyiDl7h4wHrwVs9t3Yuxlv+nUANvN5DqqFLutft6a8pC15qVT3VHDaJNiNgSIgnMOWV15tmRnny3A4/ci6s6FYKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391556; c=relaxed/simple;
	bh=a8ch7gicVeQYk0s0g17/TSxDaoXIRs7pIpXTym2VefE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oCoVC1/nsoFc5wCukwDljwsqQoa3FJh3hhWTU5Tj8pdgRB5kSJaODTzAPM6Dz1otoaKxa9O4GRqpGIwGIjg8g86Ic7Tsp//0HP+/mfyS2lx2yYyRfXXjVHPXUbawXtRBP98H/9DmXMIzn4C71EQ2kxbNYmd0BQ77JCKj6DUu9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZj9L9I7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZj9L9I7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4MrZj014096
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QcCZddeYaGyi07pSs0CvoB
	rZISg5ik3bB/eBUeNltxI=; b=aZj9L9I7rTD4ftxP1OikyWQQLPmB8Ysq63U8hk
	mAp2LNYXzqEAeijrmTKtuBiLGyOyVVsZNx9dLgbao/9c0lpJyvHBjT3XFpT6rhkN
	s/dAwl1oLLNYeWwjSFTwb148Hc4HmgWNzJAA9W/c01BMTX+KrFAW6S+2ZSiODIu+
	HFRXzWqjuMcvWOu3QtHtL+PiJcydd7tcgjojqhGtObnmNxXwIv4q/uUfLzq7yYLv
	vkp7Nd+dhel/26mI8P78i6QqklGNbhvBKSkNmqnCNNjtPSAcYtL3Dch8wEcM1vpS
	a9H3VsOmp28/uu8fpsez55MWaDdNV/ZK7z+w7GV/vnf7X4wQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9js2f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74255209c4bso3336477b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391540; x=1747996340;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcCZddeYaGyi07pSs0CvoBrZISg5ik3bB/eBUeNltxI=;
        b=GhhspwHt420RF51+I7DhJV9fmlEd6wGBKniHFDD/+i0VSeVXwqE9yePejL626p2RLO
         e81wLcvFpXDqNFAnWbwE4yaRiTKztZGC5YIgQe9TudjWC0pSI8gNCTe7k9aT6D2fhA8g
         nnmps5O/R5+NyqD/nFHiIgpee9ZZLthyUFYZD6x8Do4exnjT/zkZwXisuwYVBN/Xj1ug
         XF/XaDFzN7uyK3oAQZ/1/I3bYnutY1GTHgA7Lgh0GobG3eRSMQQYW9wQKl0r4+ArJ+Y0
         jAblL1DSa15Y7XVfrCHRJrmvn4QoRuN84TAuxuJQHk2gLJ7jy+ozqWAh2Gjnsv1qeKTy
         wMjg==
X-Forwarded-Encrypted: i=1; AJvYcCUZEMjuDwtuRIqT2lLns8g8UASNjGsYLL5PUw5gWm8ACf3T2pLRY1ixBDOhhKc1U5IOMWrzSC1QxU937ac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3p48ElXEFgiuiQAT3ByNvhQpgFDpzAG4ZvOaRcfdURr5q9H/t
	J8ecV1jwrF0QFcXAhPHE2/Gvewj5/p9nROOAcm59Bg0egbZHkpDKurefDzEseHCkLQARYoFmQiH
	HzrRM8TgsZlMfM1M9CIbXZdq5TG77g9V/DhsflN3MML5N01Q8VfvULf9FZQu2v53N2+g=
X-Gm-Gg: ASbGncsL3uwF5fMAYt36ntfpnisdhpZga+P6FXd0PN1wIO4jURsJSnMzHytrqweiVSL
	Z5/BD5TYkpXovtSpRYkZcdgFtHHfxfFvubXnoobtbVo5SpHcEGYv16j5cuLl4DS8IWW/GgJw9Dm
	HYOuHVooREM2lua7KK1GduIRkDlEQVaIBrOYS2A3Ju6dVa2yJmOZTBa5YURlY+fj1nOsrlUS0KL
	l0qoJPglQI4njfVnXZhFxtWLzbrrNzK1+IcUttbsb8EvPTik1JYeDfq7CQkpP6mRIz+qT9g+wZt
	1BaCASYyCQpCEnPO5huGSqZ0hHm/GmL0Gkx5NAtHZMz4EnKthlyWkwgR2t9yc9pf+vWif0N4j/+
	RlS2bvOAnsTYuBhK3J3+BZ/n7lMWIVbqRonbS
X-Received: by 2002:a05:6a00:1382:b0:740:5927:aa4c with SMTP id d2e1a72fcca58-742acba8f87mr2737944b3a.0.1747391539999;
        Fri, 16 May 2025 03:32:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnO1ecGoSJXfMsKvSCjPaHv/MOQMmbO2A1LqkZG3UPXES6eAFxgdeGK4jmgoSaTbApYRLtg==
X-Received: by 2002:a05:6a00:1382:b0:740:5927:aa4c with SMTP id d2e1a72fcca58-742acba8f87mr2737914b3a.0.1747391539567;
        Fri, 16 May 2025 03:32:19 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a986d8d7sm1247585b3a.130.2025.05.16.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:32:19 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH wireless-next v2 0/2] wifi: mac80211: some bug fixes in MLO
 scan handling
Date: Fri, 16 May 2025 16:02:06 +0530
Message-Id: <20250516-bug_fix_mlo_scan-v2-0-12e59d9110ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACYUJ2gC/3XQ22oDIRAG4FcJXtego642V32PUhYPYyLsoV0Tm
 xL23WuWQgPZvRGG8f9mmBvJOCXM5LC7kQlLymkcagEvO+JPdjgiTaHWBBgoJhlQdzm2MV3bvhv
 b7O1AIyodlXbcm4bU2OeEtb+Q7+Q7TdhhznTA65l81PYp5fM4/SwDC18+/dni2S6cMiqAWVN95
 7h9G3Pef11s58e+39fnPnHJK76Vf5UglHMSosPn/H2nAo97yBUHqtPEBkAbyYyWG454dPSKI6r
 jTUDjYgBh+YYj/x21dvMiq2O9cgGYb0LwK848z79SsEPP3gEAAA==
X-Change-ID: 20250402-bug_fix_mlo_scan-fe57f57b1c86
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: RZeBBn27L7cj3wVHY0Ujx1cMF_z6MoLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwMCBTYWx0ZWRfX/yQQ8SQjcLad
 2QpQvOfRN3Yja1zcX7g+HLA1AIhMQixgFaMxOOHw+mj6Qdvz3kNqNhbly1gqJR9HY9EfBkOGHAx
 XOawGEcZ+dGPo0z634yc9AggZ9/lKvBq9LqX9gvup/vKtqYXlY+O4Cvjr3FmyHVnKX8HOHenMkR
 yXcylDtDiRguZCWCDgEkcWT+7LOg4Rhkw99FAm0pB/L/WHt+t6zUH7i6yqmRFpgMoM2pYfXEwVd
 MBlpZ3sRM8RIghkR6RE6hfnk2i91bSC+X2+JjVQL6Vgumbx0qKVlH3FNOisOXoKLcyxATQ8tkNB
 BdosmA+tncFsV4nu6pH5ulJTTxWfzRL7PEh2n2QEwlnq6G/SeftzH5jCrOkrxK1rVsq+OMySghE
 PY8ZtDsq+Bprex3FsKGXIoOWjLKyh55rHQUT1jH02SaJ77GmnnyCENIibPdsyK4aHznJzkVg
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=68271441 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=gPft80QSANvjOYXkS70A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: RZeBBn27L7cj3wVHY0Ujx1cMF_z6MoLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=937 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160100

This series addresses issues related to MLO handling in probe response
acceptance and scan request validation.

* Validate SCAN_FLAG_AP in scan request during MLO:
	Enforce the requirement for the NL80211_SCAN_FLAG_AP flag in scan
	requests when an AP interface is beaconing.

	Apply this restriction to ML interfaces by using the existing
	helper ieee80211_num_beaconing_links() to check if any link is
	beaconing.

* Accept probe response on link address as well:
	Ensure unicast probe response frames are accepted if the
	destination address matches any of the link addresses when a
	random MAC address is not requested.

	This change corrects the behavior where probe response frames are
	dropped incorrectly for MLO interfaces.

Both the changes are as such independent from each other. Since both are
related to MLO scanning, currently kept in same series.

---
Changes in v2:
- Use ieee80211_num_beaconing_links() alone since now it can handle non-mlo
  as well.
- Link to v1: https://lore.kernel.org/r/20250513-bug_fix_mlo_scan-v1-0-94235bb42fbe@oss.qualcomm.com

---
Aditya Kumar Singh (2):
      wifi: mac80211: validate SCAN_FLAG_AP in scan request during MLO
      wifi: mac80211: accept probe response on link address as well

 net/mac80211/cfg.c  |  2 +-
 net/mac80211/scan.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)
---
base-commit: 68b44b05f4c880c42109a91d2e0e7faa94f40529
change-id: 20250402-bug_fix_mlo_scan-fe57f57b1c86

