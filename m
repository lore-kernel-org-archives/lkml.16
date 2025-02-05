Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D1227BB7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738738445; cv=none; b=cSs5OtAnOKsFxDFCF8mH4r35cSRUmq0t1t43spQJ19/ryIcAMDaufvNmdnR4MRMHTy5hn7gSBlMYPDBmNwBWu4wCi3vwyFsoSwiayd2m6hn4jdu0ElRoTibuUeoqbV0OVmsWx67Fva0KyJNxmlkSI/x1JUrLrWp9TcV7/7cScjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738738445; c=relaxed/simple;
	bh=cWbO8HKmw8z2ZMTH0xbgQo1v4JbWKY6SdNB1Q44Twjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qf+OM10kFlCZqKK94149c2nhr49luq/vvTm3vHX7xJd3MjkIVk1Oux8wU7kTIyAwRqzFbj9uzXF1CV/+cXQu+EFgRXoPZ8OEv4iF6PJJpIragKbfuhoCznkStcTAZz3OHC6e4d9nJAPpIRoPV4KIMuJNDxV0dGCxhi7lOkD3WEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fC65TRMs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fC65TRMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738738442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ig+/O8/8C9meWS9i5E5x4FYET8uunPEIglzfgflUkxo=;
	b=fC65TRMs313PcjAlVEGq2TbAjCKHxmxNziFJQbrFTDsDPEK4vPwA51tCvFixqY68Ty0gGt
	BRv2+bcNrRW6fsl2EzTP2mU3weV4PL51Oe0LqRjUQhUeHjj6Hk+EmuF83o9YRMu6gQ0MFy
	eQatS9isVGS8LoXAolrjIsxixbuNLUE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-JcsjEwTqNCqDBcEszw9ljA-1; Wed, 05 Feb 2025 01:53:58 -0500
X-MC-Unique: JcsjEwTqNCqDBcEszw9ljA-1
X-Mimecast-MFC-AGG-ID: JcsjEwTqNCqDBcEszw9ljA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38db0b5405bso214606f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 22:53:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738437; x=1739343237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig+/O8/8C9meWS9i5E5x4FYET8uunPEIglzfgflUkxo=;
        b=inKSQGX2H19hnEmT1O+cOWrjDcl99NMJr6GKeZ9PcXfMW2zL9Fa6D8PB/aWm3gWFHr
         b5PQ94L/D0DNSyHxiXJnNbCFWb+mSmYq1A+6UeqgRbrsrx/NROJvX6O/LL6c9m36BfOj
         9FZK1rAXb+ng5VQa1bqIw8kmebLEfC3nWtfQXAwRBD/aFFiKqKd4u0ICcA1RSETHgD4y
         PylBrrxqV0yzqmP10hACHywGiYiSYAuLlq9Ie+WKDl8bnRUkZAqmHO+R0NCjcYWVeQep
         mz6eXyWDDeZkRErmz11DdlhhtxppoVBtN0vlcVIx1+pojnXFI2aNwksa6Tcipq8UQPiV
         tx8A==
X-Forwarded-Encrypted: i=1; AJvYcCWf2OeWc2ssEj6sbDXARujUpRjd4bzygTcR/y2xqH1C65NYgJLRxpkJiqB3TeMRPojoJ8/jRPptK+n17ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB1Edde23zo9/AK1K/CJ5LMWbJUv2otKJebYncgwbEnsoT/W3I
	zktUK2JC2QsSsrLPuideK5ghUM488T59+RhX7piHDoih+o0ag6Vge+aEKPCOs83GTAklKuAlGFx
	V+o/ogKrMEkPzc63UQg9CQNYs/UMFw78osSmF4I8gI8Fd9cmSZ2oOwDXxSJJyJw==
X-Gm-Gg: ASbGncv/pBriUV8QvgispSyB8QGX5UzKnNGtECocA/RsMBCGHPdL7Uk/rXTeqtGnLEr
	NSZS42Yfz0EGTBjh6G6HgahxOcLJewsZrCfLcSkCcc0o8J7cZHur3JJU6CEAqWflyytCv5O3woC
	q1gyxP5TlwOW/Yz8fxjYE6bRD67owzCN50JCQy0mVxA5PMfsHAoI+80qilw4TBejKYXqqlwhX8Z
	Zz0TlpWBm4/sinCeyCVzJ8+GUEhR6WRUBiAyIftAugIiNaCEkHAT5UJYO0YFoRf0lY0Xi9pdtlX
	EJvuXTFyc/gpo7ejBtrfo2JS3ZQcFmwr2Vyd
X-Received: by 2002:a05:6000:184c:b0:38d:b7dc:30b8 with SMTP id ffacd0b85a97d-38db7dc3509mr21306f8f.18.1738738436786;
        Tue, 04 Feb 2025 22:53:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGpckBtgHNmxTU7R59xIWWBoy3feR6+6IjsVYrKHmwkhizPVL0uHMyp9QXQa1ReNMzYO5Zcg==
