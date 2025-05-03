Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880C925DCEC
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746278108; cv=none; b=hqI9hKg/gVfdGv8IGPxr9lBojeLc9guq2Pf7U5wwWxvkAAjdQqweTLwr201+hj0Shy1jmBnemXYiwoqZj7Xqu5loxihBfYER//N9d+CEs9MQrf9gcQzG6i+MLAVHci23s0mSK3e9K12q+usamawKp1sZ8h0YlkNJfFfE3kZ7gXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746278108; c=relaxed/simple;
	bh=aYqlAgaW1BN2EJlXLlpu+maaTxoLpHFaDnttJnKf1cw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bKo+H/ySAcAkjBfGS64NkQ8vLfCbtWE++ku2kWc6pfDJGyxW/tzQTy6AtJA4FOmhqE+dv67Ow8eoq22H0ycGvOUXOXkMtW+LcaNuQI6rabfkYKFazexJSJuzV7cufjWGuXs4DHT/AxjAZLQrZFMM08C4kQlMdqs61hUaNhMCrKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=66Kjda99; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="66Kjda99"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fHhN6uyA0TB+lhbTX1KP1QT/9BLhhUvCS9lVwTWK7/4=; b=66Kjda99as4mRK+jXzyiiPMq1R
	u4Ow35Y2d3Xz2ul39qQZEhMimHPFOZuEVL9m4uirzuKOz2W3r01Vqnf93zAF0yr9BxSol9g4sjmsU
	77rZouW00Wob7C9MMyyWUgjgf3WUr2rOd1yjGp+VfvwJKjYT6dW4AU16SJBawoTbR2rsNkGgzAnFy
	rh0WhFq9HsrJpssWYreyG8F7DE5IZyEdEB1I8C0JkFWyQb6WDgsrUwZJELzenPZaqwPyX94xbj0Kf
	WfGMXKJMAaHT5GGZpMj/n/7sHaPWnNUXXP5WGUEs7Wsj7fghwMsAofV1IVqPJNj1SHQZLpjmCwE+V
	zoeHRXyw==;
Received: from 46-253-189-208.dynamic.monzoon.net ([46.253.189.208] helo=[10.247.26.8])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uBChg-006uUC-11; Sat, 03 May 2025 14:14:52 +0100
Message-ID: <5c2f8c8b04e1e36d721c1f90f39c02dd5d971580.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: luca abeni <luca.abeni@santannapisa.it>, Juri Lelli
 <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Date: Sat, 03 May 2025 15:14:50 +0200
In-Reply-To: <20250502161033.1ed7ddef@nowhere>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
		<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	 <20250502161033.1ed7ddef@nowhere>
Organization: Codethink
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk

Hi Luca

On Fri, 2025-05-02 at 16:10 +0200, luca abeni wrote:
> Hi all,
>=20
> On Fri, 2 May 2025 15:55:42 +0200
> Juri Lelli <juri.lelli@redhat.com> wrote:
>=20
> > Hi Marcel,
> >=20
> > On 28/04/25 20:04, Marcel Ziswiler wrote:
> > > Hi
> > >=20
> > > As part of our trustable work [1], we also run a lot of real time
> > > scheduler (SCHED_DEADLINE) tests on the mainline Linux kernel.
> > > Overall, the Linux scheduler proves quite capable of scheduling
> > > deadline tasks down to a granularity of 5ms on both of our test
> > > systems (amd64-based Intel NUCs and aarch64-based RADXA ROCK5Bs).
> > > However, recently, we noticed a lot of deadline misses if we
> > > introduce overrunning jobs with reclaim mode enabled
> > > (SCHED_FLAG_RECLAIM) using GRUB (Greedy Reclamation of Unused
> > > Bandwidth). E.g. from hundreds of millions of test runs over the
> > > course of a full week where we usually see absolutely zero deadline
> > > misses, we see 43 million deadline misses on NUC and 600 thousand
> > > on ROCK5B (which also has double the CPU cores). This is with
> > > otherwise exactly the same test configuration, which adds exactly
> > > the same two overrunning jobs to the job mix, but once without
> > > reclaim enabled and once with reclaim enabled.
> > >=20
> > > We are wondering whether there are any known limitations to GRUB or
> > > what exactly could be the issue.
> > >=20
> > > We are happy to provide more detailed debugging information but are
> > > looking for suggestions how/what exactly to look at.=C2=A0=20
> >=20
> > Could you add details of the taskset you are working with? The number
> > of tasks, their reservation parameters (runtime, period, deadline)
> > and how much they are running (or trying to run) each time they wake
> > up. Also which one is using GRUB and which one maybe is not.
> >=20
> > Adding Luca in Cc so he can also take a look.
>=20
> Thanks for cc-ing me, Jury!=20
>=20
> Marcel, are your tests on a multi-core machine with global scheduling?
> If yes, we should check if the taskset is schedulable.

Yes, as previously mentioned, we run all our tests on multi-core machines. =
Not sure though, what exactly you
are referring to by "global scheduling". Do you mean using Global Earliest =
Deadline First (GEDF)? I guess that
is what SCHED_DEADLINE is using, not?

Concerning the taskset being schedulable, it is not that it does not schedu=
le at all. Remember, from hundreds
of millions of test runs over the course of a full week where we usually se=
e absolutely zero deadline misses
(without reclaim), we see 43 million deadline misses (with that one rogue p=
rocess set to reclaim) on NUC and
600 thousand on ROCK5B (which also has double the CPU cores).

Please let me know if you need any further details which may help figuring =
out what exactly is going on.

> 			Thanks,

Thank you!

> 				Luca

Cheers

Marcel
