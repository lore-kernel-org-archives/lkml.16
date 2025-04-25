Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244D12192F3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618088; cv=none; b=Sp8JJ5gaDqYKn+Nl9qw6kcuG74ZmOSkjV3pTGQZLWzJnQN/PCNL6j27yqChy91C25yT376WjJ11REC1XCEaHwZrV/K4Juuv2bDTOSjGAYlzEK71n86yoWXiTCmsFFSTAmabr/USyw1O7ZK2S6DhcRZJG98MlYYDeQr4zv/RJIK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618088; c=relaxed/simple;
	bh=Mc9klkHjsEtUdhzu7kWt63vU8h5AjTn8SprVVJFiBOc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kjOHEQwMzqG1z/D8bJo8k269H2YU0wN5Y4r+IsONRA0o5hZXCVrPJhSatMFs12DDBpRuetsNAWBYaCdAqLXx4Dn8e2yJDZNZTC0rjUPA2PzWW0kvX5MDnRMTDFWAACYdyEHN7UvqmT2AZKtIvRxL7iXO9122n6U67ZKOfiTyrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fu+J0XSq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fu+J0XSq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2B6C4CEE4;
	Fri, 25 Apr 2025 21:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745618087;
	bh=Mc9klkHjsEtUdhzu7kWt63vU8h5AjTn8SprVVJFiBOc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Fu+J0XSqt1iBO2Ad6I/EoIr58mfhd6uN9LKiekUC0IBF90uEftYZ58iGp3nXIsohr
	 atuB09rvZp5p3QqmV7+CzHBdZeL5gHII6DUffkviHMDEmEjkvNDCB6OGR2ar8RWL5R
	 vlYgOF0zlOABni1HA5wdJWp2b5A2YpmvXhdT4/GaAYx9HDlsJdYyLb2FwIrEAbrrcU
	 7K4V6gCi2r/nKe3y0SxH9aD3xGxZXGzH5xbyKiUw0QPHfBpkYiCdDb+ex0xg6TdZ+J
	 UW50Kgw+cTirKIkmGrmYH4dm6+YlnNO4ga/3hztj2gPu9/opZDyhRpKIqYvMbEBKTE
	 9NpZmdACIw5Ow==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 03D221200068;
	Fri, 25 Apr 2025 17:54:45 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 25 Apr 2025 17:54:46 -0400
X-ME-Sender: <xms:pQQMaLcCtE2TgaFoItHnqeXO8xjTyc9iEtzbcX8C9wkYJ-UsGyDreg>
    <xme:pQQMaBOuv0qtIy98O7TkysWaIMQbtozpGqws-3EvlPm5hz1l41NvwLkQF9r7kY3d5
    tFxP7_9Mn6FU-WE_gU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheefgeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepudffteefvdeljeehgfffgfejheeigfej
    ieevieffteejffefiedtueelgeeigfdunecuffhomhgrihhnpehgnhhurdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhm
    vghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtd
    dtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghr
    tghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlih
    gvnhekrdguvgdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihig
    rdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmihhnghhosehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegurghrfihisehlihhnuhhtrhhonhhigidrug
    gvpdhrtghpthhtohepjhhohhhnrdhoghhnvghssheslhhinhhuthhrohhnihigrdguvgdp
    rhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehtoh
    hrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-ME-Proxy: <xmx:pQQMaEiI5vTsz4uLfN69IMwDsbmqtYYJiTBhNjrRrJhj2CBrsbdmIw>
    <xmx:pQQMaM8i3Ls1_0Y2Vtus8MoxZBeel7tYGGV_831P9rG1OIIknHA_TA>
    <xmx:pQQMaHuQGJmNHsz86kSzCdQJ4xqs9-jFBamm1DMy74H0ec3bTgQ6pA>
    <xmx:pQQMaLGijp3aSjK1dI8R2vg1ovTdMpWGUNTiCrZc4J6ElRaUfp-4qQ>
    <xmx:pQQMaOPcrye1XaqS2hJwJi8W__DWRRnkv5eTXx5qWba_M4iijOoOVqgK>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C6F522220073; Fri, 25 Apr 2025 17:54:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td35c5eaba32a0728
Date: Fri, 25 Apr 2025 23:54:15 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>, "Ingo Molnar" <mingo@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Ahmed S . Darwish" <darwi@linutronix.de>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "John Ogness" <john.ogness@linutronix.de>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@linutronix.de>
Message-Id: <1d4ddcab-cf46-4d7e-9e33-de12b6bd350c@app.fastmail.com>
In-Reply-To: <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-14-mingo@kernel.org>
 <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
 <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 25, 2025, at 17:15, H. Peter Anvin wrote:
> On April 25, 2025 5:10:27 AM PDT, Arnd Bergmann <arnd@kernel.org> wrote:
>>
>>I just noticed this one: the final 'default "4"' is no longer possible
>>here and can be removed. All the remaining CPUs report family "5" or
>>higher.
>>
>>There is an old issue for some rare CPUs (Geode LX and Crusoe) that
>>support CMOV but report family=6. These to boot a kernel with X86_MINIMUM_CPU_FAMILY=6 because it triggers the boot time check.
>>
>
> They report family=5 because family=6 implies fcomi and nopl support 
> (in the case of Crusoe, they have fcomi but didn't support movl.)

Ah right, I see now. I had only checked that the kernel itself
no longer uses nopl after your ba0593bf553c ("x86: completely
disable NOPL on 32 bits"), and I had seen that Debian intentionally
builds 32-bit i686 kernels with CONFIG_MGEODEGX1.

I now found that both Debian 12 and gcc 11 changed their definition
if 686 to actually require nopl for Indirect branch tracking 
(-fcf-protection) in user space, as discussed in
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104713

So even if it makes sense for GeodeLX specific kernel to use CMOV,
any general-purpose i686 distro would still want to enable IBT
in userspace to gain IBT on Tiger Lake and newer 64-bit CPUs.

     Arnd
