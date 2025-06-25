Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36BE19AD5C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856487; cv=none; b=ZKTaIPI7zDUxofzpl5eyQ7hMxdowfbeT84oyTHUxy0VTckAoqgH92yitoyZTVpijJi/dlm5e3cGedhmZuCT+i8jiSf2PnKZ39AeALv7wqx6lmZWomJD6Su24GtDBbraX/zY72d9BMaTnxciwBGxMxAOk7t0jLMV7JpkdC6rL7Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856487; c=relaxed/simple;
	bh=PZJSsD/pDq06z3wAaRS8IT1Y3CKfoyhoE0l7xeGR9/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bkFrFlPuOeYcosrRCNxE1AQhhQDtnSB3W5zH62mzdTWpoK+S9hPHEdPmYn5SMRGY8X0dFqGj8D4M69L2rrgIlDLW0a2nm2eN+J9l6wXujBcrA4PGuqEA067ZKxgHcFtvrZFDnJw5+0Yl7wD6u4p2iX+utmIcAvkbP8ZGMZsJu5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a28DAEAK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a28DAEAK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC54xR022214
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZtJ0xS+J0+LlYMK62oSQSc
	AP/5HSBxdnyXR6EOPjrMc=; b=a28DAEAKGuP+yTCMWnK5d8izBqbQIKK7IXkWHS
	nT2ataklJs5zGwbTljNK15/ug81hpWQg7WC2TQd0dcBmYc7qtfvPdpMoQljWH3t5
	8+hwxhOM2x8IUGm7+MsKZvoU55Opq31Ys3niI/BUWGqzhqJQhLll/aAh5BKAuK3z
	mw+U+5mhZwlhLdmD9J6GkbQouvXfzOXCTmz2fEd0zm/CBn7j9cRJR1lfXBm9VCJh
	HDzcrM6rvDxq5q98VOBER9BgHU09WKVd/kw+Vr37wt2eXWzUPXZ9HC+GB5Km9HMt
	y4HZ94l/uKoEAkVOlC5EaLAR4HV2yPjmMnDo5Pnn95Q0B5eQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwx7j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:01:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31215090074so8983114a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856482; x=1751461282;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtJ0xS+J0+LlYMK62oSQScAP/5HSBxdnyXR6EOPjrMc=;
        b=P9m+Fn07ZtlCJjyzlednORSQoeGFlVBl2BpidaxrJbHliZnHJEXva5neYFFQ/LERfd
         UkJ4V6jvu1cDZvGDtdMt6o2O67d4AOWv47fnULEyXRQ+0o7UQgZ4qxGyLIcPmJxu28cz
         FgLtrG7aDNd7bM2tTT+++SqzTuxmT8FUmYylWORA1sQ9t8u85WVQxtycu7RxaJOxWe+9
         L3IxpoxFUaE4aMPXdjSmSfLv4K2g2H/4JBtnxKL65C3ll0FHGPVAk/j5fqdKQd2V2cC2
         2KVPSs/h8JyJrw6ae0HJ88tvADo6O0zzH8awIL29yLspqF12kWfIz9K9ePlIGj3qexql
         D+cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrTG+x1pMBqBlqxMdZWyi5Z6OLc8mFu5q8j2xcE0vF+WNa3oUo+1SJpc4z/WjufLmPGvSzaISAQjnuojw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Q1h/LInTa/nf7lEPCruBBwT5HXzJZEN2Q+MqLKM510Ak0Ubx
	IcKeFDjfUDWL7mUeF+jZNi7qucNDif1Jz+RzfPqE8LegaH2853MMvn+qV1ysnuCfZgnCGFM8MLY
	zVaXpVdbWLLuCmdX1kHvEYEew8BHA8Iebz3dYDtsWfQGIbuyDlzTHUnBpb9t4vqXu7DE=
X-Gm-Gg: ASbGncvOEwoz6dPJ0KOJpjTlwdyCi2/CO3wB+v6RbllqH6Ta5zZ3a7mntt8nVYrdiah
	OtfTAo9MCFJnOB1huRn4kjR33RRZmdf2A5BT+YXEzI19tN06b7+khh3V2AIGpS4Lu2ZCacZMMBm
	4bY0b1QNrSwZmhcbe/tCw/8oTap/tdx3pOJ1DZjLAYgV+c+2/Yb6q0HHfVgNde+o80J771++7gC
	C6gorRsirZiNeBGelkJYb54b9wfplm8qMZ/FnXdYihjlsqfWNBgfgoshOKVMtUZfjogpCQWc+TC
	26B5s9yVKQBDMi0jYL6Wa4NB7eKU9cbPLgCxMooOSGACm0Q3c46XVK59luCmpDvgAoJgpmgXSAi
	rOKsd7FuANEPa11qARDzQbGF9Yr1gn+Q5ZAzj38vMN9WcGF4=
