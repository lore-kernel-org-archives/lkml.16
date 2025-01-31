Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D2C137742
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738352061; cv=none; b=n3CbYQJbyEdtdrgPOwIElPQUfbdURCnoqHp4uNjkMGlZrG4D6wQqkHqzMnlieFDLufhbvnUrAymfisxUEFC2HWJ/gBOwOL59MC8J3nYjIsg0ZMBM6TRcOFGFKnLef2P04CS1Hy2fls3pGKDP/3jZ/IVqEsGZOJYXN7KuGjDt4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738352061; c=relaxed/simple;
	bh=Zx5E5lHPkKpNDrWt5//5V7B516IwmrWT4737gUdaWFg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=seORZ34gfpOkwmPA9W5CboNP04zYtFfwYL28BheVMjJ+I9xFjHIxjzs0MznCAN1Avilrl1lQqRDx9btxg0ZRh7CyQV3PqTrb2+GjyCJ9AvVc2kna8gLbUatnHd0YVueeowTAeaUTQD+mpIIC0WJxfsC2Cdbsh0goZFZTUeGXmZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJx4MuvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJx4MuvD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VD1nCG005872
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iW/2qxNn2EpMG6+5p2BMofbrneeebFTJmziMbge0Qs=; b=DJx4MuvDfeSHhcVJ
	XlMbmaHwr2Qw/EP6eCQcLe63uE6dWWNvhGuzJpGFmLGQF4FbxZ5sfyjcRZY9LqIG
	PwvMPJ4l+5aBbDg2cp/MHzGnfFwGHHtXS50CGOsRMDQNNkTeoY9cf0e3zv8OFrN5
	px7W8m+lTe8gGXgKodYpZdpkWJHtCt2hxPTaLhX2esWxtkVKVZRUhxcS/9kz4x92
	3+JVPlQ4zTssU1iT8+Qow9MixMVleiVQmKrFwkUbFepigLR+O9GwRSkTHZmzq9BH
	ME9mTn/tGnHPv9SePSHsBwZXUlfzDw7UGU4S6BHb0dLK0swbLHptgBXzs8ZBQjny
	hcL2Ew==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gy1ugx8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 19:34:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21650d4612eso63665715ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:34:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738352058; x=1738956858;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iW/2qxNn2EpMG6+5p2BMofbrneeebFTJmziMbge0Qs=;
        b=m8D2G2JVIA5ZFsBzIkVIjFfftMiWrY7Q4PVknb1rEmFURnRaRX1ZLmcAzE0SL0V2Gj
         m3QBMHxlEnmBTJ8T/jf7tG83wX2Enw9X+AHqJ5FUTVFJ4ADFQ9MysSsAX64M6pQ5LfEM
         89ESglqYPfJ13FKCUPSLfeBOg23k2eD/CvpG8IqX59f027QQ3ARJ/DQ3zFlKEFMaJC6G
         7MOH2XFtYFKwZJvyAbB3hPQ9tsUbBtNMEWywTp+a5BMHWDF+Q+KswVCyRgnojjR4p1r3
         ME0A6sH6UrNBSDYPgIyvMnrNxPABQxRDTeFjYd6gMqE7GUPOmuE5oHA6iTp8bvy9VpMo
         ZJjw==
X-Forwarded-Encrypted: i=1; AJvYcCUhE0lrUfr4t/XWb8hn+kaR93D8QdGb48LmlAZJuSBXVCq1WpcVqLfxJXBMrchVfjl+ko4d63xw1O++9c4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK80a7n842+WcfAMAc8X3TVnRV6u7/BiG+lftCBDGrAPpjUBmh
	FTLS2zyHXCkItVxmHXXFXqczDYlRc5SsNXilp3nIUbjnuoPIbzxyh44UUvagJciGjNTNaumRwAe
	XxXoPBVUFzMdS0ajRErYxvKrxoNoUmyKeMB6RUx349m52xHVcv9TLV1lxHu90Xoo=
X-Gm-Gg: ASbGncuZZzIC0PvoT1Gz732nU8w6DhlRVaUM6VJFxXtXUoue+15iV+/HhVK4P+Xe/Hk
	5QysGIYdmDIbyz+Gx5DOAfpO7xfnyug0N1BZXvD5DQ5NZ5UMqdpZhiSlqcatmlNNBRNSOk//xtZ
	fBI03kvPwpz3uCSSHFJ1nZ8uv2GNBXNeGL8Lrys7FjgL/YgwvUTi6cMQPVVZNGsboAhtVu7spol
	M/4LjPOyQHuoER5eCPEDhVh/1puf9BbjXuLBNpgWUHgVj9VRRVMQbrK3I2cXByOoV1EpugFkb5B
	3oA8o8qqRz9fvtuByulHpE7SbD9a90n+rY66WMqFag==
X-Received: by 2002:a17:902:d48a:b0:216:4064:53ad with SMTP id d9443c01a7336-21dd7de20f8mr215305225ad.48.1738352058599;
        Fri, 31 Jan 2025 11:34:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyfULQeSiiDYkhpqhyZgfXGSUVIibS7WsKtnPhn9q9CqH8uXiXQ0B8xheM4FWNRiqBoIAKdA==
X-Received: by 2002:a17:902:d48a:b0:216:4064:53ad with SMTP id d9443c01a7336-21dd7de20f8mr215305015ad.48.1738352058247;
        Fri, 31 Jan 2025 11:34:18 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3302a50sm33721995ad.188.2025.01.31.11.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 11:34:17 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
In-Reply-To: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
Message-Id: <173835205758.1098484.10102684203904092972.b4-ty@oss.qualcomm.com>
Date: Fri, 31 Jan 2025 11:34:17 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: tc3KQiXPM-iEYpDoFU2N9B6lX8YRX2t9
X-Proofpoint-ORIG-GUID: tc3KQiXPM-iEYpDoFU2N9B6lX8YRX2t9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=712 malwarescore=0
 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310148


On Wed, 29 Jan 2025 17:55:17 +0100, Remi Pommarel wrote:
> Currently in ath12k_mac_op_sta_statistics() there is the following
> logic:
> 
>     if (!arsta->txrate.legacy && !arsta->txrate.nss)
>         return;
> 
> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
> if it return for empty legacy and nss of arsta->txrate, then the other
> stats after it will not be set.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove return for empty tx bitrate in mac_op_sta_statistics
      commit: 8a5ad319f2e6f0462dbcb1bd3a6ba5097f629a5b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

