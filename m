Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BBE2798EC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755367; cv=none; b=MT5HjAhn/+ib2+47JYHYx3DAUTdtHXHN+AB4wN5vzHO2qSBH112ypqHxeT09tgHKLLncjR09vC3ElwbFwdc0wS2+x2WCjIoQWCmhD8p5+vZTmVIebsIVpsMPjHXB8HQjFS2CyeuAoVQJwx4oUC6jIjOX5UTIkxlXI3s9sPfcGUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755367; c=relaxed/simple;
	bh=3PdEKj7rDVZ8zFeKIsZ1LZjJvJ1mHpdkk9S3Q1S9SpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u8jYWHdrH0Zf2terlQriRSHiuiXKhxe+dEY6Rh5i2Jmq5m5Lo0n/wQ5XpFcDnDRa8/O8apeoAfg72BCXGPAlImJQSIrdWsUA4knLLt0nslGPdmVHTWd8TQOXTsnZF6GjiO1TSHAzdoVVuz5iSFFax05WEFLBh8QnOz6/mAhhxjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cLrmJbhx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cLrmJbhx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8maq6014676
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SOu9Bw5LRvNlUBC9KSdiDa
	kXqlxjavWGAyb3A4PfOJ8=; b=cLrmJbhxKfx04tPAuHf6XYPlT9NJ6hxqknnYnX
	T54/p3Y2r2GW9yIDkFG4rsG2+qZT8qKZsfP/edgRXM4LbvYo++EFbAOl9YEaOLPI
	SW4BmCA8+ods7L+ejvJCnPz9vg9S3rl45owaKIHVnXDg6NWRS+VpVJISTv3s7ic8
	OWC8aOvJzk2fdxx4bObL0WRafKQ16eUSaN5hXbB8h2fcB8bvzYjSjfamLKaFSAY/
	X/MqElIaZjXhcexlRhk28yPxgej0te8miads5oY6eD7iw2wZjmYudUT/wivi0HVL
	h4CRtC6mV0GKWJaFZCWRaexNGX5UblnCQ46sbCPg0sH0Xh6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpumth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:56:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23507382e64so48631675ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750755363; x=1751360163;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SOu9Bw5LRvNlUBC9KSdiDakXqlxjavWGAyb3A4PfOJ8=;
        b=tPmnAS0FTgJzK7j/LiWs0maEpgRcTopMkcrKZBrJoVaIV7LjSZ2a4Kc4QPITLQjrZu
         /ECtqcp4WfyNY7Xv2L11UR04SHv0eo+Ceq5PDJLU92WoHqWhN6wJ1jQ1oJJr8AVU3d3R
         wrqEDFdk0NH9ZFXXLDn/VXtB9c6by3SQPUPlr12Dj63EYNOnW39EOBzxuG35fXJYBYf8
         X6rlP7IuTIWInF9cLMzumd0bkdqD83HElIymlkaSJ9cZhXeXCWkzFlmhdD1xiNzc9bei
         hcLNsLD0flgKxZjAiKotxbNlmNmoa8sGSc66D81i4yCygtz3iXU7O2fD8YgrFTsg/M3b
         dung==
X-Forwarded-Encrypted: i=1; AJvYcCXuxXEcf7+rfh1avDrkbcQK4VA3E+hfmlnHmAhPv78NqitRZRfFhWOfb4wbOuUYY9GOb8vPWjIQvtfx5fo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvESRODBPrsQNpQy5XCguCo9iCQn2sb+3O4bfvvGGtteLbIFa2
	It+JG7AsoBVyEpKJMN6F5xpycRkSLujhPrPaQomfu74zLQgGK+dP9MQZhtgGD6gj4mzoBIU+MTU
	uXVFswAGQseSEkZLINstnWdrAyxFFzLKxeHEnztiVH3jTEkDF1SpVA9Qug+qG2caqlxc=
