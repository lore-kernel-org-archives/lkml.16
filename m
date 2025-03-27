Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156681ACEBE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743115144; cv=none; b=Rz/C9UAwFATSasy63WznLFnB/CvVqeO/WjJGUmuJdRADyTUhS2xYlDHv9tfmrnNs6qCwdLUYy7rkJhXI2G8g4xx7zSZGzxPwSZE4QC0x8KGF6OGdsRhUHT+bqIDnWplvPL0xgVQter22IFDA1NMtdY3ml93+8XNcW4+Q8Nvyffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743115144; c=relaxed/simple;
	bh=7mCtYt5PwkW6wan3Dj5V1pnjA26KG8rl6zyRMkZ2pjw=;
	h=To:Cc:Message-ID:From:Subject:Date; b=Pg0NVqyn70GTmxVPHmPI+jOaPRdqrTXU4RFV3kqgNUZhBaCXq0nuOWMr8WCpY7v3tirimyy5LjVU78YulQW+5uDni1MfjmKakKOBoGvhoXyCSgwdK2wJe77NPGMFVLSBe96YsIR4fZCWrG/kIEOp5kbMxddJ+o8/FOdOaxrxZ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LaRu65/k; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LaRu65/k"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id BEE70114016C;
	Thu, 27 Mar 2025 18:38:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 27 Mar 2025 18:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743115139; x=1743201539; bh=JiMEP2AO36eHBlp6X5ZxLmtvskSS
	I47S1BFITURAF9M=; b=LaRu65/k+kouEgc/eTHWZWzHZOntua11rj8MV2lwsv1B
	i3PiJQwbGAsWwixPnO4WIkbcWJToTjbnhZ6MWMKiNOMJqx7qkgtvTTmW28MB1mbq
	q1LSvwHkHj+DzhQJlJVuEY9oh/dlI6VFELPnS32c00i9LFr4UBEffqk9/S8Q5vNM
	5URx2/eZEhRZQB0AYrJ5Col83ydkiiKltG1AAouVDdyBDZ5sov6SCM4hgt/Uh3aW
	r2NceL6QCSfDLLq6IKZtMSWx5UY10kxRw96AUtKJSF82NgS6bKWcbcz8jRbUrB/5
	RfAs7hjEJVBJP6F9dpF5mWWgV7PLo+JWO3EM1P63xA==
X-ME-Sender: <xms:gtPlZ9gM--sS_oD6dX_mz_c0SOih5aKCXD0TLzyqYkirj0iSez8WEA>
    <xme:gtPlZyCkhHbC9qMFxoCXanL4w_KwZv4WNYywcPCNh4h1aQE11KD2FHjjzklZL7DYf
    KJzdJMnmRaXdf6kWmc>
X-ME-Received: <xmr:gtPlZ9H5zqa0oP4v4vtbiAXyzKeXyWH3JT4H7fRwY2QxJzdHR_TTbYXF7LL_ZnfGlz8pTvqNX9QrfFqO8QFM-E8ekpqFbWXQnQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieelieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepvfevkffhufffsedttdertddttddtnecuhfhr
    ohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hgqeenucggtffrrghtthgvrhhnpeehfffggeefveegvedtiefffeevuedtgefhueehieet
    ffejfefggeevfeeuvdduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgt
    phhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtsehlih
    hnuhigqdhmieekkhdrohhrghdprhgtphhtthhopegurghnihgvlhestdigtdhfrdgtohhm
    pdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqdhmieekkh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrgh
X-ME-Proxy: <xmx:gtPlZySQIcoigHupBPQwsu-i9-kZzYTCZ44DBw-LnBu_aNj3REM-CA>
    <xmx:gtPlZ6x7Po0IDmzpsl7DZJ82SGC-ZhDVkflZwTfoptDcNOPLjPWh8g>
    <xmx:gtPlZ47MLfLtIS3DJgVPIWwS84GcTctfMHcdH_nf_TlzpLlLi9IDHQ>
    <xmx:gtPlZ_w9zWxb1trZ7ACV4Nz9-G8-6z28OYqUyYq7bWgtjGxwyqTpQQ>
    <xmx:g9PlZ-_1IVKWcWwaXdc-IYEKUHfItVEvIeEwOhHpyYAuLBXIBxq5dIHh>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Mar 2025 18:38:56 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Daniel Palmer" <daniel@0x0f.com>,
    linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <54c8046f6ffcb16b3e4e7aa1a6fedbc4e576f16a.1743114940.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] m68k/mvme147: Don't unregister boot console needlessly
Date: Fri, 28 Mar 2025 09:35:40 +1100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

When MACH_IS_MVME147, the boot console calls mvme147_scc_write() to
generate console output. That will continue to work even after
debug_cons_nputs() becomes unavailable so there's no need to
unregister the boot console.

Cc: Daniel Palmer <daniel@0x0f.com>
Fixes: 077b33b9e283 ("m68k: mvme147: Reinstate early console")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/kernel/early_printk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/early_printk.c b/arch/m68k/kernel/early_printk.c
index f11ef9f1f56f..2fb22d8395b5 100644
--- a/arch/m68k/kernel/early_printk.c
+++ b/arch/m68k/kernel/early_printk.c
@@ -60,7 +60,7 @@ early_param("earlyprintk", setup_early_printk);
 
 static int __init unregister_early_console(void)
 {
-	if (!early_console || MACH_IS_MVME16x)
+	if (!early_console || MACH_IS_MVME147 || MACH_IS_MVME16x)
 		return 0;
 
 	return unregister_console(early_console);
-- 
2.45.3

