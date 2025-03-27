Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844016A956
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743115486; cv=none; b=EhuwkVHIi8kKKiDH3Ljc6sqMsjpJeDiprG4U8Lqh0+wjxNCHsd7Ygm8MHhcbJB6k5j/6eFptF07EvFmvmlLmVsNgVI5ZYk8bwdZVhS5Srg6jfukLWZGh7PrDE5t7gdF+wY3vwZtW6rd1byZYGRC4Os04NzR9qBOrgGOvYAjb8yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743115486; c=relaxed/simple;
	bh=EVSozXOZKV9ZpHzoCP5rGPCCzzyWRqpKuEwpvefeeD0=;
	h=To:Cc:Message-ID:In-Reply-To:References:From:Subject:Date; b=U8rfyeOS588JkMF1Qlj/dCGC3oWUikHtbiL7r2poYZeLn1xKMnFZuKDjf1abQVnNuDAJtrtUOqLJp7VmJ3+3bBptxMDReAKIlWdFEyqKDpGzoFLkUXVYC9DBjFPFjb2egLBAbUCxL/F8YFA9rBrH2ff7ihD+EUlXfg5Xnx3XSIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ma7WcIpR; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ma7WcIpR"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id CD09D1140092;
	Thu, 27 Mar 2025 18:44:43 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 27 Mar 2025 18:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743115483; x=
	1743201883; bh=XgoMfS+YSJBX4lDElI2Bnf1qXuBkYAb9h/BqygdkIb4=; b=m
	a7WcIpRi6hc1luDamk3e6HlYCOcKnlBcP88MHtE6sMiaWpA7wV17VXEkcmAra5Gq
	pDZyb9ZhkyQ+7y/KFQ2rKdudLKkIOAXDR7F91XGkII2EQKoSu4zfAFRdRTQtyChs
	4x4DMPQeMW9V/LMoFUG0nbv7WekZgBuTKVVu5Otk2qL3zhBGfbxadTGwLf0v5Kl/
	l2xYoPokbVTdcXWNVcO7MAg071Wz4TGX6oHcxoZFAGR6UGrdwSJLDgA4uChrKdaI
	jcJBNT43nrtip355n1KVb0uLJFbFAAe/Y4w5SR5c0R8/8eP6Kx6mCmtfwB2EQQj+
	WW1yhaCa6WAlZhJAVRSJQ==
X-ME-Sender: <xms:29TlZ3sZBxjAHsKSzWKCIbw2EIMfmaUZcH9roWQpjrycYRc5T3fdOQ>
    <xme:29TlZ4d3RAuoth-TvcE-z5q-rjoR5A4H8Q9VWpGToklNVfc09S4pgWy-4IGU9l7rr
    DOLfEpUXcDTHHYaKzQ>
X-ME-Received: <xmr:29TlZ6yGXomKlBS-Z_O-_yEJHXb-h3aHZnViMLkJVhKeVDfRunGlNuXre29brSN4ciNcpiv_fBc_s9LfvWPhEIHavAd6DCgP8Fo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieelieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepvfevkfgjfhfhufffsedttdertddttddtnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeelgefhvefgveduhefffeeuveehtdeigedukeef
    uddvhedvfefhkedugffffeetheenucffohhmrghinhephhgvrggurdhssgenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhi
    nhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:29TlZ2NLsf1V1-bkF3ahkV21Nl_Girn9gnrMtrjRY37MwIBSZKBFZg>
    <xmx:29TlZ3_Pv-N9ItfNmYmWOik_dGkATxpiSKpT2LFwnKPuGXhqTuI0Vg>
    <xmx:29TlZ2UPEjmHUredwTorh-ho6mPrseTE4jzZZDOmPAsoADelnmOogA>
    <xmx:29TlZ4fdPsCbyldfOyKJRfokoGD9pWXt7y1KlowdCtI7p13lsv1ubg>
    <xmx:29TlZ5KtvxihcNqiUagu-BBhnBo5QQgkpTU7ZGf-edn12yFZ8KUNgf43>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Mar 2025 18:44:41 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <ec2d443d3c3213028bbbab7c2e0382cd53db75fe.1743115195.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1743115195.git.fthain@linux-m68k.org>
References: <cover.1743115195.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v3 3/3] m68k: Remove unused "cursor home" code from debug
 console
Date: Fri, 28 Mar 2025 09:39:55 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The cursor home operation is unused and seems undesirable for logging.
Remove it. The console_not_cr label actually means "not line feed and
not carriage return either" so take the opportunity to replace it with
something less confusing. Rectify some inconsistent whitespace while
we're here.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/kernel/head.S | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 49e079b0d0b5..6465333d5f7c 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -3555,28 +3555,21 @@ func_start	console_putc,%a0/%a1/%d0-%d7
 	jra	L(console_exit)
 
 L(console_not_lf):
-	cmpib	#13,%d7
-	jne	L(console_not_cr)
+	cmpib	#'\r',%d7
+	jne	L(console_not_lf_not_cr)
 	clrl	%a0@(Lconsole_struct_cur_column)
 	jra	L(console_exit)
 
-L(console_not_cr):
-	cmpib	#1,%d7
-	jne	L(console_not_home)
-	clrl	%a0@(Lconsole_struct_cur_row)
-	clrl	%a0@(Lconsole_struct_cur_column)
-	jra	L(console_exit)
-
-/*
- *	At this point we know that the %d7 character is going to be
- *	rendered on the screen.  Register usage is -
- *		a0 = pointer to console globals
- *		a1 = font data
- *		d0 = cursor column
- *		d1 = cursor row to draw the character
- *		d7 = character number
- */
-L(console_not_home):
+	/*
+	 *	At this point we know that the %d7 character is going to be
+	 *	rendered on the screen.  Register usage is -
+	 *	a0 = pointer to console globals
+	 *	a1 = font data
+	 *	d0 = cursor column
+	 *	d1 = cursor row to draw the character
+	 *	d7 = character number
+	 */
+L(console_not_lf_not_cr):
 	movel	%a0@(Lconsole_struct_cur_column),%d0
 	movel	%a0@(Lconsole_struct_cur_row),%d1
 
-- 
2.45.3

