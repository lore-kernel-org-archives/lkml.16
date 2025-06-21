Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7206D1990C7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750503942; cv=none; b=H9oEK/4VttDfwvh+vk1uceZq/MGxZ0IH2fVSjEYk1t2DDjIpinc6/LoOjfAeB/CStpQAFLw4VvGosNa0+4g9+1pGy80cORiFLVW915jyt1ZTeGQ6CXofz+X7rqxBI84MXw/jTjA7VYadGccJ0mfQOHpeo944KtfzgR6MULfqAGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750503942; c=relaxed/simple;
	bh=1Z6zEw+mZOPSEcs3lq8hEcv43J7vcMirXB/zQftXcPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7AicqGNZfJnF2JG0uVAQCsKrTEeNYC3CylwuSds7CWqbNFKmMYEh81HZ/Wsk0e/Z3qJJMe+RDj9Lu7R4/ZEBbIqVrMn+8hFTjQcW4mXIA2PNveQs7X63lNDxqhorEvKdd/fY94mip6jQYJJXSijKYazD3AfSDGpt3yPSyceSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVnfEMuP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVnfEMuP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L8QrjT032324
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXB1PpY2F+oO4eun6xnjvuN7Pt+G5hZZsl3ci+crjeY=; b=mVnfEMuPdyLGuHoA
	kILuSg3gk3biD+dVOqrc3o+02/83aNxhBZAG46Tjcz0rq4CZopM250wi8x+FxALp
	B5sNmDcnhfGFhjgHLLj+dy1fTYBIjrcEnpK3f/DpYxG+m+ZkRcoaZnWpdNUm8Hui
	zTxk3TEYQpJm0OYhpzEy+ezXZasRUpQirygHPRXsc4r193vIGWY0Nin0E06ZzsMk
	KDT5T0tefcPzqj0hEUxEP8rORlSVW6gbmwkAbu/mKm/nmnRv146ObtAieTNM2ep8
	Twel9Qev+qmOktzAJ7SIyLIa9IEFvRIve6m5MZh+qFX+JahypDNq2ie878/Qwgl1
	NtMqXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds7s05eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:05:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso69759085a.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 04:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750503937; x=1751108737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXB1PpY2F+oO4eun6xnjvuN7Pt+G5hZZsl3ci+crjeY=;
        b=GNTucWfpqOT0lPG3FQnZvMDqMf6fEE/qS3w+PMZzrWmJgL2qqov95bSHvGQ6CBYyDF
         lAUoyDSSJK30sbH6NahSHye6rBdAsu2tOdt0qZp6073yfSFfBIOFMn8KjF5WRHUJi9Ry
         FBVV/+hYtB16fgeal08d8jF2D0OXRFWT8PT1MvcsjtQ6iR2m4LkOF8YtBXopsXr0+06w
         UbDPfWvTHBz261zgYeE/scn4qog5pKBctQNSsIhI0pIThI6whfbtVkyro8AO/BEpeEqU
         yNdd3g0aitzNtRnJIeRXRRFlweHM87kTd89f+JdFXjiLjpQuDQOZulE38MLVArZ6MHVn
         /3sg==
X-Forwarded-Encrypted: i=1; AJvYcCWxJ0RDzhvKo9UioqqWqnHVqakXd2W7P9/8ZDL6oFRg7BHPn+fquoZ2QwizosqswqWPuSoyc3XiWuO4wJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1XSqPlR3CjKzGbgXr2euv7A6AtoEI4ZVd6W2ZVQ147gm302j
	yj+B2rFU4I0jLo5PgmKgGc4qg8JetwHuUjNHpfS24YTdbyfAU4lZP5Rd7rlX/Yg0AbGWV+7aB66
	z6dg0XzbDnZVaOqlDnN4yHe8MFyRRRU3d5qvFmcnBf5605YgGnHllYKAiqop78m9pShg=
