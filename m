Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050FD1F1921
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829206; cv=none; b=uUGdAlZwMl5e7WWAACWjnrG8icoC7AIGNAoL6tlpTKxXgG5EpLlUI2sSNWtRoshD6+00ul2ZiIufIOmoFsDjxDs8zKFM+PIhMYW+vZ3XVUvEJs8VxSoMdpiB2CTWN2i9+8pkxnVsOWq8QuKk6U8NaAFI0g+8TP5Zj68clvgfOuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829206; c=relaxed/simple;
	bh=/Fcas6ro+8QXpJq3f4+Te/XWeUrdtIghcFBC23AUpR4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U+TSO/Sl3OJ9X7r3ewjOs0uKn4TZ+To4ngBSUOf/SJG9Q/2yOFrNThGd8ZhNoymJ2TUBTQvvzVCQyz/izGlSjiPE6XuvtH3mKWfmv1XQBgLz0PP0BWthil8ILIMbYf8+Jbmjy/FTz8EIoBS2tBf+y/V5c5u9wYGo5dIel+iIXDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CNx8OzDj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0gZk5apd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CNx8OzDj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0gZk5apd"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749829203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TaQZQtTz1HtudHwMx5/OnGligHxYHfIL7eZklTFREfY=;
	b=CNx8OzDjdTRye4F39p5xBWerNEeVOi58Ti2AQRfkT2UzCx5gbCot9HDWOVKPJoZ5zXJ0Ml
	QI9AGJrjVFccnA0kgzcL1O/tosEa5PkvFxZhUIjKxmRvDslh3BwVdyE3QD0g/8ixu5Xhnd
	WU/owDeK/qhgWyozpT22kUiMm6GfiwEW6GkqcA3rzJVmIGz4GbZ5svtgEM9I5sg3QCSLs/
	WAMahz4YPLdXIpEss9oxxMNKpshr3Xi+mV59d03u23XHjcc2J9m+sFLnvERUKnYJmmHRtD
	Iqy2u6kiEvoFb326OIMi72lKxvaKQ0buK8WVyg5KHx3osjqIbtZkFniAECgaIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749829203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TaQZQtTz1HtudHwMx5/OnGligHxYHfIL7eZklTFREfY=;
	b=0gZk5apdK3gAKFCWyWt/3euPaZBTW0QFo902nY1je476fHc6uNZ+FSrgl1IXlVSPiTcThG
	R9jzy5vHe5ZfgbDQ==
To: Waiman Long <llong@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] timers: Disable memory pre-allocation of timer
 debug objects
In-Reply-To: <b04ae490-0878-4d39-a6c8-406d4dd3728f@redhat.com>
References: <20250606031539.1004644-1-longman@redhat.com>
 <20250606031539.1004644-4-longman@redhat.com> <87o6ussjld.ffs@tglx>
 <b04ae490-0878-4d39-a6c8-406d4dd3728f@redhat.com>
Date: Fri, 13 Jun 2025 17:40:02 +0200
Message-ID: <87bjqriral.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 13 2025 at 11:13, Waiman Long wrote:
> On 6/12/25 6:03 PM, Thomas Gleixner wrote:
>> I have a hard time to find the printk() in rmqueue_bulk(). But if there
>> is one then it has to go or has to be converted to a deferred printk()
>> simply because that code can be called from so many contexts, which all
>> can legitimately create a lock dependency chain into the console drivers
>> in some way or the other. That's like invoking printk() from the guts of
>> the scheduler or locking code.
>
> Actually, rmqueue_bulk() calls expand() which, in turn, calls 
> __add_to_free_list() and the printk() comes from the VM_WARN_ONCE() 
> macro there.

Duh. I missed that one ....

> In a sense, printk() is called because of some other issues in the mm code.

:)

Thanks,

        tglx
