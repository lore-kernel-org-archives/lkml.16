Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8A81A9B53
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751256943; cv=none; b=ehc32S10HW4e8sT6xR+86ruCVK8VRUKmeoiJuIOu0hFgbZtvC9m70jhksYZYa+nDJ+8MY2KTJmVhJpQqVFfeqUFfDEDqVsd3JZPYeip5YvNsQxiW3KDMydcQuqsGtBscjP/0en1b+ZPUl7Yyk7/WF3yOzQbwhJIfzEEvjbeT75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751256943; c=relaxed/simple;
	bh=RwToH/cGCZH+YJlEXJRY3Lb9zN50RXZwi+WeP0de+ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6J6t8dm/XPMb6dz65hoI5p6HxWmdsY9PVf9XxQ8x+JviFSBQkK35w/XyROIUyE1bDBZjgSRu3Dd7QBEEzqq4Ca6Xdii+bsCY7p6227mI6tV0VfkKDaTkfORBIU1jZK+EqR3AjHyao22KdnsSu9h16JQ5BxMOS/CQzO0JYrj4u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRJTVUzG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRJTVUzG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TNUJT2010612
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zlwIaUvtBdKmWYrvQBftvSATw4E35AAP8krPXhnxFc=; b=cRJTVUzGg9n8pYoY
	tkBd0SntV2ekvMA7U74iOhbFFEq/CUfnRTVpiXMfYuE5cpBF331Ogc3ESCtjQLwQ
	j9LNfpppygkqS5iqCmpDYbs1QRwS6aqZ+uK5Y4nizTJV8PW1o5eN5TcuIjOg7kON
	H8XhHtfhTc+B65MxfrtYfggJR+6YsXkRsBDHWDe7fEvT4w39VatumbZ9hnFm3TGC
	VU0gsadP52JwdNPwaPUg2qHGNBwPBmmqrSSKH3sU8fTxa4PMfWqMSa6oh44lG52F
	VIYr1YWwg8lLZj609I1yHW8vwdl5iKCFKNotk2i9xhUNeeIA5ONR0rRlwxCeT4L0
	RGCO/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvkceb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:15:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235089528a0so39990215ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751256941; x=1751861741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zlwIaUvtBdKmWYrvQBftvSATw4E35AAP8krPXhnxFc=;
        b=KnbeUMjmvWsI9WBV9ZBmycrSN0nZcwY0UJdplZTnZjNraiedwREAETIdFVmqSVDNlJ
         3Az9iPO1bjoRX91mnPzkBxYgUGFVsRI/h9ZkujreNkBDFTOi3FTG1yTBk8009O7Z136+
         oG9uhXpUW4adK7iv3hrDIpstACqzz+bAuY1V/uCIyU5uQiVauixXX9MXTDm/Bbq0c20v
         LJM7bgoZFUO/1ErrFMphA05K5bvRisBQvLgSya/0mI4UY+XolxFLc6SKtA/kn8Pz8d2g
         nXRDYfk5Zk8lnPCFO6ScPcVzKPYQVRHBKk2ljxEllFubyGxccmqj4I4fjvrj7IUrMwxP
         hgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP38CUTeOCH6S5vcH1Ud/0yaD5ljgzKIOeRkp2Tkp9Q2ptwC1ICWmBVQXHoX9RUPO0yDLwbO7HXUvjpCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0YP6jgo2GcFmnbNeQa+nGMiUz1AOPT4O/9VNajo0wMNdFhCbb
	E4LyweUFqOfHYs1/cQPY0pI+NdWx6nkodgjfmYpeYmxm/57l6JgZjLTpnYbK32YoFlfd/teroQf
	S4jZZ7RY0EEzebM7lZ3SCdAyH+FGnIPAG690HuL6uQBiKGPB0Aaq9/dOLIo5JcmS5Qic=
