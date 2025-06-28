Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A220101D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751099022; cv=none; b=gvwzQfa9Ig64iOJxwjz3KD9H9nteuqa69ZjIEGcOG36PWedlvE58FosKtTzg64Y5yPsSlxBE6Z1TN0fKdGvX8Wx7G8EVfzY8X76YS47CSO3Yp+lgHdAnEkJI7RBn7vHQn+P0ICM10CZ3jPmeYHVb7fvn2l4D35sY5BQoumzD9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751099022; c=relaxed/simple;
	bh=+FV2cHivJbRQhsJPTol88zrCBUfZNpp1xBgFZHTyf6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyFecB7c/QHtV2v6y+fV2eKoMypkybo6yJ5BcSt7bdG4+0NQcw1zznTok70Z4vH06883crfEylZYhZfRa0/HZqG8pXXJKRnF2lsayonrQ/npRXGPfHwvfoimPa2IeIxzF7Mf09I4ctUe+hDaieFc2Rccqk0g7p35O+S0EQJ8cps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qu9WsoQz; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qu9WsoQz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AYLgi4wrAV/zGcb05tYA3iGLtDxWH85sj7AL0yYFSPs=; b=qu9WsoQzC8K/nOVEDj0ax+27XG
	6zVkTDFk9/ookavpT8a3sv74/wsqHYLwpRBAGumzODrVNE+6ojaJq0V2ww/RN3SvowlxwHnDYWPnl
	/oYxVA/T1Wab3AcbXyKaKkHVVKRFk0OT0y+LMqJU4FewKBM9HjI/HR+AMrdF+T/pKHbVCG4BcaM3g
	Io0O7hP/TGx4GerNV/l/BVJLfh48XP4kY+14J2H250jpaEMrg3dV7ugnJPxTBjqr679AsauKAoUkT
	edATKzNvqGcDbAIy43ZK9n5OxedrcBAdxpqFUmCzlWsSNj7f2q4LO1Lj4I/qfV0lAxd7CQMc9Ju7v
	xHqB3YTw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQqO-00000006TGH-3ESD;
	Sat, 28 Jun 2025 08:23:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8A313302ECE; Sat, 28 Jun 2025 10:23:27 +0200 (CEST)
Date: Sat, 28 Jun 2025 10:23:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
Message-ID: <20250628082327.GC1613200@noisy.programming.kicks-ass.net>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
 <20250604092815.UtG-oi0v@linutronix.de>
 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
 <20250604200808.hqaWJdCo@linutronix.de>
 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
 <20250606070638.2Wk45AMk@linutronix.de>
 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
 <079dd4850554107056c536cbcb321572deaa8fde.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <079dd4850554107056c536cbcb321572deaa8fde.camel@linux.intel.com>

On Fri, Jun 27, 2025 at 03:48:12PM -0700, Tim Chen wrote:
> On Tue, 2025-06-24 at 21:01 +0200, Peter Zijlstra wrote:
> > 
> > How about something like this (very lightly tested)...
> > 
> > the TL;DR is that it turns all those refcounts into per-cpu ops when
> > there is no hash replacement pending (eg. the normal case), and only
> > folds the lot into an atomic when we really care about it.
> > 
> > There's some sharp corners still.. but it boots and survives the
> > (slightly modified) selftest.
> > 
> > ---
> >  include/linux/futex.h                              |  12 +-
> >  include/linux/mm_types.h                           |   5 +
> >  kernel/futex/core.c                                | 238 +++++++++++++++++++--
> >  .../selftests/futex/functional/futex_priv_hash.c   |  11 +-
> >  4 files changed, 239 insertions(+), 27 deletions(-)
> > 
> > diff --git a/include/linux/futex.h b/include/linux/futex.h
> > index b37193653e6b..5f92c7a8ba57 100644
> > --- a/include/linux/futex.h
> > +++ b/include/linux/futex.h
> > @@ -85,17 +85,11 @@ int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4)
> >  #ifdef CONFIG_FUTEX_PRIVATE_HASH
> >  int futex_hash_allocate_default(void);
> >  void futex_hash_free(struct mm_struct *mm);
> > -
> > -static inline void futex_mm_init(struct mm_struct *mm)
> > -{
> > -	RCU_INIT_POINTER(mm->futex_phash, NULL);
> > -	mm->futex_phash_new = NULL;
> > -	mutex_init(&mm->futex_hash_lock);
> > -}
> > +int futex_mm_init(struct mm_struct *mm);
> >  
> >  #else /* !CONFIG_FUTEX_PRIVATE_HASH */
> >  static inline int futex_hash_allocate_default(void) { return 0; }
> > -static inline void futex_hash_free(struct mm_struct *mm) { }
> > +static inline int futex_hash_free(struct mm_struct *mm) { return 0; }
> 
> Minor nit.
> 
> futex_hash_free() is defined to return void for CONFIG_FUTEX_PRIVATE_HASH
> config. But is now defined to return int for !CONFIG_FUTEX_PRIVATE_HASH and !CONFIG_FUTEX configs.
> But it seems like nobody is actually checking the return value.  It
> seems to make more sense to keep the return value as void here so
> the return value is consistent?

YEah, not sure what happened there. There's a TODO item to actually make
sure someone looks at the futex_mm_init() return value, I guess that's a
good moment to clean this up too :-)
