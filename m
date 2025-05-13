Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48ED1E376C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747108634; cv=none; b=Wu1ZYn7yCiEeJJicaBUKGtj/xpAZF3TjnwkFBeml+gO7KQEm0irAt2o9/cFMLGX5H8aRw6PwZ8fbWsLC1OitHU2Ap5CxYynQMRnoLR2pe6zOf5ybxMfUDrCUMOD1avq8nLbLr7fG337zCEw6kJqnmszbrXzg8MQ+5n1sRNMQ2Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747108634; c=relaxed/simple;
	bh=2aCYsID7h6PKzoWsDWjEbsYtZRpxTQpf8z0Sn6LvenY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxx9bs5Mmi4STyF3TBoquXZgjnM1fwyl8KADR/u9ZUNcM9Sxdv7rcdgO+LQM1P8gE3D4c9AVBAXfESdrQRi0BuFEQEqwYoX6jytW76rdeu4dPF1df7bhCQGv78W3OnvB12cyZvQ06rUc5BqaJBup90DLR1yl0h+EGSavA54G2Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3gWvTkj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3gWvTkj"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D0Sxa2028432
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5DlwmdNmedCKJPdbWIvXijFc/3cbsfXTmrrSp5SO3l0=; b=J3gWvTkjeC41C3g3
	vXGl5y6f2QrIORcM4lazgkzTALowgwk+7+DZs1SjUk/ezjZcEt85ZXgDGbJdGTGl
	rT/SDCXKEy+tpljW6ErsUvy0L0dSKayIDCHqtKgwnllvBq9L34LSKtsBY4OaTmmz
	CUhT2GOyBNoeZtfO/B7yrt1Me/talScAM7WvyzQayw8S78bB3SWVC0/9Joe5lbC2
	LrCa8B4pzlJyQAgBjxX4+tjlJC35WkAD2cbux72KYmrt2feTW655Q+OBrhYUjw1c
	GSOgE1GBnLqiGNSZf+cY5HHTMnWzX/saNmD5fP1EBr6fM/aJbd/58fiTWNLfdzVQ
	sV+0Cg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hxvxeah8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:57:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e3b03cd64so44260055ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747108629; x=1747713429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DlwmdNmedCKJPdbWIvXijFc/3cbsfXTmrrSp5SO3l0=;
        b=TleuRJWHX7vsv0+XTInB8l8/m3TiPvLgsig3Zhc9yQE7CeW6Sukww7/A/xRiNDAq6q
         qk8pykPGS0BWbisTaYvO2XeQ6dlWXeeA36R9JqxiFXd6b24U9cDm6LtzvjTkCyvqJp/B
         oVlI+6DxkYfejuzoYNcZWBcUgqIz5Q2WZ1dbDgvCx41mz/vOnmZk0de+qxjSyyfUO0n/
         rJBxHgKwV81pFp04bxKQwsdvx+DkgmzGSkbKUGSvd+16MoE8XLVbHs5rKYKR3WIqfdi4
         0YQ/jVtMRXaN+Qz8AMw1Xk/YHaBogIBRX8uwfmlUN/a5GFPry92b6zQriMxgjgSUVwNV
         QJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5n/H7q/axFy5F41/+7LS7Y7zMwG/14jCoUWea3OKyoLbl3nxAnOK+BiGjnK5yCzKjDSHkZB6FUfssfPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJRtIYHQLUAqgQsx2fyEOkWqWETQtEWXFOQgFx9l6v+IAanDh
	3ISKPaAGe/pcJSEFEonuFzEo7QxXMrXItjnzqT/YRGxzPB/58d0m8yFVhgG0caSp73rr/rf0DOn
	NbmTGT+Mc0GvFWxQFg3AuwOitcyhK33PWdvy4NdMUfs27VshqGAM2PCGBOMGt5Ik=
X-Gm-Gg: ASbGncs0dgaeVHCqOY4eNmUF/jYSa4VXx1LPCv5JhNl0axdfavuiFa88BJA5aP5+F0h
	LTGaGihRgUQqfeu/Xs5lOmV9+QYqmHRLpV01+l/GZXsD6m8RVHVnFpMIMaJmE0PQh2K7+oyu+9O
	M0pc1I6qk9QwuvsI6HIyEBR87kxDct/o+73+nHGXE36wabI0QCeyvOqxiS1LmnkUKXWboVFIVsj
	cBsqHQX2rHOKLXWqYtKZux0JY0EemvlPb4IZo4Ezy264XpKCF9zzIVfDp3gjPBiUFp+9PmQBjtY
	mbchLkUiUtt5RBQZrWBEs1qguAHYt8lh2aGIXi6/bkSMSH6wOx6o0fkijEX1f8Uv3OMYw9a3lOr
	LAvirOnTv9SA5zb6z+PKvYms4mobUZqOqSmeS
X-Received: by 2002:a17:903:2f8e:b0:22f:b69f:e7fc with SMTP id d9443c01a7336-22fc91aed27mr231332155ad.49.1747108629165;
        Mon, 12 May 2025 20:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYx9rPWYpCahLURbksqyMGB16+552UoK0wJFPuqnnX9kUYEP1Xof27IXrnXei37iJfIHAIuA==
X-Received: by 2002:a17:903:2f8e:b0:22f:b69f:e7fc with SMTP id d9443c01a7336-22fc91aed27mr231331955ad.49.1747108628790;
        Mon, 12 May 2025 20:57:08 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271d98sm70236515ad.154.2025.05.12.20.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 20:57:08 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 13 May 2025 09:26:52 +0530
Subject: [PATCH wireless-next 2/2] wifi: mac80211: accept probe response on
 link address as well
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-bug_fix_mlo_scan-v1-2-94235bb42fbe@oss.qualcomm.com>
References: <20250513-bug_fix_mlo_scan-v1-0-94235bb42fbe@oss.qualcomm.com>
In-Reply-To: <20250513-bug_fix_mlo_scan-v1-0-94235bb42fbe@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzNCBTYWx0ZWRfX+aOwew3FNxED
 k5WCNSyK7BdF8EfU7WmTdsLYiITFAVeh4K9rBCsfsa3Q71Dy1adhc0hcC/ahTW/jHb1PJKYdDEB
 unuj9cxKw/CQtYrS3UJ2J/CQWDV1/xbXVXVN9wj9aYKSvYKQqNCIM1OUfCoCW/lrgtd1WrV9vOJ
 QQNvaUHVKsR2WHEf8Otvwbt5IxpvnbqursN68ZI6TtwtljDcKRmgbf2cl5s/6a68hoWL1MrH6Ed
 DxSKjvBeJCICglP4T3cdaCPN6aBQVSixSmlDVleC5qKYzZLZy8JuF79le/g+ewT/aTrqtUR38J+
 8AymkJdZcjkPuPSXelL9XITC//OMq6b/5AYBeTgbpZSudwPN+FBEx+wmzMQWQmooyTtESlMYcn8
 V+8VXg7GzEaMPI+bL8glCDIDn3R+TcizkPy2BhwvbbGulsFrsiQuSjySS/dQM/OSaIGfyJeG
X-Proofpoint-GUID: c1vomaov3Co9fB1FYt1RkJYtTN3Bf57k
X-Authority-Analysis: v=2.4 cv=WMV/XmsR c=1 sm=1 tr=0 ts=6822c316 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=kffUEhMhicqf5g7Do04A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: c1vomaov3Co9fB1FYt1RkJYtTN3Bf57k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130034

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

