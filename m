Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12322BAF4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025907; cv=none; b=LDKso8PsJlfygOxeYv2FfkmzHf2Rfl6lk0hOb0kiJlghcO+96SxLHzOxXeJNXefB8Ufndc4euatOyHOyWxmHjemI3Fvtmk7pvCCQR3wuBqq1GMjd9mj3p2TehOKOjJXLI26bJAehhTEPHBjiWFgeaAj5oMhVGB4ikAGh3u/iUDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025907; c=relaxed/simple;
	bh=d65MstfFvuzOXxquIWVaVULj0QYTs91IuDc3ZONuqOs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z1IUEu1qLfXDJ286G9PQiC+AkDTdnWfcVdE1uLf91QaY3T8K0tOnH3lpQUxNFYObQmTBv0GVf1c00UMom6Gp7i9MasK4gpDgJPiBv0A48oYKLy5Ada/YjeCoah2RaxLLqY6FQ6Id0mWPVIirSdHTre85uxMIK5f0oeMSQKqE4dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CLy9I11u; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QN/ZIwAX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CLy9I11u";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QN/ZIwAX"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749025903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d65MstfFvuzOXxquIWVaVULj0QYTs91IuDc3ZONuqOs=;
	b=CLy9I11uUkHUoiLMNCiMfZgRvMZYKwO56zSjtE2suePuugkT313N9CHUvtmdn/OAJXoAOl
	74J0Wo08dFhwJdTCRrYvGcS+pDa2ZRJvaKoqwqq1mM4tRNFggjAGnfapYT9KdEptmk1HSa
	yHK1Sg6OVVOoZUx67oPZ1QhFknK0xhJ4E/sdAP74bGhvLldR6nBYaYmZpYT21Bp3GGusK2
	RQ5E71bqtgAw+uNsOhoU58H8SqxTQCHjGSXQdOY7qit625Colz8swiICqEoUg6hmq4vceb
	/oPNlxHJ/TOBs773cZLA76hUrufYmZixbk1En4GODYDEkmWqlSN3fAU15sDtYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749025904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d65MstfFvuzOXxquIWVaVULj0QYTs91IuDc3ZONuqOs=;
	b=QN/ZIwAXPkroA1wzqBT0aDMNdXXdbNxfTD+attYp6//myNqdBhIG3BdjKeZW68Gj9vBi65
	uG259TgMGXY49xBw==
To: Vlastimil Babka <vbabka@suse.cz>, syzbot
 <syzbot+23de6daeb71241d36a18@syzkaller.appspotmail.com>,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, pfalcato@suse.de,
 syzkaller-bugs@googlegroups.com
Cc: Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Peter Zijlstra <peterz@infradead.org>, Petr
 Mladek <pmladek@suse.com>
Subject: Re: [syzbot] [mm?] possible deadlock in __vma_start_write
In-Reply-To: <f03916ab-19fc-4832-b564-58d3c885011d@suse.cz>
References: <68387feb.a70a0220.29d4a0.0830.GAE@google.com>
 <f03916ab-19fc-4832-b564-58d3c885011d@suse.cz>
Date: Wed, 04 Jun 2025 10:37:43 +0206
Message-ID: <84qzzzoqkw.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2025-06-04, Vlastimil Babka <vbabka@suse.cz> wrote:
> After consulting PeterZ on IRC, he said:
>
>> so the thing complains about: vmlock <- mapping.invalidate_lock <- bcachefs_btree <- console_lock <- &helper->lock <- dev->mode_config.idr_mutex <- mm->mmap_lock <- vmlock
>
> so bcachefs is doing printk which wants console_lock, and in
> drm console a possible lock chain exists that can lead to mmap lock
>
> To me it seems all rather theoretical, but not sure where and how we could safely
> break this chain.
> Hopefully one day console_lock goes away? :)

It is a known problem that any caller holding a lock used by a
registered legacy console will result in printk() deadlocking. This is
particularly a problem with the port->lock and power management.

One workaround is to enable CONFIG_PREEMPT_RT. ;-)

A year ago (exactly) there was patch [0] providing a "threadprintk" boot
argument that would also work around this problem.

However, the only real solution is to convert the legacy consoles to
nbcon. This is work in progress.

John

[0] https://lore.kernel.org/lkml/20240603232453.33992-17-john.ogness@linutronix.de
