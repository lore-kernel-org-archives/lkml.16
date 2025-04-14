Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D4717A305
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632259; cv=none; b=XzvuuQ0LiizvAbjSvWsdIEZLkDIj5+RlsKdknEXkVSsqCR1K7lZnaAhuZFNhM73JlQxuY/uK2UWGJomoUQhL6UonIZzwDHktTVyI65RcvnxkqzSrRdtiFiQngtyRAdbIbNfglR4z6iaNKtXgog7o15NC+g79b3UeT7szrzmLndo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632259; c=relaxed/simple;
	bh=kSrqvwd1K7QV682A7ZHBgcKnLlsC0YSPr2BSfepqsks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoCtGXH/HJ9uB1oBtPs0Grtde0cc3hPZqxjSRI5nxgTQ+crYcFVJko3brx3xPCCXeC/+vly7nnB7VCWgJLQy0IOHtFLSaN/3acl118xtZiSjGfoGc513JlCswGwsY9gmToSwJQ0DJh7xSJv8m6Tws2YKbxflj55Jq8n+Uw4a49g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VHVkO+EN; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VHVkO+EN"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22403cbb47fso43023525ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744632257; x=1745237057; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d3fiJyav5LeHn3+IHfCZGQDQLg2aK0E9mnKT7EQN3yE=;
        b=VHVkO+EN6Sfv4zrtrLpGVU0SP4gRMEV1AzBfqyjL9PuNM/+ScIZbxHnWxBBoRMkxu2
         mm1npiBjncjywajDmBqNUIAFBE6H5t9LLeSadDkil0u21hNtaIwu4krEkzo0uhvcRBDP
         XdTZQ3jc8I7vMZoNC3N9td7pqpLtK5+JGhfzpuvsLpL6GM651IHH8tnXMEi3UmZ6liv5
         P9EovZnPSvTtCu3aETTjSJuhiQHo8WCHldAQLfZ6w6OV4IaQygpf5APT58MValEC8GtZ
         sFL12EuScN80LY85w73KZ3lmpdaBcgb+Chmpy5GrtXYyZyF+qiEOQdjKWGgFPFJsuyJ/
         x7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632257; x=1745237057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d3fiJyav5LeHn3+IHfCZGQDQLg2aK0E9mnKT7EQN3yE=;
        b=JlECzymrY5phCD5CXBqTWaU7eeK9Wo27N2J/PdLrZsCuf709bjJ/PaEqaF4QW6N211
         WTMMKGfXKdqda1HVVR/NuaFWGgB04HPQNidR3RB5h+36CFxSoDpnt3KqdSjevG+2OD0J
         4my31R45CC7X2lSz1RhjCOKpbAlPQ/dk9ZNP4/nAcTx7HgoPAftZw1G2aC3bCUDEm/Wh
         kuojnX/KFwIVvMXkS+uQoWE99uexiceM8YBd4vsf0uaVoxOp9Z/zYz/U0znf0oFoc2ao
         KwyUKOszYDe8NF7A5jgDt7NCiyvS9UZOurBNWbIJrcqYGMwE5rOjOmxZwNElMTFmvb59
         pKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQiSYwwY4/00wQP64b6xsw4nUxbeZm67Dr9cO4QyvlgV9PWdwZ/BEJsmi/W8yO96WekvYwCeIPhNS93Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzGxgVKi7/OWnyLy1dsTY5vSuHPqQMDH9H5Zyx7i7YRvHNUmNZ
	qzptl/b8okdBp6bnWBf40aiLOMAQxXd3ZYLmDPgm6de4yN41dc34GaB/31gy0Q==
X-Gm-Gg: ASbGncsNsVKLuGVAYXlCz13OpLCi/UIPtf//Mhr2mBhWpVRTIWa84oN0AQO3IyLlAU2
	gooh1yM+3jRQvz93ZEoJiv2SkjePDgoXt0wMW/fTmHsXdNGtX0G7UX+dtcRrQ3/41QNzVHgzgkf
	ZfPUC3ovfuE+sbCvCHm+SsmjrK6kWQ8njFHNQpppIxEPC0HFX/9scdPa1vZ0RzB1AEYLvg6u2cC
	Uq+4vnrqqf3q3hxJPExdfxa/gM4fyA+Q69sI4RDg+cx+wtjOVZ4Pw33ibAnIFWtBGq3KuPIY6kT
	6en2C3BUQ4g5NpA3VtKDnKdfp6E3I2cw470iSt2n
X-Google-Smtp-Source: AGHT+IEVlfk6ZEc6HdZax5AKP9BsvKxLJlZQiUOM9FyjJ4Hs0Conht7K8LKBo4Jx8/Jn0alIarfvSQ==
X-Received: by 2002:a17:903:22ce:b0:215:acb3:3786 with SMTP id d9443c01a7336-22bea4b9995mr184552945ad.19.1744632257074;
        Mon, 14 Apr 2025 05:04:17 -0700 (PDT)
Received: from bytedance ([115.190.40.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c20e7sm6375513b3a.45.2025.04.14.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:04:16 -0700 (PDT)
Date: Mon, 14 Apr 2025 20:04:07 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, linux-kernel@vger.kernel.org,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [RFC PATCH v2 0/7] Defer throttle when task exits to user
Message-ID: <20250414120407.GC3558904@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cee5bca4e2b024d3406b40b84c0d5db91c7d276f.camel@siemens.com>

Hi Florian,

On Mon, Apr 14, 2025 at 10:54:48AM +0200, Florian Bezdeka wrote:
> Hi Aaron, Hi Valentin,
> 
> On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
> > This is a continuous work based on Valentin Schneider's posting here:
> > Subject: [RFC PATCH v3 00/10] sched/fair: Defer CFS throttle to user entry
> > https://lore.kernel.org/lkml/20240711130004.2157737-1-vschneid@redhat.com/
> > 
> > Valentin has described the problem very well in the above link. We also
> > have task hung problem from time to time in our environment due to cfs quota.
> > It is mostly visible with rwsem: when a reader is throttled, writer comes in
> > and has to wait, the writer also makes all subsequent readers wait,
> > causing problems of priority inversion or even whole system hung.
> 
> for testing purposes I backported this series to 6.14. We're currently
> hunting for a sporadic bug with PREEMPT_RT enabled. We see RCU stalls
> and complete system freezes after a couple of days with some container
> workload deployed. See [1]. 

I tried to make a setup last week to reproduce the RT/cfs throttle
deadlock issue Valentin described but haven't succeeded yet...

> It's too early to report "success", but this series seems to fix the
> circular dependency / system hang. Testing is still ongoing.

Good to know this and thanks for giving it a try.

> While backporting I noticed some minor code style "issues". I will post
> them afterwards. Feel free to ignore...

Your comments are welcome.

Best regards,
Aaron

> 
> [1] https://lore.kernel.org/linux-rt-users/20250409135720.YuroItHp@linutronix.de/T/#t
