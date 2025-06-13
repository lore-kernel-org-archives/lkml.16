Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCC82E11C4;
	Fri, 13 Jun 2025 14:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823334; cv=none; b=TgU2U58jn7B4Z8CaGDP2mQv1WosdLH9TZ+s67rkHgloouXwBHE6HU9NB40G4h5HyxKnQRzMYP2vny1BLGPF+D4xxIuv1PoJ2VKObHfrVJAS7BE43emdhKvjr8Rwa7zacTshTudow8nLWJnVF5CV1luJMXhKykAB/zU+lWMpEh6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823334; c=relaxed/simple;
	bh=27cCgN4Qgfm8dDPySwZrBGcQ4kQ9MtAZA0JJSq67OFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bQbg1YVWaxd/NwSzcII569LlZLWZuIL7915IpTbSCvOH+9EFXN6msCyCM06aEqEvZq5tfLMpNAR86+Hp0KVyeMONz0zCBvRy6r7/q2g6hlWqkjPu/eubNiprteWddY5unKROdUP4tQhqFJ2djafaOxrr/zPMyuPrJY2XQBeX++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QxpRHaJC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZdtaMejt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QxpRHaJC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZdtaMejt"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749823331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p6yLbGaAqKXjfS0WvcDA9G+lP7oBNZSeK5gSgxur2Uc=;
	b=QxpRHaJCdPe7lz1UwNt4dK1l+9JhVUQb8heDWyc2otiF7NXESJsPAJcMT5xjSf2cOg9QD0
	Qrk26CBxj1otzOsu5ZeN23jl4NK2e7PI42mFewsBQQUvv6kKLR37b3u2r8j5ezkDD6ZIiQ
	Mv67c6JaRQ0Y6uajmqRsqb8YoKmkJ07G2PfuzHwhJ2Zwb6Gkb6yVlZPC3tZApEprLtZ7AA
	KsythRCKjyI9bnLwQO+tqJ3jXffCLeuJwT+L3P1A3CeyFdADlVZXnFgS9BC0Lj2xr/H14w
	9VpUqswNA1gNN1JoVVJ8FG7oYKtutO2VNN0CPXJQHFYJ+L4RRVJCSd0XEYHP7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749823331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p6yLbGaAqKXjfS0WvcDA9G+lP7oBNZSeK5gSgxur2Uc=;
	b=ZdtaMejt/2tlKWPR5Y3CvvojlvL3NtNtY2buu9XogiPe6c9CxLEFOgqqgBxNg0mRVfoYN0
	W1uCQhE9UieXdZDQ==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Super User <root@localhost.localdomain>
Subject: Re: [PATCH v4 0/2]  Loongarch irq-redirect supprot
In-Reply-To: <20250610114252.21077-1-zhangtianyang@loongson.cn>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
Date: Fri, 13 Jun 2025 16:02:10 +0200
Message-ID: <87qzznivtp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 10 2025 at 19:42, Tianyang Zhang wrote:
> From: Super User <root@localhost.localdomain>

That's a valid developer name :)

> This series of patches introduces support for interrupt-redirect
> controllers, and this hardware feature will be supported on 3C6000
> for the first time
>
> change log:
> 	v3->v4
> 	1.Provide reasonable comments on the modifications made to IRQ_SET_MASK_OK_DONE	

That's not really what I asked for:

  "This change really wants to be seperate with a proper explanation and
   not burried inside of this pile of changes."

Emphasis on _seperate_, which translates to:

  "Put it into a seperate patch with a proper changelog explaining this
   modification and why it is correct."

You still have burried this in the whole pile of unrelated changes.

Thanks,

        tglx
