Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C9DF59
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890103; cv=none; b=G5jfLWzItCKdhjkgqZIkLJfNQOekY6Zqt0+IAVFtzcjPcaaDrOOsafuotx3cUqFyWwN2paTBBzhVqUdQv2H580onKkT3HdALMWtrakLmtfFsYY+EPUVXm+ar7JtBMJgHGq6MFO+9fkq1kcCen6Z/rmvyVTEoczFTph+oUpMHr0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890103; c=relaxed/simple;
	bh=JZo8UVqJRmNJzDbf3oQ5DpO889Stb2poHHW95w5J59g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soEzPU01SaFDdZzx0+l1oY0bFRwqntGdTs/t7zaeR7wuXBnNsdKz7ePEzNKgmmbCnVYx3iz5m2WXNcbYUM9D604RsH6JADQjY6FkzhwI2QohO4x7pKK2h6KdJYYF5xCMs43kGYba7l8Tz003qQH7Van6l5J9l4nufp1XYnVskvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7MTAYN4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7MTAYN4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LI9P8G029111
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NguXm4WSpZwqx/Kmkhi3HpZA4psVbbg60toSxwm/2O0=; b=k7MTAYN483dQAOFt
	s/oWC7P/5M3KlMd8ARsGibdvzc5q0Qw+filZYucDDzpw7+vtKHg0bT1FKrEGrDma
	ElgABAl7Y6+iIiZVGjkaJKEZbh7tS27RgdbMvhyqlZrf41gNxyiAs81G+bjJEYyd
	ZlA0i8Bri6dZ8HJ9AJFXfWezEk5tOenlitwDnC9pSgB2TrtP2wCLQD3nT84zFXOs
	Njrv99lb/Yb4B44hg2NsDTIUQsNkqfQZO0uOIWqSUt3bL4W28pIpTcIi1pN3xBc1
	LUMq780a1L9tGgwpw3WvAPsE4SGXbm6wFCPIBsP3tliV32ZGuu2xjlns0T6etT6y
	L1o48g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf45477-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:01:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30f01e168b9so3374517a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747890100; x=1748494900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NguXm4WSpZwqx/Kmkhi3HpZA4psVbbg60toSxwm/2O0=;
        b=it2V+5yR3xrpmI6Mz5ERugoaV/zeEiBdbZoSkbNYbkmLEojRzeTIIMEfW4l+lZAd8l
         cWADT1ylqqaHn8Vvw0KoMf1oNa31F3z9MzDQLeyFG99n7Y9+YPsJQOfqIPS7sp12WhGa
         gdOElYN6RkUQZNdQi4lWXBr8z5NyLsBojYszodGZE/5m9c5u7IPVouC78QM8Ix1GhkNg
         HA7C7iptG+wZd5DuffKNQDMbqnW0Nv4E/B0Dv1e8JaG8v2GdJfDub95dlalH4JlMg8nb
         uBrhP6QMfJum7ioe0O+bkEyRxVPLr0zQ7bGVwE2IUK/OZ9I1u54a6ZHEi9u8/lJNlCZe
         g+GA==
X-Forwarded-Encrypted: i=1; AJvYcCWfTvkSlP1tvGD5XuzdM9eIM5PXr5oqel4IJzQee+OolkXPfsAEHip6IU4fVcABwYkD0u9hxij6jHSDInI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMVbmQADbc0HnIKCwoeO1P2H/eWjmm+meDcTq2DLsS78zQEjoC
	V9PIF4uAdz4JxaXy41mmc9MrLlAz7neb/A1iWr2IBVSw4pdpk4hvxfa1kwCK9ycqBfv5gn0VSkk
	IU+9rszWEFdIpF98XXQ+hMzGjp5De4HReUyc6+qvEqu1mgasa7prnGefS17cSF5AOKIU=
