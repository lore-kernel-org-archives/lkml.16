Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2565CDF1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738665299; cv=none; b=XY9vnuCIHVvJQatKhyAvQcALOIPyhljT91IFhQNETlnmjuz/zViiOHRNaYs5iawQ1shP9zss4SmP/IMsbPoYrgYDukqcrG2X2mAzGXXR14n0w/D9Jwrbv7hXQ2ZVGNLO6cBWpEaCMj8DVg7VP8K+AOvNSC/VoJh7foJZcZkIOiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738665299; c=relaxed/simple;
	bh=hqTjf5lmddHOq4u66S9x1P5G732OlBa5uE5s1z76W5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVfjC3Dq5zptMlLHhj2xPbIasYhIJYlWuJrtRxpr0+J4ryNoI25vxBBk6bR9K7iQpT7kgd4Ix2yBt9is6BA6FLwCIh15cgmD7uggH6F8Pbt6Tn4nKzlimgwucMGO2f71GfQtH/o5M+LocVKWWSzAkLMPfylL4Op+vhp1t+wubdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JHw0dVIU; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JHw0dVIU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hqTjf5lmddHOq4u66S9x1P5G732OlBa5uE5s1z76W5s=; b=JHw0dVIUEeKUk8kC/G0OKufSPH
	sfkwvFAAqJgKqsc/5URHoZ+E2mzdUF2vly64MnX7kEm89F6AwUIN+V5FW+nHfjO4bqk6VYNgpe6GV
	iVILH6VrwJysLlTsdI49JuH1ZbWkw0K43YFNMy6xGYC0UcHOOH4JPwJ0lEAIxcC09v0yqueY59C7l
	awKJn42RZzNrlc2apIUpa6DyfQhL8OquvWevzEUNxxmUTw/wuXYCu5KJ0wvuu3CN+9EzlcKOlTLo0
	WOshehIiQdvZCuftpf/PZsQ13B+xq1ABlW3RFqRZS2n1+6NpIh1uf3zczzytLX57ItVNkuG5yRnha
	JsGfQIjg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGGW-0000000GHoC-1Huc;
	Tue, 04 Feb 2025 10:34:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D6CCB300599; Tue,  4 Feb 2025 11:34:47 +0100 (CET)
Date: Tue, 4 Feb 2025 11:34:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <20250204103447.GU7145@noisy.programming.kicks-ass.net>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203142743.GI7145@noisy.programming.kicks-ass.net>
 <20250203155114.YVGnCHUT@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203155114.YVGnCHUT@linutronix.de>

On Mon, Feb 03, 2025 at 04:51:14PM +0100, Sebastian Andrzej Siewior wrote:

> All the things I mentioned are open for debate:

So how about we add sysctl_futex_private; when set to 0 it will disable
the private hash for every new task, unless task explicitly calls
PR_FUTEX_HASH_SET. When non-zero, it is the base for the auto-scaling.

(then BASE_SMALL would have this default to 0, otherwise 4 as per this
patch set)

I would let PR_FUTEX_HASH_SET override and disable auto-scaling. There
is nothing more annoying than a computer that thinks it knows better.
User asked for N, user gets N etc.

If user sets 0, fall back to global hash.


Anyway, none of this solves anything when a process has both an active
RT part and an active !RT part (which isn't uncommon AFAICT).

Then the RT bits will still get interference from the !RT bits. Do we
want to complicate things and consider that?
