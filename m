Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205092206BE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674615; cv=none; b=SDkqFUsqgHO5KTezmunDJI/ooJ83vLlFh7tA3DLjOupcbDBvQf24IrihXtmh6q2RCtIOmaYGR1E0Dpu+UqipYT9nopAXOMkDMOOzuIaBwunYmCJUDZ/iX5Km64/UyF0CbJL5CXOrNhxese0biBaStIBtq/1dVq2UF0UZBZarXIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674615; c=relaxed/simple;
	bh=83yv50CaBfMFuVTkj7A7SvKe5M5x6OmGdAG5zdc/yns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVgUZjp3VySovzWcAvATge+hwKiCrUwiFRGXLSPahsTVuDJXtfsKo2LpnnGVUvTm9gxvH96pDXUdeC6gWHPPtg6JbEpAAvm8T7sYrtDGp+geSIkQhe1VOrDeMrb3JzpHp+srzhKnI1L/sZvoax2IrCEqU9WNIjsoKZUIzZor0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UibWW5dJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UibWW5dJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BIrraf010994
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVs4TGgM77zmRwDvs28CfyzU5Glz56xefxXn8V1biV8=; b=UibWW5dJRRze7WGx
	r4Njq0laImJAqWZH7mMDnJ4cde/eOATLk9dppsS++0LzUDEfDwr1nCa3HBnc29Bg
	pqyksFNACzTaIBH0NeUgaUo+AMrTS8qzq0M4oIrrPlfjUtSy4fo4jbu58XcR83yo
	LHr9fk9HMtuaZ5lR14vwSaQ7++8yl/ZNwH/KIaIa0FSuNHBTmb6KuvxzBiTZ8JWK
	C7PxlhMCyhAem2+Br8Ppj6FVeaqylicy6ysNKdKlBgJ/qtZhjHI4oVZBZFUHq07R
	79lEpriZM2azbqj9Q16PTkp1ycRDyyY9N5/y1k2kzRz2EgDaFSWWWPw6Lv3ENZ53
	NcLIrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpwxth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:43:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979e6263so5913785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749674611; x=1750279411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVs4TGgM77zmRwDvs28CfyzU5Glz56xefxXn8V1biV8=;
        b=XDpKaCtdo/Xj3YxBcDYFmuxep+cfMcU5WXK8XzEkLF5TgapnkDQzXlaqiSvH8MpniZ
         YYxZQYAUeWJ5aTn+qWfqbGMXhXrzH0gCyd/VvClhCKuUQFodmuIrQkyV+LunAnqaM0xd
         ENN6iGBfIJyg/uzGS+e+8bDBsVU2vK7i0/FVSk0WYLsbTtyYepv/TTwcSCDbDVcgqU/4
         CetGQxD1wkOPttux6CDVt1+9wx64lyFsWK+YxzG0lbnFbcFNAPC9ucj4CydkRAx03RtV
         CbWM2DOumwPAnt/VhzL5kzCWkrkhCfjFxkn6YbuqPNcvgyEv8GnA5wB/NLIeLyWeFDxX
         M3qw==
X-Forwarded-Encrypted: i=1; AJvYcCXryPCz8eClledcp82fjvfdwGtqLupE3FhZNLX33QsTTpKtZ769xw4FYge0eQZt4uIOA4DMbAu/3kp5d/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT29kkrhvd8uIwtIx3uyqNuqPHD0yWJc9OoCzNkawl8zMvgsoF
	/O9VErqzsFhOh6pS/4v7KuDF33zt7L1wXYZlRf7G/PqQKnoSBDTcf1+GZYyNzDqNyhKLHIcaMmX
	KTDGJzpA/ezd9GgxXThcVP8D96on/mqlKjL46u3PA9uD6tHhhUYgHaruxuAZH8rSdEyM=
X-Gm-Gg: ASbGncvXNHtXu+j5tPSsYs2r/9KyzcGWUX20B73ZbxLDQgtQF/dL3PgS9mg2Tv4erED
	CKdksuo7KUeGBTaO3oCA5HVh7cHhkyVPZv9F2RxkFBIH92Qn8cBG1B8ddzps5ObEOzdYYDTJSSG
	kG/42TZV03DmTSMST+KhnaOlREH+F0udf3wWAtgW/sKNNC69lx+OzsRhvg6Emymqv7QvthT9Aqj
	TuBBnyF5LTJtgySwKPApALohqN8cMvD2nvkjcxuNsgXFfojRZRvO04TLd9u9xLamoDKF+7pB3nL
	NUIGbMiuGg2z9CwyRG50T1udOaDKEPra+W+UqQrUgBXiQavN8zDOvZJfyAGf+//A5M8ayUsw7lR
	dkq8=
