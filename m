Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAB113B2A4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550440; cv=none; b=MLQAG0/XF8UYImeoKJxEZXxrQuWrMrbdZolVSGPOyzn9c+FbYiFLnEHX3Of7UksK1EQvMx6khpChbaYb8F1qvFrXMQUx/dKyoNlrIiW7srJ7c10X+TnCx7KKWu4jVbQiVVd5roo2hnfJ7duo8XhlchG2/sr7pDPkESHT4aPvNlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550440; c=relaxed/simple;
	bh=Db+YCe+XZox9OgQNdh9KHFIEI8f01sX40ndwDPrWAPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NY3rRdu56Z1s5Nspg4iS/pYWF2ciHOMjbbr11DmKPZE88/Xfvs8K4Gqr96uaJ5IqN4QJGBVC8CX4koyfzUXQuC6EKhKaeJUgEFjadSWvZQtsKXnQCa3uTzTuIN5abNNrFvItTs6JD995yCaXtpNBaKhSxNT2E3wVcbeOvs0qa/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ouBClZj3; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ouBClZj3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=35C7uod2+TKXHN5G7h79KnQsYg19YqxU27MgEQ65Xes=; b=ouBClZj309JJprPs8g+8MpGk1y
	Eoo7KWcaEhNfS1QXGxGdPYVFySvtzgJrJxxHvnFhntiw2+D0MaI3Z5wzwV9ujbf5T5TOWpGH+fvVP
	QMb50fIr9qLAOO5h4Tks3cUfNr+xRMLEIZz2J7qUDPHkrvZZkSKNfejDVHAikmJ1N6ueOkQnGHuEF
	RfVewvcZTz4dN2upyRiiQLp/3C/uET2BaYl7WgnO4xeNGrgabSDJ21bOoDGMhoVoLlZAIrCDwAO2J
	2EceZG+KBTBfskTw1kr6Ih1Np0Y5csW6rRHUYd4Vlyc8XfteMcGjdL/B6fCma46JhVwFVPPBmdn3E
	7LjB+5/g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKHR-00000007hEf-3kJX;
	Thu, 03 Jul 2025 13:47:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A7F353001B2; Thu, 03 Jul 2025 15:47:12 +0200 (CEST)
Date: Thu, 3 Jul 2025 15:47:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com,
	torvalds@linuxfoundation.org
Subject: Re: [PATCH 00/11] x86: WARN() hackery
Message-ID: <20250703134712.GV1613376@noisy.programming.kicks-ass.net>
References: <20250607094224.104791182@infradead.org>
 <20250703-spotted-panther-of-blizzard-a887ad@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250703-spotted-panther-of-blizzard-a887ad@houat>

On Thu, Jul 03, 2025 at 03:40:01PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> On Sat, Jun 07, 2025 at 11:42:24AM +0200, Peter Zijlstra wrote:
> > Slightly less mad this time :-)
> >=20
> > The primary purpose of all this is to get the WARN() printk() and
> > __warn() calls into the same context. Notably the current state is that
> > WARN() ends up doing printk() in-place, then takes an exception and has
> > the exception do the __warn().
> >=20
> > The problem with all this is the ONCE logic. Normal WARN_ON_ONCE()
> > (without the printk) has the ONCE logic in the exception
> > (__report_bug()). But because WARN() essentially results in two distinct
> > actions (printk + trap) this cannot work.  With the result that
> > additional ONCE logic is sprinkled around for each such site.
> >=20
> > Current proposals look to make this worse by adding KUnit checks for all
> > this, including regular WARN. Making the per-instance code overhead even
> > worse.
> >=20
> > As such, by moving the printk() into the exception, and having the
> > exception (__report_bug() in fact) do everything, we get rid of the
> > external ONCE logic and provide a cental place for additional conditions
> > without need to litter all the instances.
>=20
> Thanks a lot for working on that. What is the status of this patch? It
> looks like Linus was happy with it, and I understood that you felt it
> was a blocker for the kunit warning work we'd really like to get merged
> at some point.

I talked to Mark Rutland about arm64 support, to see if the things I did
are generic enough for other architectures to support, or if there's
anything I need to change.

He said he was going to have a poke, but it appears he's not had time
yet.

Once he's happy, I think we can move this forward. Obviously I have to
rebase on top of the things Ingo stuck in meanwhile, but that shouldn't
be too hard.
