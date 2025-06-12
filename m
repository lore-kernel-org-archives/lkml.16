Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5885D22A4EE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763203; cv=none; b=PKfntVLNYdQdYmg/1lbuY6AnoKY0z9T35V25wzBXpoEZYzbOh0NAOKZaiz1hjPffQsmpy2JrNOsCtmk5yfzeRikVhIg+OxKRPTarSrHwre45qmAG+0/R7bxqCRGhiGh0V1M/+7bqjL83k8Un5a9GesVs0o4fnKVOi9BlknlWxY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763203; c=relaxed/simple;
	bh=H3ogvr7A5eaCLCoobtUF9Y+ndFSfv9DKlh2LHMiNqnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vhu//2wElMBRnT40QERQVxYY8zv2kAsbxzuenlSuCh26cxC/wcjhJ/G0NYaJlCIhLfHC8jCViv46EGbLPm5Csfk1ulQyBDcswhR1NWxNpMjqha1YWK2I3GtGiV+rLkPbnEDNpb/ETSazEvSN2Jw7scg1VaUoO4zdGlRYL9MQEX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EaxjjFpJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EaxjjFpJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGUrCL029627
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=; b=EaxjjFpJ7wS6WdqT
	Al1W1Dj40l1WVibjXSMhFBkQf7/kUWFEy7BYQ5Xh1aoIZxivt/1erMUK4pXf9IzK
	D6GvU6tPk97CzCjDbyjp4RBj9ZR2Q1Hvg6pEjCSoSHTOS3GpK1i0MNQqh6ss9Eg2
	SsavzA5JlzCtAdLE/i56RtkKXQdF9mkMe7qiHQCpIWSERGU97gZWoXfBPDeAs+Jw
	GtAZTZSGbvNuZJ46oglDZhV60SoySDp0yIswVG/qv1FuDvK6FXSbAiIjtNYMBxKL
	RYCYlTJN6LekxjS9R3Ha9R4GwWOjrVcR9JwvsLgw9wJq8Ykq2S9uhRG9dXyOKWIo
	0C2X8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d129u8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:20:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso364993a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763199; x=1750367999;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Zmr5+JECjNDrTnuNUMITpmDMpNItBuB/kFf5nbp53s=;
        b=OYeNIdZ/9SLjPruNK92AcmlLcIRn0K5xPKdOnhwUZdn1EqbM5DFxjJVYQrXdDTFEbc
         FBw7/1B2NnmneSbXEKWoVQWkrSuXpewVgSKl+ox6BX+zLWc6w9cr06uLfMV48etjMqqD
         RhXtD9nYouVPBMYYfXqSoJ6nBNTyGrLYUEpGSMAzEYdVeJa09TEg5pmyiJr/kSb0HmGq
         Efvcb2P01D9YmNvTTkn9QzGI0crfQtqy4qkLhs4yAKQx5+Rs/NjAXEZfhnUeu1lSdbl0
         BAucdB7XeJI48cHtchoBugOSRIw+/kFAsDaR2GZ5s7OSHpkXa5X+19fSUOavFucvSwyz
         EtUA==
X-Forwarded-Encrypted: i=1; AJvYcCXx21V6x4+PEIt3AEvNQ6aHD99n6L5110/xQPF5PnsHLu4/JcuEOPbzdXXmcsgpL/5zgFIGxZSpy0ya1Y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvpSSVhAwJP3FU1IodSgva4hhCbtS0kHDb2zH/gk/QImUsFhYT
	UKA5tQR53JQ5euU9pf7OMQG1wSoGyB5o12tJSPV5qMX48mBni+JpfCFCJoTEn9tIW6NRoNQRdC+
	50vg1YfUMcUe0T0g29XWYK0Xn5mZI3qBNjbgf3po0FCLICboGzknWgQ5r86DfGaVfCtc=
