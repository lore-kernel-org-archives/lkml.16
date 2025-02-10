Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9A11BEF90
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177481; cv=none; b=NSxhiVy+hT//ZXz1oLCtuxhru3FSfOz+flYzSftcxdcnsxCvZiVCZdqwzUo3vbk9POqk5ss5Rh8D4UnPFZ4szONcYxegqnW/JEtIIN6rcV5fFhJ4Nzk/mXPQ3NK1Bsh1YmjKOi9aRi1Z54ksmTc1/98mSnvAGDE0EpTlvu7xJ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177481; c=relaxed/simple;
	bh=VSzvEUtYvjxhDq0cVB8QwX2GVIYpCJhal4JA989MpgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecANZdl3D4K4piKiQceWya/axvHfzz+qBOd5Tfk9WosrKgJvURbVWV3JhQpI0WrraRRkEhGH2Rgx10w17jf7AjJIxny/Q/21TQGD3b/CXRAa7ZSKrJe3VUAD1gYbiheD2vrXrKtCQeswQQupyAiSOBucZxU6s0n29Tn2S1PrdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kDKx3syL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kDKx3syL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f5e943543so3751235ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739177479; x=1739782279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utidBFegZ51RGnMTlrNDFUXWPuVtA3XlELFoY8vS94Q=;
        b=kDKx3syL6JUbijii361+LOUCkKZotau11RmUB/U6nMDXQmkCUx7uOiEmurKL3GCQA1
         aJ09NECtPyIHFxSL4lJf/7oPxKPtkOiVAjdL4usYb/P3YMP9IndfIdx40ph14oPZTC4j
         f8tNoWIhSWsADbHQTdBBaMovrvIFRV3R4ddAoQvsJv2CKEhqW1/EP6Hoh1qrKhug1v+j
         MmkoU8Qzrqj/mi6k5tnrblUkEvQWfy2Wvn6e9onSdvpcjSrDT0YwB0BDqnBuqoKfc7hz
         yV8bn/CEeV3nSmV+Hsv59Jhqo/Q2/+JMxMx115O60oMiXVav9XxbDc32U4z3da8g25dM
         NwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177479; x=1739782279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utidBFegZ51RGnMTlrNDFUXWPuVtA3XlELFoY8vS94Q=;
        b=duJq91yP/7/qOkNvWIah2RVTsMZU8ZmXx0IvBxmHlCyD3cHcpjV9uIwheEaSeknOtx
         qksPNM+KV6z4zWBNhPaz50kETmNbNvdcH20+04DJMJVwPGRcsUNYRrmD4ISaWRVIRwg1
         6M6dhC/QbnlirRNrsW7PWtc0Y69f6/+NpwZSndpVZV7WnW93cv+Uca1hJ9Oug4cXrWOO
         ERjHZ57T1CNyMRultkIG2yUur/r7bQoF2cXNcvIrJX3M4jeVlKkl/GkM4eBH7PbumFWk
         IBpcAwfce9qgtjp+gnBt96CzSQ0+wjf+7wZPvn2zSotBnLuwlNsikSsIDy2InCsZOqgg
         mSrg==
X-Forwarded-Encrypted: i=1; AJvYcCXmnMA9f54aCgtm8TNPepIbBQK1Lxjoc4AYMUKN2RbO+KV5/HFvH+asgh7Jv1pamvuG6Onh8CAsfpz5ai8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/lYZTaQjR6dXJnenpr9Brsy6zmnIH1rzEgbNDX87jQY96+kG
	tBfrhs5nA/WO8CZ5voGZfYt7jp994juYtw0/80EmArUAJz5mnJC2i3Urap9U0pI=
X-Gm-Gg: ASbGncuev4PIUKKRr9oVO/7E2PPpletGzDCzTXxhgFC3u1vLP1mNQ0YJ73jL1u6El74
	SV4e04XRkmDaZRRNcLCulC5EvXUiUBZf2iv3ImTr4B12eo1rYQNxVj29qASOBUoVtxygAyc7zi8
	3BkdOfhAMfWxpfc2hm2S3MHY2+aOER3gSQ42V8Fpl4xKKvyKeb06jyBvzWN6aGD8sSRFzy3uYsp
	Zi/f1kMuJyo63hrVvoZ6U+hXUQHVJGNMYJ0n5cBr9GW/UEzUE2+6e1G7Hz8fEebOKqQUB89HDUp
	2lv+cZ9jM1VGgik5BZlrCNWQ4On2IQcxcE13
X-Google-Smtp-Source: AGHT+IFUAdqXpu41mRA06Wl+FpWQb86T1CsWpESUEKDSpA71vOybRUd1sXXsypiSFJ1qz8iIhavMOw==
X-Received: by 2002:a17:902:f791:b0:215:2bfb:3cd7 with SMTP id d9443c01a7336-21f4e758bfamr82501645ad.10.1739177479311;
        Mon, 10 Feb 2025 00:51:19 -0800 (PST)
Received: from [10.4.234.23] ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c7b6sm72982115ad.196.2025.02.10.00.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:51:18 -0800 (PST)
Message-ID: <271250dc-d54d-4eb8-9d73-0535d2a24a26@bytedance.com>
Date: Mon, 10 Feb 2025 16:51:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v2 0/3] Fix and cleanup and extend cpu.stat
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Yury Norov
 <yury.norov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>,
 "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
 <bb16ae49-f591-4ab3-8d27-f649619b266b@bytedance.com>
 <Z6J8wbuXgiz_ly-q@slm.duckdns.org>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <Z6J8wbuXgiz_ly-q@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/25 4:46 AM, Tejun Heo Wrote:
> On Mon, Feb 03, 2025 at 04:11:27PM +0800, Abel Wu wrote:
>> Ping :)
>>
>> On 1/25/25 1:25 PM, Abel Wu Wrote:
>>> Patch 1: fixes an issue that forceidle time can be inconsistant with
>>> other cputimes.
>>>
>>> Patch 2: cleans up the #ifdef mess in cpu.stat.
> 
> I wasn't sure whether the new code was materially better than the existing.
> Can we try without this patch?
> 
>>> Patch 3: extend run_delay accounting to cgroup to show how severely
>>> a cgroup is stalled.
> 
> I'm not necessarily against adding this. Johannes, what do you think?

Hi Johannes, it would be very appreciated if you can take a look at this.
The newest version is:

https://lore.kernel.org/lkml/20250209061322.15260-3-wuyun.abel@bytedance.com/

Thanks!

