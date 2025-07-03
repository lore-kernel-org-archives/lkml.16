Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3962DE701
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579503; cv=none; b=lsK5HaNWSBJcceBAAxU/e1eRaeQ4HxKerDya3cK13TE+bPoAILt3YXmoBWr304EVYvGBypOmvox+0TLm3ieFUi23qZNrtxMZcAXHThPh02TLaMRD4zdLoyOlVt1edLIqtd/jTc5YE27i4FoWfjfsbx9QKe7drQOFtlAUHDwa9zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579503; c=relaxed/simple;
	bh=3Q0iNSrxY/+0+4HWOT6KwZHJuWt0xV9uvF8SsizPuyk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rNenePS113fWH/9eHTZEYNV0vayIWS9kP3DpIEpAMgptL8co0MN9/6vw04Lxxf7MD1lKZuRrv1J5jyK9sDeegEy8ga3Tik9E79WuBG6o/uiltqE9b8fIPDZzclgc4wkanSRDK6ZmiFA4OrxQskJN4cXaecKdD0f8FZwUXDhl7qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ulaEXyvF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L5UMvyEY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ulaEXyvF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L5UMvyEY"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751579500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AMctfDgk0d/ScRhzx0rzzgoIcZATCyOAgGRtgKIvgdA=;
	b=ulaEXyvF8lkZ9O/fuPn0xyurtQIMi+IvaHirBUjvcFj9jXXhdY0hircZMBWVeQyFU42xfa
	637SdcE7LpBN4PL+kb1nBLN5dw35Zf2diqJGxa1IgpRPHMHifhEsRGzCTw7xOyuyMNsIkv
	W3LqcFeh6+u+im9jnkraNeaz4PNf+0dlrHYUVEhy0rDXhQ8PW8l+YW8EEGruHJGSM83DTq
	C0z0dfl2D/x/RwnelM/3Yo5kcbtUjaMHOBHthp5ZRUO6tFDK43+Zof8cJeLedIXAgGRxmS
	UJSPoRKwoLD3O6H2sGddTBjo8Wu8Z398VVpFYG48s+wqh8BjAUQXcvk/Lyj4OA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751579500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AMctfDgk0d/ScRhzx0rzzgoIcZATCyOAgGRtgKIvgdA=;
	b=L5UMvyEY1jCDC1OXRz+eNorYsITvFtvyOecn2hidSoUYofsH8eQLzS8kcIzlOgGvEN4DBh
	Lf/Rgj3QwzQA2lBg==
To: Himanshu Madhani <himanshu.madhani@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: System hang with latest kernel v6.16.0-rc1 (rc2 & rc3)
In-Reply-To: <85A10B5D-67E5-44F5-886F-CA9D5E7EBFAF@oracle.com>
References: <ABB1DAF0-048A-4373-9007-988D20F359DD@oracle.com>
 <7279DC28-17BF-4A28-96ED-7AE9857BC2E3@oracle.com> <87a55lt48k.ffs@tglx>
 <85A10B5D-67E5-44F5-886F-CA9D5E7EBFAF@oracle.com>
Date: Thu, 03 Jul 2025 23:51:39 +0200
Message-ID: <87tt3trlhw.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03 2025 at 20:34, Himanshu Madhani wrote:
>> On Jul 3, 2025, at 13:21, Thomas Gleixner <tglx@linutronix.de> wrote:
>> The problem is obvious and if you would have enabled
>> CONFIG_PROVE_LOCKING then you would have got the reason presented on a
>> silver tablet in dmesg. I encourage you to do so nevertheless.
>>=20
> Great tip on this. I=E2=80=99ll keep that in mind for future debugging ef=
forts.=20

Actually the very first thing in testing of a new kernel should be to
run it with a copious amount of debug options. That avoids all the
headaches of chasing fallout caught by them, in painful ways later.

I'm truly surprised that this is not done already and testing blindly
assumes that rc1 has already been objected to such tests completely.

It's bloody obvious that with a code base of the complexity of the
kernel and the gazillion of drivers, the CI coverage is far from
complete and only best effort based.

Obviously the companies, who have access to and care about their
specialized hardware, should run CI against linux-next to begin
with. Then such problems would be caught way before they hit Linus tree.

I know there is no budget for this kind of effort. Companies rather
waste their budget on chasing problems, which could have been avoided
upfront. That's a huge cost saving, which is proven by applying magic to
the relevant Excel-sh*ts.

Not your decision, I know.

Shrug,

        tglx
