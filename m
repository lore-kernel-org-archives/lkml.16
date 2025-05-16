Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1415A23507A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391547; cv=none; b=UuPNM0+JmHHk3eFItap3w8SjeVWyLCP/QhbYI0bxqadn463gCYOsL8q/spepqB6US62hO6X+e3UCk1GRiH+gzwSQfPhR22N5DNG7uf2aHgOAbgs4gv6MwQziK6+AJKTusdW3UIOgQKMlMRXcmPjU2DVCPlOwipXSGQdyx2l/M/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391547; c=relaxed/simple;
	bh=2aCYsID7h6PKzoWsDWjEbsYtZRpxTQpf8z0Sn6LvenY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=clhHASRM0yrkOMd5Zm/tbOkaxkxjPDzeZ3KL6guT9B5s0SqSzxfbKGlFDuy1ekgtFWEZB+n2fveS0Y8eYrpMMXSc1lAILQ0YYEAND4tSoyQmLGMeLeNeUWW7NYnrJBy8Cldrrew7UDkWyQsqPruWNQveV2Vdg5v2Yjm3FuhIvB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PEUFMCAm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PEUFMCAm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3J8MY015694
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5DlwmdNmedCKJPdbWIvXijFc/3cbsfXTmrrSp5SO3l0=; b=PEUFMCAmjEecjisW
	0OcfCooXGYT+YBGJWpaGqi3s0TCFaXdlXKx7N2Wd8aIcAHYreTZ/6ad2NkslX97R
	Vsj23Q0nUilQ7a1hujr9T7ZOqOIqiE1E/l98p50UReJYSZUZBlOnMoa8GiYHeXKs
	z4zwIWmeuCk+7FMw/AXapLAB6Zu1efLdDcp97sbfYBftn8mHXh/es8nErSn1RYmb
	CPOgrfFla5FcOFl2EdzsDqjaRu3z5Iepc+SemW26phszV1kiUhmD59MK3KJ2GCeY
	xUmhNUUdfDSDhP7StmgzE20l7w38TrWfPL/k05NBugITERY3WaaZeCIcO4/viE61
	f7unQw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcphrj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:32:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7398d70abbfso2640957b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391544; x=1747996344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DlwmdNmedCKJPdbWIvXijFc/3cbsfXTmrrSp5SO3l0=;
        b=ltKyj3w4hCt6uyv6BzbfdryLrlTYcB7G273buZfozaj/l5LXTsKr1rVOr4qmEdploX
         6kQyPkCYNyNwQWHpmhCJQBeLvJ1RDGCqIS8qETVlFWr+7uTotMkqhD+y55qUo7ZANiR2
         ofgNCGdDYN38JcDVJchzRi15nRHV7oL3u2KTu86LQeT+TF+zuhrazoYe1HSJ9JmRHaOh
         s2ULirk3AmRzg9+UfFBmrYd1Blr3haIIrqoBCo+UPqJ+7g9C7inPxwNJ6hDE80p6+EZH
         ydifQwJ/a41PCldgiOMH5IBAHFjNllaodJ++O9rgeOgRHRS+2Qc8DOTTHmQ0O4qs3eQQ
         ywXw==
X-Forwarded-Encrypted: i=1; AJvYcCXCJbSMrvNPHDkBOBY08CGrJVn20/w/Gbh6ESjIEub7QS4WA/82bAR0nshlpVi1eWHDTdTSRGytUUzjzrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/pF0csyKQTLpiUm82jK5Qz++MbbmAYJCFJi223QVW77oFm+RQ
	tZ0K/anmjYAL+HBEzcL2nGihcFyZd+2/I7c1KYrN66O0/wygt468V3NbSqssEH1RD2q+AXMEbk3
	kEd51YRE6PgHFDHutbpvMonjxpLpOm4zGE9UyqakF2HNxZ8GZ4k/TIemCeCCg1qN9Z7E=
X-Gm-Gg: ASbGncuMCJiZjTfnPGYpfkXhJqzPd+lreUqroyrjhxf2/Qa2sLsSZPs9XANmnWSX7jD
	SYAyamYl+cHcgWwwI4iMuHyuko63GX3Ej3vVOHT8+KqaJOIPFTEF86JFkXswtYS6OswnQ0qFU9Z
	9FJO1k2wcwZfK4h5ytnXy1hT1hj8hryLg2HOCm9e44utywwZVw8VFLHH2b+Qi+ReawymJZxWXVb
	zL9uhsneXa8w0cJYknnMFWNRbuoOkPHr1ibALJD8jZBT2lNdfhTtY9EauzScUgpzgOe2a4lY4EV
	CHJ2ySysPhNmMl/EBiPSZZKvlXLj0ZQIG/AaPfly+7TVOjBEbN8mPFi4A6XozcYwMkJwhjctbwC
	vbX88vo5uBeZvp11FtydvQfXq3guz2+5k6/ps