X-Gm-Gg: ASbGnctFEV8BvsSwswOVJWWezDSFGeBS6mEjrqCLMznaHl6IkpyTEUyZcIuAFj5DNYN
	lvVsLYXsWi2SE8qU4Ijdx2F6FmSh9fA/bGZjLTivpeU6KZG+AKnQj+8hNVm3svrYw6NZLbA50Xo
	fxS2ctXxkZDG4g0mKDU/GdU6zq4Haqx7MfUQGKZ/P+AVQVFngHZrAqr0bh5EwRGKCBZl2wKFUOz
	Y77Rz9sCJSoWG6pjcHzMi18r5yKFyVIi+hYYHy+R07gSDO9H0e7cscv1KAbpEKCNvZjtSFV3lyx
	+wTzkCWmPg/cblkETPOkkxezy5r27w1hPVLjsy0xmHyBrtYiUfKwXYrH+XzCZsQ8OxPSC5PYQTC
	qzgo=
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr327303585a.6.1750503937125;
        Sat, 21 Jun 2025 04:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHqOaBfvcVqUGoQF69dqHQtBc9kWD43zsEVDVJq6OnhZKAULdX2fWNm3oy3pXRp98yWUAaPw==
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr327302485a.6.1750503936671;
        Sat, 21 Jun 2025 04:05:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecb9b0sm346802466b.39.2025.06.21.04.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 04:05:35 -0700 (PDT)
Message-ID: <13471ca7-0e3c-444a-947b-51bce87396cb@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 13:05:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: rename bus clock to follow the
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
 <74f7053c-10d6-4aca-a87a-0ac7f55c2f1f@oss.qualcomm.com>
 <jvld427airqpexaiglxe5hbt2svidbqkg3kvc3ysrwmqquwmi7@kif7otpk24zh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jvld427airqpexaiglxe5hbt2svidbqkg3kvc3ysrwmqquwmi7@kif7otpk24zh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6AAv1GwfkdIVIF8XmK_4jCdCNvyXl9Z_
X-Authority-Analysis: v=2.4 cv=cIPgskeN c=1 sm=1 tr=0 ts=68569202 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HVaNLapQHXJw-jFKH6IA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6AAv1GwfkdIVIF8XmK_4jCdCNvyXl9Z_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2NSBTYWx0ZWRfX8h4JM7NOuOsf
 m4zRnIT3wH/O/DDz9/gcVuf8j7uKzXd/b6Dl+ri+AaW9lnIJEnfJGpJhR31ye+fqG9xqpfrgAEP
 6ZE7GIyoALVmPOkoBTjeSD/RTgbffy4WoysdBkZeAKGjaG0Ng3YUfz/JJ4D4pmwW4OrXEYljJ9b
 P8tMMOoMSf6XBGRoRyxbsrT+UimdcBCiamnd0sqc/2QFz5SbAhbcgLP1xXg417086QaaFu3ZERZ
 opEuuo8SlwWlekdqDdmv0dqm7Urlmu8BOdvwl2KOcDeDvOUdXBs+kVkGpBC0Dldje8NaCcMzEYl
 9u7RcxVHzeD3nTLdd3yvvRhqTFLgvXXKrJ2dnHTuHmZKhY62mrSPyYrvl1CgvfWvexypXVkmPPC
 qnY4iC5drhWqnBzxBPNIMVNfvMNR8hC6CkkAKi7IADM9EBxIiU0oqbNMYxc5i/zubGoCTJ1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxlogscore=993 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210065

On 6/15/25 2:34 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 14, 2025 at 10:10:59PM +0200, Konrad Dybcio wrote:
>> On 6/2/25 9:23 AM, Dmitry Baryshkov wrote:
>>> DT bindings for the DPU SA8775P declare the first clock to be "nrt_bus",
>>> not just "bus". Fix the DT file accordingly.
>>>
>>> Fixes: 2f39d2d46c73 ("arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 45f536633f6449e6ce6bb0109b5446968921f684..7eac6919b2992a3512df1e042af22d0cbad04853 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -4122,7 +4122,7 @@ mdss0_mdp: display-controller@ae01000 {
>>>  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
>>>  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
>>>  					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
>>> -				clock-names = "bus",
>>> +				clock-names = "nrt_bus",
>>
>> Is it the "nrt" clock though, and not "rt"?
>>
>> There used to be a split for non-/real-time use cases, but
>> I have little idea about the specifics.
> 
> I think this matches the SM8550 / SM8650. SM8550 provides a good
> example, because it lists both "bus" and "nrt_bus" clocks:
> 
>                                 clocks = <&gcc GCC_DISP_AHB_CLK>,
>                                          <&gcc GCC_DISP_HF_AXI_CLK>,
> 					 [...]
>                                 clock-names = "bus",
>                                               "nrt_bus",
> 
> So, I think, let's fix the clock name here to follow the the schema and
> other pltforms.

if we don't know any better, let's just make the checker happy

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
