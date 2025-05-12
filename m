Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776301DE8A6
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747060503; cv=none; b=B82R9HknjRlB7iKMQ4FiIfUf8W+NlZUSBVzDqyDyf47rHX0Yvby9PP4tJPnZlCXpDZqT2LEhKCIQF4NlW1xl6knyQfiUuG9HsUsf++NmMyI3/z1MOXKVbEhyuCSklXW4x3s/LqBzL+H1eh4151L866YAqxqqx5uBR6XwRAJLlts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747060503; c=relaxed/simple;
	bh=xhv4pSNo/bP0y04upej6zvKi0Q8Y4CFivOjiBqrc04o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VftXQtwa/NDnJGt5iUMQARddffrvr4GHyKf8qFUNNVum464oXMzH9zQ4hog1b8uN+3hUzaMNA+ajzl73CseRqOQvDJaTGvINSwbRNUR/y8VGOLnotXTBlSHKZ65YWZj6WW6NNoZEX49CJZx2zcNBuGyQVThMP8EWcVf9GZ+2q64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UfV4s2uu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jPprHUwR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UfV4s2uu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jPprHUwR"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747060500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YN3sYYqWGZlKjkA6gYrQ6pElS4/hhWwv629F1RQvukY=;
	b=UfV4s2uuq/z+B6gS8GmEjQaM/Q0ckAF+itZ4WtgikrFbrgn5p6yu5IEJMDC8RxLB7Q3SmA
	ZXSfe/5Gs+/OmW+CFT1/FqLHhH2M1RW5UWttnFAXT5fWEeUoYN/+5FnkgycR+F+iewtaOg
	xOI7w0m+FTsO2wVtg1oGgpbile/2c5SVIiUyP4zjWive7u6nbKpQB/fIPxrZZeqwpkntYi
	RcbtGkJjX63liuBXYTQQiJn6ZkGH3BRheGvTanVPS6VmLk6ysUozCM4J6B4zhKHN4h4Qen
	a0cfiSnMg3q0gMm9LGBQjWfscYhYpjAMQ40dkrmH9Q+dSEaIU6PlsACG70z7Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747060500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YN3sYYqWGZlKjkA6gYrQ6pElS4/hhWwv629F1RQvukY=;
	b=jPprHUwRCrf3AUAZZXINoE6jX97SSMwFoXA9i6t1odHUBOSwC4Z/plitwsIx2iY1VKSIp2
	IBsoCRO8oOdigeBA==
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 2/4] irqchip/gic-v3-its: Implement .msi_teardown() callback
In-Reply-To: <20250511163520.1307654-3-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-3-maz@kernel.org>
Date: Mon, 12 May 2025 16:34:59 +0200
Message-ID: <87ecwtlwx8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, May 11 2025 at 17:35, Marc Zyngier wrote:
> We currently nuke the structure representing an endpoint device

How is we? We means nothing as you know :)

> translating via an ITS on freeing the last LPI allocated for it.
>
> That's an unfortunate state of affair, as it is pretty common for
> a driver to allocate a single MSI, do something clever, teardown
> this MSI, and reallocate a whole bunch of them. The nvme driver
> does exactly that, amongst others.
>
> What happens in that case is that the core code is buggy enough
> to issue another .msi_prepare() call, even if it shouldn't.
> This luckily cancels the above behaviour and hides the problem.
>
> In order to fix the core code, let's start by implementing the new

s/let's//

I really have to understand why everyone is so fond of "let's". It only
makes limited sense when the patch is proposed, but in a change log it
does not make sense at all.

> .msi_teardown() callback. Nothing calls it yet, so a side effect
> is that the its_dev structure will not be freed and that the DID
> will stay mapped. Not a big deal, and this will be solved in the
> following patch.

Now I see why you added this incomprehensible condition into the core
code. Bah.

Why don't you add this callback once you changed the prepare muck, which
introduces info::alloc_data?

Thanks,

        tglx
