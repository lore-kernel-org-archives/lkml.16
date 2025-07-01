Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64E426C391
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365722; cv=none; b=T/aw+rHxL1bdxT8qTQscBiiLRaZ12qrQnH93ojKE+mlrCR9A+hBBv1m3Q3mcPcqBLP91GT5bHdaVpgd2hgViQQr1Jap1cVzvp2eN9rNCsYCkeTYB5fhfh44a+CJ2FEuj+9F8tipFWKiJuc1rPjSberjThMBwl8nHbs5TwQ37NyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365722; c=relaxed/simple;
	bh=XhWHon4d8R7ksAbe9OFreXLgHU5rL0iX6ZTv1M5LebY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtiOXnCpk+cOCRtRmUKaw2A2qjS/GFfn+/r5IDbsWOV/f6j/rBTs713gI0Pb8GwgYV6ZQPMCY82B95XCJBZ9++Bi5F97IHRPWy3cyBoHIKfdvTGsr9lQvdJ8XU7OO2E6sle7wjFM5lkqCacJwjuELVEDqrwMQ5T3kX6psGALREs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CC521595;
	Tue,  1 Jul 2025 03:28:24 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E9183F58B;
	Tue,  1 Jul 2025 03:28:37 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:28:30 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] entry: Split generic entry into generic exception and
 syscall entry
Message-ID: <aGO4Trd5qBJCrMH7@J2N7QTR9R3>
References: <20250624-generic-entry-split-v1-1-53d5ef4f94df@linaro.org>
 <87o6u5m7uh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6u5m7uh.ffs@tglx>

On Mon, Jun 30, 2025 at 07:56:22PM +0200, Thomas Gleixner wrote:
> On Tue, Jun 24 2025 at 20:35, Linus Walleij wrote:
> > From: Jinjie Ruan <ruanjinjie@huawei.com>
> >
> > Currently CONFIG_GENERIC_ENTRY enables both the generic exception
> > entry logic and the generic syscall entry logic, which are otherwise
> > loosely coupled.
> >
> > Introduce separate config options for these so that architectures can
> > select the two independently. This will make it easier for
> > architectures to migrate to generic entry code.
> >
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Link: https://lore.kernel.org/20250213130007.1418890-2-ruanjinjie@huawei.com
> > [Linus Walleij: rebase onto v6.16-rc1]
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I merged this into tip based of v6.16-rc1 and tagged it so the commit
> can be pulled into arm[64] trees if needed.
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git entry-split-for-arm

Thanks, much appreciated!

Mark.
