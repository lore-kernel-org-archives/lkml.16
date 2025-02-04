Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C912063FC
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654552; cv=none; b=iLtF80SZ8l+0rBPSiVQn5V2ULsuuwQcCU/SM5NROaRkxuFv8R3dNJhVtW/0b78CqHQL62HjyC8EkgKYOv9EnIbkr4p7+lgL8v3VY/Xu61v/AHfMoIdL3q2mk10XwSKs/xzH4fEKf8OnaBXAPospujI6m33MAXHdjTz6nntp0vKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654552; c=relaxed/simple;
	bh=/TshHlyhMPY9p59xbe+L+Oo+DmFTFUlR8gzGtdGQuVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HyhsiN6GWRMCc6uUufWzBFksRqyeCxaAscqLyHvUK1TQlkA1hc5P029ewA7aS1tilxhJOR2bW+jHgUOXrF/ZXrHEkSjSRS7l5s1YIiEOrKAT+S51LL3dNyTaZdal2MqwYRo7nFxd3fxwh19etkm6XvHxtCJmEV6DrBkEQmx4Fbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCmmLo7Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCmmLo7Q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51456bAp024439
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 07:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNk5GEHY2vpwvgWChX+aKrs57eHJi/VNa5EgCgXUgm4=; b=eCmmLo7QvWXxzOEh
	DKrfBzNImWeMRuuj7hsXn+x+2azYN5YZqx/xEVriqeDPl8j6HaPQ60nc8cPVprwL
	jgeR2oMvdWc5j4RSktiz4oFcgpNLbM3gqbvjOBUmEUk7fbxaSbPPPSonATUUXBII
	JjcY70DQXFSDOxODhRTflO15ljUYCuE6rSeRZv0uySLXzB0O0Z6wkDpIQbrri2h4
	wiQuBwvorCPAjfbkycDLqv1Ihn95Jz0HML4qy/1fooxGjrJVfTG3ueYwEUuWZ2oC
	zRepaEdoseSNTdGQzKZewxwA3nZRWk8tOAdbaSs1Ap5dZTzK3pD8M86SZOn2wW3+
	ynZfZQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcf489rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:35:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso10344566a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654548; x=1739259348;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XNk5GEHY2vpwvgWChX+aKrs57eHJi/VNa5EgCgXUgm4=;
        b=AURPc11pEOythrIxLKlcQAimuSYtc3VYrVBZutwKNBhLUCRnbcnDzCVVKDCks1YRD5
         OaGGlboL12J9g3K22Vh5AClnoWJ5clJ+Tx+RpKhqbq9QtSj5FJgBqxPQ0lNZYjbHc4/4
         IENKJpqCncWIubyx20ZUgz6BNawhuOzcDVz51nsUNbbwtKUXLhu5jtvKpq93v++kKpqp
         CdCSYmjVKwDmJUyya9LBp+IziUoph69j5GPcGAysZiDe51QcD5OmJ0V+GEDCQSO5Eo2s
         Mjl15VLNb+oFJyuIG0cDoZyfqj+tNJ5ANpmKKl8LBLVv15Sc79XYMJkcoJeyEOeyVHkm
         yYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxLKhwnBF0pU2o5oIO49CB+qDm4GGAHn17uj2o18nVEntAKzIiThkq9faNvJYyMWcYrb1RS9KH+ZZFKzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1QDmINLKZouCx25U43LaHjDifrnFWusqQyhIJ1jyzpjrUbka
	bsEBv6lhIwmBDGxhYBunkVjCqrxzFB9PX3wonQVbI7XRzSIac47jUbQw6xMVZjaxsJyjUFwqyIJ
	Cdw632SlT+TKaXZKlr+Rli4OgGU4Z5naVIMCpPqWCH9v/FE0/F6C6d6ng/2bDWCiktVULVhk=
X-Gm-Gg: ASbGncv5hwDP4WEBFulEh6CD8euB/Rtr44luM1wCiiUaqRY4UJICI51+eumidOJ/Cth
	zBMTcsG4eRga3x40EN2+ZPB+6aZLLTJtDyCVOwogPtCt/8GeTc1si8H9plvmnl3xV24jS11oq6Y
	5aNFIE8MANdqjD0p9mZc1cxCOaVzj/fbikagPDysF8bB6CmPLMxl/pMmTrtL74g4ntetiy7AM+C
	73vOsp+pFoqnvDWypxDm+uWUOB7antSnN/aApjAPrmdL6He+v1km20rG1u1hktv9WiXXEm1YgcT
	5khTzKV8cxOgJ3TRqVSQTAu1fRUpNeLc5gKWn3wIYcGyJcU=
X-Received: by 2002:a05:6a00:884:b0:72a:a7a4:9b21 with SMTP id d2e1a72fcca58-72fd0bc7cb9mr35652298b3a.5.1738654548559;
        Mon, 03 Feb 2025 23:35:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmsqjymbrkDEMXx0uq+DnM18cYXX7nW3LMNz2qYbPHat/9yoLX1lbH8wOZSBS2srU+UJsmHw==
X-Received: by 2002:a05:6a00:884:b0:72a:a7a4:9b21 with SMTP id d2e1a72fcca58-72fd0bc7cb9mr35652258b3a.5.1738654548111;
        Mon, 03 Feb 2025 23:35:48 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ceb1csm9556119b3a.151.2025.02.03.23.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:35:47 -0800 (PST)
Message-ID: <fac29cc7-6407-d5ef-32f8-6c8baef1f37a@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:05:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/8] wifi: ath12k: remove redundant vif settings during
 link interface creation
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-3-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-3-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UzBmLWU0sTecz62dILp6EaoD5StNMDLf
X-Proofpoint-GUID: UzBmLWU0sTecz62dILp6EaoD5StNMDLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=795 clxscore=1011 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040060



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> Currently, vif level settings are done in ath12k_mac_assign_link_vif() as
> well as in ath12k_mac_op_add_interface(). Since it is vif level settings,
> doing this on per link does not make sense and it contributes to redundant
> code. Get rid of this redundant code from ath12k_mac_assign_link_vif().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
