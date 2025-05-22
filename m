Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45736239E65
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916698; cv=none; b=Kn8XT76exBlmXmxIlePT4AkcEVF6pDfIsLgXO4WBuaJASJy3xkF6w7rofoCbAemmM35PGCdcVCEVSwZM4lPlBSP+9yoT+d1vkNWLLBjgnp6zgAlqNSk24mEfFl+3qhjdxdnlXr7DgpHCRx0V9UX7pcwcZhgnLTXPKYbvHrzk2eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916698; c=relaxed/simple;
	bh=fffjvjXXWoYzzrdnU7rvbCRBFIDFLcnf0Qy0t+nRqNU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aKtpwCvo4yJ4gJ+oYyjUOmBkDG5BFSPpjCIFWAHhOnQKnDfjIXaWh9dlR4xoVqP7Vji0DcTA1ndxSew6kvHu/lLjBiR9x8Vyo2UHh+F0GtXvHYcdKpzUbhtuDmvFVHeED4SBvVwOb3NrZM3Bk4y5eS5fa2ixvmBrEo5eS+ywoUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=cFqrjzil; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DPvoD4xK; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="cFqrjzil";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DPvoD4xK"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id B2FC111401F0;
	Thu, 22 May 2025 08:24:53 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Thu, 22 May 2025 08:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747916693;
	 x=1748003093; bh=AywisXg6h235XcR2cgQ4+PJDEjvSdgiHWbm+AEAJ9W4=; b=
	cFqrjzilFdpqLGq68VOiHeHAoXIA4Rd7DSScNSbbqmS1G3alHkKcTC8Z18AwQyeu
	zqJ66FLXAxETTw+bfiJypeiJYOihWOT5gPvnecTgJ3i5am84Bm++pljKuEyqlXKd
	Rgo75yL/sl9A2G53YlzYUJxVfOlzB3tOUNLgmNycPvXMg2fUS+XvRWsstCWibIe5
	TZCgfaMKvyJuNSFhSnYxYPWW6FPhFF+Dqzcv0Ks+VojoJYny0Tb6cwY83ZfXX3zR
	Q7BVwleirNbgkpZ8NyoBRc9gizIn8X2pE985mGxbIM1p4QfKVnJy8PJyJej71VrU
	8mH1C1cclTJtDmbx7An6Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747916693; x=
	1748003093; bh=AywisXg6h235XcR2cgQ4+PJDEjvSdgiHWbm+AEAJ9W4=; b=D
	PvoD4xKzt/RAVaJBj3ZTpG8jUUBr/LXg7UQCUD6Nuc04TTJhYOxjLwF5z6JGJadO
	wucs+wrVKhcW7/jT/3y5OzOpxQD9kpFMMbm6Y/QawhkwNrOdKLUUAtAA2/63kkau
	vbSXxRtWZwbo17YnpfwQIdMU0EQuwVZLIMFpAkah2mHpmazi2T164h6e9l802PQn
	miog8lAxAFKD38DNChHLSmmVzWhlL1FKn8m9JeILPWOk9nTFS2aNWjJTj/u61JbV
	En7u8AiR9ounWYBfrvtMLQMErcSXWI3KS0sVQ982emB8wf68Y8aeqeyBYe9lJAsT
	PZKzYfaLi5Zl5mNP/vnSA==
X-ME-Sender: <xms:lBcvaMoQAk0PmnRO44VJILZeXrs5yvG7PNBpZcLWZFx4m4RBHeNEww>
    <xme:lBcvaCq-JJMcU8qFW-Rx201c2Xa9dnlzuKc1ZrYUa7xE80j-juRMbrJNpqUB1cXes
    Lxi9MzH9nJ7rcRvtGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehleeiucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuc
    eorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfg
    ieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvg
    hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthht
    ohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggrnhdrjh
    drfihilhhlihgrmhhssehinhhtvghlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhuthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtph
    htthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:lBcvaBMMl1sn9F_x-30wQh9cG3vKksuIsjsv4V7MrP5bG_4VWAOERA>
    <xmx:lBcvaD6ikJQsKQDlGMxtDpPMLz_YQp2HtHuMFVvk63zuj0lpjh12uw>
    <xmx:lBcvaL6MxMRRy2ZHxxRcKdQKl9hWT9GsUmms9zZCDuyp8wUiS38j9w>
    <xmx:lBcvaDg9MWLUtuhPQhAKAVh_3fBCqRoyaFdTbSzaXvoJnweBfci78g>
    <xmx:lRcvaGUZIY5XM6PKVtqGOd6a1lflY21nsXVNp44AmU4UaOCiPUOs859v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 69FA71060061; Thu, 22 May 2025 08:24:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T47dd44791f7a342e
Date: Thu, 22 May 2025 14:24:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Williams" <dan.j.williams@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>
Cc: "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, x86@kernel.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Nikolay Borisov" <nik.borisov@suse.com>, linux-kernel@vger.kernel.org,
 "Kees Cook" <kees@kernel.org>
Message-Id: <73120bb4-7eae-49e7-be50-1fac67d351c2@app.fastmail.com>
In-Reply-To: <682e5029e88e0_1626e1008e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250520152030.1499670-1-arnd@kernel.org>
 <20250520152030.1499670-3-arnd@kernel.org>
 <682e5029e88e0_1626e1008e@dwillia2-xfh.jf.intel.com.notmuch>
Subject: Re: [PATCH 3/3] [RFC] x86/devmem: remove low 1MB hack for x86-64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 22, 2025, at 00:14, Dan Williams wrote:
> Arnd Bergmann wrote:
>>
>> Unlike the other two patches in this series, this one is expected to
>> change the behavior on x86-64 kernels, which has the risk of
>> regressions, but seems worthwhile to me.
>> 
>> Are there any reasons left for keeping these hacks?
>
> Kees did this search which seems to suggest that there is still code out
> there that may not be prepared for a behavior change here:
>
> http://lore.kernel.org/202504101926.0F8FB73@keescook
>
> Maybe those paths fallback to dmi sysfs or other mechanisms for digging through
> BIOS data, but I do not think we can know for sure that this removal is
> regression free ahead of time.

I looked at those three and from what I can tell, two attempt
to access PCI BAR areas, which should not change with my patch:
if they are busy or exclusive, they are already disallowed, otherwise
they can still be mapped.

The third one maps the BIOS area at 0xf0000, and as far as I can tell
the hack explicitly allowed mapping that even though it is marked
busy on x86-64 since 5d94e81f69d4 ("x86: Introduce pci_map_biosrom()").

Is there any downside to marking this one non-busy and still allowing
the ROM to be mapped? Would that bring back the issue of conflicting
mapping flags between kernel and userspace?

--- a/arch/x86/kernel/probe_roms.c
+++ b/arch/x86/kernel/probe_roms.c
@@ -27,7 +27,7 @@ static struct resource system_rom_resource = {
        .name   = "System ROM",
        .start  = 0xf0000,
        .end    = 0xfffff,
-       .flags  = IORESOURCE_BUSY | IORESOURCE_READONLY | IORESOURCE_MEM
+       .flags  = IORESOURCE_READONLY | IORESOURCE_MEM
 };
 
 static struct resource extension_rom_resource = {

> I would be interested to see though, so:
>
> Acked-by: Dan Williams <dan.j.williams@intel.com>

Thanks,

      ARnd
