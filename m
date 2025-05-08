Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745511F5F6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726814; cv=none; b=m5hPmIcKokAjq2vTEjhgoBhSsfvkqJ5dhSLTKm60umb0Mp6ssUalE9DgBhDS7cMDJDG032BZWWYPH42sxonR3oFhTM4iD+ROhNznXXVaz+5XfMsoZN5MbVxkbcI9mcoo8o6u24UVWwiIWPxy01CRoCAZyNRaUhPR7sHse8WIJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726814; c=relaxed/simple;
	bh=lBOp2XrGC6XM1Os6fi4o16zQsjiBjLiZBeOLkVfY1hI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qsSKJcOgsUpmvXYPyXwwdCPrlHervLEklhByel8zW9WN6AtvJqJSARSwdsbW1ulrFlz4WgM6U1jsMF2oVgQdW+LhbshEjmjrg+C+ur4KZknnBBFMJuA+Wsbo9fzxClofUkV1ei0zNuxaoZB5KTEjv7EAc35YRpADwiFzM87KATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=plW2TuDl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kKzfQn94; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="plW2TuDl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kKzfQn94"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746726811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a6QqOlw8a1IlKm2YQpUADTMo7RKebtfKKBIIeV9F5/0=;
	b=plW2TuDlD8QxcfkGKsnPe6DUisM6i+iY3HZVi+B6FulnD5haDt82FleYjeAjsf2oksHqpV
	lxAKoxEcmiDi1sCnx55geazv4R/o3R7wwXiSWFOWa5RY2rM8LvFArGzDpwhHoN36/Y3AUN
	i0qNe/GSjZrHYzMddlx24t6XMzLu9LH4u2GDA7PciAapvyJkWk7ZfIYo3kSE3TIwgCsUNg
	MleEh+ihrMO5S5+hpFfF4/NyQPCXPX8miN0+mV/e+LgcsUWmTMR4VINeaW+sW9mpoFz0un
	TyeB0SRBBjbIi2dl0T/nLGzSXNTwiqPRS4peYfG+NVE6/+S8CWwUjaThG0QBrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746726811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a6QqOlw8a1IlKm2YQpUADTMo7RKebtfKKBIIeV9F5/0=;
	b=kKzfQn94lX3S1HGMG5+JptAQqsktI+tL8PjfX+T6f97lRSp9rUnqkdubzCnfJG+9Rn1cz9
	xJfwlAie5nbn2cBA==
To: Marek Szyprowski <m.szyprowski@samsung.com>, LKML
 <linux-kernel@vger.kernel.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch V2 09/45] genirq/cpuhotplug: Convert to lock guards
In-Reply-To: <45b7034e-67f4-4f8b-bef3-5350f6419e79@samsung.com>
References: <20250429065337.117370076@linutronix.de>
 <20250429065420.560083665@linutronix.de>
 <CGME20250508145631eucas1p2f5369234fee8eb86761d70d028d6c82d@eucas1p2.samsung.com>
 <45b7034e-67f4-4f8b-bef3-5350f6419e79@samsung.com>
Date: Thu, 08 May 2025 19:53:31 +0200
Message-ID: <87v7qbkmzo.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 08 2025 at 16:56, Marek Szyprowski wrote:
>>   	irq_lock_sparse();
>>   	for_each_active_irq(irq) {
>>   		desc = irq_to_desc(irq);
>> -		raw_spin_lock_irq(&desc->lock);
>> -		irq_restore_affinity_of_irq(desc, cpu);
>> -		raw_spin_unlock_irq(&desc->lock);
>> +		scoped_guard(raw_spinlock, &desc->lock)
>
> The above should be "scoped_guard(raw_spinlock_irq, &desc->lock)", otherwise the cpu hotplug is broken as in today's linux-next.

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/core&id=c855506257063f444044d0a85a2e9ad9ab1c7ecd
