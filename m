Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D0321A455
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278735; cv=none; b=bd5LqoXmMdRxzjfeCs6xt6u+HQZDKrKzDuhmUobt0TVBiNXKEdiL/chZZ8x59krZjowtWwvU4pu/XaUcWM2gf6mTb9Eq0j0swOqoJc+WFpH9J+1IRGWQBy+2ypsqvYp21MFV0DGGIuaRQ9/o6ngNeEo1xIaxtY56hkAa2hgtcAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278735; c=relaxed/simple;
	bh=O8JroxGk+Jl47yBcZyk/78kA/+EH2JyBWKCuffMf9Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eVFrrdUtkIxP381pR9kyKe8+lU9QbwFBWtWVXAAgAgmcpdljWqjejcL9C47AfjJWfDsmCOIQkjbyFB+Qk7WMgEFLxw+JKcDitaxDU7VrwBQe12ancSdEpQ1Wnesz66zN0cSJ1387H032Hz09Mfo7ClgQIgFx/SJLnNggyjqGPCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtBzThqj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtBzThqj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IB7fWD009829
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMKZ3B/JFyMsqt76FuJhG6cvTI0uCazGHj/jsvOr3G8=; b=DtBzThqjAAGEydAA
	4yOm0mXb5jy69JUxdDEGkGv8z+tEbEEtYbkZkns6WF7FIfOw0xUc2szZ3eqBNVrX
	ggrbdMDtWe02i+argYLRiSN1PJHJ1vqO5ZV2yf1x2xdqE7z7BfEvnXqxJ1dq1kZg
	BGSnev3ZIWRilKIgD2rbcq32hM7Dh1uTfefIPLm4iO6CEm59luN+n2c1QzBtOr23
	NHenCZhycNgI2GLOAQCLv0fxOo+M4qNJYwlZwi+qjzMU8jd6OuM+UkEkZXRmtPw1
	DlMhjdw5JPF35Gnpe+x04kToPvNGlR9ae0lgoT3l0m2r4J6qME7n9mQ460oyCuM+
	TIuuKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5v6vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:32:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097083cc3so2021785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278732; x=1750883532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMKZ3B/JFyMsqt76FuJhG6cvTI0uCazGHj/jsvOr3G8=;
        b=p5w5HhGzwVKeMAFXvO8NpkwfEquBn+LIrMp3eQlpqioXpAVqkqRhdu6d5wf4ZUCRU6
         yrvDzpCGhuDemeoJyUWY5nyLQ/CghNB1RNueKL3tMDE9GUGf/O0oD24l5BzRBN4z8B+x
         lBUKiHDAVK7H24Sh5aZjDrtJJam0r7FLmcC4ifQjgKJkuy3qnbgqqgI6NTvzp0Fr7OSg
         mPAf0NEbD8s/aPDPgtBxehWjPL6yfDU8j8ytYM+dtwc3/EbAp1Dyjd4inltytJ1q6OSi
         PRHnMqdvjR+Fp6Jh2kK651JafcOlVqu+iN5TXR+fd6DMvCbETvDmlNPUreT6QOMZwlfN
         /ZHg==
X-Forwarded-Encrypted: i=1; AJvYcCXHNU0h8SJ057sh9es0vX2uDbo5WCN6i/Q6JxEoIfwvIMq7s5PzsRyf+IkHma43siLEBfqL0ujVx8HHvZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS8g8tPYnYkoWjI+3yq3m2FfxM0ypeoB8hgQ6bqjmkS+OvXMq5
	ZMP3z4mdH1DRKkEI5CFOeVUq0brOv//eZvJb+AOmOjbYx8mYio2HHTNwrtTEzdoBnXyezXwca+U
	94p4JKp8XY6hFUKRm0Zhf78e09WBR3xaud+0p6dt0/S/zDhhW0e+z/eQiM9b2i9M2LUM=
X-Gm-Gg: ASbGncv/uDQdL3ssEIct+zIUlSHRi+hke6bH0czNZg+CBuwIuKr3lde+7VbEi/fIvWh
	9GOopWIX91H3UpryO9S47+Nza75ui4kHRU683akQawbTVfWvHGuelLQVnfswgLXpgfk8snUmrx9
	q+XNtdz8XP86q4/Us0/D+vTySVjiFEYerIhWuCP2zdXABccyLu/hjBKYIQp7JbqooRsXJKGn+BF
	LeON+tyT4tBBsz7UrgEA6BMnx7wpyKTzREsK7F2wfNjBvESFgJB3Ln6EJQGSNnzDS678P60QCWs
	Y6kKCJUPDJ6ZxOAD93s1hTQJVdv8PnkEE57lyFvWLvbftpBkaJEUvIXFUpz43mOqBNUG4N4oPth
	YoJo=
X-Received: by 2002:a05:620a:430c:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3f1bde64amr37694185a.11.1750278732295;
        Wed, 18 Jun 2025 13:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/MIIbr9GmTJBVslf38SMQbyK7FgY0tGiofcr+MItIMPe4cF4Dwk6UkUrq/85UyafeLZyU7Q==
X-Received: by 2002:a05:620a:430c:b0:7c5:9ab7:3012 with SMTP id af79cd13be357-7d3f1bde64amr37692285a.11.1750278731799;
        Wed, 18 Jun 2025 13:32:11 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d4dsm1101150666b.28.2025.06.18.13.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 13:32:11 -0700 (PDT)
Message-ID: <57267306-1dc1-476c-8e4d-02e75b1b79d9@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 22:32:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: use 'pcie' as node name for
 'pcie0'
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        devi priya <quic_devipriy@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250618-ipq9574-pcie0-name-v1-1-f0a8016ea504@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-ipq9574-pcie0-name-v1-1-f0a8016ea504@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z5p_IhS-HTLGQSt_BrFOu11coElRNAnx
X-Proofpoint-ORIG-GUID: z5p_IhS-HTLGQSt_BrFOu11coElRNAnx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE3NSBTYWx0ZWRfXzGX512tyCjQX
 ZwxSll+83QCfxD60xW9D4YFmexnsD7Cd/rUKQ+/W7KdDAYVTT2j0/n+EOey1M4E2HphDY1KpsP0
 9Ggx296Ehpao4YKgund10vpMIWF9BLoxoq1ParGSIpuAeVWs4SGzsrgDpr/2HdlgLikmaPJ6/Js
 yeuiH1IBlsPRPW7owOqR5MUvbTQ16MLOCsBvB9IM8s67iG4kMrNsjkEwiVRxXOL7YDUQ7R0mlYR
 aKlLmHUit6LkfmJxdypFDYn2EWrhOs9k8Z9JlQZoNSIBzIprGv0j7RsmNplYtQH47j2E/C9MGC9
 sdXZHYLYvD2pt+ZlUsY9sGCFktpGWIy6tyWqLdO/xKKU9YV4CIUC9fvh0KCpsSVwp9x+dDjlaBZ
 Ws8uVW4hWYxfYowKjU2I3TE4Uvj2Rd1z/Xa3eF3a3ul9pkQS2BUNtGB2mbbOdoam7yWp/9+E
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6853224d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=823 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180175

On 6/18/25 10:14 PM, Gabor Juhos wrote:
> The PCI controller at address 28000000 supports PCIe only, so use 'pcie'
> as node name for that. This ensures that all PCIe controller instance
> nodes are using the same name.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
