Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313E817A2E2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750739775; cv=none; b=dgOJqHhkBQnOZmQX78c1ntv1pqLrOxMVoRZOVIGVXXfPuPU3tlwqj5pSM3Ub5OnTtg5JpKnMdmQjhj4XRCQqTcPa8qPAlmVhAKio6+oXXuOgKFvkKzHtb/adJl1p7XTbOmMnflfuFvMOz1DZGC259QZghS3hKV/1KE77XmkFrX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750739775; c=relaxed/simple;
	bh=VILg30m1JNzI9tjXF7BsAq6dG9yUHY8m7rz+hsjUtxE=;
	h=To:Cc:Message-ID:From:Subject:Date; b=hrkuB34GjoqPXt1hSLLtSJ66jZJnsT9f6tztHoo8y5V6rF+go1rFU95zU3jsctQ474mo7ikxyte4KzUDQHWgwN/243qUNRqMdrcJWV+EVPNj7s2IGgFQ8xfKCMJQ6Z9c5cW9tZTNmUy+EcVw8gpKS5+tQUfreLfXjfcPFoa5tm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S3QLN7wC; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S3QLN7wC"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 64E631140197;
	Tue, 24 Jun 2025 00:36:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 24 Jun 2025 00:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1750739772; x=1750826172; bh=mn02hylKuA3gScj5sJyFgmyH1Yex
	Y2TD0lBROkl8QJ0=; b=S3QLN7wCAtB/vn0MwcB0fLx7iUx3fUgn6g3wDHw00WXd
	VgxG109GsIV6eq0bcHWRzfxCOGFtWQXabjlZ50iIZaNn+FY5WCk6V8s3zLOB5mAz
	fSlj2Xws/QaNh7Lho8n7tQMst+Q8AXbC2iGYnLCBCS8RHAxuNnKqEj//U733vvzA
	9g38f4lymY7a0a8fJLCQ/06s6Mpq89Gez08sL2AqkQogWlIz0OtEnwiTKyX8Gct/
	tBduhSs4/dXxidto6oYnpNg1LhSPVTQNz1WQgiT/iqPy+az66FdeJBvT472pnjly
	PlsST9GJdWTKsx1k78GHrIOCDcFsr9wnViozs9Q9yg==
X-ME-Sender: <xms:OytaaAEKoujO1FWa9tBPqdo7HW3VVdf8bcNOBIJRN3bNN7iPvC4Lsw>
    <xme:OytaaJVE3QAiZWrh9zYwlGXM14oqVeYq_SHLP6ZB6CZbis-I5s4WWzW43sL3sZiCs
    ufhfctIod_OkNa-Liw>
X-ME-Received: <xmr:OytaaKJpkJBE7oOTBGzQ4JRVKlnJoez7Fw6Nn-VxIDgXEX3Y5yCwJoBlP24eDL-C3E0IiMU5LZP-gldbFguffbYmo25TwfxLd1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddukeelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefvvefkhffuffestddtredttddttdenucfhrhhomhephfhinhhnucfvhhgrihhnuceo
    fhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvghrnhephe
    ffgfegfeevgeevtdeiffefveeutdeghfeuheeiteffjeefgfegveefuedvudelnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnse
    hlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtg
    hpthhtohepfhhunhgrhhhosehjuhhrrghirdhorhhgpdhrtghpthhtoheplhhinhhugidq
    mheikehksehlihhsthhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:OytaaCHyn24ZT7t_M-Xv3y9aGk--1_X0B0j8IlrYbWLcgDK1Lp3vkQ>
    <xmx:OytaaGWCU94ErwvWlS5CizlIG0yNHzbSYlqvJjsPlDo1XsCI1VL-Vg>
    <xmx:OytaaFPft_xmQGXb9g5Gm23F77oI0vDykRuS8JezYdIC2U3XV4eW1A>
    <xmx:OytaaN05EBr5WVxoGt4BG2c7ZivnT0mwnX3x94X6t_Vu6aLcUdo0tg>
    <xmx:PCtaaDL89vpeWo1EjejnCR96-CfQBPQqzkbO56CPiBL81sF-AvPETGYI>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 00:36:08 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>,
    linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <f7b4c02a1c8ed74ccceb5535d7e1e202deada8ce.1750739568.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v2] m68k/mac: Improve clocksource driver commentary
Date: Tue, 24 Jun 2025 14:32:48 +1000
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
Changed since v1:
 - The letters A through E could be mistaken for hex digits so number the
   states using roman numerals instead.
---
 arch/m68k/mac/via.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
index 9320d71ba8e9..5f77de8a7767 100644
--- a/arch/m68k/mac/via.c
+++ b/arch/m68k/mac/via.c
@@ -622,6 +622,22 @@ static u64 mac_read_clk(struct clocksource *cs)
 	 * These problems are avoided by ignoring the low byte. Clock accuracy
 	 * is 256 times worse (error can reach 0.327 ms) but CPU overhead is
 	 * reduced by avoiding slow VIA register accesses.
+	 *
+	 * The VIA timer counter observably decrements to 0xFFFF before the
+	 * counter reload interrupt gets raised. That complicates things a bit.
+	 *
+	 * State | vT1CH      | VIA_TIMER_1_INT | inference drawn
+	 * ------+------------+-----------------+-----------------------------
+	 * i     | FE thru 00 | false           | counter is decrementing
+	 * ii    | FF         | false           | counter wrapped
+	 * iii   | FF         | true            | wrapped, interrupt raised
+	 * iv    | FF         | false           | wrapped, interrupt handled
+	 * v     | FE thru 00 | true            | wrapped, interrupt unhandled
+	 *
+	 * State iv is never observed because handling the interrupt involves
+	 * a 6522 register access and every access consumes a "phi 2" clock
+	 * cycle. So 0xFF implies either state ii or state iii, depending on
+	 * the value of the VIA_TIMER_1_INT bit.
 	 */
 
 	local_irq_save(flags);
-- 
2.49.0