X-Received: by 2002:a05:6000:184c:b0:38d:b7dc:30b8 with SMTP id ffacd0b85a97d-38db7dc3509mr21291f8f.18.1738738436348;
        Tue, 04 Feb 2025 22:53:56 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.128.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d96536asm11146655e9.18.2025.02.04.22.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 22:53:55 -0800 (PST)
Date: Wed, 5 Feb 2025 07:53:53 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Phil Auld <pauld@redhat.com>, Qais Yousef <qyousef@layalina.io>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	Suleiman Souhlal <suleiman@google.com>,
	Aashish Sharma <shraash@google.com>,
	Shin Kawamura <kawasin@google.com>,
	Vineeth Remanan Pillai <vineeth@bitbyteword.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 3/2] sched/deadline: Check bandwidth overflow earlier
 for hotplug
Message-ID: <Z6MLAX_TKowbmdS1@jlelli-thinkpadt14gen4.remote.csb>
References: <ba51a43f-796d-4b79-808a-b8185905638a@nvidia.com>
 <Z4FAhF5Nvx2N_Zu6@jlelli-thinkpadt14gen4.remote.csb>
 <5d7e5c02-00ee-4891-a8cf-09abe3e089e1@nvidia.com>
 <Z4TdofljoDdyq9Vb@jlelli-thinkpadt14gen4.remote.csb>
 <e9f527c0-4530-42ad-8cc9-cb04aa3d94b7@nvidia.com>
 <Z4ZuaeGssJ-9RQA2@jlelli-thinkpadt14gen4.remote.csb>
 <Z4fd_6M2vhSMSR0i@jlelli-thinkpadt14gen4.remote.csb>
 <aebb2c29-2224-4d14-94e0-7a495923b401@nvidia.com>
 <Z4kr7xq7tysrKGoR@jlelli-thinkpadt14gen4.remote.csb>
 <cfcea236-5b4c-4037-a6f5-267c4c04ad3c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfcea236-5b4c-4037-a6f5-267c4c04ad3c@nvidia.com>

On 03/02/25 11:01, Jon Hunter wrote:
> Hi Juri,
> 
> On 16/01/2025 15:55, Juri Lelli wrote:
> > On 16/01/25 13:14, Jon Hunter wrote:

...

> > > [  210.595431] dl_bw_manage: cpu=5 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4
> > > [  210.606269] dl_bw_manage: cpu=4 cap=2048 fair_server_bw=52428 total_bw=157284 dl_bw_cpus=3
> > > [  210.617281] dl_bw_manage: cpu=3 cap=1024 fair_server_bw=52428 total_bw=104856 dl_bw_cpus=2
> > > [  210.627205] dl_bw_manage: cpu=2 cap=1024 fair_server_bw=52428 total_bw=262140 dl_bw_cpus=2
> > > [  210.637752] dl_bw_manage: cpu=1 cap=0 fair_server_bw=52428 total_bw=262140 dl_bw_cpus=1
> >                                                                            ^
> > Different than before but still not what I expected. Looks like there
> > are conditions/path I currently cannot replicate on my setup, so more
> > thinking. Unfortunately I will be out traveling next week, so this
> > might required a bit of time.
> 
> 
> I see that this is now in the mainline and our board is still failing to
> suspend. Let me know if there is anything else you need me to test.

Ah, can you actually add 'sched_verbose' and to your kernel cmdline? It
should print our additional debug info on the console when domains get
reconfigured by hotplug/suspends, e.g.

 dl_bw_manage: cpu=3 cap=3072 fair_server_bw=52428 total_bw=209712 dl_bw_cpus=4
 CPU0 attaching NULL sched-domain.
 CPU3 attaching NULL sched-domain.
 CPU4 attaching NULL sched-domain.
 CPU5 attaching NULL sched-domain.
 CPU0 attaching sched-domain(s):
  domain-0: span=0,4-5 level=MC
   groups: 0:{ span=0 cap=766 }, 4:{ span=4 cap=908 }, 5:{ span=5 cap=989 }
 CPU4 attaching sched-domain(s):
  domain-0: span=0,4-5 level=MC
   groups: 4:{ span=4 cap=908 }, 5:{ span=5 cap=989 }, 0:{ span=0 cap=766 }
 CPU5 attaching sched-domain(s):
  domain-0: span=0,4-5 level=MC
   groups: 5:{ span=5 cap=989 }, 0:{ span=0 cap=766 }, 4:{ span=4 cap=908 }
 root domain span: 0,4-5
 rd 0,4-5: Checking EAS, CPUs do not have asymmetric capacities
 psci: CPU3 killed (polled 0 ms)

Can you please share this information as well if you are able to collect
it (while still running with my last proposed fix)?

Thanks!
Juri

