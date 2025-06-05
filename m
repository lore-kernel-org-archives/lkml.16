Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94AC4315A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141662; cv=none; b=aXbigEQXOU5TynGddPv5BSYfil/Fto0/6j4AKov7jd1Ekr5jXdTP8KSaHAX2Mze+V/xcmBbMbmEO07jsVGL2KE1cFRD6mN4QMt3XTTbyADbP0/sZ/wawe9zExwReUxwn8rjEzKHmKshAdJqLjB/IgWgjpRP8uh5f/NpG3j0WXZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141662; c=relaxed/simple;
	bh=U+1dO+TmDkrsbPY3184pD3AQDFkCQ4e7YtqnnBaM70I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O8VjlzAXhu2QjeXUugXOfXHTQVYfglsni/FqDK92Mnb0OUdx9y/qthVOK4Q7aA2cwdiNeIMuzxS88PeRnSmhvZQOeKnVrjwVGpaH0BnHQpfwZs0qbQoQNHhuygewBxgmWpbcA+wSIqB0TCE9hlFlH3HzfC8aZ3NNrxI4l1eYpx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUB5G4tK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUB5G4tK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5557FLlM011984
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 16:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7i0HN4nYaQ3I3pG/28oO1Ds2OecBTsNdW5PcXfaTMdM=; b=iUB5G4tKXLw+/hxB
	GvWo1i4blXRZUvN6kKRwXD0zAh2JN9GfylEkmpyXlPlvfkXotkMOvTPbCz9pJxkA
	orQaL5ucms3fOPc4cv2GKhEQpAxRMOVe/rylaAUgu4oEdqP/4Tej0+Ifw6Ddow5M
	m4yxtYoWT+D7hfvkHR58kAc6+teN/10S6zagQYojgW521fX05u1PLtC9Vgjs2DbO
	kSnaZuKHwCh+fGdrJRRVhQBdAmuMzYDEcCscAw/Ml7RJMzMIAFsOM1YmcLX8/hJ0
	8BPKgq4pRYLWiWpYaRvGoAMcgESfSTibg32k8SYCspM5BudUL6/hlmKpUjR2lZln
	aUlwbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yt0cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 16:40:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so186396885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141658; x=1749746458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7i0HN4nYaQ3I3pG/28oO1Ds2OecBTsNdW5PcXfaTMdM=;
        b=KTyYlMRXl4ImbfLHd8jU6caOCJG7JGVz4k0X1cKAhaYLNB8GkmJli1Qj2Lj6Zr8txY
         hl/hDq9B8nRmlE9m2Yp5R1zd2kmxqkm/afZnABJH3yWO6D1LZmlQbtEfSa7+TkEP+Kci
         rVpRMDrRBgBmiJ5wNQQqotnAk/2b2MFJp4LDA4uvCuq/9WSe6K7B/ERtDPZJ+zHvL5YZ
         g+VISzvWaP6Qe+aZCLdjbbnJBk4Fao4+MV8XgLZG6obzcC9/zLR8aCnS1Yk6jWBYEyQk
         osCSS4f2ANDAID0e8hcx+BRPH/vKY/zHRPb+b/HrjFmY4gfokOY3bGSwmhGHDShURmP8
         ri6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV86nCJJ+Qz1KYp4L3CLh5yz3RrT7aI5gf1m0jnfyt3TRN+ghD5EIQY+VD7K9WaQRtjcjpqk3GhPhn/Kws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKsh0rSGZsrZ2aKI2knrjG/xVWmYlTmybmtfGpfiTkZC2AwvGW
	eRS+lz33rMhi/dGGeV4zRPS6NRC16Nxh03fftJ1fsNx1bZnc2bXY8SaRSz9rwG0v8AGFzmZ+wLb
	A8DmwaM64uGU8A+uqVJry2MrMC6sIDZzeYXvtxUljoMaMaAQUq2BAZE5Q4RiGPzAqEL8xA1V/xU
	6AOQ==
