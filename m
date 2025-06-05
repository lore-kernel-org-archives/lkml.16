Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E7A18C06
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145278; cv=none; b=hyGeE+t2nMVunM8aeGzsSRgWXENUTyuSTLM7YXSGWSAxL6rVUWjJWgwzkc+osoh5zIzUeYBK5XV/FFJ/nf6e5P64As0fQ7l/TIyaa6yQ1G2etWW3xK8d6r6mEhsP2UVS5Kh++8PCejviGX1mMzSco3P5k0wHS3nDB/pvp+lbUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145278; c=relaxed/simple;
	bh=Kd705cVy4cZXsJVNVs/ul0Sz4mIzrVXisg9DUB+95HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uLwtSzPHNubsY7UnkRD7GK0JN4eCeTrxrEXTVD6itUae2+QBAdqy2EpFawsSuwNcjdMRzfi3YJqBuUx9x5XFD8DfRThIm8OTCTxlRZCUidfzUuxhNoQQrXboCh+HqTT58pJloBl4RFN53d3mkxpo6v013CjRoQerj6Lsrdi4hak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBnJIAbB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBnJIAbB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555BJbvI030292
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 17:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHgxB/Xl9nkZamsw9NDapmgVHXV42gJWpze445U0Ts0=; b=SBnJIAbBFgtOfs83
	q7KjuX0LFFoxgvFyRpjNa18yiPkWYLIyyl+fEKk7TJsz2Id1w1kzbUZWc6tZ07fS
	NB72xkPIguN46lYV3EwYgFwhUui8woJ/qsx5y4SOCCX+1A7oLhcHfuMyaG9r+tI3
	wDuDdDUMZNMGpVrtxyZGmv7Q0gfXnXwhin9YeLgBPnxUsznvWzfcpoF8jMFYivRV
	oMbBQc29iDDjvuc8q3qjvM7jBlrieR0H1dcJIVXejDPtO6H8TSX51iZ0Q5l/cA9h
	OYUJCRV269vx+Vch4eQt+0oZ6zLFKrpbctzSI7lpUbuho2U1i+5HJ0K6Yi1++50x
	D/+Ujg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be85vyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 17:41:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c76062c513so25301285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145273; x=1749750073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHgxB/Xl9nkZamsw9NDapmgVHXV42gJWpze445U0Ts0=;
        b=rReOs+KTvJwbwz0NufjWTWJMTO1vB96znSzdWoPLVuvW9WeLAzkEtK2rej5mgGtlen
         xn7h1JBYrPAwOlHbkioi82PX9glHHw1HVHFG0N5HDOjbG4NHdP7/MLI0FUGDTq1krHDP
         f8TY6gQ7+RfEoL0GMJznsqcdO7i+VcN4osc3mtuCFVDLMcvuMcSbS0qxeCAv9erhyq+v
         VQb12mSPsEE+IwjlF3O8tfxkyq8tU7kix1ApXKhbsR7mLYCEYqvZ1zXZ+VjJJlaUSh2h
         cagBMZrXniw1vuHgQQZCl8TTg1ht8OYVBBXmdeR4hYicICOmyfSwqR5FvexSdYEyYniG
         kcKw==
X-Forwarded-Encrypted: i=1; AJvYcCWwyr9ciswWe0usApYesEya1XBnAxyf0mELt8AlDZbnfa0DSrY7YIX9PlXNc0Z5FLVqSgZdiqcRLHHzoXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1B14SFZ8fFawmyDwy0W7CsWo4gtUxA0Fu0sHPX3ktlvx6U8yL
	A6yTp2/WIXwNO4YUaOicQNtGIkNL1nu8BNZmPa8n9ZmZY9/CETP/Gh6yLgDfQbSJNNpWUd1f6YW
	lvncUFEkPcrE7hwVDGHuiAzsJAUkfZ7KsIybR8Pg8kw0HT7c2dTmCX6JAHR2xfNHbkCo=
X-Gm-Gg: ASbGncuMTWYmlRPdXE6Q0Z4Kzi7DE/oByWjyHIpksFwBKwWBoL5OwFz4O+c5LewyvQi
	YORbva5kN0eh/uosCBHOQwgC0rcxrKe5pkii+cq0YEJIHEaejVUC22RAbzM9Mf6V5a+cWX9BteQ
	F5KeGfIQI6nZdrqiTTW0azi48ouN3K1/BTrtmDMpuvF1Z5c9ATl66kuC2kA7/zfECSy47jyytQK
	kn7dQ34iRU9z2dRLSqnNVfm0G+GgozbTpOnTbg2+lp30XjB/R0Qruo7nzDgTdIlIWrrBeb6J4nz
	87MOx0UnJvKkGTh11zPzpU8Eh2/zdIqUZf1DcMzU+r9Qvc2pbTgqNNZw5kWFlK4UIA==
X-Received: by 2002:a05:620a:170f:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d2298db7b2mr26665485a.3.1749145272688;
        Thu, 05 Jun 2025 10:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwcr6cpf25RcY9Wl74uoirxp1iprjopwhfQNVHIAOcoE4TlDgGNyG2XDh/h14zGU0QC4ewwg==
X-Received: by 2002:a05:620a:170f:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d2298db7b2mr26663985a.3.1749145272268;
        Thu, 05 Jun 2025 10:41:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade125a01c3sm87638466b.95.2025.06.05.10.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:41:11 -0700 (PDT)
Message-ID: <44d9bc9a-ca30-4c5e-a3e5-c3edb2500767@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 19:41:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: defconfig: Enable camcc and videocc on
 Qualcomm SM8450+
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250605173608.217495-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841d6bc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cZhTYrgNKX4ggZFUOAYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: a-NQz8xpEQDd12UkoWZbGXREXHS_RDRI
X-Proofpoint-ORIG-GUID: a-NQz8xpEQDd12UkoWZbGXREXHS_RDRI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1NyBTYWx0ZWRfX3/hh2Zgz9FIs
 gGrETDlYWML80pDTvcdY6kQx0fRHDejYGVSJ8eEqA91SHOXfB7FRe5apoE4BLXn9kzHMTGbMd4M
 9WOWc4YbXA3nI+/luZS5+7h5+Gn+90swL1Y+qGUCkHlpJqX9hCvWh3nhON5FDxeF+SbAAxpu7lD
 //BDpF6ie/UNjXteTSV9U5/PYzm+wa3SHa2QzUHTNyf7bzCtxG+BOEH8/rpT1SMQb8nbhESfMco
 +5gPVDqXLbgT4gJJAWKSm+9z/PvIykvqrOrmKLqNQwuR0BUQY2B2uWB69uUV1LBn4Ev8n/REs64
 tDXR//EzNrAFjnmyPuivYNn2MQJqhiRZAntuIyPmVU8zy0QL+FBdup060+0Ffr1i2V+YGXxdSlC
 +9XC6+MlUpuwtfDuQiZXLnRcPNsg+Bc4y1R52dGR4txf5egeYOp2vxQei+GHhmosp/pp4Jr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=865 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050157


On 6/5/25 7:36 PM, Krzysztof Kozlowski wrote:
> Enable the drivers for camera clock controllers on Qualcomm SM8550 and
> SM8650 SoC (enabled in all DTS files like SM8550-HDK or SM8650-HDK) and
> video clock controllers on Qualcomm SM8450 SoC (enabled in SM8450-HDK
> DTS).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
