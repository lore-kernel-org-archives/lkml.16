Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928EDBE5E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718750; cv=none; b=nPGBMgGY8ZCw35dPX8yKInC0pnYxBrulJmai3HTtDPQQH3m1yedi2mFsXt00OH6sfGT5yg6iS0SvrgoFUDYGaVIb+VomP1mEfcipAUeQZnarlpDyihy6gX03gjOXjfh4KfyG1Mcfv5lpyTOg5yUC05d9wLYAlAhkFEzWkR5VB5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718750; c=relaxed/simple;
	bh=3Mez9l46A+ruFPVOU2nc/m9awuTx41UMsMf22WN1Fng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXyMAG6sJWXHctwG8RN0mk8hY+las4aU8R2x3GOdg1JvPJwZQ1sRDIbKr5ZEYGGJb6MVxaZP+CsjNVF3bdijl9X17cRMnkqwEjv2VW/dO8ygMDKYul5YIzCGdim7HCRjaSv3n2GjHGNpm0pwzcq2xvTjHWKZyaRIq9KOY9QrdL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gMDu8y50; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gMDu8y50"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JMdH2o012231
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wlt3Fp0JW7EstEEKwfVT1fU4hBSzC86YFZZPKTQMnI0=; b=gMDu8y50Jc9yM1b+
	t+E/HWb+MBu7ivwEDtpR7sB7qfhbSVdpLp02rJXqJCpE2acqWeNGbGXuYQ/+Zeh6
	CMVaIMfKGOBtfgIWNJHtgV72+jC5mLDB5nsewhjqqr69WYQ8lIUy27E4LbOT0y9B
	Wp9QsyGYakB2mrJ32d+QvbjkCBQ0lurpg6deN+rjOZCs5Kp0vbmZfN7PLS4eo+Xa
	jyOdfSfZ/Czo/9rgavW7uyo3IYkJJdbAHpGhWoaC73uHXbEfkrb0bKME7mE5cWkU
	AU3w2CZhUehjABQ8L3akpryiobfjeGBKOrlc2SwVmF4fKsJcDXyFiSY9rtYoZ3gp
	KF2uxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsxgd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:25:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e38174e5so5052950a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747718746; x=1748323546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wlt3Fp0JW7EstEEKwfVT1fU4hBSzC86YFZZPKTQMnI0=;
        b=Dtorw2SPd7AM23IyLp+4pjAGtgEPe8OIWYIWlyMExBh69gh/cssK7iBpHraAB3oldV
         27qAveO5aqPtPihdhcFqkBSNmIuJfEjMNEAfm8hnpHjoTCaWdzdKrfJ7gnDLoLXrVnnQ
         YXpePlXjUGD1ztuLSk+ENGygWlgRydeZDqN3axKJ33qhJ2RqWbcyZ74aUmCv56zT0oJL
         Ot8sKZcrVSHrcjUT23a0JEFylli3rThC98hqi3woNCbtIdQOiRvv0XigwmoNbguNJ+ra
         1rGQ3U2plaIVg0q42TR+W7vFTV7J2P4Syw75aHsTAwl998wQUJh7fWgXiZCqv1NFMdyH
         zjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWXQ2sFaIs7OJIWwsiyH4u0Q8u6CLK2529XAXVmunMdCrLCeZSXLhV2V7+Z9FrvvD5Y6pRIba+WPQA2lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbtYkUofeFxH2QXYYHb1JGTucFVKeFOtyLY49oLoR/pcyESelp
	FiP6Avzq4xyUXxE4CMuqGBNg8clri/vaHlrGhTrQbbujs9V+ocpvjGkafFosggKVyqq0E+/tUMN
	HIHSn9IApS5wqsHWta74L83rMC5Il6+8unGPwq+DTT/UPUxOUR6SKX0wixYiMEn0G5O4=
X-Gm-Gg: ASbGncsQvrgtzc1dAWQhUl6WgOGomu9Xt6sKXeOSKXJA3tBttj00OW32Q6g49G25j2M
	j6PGefksKhckLHD54Z0gkfb1kl1uE9DRRZYXJCFYJAR+xaOTY5ufXUKN7mRg1ZfEq1XTj8fp9Lv
	afmTkvY2mQJf+93RPJYcP/KBqUCuTKy1R0cM+Dpjd0FZS6GUg5rOsyqiKEv1gYq2MJw/0go/uAk
	6eowrwRJhMMjb7A2CzbtIkrd+gx2yPweAcAywdEqMj9ec/yBahLR2U75bYB8Xa+rAVRFqh6BhAR
	aHAt2jzR4PifyNFwclfs9ztnJCyP6YewEz1KaoIDAqJzHNjk96y26EQfL8zs
X-Received: by 2002:a17:902:f64f:b0:223:26da:4b6f with SMTP id d9443c01a7336-231d43a479amr243153625ad.14.1747718745998;
        Mon, 19 May 2025 22:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhicgIUkUlCk/ZP6SHXT4Yi37KIJ4JVpqAQQQeDzR9WBY4IywvHL5dB59fYn41o/WiUvpUNA==
X-Received: by 2002:a17:902:f64f:b0:223:26da:4b6f with SMTP id d9443c01a7336-231d43a479amr243153375ad.14.1747718745660;
        Mon, 19 May 2025 22:25:45 -0700 (PDT)
Received: from [192.168.225.142] ([157.51.197.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac99f4sm68842115ad.23.2025.05.19.22.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 22:25:45 -0700 (PDT)
Message-ID: <deb386d7-2ace-aa83-4e44-742102e2e0fd@oss.qualcomm.com>
Date: Tue, 20 May 2025 10:55:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: fix mac pdev frequency range
 update
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rajat Soni <quic_rajson@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250520-fix_freq_range_update-v1-1-e061fd147b87@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sFEO2e7QWhFT0V7x_8etUYn2jhEFjL5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA0MiBTYWx0ZWRfX32JtpxVISTaE
 luHJmEbHY30O0jfSvRFJPsEFeaI1DMNNI86Ojc/87xv+zhyzTlggmQ9dDC/7Neykc58tSDePdTI
 2poYobm6B2pkdHKuMKIxksM1Vae0S06mPOwSmKqAaykbdp/RbpwZ30woNC4lEN1O+Bw3YBey5Ov
 WF1I1dl91QgKyFQaKSdW+WR9gbpJfE0qcgDBW1RzB+LZMrlYORl+4BZrH9amQgEtX7KefA+dDH8
 Gk8Ns8OnaDW1y0vHRfxJUq3zcZ7Y86kZqwNhGIGkKVQO3v/pEcKIgAsih/niT5LQqlvVlZjnU52
 2GwXr7qh6yzosEjSr8QdlTKSQ+YNaeUEW0IwNILb89TmDr+J7yP0472X/C25pHgs53Id0BVMQuf
 zH6xddL8cxDYaXD7YgQxP+JJpmPtmEIFbbYmCJbvHpRn6kbG8F9eI1uvo6VyDpwcxHvqXmwM
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682c125b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=4yAOwc62Quh7N6Ih8RcKWg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VeykXRrYc7WjYsKDlBgA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=ZXulRonScM0A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: sFEO2e7QWhFT0V7x_8etUYn2jhEFjL5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=787 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200042



On 5/20/2025 10:06 AM, Aditya Kumar Singh wrote:
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
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 13324cecbb2c ("wifi: ath12k: Update frequency range if reg rules changes")
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
