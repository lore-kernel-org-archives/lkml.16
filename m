Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1432478F4B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747108628; cv=none; b=QlEDwu9AuOXs4tMGyex0wrzUlU9PJAuF5AlH+GPVWNyZxBzhmBdGSyjjrGkEHVAuexxUeznSXxKVo2poZG6ncdmmrjNb/cUz9YxHt/2IMwcKaG39LTNv7QlsmqIqBVJW7AFeG71h09lcgMMCaDShCHayg90Hn1GWpCxastcGmEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747108628; c=relaxed/simple;
	bh=0bu58lvXMabByWUmn6oJWOzxiSkq302mK/8Ms92lccc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B5ygYi0B1ipVgZvuxVzmVpheuIObbpip0Gfrz/kCTNiLa+uwkM2tOCe4Sbyj+aTiMJ4cd/ADPUhucCTohXwBiFK019YL4MfI2+JQ0QgVmXhdEEG0BPoWEvhagsdFHuv3v0z8lEutRF2856q2Y2t6Nc0Zh61tlQ25POPdx6sYUc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWPoS9jW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWPoS9jW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJWFUG031649
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vIikMlIv2B/RRbL0mVIrCb
	anm8MwXTmBc9c8dT70PvU=; b=oWPoS9jWAoQ2Lnsrq8szV/8v3jMG8ZNFByG6Od
	4NqUuErwYgnK+hkTll99i8C7B+fij2WeuYSzOJEDPUsw9z74Vl/0TJRKJtr+k5q3
	TCIN9xGmbeccUozovEwvQwDfPWxkRH8Z61qwGv5ANzpl+gqMFhhtENyguov0U9wy
	iY+3HunTA7GthADtw4RMMlpUNmpd+WFfDHKJLOeKF4WNKrZlPPKr+GzmcG0hIa7r
	UhM9unMHdtn+6fXl8dP05kIMjYMtpJtG5031DObFbXR7Vf8UDGb+hXWDN81zyKfD
	HVmrJ5uwEyKTj7Jat4C69znTQy1xWfa7znEUcFH8ZUBwiAew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hx4k6c3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e540658a0so51414875ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747108624; x=1747713424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vIikMlIv2B/RRbL0mVIrCbanm8MwXTmBc9c8dT70PvU=;
        b=MvU+OgD0plqTgTy3wleFKH6vZ99nBX9CqMMK69sjbfqiN6HR4oAyISjElER3Gb+/5Y
         87zvAuuFktX77of/0jag4tYhpWsq6ut81ovKdwIHjZkrLtGEk4PJ/IrBDs96sLNpFN7v
         cH5LquJI6Zi6vSTxcKVbGFpEQCaOtv/yP/calZlrEIm8PgtXAML+r96VrYVlA2feIAmc
         GWmZoarh+SXE8RA6PtSbblNILzZUc0WRQwCBPacQoVPOY27Ngvy8D5iyIuvzAQDDi77s
         zxNSXHcG/DjDVJl7CPdIl1B9hehJILkW+6J6X8YmCQptXum4JjaSoW4hrWZ7+YjSw4fi
         eurw==
X-Forwarded-Encrypted: i=1; AJvYcCW5h02b2APvs/X0aX2MQi0Y0hX8KEqFHpyIqcbe8M9XEIFT25QTHhPik6HTYHRFwBUEjBlKgi9JukhbYPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+NVqZyutnE4KFKn0Lk7mQsGJpLitWe7uKy2sp+d//IyQirhmL
	iGjWOOu1j2o6LKrsdsWtmkoZ5YRy/DmQ8004WgT+Q43FWtBrpyK6kQT/YmZSaEjSW2mOVGlU/at
	zuJtwf+FcesHdCbJmPgb9filby7jgrp+1QuomePvlvTmUd9enOw5GQkpyuzlZdDg=
