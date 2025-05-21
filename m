Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147CD14830F
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789769; cv=none; b=Glx0Oz6r0LmaZe4Pr9+xcw6rniK4tTSxzTGHhfEDcSRtYrAtLJVt4E3aRBEJ4wQiOx5Xq7IRBrL33yj7mSyR2rjbcU/8542fH31CnVJK5X4SPCUy7KZ/dTw2PdTgDlPw7SLE02OQztuGP/ExSXvEzSeCz7ShJCReDhtq8szaDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789769; c=relaxed/simple;
	bh=zUWMZScYZgnjFEWt4KViJJAB8wGyHYX6Mr08Dvp2Iow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rwgjqqYIrC27/z4oZ5itMlL6PWblMQ6Zz/9jRQEut8dP1mn2Z7CLy4AWliuhHqsMoF7po8Jnjn+7LmdelgmYF+RWEwjbV6C4Pz45mBpoGQXF0IakvatlWnNmhysR1ACugWdiGQuF3/POOtgIs7GrKLG2qTPktPebJPuzjKgvHQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckI00LhO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckI00LhO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KMQg6F014178
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uaT6xZyO950kgkaXNXF52TNliKhXmdLc9rkjyu3RYts=; b=ckI00LhOX0cK3dY9
	b4FNeKjWtd9xvm+T7WU1YVh6oDFt3NR0n2WKk3I8p8CboZC2sjmi2Ezv1YfjbKdz
	cNjzObGMj/q4yLZTIcyJg7zBIgK6XSH+sFY9DhadgcP8ZbhKJxLLkF68OVZPHn6C
	RmAfXHgNQniHcR84g6dguuS7Xpzl4LqJ4ZIyO9otdR2ymkgrpdJmg9Q5US9iuJy7
	iY7o/53G6fOzGxafv577iUzLhEqagW50oTVeie1ijoPonAfYusVpOX/b06O7Hewe
	C+aYqx3Yl2sZBHWCQ4YeJ3DGQ8s6ppGb0zWeQVZkF6QRS6hyIJfwKuWGCOalshHc
	xZbcQg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh592m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:09:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b240fdc9c20so6372962a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747789766; x=1748394566;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaT6xZyO950kgkaXNXF52TNliKhXmdLc9rkjyu3RYts=;
        b=avbkwtWiwn6+TjtKd9KdvndnahpwzqDDg3dkTHZj5FM8UEA98eAtk47qRlETAxlual
         pOPIfchIXRft2G9anK9RU9TH1NhjuGqb8Grb/amcS/yHRaYidQ5pNyB8O4Ar26/u6lP7
         UavZ+xR1xqpy8fZz0r7wemskvehCIWzjT5oOVh1likdYfifK/xBCy+00Gm5m5qzNKiX9
         uM5Oxk3LNUlQTwKmyZFpMl2QwepeBBp8MHRQTkPQ8D8mc+s9HTexKKAiNUkXVoRy7uvl
         aeZ2eucUsMRZ5OFKQg7PUzC3gFBFGpVwky1oJ8Uw5VfUOHJvIUyH/r9+rcDRYJADPIX3
         xA/g==
X-Forwarded-Encrypted: i=1; AJvYcCVnbr+c/lMA+FgxtOv/j0mDn8d5PaBuenD+CdawstEv/sWeVYD4IVdDoeVTdNi5Rbn4eJlYkD7DO4RFjG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW88a6wvxJv20k9q2u6u72pMcyPK5uKianpxEGtMbyJdfmhxoO
	FDEB+w9crGsCpo9IjvOzcI6dmIJnVI8gxxlH28yPpl8k7a/gKxhkblqUaoI/504+CwExnUUSDIe
	mXujthCx7VHz/YGB9urp9aj+0dbzhSG1+xAoN17M5OUhamo9v9waArTsrq/CeoLhDeUG3DYNyFQ
	c=
X-Gm-Gg: ASbGncsZR68ecJ7LduHM6AJ9ApZHfkLmbfS596oIXmT7L+bgqylZTJhzGQKW/EomkEx
	7VOkuc4gCYJrTLXIbuPUOW7rwqyHRqQu5Vkz50zBjQ9sx8W6yNnK1fjivNv5PE9BaO+EzARv0bA
	i41KxYQDpReVEeLHr3DrX/AqC6mN3QfwIjRZYUo0ODOvcpxyme+oaHswrFIPjk+cJsTE4bjUrJr
	li1Upwbd+3cAoPzeJ4uuht5FrVDBPO8r3cu10N3Xk+XMrNHPeuHdlSPFyrTgsu4iaM0Q+/+ZeXr
	9LYh6bxnvdZExuH3IqOQs/RwIJKxP1GyhXPk3M2HsinSXVQL
X-Received: by 2002:a17:90b:3c8f:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30e7d52048amr31951844a91.14.1747789765875;
        Tue, 20 May 2025 18:09:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaFYN4qvdiell6xoFLx3FyM9ID3J/mSxWme5ysSundkz5Ss1pJh6M1JGbCKY2LzNGlWgsQJg==
X-Received: by 2002:a17:90b:3c8f:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30e7d52048amr31951799a91.14.1747789765458;
        Tue, 20 May 2025 18:09:25 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36368bb0sm2423125a91.10.2025.05.20.18.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 18:09:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Rajat Soni <quic_rajson@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
References: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix mac pdev frequency range
 update
Message-Id: <174778976472.4010925.9446734669090977256.b4-ty@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:09:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAxMCBTYWx0ZWRfX/VOZF9B+LcV4
 ouZVndEqPku+4fJV+dD4QmYVLdLodik57ydn+nVto7lh2VaMPb69If0qLU7SCRPb01MsPJGTi4A
 9wqX1zaLPt/6kUtEHLLE1zSTCMu4S10TJVngSJ3Ife9u9A0cJBBR390V6MgST3qgZYv+JtynfR7
 CTATJS0AWkCPug1VESsD7hpa7QpN8PbsONKgW9qEg40tUiPZBYrB4xeFSEly8kXlSnSMmflvlyy
 RbD+n4MlB8QCV46PT8ht+00Y0/qrlikcyV0CwH5zNsxP/0bGm5TB03CuCE8HhELv3XDBBa8k/LP
 5sc08Ez7G2olQP5LlP9fflOmB259jUHR2ZFodwK/MTGHLwXvB5BxukA/io7IIAdWBPYv3N6d7N8
 cUA5Wzodg0fuUCT/IRLs/5C5Iw4CZdpkBn7d3wWtFoMF8KPZylBRIPp2+Rk7qhxTtegGouTu
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682d27c7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VeykXRrYc7WjYsKDlBgA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xUvALcbSfW2Mcc7LULUflF3c8zyUm48c
X-Proofpoint-ORIG-GUID: xUvALcbSfW2Mcc7LULUflF3c8zyUm48c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_10,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=921 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210010


On Tue, 20 May 2025 10:06:52 +0530, Aditya Kumar Singh wrote:
> The current implementation of per-pdev frequency range updates assumes that
> each pdev supports only a single band. As a result in ath12k_regd_update(),
> bands are handled using an if-else structure, which limits updates to only
> one of the band per pdev. This assumption does not hold for all chipsets.
> For example, the WCN7850 supports multiple bands within a single pdev.
> 
> Hence to accommodate such cases, update the logic to account for all band
> cases by handling each band in a separate if conditions instead of the
> previous if-else structure.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix mac pdev frequency range update
      commit: 0d777aa2ca77584b339ce195db86fe0ee7dda5d5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

