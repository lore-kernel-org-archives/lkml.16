Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2B825EFBD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359338; cv=none; b=TQE1PAMBIdEDOYZFyBdgJKE4kSZxUQxTDG91YSRzoyWBzLnRcy70+/UEBm5zXJTmjQsY3wHGtFqbLX+t3hdrt8rLgaKVh7EHK0spJBsYBFAKeZrjE3U38vne1Z5ls6DpZ68SfcRQP0uw32ffJ3o60ri9efzMZ8ljjujSdBNKBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359338; c=relaxed/simple;
	bh=RVVKzcxnlx7nOWu7Gu0pvyl7lRMUct8fsNs9VBvYeW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q49LUzx3kggHzJ/j72qdMkV7cVhxDa/GIU5hCXSlR6vKfGHyMzo4zA0GGgLzEIfsWuBLE8UE36N9D8T0wS8o/l4DghNEL2g1AE2mM5jLR4CY/XoCcv9A27rxXawFZpjnMlMyH0210dAhUfojYQqbHQSU9pUowyFgsa5TIF17yjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKECikuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKECikuy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5616pnPt030208
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 08:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tutfviu70uAl7UTDUY4zJ/1EBwlos06c3KUfZrmg1A4=; b=XKECikuyYRU+pWA3
	Jl1M1QpC33RbExyX9FmCh7NBXBaJpQRHu6Ua+DwurZkIHZvzI0v0D6Ezp9/Y5yCz
	isJ4Wfu0clSXCwmihsCs2xvVNS3m1K2tWRLgNqQ0DY/BDZP+i+m2918pDQCBbR2y
	2rP9DaZzRJWuGZREs+Agl1o8fRPpcqQoYJQvzTaaUJs6gwxcOnii8Fq4zHH0eP8E
	9ZgGbjVFl+5evPyuxtQgcVJYpHdxu41tUvyfptDkgPhxdjgzkXRalmBH/fOZIsWg
	RA5/OGfhuIcbW0UH+HisdlrSzwBcslPJm40BFPXwGN0hvW9RsqAaS74Vy78/2tjt
	TpsBpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47m02v1y0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:42:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a824fa4c86so341671cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359335; x=1751964135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tutfviu70uAl7UTDUY4zJ/1EBwlos06c3KUfZrmg1A4=;
        b=sj3pQOremc/3HeuozRs1QBL1geX3U+VPkH+GwSdac1JRPoB2Bf9mox2xSQbOelzBDM
         oG6FQNQHjRmnBufSM1DTS7iARjybAxKSCtTsmS7F8CAYhCtTNVqHnh4YJbdLsx+AdMhE
         tGlwHYVZnsp93gCsyJkRYaC2L6a5wRnFrBOlWg/HzIITF2yjBgyeMnnBE1hjYjWPvTSA
         K7vwQTnTGO3UvsMhmSgKIKEvFJSPZZMwLT71hi8Agyk7/SKyUl/RPDiiwA8YqhA8iqVD
         Jeb20hFLL6QcPD4tX0Cwh4LDryu5KtWtUl7POXOPDdRRaJfH7iBsfTQkEISgIPy4mvTM
         xIHg==
X-Forwarded-Encrypted: i=1; AJvYcCXToYUJby1GpgaQ7k6tupjGNSGZbpve8T8mC2fRiVb+94Ny+c88ZCHYAR+DGz2+ZUvBdW/sQHYE2f7QwRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9z4UQHRW/9gEXbTRYxDFrpFFBNWrQ/mCWB9CuuYO4073+V6Xj
	P6HlwMAWqFUb8/OKKmSi9bn0353EC+2YvQ5WCJDwwcKgkB2jyAIEQ3TUIfgf5h4lZ7c8DwoyJgk
	VvbpKyn0ygxCk75gQAvHnzIR66Zx6l0beHusTW7Cz+HlPXcUSvXHjm7Tho/15dnXxnnA=
