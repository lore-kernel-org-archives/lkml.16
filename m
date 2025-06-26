Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AA9295533
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927915; cv=none; b=uK9P3sKb7JhcijM9uWwesCEtORdD+MsgBUFzRICJ9+AUmBSJ1CcAGWND91iehAcgq381IicSLIdEqGyLrF8QgwpBXhyzmmf9ZOUo1nbSVvGvsZ4OXFZ1oYx7JSswIUMPC0Z/mSk8PGh2Yavs3kNjpPEbrU2D+piohHnGhVNpcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927915; c=relaxed/simple;
	bh=aznDneGB5ZSRcgyw+5JpEXuiR1KCupx+SXPzTLp24oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrkqsTmBKuh3ucUATVwjdb68WvVMRBx6393yLI0XjTpT7DfZ7XK89DEgNQcxYZ5pkrTRlrbb8ikSjnvnsXnrayhqGgE2xZ94+oAs91qY3xiSYuXVckrjPq2pUrARpQ0/xvMfikQi3z8DqOmszo+U9JQKTYuYP1Gk2XiumjDWRG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pI0/t2+k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pI0/t2+k"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0Dm7J013320
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mgfcLjhJkXI1R1iwfIXHzXxGB6xPeQaB1Fa4Lnbay6g=; b=pI0/t2+k37GowChq
	slrM9V81tfI3008e9t5Oh19Ci3phkWDQb3qhHYAxkas0x6YnSk+3s52MyTbkoCSu
	vzA37m/uHeJ6hIHdyNkntoACiZ44lXsG5vPQ1Cs1e4HBrm3UeubKlA462i4TJ8MA
	5TzOBE6bopGwwW+mLuYhdTKihB/g8p6X0AuSQuiaLwym55smUcsbHi12rCcwCa0/
	8T0RsZHIKFrTW+M022TZ5bMqLu6EehcHLq1D39hAP/35C5bFVwiygPTXOIfpmeOl
	JOB+7WTFaIEn8UMgweIhaTJHNdoW4zro6KSY9D+9hj+T/vKtSpgGwsiXdxRoRs2G
	i9ZzXw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgjp30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:51:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a517ff0ebdso2542241cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927912; x=1751532712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgfcLjhJkXI1R1iwfIXHzXxGB6xPeQaB1Fa4Lnbay6g=;
        b=AZCW6+z+edqKukmqqRfwmUyLDOekDw819E5bEHicxu+HAGHu/4QGDXDmEyASFO4BGB
         /nM+/EXQRyQx5WKmp8R9AGU1+BAs+TLnlY0NS+snYkO/5dsotGB6mvQ3xHFC98gyGXuR
         6z9DtL7k6nUR1BFSN83HMW1OYfdyM5sd3Tr/9AI19pSgWtWHuKYtjLssKU9bVjWPo5/b
         j3uF5Pg6vgBnFk2TSirwdQknSUCGVEE0TxAh5/Q94n6EyctcL7YHg3sCtzphwoJ1qpll
         IhHBq0HWjv5oIYnTGKZxYDMZZFU5+SsqnwhyVQOK3Uyoj7cgidQIFNOw7VlaMnXRAirN
         brIg==
X-Forwarded-Encrypted: i=1; AJvYcCWYPKGNp13Ps9AIv1ZtRxe1mc//gr2INNqZtttVxHfKpZ+ai+ILYL360XNq1O2OQxbiicEXCJBmlkgxR+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjy+hO8jzKBr85njXtpHCzuzZfJ/fO3CKt+BTpT4OvIHpfFC/v
	BcxTxFqoN5mQnDkhf3+2LvdrbkTq19OUSDuSyEjBlHi0Woez2Rk6MeoQzPkxSpq3qLse5lUiN/W
	NkfL1ANY2o//jtrIkIOQaXQT2b2y+wQHiijS72R/yWtbZAHdDWUeuoHoymLXCJmsyiHU=
