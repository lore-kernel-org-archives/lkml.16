Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13602054EF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589376; cv=none; b=K7+ecfU92qKsE6fNIpu5Z5cri/jYEPpowfTT/oM+NUKwF4OLuNUQ+IevPPH5KDe0xiRuUcDdbsTNadSVJkfBkMzv2qPWML48wuZPtgC4oq9yzjRkyLt2uQY1gj/ZuqEpIb2fCgo518B/2WmsTy3Hx5SOM0eQctRpQ6XuWJl55Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589376; c=relaxed/simple;
	bh=wmw7rjZycybyIbNvBUFpi2OCQA15QPjeWkCIhbl/yfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACeDzn6tkLHmMI2+UtXFrs2nyl29d7hT32z86Xx5azIYlLJlEvxN2BQKppuky3n/OfCHAdI/4SK6wXK/6GOwbfugFxM6Lb1boLWtym7yHpFY7NMhMlYpeGVTCUkEsnFtEdCfZE0nxfA/k9LPDD7IEzVH71BeFhdYZgKg9PbkPlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O0MmlEiP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O0MmlEiP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cp4QVBXTosrfhG+Lu7u6w6aX/RGqSEHj8ufhDCF55Dw=; b=O0MmlEiP1y2p25ZRMFG3TO/YuJ
	YQzI9mM1Mf4gbqcJxIWcAYQqhL6LVN0EI7ZUP31avBZPKbp+Q0I282MkpykzITPfnnlMoqX3+ZSl3
	APFQ8G/MlpXcOPGgs7WL5zXJ+PbDQeEosgA1W/ONkoAw67bK1UMIV3ykhx65UFCyEqKaEoKR2nQ/F
	lH1quiv3Rsp0GzImWw2Ezulwnfs545F9BlaK8O4Oj0WSfplxc+sFeYK/cbJKcZwbvE30gOBYhD1d9
	vvsgfA0SyLyIQNQGbM9rQiD1ZGDY50qc/Akkmuj1YSBwd79ueJcBTNv5qCIjmcX68DZaeltI80UbF
	uetpMCTw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tewVz-000000016yp-1Xih;
	Mon, 03 Feb 2025 13:29:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E7D16300310; Mon,  3 Feb 2025 14:29:26 +0100 (CET)
Date: Mon, 3 Feb 2025 14:29:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Florian Weimer <fweimer@redhat.com>
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
	Vinicius Peixoto <vpeixoto@lkcamp.dev>
Subject: Re: [PATCH v2 0/4] futex: Drop ROBUST_LIST_LIMIT
Message-ID: <20250203132926.GE14028@noisy.programming.kicks-ass.net>
References: <20250127202608.223864-1-andrealmeid@igalia.com>
 <875xlzl6lq.fsf@oldenburg.str.redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xlzl6lq.fsf@oldenburg.str.redhat.com>

On Tue, Jan 28, 2025 at 08:50:41AM +0100, Florian Weimer wrote:
> * André Almeida:
> 
> > As requested by Peter at [1], this patchset drops the
> > ROBUST_LIST_LIMIT. This is achieve by simply rewriting the processed
> > list element ->next to point to the head->list address, destroying the
> > linked list to avoid any circular list.

Well, I suggested we do this for a new robust list.

> Furthermore, I'm not entirely sure
> if this is entirely backwards-compatible.

I share Florian's concern about backward compat here. It might work, it
might not.

I was just saying that if we're going to be doing new robust lists, we
should try and fix all the known wrongs, and this one lets us get rid of the limit.

> Could you use the tortoise/hare approach instead?

That seems overly complicated for what we need.
