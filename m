Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1386D1632D7
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747890584; cv=none; b=uO+KYRX/mlYqYmKwFKj5VawW6/3kfmxZAUeQgqrlTd6IYGo9RfDqlCK/9PlTVA7rG4/1mAUkT0OxeDF4IX8Wlc6ZHf9fXjfLO1tWdH2G2I1Dv/4ATZMAA9PeblvD8wau9ngTvkxO7XLVDzTXjZlS5WSThxF+u5tX4KsjS5GrjyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747890584; c=relaxed/simple;
	bh=U5jac6NTWbR+Hang0H3T9ju4oZKS0PrLaMr4ibJeQw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6TFf02n0Tk4glZH7cyCSKrvUwzjDtib3JePhFAblA+chnV1ynf5j3gn9kxHIb/6rIdcOrbyDogZpHOGPtPmvA3ImfIKTaQEF2iXhRvrMW6szyScOYtjdLAw2iHZOZa9oYVoFCH5vIaL/D8tC1LqUzCrqV/0AYvS7j42zPG4rK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nksMvm3O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nksMvm3O"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHQaMt013417
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mL2nMm/lUNsnBwj7RejZQGXhQ5fiEATigbnCNhzTYvI=; b=nksMvm3O+iEwUqSp
	X0rkTPz3mcnIVVZlm19BkX0QdpJA84vi6oXyGVabhhwBwxxDfTdHxi9Ha9/ZXv8K
	/SR23mM9fSth8TCnsGMK+19XttHIu2Zs3qm+1AgKu/rxeOpFxR8usjl5CT6UflLG
	gPWREWicmoL1w4DAE1eftqVGTlS5poGf1c//Wa1Q2QLR6VoHlwyb/yyC4vgPlo23
	QqbA72QQ7ck4eK4/JeWrNd8W/m+6I5oc/MvuR3qiRaD0PkPzsfnkvaZB9WTkaA9y
	FDOT1kNc9JvnHB92FqRN1fa0ip0i6Wbyyt/ayFdIoJkIQVoCiMCFdMgXBffI+4vT
	RYzn3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5d58t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:09:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30ec5cc994eso4015450a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747890581; x=1748495381;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL2nMm/lUNsnBwj7RejZQGXhQ5fiEATigbnCNhzTYvI=;
        b=EIZa3EwHwLWGvw6RJ1N2MnF0LGb/o9SzDQWcxYje7USZKvHHWVd7vf1MslEER+84nF
         ynT5Y17PJXk8Z0452RLXqKvEK4rs50ZM7FXEQ+Eva2pS3YuKUKAkzPJW4Q44E8YCc5kH
         WlrVgsQknuTvHN88lWg1wuekiMgzHSSCU6nfUDm41OZ3uCCjInMj/20myWX7PvNy87HU
         2/KeuhcFBZetqRw3c7hHnMnridzzXLe1Mgj+MLtpr0mvruJGE9VzcwCkszUyvS+nqwjp
         ztK5zsGvMHv3bg8JzmV7hD5nvv9ohlINRBk1Y1EDps5vLioDolMtxJw3XY59147iBImm
         CGgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnW9wng2GIffGXzT3O7m6mV6OLElsfLjCKs5fH7kCo2f9xnN8ICPKyBVEG+BMx9j20AfA7lwEwNdmK5Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw39K2BzoosRMi+KgPBEK0V5KheQ7sNO/OvxmbHdltbkg/HKpyx
	8+3vLxlIqRzQTH+iUG6ps+qSsjXfVZt8NF/NGO50s6D7NcrlV+9Vyv5Y9ZegLkeBWvDNgIx9nkX
	v+11SMNajsi16uTrgDv1JDcBRs9nfSFOxN1UAPr8B05IjCbrDnk4dpI91UAO2Mr9A9uk=
X-Gm-Gg: ASbGncs27KTvurpq57xn/D3rCVVd/dfLQ/XY2d3wI7vuhiEDLk7jE0XINxeIrIXB3UK
	KIEzmY84DNe16kiCSf0L2KZ/L9PV5HibdpOPRjhbmv54SiN9vPRgB2i2JKrjSIvODayFgV8o6ib
	sV9XrYSJuqzoBOtP4MYvleapPHWoqJFTLdtWFDwrIiOoAwkiaMAvTm8OLrFUoLLdvngLQcDyqJ6
	Vi89+3lLOoul+nTXqIZZ7x55jny20wNQ29r6CvxLxWp1hOgI1Ya2gik9/dKjClqFDhwYKVqp/3g
	1rD0hkC4KGvuJyEMcYAAYkhjRFI2ATa2khL4IW0=
X-Received: by 2002:a17:90b:3d50:b0:310:8db0:1663 with SMTP id 98e67ed59e1d1-3108db01678mr8386459a91.17.1747890581045;
        Wed, 21 May 2025 22:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR4vGALxJNkiMpd5v9TwbWnbybVsuJ8/gUIoFTGuevTfvyKNKQ+h5H5GJWUa6LSnsO8mG89g==