X-Gm-Gg: ASbGnctF8aokHnA5a2Znt3y3JbhBNaWLomp8asrFRUSC6D+Z7LESbb9xYDfltyBlhFU
	Ie4wdVjWbT+jIaDWX0Lr6EdSny+7Uki/xSZE5njACcgrtvyET43WKWfvuznmCOFXyDssIR05ORf
	qGB7tG5rM7wDF4K4xvyPJiJVAH4RrfLvd56eoK8NsIpdcAUweJ5+mBBqgvCfNcNuULGryiPxXCO
	vKP5sbjnn4R2JTplFsTXj4frT1FetdadnT1pKf/HeLXzc/dfs9zoje4mVumKcZlXotKj12JqUKe
	L6fwI49ivU3fVviyZq3iBVnEumvi5fMRbdBzw6c=
X-Received: by 2002:a17:90a:f943:b0:30e:e9f1:8447 with SMTP id 98e67ed59e1d1-30ee9f1850amr16977028a91.4.1747890099957;
        Wed, 21 May 2025 22:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8WP7wi8k/4svaSUleZJvoLTwWHT3Rb3bGLTRbKSE5yOdFgLg+Fxp/WkOQUjL1YK/uYfk0iQ==
X-Received: by 2002:a17:90a:f943:b0:30e:e9f1:8447 with SMTP id 98e67ed59e1d1-30ee9f1850amr16976988a91.4.1747890099336;
        Wed, 21 May 2025 22:01:39 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36491d85sm4591925a91.29.2025.05.21.22.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:01:38 -0700 (PDT)
Message-ID: <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:31:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0NyBTYWx0ZWRfX6W7QwAzSOM/K
 yt4ITivfbhBgu8PgnpaflBd3seR8DbIqbu5EbNGwVDAU/qpSJl7zTfAzYEc+LQs4Y5LhsqNNUmN
 zz7DZyEd2NmtNj4EMyq1RCI4UeeTMbiO8N8+1EMLVM2XGpjCWzkcIgfTpUBw4rF/l5CAqsp7POr
 aSpjjKLLLwvOLxbUxvAgs5YLClah8mwpHiRPVbh88Qp+UKZ4LXHBZPi8y7Fa95MfNWeMTu7LGPh
 LKIdOTUeZ7+PSNfKjdoDvlzfVHs/ST4aVo6OkqIWYQTHl1WTxyB30CxpVxdwPGta7WTCHWg290P
 QYEwK7DsxqrNeW4Q+r2G3ZMKwH5ljErSa6y8cZELgCI7PRc/BmAk+kxnuZlBB201ld65CFY7ubI
 cy9xCQtdhxvDcmpAqT3B2vRR6XhwvnMSzhzAL8bwKXi+Quu9XFukMQzWd4MJIX5k6mkT0GSy
X-Proofpoint-GUID: NL662xATHIyt9Crlkdv-9zvcE5yl5RX_
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682eafb4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nXvCle_wObFXJBZB-yAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: NL662xATHIyt9Crlkdv-9zvcE5yl5RX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220047



On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>
>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>> User request for remote heap allocation is supported using ioctl
>>>> interface but support for unmap is missing. This could result in
>>>> memory leak issues. Add unmap user request support for remote heap.
>>> Can this memory be in use by the remote proc?
>> Remote heap allocation request is only intended for audioPD. Other PDs
>> running on DSP are not intended to use this request.
> 'Intended'. That's fine. I asked a different question: _can_ it be in
> use? What happens if userspace by mistake tries to unmap memory too
> early? Or if it happens intentionally, at some specific time during
> work.

If the unmap is restricted to audio daemon, then the unmap will only
happen if the remoteproc is no longer using this memory.

But without this restriction, yes it possible that some userspace process
calls unmap which tries to move the ownership back to HLOS which the
remoteproc is still using the memory. This might lead to memory access
problems.

>
>>>> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
>>>> Cc: stable@kernel.org
>>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>>> ---
>>>>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>>>>  1 file changed, 51 insertions(+), 11 deletions(-)
>>>>

