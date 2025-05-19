Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16721275865
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747654533; cv=none; b=OVGu1n3FF17T8517P1DJyeElrzoHLskw6BSP0n+GuMXCqx2F1mv4LhwZt/wveY+MEeO/utZX6LCFqkB2Z9Wy4EGy/esTLx74DBru6ekut+XSO2LASngIDGKoEWd/imUN2STVuoGHTJaPaaSCS6KydW19besSnPaeAiViTwSrxSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747654533; c=relaxed/simple;
	bh=3VTuvBX4qnM2GXY3lHAA1PJU9tmSLPeKgaAw3r2v90E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HV8yeu6JfSbUzs4mls7eBnkLIIFCY0S3cvTJ/WtUf/+Ya4lPj3aylWpbCw3/hQDAMYvJ5udgemfixgoQqE/SM3261b/NTglYl4LdR5SGCbUudpVXmqe3wbuVdbCKThk5Vwbu89V7aiW5avIOMswTI522RC89AExxDGNqTbW8Iog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1VG2J8d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1VG2J8d"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9hkIs027736
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGz/5PBOO+5gp+QS6lttLCztBG/KV7/uZk6GhY7njfw=; b=d1VG2J8dc9xpjF1H
	q2SuEITW4g3Y6TUaMFxzUuvcOtHPlo1t27LAQOGxq70iq/O3laPJUrmCX0aCK3HI
	SDgHc/RtFf/2mYX+a/0M/WpKZelNQJg60HVYeasGaVjfG+XMqiS5vK3TvWOn+Kv4
	GQY3KoRyE8JoCYyg9T9Uss0fuM05/doELy32IxrQcN3+EbgeWp+KO6qiQ72ewPaR
	ROH9JRnODdPHvJE1d4bZGRRfmUGEJ0niKKj4m21UZmPgNxcG6neKmTaBuILMwcat
	0uXBLpJbHtMpDw3/fObX5wiIDjeMO3P7Ijfs/tcR4ptmG/V9azB3HDt10eWXvYtc
	fjBIWw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4v79n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:35:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so18765606d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747654530; x=1748259330;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGz/5PBOO+5gp+QS6lttLCztBG/KV7/uZk6GhY7njfw=;
        b=v2SP5aaQkVmPdGGRTzdJ5VbdUj1BvwaiOsC+BsTKiz88plxxk6sK38e0u2d7TRtuXb
         q4xrXj40apUBEB6uEq8eyZy28YFMTcbJtGIOMDwcqH6r7lzDKSHPGOtY2DGNpgAniUJB
         lgeHQ+PTUiF29mD/KhTR86Ya5b0HBo4CqAAoeUXKek1t2riMwp2F+uVRXjlFKvB6zGhp
         MXJSKeEidUb/ZK/7oR8NpysCfX/9wOGRHrZECsyVJObX1xAOfUqUDmCk2lDVlwKgbtYy
         6zc7rXfBM7f+fszaTeqXmMn5bE2EHmzdf9nbPhDCvv4S5xUqF6X77p+wcUvwK/y8FKPd
         lH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrYDhWF//gqB4pGHfQOvN87kkUyC+0d5GdTuIVdohVCaEzvWL+OnGUcXCUikDpNdUi7emGo5ngXfkUgek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXPDKV+owFOo6z9rFcK1NZFV7oealGQPeN6JsF1MCDrpWsL5j
	TH8VjibMoTtXlXYbfURudxpHYR6oImGH8b4WLlmhw/qtLNsiDSwh51B+MFHMI3O7MOCUisk6Gsh
	bQs4zoRjDY3zo8VOxdSUYI0KDoHFp/aiL63XcOeB9oKG6UKIT5kcsFmmstN0MHRAqtkU=
X-Gm-Gg: ASbGncutK0x/aqMnobUUp8ueZj34uetwJaeVzuiv4K8OsY5NJshMAxJDdt2PYVSUmCM
	L8usXEamtr2fdKfe+lGX9Q4nmoQVBkiZyQzesTl87IqiQ75XRO95q3NSvtABOEuf/y7nM3B3U8f
	O4kJH1HMNZBRv1j7xzLP8nktqBTbqr36bq3pgMZiZZ7LVjOhh1n4vmlMzVsn0RjUYXaIR/U7aEk
	z51fg3b4tz5JGx9esxEAZUdjTZbPKuO3vQRX8EwC76uAd2lXDq+2q9oOb8ozblQwYQshlzOztC1
	UangT5ued1m5mpEh5Ho2j7j7WgMq+xAUd5A4fg==