X-Gm-Gg: ASbGncsJ1kkv+uPLiebXsT0CKYeR4ZSEblP6s48k9R1UcIYeHpelo6Bg3T2f0zHJsEt
	1/p2A9p9RHYBnWi3UN8JyjI5QFbLO9y7jWCVdHX/QjeezQqYRDNEfDp8XuyLOoEQ+o50vxqRjug
	GIAmKMMq8LBNhqrhhjm0vXWxLy1Un0ZcLjLHa9KBJXfA/L/uwXA/2jJpAVZdyrxW/q6/xjpMH4X
	zEhKzJMYxpA1JUr/2rKab1wSQ6IpKzyr4yKM3SKLyUIohUnF/6B77uK9ShYogLNe33ykmcEwf6V
	POHntgNTAC4N6ydPll03dUbsL2YIhB9wZg==
X-Received: by 2002:a05:620a:318a:b0:7ce:b7fc:6b6f with SMTP id af79cd13be357-7d2298ebd51mr30535685a.58.1749141655802;
        Thu, 05 Jun 2025 09:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlphq5hkywbvQviFl7ytOJ+kdQCQdXoWwJL5KNPil4LyJI7BQX8E8fziuHpoPmIVJagdJoCg==
X-Received: by 2002:a05:620a:318a:b0:7ce:b7fc:6b6f with SMTP id af79cd13be357-7d2298ebd51mr30515485a.58.1749141653618;
        Thu, 05 Jun 2025 09:40:53 -0700 (PDT)
Received: from [192.168.23.80] ([87.224.39.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb22a332sm24378335e9.35.2025.06.05.09.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:40:52 -0700 (PDT)
Message-ID: <5f912b5e-6368-4234-8a37-db72be222ee9@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 17:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
 <a3bf69f3-6500-4e45-ba34-8ba24312938a@kernel.org>
 <CAO9ioeWkLu+ne18kjEST7YU7b1aBzcMBBeyfpagzis99BAeOHg@mail.gmail.com>
 <b710e357-09e3-460e-b097-28cf0c856aeb@kernel.org>
 <44b3779b-702c-4e8b-8ccd-c9c3314a511f@linaro.org>
 <nr2je5ssn22npl2dqu5aj2xcwinnjmhvl3tvuz5smr4dd2rxaj@dfkk6aktkafy>
 <6b09348e-d920-4025-9932-6c861fd5f1e9@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <6b09348e-d920-4025-9932-6c861fd5f1e9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE0NyBTYWx0ZWRfX4qKO4ge05XVg
 migeSE+ebs8PwuRwNnycOhKF3lWY63VlHPvGw01dK0iXgmStcXuVViqrqnFMOQWNzb2/41zkLt3
 Z154jO+k0X56qmzSXGHgTPQ/Clq0CO3/m5VvGmx94VNt5uPskOgjPcmgwPYbdMbxb1FGB/c7jp0
 CC9/LsNvF49VgK94nGxACeis3MssWkeiyQcs97FExCDaQnz+XBn3mz4r7wtfeYkAJsJbtsZeR5C
 9c1dPsDBYnoSOTX2NFG7fg+MRG3Rtzm+qu4ylqjoV3Hel9px0ITjLK/aUGiHFaQhVS9Vv9WmPH8
 s7K5+Cy5xMgLCAh4btBsexsnctdYJ5Kmj2lbnKnHypzq4dty96R9o4AiuAsPIjMPGNpZGDdXsqf
 HMShmGNMjmQQWx60QZagejyCtf+kCkX3VW9gHPv1XXS1MjOdsrUhbpOr8XINDCfp5tiICHxb
X-Proofpoint-ORIG-GUID: OoOcmZtTUJ5KI3JOgdYvjXp5LGtIx8an
X-Proofpoint-GUID: OoOcmZtTUJ5KI3JOgdYvjXp5LGtIx8an
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=6841c89b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=UMobGI8h2IAScYPZOeRE3Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Vu8oZAHUrI8RjOZTgO0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=682 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050147

On 05/06/2025 17:39, Bryan O'Donoghue wrote:
> On 05/06/2025 17:02, Dmitry Baryshkov wrote:
>> Please correct me if I'm wrong. Without driver changes from patch 1, the
>> driver will always use frequency table from the driver itself. In this
>> case it will be the frequency table (and corners) for SC7180, which
>> would make venus driver overclock the hardware on QCS615.
> 
> True.
> 
> Yes, let's apply 1/3 and then re-submit 2 and 3 once it hits -next.

Not enough. 1/3 should hit Bjorn's tree, see Arnd's rejection for 6.15 
patchset.

-- 
With best wishes
Dmitry
