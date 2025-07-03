Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D02EAB6D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559160; cv=none; b=t3mxwy/H+QlUks0dbAUQXn31WFstInyKWIgGrbMYBf5YXEJFeUPlP2iSuy07rwhyj2fuSBV6aZnZ8AYQm8lx8OMerZzGEIOnkiCm8wlKuJPVSnh+5R8+k/3yMI1SrdgdvAxrI4/Wg53IcSDDHT/ox5ld7K5NpPD72A0Dv+LBMFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559160; c=relaxed/simple;
	bh=BQKed+rCFMdtyN2G8RWoUXwyV0887INgUW5LAYaIISk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hpj8GMiIF806PHgwsK/3FggpYvnKT2Ysy6DHxoOz9sJ9il7Z7SSJg18lNKRc17ZtHl72ajd7WUZRMZrqjVJgRw6VCZjY+0uAk5AL/PW9wAwbS8wspZsdyaFVznDnGFBvuwzaKMAnPcIK+RD5iJd8vCX69Mvz9DRBQlZJXhY+Zg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eeernL+1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eeernL+1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a528243636so5183269f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751559156; x=1752163956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRB8cNtcn8RLP7IQzOSY6cpc7Y2dAMINvt3eWvfnG7w=;
        b=eeernL+1RlFGUYpx6Y/NPHNy2vVnvsh0nMR+JXv2UVrDEZ8ueZ8o0B7QyK6XggWKfQ
         3+AoKHu6eIzDxfJX4+nY9d1E4j6pJV2JdnTsvbmfF4LmL8u4kWDN0eJ2+zUnC+0Uaxyp
         97NMQPDe+ADMZ6u8EYENxFvpdTcbppX+kShRG7jwuvAitorPlKxtDc8hrHBMiawypQL0
         g2z9yL61HbzKrD0GN3zJ7SqhWekJCrvIQZ6N5hlyrgHS/a2X0+JWMvMHt1ubXOUL9p/S
         uqyLMLjQT3aIGSsm3+BhMXLZ/F9TU5OL7Fpg+shPap46pmUvYqf6WZr3TGtBfSlbleA8
         eBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751559156; x=1752163956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRB8cNtcn8RLP7IQzOSY6cpc7Y2dAMINvt3eWvfnG7w=;
        b=aQL6v7JbCW5hbl8FJeLjzIKpZ1Ewqr7hvc+xUBprgexQpE7Vf3Qaw3883C4jGvc0qO
         3HdO/ZBADnEgeNl0SWUUyJNXcvu2zqyk/3IOG5P/aHI59420TD/uvdZ19Pq8bTvfgAcL
         4TPjecLy8cXVIr1Pj+q1FV7cO27BIE//hZPzeQkajltuPoogOeQl+aK/nqSoCspdfTgv
         oa/Hqmrt6KVIJyO/OhfBfV+3ue6HbjCVK40fUkYf+ivuhPte/qo8P4wjnA9bxjldvpJ3
         zXzaM0mU8RxjLEt8zIY2sbi7nt3mo6IvVONzuw/q682+eHuasP0IX/M1WFyLSrCqxtKJ
         rfvg==
X-Forwarded-Encrypted: i=1; AJvYcCW+WmOyeW+6ElAjuBETUqd1/xm5JQf3IClT3vpCJmUIKtKgL1y/aQI+XlW4ctw8B5wdMrRp6CiP42yv4KA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz5V9a9hAFJGbhUxnsi+ccM2C+4Yhcp8DpORjUJLGeVL2GNFMQ
	ZR0pDN0XiBjwsXp7dzONJPKCQzqA3v0kK5QxIOr6ZUuxHMj6iA7keIXPHLGA+AXL1eY=
X-Gm-Gg: ASbGnctberVramy/IWk0ZLawy5KWE1lPlm2uOHEdsqLvLKr5JaIUS3B0UEOWYmX8AN9
	XxxxCBO/4eT9orU0R0oeSVRhwQkDk6eTOeZKx60gN68jZFDNwu6m55wGVrrxZ0TG6GaKisuNsa8
	4m4fCDpW4ELw8/7i1N/a7daFkpTrEAeXx4e681DXSfEijBzoFaJ6r6wOvWX51eVtIq921u+h2IF
	inFrHpL743aBJBVQMYvl3AKDJUmjY8STifIteKRl6tZoYR7WsDyeiFLpRMjaVLuEQxeQniKOhqG
	r2ppjwUDLarBCPS4t8+drzcCpXU3eSxbfP03mwbBgWFGJuJ81mZd5fFSEh9dDabzsf7m96Iz4J8
	=
X-Google-Smtp-Source: AGHT+IF66L38+HmOz2ovVCrxO+c5A5ux5zGs3pbYaXErSsgtIrGHfyp/jTIgRymoB9CUfdibRFXWPw==
X-Received: by 2002:a05:6000:1881:b0:3a4:eecd:f4d2 with SMTP id ffacd0b85a97d-3b32ebd7907mr3741093f8f.38.1751559156117;
        Thu, 03 Jul 2025 09:12:36 -0700 (PDT)
Received: from localhost (109-81-23-161.rct.o2.cz. [109.81.23.161])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454b16871a1sm1703325e9.24.2025.07.03.09.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:12:35 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:12:34 +0200
From: Michal Hocko <mhocko@suse.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Subject: Re: [PATCH 6/6] mm: Drain LRUs upon resume to userspace on nohz_full
 CPUs
Message-ID: <aGar8p-GlbqXtl7U@tiehlicka>
References: <20250703140717.25703-1-frederic@kernel.org>
 <20250703140717.25703-7-frederic@kernel.org>
 <aGaTh2esRWr3L6IC@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGaTh2esRWr3L6IC@casper.infradead.org>

On Thu 03-07-25 15:28:23, Matthew Wilcox wrote:
> On Thu, Jul 03, 2025 at 04:07:17PM +0200, Frederic Weisbecker wrote:
> > +unsigned int folio_batch_add(struct folio_batch *fbatch,
> > +			     struct folio *folio)
> > +{
> > +	unsigned int ret;
> > +
> > +	fbatch->folios[fbatch->nr++] = folio;
> > +	ret = folio_batch_space(fbatch);
> > +	isolated_task_work_queue();
> 
> Umm.  LRUs use folio_batches, but they are definitely not the only user
> of folio_batches.  Maybe you want to add a new lru_batch_add()
> abstraction, because this call is definitely being done at the wrong
> level.

You have answered one of my question in other response. My initial
thought was that __lru_add_drain_all seems to be a better fit. But then
we have a problem that draining will become an unbounded operation which
will become a problem for lru_cache_disable which will never converge
until isolated workload does the draining. So it indeed seems like we
need to queue draining when a page is added. Are there other places
where we put folios into teh folio_batch than folio_batch_add? I cannot
seem to see any...

-- 
Michal Hocko
SUSE Labs
