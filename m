Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C64A1A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120511; cv=none; b=F3afnYDEmfcFp4086U0q2AKLrRgDQqObhC1Sbjk5PBu8z9/I5gSs1nhzN1uY09Z3Ag+R1iVX+HjET2g5j2gBavPHqZcXq7o++Y9+Wn2bU4hfS4xa7inQQrJK5s3i8DrhT8vqnf8PVrE5GtmMrw1up5kxSLl/K2GjRAL1rwyTTlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120511; c=relaxed/simple;
	bh=j20Fg2iIfW71IFxv0UJVLhHirwEnkS09A5MKueE4O/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b95l5a+ZMRJx0qwkSrqWapKoHJJIMUc0qaZUUWK9KMZ5dCJtJRINc/iGGYqKwan8nT3yXaNTQY6s3Tg6CG4MaBo3IcRiP+Aib3PcDJ1m0WURK+KNUfaBxr6s2q7Ujw7ykgES0yt2V01MbvxaH7X1HULWnj2/VFN6AKeOdAbED7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dQL++vHT; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dQL++vHT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=E/3hXJOT8u3OAErPxeQmYYXtLtOAyDUt9lNmAWywlNU=; b=dQL++vHT0BjaIPujn/mUfru1kT
	X0ssNYb4o/B883sv/K16Bnfe5mPm0N+a4LkWDdDnP0pgq+E4n5ufpZiUEkN1eOq+EFS9O8yoGdOQ+
	jp2mCo+DMzqU2olktXUwnnZ6I5gmcwU8kTjByy+e4d1N9bjfUUi6p8E8aZHC/fC5ndqG+vT3e5gOX
	lkNTQxEfWHxKW2dxsFdjhrq3YZhvWU+jQl8jq1WNTT5zQgD3jjjPJoFgW/avCpVUjMBFEiH0oq5yo
	JgjU5qtTVzJFHBCi7wBa14mfz1d2OI7PXxDDA/druEgTxdABv9/exzAdHOpmhsQtsyhYJn8JFirA+
	UYa18FAQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN88y-000000048wo-1dn9;
	Thu, 05 Jun 2025 10:48:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D35803005AF; Thu,  5 Jun 2025 12:48:19 +0200 (CEST)
Date: Thu, 5 Jun 2025 12:48:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	syzbot <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>,
	Liam.Howlett@oracle.com, akpm@linux-foundation.org,
	jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com, pfalcato@suse.de,
	syzkaller-bugs@googlegroups.com,
	Suren Baghdasaryan <surenb@google.com>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
Message-ID: <20250605104819.GP39944@noisy.programming.kicks-ass.net>
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
 <f03916ab-19fc-4832-b564-58d3c885011d@suse.cz>
 <aEFl9FWQHEJqnl2Q@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEFl9FWQHEJqnl2Q@pathway.suse.cz>

On Thu, Jun 05, 2025 at 11:40:04AM +0200, Petr Mladek wrote:

> I just wanted to better understand what was going on here ;-)
> Let me share my thoughts.
> 
> First, the deadlock might happen only when all these (or similar) code
> paths might be called in parallel.

I've found that this is often easier than you think.

> The two backtraces, right above, are from initcalls. It is possible
> that the code path in the 1st backtrace can't be called before
> the device is initialized. So, it is possible that the deadlock
> can't happen in the real life.

This is a very shaky assumption. Lockdep only records the first time it
sees a particular order. So seeing an initcall in the stack trace only
means it happens first during an initcall. It does *NOT* mean it only
happens during initcall.

The only conclusion that can be had is that nobody thereafter uses those
locks in the reverse order -- because that would result in a splat.
