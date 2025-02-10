Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF2D25B67D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211953; cv=none; b=rbrI1dJpLHblEdnY+duNej26Hz2dAQymbRXEe1x/h/roM8oPDoeGtsZYVFYIBe3CYxGSgSaBqhMaVozJvcb4p4nhE4aHac8VjdgUMRgON17efSPiObvloAbScZyMlWAIT5Gpq8LxgWz55QHhclt0T5mdKDoIrXeeuDs8qcrXZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211953; c=relaxed/simple;
	bh=yw+lKZDoeBK7rkNspoTrT5upsSeMqE0byCe2rNIKGy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJTNJLzjaSdgiF0CN96m4i0yty1GfnziSMLmD07OQ9K4YtZnPnKes9rR1LuNKajdx3821QHhnIJlaTEmuFchsMI61JuVikV0t4qaXJ5oySXFPvrkQv7nyL++1BixQM+fgK2d7hum878nJZALXu7OVCZ1QWjfoXiSiiuks7wDAY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=B1sBZ8qX; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="B1sBZ8qX"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c060568959so104558485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1739211950; x=1739816750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1hZK6XGnRLi/IyorocuGwcKKQPXtEGusIrxLUfwsFRE=;
        b=B1sBZ8qX4Q8msELlEl2SM0O5rUMt8TZEmz9rZ2GXv0qCach+Abcsl5xPFjVHsbIP5I
         RyLsiVVeh6/f4zQc+lVZeOSR+FwtUOA3jDOL6YuZseo089k2cs/5MDHbjn8qQVzm36i+
         OaMUesmprHldlagm0wt8ybRrFodTVQpgTHt6FQ137MQVyugmQw6nvwcqS1Gd7UX7e5aB
         qWQ8pDWS7CTW37KSGOtwtO4ZMs6vppaV7lh9daWz5DAd/J6Rld2r4Qm0pEb2/9dPSmg/
         zcADcgwe3JSETooMSLwJOG6cAQkuPpL3qSTgwioHCUGpp/siNI2p6W9FOLFmrqSVQiAl
         In+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211950; x=1739816750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hZK6XGnRLi/IyorocuGwcKKQPXtEGusIrxLUfwsFRE=;
        b=hjvbyUQ5RdLb6swcfnh9xAHAFRhS2Uv91y9suk/YLAb8S9KC5bR12MBAXRbZH704zB
         491W0Sh8KdxTahe30IQZvFFekHIey6bjkt+kmFi815Ywp17eb3fm6egvX8gVzjRhAPPS
         +/52REMhiMZHYHmLsT2RPDvyMnVAHOJx1Rurd5yMvCZipRvFxIni3INemK80aqZn6jOu
         TtKZGyYtNL0ajH6Th1HRe/qrIP8qKdf9K/aOEz+gM5juysd6KHhJkM9Bypa/xXLnrh7y
         Y+3Kl6IGusSvWc79j1kma3ealfgANy49GCJ3DDVjMJLUAhLSFXy40MapsxYIUcIcxIde
         B3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQLgmKLzrCQ33aeRzJbNQGstzAhK+fBy3nrs3oSKXWDINcgr1XCMJgMQhi/vuRUu/Pb7Yon0xjtHRt3A8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8tH36XId2waSZtSB78uwLVAtyh3PF/fqqr3rch18u0iZdh0d5
	YIjjm9lWGOz3WKCot4QL8+UrLgOnN1xqfgrkPK04j/2uLR6j34tSvcWfvB7lxzo=
X-Gm-Gg: ASbGnctOQzS6TmwdGd0whVqSrfQaarU0GY/0RLka85oNpJyQr3YZEE/3L8dcWkO8M5Q
	oeDxVwKnrO1e94VmAXNUUA109R0Id5GxSQ6nEoI4f21KvBjR5OqxNpzzkVy/PNeNVvAoUVAw7/h
	QEJ6V32BEmroPBg3kQk90SjB+G1JMqBuefUocc83UTEwB2qWp1MMA3jbdAm+ZfoX6zXG26m0UoQ
	QyfybsS57+BP7AKf3000X4Zl0fFQkXzmKsOaCvCbHTYylCFcb2DPbQm/GuLx8oPTpWieD7AwVyi
	EYWdHIDQ3SEjRA==
