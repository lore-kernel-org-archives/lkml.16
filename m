Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3F51FBC87
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570300; cv=none; b=beA179MNIjzos8EUDcwlND78hfU6/+Sj0ReZBEMNNRyyIvtauOMVdC1uMHPIjxL/FlxcCl0gQjXim0Ao1w+ZY2qjebKRKZdui231FbHfaLBbkYOGvAa90Uf+dUmtiaqwijdFlvl3F3tEdR2vjlL75NPZNGBB5OeQbuEilTFgT8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570300; c=relaxed/simple;
	bh=TR7JJGhWZGiD/N0YM2B2iYOc0Dw/MLNAyh6SBoMJ0s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwfkHPhzg4fEPn+s0emn74ugJG1gi8IcUc4k8JCIes7MkZaRypo7GhgcADzOScLTnnGuzlnPAedc8/zuf0Dgdgk2KvZc68SAIF9WQVr3l9p2wSv+4niLH45rrZOFlgZN+p+Uaz/051mU0HVmF5eBlnyEdWcCziu4tLdyU5FJWmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=RRNlzsnS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="RRNlzsnS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef718cb473so831502a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738570298; x=1739175098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3b15rQOlRt6257glX/YGDFah/u5pLWNaY9BbymMcpk=;
        b=RRNlzsnSnCDi5NqT45WijDpTG2IG2SZHbdF+z/Muz9e4kMxzBSz6sEBqnbE0TfwhZ7
         3xKPsWu1mTzIR9C4yRFpOwzhU9O+zMwL4UnlfTJiLiXIdVoBopuwYqjhds+7I8mC0peS
         EV4G98eC8DJW9BSSWmqxCDEPdK5FalmfmsNInp5Xx3UAHPLpOeRkt50EHjJaWEtcD9eu
         w8SQ6KF/DWYFgDWNnDf2D43zKrwaYnx8zzc7sJk3B+iu4tzGsO9tGuBIhviM3vQ+62nn
         zc3B1p+2KPg9Ttknk3GKUGwnL57V7oaTJWwsBnq3hbtx7GzMc1CcUmQ1Cmso3mjorjDV
         dcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738570298; x=1739175098;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3b15rQOlRt6257glX/YGDFah/u5pLWNaY9BbymMcpk=;
        b=ndoYQqfR0US0vXMfoz9vW8pGJQHAuq6M+NCmSZ9TKqoMR/EjcTKNJXcVqTcZ5ko4mV
         PskGxCgtePPgDrDGm3ow/KpY7sUtDZn6KVGy+kLpwWX0oJnMjg/Q64MR9Z+GMpOah1QN
         duV42o9vN1Q/DMaQr8aDBolv4qEM4TOfpUm/W7cUT+1OJEd+D9mCGGnRYH9EsYyc1ROu
         ppqJ9WBcgHQeY5vuJyUskPK6sEHd4EgKWCT9LRYW+g5UpzuGXjwNgB3q1eTbkWY+jTFW
         TP7RovB4kbr6WTe+eewQxbQ3suHDL54BPgWAsiSqRp9ISYXVYkrbiU+BqZksEcsdJKkm
         PIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgZPcN7fyBPb7rL3PD6mH3EcfAaWA//Eo9EvGb11Aqosjo8Y2FzyHk230MhWkyd+aRzYH+gONgVIoje6I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1LPWZ+GWjo6+Gqfbq0cOl6PmkJjqJJiuLLgc14ZQ9v4r2rEXz
	PeR9WDlxkD8XXcXBtXLfRyufbvwx0FmD0sryN59pB+f/nCCqMspAycz0zPKKdmY=
X-Gm-Gg: ASbGncu1DtuWl8QMMLcThd2BHDW7H8rGnGf3F0Q7uCH1b/WWIDfB62jt9X6M4e22tA9
	AGr2O1cdhkO1ORj9FbkQVdTTiNYxTPEeIEcneQKjKACkGt8fZQxqI+MVoimL03Bo8mhCUJchPKX
	Uh9JMx89ux+oGdPOZOBdSdrBqAptouVOLhikB8tyb7XOPMS0NZYvcQ83j/4TPF6Px48CbD8ezFn
	I3mK0bGb7aRGMzcY1+MqhYYxXX9y8YElccnODWtd41gqs9bMJQZeXTnKLO54UpR/S0m3B/mv37H
	PNt9pqOjj8AzlthW7DU3XNIXlqX31ZCp1Uwp
X-Google-Smtp-Source: AGHT+IH4x2AiZmQumRNy6RvxpMMTZpVeRTkBtlhnsq+DTT29+OF2bf4bR5NPVaMUqOxKN527WAKgpQ==
X-Received: by 2002:a05:6a00:4483:b0:725:ea30:ab18 with SMTP id d2e1a72fcca58-72fe206ece8mr9292513b3a.0.1738570297799;
        Mon, 03 Feb 2025 00:11:37 -0800 (PST)
Received: from [10.4.234.23] ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6427a8dsm7983950b3a.54.2025.02.03.00.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 00:11:37 -0800 (PST)
Message-ID: <bb16ae49-f591-4ab3-8d27-f649619b266b@bytedance.com>
Date: Mon, 3 Feb 2025 16:11:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fix and cleanup and extend cpu.stat
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Yury Norov
 <yury.norov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>
Cc: "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <20250125052521.19487-1-wuyun.abel@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping :)

On 1/25/25 1:25 PM, Abel Wu Wrote:
> Patch 1: fixes an issue that forceidle time can be inconsistant with
> other cputimes.
> 
> Patch 2: cleans up the #ifdef mess in cpu.stat.
> 
> Patch 3: extend run_delay accounting to cgroup to show how severely
> a cgroup is stalled.
> 
> v2:
>   - Fix internal function naming. (Michal Koutny)
> 
> Abel Wu (3):
>    cgroup/rstat: Fix forceidle time in cpu.stat
>    cgroup/rstat: Cleanup cpu.stat once for all
>    cgroup/rstat: Add run_delay accounting for cgroups
> 
>   Documentation/admin-guide/cgroup-v2.rst |  1 +
>   include/linux/cgroup-defs.h             |  3 +
>   include/linux/kernel_stat.h             | 14 +++++
>   kernel/cgroup/rstat.c                   | 75 ++++++++++++++++---------
>   kernel/sched/cputime.c                  | 12 ++++
>   kernel/sched/stats.h                    |  2 +
>   6 files changed, 79 insertions(+), 28 deletions(-)
> 

