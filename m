Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3450A19ABD8
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746266954; cv=none; b=ibaMjzqB/qlas4nC69DgC3+eARxh163+z791BqN6CZAIG35OO2wpSWTImTQVnZPnD4GdRx1uNCBWBHC4F4uUHJ5PwbPtUpaZWNt6un/IGtdVKLG+5em0Z3Dp6wrepBCKS/yMZVWxyvqemsaLGDK4SuD1GV2KUGQK4XCka6Y2Rko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746266954; c=relaxed/simple;
	bh=+xcZEYy8/MdBIFUjE8EDeqVy5uog5t0NsiP2Ifz3DDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5J/N5xHiXD2iHWC5kohhWrzVPRvxvDDjGuaWpeKr1oocQg7yNenrdGdbqaMN7zR0R17mPcu764Or4gTfAn/q0FdAyb0lKPjTu5mKCaq+TU0reb6q4jQAOOcfPdVWDRdOj35vSJm8v460N0kKBEVq1KKHOSeA6XyUdX+do9a0eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HdmkUb0b; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HdmkUb0b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QPqVojQUKozUgx8QIPic+aeF6sUNM3GUPzmbj52BxRo=; b=HdmkUb0bm1EhZ6ordPmEOifOdm
	KD3//QxTE7nYNCRfRnPTFaodtrj4gLuW8Ha6vzb1J37yKkLdXDM0EK+sWOyeWvuBD3VPTNKyUt4IM
	BbyJliutJ+P2niZ33sjEEwd0rjrtTFEHXQdL+nOdo6AQV1ZW+5ZBRRt8tvJ57EgEOfDqH8tly5jDR
	/YPaQdWKV9TyzqR6q+1GtJUGzuKrW7yd8a5uquGmZipCvprnxhG/PSCOJ2krzEfvlkfY5We39RyMc
	fdODqa6WW9Pi4hXAywjgTJl/WOwp94+AMw4RBTLrQHhPm6I1byeDgR+rjdT6R4MjW1tvdV+N+1TTs
	1MXtmMbA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uB9nt-0000000FCVK-2LWL;
	Sat, 03 May 2025 10:09:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2AFB5300780; Sat,  3 May 2025 12:09:05 +0200 (CEST)
Date: Sat, 3 May 2025 12:09:05 +0200
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
Message-ID: <20250503100905.GG4356@noisy.programming.kicks-ass.net>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416163142.aKBzQeqK@linutronix.de>
 <20250502194807.GD24078@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502194807.GD24078@noisy.programming.kicks-ass.net>

On Fri, May 02, 2025 at 09:48:07PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 16, 2025 at 06:31:42PM +0200, Sebastian Andrzej Siewior wrote:
> > On 2025-04-16 18:29:00 [+0200], To linux-kernel@vger.kernel.org wrote:
> > > v11…v12: https://lore.kernel.org/all/20250407155742.968816-1-bigeasy@linutronix.de
> 
> I made a few changes (mostly the stuff I mailed about) and pushed out to
> queue/locking/futex.

And again, with hopefully less build errors included :-)
