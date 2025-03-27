Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826EC15442A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743115476; cv=none; b=i99gvkeB3U2ataI5wUDxK5O1pc01j1KJxoVtwKmD73wd2ad5moYqyLnfoHWdGmniI3k2JCrrlIKUAKEAJF8WW6GwkoF5hl5UL1FopYluahapoV5kjL13IWnYNktkpSucX5IHfK225ZhZitFft1kKXxWRblMTnGC7dc+rZEU324g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743115476; c=relaxed/simple;
	bh=yKteizhK25k+Kq3y52vY08el1oFVEAXgw0e0maVMvA8=;
	h=To:Cc:Message-ID:In-Reply-To:References:From:Subject:Date; b=pNFwel1ZNbXP0D6QjkVft0c6NHAmb+TqF3TRNjEVPr/RVR3Ae+zsydOKRCKYZ4QMUNnI9aUr9lIjgoxkKBLon3auFJZ7qemyYYBdFWopcK7R5+V2842aXnF7Wfw59duaRHVyEiDaPiz6NW5vFGxV32nQUsi/PVHH/wewwM3YA3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ko/o1Pzv; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ko/o1Pzv"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A211C25401D8;
	Thu, 27 Mar 2025 18:44:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 27 Mar 2025 18:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743115472; x=
	1743201872; bh=UsmTJzPJBJCv/GLsiSaAa22KCAr+coK/iO7XuDxp8g8=; b=k
	o/o1PzvoCy1A44RDbmMHPXZm5VygLCAmuoXQSS3RdjDk89v57z7wMxZMWpkeLlP6
	b1XnKCvx4T7C+gCk2pTEm3pAbLaiadmWe9NLvTmLshj9u0ySNqUMBJAbSHGwW0Bi
	8Hv3QO0BVrikBCcTKrf3KZVjxI5tkhTc4fO7a4iizafqxtqYqlv6FPn9rsalHSIV
	5KMTejYVjYbIaEEVescdPq6AGkRusd35ulsE+ZrHE0+DrJQHfh8rizswIbuY6Jwm
	MSJi9xFu4Wug7BD6aOuUkx4PhYLOiQy5IK4SNvCG/zLoBtJyYoH76ikuNx9C1sTa
	YmG6lHJNssGQle8/FUZIg==
X-ME-Sender: <xms:0NTlZzDUCeoXDFKQbYshT-A-Q8Ie1HinkPYLUVacpWo5LVeZiH4f4w>
    <xme:0NTlZ5iUCP_kv2r9QB9pk09sajON4CrNYMRrIb4ZdG84BE_sPocCRHJK8P-GDcJJ0
    XdpS9FqsMPnDoOZ54o>
X-ME-Received: <xmr:0NTlZ-ksqA9orHpqicbSYWP-IZOJzWEf_xd_cZjoBFUpZ1l-QkwhJqtPHza6WwvRHY8ycxOGFrxpuJ6qn4EsBRhAO9TpvcTzxI4>
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
X-ME-Proxy: <xmx:0NTlZ1zho3yoIxrK0Md7e8ZekNOskR4EbjQHKHzCPR7b224vpgq9QA>
    <xmx:0NTlZ4RgUxOB8sQ-_HB4TFKs7oai_6OFR8RkFva1aulUkULQgucLdg>
    <xmx:0NTlZ4ZMzRUMQpA244h7ZBWZuinboNMC6vldog7lKNF4nS-xOjZ_Xw>
    <xmx:0NTlZ5SKT-2vvypF3ufY_at-ZNU1iOhus-ckC1q5izC1CWalxL9BxQ>
    <xmx:0NTlZzd6kPLS01vuq5AGVvhw1zRguM_m1HwFM3Pz8OCjRLHtxOvURyjn>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Mar 2025 18:44:30 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <a6104f41918bed4fd17f92c45df94ac7a5d30e40.1743115195.git.fthain@linux-m68k.org>
In-Reply-To: <cover.1743115195.git.fthain@linux-m68k.org>
References: <cover.1743115195.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH v3 2/3] m68k: Avoid pointless recursion in debug console
 rendering
Date: Fri, 28 Mar 2025 09:39:55 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The recursive call to console_putc to effect a carriage return is
needlessly slow and complicated. Instead, just clear the column counter
directly. Setup %a0 earlier to avoid a repeated comparison.

Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/kernel/head.S | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index 9bd8adaa756d..49e079b0d0b5 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -3533,19 +3533,16 @@ func_start	console_putc,%a0/%a1/%d0-%d7
 	tstl	%pc@(L(console_font))
 	jeq	L(console_exit)
 
+	lea	%pc@(L(console_globals)),%a0
+
 	/* Output character in d7 on console.
 	 */
 	movel	ARG1,%d7
 	cmpib	#'\n',%d7
-	jbne	1f
+	jne	L(console_not_lf)
 
-	/* A little safe recursion is good for the soul */
-	console_putc	#'\r'
-1:
-	lea	%pc@(L(console_globals)),%a0
+	clrl	%a0@(Lconsole_struct_cur_column)	/* implicit \r */
 
-	cmpib	#10,%d7
-	jne	L(console_not_lf)
 	movel	%a0@(Lconsole_struct_cur_row),%d0
 	movel	%a0@(Lconsole_struct_num_rows),%d1
 	cmpl	%d1,%d0
-- 
2.45.3

