Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038E028B3F6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306188; cv=none; b=AeWiHFQpEHU/03ueboZ1JaxkK8KJ0BaNXqS14qmwZLCOTD0MYy6wHkyMHY8j5kY13HccrVHPDsGkJQCA2muDxFT0LYTMX0qg0zcMLZq9Z+M+xQElLyi1X/X4k2skADGwzoJyMJUxVx5Isv6um+HCthIJR5jvwp9AN7nmNR0xk0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306188; c=relaxed/simple;
	bh=cgG7uLHHbOnDVBE2PmtK6xVtUJvrcsaCz4fzVd5fghA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DglsvMUfLz2XHFa6I0hiI4eWZ22m2nDMbquhLxng6Om59hQYJ/1TUpdhKAsGWKporsuIsrzVzpp6bmEGKpLIcJjQzgXrqG38DJW7lJRw6SiSsyBa61ztEg3TYwrcQJL1lPHm3Xovndlpk3ARbt5nrz+Th0A3EclfYme4KCjfZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Z9JRpnc+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d6cQRLP3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Z9JRpnc+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d6cQRLP3"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751306183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKYEePQOglAasiElEt+WwagEJvu9qTCNrhANfUr/7v8=;
	b=Z9JRpnc+7gZwi2/KILkrtq3TpSHgO+/1B4vHHUtux+6z1fWGjnwU7Fv565fidcyDZFZ1O1
	PhNnDPlH4nbFzpI4h6lWmV+ZR2eRpa4N06ZP8QYXenXcNmv2d660n4qw5xRJhmZgxeJiVC
	vRUa56OZtr4qiZwfZEXZWnOMkQ9MfOekzc75KufvE6sHPfzwuXX5nAbUKumjHSKQNl/bo2
	YQ/FTVq4a60VBMBbRkGQYmUQFryGwGQyTVl2rapQqOBFFXWKwEv0z+w/Nw/fru9luJQcF+
	Qbs9eTto7kI0nh8R8PulPE2zVXeJbQGYM7liYda0FWrqKihmnmMtFZguZ6BWxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751306183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xKYEePQOglAasiElEt+WwagEJvu9qTCNrhANfUr/7v8=;
	b=d6cQRLP3mmrFdaGFTOtoDHTnJvoPyagLEelMKpAuLjGMxDbsnYzVs5cVv0vQyeYa4vCArw
	87mRFtMnnGpDZqCg==
To: Linus Walleij <linus.walleij@linaro.org>, Peter Zijlstra
 <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Jinjie
 Ruan <ruanjinjie@huawei.com>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Linus
 Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] entry: Split generic entry into generic exception and
 syscall entry
In-Reply-To: <20250624-generic-entry-split-v1-1-53d5ef4f94df@linaro.org>
References: <20250624-generic-entry-split-v1-1-53d5ef4f94df@linaro.org>
Date: Mon, 30 Jun 2025 19:56:22 +0200
Message-ID: <87o6u5m7uh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 24 2025 at 20:35, Linus Walleij wrote:
> From: Jinjie Ruan <ruanjinjie@huawei.com>
>
> Currently CONFIG_GENERIC_ENTRY enables both the generic exception
> entry logic and the generic syscall entry logic, which are otherwise
> loosely coupled.
>
> Introduce separate config options for these so that architectures can
> select the two independently. This will make it easier for
> architectures to migrate to generic entry code.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/20250213130007.1418890-2-ruanjinjie@huawei.com
> [Linus Walleij: rebase onto v6.16-rc1]
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I merged this into tip based of v6.16-rc1 and tagged it so the commit
can be pulled into arm[64] trees if needed.

 git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git entry-split-for-arm

Thanks,

        tglx
