Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A90376
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215298; cv=none; b=CxbyDlYw52PYI6Qp8+r7HtqnaDC+Oa7p2Lc9xZVCq66/wIWMScHkfXladXunYeew7G43RJbTdRjiFLaMNeJFxe6fndKzJwLTYk2q3FlRlb0NeViiL3qfrExeLQ8H6smhaPWnC59aPWHsQni2Ul/BX7EAWth5s7QtT8yW1oPMpbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215298; c=relaxed/simple;
	bh=ZSiygvF3WdzaX6LwXuj+ax4Ko068Lty+tICzFsRJhgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkF/EUmIyK3nIALnl0paYSEG1XZTcs5LBUajw3TK6Bzp8MZHmC2IbQzKii0R8olm8KXZNnp5HEr1/aV1N9DJ4/Ao5E+OGVb9hPdDOZoUi4ki8y1p7lGS+JAGasr7oqQyI8AAjZRZrEUJ+MNwxsjUF1Viizm4TUiklXHaJsK9z/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pYpdy97q; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pYpdy97q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZSiygvF3WdzaX6LwXuj+ax4Ko068Lty+tICzFsRJhgc=; b=pYpdy97qho1iGh9jkTyENWSi52
	AmQJgqKRzvYAyK+th2Xqqwd5RafoneKsEWo1l/IXsabppnfHQ2wNzOKOmOUHKz19k21IOi1OpnmE6
	GpXpio/6raz7OtBR64GrVk1jAq9RRov4vznkB3r962nJ23k2YkEDCT2HiL5qi7WHrtxbGzaHK05TP
	NGe5Q1AX8eWBXTOr3K7OKhKB+0yfCLwJYsIbib5sF5dR4jp3xRjkwPNBhxcjCs7wZZNIrMhJoj7zq
	qix7on8xYYhbOXKOIiDXCH9ziL8S8CWztBlvnbusmnhDIqaLWhjhn8BCzw+rQoVq8jP8bwRVAjS6D
	CPmkkuzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAwMi-0000000F5up-129G;
	Fri, 02 May 2025 19:48:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AAE1D300321; Fri,  2 May 2025 21:48:07 +0200 (CEST)
Date: Fri, 2 May 2025 21:48:07 +0200
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
Subject: Re: [PATCH v12 00/21] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250502194807.GD24078@noisy.programming.kicks-ass.net>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416163142.aKBzQeqK@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416163142.aKBzQeqK@linutronix.de>

On Wed, Apr 16, 2025 at 06:31:42PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-04-16 18:29:00 [+0200], To linux-kernel@vger.kernel.org wrote:
> > v11…v12: https://lore.kernel.org/all/20250407155742.968816-1-bigeasy@linutronix.de

I made a few changes (mostly the stuff I mailed about) and pushed out to
queue/locking/futex.
