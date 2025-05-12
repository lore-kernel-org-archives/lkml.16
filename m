Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B087258CC1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075188; cv=none; b=OImCwGcYHsGd8NePF6Q3s5J1spmz43FdGn2sr2KmlOwxXY8QOFaDHMP7hIWDkSPCqyW5Qb+sWji9faKfWjz/KZrASOf2+dMwBuPSAtLNo0/InkIoApkh0e08MWNxHKbDHBPPn+QV2TIPDMkHKk4L4HHDUYeIHh8EoRfMjYFrgHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075188; c=relaxed/simple;
	bh=ECwW59vFmenE2BBhZX1rLic9ticizdBji5LyNxYrMtE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dp9FJlxEhuQ9iwzbHHBPZFApT25ZpVLNc20uE5COOb37vFo89l8h4xwSwtUFlpPBW5HWzvFDkH2Cmw0MpU7hwc8OHyt4IiVb2+lzfUct0SuH3XhNuogP2AOF7XUEWYMDwu6urqd4iitUM+rZGHaCIbpzv8GN0WhykB/JVL8+f2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hJMKA9Q2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nteKNkTV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hJMKA9Q2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nteKNkTV"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747075183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cK3xJ5pJNYJ3j1COJS57eqqja4Zq/sal5DSpxwwYVJk=;
	b=hJMKA9Q2V9J0SOiR8Yr/IzcUkufInnkE9ptuNBeyYNhNua7M7AbWj53QZKeuj8ePw844ua
	QpEJE7xP8SvQy7pDfg6ZEV6rPwrbqG9M7xL4NX59/9+9dET3Cgl39WUYyXHcaQiZE6BhbM
	eeel+0s1tnhuOWTEYWTwIUyf9MlWc0MtZZo63DDFQi+x16X0Q+8Ytfcw0zu9gzEFji9/7I
	wSSrCOvZAH5jirkahPsooXrvEkIiUrSa7gy7XNnb0JfDeS61Cn5q2r/X3827CHGXLep+/r
	HqAZ1+1h843iJJDDonovO4zQtc5/vyFe9yDfpuBa05qEqbjoJZhQoN/BWW2oUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747075183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cK3xJ5pJNYJ3j1COJS57eqqja4Zq/sal5DSpxwwYVJk=;
	b=nteKNkTVYbOA5Q0st3NrOoVGfzIeHXBcfT98nwaLh79qu3ejvCEDp5Xh705oBx2VVUIrma
	7VkC9eLwci37r2Dg==
To: Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kernel@vger.kernel.org, peterz@infradead.org
Subject: Re: [patch V2 26/45] genirq/chip: Rework irq_set_handler() variants
In-Reply-To: <0a61672b-1782-43ea-bf10-b6088a1fd2fd@kernel.org>
References: <20250509132211.GA3618294@ax162>
 <20250511172911.1008109-1-ojeda@kernel.org>
 <20250511174923.GA3193067@ax162>
 <0a61672b-1782-43ea-bf10-b6088a1fd2fd@kernel.org>
Date: Mon, 12 May 2025 20:39:43 +0200
Message-ID: <87bjrxlllc.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 12 2025 at 09:25, Jiri Slaby wrote:
> On 11. 05. 25, 19:49, Nathan Chancellor wrote:
>>   {
>> -	class_irqdesc_lock_t _t = {
>> -		.bus	= bus,
>> -		.lock	= __irq_get_desc_lock(irq, &_t.flags, bus, check),
>
> I assume the value stored by __irq_get_desc_lock() to &_t.flags is 
> overwritten by 0 by the initializer. class_irqdesc_lock_t::flags is 
> later than ::lock in the structure, so __irq_get_desc_lock() should be 
> called, setting ::flags, then the initializer should set flags to 0.

That's what you'd assume. But indeed the compiler might decide that
flags is uninitialized and then overwrite it after the initialized
fields :(

Nathan, can you please send a patch with a proper change log?

Thanks,

        tglx
