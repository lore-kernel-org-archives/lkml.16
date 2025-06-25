Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE9217B425
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862869; cv=none; b=au8zLLGCh93tsk24UXuXfh3q94+yZagcpaJfqNrKCRmm+kE8nnwjSzwlyuMnJ21BB/inh1u7aYz1E6VRphK5O6HXcalxhp4lL7PHFJ5pEaVgfstZi/UI3LLMRIBaQDcRXLYmisoJqclDzQHNu2ze7HNdS+PdVWqacLbpiw9y6mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862869; c=relaxed/simple;
	bh=mmpag1FbNtHN+Bk5VdCMHKabZ5lvXBEoUFhGpfCLplU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=risYgVj1otXS18aWfvnGjZBCMBPJ0wryBreg1jRTRb5OKQxsx3cuWTo3NoWpl6B+xu/kWePp2YZqPPimYdw52cDsZNzeIo7E4Pq5lJlVYrf5SA03IwE2lO1jGvHI5EDp1oPztqT7mGU9ssePDOkXMYtPDAOkHKrPYT0xoZyHPD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHdwm23u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHdwm23u"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAI6iB013820
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcfGyCqb7hjrTcZliws6C0nYMOKKPOQx90DJmTrhTcU=; b=RHdwm23unkMPokt3
	IsQNHHqAb0TuCOKdL4wJgRowGkwH3UpB1tJbWHAjaFMAHx59TsIfq5ZaXVhtjDaa
	qvJYB+o+biMF/XMAfaXv2nFAR0en2YKLJ14UXqFpy0noa5ZZgOl9A32FE2JsFuns
	hBx1oEBhB/7xyvMDylb0h47NoVnZ1t3gtMs554A/Hr2k4Xy6MMJsIkRKbNVAalBv
	R9Rtu+i7VrQw7vf3tcjM43AAHvMhqoos662z0Pi2bMM06WK0deadMn+sPlfjhyux
	s74qFEK0zQO3COkt64x8Cn1ZVFlcXzhKbltIZc41cOcKWtLnhhFewJRm6e2ITIDx
	OlmZMA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1xukb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:47:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabbaa1937so39476d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862866; x=1751467666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcfGyCqb7hjrTcZliws6C0nYMOKKPOQx90DJmTrhTcU=;
        b=FmF7YNrJDzEtLGhbTrlzDrvFeLq/EVUySZaimRrLxEjYnaXypbReTnmr6IyKSULrtV
         SpY9vhD7VMJzKlJLQke7uItN17YSvlw/Pk9UmSXbuqwXxlxgPRqVKbCBJA1etLNgXCtR
         ZZ+tpJmAkSpWqg+3a45tWcMxf7MFghPK18plnIfbJV/B3hEhDbudShRQVAX9LMC4Qntx
         msv7GeXPnRDnz0tiJhEsUVs71Gcnq8XP3BWMq+bAioLblC7LCtkclCakF6PmOKCihPgm
         MGJkxIdvT2trtQn1uMGoWB+Epr11O20oFgJ2GHjuPdfG7ucMe3tQb6/+ouarTlMOmk8w
         stdg==
X-Forwarded-Encrypted: i=1; AJvYcCVHwbkCVp4qVpSWJETOja9tkbpxrakamUmUfNzEfuoL3sS9JvFSTlwrOQhx33UDRlMO0StkEZc0lwtGphc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqjMgK7Vp5VSGJEIEFmJ0tFMLSoD6nYYN7y23I70VOZImwVrRC
	bz7cJdxVO1EmMZ+HAUb7Yp07eB2iV1sHFNnfHUTSQ4m/H6tYtFalccn0akbI0TjpEuIl1tz1Kh0
	dbpoJcFhvVzH9f78wNxidzxw86pDa6xyhdtP8x6yRqktUoNejkOTmDM/NkqsW3xQsOPc=
X-Gm-Gg: ASbGncsV/UzgZ5o4L9+WtjQv6HADGh2qZKes7rA8KO2ePxTGTb12CgVsI/LmpXMoSJ8
	QjHD9iaNO+/6zkYKAIlwhNtaDVf7xT0MVT8v2LyBNYMJKKGoroNzkpjI/fl3ExN+ETUfdx14NZC
	acIR7I+3tkhpAf+xNCltVFhBmdnxlivMOc1Q+ofwQzizpLxXUE0qrLUpTPWAZ1Rs8njvcMOBagp
	uXtkuXgqZ2wk+WdQiiAzLW2h4BsHbMDd5FC9lWpXFlIMHn8dfUaWAkgEIn2kchjPdBudPYFUmBT
	HtMcD6UWeftOZCoEtso+yUTZ20GjY0rd13WQrbT24GD3hm14U0wyQQzMdRcYyrvpOhw75pbtxnd
	TSqM=
X-Received: by 2002:a05:620a:2850:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d4296e98bbmr135911485a.4.1750862865766;
        Wed, 25 Jun 2025 07:47:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDhn5CUWwlD3br5LtGscA9kGzCuOj+kmUtFraZgnYTOTbZBN0x0uR8zb+m54XpY8QdAku4rw==
X-Received: by 2002:a05:620a:2850:b0:7d3:c688:a590 with SMTP id af79cd13be357-7d4296e98bbmr135910385a.4.1750862865288;
        Wed, 25 Jun 2025 07:47:45 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c52922662sm856497a12.33.2025.06.25.07.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:47:44 -0700 (PDT)
Message-ID: <efbe6c4d-cbf2-4749-8a3f-a69b2e4b726c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] firmware: qcom: scm: initialize tzmem before marking
 SCM as available
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcom-scm-race-v1-3-45601e1f248b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c0c12 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=A4gc5PxaQYkLfIBl00IA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Mu2S058WmCZN4n3P3TN50EVQTWtbCr2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNyBTYWx0ZWRfX5vzd70EU7pFq
 f5s7Fg5vWwLnRQgUCwNhylAboSp0LRKV+ABOiTXS7TZRGNdRSuhKB84X7Q5tDTeZ8bFcTxaIwtU
 xco7jv0ezzgMA6wVELJAXgNX2s2/X4dPZduQdyViQDjrX6O+Z6fePcB9jjUviKupIauL/Sz6ZDw
 lGZax2SijAStJvUMVNzTEoDJ62oVkyzybejE5tUuQu1Qe/461WtWFV2idV3Cxu9wwEEakG7R24v
 qFOWxsqveblxTmbz684o7FC9Y0l2kc9YDX3FH0LMp8GQBlA6mJhHmVSdbNH7xKhc/beaj9St9p0
 JzRN7P59H37ULKGwlEOw+k9whyvJkCmD76lpBiaXvlBk6PvB27wLzINFXubUCBtm1BfGDq75+hr
 MaTMAv3utniw+Lrvo2vydzw8IOvZC1pHHJMLOmnGnxEPDFioDy4qLYC51NXYFLJ/IVIlGDsy
X-Proofpoint-ORIG-GUID: Mu2S058WmCZN4n3P3TN50EVQTWtbCr2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=764
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250107

On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Now that qcom_scm_shm_bridge_enable() uses the struct device passed to
> it as argument to make the QCOM_SCM_MP_SHM_BRIDGE_ENABLE SCM call, we
> can move the TZMem initialization before the assignment of the __scm
> pointer in the SCM driver (which marks SCM as ready to users) thus
> fixing the potential race between consumer calls and the memory pool
> initialization.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I'm not sure any user of tzmem ever checks qcom_scm_is_available()

(or is it orthogonal to this problem?)

Konrad