X-Received: by 2002:ad4:5b82:0:b0:6f8:a667:2958 with SMTP id 6a1803df08f44-6f8b0724089mr192360046d6.0.1747654529720;
        Mon, 19 May 2025 04:35:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzsyCr/J96bWVVh9QtO+6rLg1eaZP1di2m3Q4YIEUNManG7KPcCof9dSB2bSUxByne0jT9cA==
X-Received: by 2002:ad4:5b82:0:b0:6f8:a667:2958 with SMTP id 6a1803df08f44-6f8b0724089mr192359696d6.0.1747654529218;
        Mon, 19 May 2025 04:35:29 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442fee0d216sm131885295e9.26.2025.05.19.04.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 04:35:28 -0700 (PDT)
Message-ID: <3b9dc9d5-be31-420a-ae90-335377ad6d08@oss.qualcomm.com>
Date: Mon, 19 May 2025 12:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b1783 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NSqiOjkRuWDHbrvXJugA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: jpvJngcLtkx4asJa07xuIIEuAhmbfgZd
X-Proofpoint-GUID: jpvJngcLtkx4asJa07xuIIEuAhmbfgZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwOSBTYWx0ZWRfX2gvjRRTQgwoc
 1kzYokkaf8jFSXju/Hi7Qkgb07g9/9dqe2EeB9R4wbB1mhiutk1E4WF3CyTV6jCUxGxew7hpEns
 MU9rOOyKf1d+ZOwmJ+aOREEZV9HPExwQREL2iJRUgU7yBaF9vfLcmHH8z1QQwKGSlLmWRrBS69B
 6ucT6U1FIeHNmap/PNM43DgBWQslEbCloZqHNZzBJCLnhN6gIy8c1/95dHU+Q9DTwcazDlJZz2v
 Q1rJY+GccYchJBARI2hk/x0yBnIPo93IZQqPwPPgXQ3LHUA2txRrmQV2XjMG91zjl2GhcI0vsjk
 hFjg6hyiBCRoqjWHRoVVD2VOLZ30VT6taxhBKX7oKRwasmVlcBG0FTJnIWTBGVQ0+NFOAUDsQnL
 BdpRftHNDOJDk8oYlCAD2x5oMhbiAZwjA3rReGje4edB1FhCuLfOhrKSjERrzrsILuNbu539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190109

On 5/13/25 05:28, Ekansh Gupta wrote:
> Remote heap allocations are not organized in a maintainable manner,
> leading to potential issues with memory management. As the remote
> heap allocations are maintained in fl mmaps list, the allocations
> will go away if the audio daemon process is killed but there are
> chances that audio PD might still be using the memory. Move all
> remote heap allocations to a dedicated list where the entries are
> cleaned only for user requests and subsystem shutdown.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 72 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ca3721365ddc..d4e38b5e5e6c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -273,10 +273,12 @@ struct fastrpc_channel_ctx {
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
>  	bool valid_attributes;
> +	/* Flag if audio PD init mem was allocated */
> +	bool audio_init_mem;
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> -	struct fastrpc_buf *remote_heap;
> +	struct list_head rhmaps;
Other than Audiopd, do you see any other remote heaps getting added to
this list?

>  	struct list_head invoke_interrupted_mmaps;
>  	bool secure;
>  	bool unsigned_support;
> @@ -1237,12 +1239,47 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>  	return false;
>  }
>  
> +static void fastrpc_cleanup_rhmaps(struct fastrpc_channel_ctx *cctx)
> +{
> +	struct fastrpc_buf *buf, *b;
> +	struct list_head temp_list;
> +	int err;
> +	unsigned long flags;
> +
> +	INIT_LIST_HEAD(&temp_list);
> +
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	list_splice_init(&cctx->rhmaps, &temp_list);
> +	spin_unlock_irqrestore(&cctx->lock, flags);

Can you explain why do we need to do this?

> +
> +	list_for_each_entry_safe(buf, b, &temp_list, node) {> +		if (cctx->vmcount) {
> +			u64 src_perms = 0;
> +			struct qcom_scm_vmperm dst_perms;
> +			u32 i;
> +
> +			for (i = 0; i < cctx->vmcount; i++)
> +				src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
> +			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +						  &src_perms, &dst_perms, 1);
> +			if (err)
> +				continue;

Memory leak here.

> +		}
> +		fastrpc_buf_free(buf);
> +	}
> +}
> +

--srini
