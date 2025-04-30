Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E9120E338
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999889; cv=none; b=ajEBmhNqYrFvPnq0dwDQMZblLz93Nb9YfCjKZLzqG2VoTAPMiQqdGYwbBsdqJm4eXLAokPzGJ9GAkmxy4IOqxOkdnP/45C+azmuNMXr8PRqFM1jF/etN4F/Z1wrfu83cEMioOxvJD1qYDZyMBn8mz/lu9NqcQUdTMAPDNZVYt94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999889; c=relaxed/simple;
	bh=LvoKHcJOLssTqoHB1MvZTHF2UQarzvS7x7xLlRZUZlg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H0UX+Fb4grMkQnB5d3IaeCyFcxkM/kRyqIFLme29VE8keO5fJonyCT20nJRPJ+GHjPT6GhrOddyUNFzKuRsBX/rE4K7fJMy3GocZ15v5jijerpUUaQH5asnWVRWQ6ipfas+oDusNtDdHr/JUX7RIBAA5yB5sBNdczLkQzhR7m3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iAiZQnal; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LeyfkhiB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iAiZQnal";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LeyfkhiB"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745999885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LvoKHcJOLssTqoHB1MvZTHF2UQarzvS7x7xLlRZUZlg=;
	b=iAiZQnalZDS4OKKa51OfRKVHG+kZU0pihjP0q1UduxKG/R1q6ktJ633TfmuhnlF6XT2s08
	tu1qMf3smcF1wLE5oI257Dnco6/Jh4COAkAHka6PLn0hmykwIIaWXu9Dgxl04IctyJ21H0
	izkreqv89FKTzmT9VVMCP84oxEQkT6Gr+XtwsmbzMXnSX2zGjaXs4nNBKxMUYl5F00BOsd
	ydeN+rhdSN5kArIbQVQipwlH/nPa6jAmTtkJZaotQPXeSpqgHW/KnggMBSnRohvx2HAy1s
	+vIww8uo7LKOL9FfVtVuMwHuZjRjLDzcDvbpL6uG8RpfyhjpTEdB/miGSgWNDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745999885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LvoKHcJOLssTqoHB1MvZTHF2UQarzvS7x7xLlRZUZlg=;
	b=LeyfkhiBXKlrmcOBKvUq+2cn6h/vPrQASik/GGSLduuDUlR3oanOSipjO/Xt6fdSbhTWR3
	hVtonyWjhV85D2AA==
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, carlos.bilbao@kernel.org,
 tglx@linutronix.de, seanjc@google.com, jan.glauber@gmail.com
Cc: bilbao@vt.edu, pmladek@suse.com, akpm@linux-foundation.org,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, takakura@valinux.co.jp
Subject: Re: [PATCH v2 2/2] x86/panic: Add x86_panic_handler as default
 post-panic behavior
In-Reply-To: <781ef1d7-f9c6-4a15-b94d-c735e83e7d01@gmail.com>
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
 <20250428215952.1332985-3-carlos.bilbao@kernel.org>
 <84ldri7vv0.fsf@jogness.linutronix.de>
 <781ef1d7-f9c6-4a15-b94d-c735e83e7d01@gmail.com>
Date: Wed, 30 Apr 2025 10:04:05 +0206
Message-ID: <84bjseozci.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2025-04-29, Carlos Bilbao <carlos.bilbao.osdev@gmail.com> wrote:
>> I see no reason why you don't just use safe_halt() as your panic
>> handler.
>
> Yes, in my original implementation I simply used halt, but I was
> trying to be cautious in case any remaining messages hadn't flushed. I
> wonder, can we be certain that, as you said, all output (e.g., a
> backtrace) has already been displayed on screen at this point? I'm not
> sure.

Well, without this series, the kernel goes into an infinite loop. So if
the messages are not all out, they won't magically appear during the
infinite loop either.

John
