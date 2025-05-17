Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA0423DE
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747493355; cv=none; b=SjPLg9rRwtdTPEPt371B2e5ArqTzZp7BMNfYlYmVpmAM2JW1s9JHyiXz4wdhPAMDpJL3Z52T0zezld3yPm5BqCdfe0Bngu9hgtzgTINoD/1QKmLfhq0aiPpnljuVolOaOEYqpLAaDZxAdC1k/m22hvJ7h0zmXa4QahBod5oGbLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747493355; c=relaxed/simple;
	bh=1AiHWZPsL8qJWLFIcxFA8L7R+mrTxY9Bh3Bwwx3jNNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZOQZPSPRSbSSIH37AfSfkSB2sXItZWxJ43VmXyYCCT9PC9JmpG6s0DO8CknMQex8dsMovn3Av8EL7ysEACSjRmHVnWAmsTMUYsMZJwEQbcNvCzo5Dke0qIFZD4kIpG24DMJyLbqUYdbV9dCIg+E1j9/1pNmCJF4OcPEOBL2gZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GcCaLM/N; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MbE9sZPi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GcCaLM/N";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MbE9sZPi"
Date: Sat, 17 May 2025 16:49:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747493345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1AiHWZPsL8qJWLFIcxFA8L7R+mrTxY9Bh3Bwwx3jNNU=;
	b=GcCaLM/NPief4Ie/drn0t3oOG/bCo24uERxw6Sf09o3Q1Ed0qSGihIeHegRhc2JpltgDJ2
	pu2/StjTsSiepFktWvv5QKyUIyNYlMG7nm8ee0+yA0Mg0tHI81HrmEc1KLsggp6KB9lHYP
	jTYhIv82TTXrEasBhITW1Atazppv3dOeTOz9v46KtsJ4BvugKUSIu99hO4z6WLixKU0lkS
	l8Dyg4PFmPQFvpgMB0jSDOJYCCA4z44otbW5g70ekuIujABT5d9tMeiBim9Ctruk0mZ4So
	r/QKbG55izTnztPotF6ggBBFBpUS2uls3v6GGI58Ap6kjcKImdVUuJhWZs7xbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747493345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1AiHWZPsL8qJWLFIcxFA8L7R+mrTxY9Bh3Bwwx3jNNU=;
	b=MbE9sZPiHEfPqXScGzOWVSK+zEOq93AMlCMItB1z4l5NrtdR9KuzhmARguaFsfZjOJNE8V
	dkqDLe92YxiRcwBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 4/5] tools headers: Synchronize prctl.h ABI header
Message-ID: <20250517144904.3iCywPrZ@linutronix.de>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
 <20250516160339.1022507-5-bigeasy@linutronix.de>
 <95608024-1be3-4502-8e41-aba3258010b1@igalia.com>
 <a015ea5b-ed1f-46a3-b4db-c448f0279fc2@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a015ea5b-ed1f-46a3-b4db-c448f0279fc2@igalia.com>

On 2025-05-16 17:06:48 [-0300], Andr=C3=A9 Almeida wrote:
> > > @@ -254,18 +254,18 @@ int main(int argc, char *argv[])
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D futex_=
hash_slots_set(0, 0);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksft_test_resu=
lt(ret =3D=3D 0, "Global hash request\n");
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D futex_hash_slots_=
set(4, 1);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D futex_hash_slots_=
set(4, FH_FLAG_IMMUTABLE);
> >=20
> > This breaks the compilation for me.
> >=20
> > So `#include <linux/prctl.h>` is not working for me, it's not using the
> > local copy at tools/include/uapi/linux/prctl.h
>=20
> Oh, nevermind, I found the issue:

Yeah, I am not sure what I did. I made here a copy, the copied header is
only used for perf. Anyway, I added the define as I did for the other
members and did the rename.

Sebastian