X-Gm-Gg: ASbGncuG7E1f7ff4X/pvrFNPnrf2hX04zQSLhrVKk3dnMgJshkwUG88sstEeLV0q5sj
	DcZiso1vPyUxI/hbtlcg843EHMoN27lEfRt1D+BamJWyZ1wZ2X6s5Yy3kwJ09OXDXXtpiPr/aVC
	cbsrvEIV8gf+iOHACNSsY5ScJ25l6ABdLoPk3fYvldVEfGAru94tZecB/EHf83H7lw5UY/HwTFQ
	MfCild/oHa+TJb1cNM5z2cXGqCKznQqJ2V/UJWY7+b0l3ios4qYr/ya2XwUyA3urL+7Mu4VrsYF
	+TLxi34da6TTDveYUaGqly6tWZPPITdApbIq9gHaAEb9BV3AJCtGEScdOUXzTm1ZPFsP8ERu0xw
	OvB63eBIPfkhUlCMWkT8EzknxKTAurtWu+n2P7O0KBivd9p0=
X-Received: by 2002:a17:902:d512:b0:22e:4d50:4f58 with SMTP id d9443c01a7336-237d9a4eccamr259966185ad.31.1750755362965;
        Tue, 24 Jun 2025 01:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESCTrHqTQ5TroWFek0yYYNeAiATrmCS7Cwvdng41BzZt8iL2ED3EEnuB00mtdHaLTbG4MRNQ==
X-Received: by 2002:a17:902:d512:b0:22e:4d50:4f58 with SMTP id d9443c01a7336-237d9a4eccamr259965865ad.31.1750755362531;
        Tue, 24 Jun 2025 01:56:02 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2380fffcf23sm4680865ad.249.2025.06.24.01.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:56:01 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:25:47 +0530
Subject: [PATCH wireless-next v2] wifi: mac80211: consider links for
 validating SCAN_FLAG_AP in scan request during MLO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-fix_scan_ap_flag_requirement_during_mlo-v2-1-c8067d0ee1f0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABJoWmgC/5WOzQ6CMBCEX8X0bE1/rIIn38OYpi0LNoEWuoAaw
 7tbiTdPXjaZ7Mw38yIIyQOS0+ZFEswefQxZiO2GuJsJDVBfZU0EE4opcaS1f2h0JmjT67o1jU4
 wTD5BB2HU1ZR8aHTXRlqV1gG3hSoNJ5nWJ8jRtelC7jnQAiIN8BjJNb9vHseYnuuOma+mvytnT
 jk97A9MFiXI2qpzRNwNk2ld7LpdPp8hX2zxH1Yq4xhII+qj/cVel2V5A9AGCGBLAQAA
X-Change-ID: 20250527-fix_scan_ap_flag_requirement_during_mlo-d9bce1b859a1
To: Johannes Berg <johannes@sipsolutions.net>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a6824 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Zr3TjlwJAZfEZ8iIeDYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NiBTYWx0ZWRfXztitEnUj5oAn
 JWv/ofYQ+29eMqPoJA08sXxnakEIkrdL6oZRd+Vb64ZtGdkWK3l4oQZEjnR66bIWHchugifDR8d
 ZBJpBrUl/SvgIZsQ0a0unex0WJ45uIkQF/jJHp5Qb9UbVEMmln+gjXRPW22UJ1HIK7GrNz1aRPK
 XNR8gQbQoPCi8IlpbuhWDgBco2ME0vPrrxSXA5avDJPM1MpPnoALoeee37YDbvr49w722/iFGjS
 T3pGGO7CbHQVT0TAUEV2iQ9IcDbXjNmbRmBEpp3/H5tKk9qW7pdf1dN+5Kdl77UNQB21KHc2kyU
 05arvcGCG67TffbDfec2Wx97K9xPm+7HaabapooMCwNVCvuGHzulbN4HrMVnJzoIXjgWkJPm6xB
 yoA+Cz9QF/vZcgyblU5fmWSf+RFsgnQ7N9XzhPk5MeNxfcBZO535Tu51HiAETm+WH3LohRfv
