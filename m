Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C03230981
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608696; cv=none; b=ZhzAT1LWi/ojZ5p3sARYw/kF6wlA6ZE3ecKKCfJR1ivX22Dd10vIkobJ+lYckufm2U2bFFt893jIRqwfUR24VwX7a7GrU0E9nVQDNqL6DmvI9CLgNfg/wqxjBdaiODlwrwO59sqGvANcM/Q0IwxgEM26bSxEc2ybA0ojdNS5DqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608696; c=relaxed/simple;
	bh=JWWERBufmK6LRMNVXCv1mQKo+iN3/RA6XAy7ezw5O5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TdqSSzG2wUF4ijyjO3C1/vh4seZSs2oj4u/IbiGTtyFtjpcnkC/Ysz+hIvy3A7O5GlFFpOO4reH2/shcCtm41XwSJF/Tm89dbCNtKuzFvDDMrLi5grutgKES9GdlumtiDXRonC/b/KcI2pidxLwjTz4B3bWRW4rQTkDMNwSCxgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U03Rs5nl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fV5IOBZN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U03Rs5nl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fV5IOBZN"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746608693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWWERBufmK6LRMNVXCv1mQKo+iN3/RA6XAy7ezw5O5w=;
	b=U03Rs5nlRhSWt78kSkk3WReqfV31DBMizYQ8sv9+sECVjH241msgdR9C6ckdFa3PleiEt/
	RmiuIp5yvMbSwniJ4aLkOmks2wV8ZgfaCBF7gdGf1W4q+VwecwTEk9a2Yfq+nB/esO3ms9
	mGAiP0Ssuht6bUYo6Fx1e1Lu9aRU0i7tfwQo0PHGj3nmR+xoGItx1OKxWGJjUJ65d359A6
	X1PSvRbdpy4EeqQxTJPLGAHN8R3GltgbLXmonrD9Qu4CLuT5mrq9t/xxMUZfEJNxjFjmPu
	W4APWsJpJaCTWRD1HeZPkQVA6twXEUYvlzKgGiielA4MAVwiPy3IEOoqXyApcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746608693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JWWERBufmK6LRMNVXCv1mQKo+iN3/RA6XAy7ezw5O5w=;
	b=fV5IOBZNCQtZSZLNlqx3sKGBuPCrs0HJMGILpQ9i2TCCO/MQTD1aJIIHgkO5c51Kp9fUiZ
	gp0snI9fpMGDHsBg==
To: Huacai Chen <chenhuacai@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>
Cc: WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH core/entry] LoongArch: Fix include order
In-Reply-To: <CAAhV-H7uvnqReegNM+L6Q=ScnXFmpgYnNNTmokBJe9RDSDDdWQ@mail.gmail.com>
References: <20250507-loongarch_include_order-v1-1-e8aada6a3da8@rivosinc.com>
 <CAAhV-H7uvnqReegNM+L6Q=ScnXFmpgYnNNTmokBJe9RDSDDdWQ@mail.gmail.com>
Date: Wed, 07 May 2025 11:04:52 +0200
Message-ID: <87msbon64r.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 07 2025 at 15:26, Huacai Chen wrote:
> On Wed, May 7, 2025 at 3:11=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.=
com> wrote:
>>
>> Reorder some introduced include headers to keep alphabetical order.
>>
>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>> Fixes: 7ace1602abf2 ("LoongArch: entry: Migrate ret_from_fork() to C")
>> ---
>> This is a very minor fix to a patch previously applied to the core/entry
>> tip.
> If possible, I prefer it to be squashed to the original patch.

The branch is immutable. It's fine to have it on top.
