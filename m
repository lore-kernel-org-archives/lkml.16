Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2249915442A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008498; cv=none; b=RVu3rSQMXTLAxJAqT4WiUaejV8byi369Ox3U0eqWJQT0RuqWoIuOUbfDKAbzEu6hpfeRA3qBsJAIFMuYCgQOqefdvt585bHFb5OuMhzmq01hWUREKq3/s6WodU1wZsTEdRJL91NtW/niqkMuJZp32hKJ44WBLBwc55mySBbXASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008498; c=relaxed/simple;
	bh=E0gjV7QbSosTo8kxnpF70FDIHTSDzUKHrJJ5NuAC1/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JN1CzevsIAqIg6Kus1Nm1tM+VD0W3vNYxxqIq9itlUaUmaS7gj0tigr18Aml43rPufpDGJi983IPwpzAzmPt9nwCqNiuS9XxlqCnvc+M0aRG+zwkSk6UuBSvFqT67z7vvvxER4kUcNshKYzPBNq4XBH/nRuWRx/Nz+SpzbH+0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHkC4EZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHkC4EZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E46C4CEE2;
	Fri, 18 Apr 2025 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008497;
	bh=E0gjV7QbSosTo8kxnpF70FDIHTSDzUKHrJJ5NuAC1/4=;
	h=Date:From:To:Cc:Subject:From;
	b=CHkC4EZUWoT8ymC7suWUfgxHqzYOZtlb1T9zbr8y8LjV9zfREKFicIpLYCkdkyMG/
	 wQmRAeg2wWF3vI1fvAip5LOEX5KVSUmtbXpgI6erUUPhawzh+8ZjrlUftMIjs+dtb5
	 +JC9s05J8ie/u/yTQfeMlaez544CdbWprI9coW1Yt7EdrSO3zy8xFmp35HqrgQArE2
	 NHRC67m/lZBXuWdDbnZFsOifYKSL2w0ClHLrFPzhXmG17vOUiSQF+A+v+T3r/8ykXN
	 e3CPcizbw0e9orgvoX17IXTXaFNxF/Q1eKNbIvhWGo2JxMoXX7rJ35kr49drWNkP1F
	 oZk/hNC8pR7Hw==
Date: Fri, 18 Apr 2025 22:34:53 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [GIT PULL] timer fix
Message-ID: <aAK3beIzvEj_u4k1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-04-18

   # HEAD: 3940f5349b476197fb079c5aa19c9a988de64efb x86/i8253: Call clockevent_i8253_disable() with interrupts disabled

Fix a lockdep false positive in the i8253 driver.

 Thanks,

	Ingo

------------------>
Fernando Fernandez Mancera (1):
      x86/i8253: Call clockevent_i8253_disable() with interrupts disabled


 arch/x86/kernel/i8253.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
