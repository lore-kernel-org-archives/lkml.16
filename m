Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C8D1FAC29
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749065012; cv=none; b=QneYIKRvgyBZETAhSWoiyumuW1+NxgW8Llr5OKOKbpcYV637ZzyVl/2/DmDmvF6Nlf4EUeH7FQjFv6Lwwy3ylvOLxzFaT3FTq6uA3w+gi3RLph4nO9BDP/wonsDWfaqtZvml2UKHTAedMoX99s76s9B1iILwUmyaprxpdGbmw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749065012; c=relaxed/simple;
	bh=VlJRoxCZ2RUdcfbxG/mzbEwoNt2y+5D8TQn4Ki03Wp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFT7zBjJ32it/Kgqu5np1P6IuOE/jWUcPXEClYXagK6r1yp2Oy2GoTteqt7IW3FV+ygabu9k4mvezFOmMw1lH01c3+gupjMvcFekvz8iwLqnI63c5J7hw45VqcQOuZVBj5jQb9PQpOCrEeKBfmhNqqkk88SCzu36B7gtYrjI0H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T2MOgSPa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fDo21Itx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T2MOgSPa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fDo21Itx"
Date: Wed, 4 Jun 2025 21:23:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749065009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlJRoxCZ2RUdcfbxG/mzbEwoNt2y+5D8TQn4Ki03Wp4=;
	b=T2MOgSPak84Lhcva61WZnrlTZtEILLivhiyakZSSfcujsY3j4oIJmPGCnF+6OkVE42D0kJ
	RA+9kD/WPTpFUpqJLXYW10pCWhpqjtB/0gyDVgAi8FmnAyD+3nJ49OgPze3FaEqPXloTqF
	u8U8Bb/fD+TY27e56AZbHevrpuPBcFtz9tTNhzJVTR0J9uFDrcAUQNnFOw0HZltTkk3uF3
	eF944bioaw5gR8jurU9nlDxAOJ86G6yTxKmEUF9EYCXAubyBZuwrizXQvfTc6s+VuiLEPS
	KpVJicx/ps/LjQdVO67LdxK87GfMEt/+UESPerLtEu2/xxGuJ7LU4nNJczQW/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749065009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VlJRoxCZ2RUdcfbxG/mzbEwoNt2y+5D8TQn4Ki03Wp4=;
	b=fDo21Itxih51zSQBIPjf1BSokfnrD7fTray57+g1mLGli1TMxEeDYkYggFPC02sFBMN+F1
	eRf1bxLJ8BCeLhBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"kprateek.nayak@amd.com" <kprateek.nayak@amd.com>,
	"vineethr@linux.ibm.com" <vineethr@linux.ibm.com>
Subject: Re: [PATCH V5 1/6] Sched: Scheduler time slice extension
Message-ID: <20250604192327.sVjt6c4u@linutronix.de>
References: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
 <20250603233654.1838967-2-prakash.sangappa@oracle.com>
 <20250604103106.1465f847@gandalf.local.home>
 <20250604145433.KCPMF8zm@linutronix.de>
 <80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <80120491-7F90-4171-9FB8-9FE89B09F728@oracle.com>

On 2025-06-04 17:29:44 [+0000], Prakash Sangappa wrote:
> Don=E2=80=99t know if there were benefits mentioned when RT tasks are inv=
olved.
>=20
> I had shared some benchmark results in this thread showing benefit of usi=
ng scheduler time extension.
> https://lore.kernel.org/all/20241113000126.967713-1-prakash.sangappa@orac=
le.com/
> The workload did not include RT tasks.

I don't question the mechanism/ approach. I just don't want RT tasks
delayed.

> -Prakash

Sebastian
