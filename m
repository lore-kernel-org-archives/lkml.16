Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D283728F500
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333852; cv=none; b=jGvMBHZxgV29j2jmAKufd0H+8Isjx1syEG7QXqxJ40kfx/sAxJI9M8aCJAh9DhGuaPTw4ErxEGzfbi4GrzpiFu6f1JjTq2ZVaODKJxXBhDlnaIP4iQPp8H7PMRvTgD5angJ3Tuzcc4eJtQ6ePYB4gaduZ9e5e9eppAyDnrAUsIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333852; c=relaxed/simple;
	bh=y7Jp5/pxY+67+dODxooZEyCxzMumc1PeIklfsRXFvyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoRt871P1eZohictaBb5ohFJLT4OwwW3m6P/GEcyuAGO+0VdU8YMyoAR1fQG4b78P8x9Im0an09QW6nceWo3xy6uXP+fiQRmXWVCPuxS6CoBmbbRsw8X6cqVEkUWCWLH7zOmLrE+wCV4uRl3IUcFyqsEFjtEN6TqsaBPVIplHvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lK7j3NLX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lK7j3NLX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFFFC4CEE9;
	Tue, 22 Apr 2025 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745333852;
	bh=y7Jp5/pxY+67+dODxooZEyCxzMumc1PeIklfsRXFvyU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=lK7j3NLXyOWQzqhgQJpH2bOupul+Y5PB4gxXHGGn5SEawCJhsXv0zKWxxFPPbdNTO
	 Bx4rOWj3iIQUSZ7NV41VONA4mKZrB5UFy92kicXRSDc/He4eGoTu2TuDDeXHdiWyeY
	 +AqnlZFLpr9oM1V0aqvWFGnIKhsS9f7Yed1M+IPVf45Y4KpOTXATZocv1KgypU+vzh
	 Yo7teSch21zcTI4gV12p3JhHg/aBpkEJRd2c0E0MlpDS6Vh0iKj6itpuNP5AYRI/L0
	 mzldcZJ5+30IPHrcRACN9Wesl/ruW/aarRAKNHgP5YHAPk+qxR7nPvu9fdMa8a7qyC
	 O/6N2Ke8oZfCw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E0633CE0875; Tue, 22 Apr 2025 07:57:31 -0700 (PDT)
Date: Tue, 22 Apr 2025 07:57:31 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH RFC 0/9] Reduce ratelimit's false-positive misses
Message-ID: <a92eb62d-aab1-4c19-a842-4797df443cf5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
 <aAesultdR77oRaSI@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAesultdR77oRaSI@pathway.suse.cz>

On Tue, Apr 22, 2025 at 04:50:34PM +0200, Petr Mladek wrote:
> On Fri 2025-04-18 10:13:49, Paul E. McKenney wrote:
> > Hello!
> > 
> > This v2 series replaces open-coded uses of the ratelimit_state structure
> > with formal APIs, counts all rate-limit misses, replaces jiffies=0 special
> > case with a flag, provides a ___ratelimit() trylock-failure fastpath
> > to (almost) eliminate false-positive misses, and adds a simple test.
> > 
> > The key point of this series is the reduction of false-positive misses.
> > 
> > The individual patches are as follows:
> > 
> > 1.	Add trivial kunit test for ratelimit.
> 
> I have suggested few cosmetic changes for the above patch.

Thank you for the KUNIT tutorial, and I will apply these.

> > 2.	Create functions to handle ratelimit_state internals.
> > 
> > 3.	Avoid open-coded use of ratelimit_state structure's ->missed
> > 	field.
> > 
> > 4.	Avoid open-coded use of ratelimit_state structure's ->missed
> > 	field.
> > 
> > 5.	Avoid open-coded use of ratelimit_state structure's internals.
> > 
> > 6.	Convert the ->missed field to atomic_t.
> > 
> > 7.	Count misses due to lock contention.
> > 
> > 8.	Avoid jiffies=0 special case.
> > 
> > 9.	Reduce ___ratelimit() false-positive rate limiting, courtesy of
> > 	Petr Mladek.
> > 
> > 10.	Allow zero ->burst to disable ratelimiting.
> > 
> > 11.	Force re-initialization when rate-limiting re-enabled.
> > 
> > 12.	Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE.
> > 
> > 13.	Avoid atomic decrement if already rate-limited.
> > 
> > 14.	Avoid atomic decrement under lock if already rate-limited.
> 
> The rest looks good. And I think that it is a great improvement.
> Feel free to use for the entire patchset:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Again, thank you, and I will apply these to the series!

							Thanx, Paul