X-Proofpoint-ORIG-GUID: bdVDImKB2ABElUuTlq5Kxg3S5KYkenJD
X-Proofpoint-GUID: bdVDImKB2ABElUuTlq5Kxg3S5KYkenJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240076

Commit 78a7a126dc5b ("wifi: mac80211: validate SCAN_FLAG_AP in scan request
during MLO") introduced a check that rejects scan requests if any link is
already beaconing. This works fine when all links share the same radio, but
breaks down in multi-radio setups.

Consider a scenario where a 2.4 GHz link is beaconing and a scan is
requested on a 5 GHz link, each backed by a different physical radio. The
current logic still blocks the scan, even though it should be allowed. As a
result, interface bring-up fails unnecessarily in valid configurations.

Fix this by checking whether the scan is being requested on the same
underlying radio as the beaconing link. Only reject the scan if it targets
a link that is already beaconing and the SCAN_FLAG_AP is not set. This
ensures correct behavior in multi-radio environments and avoids false
rejections.

Fixes: 78a7a126dc5b ("wifi: mac80211: validate SCAN_FLAG_AP in scan request during MLO")
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
Changes in v2:
- Rebased on ToT after dependent changes got merged.
- Link to v1: https://lore.kernel.org/r/20250528-fix_scan_ap_flag_requirement_during_mlo-v1-1-35ac0e3a2f7b@oss.qualcomm.com
---
 net/mac80211/cfg.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index e0dd0a8625c0151a6d5ebdf4e37f4e3bc257b340..75f86c33545ee0055a569dcc364d14e0bd8e62ca 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2901,6 +2901,10 @@ static int ieee80211_scan(struct wiphy *wiphy,
 			  struct cfg80211_scan_request *req)
 {
 	struct ieee80211_sub_if_data *sdata;
+	struct ieee80211_link_data *link;
+	struct ieee80211_channel *chan;
+	int radio_idx;
+	u8 link_id;
 
 	sdata = IEEE80211_WDEV_TO_SUB_IF(req->wdev);
 
@@ -2928,10 +2932,36 @@ static int ieee80211_scan(struct wiphy *wiphy,
 		 * the frames sent while scanning on other channel will be
 		 * lost)
 		 */
-		if (ieee80211_num_beaconing_links(sdata) &&
-		    (!(wiphy->features & NL80211_FEATURE_AP_SCAN) ||
-		     !(req->flags & NL80211_SCAN_FLAG_AP)))
-			return -EOPNOTSUPP;
+		for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS;
+		     link_id++) {
+			link = sdata_dereference(sdata->link[link_id], sdata);
+			if (!link)
+				continue;
+
+			/* if the link is not beaconing, ignore it */
+			if (!sdata_dereference(link->u.ap.beacon, sdata))
+				continue;
+
+			/* If we are here then at least one of the link is
+			 * beaconing and since radio level information is
+			 * not present or single underlying radio is present,
+			 * no point in checking further and hence return if
+			 * flag requirements are not met.
+			 */
+			if (wiphy->n_radio < 2 &&
+			    (!(wiphy->features & NL80211_FEATURE_AP_SCAN) ||
+			     !(req->flags & NL80211_SCAN_FLAG_AP)))
+				return -EOPNOTSUPP;
+
+			chan = link->conf->chanreq.oper.chan;
+			radio_idx = cfg80211_get_radio_idx_by_chan(wiphy, chan);
+
+			if (ieee80211_is_radio_idx_in_scan_req(wiphy, req,
+							       radio_idx) &&
+			    (!(wiphy->features & NL80211_FEATURE_AP_SCAN) ||
+			     !(req->flags & NL80211_SCAN_FLAG_AP)))
+				return -EOPNOTSUPP;
+		}
 		break;
 	case NL80211_IFTYPE_NAN:
 	default:

---
base-commit: 757259db79fc6054780e07bb284f768b01cf8fa9
change-id: 20250527-fix_scan_ap_flag_requirement_during_mlo-d9bce1b859a1

