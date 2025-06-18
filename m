Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A11029B221
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245891; cv=none; b=PafweKuvZegrtphOeLdWTyfl2b7oYJk+fKLXF2wilGM6VkXRx2d5XtpAfm88HNH37IK9l8gekSlcATFNRlmYwXSFsLBDaqjRpp0LZBPdfeQHYiyiIa2Ss8pT2pdDFjc3scSLuAKPzxTDUfCgyYB8sAYGKV71NmnJDf7Ev5pcMKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245891; c=relaxed/simple;
	bh=/O71vnYL2AmztOqSaMJx01um/n4HH/mPFxfjJa81TVg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=APpESTMHCrt2p3Ig6Snt/Z7l7hdNQneaX9nWohaj7vWOu+S/5fQ1B/3SVlHTAFh9PJdww7xDox0Ad11ITU8FfmVT0bnTECN1ZE5u7QsNVWVHOU0pyNzllI9XlDx0rDvx3N1HBECjuNG9PGAIeuV19DKs9FQezeeNLEaqf5uQsPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=PI3DPhEu; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="PI3DPhEu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/O71vnYL2AmztOqSaMJx01um/n4HH/mPFxfjJa81TVg=; b=PI3DPhEuBIOvn8vdhiQMk3S3I0
	71XjjmghhsiJ/ep2wBUjzuBnM68iEqmKcE4Gjh3BeSe+ExlA149vit7/6w32uvoDjjvYIEdX0d2w4
	xfr9DEHNUAZCdT5pswqXHHxi0t/Xsjswo6cMqRInd1YEUuGJLatYjpXpRB8ddUhnxXIoAIKcqOj1c
	uUw4JfqmmCEynPyhUY+52TPWHyABW6Avtko9hMFNUFDGB4y2ov0/u3eLg+oYCKtJ7vymE9z9D4Efy
	ejWZINpAunrO7KisiZmeV3rJQGWpLRn87iJ5bLCllp3Qe3H73RUmzlB9YF84ICzgy2EK228rrkowI
	N2MYeWHA==;
Received: from [167.98.27.226] (helo=[10.35.4.135])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uRquA-004fJ6-3H; Wed, 18 Jun 2025 12:24:34 +0100
Message-ID: <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: luca abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Vineeth Pillai	 <vineeth@bitbyteword.org>
Date: Wed, 18 Jun 2025 12:24:33 +0100
In-Reply-To: <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	 <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
	 <f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
	 <20250507222549.183e0b4a@nowhere>
	 <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	 <20250523214603.043833e3@nowhere>
	 <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
	 <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
	 <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
	 <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
Organization: Codethink
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk

Hi Juri

On Tue, 2025-06-17 at 14:21 +0200, Juri Lelli wrote:
> On 02/06/25 16:59, Marcel Ziswiler wrote:
> > Hi Juri
> >=20
> > On Thu, 2025-05-29 at 11:39 +0200, Juri Lelli wrote:
>=20
> ...
>=20
> > > It should help us to better understand your setup and possibly reprod=
uce
> > > the problem you are seeing.
>=20
> OK, it definitely took a while (apologies), but I think I managed to
> reproduce the issue you are seeing.

No need to apologies, I know how hard it can be trying to bring up random s=
tuff in the Linux world : )

> I added SCHED_FLAG_RECLAIM support to rt-app [1], so it's easier for me
> to play with the taskset and got to the following two situations when
> running your coreX taskset on CPU1 of my system (since the issue is
> already reproducible, I think it's OK to ignore the other tasksets as
> they are running isolated on different CPUs anyway).
>=20
> This is your coreX taskset, in which the last task is the bad behaving on=
e that
> will run without/with RECLAIM in the test.
>=20
> > sched_deadline =3D sched_period | sched_runtime | CP max run time 90% o=
f sched_runtime | utilisation |
> > reclaim |
> > -- | -- | -- | -- | -- |
> > =C2=A05 ms=C2=A0 | 0.15 ms | 0.135 ms |=C2=A0 3.00% | no |
> > 10 ms=C2=A0 | 1.8 ms=C2=A0 | 1.62 ms=C2=A0 | 18.00% | no |
> > 10 ms=C2=A0 | 2.1 ms=C2=A0 | 1.89 ms=C2=A0 | 21.00% | no |
> > 14 ms=C2=A0 | 2.3 ms=C2=A0 | 2.07 ms=C2=A0 | 16.43% | no |
> > 50 ms=C2=A0 | 8.0 ms=C2=A0 | 7.20 ms=C2=A0 | 16:00% | no |
> > 10 ms=C2=A0 | 0.5 ms=C2=A0 | **1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
5.00% | no |
>=20
> Without reclaim everything looks good (apart from the 1st tasks that I
> think suffers a bit from the granularity/precision of rt-app runtime
> loop):
>=20
> https://github.com/jlelli/misc/blob/main/deadline-no-reclaim.png

Yeah, granularity/precision is definitely a concern. We initially even star=
ted off with 1 ms sched_deadline =3D
sched_period for task 1 but neither of our test systems (amd64-based Intel =
NUCs and aarch64-based RADXA
ROCK5Bs) was able to handle that very well. So we opted to increase it to 5=
 ms which is still rather stressful.

> Order is the same as above, last tasks gets constantly throttled and
> makes no harm to the rest.
>=20
> With reclaim (only last misbehaving task) we indeed seem to have a proble=
m:
>=20
> https://github.com/jlelli/misc/blob/main/deadline-reclaim.png
>=20
> Essentially all other tasks are experiencing long wakeup delays that
> cause deadline misses. The bad behaving task seems to be able to almost
> monopolize the CPU. Interesting to notice that, even if I left max
> available bandwidth to 95%, the CPU is busy at 100%.

Yeah, pretty much completely overloaded.

> So, yeah, Luca, I think we have a problem. :-)
>=20
> Will try to find more time soon and keep looking into this.

Thank you very much and just let me know if I can help in any way.

> Thanks,
> Juri
>=20
> 1 - https://github.com/jlelli/rt-app/tree/reclaim

BTW: I will be talking at the OSS NA/ELC next week in Denver should any of =
you folks be around.

Cheers

Marcel
