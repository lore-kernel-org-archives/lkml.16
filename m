Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540D51FECB4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827550; cv=none; b=ETPKEpibC2/yyTEarm6rzDb35NwjSV+rI/PTy1u9DFbxhOklflDuVZqq5lYZ9bCn10bM/o5AwhX7fWguXOQWNfjsKyTiH2/1uXPhKmsSfyx9gcDNRy+usFTAWfBIaBsfg+2Od2xnLhn+Fq781fLxznpYjL4zR/w18G8o/pSA+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827550; c=relaxed/simple;
	bh=O7+wBp3jrxFqs0rsHHQxwu6iKcNOltLmKuL98WKINYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZJSOpf5v7Uj2zI7lGeNVCliqaXWAP8WAlcxbSZWhImiApbhTKFQhSGaMlFi81tSJguRV62ztHdQGwDNfmmszQfrsfI7Uq4YWujUJZvbDQmo4QM2LAQtuFjrzVqO76eSX7mEwpwcZA5W3sv8Tsv/MJi91bB16K0jXKfHhrPd4GLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D5+M0xwz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6H6zXolH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D5+M0xwz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6H6zXolH"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745827547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O7+wBp3jrxFqs0rsHHQxwu6iKcNOltLmKuL98WKINYs=;
	b=D5+M0xwzsQBCKtJetI9jZNWCZVECj9GmZvmqLDL5cxEcjozOSXuQppMT7dw36nBmLYFf+S
	c73vhY/yAevcoQp9xF0JwA52eBSTNl3dfrCDM2KeqHCfsD2jHrmAyljRkeNonW5ekv/gNP
	9vN8525cHwfqcm/n5Zuo7hwY1KkYMSQinZQaygSSHmn4KSsSGw23LP5sniPRGyU3br4b8x
	pekm/C7i/kWG94atRikIaCYRC75XZTXNbQo6Iv0hfytAgqd28T6j1jH4Ew159VitgIKGlB
	Rn6IDysM5zdERFMyJyaOlJAKa357jnzpfBFWraq9TGD9HcUNQsEWqSQKr6FxlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745827547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O7+wBp3jrxFqs0rsHHQxwu6iKcNOltLmKuL98WKINYs=;
	b=6H6zXolH+MrLWuO0OsmpDiyO8AAZkH/ZgC3gD/QHYbsPuVD+jSZv4mmLjDXN8vpND4uyrF
	jtRnVDu+NyxYTEAA==
To: Petr Mladek <pmladek@suse.com>, Tomasz Figa <tfiga@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Steven Rostedt
 <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hung_task: configurable hung-task stacktrace loglevel
In-Reply-To: <aAuq-3yjYM97rvj1@pathway.suse.cz>
References: <20250424070436.2380215-1-senozhatsky@chromium.org>
 <aAoZbwEtkQ3gVl5d@pathway.suse.cz>
 <CAAFQd5A6J-UCy46bp1MYP0imJf3oUL29mxFVLZZZ4JmP2YTvhQ@mail.gmail.com>
 <aAuq-3yjYM97rvj1@pathway.suse.cz>
Date: Mon, 28 Apr 2025 10:11:46 +0206
Message-ID: <84selszp5x.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2025-04-25, Petr Mladek <pmladek@suse.com> wrote:
> I am afraid that manipulating log levels is a lost fight because
> different people might have different opinion about how various
> messages are important.

Wasn't that the whole point of Sergey's patch? To make it configurable?

I must admit that I am not happy with the patch. Mostly because it is
too specific. And I am not sure if we really want to try to make it all
dynamic with a report API either. At least we need to think about it
more carefully.

One thing that crossed my mind was that we have enter/exit markers for
emergency mode, which should be used whenever something "bad" happens. I
am wondering if a fixed loglevel could be configured for all messages
stored by a CPU in emergency mode. This might also encourage developers
to track down and mark more emergency sections. For the nbcon series, I
really only picked a few obvious ones, but I am sure there are more.

In other words, I would prefer to recycle the emergenceny enter/exit
markers rather than introduce new ones. (Unless we are also talking
about reports that are totally normal and acceptable during runtime.)

John