X-Gm-Gg: ASbGncvh+pu2fj1gvNUhOCtSoGTLcIrIxE+9RTzbfJRVPeJ1l8z6JR+Jm3g4zhc4PTP
	+LNOQqdSp5qU9D8/F5lVCBedjuab2mlK5Hvz8jseNcKiwQIxzs7hiOrvnqTSP2n0ig2CVJrjR4C
	hNu3v4thgUYN0wpLDSkagsx5IJRMOS9N7Ya3tTRUrDLkw1/Mpe0hhOWzmqxqjmlF/q9yzN4rtnr
	6Jau+ts+9E3ssxNImoyKJebHYCy+f8yZr8rX+WnyOsn8phcdW3A+0EQ3j4NjKXMFcpN3OXu/vNG
	sKLR2i/9gWTJ9cfHyRGbBkwMPbJrg9kp3HA+s9wsOw==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-313d9d71383mr1065534a91.14.1749763198844;
        Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcEB2oQFFgVMym1bB2VUhhziP7lQFCJfNjFpbKCnIdWSG44vwJc/VtPEHqnpJDg2SoasT6AQ==
X-Received: by 2002:a17:90b:1843:b0:30e:712e:5739 with SMTP id 98e67ed59e1d1-313d9d71383mr1065512a91.14.1749763198422;
        Thu, 12 Jun 2025 14:19:58 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.228.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b5a882sm1990932a91.40.2025.06.12.14.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:19:57 -0700 (PDT)
Message-ID: <036e739c-54e4-4252-b6f0-c8eed5557d15@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 02:49:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Support for Adreno X1-45 GPU
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <0e6fd97d-9a56-426b-8b98-dc8aa50d02d2@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8PRE_dI7_4_s7ZRrAaLW5oiOdQSKnfJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDE2NCBTYWx0ZWRfXzXPAYweSAs7d
 84J3WxZCefo6et/XhtYm2TIptIqzsahSQASPkj7JA1zpDHw0xmt/K3IgUdl5BVJbqgh9S04rR/T
 vXfDVFfEXqDdzQEWszo4uYG93WpBv2dAqZUX+ryeqRXSrv31OfkWRV5w91l8PyJNC3LeUeg9cIa
 QDMwhwr15YKJ2oqMiuS30czwZHAglDkqRHCQZXBchjaokKhgPYNTj9CPiVgZNuI2h2a7yZzZ7/c
 pTu2Wh4Xh75zRsePfhNOLVJ73RE7vPTKh7ak+7xU5BZS3n9tKpPIGSISZXQaHlVwHlPgdB+9f8p
 szS3+JzU+SRVsx2+/QrHLbtPut5qrfp4KZG4cKp8bmtiCHBWi0AK3Szkiqa1lI2ryyWfXR7NUNi
 nFvXkCZBWDAEAMtpSmf2piXb7jGWjJp9/PbP3ComupceIm19yUm5NzDssJaj93os6ODNiiUP
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684b4480 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=8TKXt+tWyFtBY9WE4KDEmA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=uKUkM4gl_lyc4tR08vMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8PRE_dI7_4_s7ZRrAaLW5oiOdQSKnfJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120164

On 6/12/2025 5:32 PM, Jens Glathe wrote:
> On 6/11/25 13:15, Akhil P Oommen wrote:
> 
>> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
>> version). X1-45 is a smaller version of X1-85 with lower core count and
>> smaller memories. From UMD perspective, this is similar to "FD735"
>> present in Mesa.
>>
> Hi Akhil,
> 
> when loading the driver (still without firmware files) I'm getting a
> speedbin warning:
> 
> [    3.318341] adreno 3d00000.gpu: [drm:a6xx_gpu_init [msm]] *ERROR*
> missing support for speed-bin: 233. Some OPPs may not be supported by
> hardware
> 
> I've seen that there is a table for speed bins, this one is not there.
> Tested on a Lenovo ThinkBook 16 G7 QOY.

Hi Jens,

Could you please try the below patch?

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 2db748ce7df5..7748f92919b8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1510,7 +1510,8 @@ static const struct adreno_info a7xx_gpus[] = {
                        { 0,   0 },
                        { 294, 1 },
                        { 263, 2 },
-                       { 141, 3 },
+                       { 233, 3 },
+                       { 141, 4 },
                ),
        }
 };

With this, you should see 1107Mhz as the GPU Fmax.

-Akhil.

> 
> with best regards
> 
> Jens
> 

