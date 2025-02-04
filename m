Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2D216619
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688734; cv=none; b=YmrZdYN4I2Kq/iF84HcaSNYgMKDjUHvYt6/QvdB8QMDu6zwxP/wH6mxqhtlrh46EMqO0cRwM0lOwEcyECjkA9CKwlprzICrCMpqNzcY4mnYOaavWr+RI/zSDHxT9z/8v/lzodja8h981GkrCx11WgLTFtevu5k54so3KhI49JAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688734; c=relaxed/simple;
	bh=OEvxUUHd1bknAjWDidS+dI9Tyqbgg6sCieUjL97IA3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSMl++skcZg6MiB2YotJvPQ8OQxPwtMVzwyo/Yr/bmNmTyBnP6uzpuBUFzygIWggOrB7muxaX6x0V8Iu+gHIHIzDoPb6uG4HnQ4lAtOptNxYZono4rsnjCt8IYSMLOyzaBj5LlNKtHRqsQOBofnKsB5V2wf6RVD2eoAYty3Uh/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1Rkyp/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1Rkyp/q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Gubud024462
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 17:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dy1qfD5UTtYECRWWfOe+C5t/d7dowdD7s3GDIHnLHoQ=; b=U1Rkyp/qYcYNhlZp
	61yYNEsgKgyZNJlBZKkc7bLr15tOwtsLk8mrsb9AfaK8u6IzJvGZYYygcJFW+Gtg
	GD3Ffj386mswCWWyqD71fw0rvXmIb+6YdNNhoREaDgNN1RcwneZlcQ52IW4szNxI
	SfcZLGKY5Fv3AaNg6N+0jOr9mkkmAp973+rjqsb+xALTLF5K9/CoV745KckUxXJN
	EE1BxpPy8qN3153u5+3V3DTkqyJBbMC362V8fZdf84RCb0zkRRlmpFygRJNc2re/
	AJcrh2Bx1izphcGBtKOd9m9UBHgyidR96/qayblSsuu5avEsNxxQsBRVyYCO6guU
	MekNKA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kpuy80vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:05:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216266cc0acso119329295ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738688731; x=1739293531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dy1qfD5UTtYECRWWfOe+C5t/d7dowdD7s3GDIHnLHoQ=;
        b=pguRdijGaoI82xW5IAVpVYDhGD8vJHTYvW/PxwLgeyHEWREybVBulDTjfdAed+wzt9
         1Fa6Eg9/9zj7OJ1F3ekR2EjNkNGuMD5oRE7QmezOexYoOX/x1o+x5DkSVEFImz7PMwxm
         1tn6x1abeNq/ynONAKpq+hSj77TDGFpzH7lokcpXChneIGgEqi9Je33kz+h5oUYGS7aP
         VVAF8Y4ZXNW1CkU/4rWk+Ibp3qdER2SSHyInSIhNlqSeyzsBu4H6bVa7q9IN73loyldl
         u2EzudggRRHr8od8/YpSaIAhVaQhJYHuAOfKcTIzWV6CRPE6VH8ivYC+5DAgfDawY+E7
         fzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa/w7iVCUdYFLrRh9PIh+3AKi05G7rqllqbhjrIK++1QZqGjVqNeMh3bxsBaRMlRAXh1j0uxd0Ku9GERM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOUJs5rjfEWY7s+VxG4ldnmqxLSjmvR+BGsgSsQ9qezczNiYP3
	/ptoVTkDHwIGHJ4OotsJnWDQ27d8pE9Pu/nj7B7NJFz9e/cQRCmkR5klD3aG4JxznfClWoQZbFn
	vA6JvqKoa9AxlTVSKZlP/jfS+riYivFLWwBO2dQhQo8mEtkdgL7fnEZiJjy1DLbs=
