Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2B31DFD86
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747108630; cv=none; b=NVZWzpeHkqbQKL8Bpe+t6xji56tkJoGIs04Nwq26/Ho6PfeaPerv3VAVCG+PZZuapM18kUWmBOxrWlUQSdMnY7bB6R54sn5NGyWpvEbhNyleqZ9ibP4gl/EKvrMwDTVTazx36IpCUytv0Zf4mkv1mBvUVd7YYkasjLbbSRgS138=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747108630; c=relaxed/simple;
	bh=xcTsYTCq4hhPRXLgmxGlk3MoAihakw6GcR8Vycz3644=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JOJeXE9p2NcMhanqmxZ3ghWagMi3HP7cUg+MwHxI4Ajj5JwGuzM1w30CetT0sIGoAK92gLSMh82ZWiK9CL7s+IJA+im6YwNKBJiDpWii8l5U7JWTUPnX+tpfXvOSP+xyAGcTxvUMmFx70BgMSxbsLgq+ue1LglFBkTlTRZ1xmQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FN9T0fXL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FN9T0fXL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D3maIp023589
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gas3VfMriPFBCDRSn8xWRu/z+ynx4x/EVCs6vj6wClY=; b=FN9T0fXLKw4FUHrJ
	ivSqRDcgP+pYvUeoNPARGHZIQqlifZKF5c9ctAromcEFedN3eQTRkKw5eAqhLdq8
	IB/Qv30O0OCjpL8C1vUX9Z4eebv1TZWBlD7P9rNaPKedkmJ3va79WU30WTzOtib+
	Mr9Gw+NCDBS9rwYUwZ35lxgyPBCSb+7xx8P0ogGjBkSSJs1owZC7KxEAPHiq7ozt
	KPsrrmgrgJOEGNO2yu9VOWkzKsz9AWkvWttRofcG3msq7l5FGwlZh1UJP+BIK+BW
	NPSNczwqVv8nfOTUoqD2rYgsQI35qcTFJxyAcTLYHfXodUkjyMw+Bg1h90StVUbc
	MmFYJQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfejuh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e544a4c83so49959265ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747108627; x=1747713427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gas3VfMriPFBCDRSn8xWRu/z+ynx4x/EVCs6vj6wClY=;
        b=fOO4/xL4aABeoCEjLqZVEwhMwkguBycAK784oeaamtV5XwmP8E4UGr4r/8zaIXmKQL
         Zol9JVIu24emd0HlKs1fw73RP2/WF/rYXZzmjoXZcyL/onF+2RujV/GsgX7nWQi4GrEu
         e7w3ky4jqdowlebZscUyQllPzlqx0DQdvRPmuqGbW+T/OpWH6DyiNjKYcXjrKv9yFcwL
         +WYzlyQ29FuaS7MSfIomVbpsVyF8gZIsgfzsr0vwO/NwNZUn8M+TyZfe0njLJD9PjZPN
         SX+2isV7iFPKa88elowDneW1UHdFTHTi40S4AOXNXJu+9UhavXsFdy7I/4OyUvOkLqGM
         jCGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlbM1obsHniGEQesMb0NtcTKMfsIls7kQXafWayE6f3GD4fGrqtM2YDNYEleyNzhY1d6TJ3l39Woz00pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGg6Z29t+3iKDYEU+u0fvsLcVZoZ6C/vTMZ3dmZNhGaKBaguIT
	SLyQg2nzS+26qBQ2QQPDQZylDAYDDNpW9kGgVexgpLOFO8XniS2WZ4Q2u6o4gwcdRZzZdFFPRuY
	QmoMPYxC45IquAfz6UihDUBp3UFu6bllAXVRG+F6aFTsF57HfxO0FXpyRiNZSn0A=