X-Received: by 2002:a05:620a:2a04:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3a87d21afmr284959985a.1.1749674611700;
        Wed, 11 Jun 2025 13:43:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqjdJMZ/RTfJljLe8nIPKV0DFCWgHhDdsqtHHOy25gyr/Gl8/60xzpenmgHhiO9jZcC2dhrg==
X-Received: by 2002:a05:620a:2a04:b0:7d0:aafe:dd6 with SMTP id af79cd13be357-7d3a87d21afmr284957585a.1.1749674611217;
        Wed, 11 Jun 2025 13:43:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb21656sm7425066b.108.2025.06.11.13.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:43:30 -0700 (PDT)
Message-ID: <a47842eb-6d65-4928-8226-461ee36b480b@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 22:43:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add missing OPP tables for Venus on qcom/arm64
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <aD1cUF56-IX_tSpp@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aD1cUF56-IX_tSpp@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6849ea75 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=FvtShTKF05C0XPiHgVoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDE3NCBTYWx0ZWRfX0leVIFvgU9Qb
 OyxrOwMZYc8mulv+dlIfc0FMKbp//UWvAz3qw+St3G4/xlqLIsH68R1TZxpypn9E/cspVDQ8khz
 e9WM3vy29WWPKh2y2Fb5nIXsTezaXQCVZ2+D1vn2qpOsOW3um/ngCZPLv/CeIOg4AH9AkReqZ9n
 RCasYGcne4aBbk3Y953gyq/P4i9V1lqQ5HhwJHzZz2wNB0E8sAJ2nd1VOXrOBmaXjKKd4OoiYkq
 WSV+ACJRn6yAZBmcYmpOkE5dv/nqWHlCJRpXk+9g4sbeXmPCho9cJVbWy2m3DNa4qrxEDLWTpw7
 UH1kHcZExbdzCoPC774iP0QCfBKQHmGybcisdEQd+TiDXCsfn0jYLWn5xfkySkxciE7DiiJldKv
 5jktRJjt5cscDd69tqT116DyXz6SHShjoCM9qyOVfJP6qS7TZQH7If+HtQF7MR11mGkjriIU
X-Proofpoint-GUID: Bh9EZrdp_JRNvM_g-pw-EiqcO25K7G4H
X-Proofpoint-ORIG-GUID: Bh9EZrdp_JRNvM_g-pw-EiqcO25K7G4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=955 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110174

On 6/2/25 10:09 AM, Stephan Gerhold wrote:
> On Sat, May 31, 2025 at 02:27:18PM +0200, Konrad Dybcio wrote:
>> Sparked by <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
>>
>> No external dependencies
>>
> 
> Are you sure?
> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>> Konrad Dybcio (5):
>>       arm64: dts: qcom: msm8916: Add Venus OPP table
>>       arm64: dts: qcom: msm8996: Add Venus OPP table
>>       arm64: dts: qcom: msm8998: Add Venus OPP table
>>       arm64: dts: qcom: sdm630: Add Venus OPP table
> 
> None of these platforms has a power domain that supports performance
> states specified in the venus node of the DT, and the venus GDSC does
> not have any parent either. I think you will need to update the venus
> bindings and add
> 
> 	.opp_pmdomain = (const char *[]) { "cx" /*???*/ },
> 
> for all these in the venus driver (plus backwards compat if not already
> there). And then add that power domain additionally in the DT.

Making use of these tables would certainly be welcome.. This patchset
was aimed at pushing them to fdt, so that we can debate dropping the
hardcoded values in the driver in the future.

> 
> This series is also introducing new dtbs_check failures :/
> 
> qcom/apq8016-sbc.dtb: video-codec@1d00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                               
>         from schema $id: http://devicetree.org/schemas/media/qcom,msm8916-venus.yaml#         
> qcom/apq8096-db820c.dtb: video-codec@c00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                             
>         from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#     
> qcom/msm8998-lenovo-miix-630.dtb: video-codec@cc00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)                                   
>         from schema $id: http://devicetree.org/schemas/media/qcom,msm8996-venus.yaml#       

Yikes, I didn't check as I assumed the bindings would be common - but
this always seems to bite.

> 
>>       arm64: dts: qcom: sdm845: Fix Venus OPP entries
> 
> This one has .opp_pmdomain and "cx" in the bindings, so it's probably
> fine (didn't check if the current OPPs are really wrong).
> 
> Thanks,
> Stephan
