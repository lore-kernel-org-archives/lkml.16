Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0DC1B86F7
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738323205; cv=none; b=J52QBeLfiUJ+rGP8m0Q6cHgwG6jdr+RJtQ7tmh1vsOrzdeEf7jyROo1klOG/wJxemOEx0t+MR6Cb2VI6sjqlTCftiEgJD0vnFvgGZFLnxM/2LzmoKN4ZZj5pFiCRN+ygRJOdqGwqGozPZEZy8QIUKsJnAB20vU+yfsnvMuQPwFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738323205; c=relaxed/simple;
	bh=N/l/YOZ7YasWbku84WJiOPIQUhlmC6anStFROdBe0H4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=h7cjtamkW+4yT/Ky+PpvUhc+qsQet4TyoSubvdC6C3pxvwFbQtwSU/yrUmb3VicgeAVh6eY7Mad7htSE87Q2CUHxBx+Nv6Nw2hpq3mI0ZSIwYjRgbMfFWQKgVIak62dxLclli2Fd/pp8FJe3mBQEPFkiFBA24vnUlbvgiRY0kaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XTdqilAI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iGk2BR36; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XTdqilAI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iGk2BR36"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 9968B1380120;
	Fri, 31 Jan 2025 06:33:21 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 31 Jan 2025 06:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738323201;
	 x=1738409601; bh=t83pxTVoc+bxWv+k8uOmCii5XJa6SN5D5kCtdcorOSw=; b=
	XTdqilAICmG/HpnUbiXCWhoHVUUWUeJYnnpx77yOeb36W2snZ0ejqfWT1avZgrwe
	DU4yxCxz9+aGKHrtFwhXgz5AqRMkOQ+A3T8CTHecleNdhaGxl8nqEBuJPlwUWTPB
	OJv3JqjObCjeI8GvUuFzuhV82viLAJfwZRRQd3Cv5Ifag9sba/KF1Q9BLMDKuJeq
	R9Go5tOEKlWYu2aCwcXPYxMezDeVpAk6Q+Nr4HNmFxYEaPC65arrsZqwwKU7wZ+0
	uTo1mG/5bd/2xmyQiGDs+aywhOUSQ9u9t7ts1KXtbGJxAgvAFTrSmVuSabq6di1y
	TzV4NJFtl+GI1QfeDLU1Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738323201; x=
	1738409601; bh=t83pxTVoc+bxWv+k8uOmCii5XJa6SN5D5kCtdcorOSw=; b=i
	Gk2BR36hHD17JZ4AkEToDOnHfiqGKDISwQecHqBrAwxEfUMcX3R+W51eH+/KpTcx
	/+1F1KkAky/tJXMtZYjFD/iT0N/wJFMGmv0qA4Ng+Z/ixNWys/9dqoLQkL0Hs4pB
	RQzXdxwoe5rzDGf2DYhIqYBhINieQxR8PUsn3PLaNRwl2rrcN64/a0govD37aUbg
	hVkxH0F4N1LPbLshV/+GcIAM7wY/UnXe9+hlK71BeEyLkwNOb7QzuhUqBzpXhYbA
	W9iTE//6xEBBdeAz4SFCvIOwCs8m/De2BkaTA61KU9cpmpMUJ9xSVKSpXhaV5UaS
	aR1u5OsRrjn9wtk9IOrYg==
X-ME-Sender: <xms:AbWcZ0tNRc2ghAGm_kdVUcNxf2BPEy9YE-xLaN_S9E0cWVVr8ZXUfA>
    <xme:AbWcZxdnDT3IkPg9DTn4BdB29UDuMp50vrKbepnAmceIO9VeX4OCB_eaKs642a3d4
    tQODAFSL9rRqFecmTs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgvnhhsrdifihhklhgrnhguvghrse
    hlihhnrghrohdrohhrghdprhgtphhtthhopehjvghrohhmvgdrfhhorhhishhsihgvrhes
    lhhinhgrrhhordhorhhgpdhrtghpthhtohepshhumhhithdrghgrrhhgsehlihhnrghroh
    drohhrghdprhgtphhtthhopehophdqthgvvgeslhhishhtshdrthhruhhsthgvughfihhr
    mhifrghrvgdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:AbWcZ_zm5_u_FB2d812hfqUn5bLJi2fAh-08UflBVNI-92-3XGxpgg>
    <xmx:AbWcZ3Mtd1gDv7pfPxXBsO733lpGHLgrCCWi2QKzADoTtB_ImPZNkw>
    <xmx:AbWcZ09w25mzpkhpGmd7EeweWOM6dUvgYAtw7z6Fp87b4G2UAYhM1A>
    <xmx:AbWcZ_VnEDXeXDVwttx59Kf6_bF4XYyEYSPud7CqHLqLTu8-B5PsJg>
    <xmx:AbWcZ4ZlMiIf7tvGDe8M60J3RBXkja-FSDd3rVpMvjkqyDroqzdlDjx->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3DD192220072; Fri, 31 Jan 2025 06:33:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 12:32:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sumit Garg" <sumit.garg@linaro.org>,
 "Jens Wiklander" <jens.wiklander@linaro.org>
