Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF58A1DF973
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424630; cv=none; b=p51sDQjeqlIbCzStVglMe05S6hYmqqrdv2uHJ3ICPaGAEveoyVkidvsGV2yDlce9w9GwIa/jd1emmII0IwgJpxixUUAXx/bT7zPLqzjLs7DBR6DH0ZiGr/lrqPK1KoQj+uPSBmrsJ7H4IDqRHrj2RoE3KF6yxrqs5/5NowsUuCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424630; c=relaxed/simple;
	bh=XF8U0iLj3uHf18Md0L94HMaKwf3GwJzINVPcy899eWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5xqcxKF/QwETuLWw/H8it8LymEhWBpfaYzHj8mKr/p+FvUdUOq9y/g4d8FxOa+0+klTSVQpvWIgxtU29HoTG78IMgbXLgt2SkXv6c7lIxLYDPqPjeN65MM1/bgUrJ29s5XsANdG+hpQE4C3H1YfAk/TWCAZoF1pLvDeNruZn7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ghRlKZui; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ghRlKZui"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3AE9C40E021E;
	Mon, 31 Mar 2025 12:37:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9pTjYUTDZy8n; Mon, 31 Mar 2025 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743424619; bh=HsthWMpa7dpmFJPs0VH7Q2aWWaseDl9LHaODLVUjkFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghRlKZuiSkxvO7c4ZgNldGcgt6vjUntwLif15uQK9iMfbdxNqLZpkOojSnHRm3K76
	 A0MQtnlr1W++Q3TUGlqVq6XYkoygbVwZI6e7O3rhVszDb0aE/hvMdt+Ch7SXT7Rq1Z
	 vKfXd0FSMqCCUeBcpNc3e9eW7Otk35SftzmrzraVbPA0JAHf8yECxWmwxaSBHi4Phu
	 NP4WHxK8yeSIi//3r9VU/pcLxS0+Upx3QKQvkypIX7PlI++cXuxfYpJMhBqSzazOnU
	 gJhtln6xJ2/eKkxeYrrWV/GZzh2Dd2PA4Xx0nvfYVEjaT0l9TAZhLcXM7cfnge7rM5
	 oB21J9LXjB2AIbcUNJzYWdZn26Ko76ibmxRugt6EWnoZZ+NLHxT4TuE49ixwEoa0ZG
	 omX8MR+eBIMfH4hGYOTdqCACY4dVDz+3XxUiC3GkyzEZrtKn8qzFSdDxlYhYbk2D8Y
	 EwwHluS7CDDPig+qcntcGB8tkujjbXGB2t+ps3F7wA2EB4Rd8hdiUluPG4JIWmcLG2
	 mq1xwrU0hsBtUdzCDMDt/sm85nNknpdUgmOPbf4Q/Pz3OagIbUmHlqgoUn7wHP2ORO
	 t3YVgtriHkfqUQ606aqwKpV8coWWmWCK0MMf+F9bS0HAy8Nr4RLFJUdpJ+E9/uFb+F
	 9F3McOUig7f1J4Lcwh5HMli0=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 948E140E015D;
	Mon, 31 Mar 2025 12:36:50 +0000 (UTC)
Date: Mon, 31 Mar 2025 14:36:49 +0200
From: Borislav Petkov <bp@alien8.de>
To: Philip Li <philip.li@intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, lkp@intel.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <20250331123649.GCZ-qMYfyI9gZWwFRm@fat_crate.local>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <Z-qCrbNvP2cil6jJ@gmail.com>
 <Z+qLDGvkY+TXdCjK@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z+qLDGvkY+TXdCjK@rli9-mobl>

On Mon, Mar 31, 2025 at 08:31:08PM +0800, Philip Li wrote:
> For 0a7fb6f07e3a, the bot only reported 2 times on x86 [1][2]. For this
> loongarch report, the bisection is wrong and is a false positive, I will
> further check. Meanwhile, the bot will ignore the bisection of this new
> objtool message as it is not really a new kernel issue.

Can you guys get a human being to double-check and vet those reports?! Please!

Because we kinda trust them but

1. they're not really helpful and hard to understand what you're reporting

2. that summary thing is especially useless:

"Error/Warning ids grouped by kconfigs:

recent_errors
`-- loongarch-randconfig-001-20250328
    `-- arch-loongarch-kernel-traps.o:warning:objtool:show_stack:skipping-duplicate-warning(s)"

When I see this, I need to go look for the original reports and somehow
scratch them together. And you have all that info, why don't you simply dump
a URL with the bug materials so that one can inspect them?

3. Last but not least, if this doesn't change I will start ignoring them.
   Because they're not really helping - on the contrary - they're actively
   interfering.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
