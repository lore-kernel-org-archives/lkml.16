Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADAB2BD012
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867989; cv=none; b=pBiPEB4Ewi+C9pUTnwe0qGNNs5E1yHD65qTw2q+qn7S+RIzQWqAi1Dn5nB0CQ3Pf9lxpJjnX6d4w4MKU0PdGmu1nhBR8ZDiQ09wNR9tSwNu2dYL/Wrg9yIYJ95DVuyp95Ex+K44mbKxhNZlOrvZhWT91hExoUs0RgQe1etRdeQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867989; c=relaxed/simple;
	bh=LCmVYzcicQcfc9PycYENKWsQI+SrO5VS0yMxVxxlBA8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHtGyl01OEhWUh7W3+EAqvfVA7YWyEZhUpdCJMTIhuRsWSLf5JicPBeRcOOFAlDC9zT/v/4Qht5kzgyECw2jnTmYPJP1yD6QkDaIZ6uLhizH1ekqeU17koocLOzQ7FK2CD6eb73IJS69jxW4dmfnB44FJ3Df8gEb87UQbqDjKcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=jzstCVC1; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="jzstCVC1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LCmVYzcicQcfc9PycYENKWsQI+SrO5VS0yMxVxxlBA8=; b=jzstCVC11lb3etE8xLUHsGb9lJ
	PhWxbniocHYopv5SoUvCd3RNb6fyMb+PVyaELQAJ6p4kZwlJy1DTtHk69Q5AlRfSprKrDe6da8vtD
	19pH0ms0keRjdzFziaKlEntmST3a1xjZb/UZgYTUQ7tWnO4lI0WtYszzC/fXf03e9HPPlxzhXUVdw
	L2W3nmuJEh3zEisjoY3/r7l6WTL4SaAyHKYWkJqi1JOwxzX50RK/5x9fW+a1i46WceCzVUbMkxWs4
	fwMayra45oZoHI9wxZAsHVZKpJjnFWV5GebXN6K7Rk+/UX3/mAjBITfvhteQzzDyhxokH6A72HKIG
	Aal1x3Zg==;
Received: from [208.115.91.132] (helo=[10.39.247.83])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uUSU6-003hZc-RB; Wed, 25 Jun 2025 16:56:28 +0100
Message-ID: <e8f17a35f4bc2701fc3f6a34341a507fb89573fe.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: Juri Lelli <juri.lelli@redhat.com>, luca abeni
 <luca.abeni@santannapisa.it>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Date: Wed, 25 Jun 2025 09:55:49 -0600
In-Reply-To: <aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
References: <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
	 <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
	 <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
	 <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
	 <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
	 <20250620113745.6833bccb@luca64> <20250620161606.2ff81fb1@nowhere>
	 <aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
	 <20250620185248.634101cc@nowhere>
	 <aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
	 <aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
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

On Tue, 2025-06-24 at 14:59 +0200, Juri Lelli wrote:
> Hello again,
>=20
> On 24/06/25 09:49, Juri Lelli wrote:
>=20
> ...
>=20
> > The following seem to at least cure the problem after boot. Things are
> > still broken after cpusets creation. Moving to look into that, but
> > wanted to share where I am so that we don't duplicate work.
>=20
> I ended up with two additional patches that seem to make things a little
> better at my end. You can find them at
>=20
> https://github.com/jlelli/linux/tree/upstream/fix-grub
>=20
> Marcel, Luca, can you please give them a quick try to check if they do
> any good?

I gave this a try yesterday and run a first longer test in our CI. While th=
at now only run for 16 hours doing
30+ mio. tests on NUCs and 75+ mio. on ROCK 5B it really looks promising so=
 far.

I will now update to your latest patches and re-run those tests. Usually we=
 need 40+ hours of testing to really
be confident in our statistics around those tests.

> Thanks!

Thank you!

> Juri

Cheers from the OSS NA/ELC in Denver

Marcel