Cc: op-tee@lists.trustedfirmware.org,
 "Jerome Forissier" <jerome.forissier@linaro.org>,
 linux-kernel@vger.kernel.org
Message-Id: <11d19be4-85a2-40dd-b3c6-07bbdd794df0@app.fastmail.com>
In-Reply-To: 
 <CAFA6WYNj0aWnV+jxoxHU7OOg8oWC2-AboUMztxaPCDQuO+c8gg@mail.gmail.com>
References: <20241213111453.367031-1-sumit.garg@linaro.org>
 <CAFA6WYO+T2pZcB2VBhP=ut2w9HtkeCvYkqoM85LZnJ9iF+gvNw@mail.gmail.com>
 <CAHUa44EE6XL5zgf0VNeqPkUukFGz5BgiHz=0yAVdd=tEzLEq6Q@mail.gmail.com>
 <CAFA6WYNRD-CGTHufafFLX4SjvpH6fBKwqCac8JE2oLepqqsNOw@mail.gmail.com>
 <CAHUa44F76AqB4ijQHBfoNXveiyxeBLOLh6ULT+pc+va3y0qBdg@mail.gmail.com>
 <CAFA6WYO1aXiUozs8WiawSbok5hCmV8bXz9cRgEJ0r+LAwL9J9A@mail.gmail.com>
 <CAHUa44GdxO3TCLyOQdCHbdVGKpSHpnxBp_JAfAhpVgXuWYOVhw@mail.gmail.com>
 <c3c782f8-fb48-4d3e-95b0-d0707f57acff@app.fastmail.com>
 <CAHUa44H4yLvkU6ATvk0KOzVDa2TOgS9EBsU+BKR2piZbX26kLQ@mail.gmail.com>
 <CAFA6WYNj0aWnV+jxoxHU7OOg8oWC2-AboUMztxaPCDQuO+c8gg@mail.gmail.com>
Subject: Re: [PATCH] tee: optee: Add support for supplicant timeout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jan 31, 2025, at 12:06, Sumit Garg wrote:
> On Tue, 28 Jan 2025 at 13:49, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>> >
>> > As far as I can tell, even that DEFAULT_HUNG_TASK_TIMEOUT
>> > limit is only for tasks that are in an unkillable state for more
>> > than two minutes, but the supplicant not providing results
>> > to the kernel could also happen when it waits in a killable
>> > or interruptible state, or when it does multiple I/Os in a
>> > row that each block for a time under 120 seconds.
>
> The supplicant itself can be in a killable state but the client
> application which will be waiting for it in the kernel is in
> unkillable state. So if a shutdown/reboot is issued at that point
> which has to kill the client application first and then the
> tee-supplicant, it will just cause the system to hang up. That is a
> real problem that I am trying to address here.

Is the client the one waiting in optee_supp_thrd_req(), or
is that the supplicant?

If the problem is the client being unkillable at the moment,
could you address that by using wait_even_killable() or
mutex_lock_killable() and just bail out safely? I assume
at the point the system is rebooting, there is no need to
wait for the supplicant to complete, other than making sure
the function can return without running into undefined state
of the kernel.

>> > A single sector write to an eMMC can easily take multiple
>> > seconds by itself when nothing is going on and the device is
>> > in need of garbage collection. If the system is already in
>> > low memory or there are other tasks writing to the file system,
>> > you can have many such I/O operations queued up in the device
>> > when it adds another I/O to the back of the queue.
>>
>> Adding a timeout means we must somehow handle them to avoid spurious errors.
>>
>
> The timeout I am proposing here as default being 2 minutes is just for
> a single tee-supplicant RPC request. I suppose that should be
> sufficient to avoid any spurious errors.

It won't guarantee that, but if there is a 2 minute delay, that
likely means that the system has become quite unusable from being
slow, even if it hasn't otherwise misbehaved to that point.

     Arnd