X-Gm-Gg: ASbGncvHVBUPTY/YWbIPa6T27z1BDY7AyP2kE83ouiQVuwAP3vm/PYiWJZMoM0N0TyT
	VognIypQiDDwO5u8EwLDrjk4X4aDwXpNN4GIJJXBkPL694hBS/DHMUpjkbz0P2k4QLl9grj2U3y
	lv47rywlL8w//pZDkIlARv1bO8ofNdnKb1vIatkqFj1xD/6RW3qhsDw/0F4ry9pePhgr+WGq5SO
	8G0ibeIx6yKt3nVD814ULr0dlJeLCqyglHc7/xs3PIfqJg63br1Nc43n7r5kBzMUvvQ0AIO7EMu
	Ww+Zuh+wDJnJkHMOs7q0qX1p7UbWEfg+a4JH7ryGH/boigrKxrpE6CQngq22L+TsBvYVhCO07Xz
	yiBg=
X-Received: by 2002:a05:622a:54f:b0:4a6:fd66:3458 with SMTP id d75a77b69052e-4a7c0a039f4mr40604291cf.10.1750927911791;
        Thu, 26 Jun 2025 01:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOmDH0KAs+XZortwRNF91JwBtBfCGAk9k2TesPeECiTsTLjvyA5O5SpXyDnT2kgnA3WVQCcg==
X-Received: by 2002:a05:622a:54f:b0:4a6:fd66:3458 with SMTP id d75a77b69052e-4a7c0a039f4mr40604151cf.10.1750927911085;
        Thu, 26 Jun 2025 01:51:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0c7994f6asm228368766b.38.2025.06.26.01.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:51:50 -0700 (PDT)
Message-ID: <688d2d3f-6cb9-43bf-be39-7c7651def3a8@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 10:51:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for IQ-8275-evk board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Rob Herring (Arm)"
 <robh@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        kernel@oss.qualcomm.com, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <175069348269.3797007.5540625905808833666.robh@kernel.org>
 <bcfbfaed-e857-44be-86bd-d4e977fd4d27@oss.qualcomm.com>
 <0e632d8a-fdd3-4401-ae6e-a0ac6df61bfe@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0e632d8a-fdd3-4401-ae6e-a0ac6df61bfe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L3iggHgX-pzvDI1l3j5WWxX9rQxEF28k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3MyBTYWx0ZWRfX4gHrQ7orYIRx
 Rjg4U/tO7el9ot/4GivYU5NijnPNQIGjbYQCjqkWz+IfMG4UwawfvxO4DaO8MY6DbjRoUKijOU5
 tCcqbxrah2MGo3Rkp3QiTBxS5P7XBQz+bf8baycsS8hpt7EowLIxjgHacqdkmTInwL5rjjQYiAl
 HVLmj2aph1gJvIGGhdQSblW34Hm3ZHNoMk3T1g0zokTyNOuYEcO+i8jLO7dtMp7MHHFZj+rx6/R
 l/gOJq+MDB5HWjC3Q2a/WLCEAjEdElcB+TQydHz/HyjILlMb7Xf+SW/3I0yDwb8TxfHPXGlU5ZA
 b33SoJFM6IpRifIU94rT0FOnBGq31XpekWXoS+vQhw9hyLVAzqwSXOPmn9QZPS54JL6hZvToGVA
 47TFBAFpOSDQ9zrA2AoaWl8/w6ZauE4J/G7juEJa603h5aBahgDbQUptyaWwbC2f+nwxqP01
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d0a28 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=p9_aX5AVk4CqX6A2AiYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: L3iggHgX-pzvDI1l3j5WWxX9rQxEF28k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260073

On 6/26/25 10:43 AM, Krzysztof Kozlowski wrote:
> On 23/06/2025 17:50, Konrad Dybcio wrote:
>> On 6/23/25 5:46 PM, 'Rob Herring (Arm)' via kernel wrote:
>>>
>>> On Mon, 23 Jun 2025 18:34:18 +0530, Umang Chheda wrote:
>>>> This series:
>>>>
>>>> Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.
>>
>> [...]
>>
>>>>
>>>>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>>>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>  .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
>>>>  3 files changed, 249 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
>>>>
>>
>> [...]
>>
>>>
>>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250623130420.3981916-1-umang.chheda@oss.qualcomm.com:
>>>
>>> arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>> 	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
>>
>> Seems like a fluke..
> No, it is a correct report. Schema does not allow port and needs to be
> fixed.
> 
> What's more, this would be pointed out if contributor checked their DTS,
> so obviously this never happened.
> 
> Internal guideline already asks for it, we asked for it, so why this
> keeps happening?

What I'm saying is, look at the diffstat that I purposefully kept above
- unless modifying qcom.yaml retriggered it (but not any other errors?)

Konrad
