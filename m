Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608EB255F5C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046913; cv=none; b=klfd62ZqQfgZYPVjwGwyqcVjth1j9fTPsjvdiB/8d2TmZHpeIQOxX9Sqm90u0s3Ow3wlpjpgpTZcluouoSLtru7Jdqy00Wt2cAXkjOJigGmwm3kP4+E0tfbj95XCKlafewbP3TYpi98ZjeBqHVIAM++662FJRmYDPrJfdL6NiUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046913; c=relaxed/simple;
	bh=MrjlLZkBxYgRGqO34zQA5xjMA3Hjo55G9/q7gXuifaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNFfOhO5v8OmfaSQv05MvYSGwnr/0EiU1xUtOJH4Hb2yz2O4164tHxypgk4RXxfQD5Gzogh3gZiBBye2aWF+QyLaR1HynnuwopHTix++Z9jW/MueWfOYINsj7rmnBR2GV5dvKBJPrzn/Wyd6OXjce+XwpKgRVzIx+eS6nZ7GcSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Tu/e5LT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4QxcL7DY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Tu/e5LT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4QxcL7DY"
Date: Mon, 12 May 2025 12:48:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747046910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS4dj29bpJH7iHFVdZ+pTOwbUKQMYVtztPWAlCJr8DM=;
	b=2Tu/e5LTmZiER2miy0w2b0DOLzyGs1yM0ap7yrTgJJGpnVG7Y7lm5bKJjnKw13ySx6NLZi
	wSFDjfpyGJ887KmUAEwYLnDc20on8CYkeE+0yHg2b3VUWliuBcUutV6gp1xmXCJDJhu1nB
	8wDDSYD9Pd31p3npxjJ8sLKwhIl1mqNztXN+o36BHnz2EQULOVMUPMEnU56e2BktUzvURT
	CsGYC+TOn8YdE/mkzUSZ8UODG0kvlUDNPMUSC/KbUUm01dW6x6N/QAaVpt4vYElQJzL/+V
	a53xlUAW0Et5LyZ9JBP4TGZVZFN+iktKIn8B281EFsBA1BdPkg73eusFSXY8kw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747046910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QS4dj29bpJH7iHFVdZ+pTOwbUKQMYVtztPWAlCJr8DM=;
	b=4QxcL7DYc7rbgWkxxgv3UflojiQrbZ+vWODN+jRXo1DRmRW+uK5ilY/hZcYHb3gqpOmU7S
	p0Da8LKO+OsoBKDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chen Ridong <chenridong@huaweicloud.com>, paulmck@kernel.org,
	legion@kernel.org, roman.gushchin@linux.dev, brauner@kernel.org,
	tglx@linutronix.de, frederic@kernel.org, peterz@infradead.org,
	oleg@redhat.com, joel.granados@kernel.org, viro@zeniv.linux.org.uk,
	lorenzo.stoakes@oracle.com, avagin@google.com,
	mengensun@tencent.com, linux@weissschuh.net, jlayton@kernel.org,
	ruanjinjie@huawei.com, kees@kernel.org,
	linux-kernel@vger.kernel.org, lujialin4@huawei.com
Subject: Re: [RFC next v2 0/5] ucount: add rlimit cache for ucount
Message-ID: <20250512104828.hjVjvmT3@linutronix.de>
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
 <20250509131849.112545d60dd7bb2d28c3b966@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250509131849.112545d60dd7bb2d28c3b966@linux-foundation.org>

On 2025-05-09 13:18:49 [-0700], Andrew Morton wrote:
> On Fri,  9 May 2025 07:20:49 +0000 Chen Ridong <chenridong@huaweicloud.co=
m> wrote:
>=20
> > The will-it-scale test case signal1 [1] has been observed. and the test
> > results reveal that the signal sending system call lacks linearity.
> > To further investigate this issue, we initiated a series of tests by
> > launching varying numbers of dockers and closely monitored the throughp=
ut
> > of each individual docker. The detailed test outcomes are presented as
> > follows:
> >=20
> > 	| Dockers     |1      |4      |8      |16     |32     |64     |
> > 	| Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |
> >=20
> > The data clearly demonstrates a discernible trend: as the quantity of
> > dockers increases, the throughput per container progressively declines.
> > In-depth analysis has identified the root cause of this performance
> > degradation. The ucouts module conducts statistics on rlimit, which
> > involves a significant number of atomic operations. These atomic
> > operations, when acting on the same variable, trigger a substantial num=
ber
> > of cache misses or remote accesses, ultimately resulting in a drop in
> > performance.
>=20
> Did you consider simply turning that atomic_t counter into a
> percpu_counter?

That sounds like a smaller change. Also, do these 1=E2=80=A664 docker conta=
iner
play signal ping-pong or is there a real workload behind it?

Sebastian
