Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3F8262800
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030346; cv=none; b=Tlei+XM43xafQgoG8pANG+34m3u6PUfABDlARwVaxr0qK1hcgTaY8iH6adNO3qK1V3FATwHuEcLrR81hHK/2QmqVefZ4AWloVgPUV9aD2UW05KBeGoPVzY6/dyniwoBwTr2TJEZ+8LMJvWOYU19XKdPPkbWa3Bc8RXe0R2/Y664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030346; c=relaxed/simple;
	bh=jQSNGpxbiy5IVl/2fB8ymxWQr7NtfPmh/ce2dT7Ir1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gy7l1uRpgSVLJPdSJPF8AjVXK9FLKd4to8J4lmwVUu+Z4DB2DMsCsb9JcMA5GDTvtRcPH1zH30mJi6ksxNylZfDViKOD5ClOd8aYzp9pBz9aTJ9DxzaNp525wicP4/KlVJ9kbWTeHzDjIQ3WwMWMkuRDElk1o45DpOpdUbV6y/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ampATIP5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ampATIP5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9Kbwn010498
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HB3+gmI+ZUjqI0EbN6CC3IxDFDjjbTNSLHMPATn3Z7E=; b=ampATIP5DmHRxSg4
	iPiUpHLI5jzJ7/fxepbhbJZcUsMEd6i0GwAfIXQZluBqewvvfU9RM7xeKlcEes1G
	8hXP1aRm15zFAG0c93TFyfxq7g+UKgfR0yz3zgSmFMLpVfscFDFBxHkauEHOsiYp
	Pt70VYRSsdHJ2yqrjBjSb9WTrvxWOOxnlqZQIazV1yEz4B+TnsYWZUbkFQqpeXA/
	H91sOG7BC9t3RVPbEUfkqbbSCS/Bry8mbjnzRV+g6ZAR6Z0Nf8DrnBYrU3qZLSeO
	xjIrLVC8HRXDEQe0CTNNRMMS/YZjrVn0TGgW7znvyqrGA/9ooDHUe42+W434pSgf
	Cy8qLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uatt92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:25:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeeb7cbd40so121786d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030326; x=1746635126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HB3+gmI+ZUjqI0EbN6CC3IxDFDjjbTNSLHMPATn3Z7E=;
        b=NXoK39z9VkzD0iw0u7EZ/FkQfVdF3W1IcerqtNQ93SMDMWhQYXYqm4Y6xR3+pHtNoe
         lq9CPLr8nfVW4zN1y+QRXjOc3H8QM0bkHjbxFLFm1HlpSTw20LyY+XKFso1aP15zMlud
         OBcaoMSoBnrydsc4lrC2xznqPnr8lEY0h3J972w8Qf5TTtBbfEmZhFBrOxj6Fzb+aszD
         wef4uqpJ4N76d8YUY416vwSjvb0VFTU31BOCgssrGkT4B7lmC6rkDSpn2GbRbgz2rpHK
         PGgDuFM425LsumRi4EKsozhxOnvFetqqDBs9x+/H2dww2Eh7+YhkO2TRudBzC8HH3/I6
         RYUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaaRrlYaucNQp1qXYovkzM7tp9P7XRk5qfZOp7DYCIUHO+oimKzZElRFNalUbnwBbFU9GlJP+rQ594pHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbursRJzNMVv1jDQ+dje6PT9IBWK7TolKIhVNhzmxaXTj2NUM
	OuT2fA8A/4zkWKANQ9i9WEldKJLYgdU0jOF/+aAahxnJvQmVFeCkrM9zJCzcPUc/F54JvRkCZLI
	iC3sARs2xONH9tDvIvOnmuYHWL7zDlKUYSJhfJHzPwHHjVKuWaT0q73Mui6WD00c=
X-Gm-Gg: ASbGncsz3AT5dwfMWVlTA9fPjAPARYi3zfblWtJn5POD5Q0ta1VepzHG9jyyohVuRCd
	7RM+rEPC+UcQYRZvOgutP6ByQ9rHvJP5HszVG5HIkeiAxZ425SEYqKc7P5VgtxFuIykP2cBF/r2
	kH/djhM/a29LhNTKwSpOBzLsi0InA9q7I0sb/cY5otQVIQe8P0kHS4FJiGPLAS3YHDNIZrQjucI
	I+YjrKs04xMuLfZ5usnzxEj5cVRpfg/x8EYvjE4Mvww8ouOpvfWF58ddjso5NGBEJvmJYVaLbSF
	ughHrHoeR7M5lC8gf59/G20EWpDSbaQEQgGdLyGfQAwKzBeVuogRKqigizeQZay4VdM=
X-Received: by 2002:ad4:5c4e:0:b0:6e8:f88f:b96a with SMTP id 6a1803df08f44-6f4ff2d2924mr18869756d6.1.1746030326561;
        Wed, 30 Apr 2025 09:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxD7HkUdqpnN+OfcCIzsrbn5QNU9jNDG0l1/EVlSKXcQll60BAsotjGUkxYzwFZKHAhPp+vQ==
X-Received: by 2002:ad4:5c4e:0:b0:6e8:f88f:b96a with SMTP id 6a1803df08f44-6f4ff2d2924mr18869466d6.1.1746030326152;
        Wed, 30 Apr 2025 09:25:26 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70354633asm8799526a12.55.2025.04.30.09.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 09:25:25 -0700 (PDT)
Message-ID: <ee44260b-13cb-4901-a073-2b9bfac2a794@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 18:25:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-1-954ff66061cf@oss.qualcomm.com>
 <68a2cb9d-4f3b-4bfa-81c3-2d5c95a837f3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68a2cb9d-4f3b-4bfa-81c3-2d5c95a837f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ot_RgHtKuzj58vgRNyUjX1D0mCMS9t2S
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68124f08 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=h3lbVRRyGfeKgUivn1YA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Ot_RgHtKuzj58vgRNyUjX1D0mCMS9t2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExOCBTYWx0ZWRfX4VKFRBrCQRfj ARcCZf9fz54QyDllbz8fe2K03gHpr5ojV6IoykxUAA4nmB4/FdtIOnIppneN7bUWUGpkLwP02JI sm2A8n4O62E61ggf8LebZTQh0jWy1uoaZw79blOFfSEFqM4AGyDRqHItjjAfBlHDODwFDKt4hcR
 q88dYoCVuXrNIxD4oEusrY024W/jtULxNDfI0zT83FN51TBUNv82BxrAfENPSoktY2uXNx6hsRV ZVYTCpNvzd9CmYz9BO/7vGPIUKRDxJs1uq3hpR8LAWlxjG7Z6tmsVwX4Ohs7UQcDhH6Tn/CJqk0 ttVFWDOR9gQIjpcSCY2pwgQsMwzFpdcgbZsLQIDvV0nW3u7QnJtSeXyAwkhmnG8bSB0UQeLmOe4
 +qFcvW1Xz11OipjLpT9apIKQpocn1DzkfZxNt+vhJRuJOsPI1mAE+Nu6LPq/mGb8vYWz3CME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=797 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300118

On 4/30/25 6:20 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 13:34, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Due to the product code being ignored in the context of Adreno on
>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> 
> This should be SM8550

No, this is 8650 to signify that this holds true even later
Looking into it, I can even say 8750 here now

Konrad
