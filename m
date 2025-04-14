Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D32D1F55
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744630807; cv=none; b=lK9wKtH5veZJhsZ9lkJaC5N6NcmaY0mT9+adhUaODIOfIJnskZoB6NX/b2OogNHMpHh211fxVBwkpcM1teSBrbTA4FQRdgXmehza8S9WLrWn6yyOrHqiVCT9bI+ubWOiKuPVSNc16X0Lmkfipt6PjyItit3mQHo/HrLkEz1eLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744630807; c=relaxed/simple;
	bh=Kg8lNN2D9PxXCfWAeQsfblY+CBN9LmqT7NHbOJtwZII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3UxeY9Va6ck6yOvLHElCgvS4lhf6wmPLV3qskpD/8LB2Q7UxUU5zSN3Gik8ZLuFDvxD9fPO8P5xgXRTb6vLGZglwXahfWjJhV6pZgaOYrm44hove2nCouOp2yA4KAb1rR4w9bXbrpWPEwBnS/8ApZlEjcoMD9nGUzUW0h7V+cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8ZlYgP0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8ZlYgP0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99x1e031476
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=; b=b8ZlYgP0nO/bKyvG
	B0H3DK80AYm2/oG18ZJ0U99qoqONX15MY2fJGBOVGfpoCwpRxxyO67Q5G+Y1F5uT
	avl+sT/nNwTcg21E9hjhwJNA1N0009iEWfOffuuqFNKFL/H9ckoiEU6ssf0A2ny1
	FM+XYt/hx8dJ0VzRYdHMRCwAC9EJQ9tj6CfG0SnMAbpWY7FtK71bqWOtVyu5Bi9g
	dldORNiYnfdb+5OSA7WLziG4CXIy6n2VAG4CFRe+u8h6ra2ilPrnSIKk8XefejGJ
	kRpe4oat1/kgg2KtQ4yQUAeaqoN2ksNRUqO2Win5ctdRMzNZ7cuqRekyRrJAB0l3
	0fJvPQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjv9y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:40:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5ad42d6bcso88765785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744630802; x=1745235602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DV6qhiKBAUU2imjFAbN+AkEgNtvS7jyxRXDtngWxQDc=;
        b=Dbm1c5v8A1/VGtxvQmmNZsmbs4YpVkI05Y/DikCLIs0JNlIzmnqlEM1/QWkrKypoe7
         6DJVFoZnmUAxa4u8l8jdNPZabgR9T+94dImJODN1XatVjy+4V8MqxmutpFgRNSbDsnDo
         fdtIJ/YyOCN7l8KUOMZIUwyjUxevQps6PRzqLraDWJV1RE+bqjvN9qySe8LO8kALIB62
         Ou1LPZpLgGmdIJR/juFzizO2iLDDeyNvcFMI9sfEpH7r+XbGN2t+4PmcGTC5ayUTHl6C
         RGfrldigieJVqVqAPGH03AQpwJQ/2nA2HqoldZCjiJQLaPVviYddgOkPfrqXb5wU95F2
         xJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlJU8H+IS/LbNOBilzfLwzpV27ENx30w2aiOsikCOarItn+KU2w7xXLXvwUX0ulhzUfv+/0Brx9etPbtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU0iw+DhwJnoZLUzWkJqIYZRkrsby/ygmNb5Qahx7C6nENW6X1
	/FdrUe4eiRA/qyH5cfrng02dQQinZAG4wI0E8Xw/e7v12v/47AflkYrCr5ySLKNCVzuu/07ih+h
	CUjyx6LyIn+4koRyA6Go3pQ4KQS3+iSDrmTR8fmosUKD/i1djCOmNWNnzQfvh4aI=
X-Gm-Gg: ASbGncuJ4Dwk7uaHOFcT4H+mhZv9mbPhos8/DcJSgj6PZdyK/QopVQ0g/BCmWYbMD7o
	/x77tjDKR5m+NwTiAj9UnVdlRVpVI1ywgoVM2cDbdaU+OJdcMWmxGwiFsceXIYzotuvNsokOdNo
	0yczhKVrNI+BZzIT0EuGpFZDAG4NQV7RaFUOtrCWj7Sv/tpR47Mwxyx1NBMCE4aN/JNOqw96IGC
	NIy/0qf6JWb8alX/jtBj0yKbWgK2Re+4UARxBlXk9y7AzaAthwXJTJbBk1GG3YuNF18M+dJciVm
	QrRaQkPNgZslbIpUR/XA3h1trF/1Y9aBEi0j+qp3NFQcVTRXVj8CKnZNCoqIsgn0Zg==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6f283adc8e5mr73752086d6.1.1744630802095;
        Mon, 14 Apr 2025 04:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3E0L9e0/RIci+ADRrX4qrK6GQFhC+G2QaLdC4aN8GFac4k2hQr5Yh2rzqnOdAyJM+rcAvig==
X-Received: by 2002:a05:6214:1d08:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6f283adc8e5mr73751686d6.1.1744630801548;
        Mon, 14 Apr 2025 04:40:01 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3569sm887225066b.3.2025.04.14.04.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 04:40:01 -0700 (PDT)
Message-ID: <8fe8c0f8-71d5-4a85-96e5-17cb4773820d@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:39:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
 <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
 <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <umhperyjdgiz4bo6grbxfhe44wiwoqb3w3qrzg62gf3ty66mjq@pddxfo3kkohv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fcf413 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=wOxLtKptuZxHWs9q4SMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cN-APnmcPdwCl-H8XKnsgKYf4u7qZQtW
X-Proofpoint-ORIG-GUID: cN-APnmcPdwCl-H8XKnsgKYf4u7qZQtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=688 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140085

On 4/14/25 1:37 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 14, 2025 at 01:13:28PM +0200, Konrad Dybcio wrote:
>> On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Add display controller, two DSI hosts, two DSI PHYs and a single DP
>>> controller. Link DP to the QMP Combo PHY.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> [...]
>>
>>> +			mdss_mdp: display-controller@ae01000 {
>>> +				compatible = "qcom,sar2130p-dpu";
>>> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
>>> +				      <0x0 0x0aeb0000 0x0 0x2008>;
>>
>> size = 0x3000
> 
> Existing platforms (including SM8650) use 0x2008 here. Would you like to
> change all the platforms and why?

The last register is base+0x2004 but the region is 0x3000-sized on 2130

[...]

>>> +
>>> +					opp-540000000 {
>>> +						opp-hz = /bits/ 64 <540000000>;
>>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>>> +					};
>> Weirdly enough the 540 rate isn't in the clock plan for the pclk
>> and so isn't 162
> 
> Nevertheless we need them for the DP to work.

I would assume one would like to have dp compliance, so perhaps they were
just not on the very page I looked at..

Konrad
