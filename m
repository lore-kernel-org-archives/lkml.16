Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E961F4623
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253384; cv=none; b=oB5UrzLd29QE2QuRQCS5z3cb2yNDt7JbdAWUgmv3jd8S5El5Q8WYVGcu3dcz55XYLurAJmXUZZDRZ1QKP+/npmuyvQRcSo8BoZqSmcju+gmB8hnMwk33+Lo8qka0wta+fNM4SuYKI/GOiqEaul72Bu+/yUICnTjN/VnWoMs8NGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253384; c=relaxed/simple;
	bh=Cv/0x1QEmcJ/ZrbtCeY2Wt0mcpuBRxw6d5y/GH43UnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ndz9BNpTTiS8h6V0c6KGMb3HTPq2Ervg5leBfNV6vbjLTELDZFUHN+jMV0bnj8wy+2PSZQQ37LBeBojvWveIWzGUWkAAipKSA5l3LxXJTECPOqfcHE9q0EMkiShaNIxAE7CAODENKx5eWsaCU3bE/wXcupjbfLitHeDQivkg8xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgCga231; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgCga231"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvjp003051
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ErHYKqrjqGwFflDIb089xZj5i/12lc/EqxqpZ5nbz/o=; b=pgCga23114O6VmmT
	itotjnT8ZAnXLMXtS6V+JeP1LinD6vPNywmC6dtAODpwHvmfbc92o7bHjC2PtG2H
	FghtV4lUgZfQCgDYfYXFhwo29/S1KoEQC5TI7ULR1vhA4452EGBZhJO3ca1YJvAC
	gLRDgZT0SX6lbShChAd2a6yr125LDFdWX/HC6zlKb5t3qg2ksvP6A/Og5Z7XZu8G
	ykqjCgbVTtioBZloyWbO9XCZ65N7k4nG8r1+Bk4aZYZ3JveBDC/29vt/V2jEg/Ec
	pgAF8QzG+RxhsRSDlb0hh+ogjUwO8m3N7dd5u96qfKh80zA8ozWPgIvzWGLgVlWF
	nSfZqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrbw8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:09:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5466ca3e9so2612185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253379; x=1747858179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErHYKqrjqGwFflDIb089xZj5i/12lc/EqxqpZ5nbz/o=;
        b=FgWqW0z1/Tr7I1ZeN8MP6zNPgtuR/e8EtT11GbpuMqxn75KXQfhN6PNDr/kGCq7zRW
         oNoshIIHmCRgjRFjbd8oCz0ZrSgjk33BDNyHgKExoSPiHNkC6mtjPPs5rEdxFD28x4DB
         mNxVYve9R1vCmUnVmX4sxkNU1dazigUgn9cAl6XrVyHnUj/TLWPTJJL0bgsy6gVInz8y
         lZbGs2C07izeCnpyWTQsDZNsmPsYIGitJMCBjWOg+loL+qvQLeOsb9mYFdltRq2SZ10O
         EtrhxxsKwM5yoS0JAUka+IGs9F1uHCJQjJBGU3ZgdE+PDTZGBRy96FGhI9CaG80X1fFA
         wS1g==
X-Forwarded-Encrypted: i=1; AJvYcCXBH6KDfBPlKNSFPV/0T67ng9+vvYVwmGzceq6n65xTU4iLvQFObaJVfrtRWxEy01JzDYwYDTv9TtuIocg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpTtYB/VUIng7Y0aIR9LTEOojQvWkZ0Uq9V+hvv8ixBf9+ED4U
	JJPNPajvPGepy0O777Gau4izJ27FtnLPu1of3zFzMEhw5NRS9RwGiLiA7dchCvLZcJuqTE1DG4f
	wciqIIkO2lg4KEl08slG5kUD9SgTwRB5uNCVsB/Qi0Q1FAgLkVIPbx/cZrb/z4JU=
X-Gm-Gg: ASbGncs8UM0PBA4IuY3ZGqEsHtqPZEdzH59IYMQWIg1/xz8MG/sUaww9+MIq8q592Da
	MC9L1OSTRF5uICckioNoeR0H8nKMv9zsTms0sQ9eOmuXy7VX2GjMxael6KXg/Vp5c5hPYRswKmQ
	5EcCqQdMG4wNPg9gZ/veRhdrw+XXxr/nsGNj1YSGaibJwsG/RsuUbUHzUTgAHHCdmvaHSzt84c/
	xsiEo7lS/X2YycSW6tdQCVoRAUpvwbOjlZqoTFVlbqhSUgRvsT+dAn9tGcji5bpuoNERLprgIz6
	0Jgh5tqCX4PtV8jnDHUVkgvZQ4rI+NP+rbpRrRt9rkQgR7CdObCNeQ4Qx1s4RL+KaQ==
X-Received: by 2002:a05:620a:800d:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7cd28891479mr285548785a.14.1747253379265;
        Wed, 14 May 2025 13:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwKpgjaIiOI/zTR2/+a7CEi24XetgHuJRRRaRXDCR27dZOWaJhtL6Yv8ouMIjlIoQO3XAK8w==
X-Received: by 2002:a05:620a:800d:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7cd28891479mr285546085a.14.1747253378789;
        Wed, 14 May 2025 13:09:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fdd088798dsm5606403a12.13.2025.05.14.13.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 13:09:38 -0700 (PDT)
Message-ID: <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
Date: Wed, 14 May 2025 22:09:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
 <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wv6qE1a89_d8zRM1I5tKbafcVkCclBhr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4NSBTYWx0ZWRfX62Q5ZSWqyRGz
 RN04O15TO22xlpIs6bGfnGoyqIZ21+/+ImG6y+TnEfH2hi1h5h/+fQK8ti2l+B60iABvlB9FoYI
 o+lZvqO32fxw13Hsfr4ddWJ+aD2eLZeixCP41ChY/d4VRKGvQ8J7AEYnEB+TrgXfTzSqdnoRF50
 u01iTyDUUfl2EJceoirtNamBiVMd+n30e/RWaQf7+fgmvkvqD072+3qEewPmLvZlB/iHjdTqAi0
 70Xq8Uoug0cx00uht8Fn21umiaW/LWPcRqUpmVpS4fAoTM8VHeSR3hqkuso+LaxcQV33HRnMfKY
 cezOKtJG/7sL35EsqKue25ZAOePy0ZV6++6VX5qbdFaGiRZu3mwacn2F4sO2c2TDPiawIPdQzEc
 i/gC83ZO1A/1bq1AszU3j8Qlni0/nAOxV0kJJY7uKR+iRbqBkSM18naS/Kz8K58ZM4YAZ3lt
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6824f884 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HfH8O6Keqri-gfDeQOUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wv6qE1a89_d8zRM1I5tKbafcVkCclBhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=820 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140185

On 5/14/25 9:24 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Make the values a bit more meaningful.
> 
> Not sure if it's more meaningful or not. In the end, we all can read hex
> masks.

0x1d7efc35

magic constants are no bueno

Konrad