X-Received: by 2002:a05:6a00:2d04:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-742a978ebbbmr3468648b3a.1.1747391544247;
        Fri, 16 May 2025 03:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFteE3Mw4pPWiE7vfRquHKpv93rwCXiS52hSupKTl7Ckq9iVLreYnHqgng08z9QmeE+vjgsaA==
X-Received: by 2002:a05:6a00:2d04:b0:73c:a55c:6cdf with SMTP id d2e1a72fcca58-742a978ebbbmr3468606b3a.1.1747391543642;
        Fri, 16 May 2025 03:32:23 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a986d8d7sm1247585b3a.130.2025.05.16.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:32:23 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Fri, 16 May 2025 16:02:08 +0530
Subject: [PATCH wireless-next v2 2/2] wifi: mac80211: accept probe response
 on link address as well
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-bug_fix_mlo_scan-v2-2-12e59d9110ac@oss.qualcomm.com>
References: <20250516-bug_fix_mlo_scan-v2-0-12e59d9110ac@oss.qualcomm.com>
In-Reply-To: <20250516-bug_fix_mlo_scan-v2-0-12e59d9110ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: IIqozE59XZRAkuUZP_NvL6JmjuTLsLQ2
X-Proofpoint-ORIG-GUID: IIqozE59XZRAkuUZP_NvL6JmjuTLsLQ2
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=68271439 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=kffUEhMhicqf5g7Do04A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA5OSBTYWx0ZWRfXxjbWqfhVEnAJ
 ANRWbpj0hnCyvPdB00E7CNuoexc0MIiptX3kDx5UqaWQi0OgBLrkpRNs+Wr1JXM//uEL7KcnIjr
 GRexyeV/icY1ZsfkXn8CVgSKwh3+r7LjcVzi0teFYLZKKn/BmY7ljqJ63fJM0faZn74iRUarvuJ
 K7mqHiUqkaYa/ebCMdpCMxqBT/z7GmZqi3/45Tbcw2Fv6OkzN0xp4hrzwNj3oeRb2ri9k57F/Cn
 cH9NwHRfoSJf16t12R5SeeajDkXC8PnrFEGurmIYBT9He1xP4xFR4gvCVz2J9ulFDlcH1y3dgdO
 kAsoDoxIck5pueqa8UlUXzRIPhUQ5ZaE4dai3J6PAVOhMWvEcS/v+t8KqoH2vNfI7Lxv5wAVEPm
 styynMrARQt0tD+LaNss75hunL9GSxenradGEtekgz9LvKHuY9p2vlOCZDvUDdeaQ0fivfIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160099

If a random MAC address is not requested during scan request, unicast probe
response frames are only accepted if the destination address matches the
interface address. This works fine for non-ML interfaces. However, with
MLO, the same interface can have multiple links, and a scan on a link would
be requested with the link address. In such cases, the probe response frame
gets dropped which is incorrect.

Therefore, add logic to check if any of the link addresses match the
destination address if the interface address does not match.

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 net/mac80211/scan.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index cb707907188585d6874bf290874bdb0ca33bb399..7b8da40a912d020f229a74c67bd5a57fb513a72d 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -240,6 +240,9 @@ static bool ieee80211_scan_accept_presp(struct ieee80211_sub_if_data *sdata,
 					struct ieee80211_channel *channel,
 					u32 scan_flags, const u8 *da)
 {
+	struct ieee80211_link_data *link_sdata;
+	u8 link_id;
+
 	if (!sdata)
 		return false;
 
@@ -251,7 +254,20 @@ static bool ieee80211_scan_accept_presp(struct ieee80211_sub_if_data *sdata,
 
 	if (scan_flags & NL80211_SCAN_FLAG_RANDOM_ADDR)
 		return true;
-	return ether_addr_equal(da, sdata->vif.addr);
+
+	if (ether_addr_equal(da, sdata->vif.addr))
+		return true;
+
+	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
+		link_sdata = rcu_dereference(sdata->link[link_id]);
+		if (!link_sdata)
+			continue;
+
+		if (ether_addr_equal(da, link_sdata->conf->addr))
+			return true;
+	}
+
+	return false;
 }
 
 void ieee80211_scan_rx(struct ieee80211_local *local, struct sk_buff *skb)

-- 
2.34.1

