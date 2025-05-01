Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7D02B9BF;
	Thu,  1 May 2025 15:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112329; cv=none; b=rDz6VzZ5PFR5dWLZUOzbBrukNoWmpsngH1hzjHCuQj0WJO86HohtAUC/hLa77Vf2X197GHp//V1qeFhHmMahcYJGViW9TlMdSyHkTud0reAQjeUOGmyGN+GWOY57zEd3ybtKZTxt5buZwYA74BYWMexeKqQ6Nz4OMkSxZ7Hjjpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112329; c=relaxed/simple;
	bh=R3l9C1R4R/KdIR4lwp7nEgaejmDMDc80zU/8xtVZzSQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NJOC6x7EiMDu015GjL0I9mYp44mWjt1Z80C7tB76QSmI82hCt6RLdBRp8WpMg0ExkZPcvc62/YOeTmiAqhTCjFEjYVR+eVcN5oOMLS6vFhNQ0cGoukwUtnmqCZjFA/VQd/ZhL/oGuZE562FmLIt/H1UpwEVr/jSiL+EwP4+M+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TS42w0f1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wCyCMVPH; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TS42w0f1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wCyCMVPH"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C81431380FBE;
	Thu,  1 May 2025 11:12:05 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 01 May 2025 11:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746112325;
	 x=1746198725; bh=yodIALAtKUQE3BnTH3TLpMOHe+A+WU45A0x9lHHQZBg=; b=
	TS42w0f1ZnJg28RUH42i6/6XzTHy+8ChlXEe7QzvckkePL1KOBAmqZ3CEx28j2VJ
	4KYQNxtg3cRhIGewDbm/oWTP8KSJszIwvKW0p3JJ1yEzxl4podWb3O1/Vdkgze+r
	/qq1QOL17HT+GjOz0dTMyYjkWTg7+bcX7wvpx3vq29YjutgJQkkEo65f1vTc/OEs
	U/+lGca01W/thJR7EBYFOTUfB9febgo4aEz92yDF22tfCa9NjC9Ze1T1dxvfKF33
	MXe+MFTqen/oAWkSoiffuO7Efa7YNmQovi6d4DYy+T8zttfOFuAdcmkvio9vbwtG
	6eQTT2uaR5WpX540ZMFFZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746112325; x=
	1746198725; bh=yodIALAtKUQE3BnTH3TLpMOHe+A+WU45A0x9lHHQZBg=; b=w
	CyCMVPHCVKJgiZd8+uu3rYp714SpyREWffJIEJZ2KPGRiBaChjpXToLNfj1d2LID
	QwuHWSrWbpUzeTKRg4zfm5C/TKclZt/xXkAKkSUNzy6t70Yu0RyjiM46271n8Kpf
	YRo38CpJLDtbmYc7geM5hJpmlHSEel590KHKVWbIMfn7X6svUBLNSWiKU9zdp65L
	mQ5AqI8Q6TrYpc1zur02kjetC5LeWmEk7xTAvllr8eTnNy1xZBTBHKrFYne18jFJ
	1ETo0ZvhSjYYJKZEuh+jbGpwN+6ifvGxjiRLQCJMX3IrxNn974XQJbU93vyeh0bv
	V2ZLlS4/5NH4UuSgSSBvg==
X-ME-Sender: <xms:RI8TaAGwHbLL6C3gjfPVW2Mq-ec_4aqZ4caGx7y4XSVmgjQt7bIcKw>
    <xme:RI8TaJXypultPvD45OWgE2rqJjQau8KZTJY9BdUHUhQbxKkXWJVBXGLYMAs0D-HUj
    YtVyG6p3dmc0lilyDU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinh
    hugidrohhrghdruhhkpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhr
    tghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhope
    gsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopegthhhrihhsihdr
    shgthhhrvghflhesghhmrghilhdrtghomhdprhgtphhtthhopehfuhhjihhtrgdrthhomh
    honhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepjhhsthhulhhtiiesghhoohhglhgvrdgtohhmpd
    hrtghpthhtohepfhhrvgguvghrihgtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:RI8TaKJ_w0heVf2M2AV2GhWFITMuy9El-USz6OKiytzxTfCMk7vGPA>
    <xmx:RI8TaCFQJAqUIG3aQ-7DYZOut41zb1Qt4YkslAI4xzG39zdrUYmmcg>
    <xmx:RI8TaGWII6oV_l2jUNpvY8GHYEDkcwWNUqjcDA7U_8mpntP4ly6IfA>
    <xmx:RI8TaFNtrjEYpSAvh59cKtvkozdadEIpkwYBEHOsnHuLjqLXjDzEhg>
    <xmx:RY8TaL9O9ezkDEIZvsWJUUUif_eb79VrEmQAyYRsDt7_yZ7DJ4_1_5e3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4EB952220074; Thu,  1 May 2025 11:12:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tf5098123cce77b3f
Date: Thu, 01 May 2025 17:11:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Boqun Feng" <boqun.feng@gmail.com>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Andreas Hindborg" <a.hindborg@samsung.com>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "John Stultz" <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Message-Id: <cbbeca76-7a7a-425b-9cdd-8da778b6d8a1@app.fastmail.com>
In-Reply-To: <aBN1BzCawU0a9Nx9@Mac.home>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home>
 <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>
 <aBNzIp9UF7GZVYLs@Mac.home> <aBN1BzCawU0a9Nx9@Mac.home>
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, May 1, 2025, at 15:20, Boqun Feng wrote:
> On Thu, May 01, 2025 at 06:12:02AM -0700, Boqun Feng wrote:
>> On Thu, May 01, 2025 at 10:07:17PM +0900, FUJITA Tomonori wrote:
>> > On Thu, 1 May 2025 05:26:54 -0700
>> > Boqun Feng <boqun.feng@gmail.com> wrote:
>> > 
>> > > On Thu, May 01, 2025 at 10:58:18AM +0900, FUJITA Tomonori wrote:
>> > >> Avoid 64-bit integer division that 32-bit architectures don't
>> > >> implement generally. This uses ktime_to_ms() and ktime_to_us()
>> > >> instead.
>> > >> 
>> > >> The timer abstraction needs i64 / u32 division so C's div_s64() can be
>> > >> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
>> > >> for this timer abstraction problem. On some architectures, there is
>> > >> room to optimize the implementation of them, but such optimization can
>> > >> be done if and when it becomes necessary.
>> > >> 
>> > > 
>> > > Nacked-by: Boqun Feng <boqun.feng@gmail.com>
>> > > 
>> > > As I said a few times, we should rely on compiler's optimization when
>> > > available, i.e. it's a problem that ARM compiler doesn't have this
>> > > optimization, don't punish other architecture of no reason.

What is Arm specific here? I'm not aware of the compiler doing anything
different from the other 32-bit architectures, though most are missing
an optimized __arch_xprod_64() and fall back to slightly worse code
from the asm-generic version.

> Copy-paste errors:
>
> 	    unsafe { bindings::ktime_to_ms(ns) }
>
>> 	}
>> 
>> 	#[cfg(not(CONFIG_ARM))]
>> 	fn ns_to_ms(ns: i64) -> i64 {
>> 	    self.as_nanos() / NSEC_PER_MSEC
>
> 	    ns / NSEC_PER_MSEC

I'm sure this is still broken on all 32-bit targets.

     Arnd
