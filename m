Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3122AE90
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 02:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746672346; cv=none; b=hJKJtYquSVPv2XwhiDAy+AhN2HZFTVrQYhdgpoLiCIbzINPJIyXr5OpJxxHXDzfbKo4liROOnvMmbXtP0UCuVJHzkoLbjVYpnr1oBctgvua3n2Cja+QXuDEi9OTTin6mIAJ8FEtc9pLdpEfvKnM2C83JnRA8/0WoGQPKryPUM7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746672346; c=relaxed/simple;
	bh=/5WCWgI24bM84Dtzld5+c+aKZGuP1T2BF3NZ2wLlr7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRxSrKv0qMw7ifHG08Tu0YyZ2upGim/Rgk8LeKSJIzaEulGklOFIsqwaS5YWMJm8CHV76EcWnXKrE/s8xkeD4mkcdHVcTkwPnuDkoevLZG1or6PHq5ebdB0PXou9JBpm8qQMIG8c32txuiYa+TQ8q5Hobm3uohMh7z/9PMCQs00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hJe50r7b; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hJe50r7b"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739be717eddso458818b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 19:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746672344; x=1747277144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xMN3ycdXM7WXJWVuM9zDao6Nel7WEbQoKSNRydnAy8Q=;
        b=hJe50r7bcD0CXUj2fwvBViSP5kg1zgLgA4UuuQ4BnZlTzVgMj4d7+hdtjWN1Mk3Dw4
         vaNF//sJovJQLtAb7knBDbQAww+WZrZtcel5tJMnWalmOVK6QrPNcZBGPnGNhFor5Jd2
         Y7+JfwlIwH/gYxFzhGq1j3158/TCfG1MHSxAdsNK6Iik3aX0VdAcjlxKPuRGQMkpe9f1
         cYlkWJ6KLJVvjq14vQ++5s/IjjsrZ62r5PjYhLzOTeBZL/vyZJn2sZLUUE5dGUpH30eq
         9rtg/H8c+JREqi4wd16G5sgZhyvA0QhzGrIbec3Pm8wTS3n6Qm9Qs1WKB/5/oq84B8/u
         jO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746672344; x=1747277144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMN3ycdXM7WXJWVuM9zDao6Nel7WEbQoKSNRydnAy8Q=;
        b=uu0bRrwSkVYb5rFM4eles14BbBUI7odVUV1PSLrJ+Tn4ziOQREqLAFhcs8sE30b0N2
         cdls9p/GnB453vSVunYIF5/+60d7OlHjLYKhiXlXpnV9Ef7MRBNSqte4o1fypJLjEO0w
         qZz0SQUWvf5yAuu8W4+rq6zWGHRbeG0yfrO4rqMRtxluI7BRDDmEsvsxw0Fnd2lNuzvs
         cCbjZzDJPq0UuqhXSmoXgl02Fuo8IuXBYsYF99CjOHyIfjJaAluQXC5rYQhDM0vB6r6a
         fyq5zg49VVeHjpnxR/o69ROYaNTA0dW3b1Nbv1McDtMs3llY6tJoPPiSd1ti54sypWkF
         aPTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt5Ni0Z95gwyDDxRIcSGMPVXeOuvsj90yAkEPeu607l6h7SmnCO6daG90ltA/43CrMGziJvCZmbGDY06E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsF2OE170/ORVxQ7Nr7a7XvRgwamzbF3CCRvrFcw767CnQOrPi
	LiR/lri0E6JbxEYX3+OGxYA7o9yf2L0bWBM3rohygDeDiHVocJ7q/NiGXs5OnA==
X-Gm-Gg: ASbGncvPrKfpkpE0r9tpZ/vjuxrACc036uvcg1OUCpC4+NxXUB4Q76NwV+kbdafr+XM
	7SJHKUcF0zTJnJVtIiqqjIJTsWgviQZPPpWiO2JRKC7NLhmPxRZ2rBbKCdQGHVGfiot5ZaYtNTK
	XOnHm5sdhXcwK6+POS7ZNQdRqPs5Muf05T3J+vtYTo2HOA4/suZhwwBwAREUB7hoSUf6I+aR1PB
	Yo7CF2rONYLzYqhGy72wOJRKpRbL0Bmpunh2cNqjvgbz0fFupDZ1JQsXB2Kfp1lC8GunyxYEIF1
	pPlARLbBrEcIs7YfIo7DO0Y2LT5Zdva1iNZuSfckkI3SapIfdIk=
X-Google-Smtp-Source: AGHT+IFC5rRBrL2xitz4oTZf+mKCO/t6OQgfIp2HFDLNWcGf2BMMkamhBdSpAuFlm/jvGpUvB8nTPA==
X-Received: by 2002:a05:6a00:4406:b0:740:91e4:8107 with SMTP id d2e1a72fcca58-7409cbe6e94mr7197763b3a.0.1746672343636;
        Wed, 07 May 2025 19:45:43 -0700 (PDT)
Received: from bytedance ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020f4esm12026864b3a.112.2025.05.07.19.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 19:45:43 -0700 (PDT)
Date: Thu, 8 May 2025 10:45:25 +0800
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
Subject: Re: [RFC PATCH v2 7/7] sched/fair: alternative way of accounting
 throttle time
Message-ID: <20250508024525.GA628019@bytedance>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
 <20250409120746.635476-8-ziqianlu@bytedance.com>
 <099db50ce28f8b4bde37b051485de62a8f452cc2.camel@siemens.com>
 <20250507090923.GA194948@bytedance>
 <618bc3b199f19be916913301edb5ec832131e842.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <618bc3b199f19be916913301edb5ec832131e842.camel@siemens.com>

On Wed, May 07, 2025 at 11:33:42AM +0200, Florian Bezdeka wrote:
> On Wed, 2025-05-07 at 17:09 +0800, Aaron Lu wrote:
... ...
> > It's just the warn_on_once() itself is incorrect, I'll remove it in next
> > version, thanks for the report!
> 
> You're welcome. IOW: I can ignore the warning. Great.
>

Right :-)

> I meanwhile forward ported the 5.15 based series that you provided to
> 6.1 and applied massive testing in our lab. It looks very promising up
> to now. Our freeze seems solved now.
> 

Good to know this.

> Thanks for you're help! Very much appreciated!
> 

You are welcome.

> We updated one device in the field today - at customer site. It will
> take another week until I can report success. Let's hope.
> 
> The tests based on 6.14 are also looking good.
> 
> To sum up: This series fixes (or seems to fix, let's wait for one more
> week to be sure) a critical RT issue. Is there a chance that once we
> made it into mainline that we see (official) backports? 6.12 or 6.1
> would be nice.

I don't think there will be official backports if this series entered
mainline because stable kernels only take fixes while this series changed
throttle behavior dramatically. Of course, this is just my personal
view, and the maintainer will make the final decision.

Thanks,
Aaron
