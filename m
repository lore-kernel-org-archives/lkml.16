Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AB0274FD4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693823; cv=none; b=i2mx063IGRh2nXv2qSHWf7iX3COf9bs5p/BhcEZM1pOQ/2+nlAbCWuxdGK1SZ00S7tRAkYzzxAoO4dt10xZFAFL0BsA99PI3lXtlhVMRmKTVBFBjOXxihog35Mu5nlNhTfokvjyPnN7G4EuSMANdxpOQhjgtYVUy3EjFAnTNeOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693823; c=relaxed/simple;
	bh=8bK/oDo9iRgWPSwekz9csl4PBAwAox9ptogsw0r7H20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Em49/NFiHyKbIO9X02i+J7rSX8sO35jQ2gg5u+IxAVDrFLT4t/efG6NseXoTducjRMuOTNVyyv/mQkHZZUDRRDtuKL7YwcQXsm36sdXZRnFJtrUgk7WaMEGPNOfq+oBpDY9jst7TsWRiUDCJsANt4uXqDZYoqAoMsrs7LAn/MM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RM+Ah00u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RM+Ah00u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fdo9021793
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zKYR3MIoVjPDQJXWOitfD3prBBIzEWjPAAlBRv6BNWg=; b=RM+Ah00u88R1hOlR
	Rr5ODAzOTrE3CkrYNxXHPobPi5bS6ReBI6NwE+9TL29RPhy3YEKbg8IG4TASDJE5
	DgNEGcY+JvhiahWfJ3l3x4HqQNMz01TcjONiPstU089OJrLFSVJ0GF4EHbllsrmE
	zZCxMLwI5HtHrgKPbyk+S4KhqjT93sB2JrgTomIAexIjj8dGBP4zNWODLca9TaBc
	KMzmS5p/ev6rRZqd2wi1uOF60o1OJCwYmQ+ja23VT7Cwk7FEmtANFYoOw4jlpcLE
	NUuz/NAOD+Az5lB/dwP9Qw+WrqPbbtbD44Mfxo3QZgbNVAVvBOnin5hfsueG/Aay
	sw5zsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpscpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:50:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5832bdd8dso3881281cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693815; x=1751298615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKYR3MIoVjPDQJXWOitfD3prBBIzEWjPAAlBRv6BNWg=;
        b=ARqA8Vihtq2n4lszffkNUUGXPl31uzrS9IqtCP2+pWTv3eZAxA8cZAp7HnWSdncML8
         htR2Qx2rfM7T3b6sLVQC89jHlL2JU/NFLrOk7cakiDgesBm+Q1czWpaRSZn41YpLzlmy
         SEVsQa/kaGthiSV8jmEeUaVAit4li2HbbvJ/K4Cpf1O1K9mRQ+ENPJaJ8awxeQP8XkZz
         CMV3dVgXTvETR1XejJGuBuNw0O62Bbv7MT43P/728BfkIST3TMy6lolvQ1OlUxp+uEb0
         HeRn9lyjHvgESHRvXNt4f0JE5+d3vcc+GPrRLemy7+OqUgqepbeB+cgHJXyOju/PugTj
         76+g==
X-Forwarded-Encrypted: i=1; AJvYcCUVKPBGUvCdSjeNRsy7w+hZp0ZtWnGBpak86VlkndTR7HS6aUwnWAc55LpMdT7JK27kpfapTsJyvTDKHJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZagFchxQMFPrOO9QN1JrZ5Gd4Horrp4jMl7a+5bTBtDcdwXw
	Fqdg9DbmxhdcnzIz18oWTXiYBnNmXzTD9K0Wg0e+pT/WX3ZMlmo1ruSZngwaAd550GqQNkkE8n0
	jEHldzo5JU6YQ/hQq6zZcFsdzmpRJRp4DOIV8pNO63lHjB1IHXkNzyK0c/SDFQwZjFMFVWnTzom
	4=