X-Received: by 2002:a17:90b:3d50:b0:310:8db0:1663 with SMTP id 98e67ed59e1d1-3108db01678mr8386425a91.17.1747890580586;
        Wed, 21 May 2025 22:09:40 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36513bb7sm4630878a91.46.2025.05.21.22.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:09:40 -0700 (PDT)
Message-ID: <c970fdd9-4dab-4e02-865f-7f8e6a830088@oss.qualcomm.com>
Date: Thu, 22 May 2025 10:39:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <3b9dc9d5-be31-420a-ae90-335377ad6d08@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <3b9dc9d5-be31-420a-ae90-335377ad6d08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA0OCBTYWx0ZWRfX9MKF/ILfupfF
 wo/XShjSXUMFtNbY2l9B9rZ7LpzFnXAB6sGDijdJmDYviEX/MvNaZmi/1/AMAJtYoyo1EwqRFEP
 tLkkpl50VS4QMEjPRHoTjE/aAj1tnJzNl6RllAYPC21VjTLYu2CH4jp2WICYSqqLDzxz5LHGUsg
 HXGglbCNCJF4DA7lIR3ClWYfOk9THhIfKTRgVDXXJmFMKGxoVQBxMW7QzHqiv6Vok3flrJjT9H8
 +dEKPEvRcVYesH+Cwze8tpkaRLt+8Bue/HV+FPY/TLsQdhTuOReiX4gaH9GChb8J+u/HLAwMKHb
 X3Rtb8qlkHkn8hmsZKYitBypSEhkVEojepCIJ17f+5QQznow9TulYqaf/Z29DEJJS4RJQNFe1FS
 0yS2OnJQyJ5hCoQOwRK1cRP75+6QeD7ki7f3lGoQbDCoYVnVOVr9egT4ohIp13+P7gjcUIVb
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682eb196 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MzRfKa0KFu4D08wbYRYA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 83veNS3JblA9ec9gbhRKd-VlQivapSd_
X-Proofpoint-ORIG-GUID: 83veNS3JblA9ec9gbhRKd-VlQivapSd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220048



On 5/19/2025 5:05 PM, Srinivas Kandagatla wrote:
> On 5/13/25 05:28, Ekansh Gupta wrote:
>> Remote heap allocations are not organized in a maintainable manner,
>> leading to potential issues with memory management. As the remote
>> heap allocations are maintained in fl mmaps list, the allocations
>> will go away if the audio daemon process is killed but there are
>> chances that audio PD might still be using the memory. Move all
>> remote heap allocations to a dedicated list where the entries are
>> cleaned only for user requests and subsystem shutdown.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>>  1 file changed, 72 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index ca3721365ddc..d4e38b5e5e6c 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -273,10 +273,12 @@ struct fastrpc_channel_ctx {
>>  	struct kref refcount;
>>  	/* Flag if dsp attributes are cached */
>>  	bool valid_attributes;
>> +	/* Flag if audio PD init mem was allocated */
>> +	bool audio_init_mem;
>>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>>  	struct fastrpc_device *secure_fdevice;
>>  	struct fastrpc_device *fdevice;
>> -	struct fastrpc_buf *remote_heap;
>> +	struct list_head rhmaps;
> Other than Audiopd, do you see any other remote heaps getting added to
> this list?

With current implementation it is possible but that is not correct, I
will include a patch to restrict remote heap map and unmap requests to
audio daemon only.

>
>>  	struct list_head invoke_interrupted_mmaps;
>>  	bool secure;
>>  	bool unsigned_support;
>> @@ -1237,12 +1239,47 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>>  	return false;
>>  }
>>  
>> +static void fastrpc_cleanup_rhmaps(struct fastrpc_channel_ctx *cctx)
>> +{
>> +	struct fastrpc_buf *buf, *b;
>> +	struct list_head temp_list;
>> +	int err;
>> +	unsigned long flags;
>> +
>> +	INIT_LIST_HEAD(&temp_list);
>> +
>> +	spin_lock_irqsave(&cctx->lock, flags);
>> +	list_splice_init(&cctx->rhmaps, &temp_list);
>> +	spin_unlock_irqrestore(&cctx->lock, flags);
> Can you explain why do we need to do this?

To avoid any locking issue. While clean-up, I'm replacing the rhmaps
list with an empty one under a lock and cleaning up the list without
any more locking.

>
>> +
>> +	list_for_each_entry_safe(buf, b, &temp_list, node) {> +		if (cctx->vmcount) {
>> +			u64 src_perms = 0;
>> +			struct qcom_scm_vmperm dst_perms;
>> +			u32 i;
>> +
>> +			for (i = 0; i < cctx->vmcount; i++)
>> +				src_perms |= BIT(cctx->vmperms[i].vmid);
>> +
>> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
>> +			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
>> +						  &src_perms, &dst_perms, 1);
>> +			if (err)
>> +				continue;
> Memory leak here.

I don't see any better way to handle the failure here as the clean-up
is called when the channel is going down and there won't be any
way to free this memory if qcom_scm call fails?

Do you see any better way to address this? Or should I add a comment
highlighting this limitation?

>
>> +		}
>> +		fastrpc_buf_free(buf);
>> +	}
>> +}
>> +
> --srini

