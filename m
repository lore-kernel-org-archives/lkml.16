Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84C3189BB1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744431856; cv=none; b=uvmtoiZCGktwhr8WwsgCJfd8UqKvgkTp1Biqa5QVuSb6vpeDrvE9t4EMSJRrzG6l5/7RKGVMlQEvMf4c9vnUKVWCeqps0KA9Om+dWRwJcgI+xPn3W65SAPamDJQxmOn9qGJ4WiShmUOoXprStYVRU7tPrsNeSXh513i/2Hy3g8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744431856; c=relaxed/simple;
	bh=UfvioNw0X3KhatSQbiLFUIbJbxDKj3VfU7aNwjPTyVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bUhfZCANI43plwbWXVV2CIiEcf7wIf3q6gKhsE1YkvbE4j6+wCC78LupQlTc6gro2rstNUCoxS8osoX9LKTzUhvqfsiUzmbewFB8VTtLoVwGUgCuyeDswBCU/SjJn7/B5/WplUMFgWytMD/VeOK/L0+8Jwzg0B4FXYvT2c7iwf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkXT1hMk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkXT1hMk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3jo9Z008861
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMnq/8PkZJ1y+QIAP+XjCJdI4Ir09ftkPYUCiLBTyf0=; b=kkXT1hMk9qa1gQ5j
	LpyFgiEPPR3fXLDa5DcSQCeO9ydP2TVpThFJ/LUQwlcZYp2VR7fMp+RMHkK3QxRX
	1kMxOe/OZG7A4MaevVxmLJ0DS2tqhXSdePrWTcU9AMC4HL/1/3jaJWZiRdSmEpKM
	OtTreRThr4UAQihyDFyWmm/XOwo75OXP6S2fCVDYghS3Ua42256nyEADz8w/VNHR
	BIsmE23koRh4tpck9f3AFVPQjJlAi+MbVDt7pCRTd5zrKAuzIk0kqoCQBc69SHfq
	HDnqYj+vaHC8omIhQAAAq9nzg2nMU3mN5zYo7I9fYVK3qXVDQelpcOOIvvF4QTy1
	qstTHA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmm6dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:24:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a96112fso37046775ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431853; x=1745036653;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMnq/8PkZJ1y+QIAP+XjCJdI4Ir09ftkPYUCiLBTyf0=;
        b=iMRYi6GSC1UT81Mnhxpt5PhwjVbHFwPZ7+/av56/NQVGUKNSUkfky5PeEkatNA3cjn
         UbN9kdnC3Onyemg+mPzVO0fBE4HQVFAXYmxgSKi1pOuq2LOn42KkFO5fZtEv4tPwkcOy
         HLgj6rSWULVbfWS9O9RHOvZChBKx1Evb+JHwqP9Wo79eTmjF6AQxGI1XvsTpJM954cI7
         p8HqbvO9obh4k3TgtVOsMS2b3IOB/Fj1Jw816eCccj9+WAMOMeWaoHA3oGWh9qDra90C
         4xm3/y7Lg6wX0gmypVfrKKaYqWbNOteE1nwXtxfoRwQ2SFLTH1GOG2gDwMF6D/w68Wul
         8sjA==
X-Forwarded-Encrypted: i=1; AJvYcCXqSl80WYweqH5N3idLa6R6zJHEeikcDrlWY4Ec7KreK4q0/RcjBj4penNsslx7Rs2vlIGsCCQqfjp4XC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YycwuUKKGwllIeaPzK++TnpjBIJEm2J12Uk1HffapB/tUIRUGvj
	TpzHgIN3rvpfXX6RFFbHolHMifxaO4Vf8S+AURiq/6ok2gqQl0MNvpOMBVcTTsKNxx2wlf9h+m7
	Rue56QXv+DkgTrHzA41zKMLCuT5HCTCdSdS4PdLvjRvLRuHTgOwZDN1gDbcZs4yA=
X-Gm-Gg: ASbGncvdJNrpyUMKSOzbNDsbjUmfBJzKCzV74euGYGfRAOLjYdjrk8eIPANuTpdBCgT
	addyK5UDiRgcMBPUcuisPUFq0r3HYt1pQ7Xj64QM+ahbxZnE2PSgdNWKESMZQPa9RPTKpCaQTNi
	LzAxkLUrVwhjB34uzuUa+wHt+9Be3jtwwS8JmcAEnSfPxH4ahfqDyqCSuX2RISLnLBARlsYPZtn
	tq1mJBjo3i9pvu6eF/oYMU80p8eahZGNFJuMcSRtiRmzk5YSSZ8OJwPSCMLEbz7bZ97oCz+c78O
	LQ5Ma6KblAudqtHiI3tT0sqYB2FKnH+++yZ6zUh+yUecTY3d
X-Received: by 2002:a17:903:25c4:b0:224:1acc:14db with SMTP id d9443c01a7336-22bea4c68a5mr60057605ad.29.1744431852868;
        Fri, 11 Apr 2025 21:24:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp3MeDia7eAVUoOuls5eWRymp6ibxhPX7+qdvuGmoD0CWN0GFpaNKGP+44iTG5egAsheFsyA==
X-Received: by 2002:a17:903:25c4:b0:224:1acc:14db with SMTP id d9443c01a7336-22bea4c68a5mr60057405ad.29.1744431852531;
        Fri, 11 Apr 2025 21:24:12 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250408190211.2505737-2-robh@kernel.org>
References: <20250408190211.2505737-2-robh@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Use of_property_present() to test
 property presence
Message-Id: <174443185191.2972989.5552642055295334224.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: Wp5Ue1h_UeHhJGXS0xcxJ1huKdTbob4d
X-Proofpoint-ORIG-GUID: Wp5Ue1h_UeHhJGXS0xcxJ1huKdTbob4d
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f9eaed cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=553 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029


On Tue, 08 Apr 2025 14:02:11 -0500, Rob Herring (Arm) wrote:
> The use of of_property_read_u32() isn't really correct as
> "memory-region" contains phandles (though those happen to be u32s. As
> it is just testing for property presence, use of_property_present()
> instead.
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: Use of_property_present() to test property presence
      commit: d118047f82408201eb433a7ff7d505e72515d7e0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

