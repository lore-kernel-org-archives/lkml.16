Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0369215191
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936890; cv=none; b=hLIEAdD5bJJoqhpG+LlcQJoJ6K5AR+h8rf1zxFunwYkYlW5QPzY6kCNfeBIBAn3SznDFskNoFAW5Oc/s0xBfHbUlFDMIoNo7fC1FXikH3nuqw5jAh7Nn25PBdSvB7aYE6LIH+DyXf1l9dT1agqkUXqxLlYB4tRJiEpC50Np6bIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936890; c=relaxed/simple;
	bh=T0hg/2f3YladCEeXyEtbG/jrwuhpaYdML079caAhTXQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q3O32Q/8NdnutsJ8GT52Y63fCNCeIiuBwNIecdoBuONi9CB2YVR1subWfeYLQRonOiEighJkeul5CqshQx9tFJbGmQac5tfBmDqd9xoGNmt+emoWX90lO7A8HyidIxWG1tUu7KTvoBu406iA/bDJBnyQUXr18Cn7JDzGQz+mKSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=wFTtvdfm; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="wFTtvdfm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JkV6nWj9/Rf6olHfEfof9XppjVlrgOl4uhsIJ7HRk00=; b=wFTtvdfmU/VzRSQhn4RXTnGi2a
	B3FZ4yKLrMe5rCSnaT2Ip5EH+wrgCBmQJFWLk1Bf6QaJ+nzP+jsBrxvQaW3gbUHEm274lgZGhoXE+
	i9zBk4PrPYhbidtnyl14NryJdbBvYzfeosNrnxekFmsdjyDk4m0BnQmuSBStYZTYSdLXHf7bC0blc
	2r8kqm4URqXgP8oyUuKQcIN5TemFdMZQA2UoB4ekDe9rvGbD9rnSKb4CUMhBokXbKVtgUN3D+FWn9
	3agN5gCqcn9nz6DTgLDUQCzaN22nLqCQxW0VonWg9qhXZpuHMrygRMpOKy50udw4lhXaiilkhUoM8
	1FHc27yw==;
Received: from [50.200.95.59] (helo=[10.11.1.91])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uUkKW-005QnH-EO; Thu, 26 Jun 2025 11:59:44 +0100
Message-ID: <d70bdffe973d1d4b951af3f12d3a5a1e77c879c6.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: luca abeni <luca.abeni@santannapisa.it>, Juri Lelli
 <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>
Date: Thu, 26 Jun 2025 04:59:42 -0600
In-Reply-To: <20250625145001.7709b647@nowhere>
References: <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
		<aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
		<20250620113745.6833bccb@luca64>	<20250620161606.2ff81fb1@nowhere>
		<aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
		<20250620185248.634101cc@nowhere>
		<aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
		<aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
		<20250624170030.4e5b440a@nowhere>
		<aFvBvxhw6ubpBefm@jlelli-thinkpadt14gen4.remote.csb>
		<aFvLYv0xSXxoyZZ8@jlelli-thinkpadt14gen4.remote.csb>
	 <20250625145001.7709b647@nowhere>
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

Hi Luca and Juri

On Wed, 2025-06-25 at 14:50 +0200, luca abeni wrote:
> Hi Juri,
>=20
> On Wed, 25 Jun 2025 12:11:46 +0200
> Juri Lelli <juri.lelli@redhat.com> wrote:
> [...]
> > I pushed another fixup adding a check for dl_server_active in
> > dl_server_stop(). It seems to cure the WARN here.
> >=20
> > Could you please pull and re-test?
>=20
> I added your last 2 commits, and tested again; it seems to me that
> everything looks fine, now... Marcel, can you confirm?

Indeed, our CI run now close to 220 mio. tests on NUCs and 190 mio. on ROCK=
 5B and so far it didn't miss any
single beat! Also the statistics around those tests look very good. With re=
claim enabled one can now truly get
very good real-time performance. Thank you very much!

We will continue to exercise the Linux kernel scheduler to the fullest and =
report any inconsistencies we are
seeing.

Just let me know if there is anything else we may help you with. Thanks aga=
in!

> 			Luca

Cheers

Marcel
