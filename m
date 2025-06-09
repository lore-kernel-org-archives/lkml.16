Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73D9204F9C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462621; cv=none; b=LcMV88P7iQM4dW4TUChFr7aGd8nzgwfPNGDYvHeXgIC/duES4Cx6P0Sx4QLRjKXDbPKjyh2I55ut+NVFg+mInESJh6GEA3GmwQK08y9BV6AeAIG7Xbls9yLBSCd3L4vBORgMVQ2XOfFm2QadygE44fJgjBB7vZiW7zqISYe1OJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462621; c=relaxed/simple;
	bh=FWGBvYAMVcHEvCmJwnyaFb3mVy8uSeOvKuPGtiaYSWk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qWtDbYLB8rUwpVflrFzKO3Bq5jzARTdsnhw4FRYvIqOEz7YxlbO5PEj5S2aiQ+BbEzBIzf+NMW7LvwlW0XAe63svUreerSJF9vZUF+rkGgsIK/tyfc3e7NsOpdRBnCkOuiDMowEt2EYZmT2ra3a7QU7aroqUX7jgW8N24wKaJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fb5QSuC3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TMmLSqt/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fb5QSuC3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TMmLSqt/"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749462617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mbz04pOM3NYmx/zT2wl8ZoqNB/eXgeWPDviW1H791pM=;
	b=fb5QSuC3krZuYmrsc9ISCrgUEYqmdJqTR3jLEuwH/gKWpzffVZ5PEg9GDLWBZEjtQDiPiv
	U3OsHe8h0sDlDE60V8ZikpAs5RE40RFT2F2x3zp8aSi5jK+Ki7LxW8PyPRkloPM0ztqHQ1
	+xJNe93K7cfa+sAk3KpXEX8093ET4SXGGYnhiEfQZ7IxV37XXzIdUPn96IyXLbkx+5ir9K
	fMZnHjjNRLeOe8Rq3BtmEK7nhT0qJgDQBfIIWX0XpQNHU0/uVDqKLN2HZwwUD+NZuJtKfh
	9C4x08WCnEW1RKcZZzlOMVEr+WmSWs6nTlEMW3lumwJSOwS0kHAT29XA/jmiMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749462617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mbz04pOM3NYmx/zT2wl8ZoqNB/eXgeWPDviW1H791pM=;
	b=TMmLSqt/78pSMqdwBAy2SNly0YOaD7tYq38EIXaW0gV2h2OsZS2jalFbPGL47BGStjO1Wp
	K23lXmvTZj5ilIAw==
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch V2 06/45] genirq/proc: Switch to lock guards
In-Reply-To: <873b0e9a-0e71-0eaf-b057-8a118d9ccabf@huawei.com>
References: <20250429065337.117370076@linutronix.de>
 <20250429065420.373998838@linutronix.de>
 <873b0e9a-0e71-0eaf-b057-8a118d9ccabf@huawei.com>
Date: Mon, 09 Jun 2025 11:50:16 +0200
Message-ID: <878qm1p7l3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Jun 08 2025 at 20:45, Zenghui Yu wrote:
> On 2025/4/29 14:54, Thomas Gleixner wrote:
>> -	raw_spin_lock_irqsave(&desc->lock, flags);
>> -	if (desc->affinity_hint)
>> -		cpumask_copy(mask, desc->affinity_hint);
>> -	raw_spin_unlock_irqrestore(&desc->lock, flags);
>> +	scoped_guard(raw_spinlock_irq, &desc->lock) {
>
> Any reason it has been switched to a raw_spinlock_irq?

Yes. This code is always thread context and can never be invoked with
interrupts disabled. So there is zero reason to use irqsave().

> I've hit some random Oops with the backtrace looks like:
>
>  Call trace:
>   string+0x110/0x3b8 (P)
>   vsnprintf+0x2f0/0xac8
>   seq_printf+0x180/0x220
>   show_interrupts+0x4e0/0x7e0
>   seq_read_iter+0x350/0xd80
>   proc_reg_read_iter+0x194/0x248
>   vfs_read+0x5b0/0x940
>   ksys_read+0xf0/0x1e8
>   __arm64_sys_read+0x74/0xb0
>   invoke_syscall+0x74/0x270
>   el0_svc_common.constprop.0+0xb4/0x240
>   do_el0_svc+0x48/0x68
>   el0_svc+0x4c/0xe8
>   el0t_64_sync_handler+0xc8/0xd0
>   el0t_64_sync+0x1ac/0x1b0
>
> I haven't dig further. But it looks to me that this patch had introduced
> functional change and I'm planning to give the following diff a go on
> the same box.

That won't help at all because the actual crash is within show_interrupts()....

Thanks,

        tglx