X-Gm-Gg: ASbGncs3EWQ4LMC02K+o2V2zW3B5yDDeBa+RD2NppFVBZB+R3GTkpOhJ9ioZIXiTjcj
	0OXSktUnpZYI2R5cEmY+NbozrhdWOr6XKY2C2fNjfU2XD9Ej0oobo7vV1FWZOMHK9Lra2+cunXY
	qbaja4Pmt9WYJXzNXpWEiEaVNs20DlrkaqQIhZyVjRCs0CmkXah1Yx6wyqAYmrgrVC+HW5JTa5b
	HbZZ1QQ44+wXGxtsxRKr9Rtgep3Avm2MCI4v5cXWXZX7jC3FvciSdwBJdAs+e2qEHJybkTqW/Rm
	/mcaNpT1SG0D4u6t+61XCH4/AjWCRrLEOcayIZmW7SoIVGetYODKk/cbdHSu8njBFTzueLenLge
	9kD/mpUY0kshImka5TQSi4SzyIiM6XA==
X-Received: by 2002:a05:6a20:c70e:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1edd76c2660mr6105393637.7.1738688730952;
        Tue, 04 Feb 2025 09:05:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVBF367qbEcWZt63Cm8v6f2EmzewOOW3h6qyAO9Qg7zw6MWUQtPT7SGCjw9ouetmj4kRDb1g==
X-Received: by 2002:a05:6a20:c70e:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1edd76c2660mr6105350637.7.1738688730541;
        Tue, 04 Feb 2025 09:05:30 -0800 (PST)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cddbbsm10772788b3a.125.2025.02.04.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:05:30 -0800 (PST)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Tue, 04 Feb 2025 22:35:11 +0530
Subject: [PATCH v2 5/8] wifi: ath12k: use arvif instead of link_conf in
 ath12k_mac_set_key()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-unlink_link_arvif_from_chanctx-v2-5-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: xAk531PsOrJO1lc2ZC-t45dD_G2B6IQE
X-Proofpoint-ORIG-GUID: xAk531PsOrJO1lc2ZC-t45dD_G2B6IQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040132

Currently, in ath12k_mac_set_key(), if sta is not present, the address is
retrieved from link_conf's bssid or addr member, depending on the interface
type.

When operating as an ML station and during shutdown, link_conf will not be
available. This can result in the following error:

ath12k_pci 0004:01:00.0: unable to access bss link conf in set key for vif AA:BB:CC:DD:EE:FF link 1

The primary purpose of accessing link_conf is to obtain the address for
finding the peer. However, since arvif is always valid in this call, it can
be used instead.

Add change to use arvif instead of link_conf.

A subsequent change will expose this issue but since tear down will give
error, this is included first.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 5f0388002e16c38a834d6c7c6c020b7afa7044f0..db866c1419a613103f119037b19e24b7edaa6c24 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4667,9 +4667,6 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 			      struct ath12k_link_sta *arsta,
 			      struct ieee80211_key_conf *key)
 {
-	struct ath12k_vif *ahvif = arvif->ahvif;
-	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(ahvif);
-	struct ieee80211_bss_conf *link_conf;
 	struct ieee80211_sta *sta = NULL;
 	struct ath12k_base *ab = ar->ab;
 	struct ath12k_peer *peer;
@@ -4686,19 +4683,10 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
 	if (test_bit(ATH12K_FLAG_HW_CRYPTO_DISABLED, &ab->dev_flags))
 		return 1;
 
-	link_conf = ath12k_mac_get_link_bss_conf(arvif);
-	if (!link_conf) {
-		ath12k_warn(ab, "unable to access bss link conf in set key for vif %pM link %u\n",
-			    vif->addr, arvif->link_id);
-		return -ENOLINK;
-	}
-
 	if (sta)
 		peer_addr = arsta->addr;
-	else if (ahvif->vdev_type == WMI_VDEV_TYPE_STA)
-		peer_addr = link_conf->bssid;
 	else
-		peer_addr = link_conf->addr;
+		peer_addr = arvif->bssid;
 
 	key->hw_key_idx = key->keyidx;
 

-- 
2.34.1

