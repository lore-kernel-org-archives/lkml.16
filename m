Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149A1CD215
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748978782; cv=none; b=TeZMRhSdTcdwdWznUnngBS3H0OXqo/H1vnw1WNxdTK5fpeGKIM5KUsc/uGeZoV2XnbgdWC8CXNAUiSOn9XB3ggYC2ifxAEi3Peicwccv0KfVj/Qlez7Rebp9dCe1J2ncI0PQ7rSyZnHh2TmtuZ518Yr58vYxp8MyFXjAyZZUBY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748978782; c=relaxed/simple;
	bh=Df+NBJSEtWeMNrn42oqSvoO4H/OdhKwjfX3Ntqc/Xmk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=o02T6zJkarQ36qFhw3xxxjlRJadI8Zs49o/vkvYEiNWSKG0c5VgPoEfJIda7qtjr3X/zAE6F2WW4gfYVjgMmr6Wo6WsJxQQBCZtvppHuUj5nVoKgYDpivkjdLQbbgvR8N/gbfE6pX1TWFE8UAR8TiKvej8ESCm7OpSLz1OWO14A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=p1uZzTqo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XUT+Yu2b; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="p1uZzTqo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XUT+Yu2b"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BBE1E1140150;
	Tue,  3 Jun 2025 15:26:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 03 Jun 2025 15:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748978777;
	 x=1749065177; bh=vudheiag8aoSXpINYPJ0z+0e6j2ytdIX7yRFdrYNREI=; b=
	p1uZzTqoYc0uhoxfRPsF3xgKMEyNFK7nzH5qlsNGaRvIHZQrdwwvYqiu2lswox5/
	BqAsuN8zgyRTBPHhMVs0EAWVpkRBTc6Xd70BJJWHPHTbAp2PLpCVokyssjXQbuGu
	txf+egL32cSGa3D2d2v2/nSq1uKb3evJvjBCAAgnuhp/oagN1NhaeBGb+pCQK2h6
	ydMvPuSh3KLMYud57LOyAJV6Gg4dgWTXd+bqxx4LsITXxHJ+fxQbyRWQW2SeeFwY
	/Xn6y/dZ1GeO4OJGeMX7LEInTH5Brtgu3iZ0LixwQIIKvgiTfHmiSRTTy2vT3pra
	+f6oYqnbGZ20X8X2PflMwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748978777; x=
	1749065177; bh=vudheiag8aoSXpINYPJ0z+0e6j2ytdIX7yRFdrYNREI=; b=X
	UT+Yu2b3lXaDk+VdwgcT1nQeWYV+kd6j0NiKPDvzJwPSUQCeU9Wts+aU2ltvGZYN
	KQ/Lg8kAgfDE/zq2aUVtZQcqi5Olb/8Ed5IHVE8nW+n+KgZlcbfS3SeGvik1QDi3
	qodOIVUgsUkpqSEn/Zrbx2813JtRZ1nikdgR/2afXRKdZ3kh69t7RB7854J349Yn
	FLuZ7Ak4bwsLllrR1QLuE5S/4zDv+YfMzH0DSJLVOnJkuZn7EaFzmDbnr8W2bs/U
	wqufdKoT49ReldcEwUrszFxBXGT+Sfux5+wZtdcscNINbTHoWuEg/7W82I7Fa/y8
	T8lQe/5j8gCIvY0spEHHQ==
X-ME-Sender: <xms:WEw_aKrHYKtz9MmLTuh1oyu8S6Zi-Fz_2IePEp55tK-kyEmAc7PHzQ>
    <xme:WEw_aIrbRbCFXfsxMMMxY533ubFdIPgM3fbzGtPJ1HXD7-v8Tifo86NdbPitHQnoo
    7MKcvL4DuSt8K2kGwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepphgvthgvrhiisehinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepuggrnhdrjhdrfihilhhlihgrmhhssehinh
    htvghlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehnrghvvggvnheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepgiekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhglhigsehlihhnuh
    htrhhonhhigidruggv
X-ME-Proxy: <xmx:WEw_aPPNlNe5F5Fwu9hcXt-MjbVPmvPvSQ7e5qHd-7mLli-pBbbiHQ>
    <xmx:WEw_aJ5uS1a5Mtiu7m75e2zYP7p7DkI7VER4hDahI0LJ4EPp38J1TQ>
    <xmx:WEw_aJ7Ra73Qygqn7WPmjFyBbehFhuXa94xIIn8f6Kfrvwx5SyzX2A>
    <xmx:WEw_aJjQykfv98sC9HIBDT-cmmuQY6QIVm0cZjZvlrC_eaLPHx0q2A>
    <xmx:WUw_aLUQncdAYpjybHVzA-cyNuaOVdgg7vRrvxIwrweGcFd2aSaWnkGp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 29538700060; Tue,  3 Jun 2025 15:26:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T47dd44791f7a342e
Date: Tue, 03 Jun 2025 21:25:55 +0200
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
 "Kees Cook" <kees@kernel.org>, "Naveen N Rao" <naveen@kernel.org>
Message-Id: <0dbb52fb-9e37-4b3e-a247-5946f08b846f@app.fastmail.com>
In-Reply-To: <683f3c91c033f_1626e10021@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250520152030.1499670-1-arnd@kernel.org>
 <20250520152030.1499670-3-arnd@kernel.org>
 <682e5029e88e0_1626e1008e@dwillia2-xfh.jf.intel.com.notmuch>
 <73120bb4-7eae-49e7-be50-1fac67d351c2@app.fastmail.com>
 <683f3c91c033f_1626e10021@dwillia2-xfh.jf.intel.com.notmuch>
Subject: Re: [PATCH 3/3] [RFC] x86/devmem: remove low 1MB hack for x86-64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jun 3, 2025, at 20:18, Dan Williams wrote:
> [add Naveen]
>
> Arnd Bergmann wrote:
>> On Thu, May 22, 2025, at 00:14, Dan Williams wrote:
>> > Arnd Bergmann wrote:
>>
>> The third one maps the BIOS area at 0xf0000, and as far as I can tell
>> the hack explicitly allowed mapping that even though it is marked
>> busy on x86-64 since 5d94e81f69d4 ("x86: Introduce pci_map_biosrom()").
>> 
>> Is there any downside to marking this one non-busy and still allowing
>> the ROM to be mapped? Would that bring back the issue of conflicting
>> mapping flags between kernel and userspace?
>
> For the confidential VM case I expect the answer is "yes" per this patch
> attempt:
>
> http://lore.kernel.org/20250403120228.2344377-1-naveen@kernel.org

I thought the problem here was the read() on /dev/mem, not
the mmap(), are you sure it's both?

With this patch [3/3], the memremap() hack for mem_read() goes away on
64-bit, so there should be no way it gets mapped again using that,
and the generic devmem_is_allowed() just forbids it as well.

The mmap() access in turn goes through this function

pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
                                unsigned long size, pgprot_t vma_prot)
{
        if (!phys_mem_access_encrypted(pfn << PAGE_SHIFT, size))
                vma_prot = pgprot_decrypted(vma_prot);

        return vma_prot;
}

which I would expect to return the correct vma_prot value already.

      Arnd
