Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1905366
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814008; cv=none; b=mEToGzQT6fsQL9Z3m5DgfkuryIsJGK/hzwZH8VjhhJSSTjD5k/F9hpeDviWfUQuDWmanPjJ1SCUenB/q670RwxL3HXYebY8CQ/jIEngfFZrcwTC3B+BqVj3kCDUheO0K+CT0pmB9hS7sWfCj/Fwaxt7W1t/GfMT8vZhrfKE2SFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814008; c=relaxed/simple;
	bh=HoYWi4+0v/KVNZ0b9OSoX9hfHkWQBlKhjQL77cjBySE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=URIkOZERolZzAg5CxfPCjvGwSJoD1bCUYqrRToTQeXc8JCh/Iqhi6Cc+24591ObMCRDxizP9QJ2j46SRpLkT3qbv0sOj58X1+37Ym3wlLrRv0aN308/pe2RlmI2qP/p1gIsjaemC9CEwdTspYCKc2rrjQiYOwfXPVAXYS+5jWic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Jj73PsbV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vLzmUs20; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Jj73PsbV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vLzmUs20"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C1594138019E;
	Fri,  9 May 2025 14:06:43 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 14:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746814003;
	 x=1746900403; bh=ZlfmUl5uLz2qJIT8T5FoJ+DkbVNtWtKZQsZuALAMm2I=; b=
	Jj73PsbVbC3SsUE0LvjQT1rdw5DeInXuw8wKKHXHTyvpFL18jHihtxwzCWU+i44n
	zpOJHFSRiQxlyA0anp32RfR6vzkw7XC2jGXpbZFVC6YbFX7xCIbSsgUrxKV8kTxg
	NFp9alle+wlVeqPzGVQWOcCyDdH+A6tmWKy9qA2lDKRHebFnwOYT5o07oQXr9FAH
	EvvisRbl1QNkK3wcBtbh7eBcXo9MbtVgEDWU9eJayQjfNMcbbMB7I0iJ9Z5leIR5
	Wq6JgG+qfZ9vMOY5VUwN/QZo7RdXrS/UjMvNOV1dSky8X5al7+b4EkE1nDM78bAl
	bcYnbZ+ZEfs3v8hOAEvNdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746814003; x=
	1746900403; bh=ZlfmUl5uLz2qJIT8T5FoJ+DkbVNtWtKZQsZuALAMm2I=; b=v
	LzmUs200+05FQH5I7Sz/vvgFcdGXig4g34FqQ9qwgsgAvLtUrdCqmOSksI/YsoRq
	Rh5RdVm/8N8Yjj7EU4cTl5Axn4NM1cAlY117XGgUPzOysJS7ORyr8ima1I4Vs+Qi
	3J2j7vxIoVUO/sq/4Bj2U/R7fzI/ntGaEY4kGo+6/3jy3IRJb1hZf04L3BBu+dr0
	sGzzC6DLXwvIgGAKGdu2phTdHKy4Rmg7qo9HPemLvfnAMT5wvbASp8NQj/m60T2V
	cuyZzofR22OJHoVmkKx2E5w5NUGSeFb7sWnUbxnjfTOdBstqencFM0Zd8bPjJ0Gi
	t6ODg5LPPYAiVGzJCj74Q==
X-ME-Sender: <xms:MkQeaLhJyU_i03HUcpn2rqKGfXtENCNU5h4evtrsgK2jcUm9qWJcCg>
    <xme:MkQeaIDPhZ40rkveT8jzbVX30TDe8tV0mBqmG_jDGbRFRGe61-wsRITSubxXsQTkz
    Zm5VUhyb1DsBBjttlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegufihmfiesrghmrgiiohhnrdgtohdruhhkpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghruggssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehtohhrvhgrlh
    gusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhitghh
    rghlrdhlkhhmlhesmhgrrhhkohhvihdrnhgvthdprhgtphhtthhopehvkhhuiihnvghtsh
    esrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:MkQeaLGxxviMBGwD_cMeXteL014A03orX0tiPu9eR9rf4kGWMZaKZQ>
    <xmx:MkQeaIQaTgKOMixx_WHDiEz71wMKNu5Yo_uTXQH5dhDC_FIuBvyQEA>
    <xmx:MkQeaIymB01ksdpYovUT9Pkf8f7xBA12AJlMq-_DjnW5PT-Rycsb3A>
    <xmx:MkQeaO5N2h3dAxJTdYY-94U4JTm6X4ChxrG2e_uSKlQ61Gy-Xy_k6g>
    <xmx:M0QeaM6ylxCclFIu0Hqi8Ra1jrj33x02CBcjUNM87hXf8phPIWvCKHCY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A3A21C20068; Fri,  9 May 2025 14:06:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T29c54119c216f9b9
Date: Fri, 09 May 2025 20:05:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Borislav Petkov" <bp@alien8.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "David Woodhouse" <dwmw@amazon.co.uk>,
 "Masahiro Yamada" <yamada.masahiro@socionext.com>,
 "Michal Marek" <michal.lkml@markovi.net>
Message-Id: <80bf15f5-b34a-4095-beb5-ae9a530da9a4@app.fastmail.com>
In-Reply-To: <aBr_GZ9P7k_I7RU6@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-5-mingo@kernel.org>
 <cd541739-4ec5-4772-9cef-e3527fc69e26@app.fastmail.com>
 <aBr_GZ9P7k_I7RU6@gmail.com>
Subject: Re: [PATCH 04/15] x86/kbuild: Introduce the 'x86_32' subarchitecture
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, May 7, 2025, at 08:35, Ingo Molnar wrote:
> * Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:


>> Also, I don't think there are any systems that return 'x86_32' from 
>> 'uname -m', so your added special case would never be used by 
>> default, only when cross-compiling from some other architecture.
>
> No, on most 32-bit systems 'uname -m' returns 'i686', which we cannot 
> use straight away anyway. And it looked a bit silly to me for us to 
> fudge over the architecture from 'i686' to 'i386', when we haven't 
> supported i386 for quite some while and are now working on i486 
> removal...
>
> Let's just have x86_32 as the internal primary subarchitecture name, 
> with support for historic aliases like 'i386'. That it cleans up things 
> for defconfig naming is a bonus.

If we're going to remove the ARCH=i386 stuff anyway, I wouldn't add
x86_32 now, what I suggested was to  remove both i386 and x86_64 as
identifiers here and just keep ARCH=x86 internally. It's only used
in two places anyway: the 'make defconfig' and the CONFIG_64BIT
selection.

The SUBARCH= logic is independent of that, this bit is only used
for arch/um/, though that would have to change the same way as
arch/x86

      Arnd