X-Gm-Gg: ASbGnctp8y7PNHh7I8mQFkSTKvh+XNwdN8aGlwQ/pg8ACVEBHDQ/+cmDyA3QdpXv+NH
	4Rs0bvOMtwg0nfE3F2CfnUYLVHyy4IfkAAOQFHqWRPpX/2XNVAlEkt/4jos+tiPLtwZUm9B+6LC
	NVwPdJseGSoXs03WTfi+F47exFyKZRkGMaXKilj/Un6XIIMkzGATZZAeNQ+EzG6SWm5aEnEa1oW
	q/y+sOoU36QsNT9QUpLdCuUpYaO1Z1ypArkIQbzOmeJGsHNY4HzsIosMBpBh+WOjnTaO2IjIY22
	VDaiZ6bQumPVnW2iOBW7lYvkXVP96R7RdIqnC5EKzgk+pXerdnP5VrgTRQWmEfBf7tb9hVtHiup
	2C6oOn2p7gJOyUsG9XxOfJ2IWn8azdfhxTjDQQepU2ETGj+I=
X-Received: by 2002:a17:902:f60c:b0:235:e1d6:2ac0 with SMTP id d9443c01a7336-2390a54cd4emr229127135ad.24.1751256940762;
        Sun, 29 Jun 2025 21:15:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ4EKBLyFvklT/nNxN/0BCu32hBk9XzR7iL2Rmh9tkeKSzTTpmxpJFvoPr4pnVeNNd+SHgyw==
X-Received: by 2002:a17:902:f60c:b0:235:e1d6:2ac0 with SMTP id d9443c01a7336-2390a54cd4emr229126815ad.24.1751256940322;
        Sun, 29 Jun 2025 21:15:40 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f069csm69366955ad.59.2025.06.29.21.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:15:40 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 09:45:16 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: advertise
 NL80211_FEATURE_TX_POWER_INSERTION support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-support-for-tx-power-insertion-v1-2-77f45484d5bb@oss.qualcomm.com>
References: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
In-Reply-To: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: wcJRpv3UUQ0Aw6TW8GSEP8XQJXGs96GA
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68620f6d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xmVKpWhJFmdleDmdprIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: wcJRpv3UUQ0Aw6TW8GSEP8XQJXGs96GA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDAzMiBTYWx0ZWRfX0Rw7NtqSkIgN
 g/bnYwdf5biRgrIAaAh26sZsWWQh2GjV4fpZMDlaoi2041YIHmYtxIAofU/Eh9W4OTx5yGWnmJZ
 1aT7y3xvWeBNQZsdeiMItxX7mElqR/5rbxXuouuYJ/1nQZq6hpc9VUk3Rq2ieNFGhl5d649kg/G
 QwuciBRqbivdVvHT2N+gmqKB8r5lVjwCfDRLAjGAaAIzsarLY5hk0DKWcfArsrswr2P/74CbWP5
 IjD89M6a74BLQmDTbyRp5nL6hsAhRdpgQDTwLg95dlKtkNHs3Ifn/f/uT9U9pX630yNY7wwL5/I
 MaYLQYbHLEbAVlz3YyvzgHqlIsw6TwtnA8AeyYucBAtnZiz8hK7JDw5luborQ2zHrqDidTG1MMb
 8gmYQ/wrGzycwa3ulyL4li3hqiahZiRm92Rq/cIelu07TNXXLdwlBOpfb0j7sJfCmMyvFgDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300032

Now that driver is capable of inserting Tx power, advertise the support
for the same to upper layers.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 241f11bd8c4051db4873d1109acbafa1aa9815c2..318b651c6d8e60102317f05549f7cb2da6a05620 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -12894,6 +12894,8 @@ static int ath12k_mac_hw_register(struct ath12k_hw *ah)
 	wiphy->features |= NL80211_FEATURE_AP_MODE_CHAN_WIDTH_CHANGE |
 				   NL80211_FEATURE_AP_SCAN;
 
+	wiphy->features |= NL80211_FEATURE_TX_POWER_INSERTION;
+
 	/* MLO is not yet supported so disable Wireless Extensions for now
 	 * to make sure ath12k users don't use it. This flag can be removed
 	 * once WIPHY_FLAG_SUPPORTS_MLO is enabled.

-- 
2.34.1

