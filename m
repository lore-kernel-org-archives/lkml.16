Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E122D7B2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216311; cv=none; b=O5ilZtwRw72f7fsgObk19DluTj8DLcuOXF/4tDIOZ/4uZKp9uCbUO4Il69w4UXvo1KQnsxQzSpBl13aOIeBBJRY3HR40e3XNRb2DKk+/rEty3GPvw0644qycTUKNFAMiZm1HI66xqt3JT0YIycYl63O9Pqgnp5mN1eH20nduWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216311; c=relaxed/simple;
	bh=0UCu58qx5+r5o2FkoxTbEmZMlUiAS0WASZpHPgpTZJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4btbfTA/Wm1FPAuklMrQHIshONj0EaoanhJvpMWypsWPAq7Ywh4KlX6WN99pz96GVkVlig7pRN6HNZj8U64DqipuOvwwWlWzAkRw0Il5tEBUqxklYlOsxQDgWQ4QfkqOaTBHawTcIFp6JxOI5DtPibiO/rvOd57f+lXJHOR0Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QkKLksqX; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QkKLksqX"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so11247454a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747216307; x=1747821107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BVybws1t+U40/vbtZIfwab2hNrCdVfeHjc91VuDwjDg=;
        b=QkKLksqXEpMVIOBhNhrC+QEbTjfiONxRrVZwgNHrIAjEj87rzkusngGuuVit2oQV0n
         mQGMNkgLtJ2KYt+MgC6TyU/N723i4jTxgSE55mgaOJMx6Ee3vc7ufV5IHNVcWSuBDswo
         pEuXoBK84mROqaM5zCZ2O5dA4YNwbHIbxVFpz73NjsZoz90ATvZyexYxSTbtmxYzh8Op
         lisp7QGm3A3XPl+OjJecziEeM6jgVGElBe7xlPvhOyYh9OhOGaabR+Vta9XCLUS/pdej
         mlKQjJARDKunglS1Lvtvfn6yQ5d1CujD/2d8+nyy/3k0/2TcV3yHOk6UwHc5SBCtDy2+
         8AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747216307; x=1747821107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVybws1t+U40/vbtZIfwab2hNrCdVfeHjc91VuDwjDg=;
        b=HPJi2O84jLnOqdCIX9RCQ2aiTG9WBcgN6N0rIc9w3WZSzM8mvNcyyEqB3bLUPyVYpE
         Z+82Cg6xXcx09Qed6QeSZ3GiXlySZjV686Q1nog8LgCVsjTribeuhSHTgDEqk0WYF7+e
         oL/Nsw/l+ys1tnkXYDdMQYlPWcbiK9N+vp03IvNCQkA8r6iVFoUsBYV/ofRii1zyQmCb
         z5k3HWK5/SkQy06wGgalFBqEu7kxZ4AbRC/dMeN3lyLicdbeJsWNQPB0UkFGYa2WdNyr
         rRyc9zb+aUcFg0EpgrK1mrNhUl9w2/VHqflzfClgr9ijxw1qrfHxhTxpgjcnn6z4FaZP
         wSrg==
X-Forwarded-Encrypted: i=1; AJvYcCWKAzxbyRMsaYsFrW4X3RjZQArXz4mjvSPJtH72QTyZM6TE+Opm4VrMG/4OlH++HHvls0sGY9crL3sGHLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPnnIZ0w/GNs6SH5CQUt9r8RJ9r6CxfBuW8rkpO/NkXqhIlHHk
	1Yt4DKTkdIuwkOfSEyVTPQpAe7tFjSiY9EoRIMPDLIPrweYq0hqtEmbq8zkoXo0=
X-Gm-Gg: ASbGnct+UR3cpadMP/dODREGubFBEpUXJlhTJDNegwkh6jLsXsviCacp+K84pAC53HQ
	ifzsny6x7xcRT5c41U2mfL4l8vW5cthVXoYoNjquYB7nWy4GP9Q+1XC297nhEJ12h67wP3WxiLM
	SAXTwIUDbg2m86xNhZNc62TSnGxsyFv+xFEAQyZti2dYkXVZG1YmJk3cLyURytX3LXRx78pFj1w
	70J1pYBSeXa2QjBhrRGEB1mjVgaC8o2gVJKMXyg62GHkxkeFhc/ZOhe6tCrQzKjjzC6dEUt8MYf
	qGAE9JWOr8bw8g8YXoxB2g6H/eaYMFwOU/Avhkq9ym98/EgwAhz3DQ==
X-Google-Smtp-Source: AGHT+IGSd1rvJVl8u3DfNMX7dhF6Gp8/xiI2G+noTAd6SIJPTmFef2VtUgYEzSt6Qp8SoVIvBvzS5Q==
X-Received: by 2002:a17:907:9443:b0:ad2:1d1c:1c8e with SMTP id a640c23a62f3a-ad4f750e521mr279713966b.49.1747216307144;
        Wed, 14 May 2025 02:51:47 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad221288a91sm873089766b.15.2025.05.14.02.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:51:46 -0700 (PDT)
Date: Wed, 14 May 2025 11:51:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>, mingo@kernel.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, jpoimboe@kernel.org,
	jikos@kernel.org, joe.lawrence@redhat.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2] sched,livepatch: Untangle cond_resched() and
 live-patching
Message-ID: <aCRnsN-2x4vpjpCx@pathway.suse.cz>
References: <20250509113659.wkP_HJ5z@linutronix.de>
 <alpine.LSU.2.21.2505131529080.19621@pobox.suse.cz>
 <20250513140310.GA25639@noisy.programming.kicks-ass.net>
 <alpine.LSU.2.21.2505131604530.19621@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2505131604530.19621@pobox.suse.cz>

On Tue 2025-05-13 16:05:51, Miroslav Benes wrote:
> On Tue, 13 May 2025, Peter Zijlstra wrote:
> 
> > On Tue, May 13, 2025 at 03:34:50PM +0200, Miroslav Benes wrote:
> > > Hi,
> > > 
> > > thanks for the updated version.
> > > 
> > > On Fri, 9 May 2025, Sebastian Andrzej Siewior wrote:
> > > 
> > > > From: Peter Zijlstra <peterz@infradead.org>
> > > > 
> > > > With the goal of deprecating / removing VOLUNTARY preempt, live-patch
> > > > needs to stop relying on cond_resched() to make forward progress.
> > > > 
> > > > Instead, rely on schedule() with TASK_FREEZABLE set. Just like
> > > > live-patching, the freezer needs to be able to stop tasks in a safe /
> > > > known state.
> > > > 
> > > > Compile tested only.
> > > 
> > > livepatch selftests pass and I also ran some more.
> > >  
> > > > [bigeasy: use likely() in __klp_sched_try_switch() and update comments]
> > > > 
> > > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > 
> > > Acked-by: Miroslav Benes <mbenes@suse.cz>
> > > 
> > > A nit below if there is an another version, otherwise Petr might fix it 
> > > when merging.
> > 
> > Petr or Peter?
> > 
> > That is, who are we expecting to merge this :-)
> 
> Petr Mladek if it goes through the live patching tree, you if tip. Feel 
> free to pick it up :).

IMHO, it might be easier when it goes via tip. Peter, feel free to
take it.

The patch does not create any conflict with the klp tree.
But I guess that there might be some dependent patches in tip...

That said, I could take it via the livepatch tree if Peter preferred
it from some reasons.

Anyway, the patch looks good and passes the tests. Feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