X-Gm-Gg: ASbGncvIPa83I9KHs6W1mtTkzywyZ1ObTvfGz38IIFrdsZr+Lbsvew1xsjfbfnWaj9n
	HETKwGkpvaHWKG79oYKV3lyeb/qjioCwQdJTN5LseAep2fylXt2MYRbcuU6NaxGlIwnY42YOA1j
	au7MawYsH6r04hePpNe6GQ+Vmq5EqklXFlbwadpkKXl/LQYn3ZQKLhKAkUZy2E9hRPmwGurs42M
	kPqsRakqzFkR5tC97LKd3vm1TTRAOvsBRwbThuGfsa+qkmsCaJ77lhUDQ/cCG0berQJIJKzuBCe
	s3Lt11J33svtgGc69u5gfzUqVi7S4a40rbWMfbfgIgpkfk5e6kSkWT0CF9F92uBfJvchijv6TtI
	GoJtkE4FlbU1mZQy/jHVBdZi4QpDkbQvHBM32
X-Received: by 2002:a17:902:d103:b0:22e:16b0:ef8b with SMTP id d9443c01a7336-2317caf3194mr16683325ad.7.1747108624356;
        Mon, 12 May 2025 20:57:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGALDyP2d7KN50OfdN2s/VA2greBY94QderV8nqS/Bdf+cZR4IlTRrGVBXw3R+o5hw3eQ3TBA==
X-Received: by 2002:a17:902:d103:b0:22e:16b0:ef8b with SMTP id d9443c01a7336-2317caf3194mr16683135ad.7.1747108623962;
        Mon, 12 May 2025 20:57:03 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271d98sm70236515ad.154.2025.05.12.20.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 20:57:03 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH wireless-next 0/2] wifi: mac80211: some bug fixes in MLO
 scan handling
Date: Tue, 13 May 2025 09:26:50 +0530
Message-Id: <20250513-bug_fix_mlo_scan-v1-0-94235bb42fbe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAALDImgC/3XQ22rDMAwG4Fcpvp6LLduJ2dXeY4zgY2tI4s5u3
 ZaSd58IgxWW3gh+JH0CPUgNJYVK3ncPUkJLNeUZA3/bEXc08yHQ5DETYKCYZEDt5TDEdBumMQ/
 VmZnGoPqoesud7giunUrA/kp+kmsqYQy10jnczuQL28dUz7nc14ONr0O/tvhvN04ZFcCMRt9ab
 j5yrfvvixldnqY9ltVs8OzIDQfQ6WIH0GvJdC9fOOLZ6TccgY7TPmgbPQjDXzjyz1FbP2sSHeO
 U9cBc573bcJZl+QGx/cqBngEAAA==
X-Change-ID: 20250402-bug_fix_mlo_scan-fe57f57b1c86
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ReqQC0tv c=1 sm=1 tr=0 ts=6822c311 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gPft80QSANvjOYXkS70A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ZdtRvPu1FtizkHf71Bcg6d9RwrZiiRlm
X-Proofpoint-ORIG-GUID: ZdtRvPu1FtizkHf71Bcg6d9RwrZiiRlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzNCBTYWx0ZWRfX2Se3U5R8gRQS
 OH5mI8k6ZL6ojNskBhg2SfLXDNRl6U4Z+/QmZpu1NqcrkGCVlvdYc1U+pXleGRXHs7PKGQxPhy0
 M/05ueegboGTvowa+nd6aihT7oZisSj5QO80iJXsAEZ/6W2yiUXuAb5wF8PXu5ILT32YhesG1ZQ
 dZ/kH2EPZm0NxZkiS2eMm7/0PGbPwk5K34olF+yaUyDB2k6q995lX0v/Gi+DEMVPexy8kAeSg+b
 wsbgNrek92xIjG+u15mfxQjNPVUA6zC+/oyeP5KndUfHy7s0+AsNPUhEYI+sxDQyIKClIW1tvSQ
 ZDK032ImD+463yJCKNekuYYg1vLXTe+kAeOMuBs1g+ABsq8t2UYf3LMDbuBhEQcBeswJxa20DeG
 d8g0YVAIlwXp8xTWLV3x4VtWfORDNAaDVgzCqG0t79w+fjub2rzo6O/lIKNIOn8dqEn5/SuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=927 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130034

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
Aditya Kumar Singh (2):
      wifi: mac80211: validate SCAN_FLAG_AP in scan request during MLO
      wifi: mac80211: accept probe response on link address as well

 net/mac80211/cfg.c  |  3 ++-
 net/mac80211/scan.c | 18 +++++++++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)
---
base-commit: 63a9a727d373fa5b8ce509eef50dbc45e0f745b9
change-id: 20250402-bug_fix_mlo_scan-fe57f57b1c86