X-Received: by 2002:a17:90b:2550:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-315f2623c4bmr4903390a91.10.1750856482150;
        Wed, 25 Jun 2025 06:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiDa6U6OtxIRJ18P8EzRSmgiKQlZTN3JnTutGv8iOGf++pYBG3vzNIdSTgsW9lbB9Df8KxbA==
X-Received: by 2002:a17:90b:2550:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-315f2623c4bmr4903316a91.10.1750856481522;
        Wed, 25 Jun 2025 06:01:21 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8753900sm132179335ad.253.2025.06.25.06.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:01:21 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 18:31:10 +0530
Subject: [PATCH wireless-next v3] wifi: mac80211: consider links for
 validating SCAN_FLAG_AP in scan request during MLO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-fix_scan_ap_flag_requirement_during_mlo-v3-1-dca408b10ba4@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABXzW2gC/5WPS47CMBBEr4K8xsgfnA8r7oGQ5TjtYCmxwZ0ER
 ih3HxONNIuZBWxaKnXXq+onQUgekBw2T5Jg9uhjyEJuN8ReTOiA+jZrIphQTImSOv/QaE3Q5qp
 dbzqd4Db5BAOEUbdT8qHTQx9pWzcWeFOp2nCSadcE2bomncg9G3pApAEeIznn9cXjGNPX2mPm6
 9HHkTOnnBb7gsmqBukadYyIu9tkehuHYZfHq8gPtvoMK5WxDKQRrmz+Yl8fzOK3dSH27+NFxtu
 KFWXLALhj/+CXZfkGwgtcI6oBAAA=
X-Change-ID: 20250527-fix_scan_ap_flag_requirement_during_mlo-d9bce1b859a1
To: Johannes Berg <johannes@sipsolutions.net>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: jwiRbmGK_SM3a8jBRFTSjMH-4IANKFR_
X-Proofpoint-ORIG-GUID: jwiRbmGK_SM3a8jBRFTSjMH-4IANKFR_
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685bf323 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Zr3TjlwJAZfEZ8iIeDYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5NSBTYWx0ZWRfX2jXsgJCsP+IO
 R7PtxGbtWPwFivJCUfwGgK/mkBUZk2a7LITg5QmaKumoZ0fvQUHSc8LXtiWa2IeYD2zornRW15V
 qEQisMtNCY6vNeH3RhzZkcDG1PzlKJxlGb/QHJB0NCpu3uwx9rEISAL2OBvPokJgIE8yl0L3cjN
 rrrbrWiF7DAGPBiTfFRjHhJF/+zm6/ASRgxS0N/GY1d3dgoxOmnk6dzhUxltRDXjHFWBKZIqUIF
 hMe05GxB4kZvho+zFg4cJU3hJTPhWL+Hx05F06ANmESTnPt8DPNAALjYo9+qrmQhg/ebvyE2WRy
 Ngl1QJ0A/N/hCUI0rXWAkCLz2FouwK5jwGf2qBWbtjvyrcJxD0QX53+o+1OVyj5Pn6yKsUIS1nI
 Ub0KwG1NJH6aKsL2XZMzRoqkYYsyjMD9dEQs7q40lWmmUM/8jIaa5o7gXIOZrQMWFDhNDolO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250095

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
Changes in v3:
- Rebased on ToT.
- Fixed hwsim warning issues. 
- Link to v2: https://lore.kernel.org/r/20250624-fix_scan_ap_flag_requirement_during_mlo-v2-1-c8067d0ee1f0@oss.qualcomm.com

Changes in v2:
- Rebased on ToT after dependent changes got merged.
- Link to v1: https://lore.kernel.org/r/20250528-fix_scan_ap_flag_requirement_during_mlo-v1-1-35ac0e3a2f7b@oss.qualcomm.com
---
 net/mac80211/cfg.c | 41 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 56540c3701ed786c37f946f9c4af820c15b5922d..290ae4ef02f5097a7efb7e4b9d3f846fc672679b 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2919,6 +2919,10 @@ static int ieee80211_scan(struct wiphy *wiphy,
 			  struct cfg80211_scan_request *req)
 {
 	struct ieee80211_sub_if_data *sdata;
+	struct ieee80211_link_data *link;
+	struct ieee80211_channel *chan;
+	int radio_idx;
+	u8 link_id;
 
 	sdata = IEEE80211_WDEV_TO_SUB_IF(req->wdev);
 
@@ -2946,10 +2950,39 @@ static int ieee80211_scan(struct wiphy *wiphy,
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
+			if (wiphy->n_radio < 2) {
+				if (!(wiphy->features & NL80211_FEATURE_AP_SCAN) ||
+				    !(req->flags & NL80211_SCAN_FLAG_AP))
+					return -EOPNOTSUPP;
+
+				continue;
+			}
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
base-commit: 7322a7d80c48f81888414f347e88ebd4e49f7f56
change-id: 20250527-fix_scan_ap_flag_requirement_during_mlo-d9bce1b859a1

