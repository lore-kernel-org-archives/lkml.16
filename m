Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8843CA52
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746251541; cv=none; b=HTh7Fat2uLRHKKsBhXcoTdB1OVB4zCI2HA129voQd3ZM2/vSS7bQ8RsZuehXAwkppNK0/FEOYCrp7H/6RpMkj30qH+izJKjdJb2ZKEkJXNXtqhgHu+7ttkIEYe7fzgKN3U5csCsWfJplnRi9M7kIqdHZDYlpz1/jRqsFamo4DSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746251541; c=relaxed/simple;
	bh=kTzbdef9BeFuRG62UXkxiHxI+do/LrEhk/zWjqxWnbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFnJ0awejNQL439xrD5guYDYU8rlLLrpyZCnOBEbCnAK9W5Ka4l6RMPVWJ9JdE+d+yiOfxhbhOJcjz4YAfxkfLZyeYfqb3eghgRqOluzDuc9f19cOHC0/1i15I9s+Ivp/Md7Psf8zDrGR2ZIDB77bWmxQ/ZIzQDvjBUjNBgG1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZF0QnWQo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZF0QnWQo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433Rgh0015110
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 05:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XGIyRq2ecXxR1vaSsBOnW52paZ1NEgH9yMTjrR4DNNI=; b=ZF0QnWQo708kR+zX
	3vFxiNYgM8YFncFOYwT6JJWPcR9+VCNsBCHTqcDj2br4hw0teK09bl37z0z1FOWU
	vQsMtjhw7Rs3H9H8REsc5N6rsJo+vc843M43kwtD4sTNd3NkMjjtA74prIaoLVn/
	TY2Bx3w3hXNww21Zyt76zfnz3Zl0KPwKZ6/aQ6jeCwdkkaf2+guOG4+UTt91Si5O
	+MrlfD5RFaHdbYar7+gkVj0mZZ6jdteKFZrNezXj+8apvl/mDvHVq0XqgmL130W5
	rO1ZXp4vPOGHAwgEd0+huO+ywZNZeI0ytNkDddeRrHRxYtPDXG/n3pixZvmHVIb0
	OHmwEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep09j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 05:52:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768656f608so57212861cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746251538; x=1746856338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGIyRq2ecXxR1vaSsBOnW52paZ1NEgH9yMTjrR4DNNI=;
        b=uJix9PLswm7tpn8wrFYEaP/rJey7ldvlUBpJQu60pX6dE9WRENuI4vPG3oh0vtza3I
         1IP8Xfv2gPrBw5GekdmfEzFEkPTdambsq86MtBZxEOi/spFRvEwqYEUMelfIytGm5P3a
         ib4BLVtOrP7YLX3yjHWKObUtq8eD37oIr3floPgCgqjXkBrZCquqiHlyFJGdksGpW6OS
         GqZoKf1d9z6veOnQQ7Ft8M4KZaD0qvbbYr+NyQnrwgSQhgKZG5YpwiwkrHl4wu8xfWYW
         rMTfQDo6Rf9Iq3iSC/tCJJDkz6IprDNzWOR8A42LAWprin2kKZ3fYPRhLZCXS1jJWGqe
         Xd4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjlczFiPHo4qE6Ysnk7NjSKDu342I0Wy7pEPOPu5NO5zlcDhL9eMhDyOKRTMfjahdkDiGHic6foIK9kEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmKVD7L8fMOg+VhLIdc24azJIhjY7DFaKI3B5jRaBNd5PKz6X
	A54udDcQDUOGVZsVVKJzxUT3FDaM2WBX3KGbvsFbsEZtvNZuoo000uOivf09+mENsO3xJx3RJJO
	GAD1z2xOLjSYtHNzKTaTjP0MgtIcEJqjZRCH3j9YpOvG3X92F6r+CBPgRk4YlY6w=
X-Gm-Gg: ASbGncuwkN6+bWqOjrmN9kBiWvKOw0fRLpXLZPEWOl1gY0u+0irBx0Y5sOPtjbVbhqS
	VvRnWYud8fImzrRhOVVjM3tSenPoMHWgCWQIcFQv/rfuONjrGu+kVPSCEWFf3sI1xDd4/GmbJ07
	y59t7hTQEpZkXtgPdz+RZWUJUh53cEyFGp1JKgQ7Tv0B6I999sM8OxsBo1OzxOL9diDQPrLsalJ
	f8aMMbxF8vPMtKI1vWda3+xjRvDNOxK3AI23xZpbB4J7J6oQaWvEOJ35JxMHr/3oIJR4eltRv8z
	Eq0IqI2nn74sDNfZ5wObqAXNn/gB/wPecwOQVpW2kxsvzdA6gPZ3206CDyFhJD1YUWODAKFRa+F
	r0hH9OFVcllMrxg==
X-Received: by 2002:a05:622a:2c46:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48c31738b33mr67033101cf.21.1746251537982;
        Fri, 02 May 2025 22:52:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbq0yURxq1b6IBudPe8v/H/lRmlWawgrLJgdxW2ynKpNHdFhZe54xgLMAowVkzIsAb+lDNkQ==
X-Received: by 2002:a05:622a:2c46:b0:47a:cc04:aabc with SMTP id d75a77b69052e-48c31738b33mr67032891cf.21.1746251537659;
        Fri, 02 May 2025 22:52:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32028b382c2sm6404611fa.2.2025.05.02.22.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 22:52:15 -0700 (PDT)
Message-ID: <9b67b7f9-b85d-4432-8a1a-3ed3021b68cd@oss.qualcomm.com>
Date: Sat, 3 May 2025 08:52:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
 <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6815af12 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XEXn59ipE5wXcr2suqoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: v5Megd--nX2k5cLbDCthn1n9vOuipp4I
X-Proofpoint-GUID: v5Megd--nX2k5cLbDCthn1n9vOuipp4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NyBTYWx0ZWRfXy6LK0oPsSyZq
 xkhMuyTAf/mKGgSLvZRf1a0t+T1msKSn5r36jheISdry45NnzcMpslECY5I+02aQt37r7OLnv3w
 cF5qoCpHPPC5318WNLakZrbfiXtBKkyrJEvdTNc0CKNP6Xy84ExWX9xSek+/cSmJnCPUXhuqD8W
 gYaa38p4zIc22qM+hSPSjdg3OTZxrYMiG+RSWAfthl1Y1BYyzTTEjOWeX8ntkc2BLcL5PEx4lLc
 OzufG9D52Zj7eOuKW26J/0EMwPz1S1e3sa9mIJxLQuQdX/mYrKT5v1H7Txqbx+qmOZtZZ6lWMKE
 yPks7+Vin+3UL2332tPLUSyV60ojtv4MIToVYIZWCJriAnNoobsfx91KNYAwuId2n1YAtUa4j5i
 tXx+sNdulhW35E7NEgZDBv340JtQFKGByLbAhUZseLeVmQnTnUG/vFk0/MRGXl9vIj7s4QiY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=861 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030047

On 03/05/2025 01:57, Konrad Dybcio wrote:
> On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
>> On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Have your tried enabling it for X13s? Windows drivers provide
>> qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.
> 
> Forgot to mention, it powers up and exposes the expected qrtr
> service on the CRD

BTW: maybe you can include relevant DT parts for the CRD so that it 
doesn't stay unused?


-- 
With best wishes
Dmitry
