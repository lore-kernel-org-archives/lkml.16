Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD452254AE1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048316; cv=none; b=FL1H4EaSk/6GCgCdbD/JplUsWjMLhQaagjQB66lr/q9msEunPwvAo8F8jiE1T4z9l1w1mT53IlBn7zlZKtNmoW9DRKy+/magfCpUk8/SziGmRYdp3YINsUINz8Xi9wn6wVpIgt9fURLcuE820MFceBtdUXvs54+0WiaqW37sLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048316; c=relaxed/simple;
	bh=dN1cAvoLWwLBli6XPD0KhvWowefo93B8nN1x80lziSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tf/ILpaGpMmeOF5F1PM5g1hGSiYqnYFZW51ixKFO++CTpFvGPLRIxWznUsvaZ/Ld4UDkFMF2cBKZkWj8ZSZ4/+K7c5IHJYa/pOglL+ylFtzyacabSgXRINqNjaUySCNFEMKUPZ2kns0p/qIvAHLyPnBW2dqo4EG+5Kpy6qynexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJPJgwlV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJPJgwlV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UH3edl005570
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQ2jnVjO+FK8esFBQJwoX/TVGF2G9VDZcRv8QsM8cuI=; b=QJPJgwlV93pGUs9v
	sAjS5WdfHkEBtc4wZnlFhJ8rI3NZnNeAsP9G0N/ZDnk1L+ta0bCD5YfXVuYsJKFv
	hyNOpYNVgs7nWObCBcTdGVwUE83KBr0xIT06H8QSAJoCh8giSpY8nDnL5Sq/L4Vl
	3VwiFeTbTs956Jv/gMA2qHFFt/F6GdeNsPOEr9D1HbH1ZkrfLywBE1btp2BMmyNt
	uNVbNHLzTp9GbPLEPHd7VEMhtfx6P/cvgmQ0zzJq602M3rv6oD7cF0LsYXd4fqGx
	7Vd9GtO1wi0TDf2XEzatDbspFo9u0oDscDtRW/FdQEm0+jXdExCshExrPzBgR8y3
	aPWlAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8bnw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:25:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso4023985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746048312; x=1746653112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQ2jnVjO+FK8esFBQJwoX/TVGF2G9VDZcRv8QsM8cuI=;
        b=KDYLlLj1WiiacjHlFPWQxpenu9SBY5j2HBcKUZLApFQ1Dv/4MV7+5ejOWbIMf/5MTD
         tsvjFryn0UKD7FaJAulVCDmDpwXLAaouX8FygPYP5j40kTeZQ+zzDetlb/rB+MMNvgvz
         +bskXcEia+7xhM04Kpy8kwZdqiN4FaYDVLRoaLGYGosNFIPYFUHcYuXc8UUUjt59+8q5
         IHBZSpADnf/raKWew4cJt6zkqIhg5KQxEPf+XtZ3M+1UcQbvCV9GTM5GYuWcg+3OdGk/
         2q7ljkc6GZjqNV/kGVjUhlBPMBHtEodU0ap2bfuO1fkS5uGXIz76HsCXbimk1fmGUqNs
         xJBg==
X-Forwarded-Encrypted: i=1; AJvYcCVpKu6egkr+WBfdpVf5vpaCjcg3WuKqluyhahjp2wO/O8wyfDFF+fqC/iAqa/oD/n1scAGDD5vCdn7OviA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJu3XEykWSI8y9rRXAMtwZJzO+xkxSFo1S0jVERON/4CCA/ViJ
	QnhgkWauwuHga/DwrJeMGdllWbGNR0AJeV68/t+pLvjAkWtGDWs7AGRepy/qRsdbFdVp6ZiRARu
	5nnB4MYuBJIRjkcM/brrqcJhp4BFpDNuTe98XzTv+7Po56duzwCTLL260Ym244c8=
X-Gm-Gg: ASbGncvli46xzOzeNz78QgVmPBEy7fqt/D9cCMlc06SQ7z5y06fWipntjaPtEcoNuAL
	KA32xcw+DZJVb4ZyiqAzBloEm0itY5M/LLJsgfFJp/W8tBu9fY3pmYPL9ytEtuQmALFZrDlkZCf
	tbRN1Dv6HPf/y+oDwF4BGYdpyNbmDi/EHm30SBWtzUI3O1GfpF3gobU6mEGdwyIqc+X4lDlq6pc
	pP7m94I13gNCJBRCjQ2wIT1yOFn1e7u4niDpbt5DqR6ua3Lf2VrFIKqD7h6W0Fu56Yy0dxlBemw
	IALFbzFD6LbheCIxbKgDiKGKpk0yQjZUtrzzYFXHupx9+/j8swVUgImwa/06Z0oYTDw=
X-Received: by 2002:a05:620a:d81:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7cacc1be6a3mr110657485a.15.1746048312412;
        Wed, 30 Apr 2025 14:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHno9xC01KtHTcmyiEyJau4nN1jUTcCXOPCTlNFj1PnUJfKhzAvD4jmrGjvb47znNHqT2g5uA==
X-Received: by 2002:a05:620a:d81:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7cacc1be6a3mr110655985a.15.1746048312015;
        Wed, 30 Apr 2025 14:25:12 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acebe215210sm396837966b.68.2025.04.30.14.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:25:11 -0700 (PDT)
Message-ID: <a5db4897-44d7-4e79-89a8-0db35d49913a@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 23:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: qcs8300: add video node
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250501-qcs8300_iris-v7-0-b229d5347990@quicinc.com>
 <20250501-qcs8300_iris-v7-4-b229d5347990@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250501-qcs8300_iris-v7-4-b229d5347990@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=68129539 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=AFtjm6BWk6c1pdSQgKUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hT-O66ldijuyqmiADzkAZ4_u4tMvHF3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDE1NyBTYWx0ZWRfXyTP92aLNP1JS qjkrvGkbCYquaJFB7jCMykw107z3U/Mzu1ggwODG9pHDL5FdUbsxbA/wbq6Z8qggCacVJaiK1VP Vn6MBHcNvn5MdAUd8gMx1z1XBcA74qyVOPCGZSvdr77TLOILCLwMHccPAn6rr31jALkLtI5i8Rk
 evucnpzJeKHoriNAPuvB48gnWNq09k4El3SoHRZGXuCEC0wOc+mqWD7gvyfw5RF9BS7xfQh3kQ4 PmB9pCEe3tZCBy/pSH2Me3Xe4RYbctgtEjFWdy59CxTYoW8++H4E1RyrbOxX+MDwkFxKHgL50vY 3tSC1oJmezw3rx7lrY62LahfFBGABfev7m8ETuJQ0d8QMYzr0uvEqnaeQUX0YEKItfOxNMRYmcF
 eIC1YQhblsd1H1L9CdyIA3roHD/Y0ZKOg2nlK+KiGjbL34QGaEzk7sZrq9dVRHI8WJjrZO2r
X-Proofpoint-ORIG-GUID: hT-O66ldijuyqmiADzkAZ4_u4tMvHF3M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=839 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300157

On 4/30/25 10:46 PM, Vikash Garodia wrote:
> Add the IRIS video-codec node on QCS8300 platform to support video
> functionality.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
