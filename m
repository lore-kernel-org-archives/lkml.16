Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21E247281
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675361; cv=none; b=H4V/ZLa17z9zKJaxOTD7xKVgwdZzXNDfLLcdGVgI7GcJmr0loPPFvM4ma9G9j6MOZErz/bOIbkK4lhvGvhSCzGFg6ze1mToncWYB84kVZZpjVYOW/dlvB+gPdJGVM9z8XlXLl191YVdcuHXDgiwkO8EPaBYrb2Qp+WgkTlDzI3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675361; c=relaxed/simple;
	bh=X+4PY+mlIT+8LF2h33m9QTgP+dyMn1EKzki/Qbj2tkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3jU/z+d0zAeYh1CpMRzRduPCHNPy/k77uTdJnxIxdebNQhlDT3DzXAATXhnFBGMTphs2sL50zttVE9Q/6LllRIRCyYvf+mHmejY/WMxb8sDRYsTDBw368S+XBbwMiNmMn68dQ3y3xZ2EucaZ67idQmTgRg0M7MBZRUcrmq9KHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=o1rNmTQf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="o1rNmTQf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lZ37O6/bQCcZ7ot8ha/3x+lwsEoCbg1QueQkHmcxcBI=; b=o1rNmTQfj07yA6nHYtMZtl612K
	jO/8V5JBIJiw1Iz9YmyNq791nep2aF0qs34gT6Tcp3FWXSoMm8EB8feuGhxkGukIxuQTf/CTj/b0+
	yA2g3ZXTH52nhGX1evs92cfDkFaJs0TQNwgJNmmMsSpgKBxenR2cySLizKJXXC3GBNeAi0LPOpUdf
	530sS4B+JVOoSQFLN1Wy58MDeZKgBCNSi7UcKtHqNPm8rSmQ27FtEPos2OrcPQR0N4+yLjyXUIJex
	sbEqdQjjVkZhjgBnkOFkNk7SFN00+4RvLA+/WojFZzT9BcDNrz5gkyW1lv60hGyfOZuWeyp3MisJ+
	DLlUsQ+Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTedH-00000005Blx-2Pey;
	Mon, 23 Jun 2025 10:42:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 313E3307E51; Mon, 23 Jun 2025 12:42:34 +0200 (CEST)
Date: Mon, 23 Jun 2025 12:42:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>
Subject: Re: Improving mutex_init() optimisation for !lockdep
Message-ID: <20250623104234.GQ1613200@noisy.programming.kicks-ass.net>
References: <20250623092832.nmgJY7V5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623092832.nmgJY7V5@linutronix.de>

On Mon, Jun 23, 2025 at 11:28:32AM +0200, Sebastian Andrzej Siewior wrote:
> Hi,
> 
> while looking at the assembly of something else I stumbled upon
> code that originated from mutex_int() on a !LOCKDEP kernel.
> We have this macro:
> 
> | #define mutex_init(mutex)                                               \
> | do {                                                                    \
> |         static struct lock_class_key __key;                             \
> |                                                                         \
> |         __mutex_init((mutex), #mutex, &__key);                          \
> | } while (0)
> 
> and the compiler computed an offset for __key and an offset and storage
> for #mutex. These two arguments aren't used by __mutex_init() but the
> compiler can't know that.
> If I remove these two arguments on a x86-64 defconfig, I see:
> 
> |    text     data     bss      dec     hex filename
> | 29753523 8033942 1306232 39093697 25485c1 vmlinux.before
> | 29748880 8021654 1306168 39076702 254435e vmlinux.after
> |     4643   12288      64    16995  0x4263 diff in bytes
> 
> That is 4KiB in text and 12KiB in data. I don't know why we lost 64
> bytes in BSS.
> 
> Any objections in redoing this to save some bytes?

Nope, easy win :-)
