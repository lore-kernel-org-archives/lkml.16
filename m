Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD11F23CB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175459; cv=none; b=usBSNJ+AngM3/vYlqzKTXlJxrJXZ+XRWW642dQ7fPcH6elXUU4g3U+/DiB7YEnUizhfATTjAeyxB4Ti2lrCbo4dKkjnWEja7l3wbljNFF911Dxa3OZB4wfiHvQ5tWnLKYTb+X6lyVItkFmyTJ1uNSqXwbBojhtXhXYVs/C6C0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175459; c=relaxed/simple;
	bh=B2M6TFHv1enS8ZPXp5y9VVQK9QRJKJmu1l09YJzvFdw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rwiztfg4tiDXaRfbesNoBgXoIByRimns5AhBZ354VtdukOjW6J7Eta0/SqEoWGLbstpbGFpR0XZovC61gqgyzA0V41pNY00xyIZZjTpYlBmErDfShfj98QAkEGbTAb42ItYwY3W8g62J6VrZkv6AmqJNr4+3BaU1Qv0A7f5vTAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KQKunj91; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=syhmO8u2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KQKunj91";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="syhmO8u2"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743175453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJyMpLqlIrtgHZsTFNOSuzofPw3rShGnkb9uC9koS6I=;
	b=KQKunj91IWoJVcKM7NdXPPLi5VvskiuLezXVIQb+EspENdoQfrLAb5wBmyf+4+Qa1BtJlf
	wABEZEUwIaNV7ahYLT8SB2XTHMnjLw7TblNUiwxspAUtI3qD3zoRjfGYRcrpIm5HQiIfQX
	9FA37kdUq6GUbf6rt1Ocmgae+0lbLkcGaxeigN+S4Y4UMiCoepixsvvISbroWAfRAb4L8S
	xViMddt5P7oCprsAL1PgPaU6uagE49oQ/iUJKZNVQT0eqskc66vXTiA1nUjclz4oM1ouc+
	m63WldrdSten5YMPgEmNFsJzRfoEIXinWyWiYFg2TMVWVREHQLcEk7+D2q1c1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743175453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJyMpLqlIrtgHZsTFNOSuzofPw3rShGnkb9uC9koS6I=;
	b=syhmO8u21OD/Db4wtb6eWWC8RAvpXQB7lqxHvCbSvHfXKqPcl++Ximu3jAJ6sl9NDvw37/
	5FzRIQBW+tsU3jBQ==
To: pr-tracker-bot@kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT revert] Please revert the irq/msi for v6.15-rc1 merge
In-Reply-To: <174293468803.715410.13662092624195929373.pr-tracker-bot@kernel.org>
References: <174275225552.1561082.4969731002775597670.tglx@xen13>
 <174275225917.1561082.11153014835496302156.tglx@xen13>
 <174293468803.715410.13662092624195929373.pr-tracker-bot@kernel.org>
Date: Fri, 28 Mar 2025 16:24:12 +0100
Message-ID: <87r02hw543.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Linus!

On Tue, Mar 25 2025 at 20:31, pr-tracker-bot@kernel.org wrote:
> The pull request you sent on Sun, 23 Mar 2025 18:51:36 +0100 (CET):
>
>> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-msi-2025-03-23
>
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/36f5f026df6c1cd8a20373adc4388d2b3401ce91

I just noticed that for some incomprehensible reason, probably sheer
incompetemce when trying to utilize b4, I managed to merge an outdated
_and_ buggy version of that series.

Can you please revert that merge completely?

git revert -m 1 36f5f026df6c

reverts cleanly and there are no dependencies on these commits.

Sorry for the noise and inconvenience

Thanks,

        tglx