X-Gm-Gg: ASbGncudrfKvHvIKb0pVEBoPgtG8aZHeeswsJRsQ8NlqWRjAtP/IIuFf8aCccXKcZig
	kzfV0YDSuyJ/7tNDMXqbFnNLIOcrTUBuQezHgv4Jbwo+RduNkjOgoCvyJLVWpqBagtDw00dx5aL
	MqA7XX+LTKqJB8fu+IVA6HBK+yhEIiDaUG+SllKZ6eGSSQr3POjBE8wUajpzfphEXmKaZFzDEqc
	afgA0tzw+a5AnGjMqgasATYRQkkAw3+wjvyS3rF4z4w3tSlVOtFe3KAkn4sTUW0rKD9ncWXJ0rr
	1+zjxWEaOEsYdu5t+P2X3tvQalPlHmNKy/UvrhNk3hSzatlwI0iROCPum2UxkCzEPt0QNQbxG3p
	gq+ux/urX
X-Received: by 2002:ac8:7f0a:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a82fb4a7ccmr13336211cf.6.1751359335189;
        Tue, 01 Jul 2025 01:42:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIiylmVmPpd7FS2xOPQGYFcHkmg9ybF8Pa29w5MBFMzjhMUeUBetWA8IVnYLdjBQ6zWunoAQ==
X-Received: by 2002:ac8:7f0a:0:b0:4a7:79e1:cd54 with SMTP id d75a77b69052e-4a82fb4a7ccmr13336081cf.6.1751359334787;
        Tue, 01 Jul 2025 01:42:14 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae362cbf19asm736054966b.128.2025.07.01.01.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:42:14 -0700 (PDT)
Message-ID: <59f46b2c-5966-4ec2-89d9-305ca52f5111@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 10:42:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <6c5d9ff2-fa59-4151-99fe-3bddae46b507@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6c5d9ff2-fa59-4151-99fe-3bddae46b507@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MCBTYWx0ZWRfX70SdxYUhffbb
 /LFqSiN1CsepFTs+uEpuUHLiRoj8iqokICy/aVGtPx+pL+C6lQFg7CNOgtrsteo/MF9qL1R9aqz
 bqMIYFhVbMxVvb1zAZaQHKjPB9lUVit8U+9Y9bIa2HIL1CzRPZQ+vU5Ww1nJc/O8mz7aRW55lDG
 2w/wDQzbWIxjSHEnc2bSJaxmBMq2qI5skfyu7c8s7qGAN0+yrywUud2skZVhk3clsOhoj5rotcf
 Wo1HVcR6iNWAZ32OuUkiRZHcNOs1pjQUdFmifBsBt3ebKr8CJN8ubqoQFI+7ViP2BDglmkZUMwc
 W6h730GI/6IQg38XZzwZ/FHqmtb1Qp6iy3mU/xJkpuEgNwTjUMvP172pMAx7KcVsrVn7usCT9qV
 i2NJZjuuaAxAQ3ZovcLWQn/m6B+kGFDL5Ipi6SaVBLeN86aUmALbibKS0KplyDZoc5NoNmvg
X-Authority-Analysis: v=2.4 cv=Y8L4sgeN c=1 sm=1 tr=0 ts=68639f68 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8
 a=FHDPKuC8_rlVOAf1JN8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iv5Dix9rAo_T-v1Fwwjq7IS_JiiLhTy6
X-Proofpoint-ORIG-GUID: iv5Dix9rAo_T-v1Fwwjq7IS_JiiLhTy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=743
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010050



On 30-Jun-25 20:04, neil.armstrong@linaro.org wrote:
> On 27/06/2025 17:48, Vikash Garodia wrote:
>> This series introduces a sub node "non-pixel" within iris video node.
>> Video driver registers this sub node as a platform device and configure
>> it for DMA operations. All non pixel buffers, i.e bitstream, HFI queues
>> and internal buffers related to bitstream processing, would be managed
>> by this non_pixel device.

[...]

> I tried the patchset on SM8550 QRD and SM8650 QRD/HDK and the system just reboots
> a few millisecond after probing iris, no error messages nor reboot to sahara mode.
> 
> The DT changeset for reference:
> https://git.codelinaro.org/neil.armstrong/linux/-/commit/e1b3628469c038559a60d310386f006f353e3d59

I think that's because of the majorly suboptimal 'define disallowed
ranges' approach with the iommu-addresses bindings.. 8550 (and most
64-bit QC SoCs) also have DRAM mapped above 32bits, meaning you'd have
to add a whole lot of boilerplate to disallow these ranges as well

Konrad