X-Gm-Gg: ASbGncsUq+L1JOZEwnSNs081Nk65f7kQSv8+3+1kSnieHfD0bB/kMldi8jlYnYzRf7v
	VKBJG1be0PucT+09q2JKPxoKuWuLZgU1eCwgVpSjDtbI/6rvtgUKFRJcsQwBc1LWfZE1/khmRHn
	POOILLFnKOMZqxDtNP7xvLB3MHzD3oDQq6qMw7sVrAthoxYmIhGYI9KYC7iwf/JRjawrSCwYUon
	gbAkPos+piOx4UZVO4NIwcl6WcuhVKrKxUtedpVhd0N20TUuAJG8kXjUStULxslD+marNyYXJla
	9dULNQ11tCb1Ud+FYrwdTyLz479M74cv7YrlmmhJygv04Nuj8LJQ5XwvtTbSlYn4AaI47ymqxTO
	V7UqE98tGlo7cMEtHEJj5R8Ukd/ZS6meFhYjx
X-Received: by 2002:a17:903:230e:b0:22e:5406:4f62 with SMTP id d9443c01a7336-2317cb62f61mr25969485ad.24.1747108626760;
        Mon, 12 May 2025 20:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET+2QgCIvchjWzWfnbIUJNGg9YbjqrllZx4sUGIyUvjL6xQ+0ysYQGnvprJUzEJI7ZZsTbxA==
X-Received: by 2002:a17:903:230e:b0:22e:5406:4f62 with SMTP id d9443c01a7336-2317cb62f61mr25969235ad.24.1747108626355;
        Mon, 12 May 2025 20:57:06 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271d98sm70236515ad.154.2025.05.12.20.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 20:57:05 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 13 May 2025 09:26:51 +0530
Subject: [PATCH wireless-next 1/2] wifi: mac80211: validate SCAN_FLAG_AP in
 scan request during MLO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-bug_fix_mlo_scan-v1-1-94235bb42fbe@oss.qualcomm.com>
References: <20250513-bug_fix_mlo_scan-v1-0-94235bb42fbe@oss.qualcomm.com>
In-Reply-To: <20250513-bug_fix_mlo_scan-v1-0-94235bb42fbe@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzNCBTYWx0ZWRfX1vy0nTu3UcOL
 FIS/ATFZxjmn60zWf5pQ+ge3n39V4u1Mi2GO4Z2AvK3q8Ie2Pu0We+ziAQPTrPDPdORllg2AIh5
 MVor/h0WUD1r4hzt9e/SNdv+p4ey+9kt/iMJXpJaJ8udcxVNT3e+9eDKpm2gam+uPFcOFMbGuvM
 yTzIxEfKlDgKT5aC1woqKpsNNeY/e8lzSyiJRR9e7bEoPVHKMJ4P7BeNPNGPxaawj8PUoJKfo4p
 a7T1ZG8EBYgTnMNDkPJDHCnnKY6qF9/6rYEEguHmIidRutScyhpJk9jTyp0cuo233fYTlaaZ6BQ
 P/V8bfqfMwCq2sIp0o8b3DjW83KS2fw+9tMx6jA26EwuBkVHPLDmtLnuhsmtU5mjVmAcEPRW0/y
 6BIXxqtmv6WV8YQNuB0cKgq15DHAhPmG0N+BK/Q4vawKPohjjlgin10IjYevEMCzAx9yI4C8
X-Proofpoint-ORIG-GUID: qudXfftSd3a06xqqw9hXhEoXhoGqsm47
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=6822c314 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=DDi9Blm5zKVmG00JEVUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: qudXfftSd3a06xqqw9hXhEoXhoGqsm47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130034

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
 net/mac80211/cfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 2cd8731d8275b2f67c1b1305ec0bafc368a4498a..9da2c9398c855b9c6f40a234469f21dd361e486b 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2924,7 +2924,8 @@ static int ieee80211_scan(struct wiphy *wiphy,
 		 * the frames sent while scanning on other channel will be
 		 * lost)
 		 */
-		if (sdata->deflink.u.ap.beacon &&
+		if ((sdata->deflink.u.ap.beacon ||
+		     ieee80211_num_beaconing_links(sdata)) &&
 		    (!(wiphy->features & NL80211_FEATURE_AP_SCAN) ||
 		     !(req->flags & NL80211_SCAN_FLAG_AP)))
 			return -EOPNOTSUPP;

-- 
2.34.1