X-Gm-Gg: ASbGncs8rl6Ap3taaXWbCp3J5b2bBslrUbH9DXf5heUD2jrmW6OOPTaQMpHLKngIzcI
	mTO74ma2XTAIRAbEFVUzW7R40a6R/Z4wEx4J8V1xX3Vq87CuF0KB01AuVJ87OtV1FdViY39YqPk
	s+1prj4liuL8/BWPQuIxHzqcK7hFmGv/zLfuWnWy6TwPE2pCQM6ZPa/MdnsH8kHY3+rskM9zODp
	kV3Zk7kTvFnXyXN/tml34el4X6Nj8F++knOPJ6CHPWJpYiMzp61/6bLwAOslRHMlQcxGusU9+DE
	45t4slzWmRgspfCEBKMsgNECoNMms7btvT+aZb1X44UVXJx07idlo0V8Llsa5k5jRKR/prWc7jl
	HMvs=
X-Received: by 2002:a05:622a:1901:b0:474:e213:7482 with SMTP id d75a77b69052e-4a77a261a80mr69579281cf.11.1750693815036;
        Mon, 23 Jun 2025 08:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGTkOBvKkC1+R+HOdT+B5jRwP+XEzs9FAvPjUOFSjZMpAIXJ4GABnCaI11XF9Si8mUoQvaug==
X-Received: by 2002:a05:622a:1901:b0:474:e213:7482 with SMTP id d75a77b69052e-4a77a261a80mr69579001cf.11.1750693814424;
        Mon, 23 Jun 2025 08:50:14 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae09fc4f964sm61549966b.162.2025.06.23.08.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:50:13 -0700 (PDT)
Message-ID: <bcfbfaed-e857-44be-86bd-d4e977fd4d27@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 17:50:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for IQ-8275-evk board
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        kernel@oss.qualcomm.com, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <175069348269.3797007.5540625905808833666.robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <175069348269.3797007.5540625905808833666.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685977bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=llQ5NRAgLYY5Hovl6ZgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5NiBTYWx0ZWRfX5q8OSlyQBYHs
 gT3o61pRHn+Vc6K8Bxld4DJeCQzTFqkYSxrFYY+GagYz9h/rBJDif/rvw1+ycMjqbxKNpmLE6Cw
 64rJ6HoDX6BQ9XPMJC52ZcafjqWCae/O6mokK8SogENwUzT6RKRGJ6pgeGmEfd2DaVLagCT9iHD
 C1eqZyZug+r/EO11khq2/LZw6yIRo8sWBzo4wcU5usaCw0MdAZIR8zWJpXZ4rAG7TTq1P3HTZR1
 9Th/yAE+0gr7B1We1BcdUuS5GsAf/bIj7p0XEmf7AIb9r2MenebJa/v6DQzqWWu59E29TX2ZBk3
 CZyXlleOTyUKCu7t44CUsGfEwwxLRNFsGw0R82n3DF63N/zktwjBtXA8xW23nd1mIQXWY/Ku/EP
 PrmGeQTYEOYpbW4jI1we81wpd5ty9OnhV1+aEJOU3hfDlM1v11ALKST9IGDDlg8HcTx8kVjt
X-Proofpoint-ORIG-GUID: p8JJmVLrrZH4Duey1KvMt1Ok63x0BC3S
X-Proofpoint-GUID: p8JJmVLrrZH4Duey1KvMt1Ok63x0BC3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230096

On 6/23/25 5:46 PM, 'Rob Herring (Arm)' via kernel wrote:
> 
> On Mon, 23 Jun 2025 18:34:18 +0530, Umang Chheda wrote:
>> This series:
>>
>> Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.

[...]

>>
>>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>  .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
>>  3 files changed, 249 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
>>

[...]

> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250623130420.3981916-1-umang.chheda@oss.qualcomm.com:
> 
> arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#

Seems like a fluke..

Konrad
