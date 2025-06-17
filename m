Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB82F22
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750127375; cv=none; b=WSwvwpJUc1FkGuXoEMI7hqm8y6IV6zcWlDpT3n7o3SHctjigLBI73lrTYYSCWBV9M8uGA2mkHR5iQNubYN2Aet4qiOLSm1GqZTQuJx5dnEQZeWpxJ4RwnQhSw6RRA8zsuKf2WxzSlz3HW0CGYU51CNCkZiJef9GnulBKcvgj4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750127375; c=relaxed/simple;
	bh=6xdI0vmUHkoarZm1e/X8AQmGB+tvK87eOiiTCIIFmB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ya8Fhzm6u+/8dwNZ9sswU+yBx3lBwgrn51B+tntQcb5GTrfsyk1EjMeDPSoAY1eeHA2djn3s8EWDEG7HUdVZ04Al8u/LdZkj/mXAeRIclOrd5iOfmqqSf6YwAcMOWzqvqJefVV716nzOY51DG/bAssvGL1x3Lwtl6XGv6LG3clg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=IO+HV2ka; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="IO+HV2ka"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so4083418b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750127372; x=1750732172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFEnFyX7oCXVBevUsUN5SPZpaWUpCVJGmfVX5yr+oMQ=;
        b=IO+HV2kaWnoZoRRsKPxufly5Fp9+CDiWkgBxh/6Sp4eFNthKSTfX5umnwsWzP14/5D
         lmqka4SzZ97Qr6vqUD86HpvwHI9RjxiXjPRRSgjI6gyKf2hSsG7BqCZ6HjjgoMIgwG0p
         tc6yFseUz9Ydjn+TAVTXVKXaIHkmvrxV7n2F0ZWNBH0TXcuOQw+mM/2Tu+oADecSLqO2
         ZvVU70XLY7vPoO+fda6MSw+kw44k3tZYu+1j4t3lviCzmTVo9XzJJiHU1arfuybWDtTa
         OnpdXbEUPPAMq89CEvmoVvXcM3S0wuuvSZmPqRwpLd8W53UI4hy3OfcD3XQxR/c3X6Y1
         OcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750127372; x=1750732172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uFEnFyX7oCXVBevUsUN5SPZpaWUpCVJGmfVX5yr+oMQ=;
        b=ekG+IgOr9uQ4//0LvUI7l53Qocxaw0NyXaghevUFYlYVgd0iPYb7RdKOCDgGqkBlhf
         K4xx7qNld/is3leDUBsXZzPVjji0kDpfUa0gwdXkMzkHSECRaWzGDQIywtFm7eG0l+HN
         w7n5v9LgmDqnB00f1OYLQHoIFCEn8vkswd5ZaJMITK0uB3mz94YEEcTkT5M4IDxXzCCa
         Jt911JjCH4FjEdANF0ieHp4+7dL3wccdg4qacwvgoE/+CKTunoX7fUS4fcVO7PvTJvIE
         5z3CEoFEudcuvgpqJPp0fir6Qc1MEGdTAYCBH9BDU9023V0upAQ6/rUPXFwkBKgtBaDX
         X97Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMcEb0SDGiQ5yyRmu7jswzHlZ92u8S5xdAiWgybsOQLUHrHPPWlB2as0QoFZnuhCV0bSxYdD9Lws7gsO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqEuNxy7gQWuoCh8NkzPiCZ4h6bnXTJHHpdDEOY8U7UzUaydgg
	QqtvZjVPdIqAQDs145ab3datSR2fXZolhwZ4UsGJQBnweTw5piQLeYDMAzgcqT4EY04=
X-Gm-Gg: ASbGncvW4IThfPSVdicmQA76ZGxmAsiZALoe5S+r+/lVnKr9R3ZuopLPq4gjGbjO6cw
	cNUblWlUcq+njtCBSSOs6AidaXaEvA4iiYB6qPgOp/FuuTM4eRCdNPMbeOJiCslAOl1IHzgOQpq
	kXtJNey8IYmPu9OVa6Cpv/RLlFwBXe6P1R+4kU5h60d/+EEgJk6lfo5WwUdbMGUOjHy+kONc2LJ
	aN1MUYlpBp7Wp1D2fZqLSbOpjfbLioGZrieFGDtKU16yy1RoqvqY1Xr3DenfydzDNKHHmTUvJJl
	SXdzFCiGGCYzWDFMnmMWbw016JK4cmMQKRxdVvmFIcYA4kStNXvadoEzkp4TxNOMOmtCWl0Diu4
	X/ArlNpc1aPzGvw==
X-Google-Smtp-Source: AGHT+IEtD8fowJ36i/3SkKAQ7//IwAgCjUBEECZVVRMN3ICtGR+/Moyox04Uyc7iI7cLOLAh6K6jgg==
X-Received: by 2002:a05:6a00:13a3:b0:746:25d1:b712 with SMTP id d2e1a72fcca58-7489c46d163mr15630199b3a.7.1750127372451;
        Mon, 16 Jun 2025 19:29:32 -0700 (PDT)
Received: from [10.254.230.190] ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489000519bsm7615447b3a.38.2025.06.16.19.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 19:29:32 -0700 (PDT)
Message-ID: <6420161b-7b04-4282-a86b-20e3b6ccecd2@bytedance.com>
Date: Tue, 17 Jun 2025 10:29:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add missing mm/workingset.c file to mm
 reclaim section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand
 <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250616201643.561626-1-lorenzo.stoakes@oracle.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250616201643.561626-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/17/25 4:16 AM, Lorenzo Stoakes wrote:
> The working set logic belongs very much to the reclaim section and is
> otherwise not assigned to any other MAINTAINERS section so add it here.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4523a6409186..f28f7625723d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15871,6 +15871,7 @@ L:	linux-mm@kvack.org
>   S:	Maintained
>   F:	mm/pt_reclaim.c
>   F:	mm/vmscan.c
> +F:	mm/workingset.c
>   
>   MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>   M:	Andrew Morton <akpm@linux-foundation.org>

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>


