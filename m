Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EB72D3A77
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026486; cv=none; b=XOm8wmTO3noaq2hJxT1qi/CgqA32U37lXDZEzyCgk0lPnrGMEFboTv8ePvS+8QjHZoEqT0cAbkv/KETGzNVfhRbUKH9wMIk00eSdPKMmLIiC7mrVPD+6Ffs2SHI+E2fnGuMKIm3GqVjizTwFu6cLWpOUUBEX3xlDDRggtUNffX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026486; c=relaxed/simple;
	bh=shpRmXMxoAvlCJrSaU036DLhd2qOJus2a65XhLCVibQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iedIzmfkTDRlm3EDfxzR1PYAjSW7pxfH2MH/r4LGxbsMzhVbUvZ0gjNjipUf5XabEJzGwNY6cUsuAXYLeAGSb39Prw8NNQKpEk0je9W87l1v1mpOsrWyPfFUXX0oDnzTMTxv5rSBI/3bpGdXp6SIVgKICWduEXg6qEKXjFQHYSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lTALuVbi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fjFINkZW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lTALuVbi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fjFINkZW"
Date: Fri, 27 Jun 2025 14:14:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751026482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AywVRv8jD8GuFq9cps1BmehNoF+TH2l7CnKX6QSNBY=;
	b=lTALuVbiWIl2ZAzRThlp3cUH7kTod2FOjcWOVjsICzRioP6BR+PGAnOLL9pnJJsrVWEkh+
	/OJxbENZAeCmK1HkaPPeAgUqLiL5kIt+JoPWSloyeFOmePn6prC6f9xyC4eRvAQ1ET5/pw
	/vGEPcZi+K5RdCbH/CJaglNh/JcY7s2McY43ZgvHi9MPdU86aZbl6DZgkp19GD3O4EqjIv
	h/HUtOB1Q114ybUOS44Luw7l16mFQvsLuDOO/DIs00mf8P7DVUTilxStSpUSk+ipkEbHKf
	MHSzZI1r95xTjM6GeuMIq5bK2GvqaNh9YaM4YNsevajsqchM3rhwlcCOu7dhGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751026482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AywVRv8jD8GuFq9cps1BmehNoF+TH2l7CnKX6QSNBY=;
	b=fjFINkZWu5t1QSP2DmWPXIb17sOYxNOK1NLSgGuE4T465LJUotY42kKKdUe1j6R+6gs7Un
	eKwiTmSVMoKywtAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250627121441.LpTsB5q5@linutronix.de>
References: <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
 <71ea52f2-f6bf-4a55-84ba-d1442d13bc82@meta.com>
 <20250626131715.GI1613200@noisy.programming.kicks-ass.net>
 <20250626135034.18sab4Xp@linutronix.de>
 <20250627110457.GA1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627110457.GA1613200@noisy.programming.kicks-ass.net>

On 2025-06-27 13:04:57 [+0200], Peter Zijlstra wrote:
> On Thu, Jun 26, 2025 at 03:50:34PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2025-06-26 15:17:15 [+0200], Peter Zijlstra wrote:
> > > > I'd vote for defaulting to global for one more release.
> > > 
> > > Probably best to do that; means we don't have to rush crazy code :-)
> > 
> > If we do that, that means we need to ensure that the private hash is not
> > deployed while a thread is created and the prctl() function can only
> > work create the private hash if the application is single threaded.
> 
> I was thinking something like so..

Okay. That increases the motivation to fix it in one cycle. 
Anything you want me to do here?

Sebastian