X-Google-Smtp-Source: AGHT+IERn1pEjIUK9eVekbDQIrmmcjZ+a9exbhT86XMP+EPRyQ3FbMbg8dM1n6UR9Wtt9h0PfLk7Tw==
X-Received: by 2002:a05:620a:2549:b0:7b3:5858:1286 with SMTP id af79cd13be357-7c047c45da8mr2008700085a.47.1739211949818;
        Mon, 10 Feb 2025 10:25:49 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c05fdd0d58sm140341085a.6.2025.02.10.10.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:25:49 -0800 (PST)
Date: Mon, 10 Feb 2025 13:25:45 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Tejun Heo <tj@kernel.org>
Cc: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Abel Wu <wuyun.abel@bytedance.com>,
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Yury Norov <yury.norov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bitao Hu <yaoma@linux.alibaba.com>,
	Chen Ridong <chenridong@huawei.com>,
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] cgroup/rstat: Add run_delay accounting for cgroups
Message-ID: <20250210182545.GA2484@cmpxchg.org>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
 <20250125052521.19487-4-wuyun.abel@bytedance.com>
 <3wqaz6jb74i2cdtvkv4isvhapiiqukyicuol76s66xwixlaz3c@qr6bva3wbxkx>
 <9515c474-366d-4692-91a7-a4c1a5fc18db@bytedance.com>
 <qt3qdbvmrqtbceeogo32bw2b7v5otc3q6gfh7vgsk4vrydcgix@33hepjadeyjb>
 <Z6onPMIxS0ixXxj9@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6onPMIxS0ixXxj9@slm.duckdns.org>

On Mon, Feb 10, 2025 at 06:20:12AM -1000, Tejun Heo wrote:
> On Mon, Feb 10, 2025 at 04:38:56PM +0100, Michal Koutný wrote:
> ...
> > The challenge is with nr (assuming they're all runnable during Δt), that
> > would need to be sampled from /sys/kernel/debug/sched/debug. But then
> > you can get whatever load for individual cfs_rqs from there. Hm, does it
> > even make sense to add up run_delays from different CPUs?
> 
> The difficulty in aggregating across CPUs is why some and full pressures are
> defined the way they are. Ideally, we'd want full distribution of stall
> states across CPUs but both aggregation and presentation become challenging,
> so some/full provide the two extremes. Sum of all cpu_delay adds more
> incomplete signal on top. I don't know how useful it'd be. At meta, we
> depend on PSI a lot when investigating resource problems and we've never
> felt the need for the sum time, so that's one data point with the caveat
> that usually our focus is on mem and io pressures where some and full
> pressure metrics usually seem to provide sufficient information.
> 
> As the picture provided by some and full metrics is incomplete, I can
> imagine adding the sum being useful. That said, it'd help if Able can
> provide more concrete examples on it being useful. Another thing to consider
> is whether we should add this across resources monitored by PSI - cpu, mem
> and io.

Yes, a more detailed description of the usecase would be helpful.

I'm not exactly sure how the sum of wait times in a cgroup would be
used to gauge load without taking available concurrency into account.
One second of aggregate wait time means something very different if
you have 200 cpus compared to if you have 2.

This is precisely what psi tries to capture. "Some" does provide group
loading information in a sense, but it's a ratio over available
concurrency, and currently capped at 100%. I.e. if you have N cpus,
100% some is "at least N threads waiting at all times." There is a
gradient below that, but not above.

It's conceivable percentages over 100% might be useful, to capture the
degree of contention beyond that. Although like Tejun says, we've not
felt the need for that so far. Whether something is actionable or not
tends to be in the 0-1 range, and beyond that it's just "all bad".

High overload scenarios can also be gauged with tools like runqlat[1],
which give a histogram over individual tasks' delays. We've used this
one extensively to track down issues.

[1] https://github.com/iovisor/bcc/blob/master/tools/runqlat.py
