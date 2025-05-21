Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756C25C81A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823143; cv=none; b=FSmAOOw2V2DFtqR9svYf+zxGdI8B6vEDUa9qLSWK2tR/vNoJYN6ABolYXz6xZNzjYHt0ncSoKCi9MM45BVwuECZpwNaVEqG3OwI34535PFSnAlUrdL+Ec2+IpZpFuL7G32vAk7nNrQQT+NYHl2j9HHbp7abk1A6gXwrdAiL8jVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823143; c=relaxed/simple;
	bh=FYnukv3VeEDqI4pq2QZXunHbphA5wqnAYQJEHlf4QJw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fpUAqdSdE7dEL813AxlJkPTCe2dVdqB82fGP8vhFXngK1Tp6oGmoO7Gi8VIVKLLJMdovstarlw/imnPmZNyVII4k/2GwztRpWDbUL7g87cOoAzEwIli8aVRQ9r+e1B9AQ5OpNFXITG5BuUq21YadD935IxAU5+Nth/Yh+rzc55Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=VJnkaVeU; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="VJnkaVeU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y5gb8snpxnE3UW1FV5U1uFEXhfqKCYqeWB6yjHgL6DA=; b=VJnkaVeUN8qfX39/T1FcdYITKg
	qvFQHzo6iG6NwilviORMxGGGA9cB4JCAVPZWVIIlfQhx8pYQPGV7/aAP/8C45STBkwEseiEv27f80
	O+j3ienvorl4/WXLmnSJZF7/SfPTTy+QkkHSKqGVs74T5cjF2hgbR8P5OUnlTRhRLh/Hsmk2POSqe
	R32+yBa+f9WldH1YnIdmKLynl3dZ/x2NZeIzzx2iHC7pCrsPtDQrWyHyN6jKpV5jTqo0JSSE48Lfm
	u3d5TZnjQyqzjoPuJF7NbiZryg8oWvKlysmM0u/CzBfYvL7Z31lgNfiqTYcBR65iSWD6PqeLABTsZ
	hFKDDpvQ==;
Received: from [178.38.100.64] (helo=[10.10.1.154])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uHgEK-001Ng4-9D; Wed, 21 May 2025 10:59:20 +0100
Message-ID: <8936377a2d70c2cfb93072ff10e8e42e52bd8655.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, Ingo
 Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Vineeth
 Pillai	 <vineeth@bitbyteword.org>
Date: Wed, 21 May 2025 11:59:18 +0200
In-Reply-To: <20250520180915.16ba1c5c@nowhere>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
		<aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
		<f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
		<20250507222549.183e0b4a@nowhere>
		<92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
	 <20250520180915.16ba1c5c@nowhere>
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

Hi Luca

On Tue, 2025-05-20 at 18:09 +0200, luca abeni wrote:
> Hi Marcel,
>=20
> On Mon, 19 May 2025 15:32:27 +0200
> Marcel Ziswiler <marcel.ziswiler@codethink.co.uk> wrote:
>=20
> > Hi Luca
> >=20
> > Thanks and sorry, for my late reply. I was traveling the Cretan
> > wilderness without access to any work related infrastructure.
> >=20
> > On Wed, 2025-05-07 at 22:25 +0200, luca abeni wrote:
> > > Hi Marcel,
> > >=20
> > > just a quick question to better understand your setup (and check
> > > where the issue comes from):
> > > in the email below, you say that tasks are statically assigned to
> > > cores; how did you do this? Did you use isolated cpusets,=C2=A0=20
> >=20
> > Yes, we use the cpuset controller from the cgroup-v2 APIs in the
> > linux kernel in order to partition CPUs and memory nodes. In detail,
> > we use the AllowedCPUs and AllowedMemoryNodes in systemd's slice
> > configurations.
>=20
> OK, I never tried the v2 API, but if it allows creating a new root
> domain (which is an isolated cpuset, I think), then it should work
> without issues.

Yes and it works fine with everything else :)

> So, since you are seeing unexpected deadline misses, there is a bug
> somewhere... I am going to check.

Thanks you very much and let me know if you need any further information fi=
guring out what might be going on.

> In the meantime, enjoy the Cretan wilderness :)

Thanks, I already made it back and, yes, I enjoyed it very much :)

> 				Luca

Cheers

Marcel
