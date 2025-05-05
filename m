Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247DF4C6E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 03:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746417210; cv=none; b=YCUMfPwvpXMVL+t8x8NQ2+ATo/+f3HxwjOBPz3qg0XNUZco4qPySHp0v2y6GphXgmpFKXbItuVreywBkkE8Ns3lrZeqCnjeqdXu0l0YMCy1G9eB2lL9sjtyuW9ND+Q8D3EkcULx8/UBFmIPhx6y+Zsr5AEggLc5kxRFf1RBwJFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746417210; c=relaxed/simple;
	bh=+1R9rV51p7/OfTwm6EUzx6NezHHQwEZqzko/OrtFayo=;
	h=To:Cc:Message-ID:From:Subject:Date; b=PxfQoGgMCvuNtHLbfNk8vbWRcQzsA527Jtnegwd7pso/pw2oVhDRSbge4mso/8af+VQ6OC8+82VO/iFBcSmdj5zggVellzZrXbrhnsXSbr+LL06LE3z0ET68NLd9qxx/jbNP5hlIgB2pAWiVfvzCEFr9lx1BOyOdYtpQXE+YTS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RMtORW1i; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RMtORW1i"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id F3A501380221;
	Sun,  4 May 2025 23:53:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 04 May 2025 23:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1746417206; x=1746503606; bh=r/MmHKekpP3im7WWjT9AOVn8swvg
	UEz7+2bbK7KC9so=; b=RMtORW1ie4MDZ6Ds8Fq34Oj8zFbffBKjlbN8KWqJH+nQ
	YzMUsu4sgjTDnYSieB/4jqUEy1Ic5hpP6MTjk63ZitqmOJxMDgpFNshjCq4YpvGa
	PIdUH+KbfCqMp3ajq6LJ0Ws8XvWMDoJw5mYW0ThPTfzcF4o568exvzZ1761Us1qy
	1KOMKh+2hL3R3w2LVDAsNot9L6G1yFmEsUoUczfPMBFfazmgVL0QIJIH3+vE3qRi
	kAqv5BJuUVMq2Euua/YLzHc61nRXLFxsTS+UWmdobUHUGSyF/wPYq5yE2sD93s71
	bKvrxwIcP7Y2QBaZVpsg+VM3AWVksTrOiAnoYnBAJQ==
X-ME-Sender: <xms:NjYYaCvCdcQxFxBW9biTR663nj8CqwdWpH8OaK1GtGn21Sfrzsnk7Q>
    <xme:NjYYaHdqMATL_6Sjp-0o9x7AtNEoP5BKFqxROku9g9Hptp-Dd3cyn2KPNWGS5OTIl
    L7frnGqXqf7ZY-OCS0>
X-ME-Received: <xmr:NjYYaNyWWJdZaqGSInD3LbdsFu-khPTXSz0a8sDvxrtRvGj4pr9Q5tMbkNdznS9-It7mW15eb5d07AuzM_3avtzj5OHzHcF6bpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedttdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepvfevkffhufffsedttdertddttddtnecuhfhr
    ohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hgqeenucggtffrrghtthgvrhhnpeehfffggeefveegvedtiefffeevuedtgefhueehieet
    ffejfefggeevfeeuvdduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgt
    phhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtsehlih
    hnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehfuhhnrghhohesjhhurhgrihdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:NjYYaNNP9Seh5e7f2Kd-1o2yhKJN2n6iiT8u_tiw5Ppouh306eKJkg>
    <xmx:NjYYaC9T8jUn8FFtCWbVyxENpHPCZWq2BLmfdM0Ap5d8k2D9PURTjQ>
    <xmx:NjYYaFVBJKHvm8NfWhHgCnS1VjKW5RWNluFlcCdByBWL6T6_lmlD2A>
    <xmx:NjYYaLfAG5KfG354xsWqlAXvwjFv8q8pZmz-82_9yY2E_5aGTQlJ6w>
    <xmx:NjYYaNT6gpPOHlO-SRtyVq_BX7RDceQeA6mztvRTncgDD0YX0K4zLeu2>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 May 2025 23:53:23 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>,
    linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <9f93f2f17010ac8d033d7f8f037c21dd51289260.1746417016.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] m68k/mac: Improve clocksource driver commentary
Date: Mon, 05 May 2025 13:50:15 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

qemu-system-m68k -M q800 has an old bug that causes the kernel to
occasionally complain about a soft lockup:

    watchdog: BUG: soft lockup - CPU#0 stuck for 5107s!

There isn't any actual lockup. The via1 clocksource produced a large
jump in jiffies, causing the watchdog to detect a stale timestamp.

The 32-bit clocksource counter runs at 783360 Hz and its period is
about 5482 seconds. Applying the "nanosecond" approximation used in
get_timestamp() in kernel/watchdog.c then yields the duration reported
in the log message above (always 5107 or 5108 in my tests):

0xffffffff / VIA_CLOCK_FREQ * 10**9 / 2**30 = 5106.209 seconds

It is notoriously difficult to correctly emulate a MOS6522 VIA chip. So
it seems wise to document the VIA clocksource driver better, especially
those hardware behaviours which the kernel relies upon.

Cc: Joshua Thompson <funaho@jurai.org>
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/mac/via.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 01e6b0e37f8d..142c2ed77c84 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -621,6 +621,22 @@ static u64 mac_read_clk(struct clocksource *cs)
 	 * These problems are avoided by ignoring the low byte. Clock accuracy
 	 * is 256 times worse (error can reach 0.327 ms) but CPU overhead is
 	 * reduced by avoiding slow VIA register accesses.
+	 *
+	 * The VIA timer counter observably decrements to 0xFFFF before the
+	 * counter reload interrupt gets raised. That complicates things a bit.
+	 *
+	 * State | vT1CH      | VIA_TIMER_1_INT | inference drawn
+	 * ------+------------+-----------------+-----------------------------
+	 *  A    | FE thru 00 | false           | counter is decrementing
+	 *  B    | FF         | false           | counter wrapped
+	 *  C    | FF         | true            | wrapped, interrupt raised
+	 *  D    | FF         | false           | wrapped, interrupt handled
+	 *  E    | FE thru 00 | true            | wrapped, interrupt unhandled
+	 *
+	 * State D is never observed because handling the interrupt involves
+	 * a 6522 register access and every access consumes a "phi 2" clock
+	 * cycle. So 0xFF implies either state B or C, depending on the value
+	 * of the VIA_TIMER_1_INT bit.
 	 */
 
 	local_irq_save(flags);
-- 
2.45.3

