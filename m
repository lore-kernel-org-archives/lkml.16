Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D922D1BC07A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773785; cv=pass; b=mXpv7SGPd7+CRsCJ9/NzTL3kc6pNw+5JsUQIZOwOUYj4QNfmfOfKKcUn6OZWH1cPfoxOqX3w2mGVAuV5mMa25yWaNzxZ0Y3mpNf5Ndt/yQTRr6pTJ+vp+xcGzdOHr2QSF1F87Vana0+qoJG+r6LTVxSXVtGLt0Ff4nPW2TW9+ig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773785; c=relaxed/simple;
	bh=t69YTjZk7tAK9ZA0DgcSUtUe67tniRoABYvdwA60U40=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=l49bzBFiBQQyFF2bKp6lFEsokQ9NC8Yns/yrGeuBDmKieKHaC869IOTU39ndVSYK5ssz1gDJVqKJM2T2lLCI3Qcay0DZKCTZnS0q0XhSh86A0/erIbnH1ppZYCnb4+3DWmdHmqgTu0l6KDw4jyzpnm0uETkSDS8RvIGPLN21B/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=B8uF7g3+; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="B8uF7g3+"
ARC-Seal: i=1; a=rsa-sha256; t=1750773731; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hTX5MReisYbZvR19q4tWS0xnt3oKhKEGdUG2U9bUjLZUfS/wtlWWjGe7pHBxy6r/khJ05F142qABMsFAAzp/jEIQRVJMOTlt/9XX+QPv2q73IwdOrgT1+zRshdi7GNrxYnsftBBZU/Z3O+P6j4oh6+o8tu8XrhY8yX5j2xrmS1I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750773731; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZL8NA9JQOJu6c3IEyUcRza2BGeeEksbdoW9f7dUeKPk=; 
	b=cBzAl7CvVzTHxwj+eQl7WL4drYgg4esDcR+zSJ4Uk5cA0pc81/cSlxwfKR3ZtXBD4mQtuIjbAOwgvbFwYFi5u3qaCEJKPCyCS7E+CeXtsFQscAiLKXri/0xW1QZC0qefFTSFIAZre1IScpTL/eqe26T2rDOmMrahdOaARGzrc/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750773731;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZL8NA9JQOJu6c3IEyUcRza2BGeeEksbdoW9f7dUeKPk=;
	b=B8uF7g3+1EZ2cR31mzscQN/sJSLpPip83it4n2wpApifPdMn/0imV1OuZ9zK6rNT
	44PT4hvIKGcQ75OzM+G4JB9ZAsycwBkPyAPC7xvd2JSvQS6WtWOGq4s6mRgbibtwzII
	pxwiYfMu5SINKR0R23BSsVAlX46OWOkwUGkk8wXc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1750773728425534.8013543798188; Tue, 24 Jun 2025 07:02:08 -0700 (PDT)
Date: Tue, 24 Jun 2025 22:02:08 +0800
From: Li Chen <me@linux.beauty>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, "x86" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"K Prateek Nayak" <kprateek.nayak@amd.com>,
	"Sohil Mehta" <sohil.mehta@intel.com>,
	"Brian Gerst" <brgerst@gmail.com>,
	"Patryk Wlazlyn" <patryk.wlazlyn@linux.intel.com>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	"Li Chen" <chenl311@chinatelecom.cn>
Message-ID: <197a23f047d.1095ea2d92028509.1160531071010499395@linux.beauty>
In-Reply-To: <875xglntx1.ffs@tglx>
References: <20250624080810.66821-1-me@linux.beauty>
 <20250624080810.66821-3-me@linux.beauty> <875xglntx1.ffs@tglx>
Subject: Re: [PATCH 2/2] x86/smpboot: avoid SMT domain attach/destroy if SMT
 is not enabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Thomas.=20

 ---- On Tue, 24 Jun 2025 21:36:10 +0800  Thomas Gleixner <tglx@linutronix.=
de> wrote ---=20
 > On Tue, Jun 24 2025 at 16:08, Li Chen wrote:
 > > From: Li Chen <chenl311@chinatelecom.cn>
 > >
 > > Currently, the SMT domain is added into sched_domain_topology
 > > by default if CONFIG_SCHED_SMT is enabled.
 > >
 > > If cpu_attach_domain finds that the CPU SMT domain=E2=80=99s cpumask_w=
eight
 >=20
 > If cpu_attach_domain()
 >=20
 > IIRC, I told you that before.
 >=20
 > > is just 1, it will destroy_sched_domain it.
 > >
 > > On a large machine, such as one with 512 cores, this results in
 > > 512 redundant domain attach/destroy operations.
 > >
 > > We can avoid these unnecessary operations by simply checking
 >=20
 > s/We can avoid/Avoid/
 >=20
 > Care to read my reviews? If you disagree, then discuss it with me, but

I'm sorry that I forget to say that your previous wording review have alrea=
dy been fixed in v2 https://lore.kernel.org/all/20250624085559.69436-3-me@l=
inux.beauty/

And I would replace cpu_attach_domain with cpu_attach_domain().

Sorry for wasting your time.=20

 > silently ignoring it them is not an option.
 >=20
 > > cpu_smt_num_threads and not inserting SMT domain into x86_topology if =
SMT
 >=20
 > not inserting? That's not what this new version does.
 >=20
 > > +static void __init maybe_remove_smt_level(void)
 > > +{
 > > +    if (cpu_smt_num_threads <=3D 1) {
 > > +        /*
 > > +         * SMT level is x86_topology[0].  Shift the array left by one=
,
 > > +         * keep the sentinel { NULL } at the end.
 > > +         */
 > > +        memmove(&x86_topology[0], &x86_topology[1],
 > > +            sizeof(x86_topology) - sizeof(x86_topology[0]));
 > > +        memset(&x86_topology[ARRAY_SIZE(x86_topology) - 1], 0,
 > > +               sizeof(x86_topology[0]));
 >=20
 > So this sets the last entry in the array, aka the original sentinel in
 > the last array entry, to zero...
 >=20
 > This is completely pointless. The above memmove() copies
 >=20
 >     topo[1 .. (N - 1)]=20
 > to
 >     topo[0 .. (N - 2)]
 >=20
 > Where N =3D ARRAY_SIZE(topo).
 >=20
 > Therefore
 >         topo[N - 1] =3D=3D NULL
 > and
 >         topo[N - 2] =3D=3D NULL
 >=20
 > No?
 >=20
 > But then what's worse is that you fail to take that removal into account
 > for the x86_has_numa_in_package case, which still unconditionally sets
 > topo[N - 2] to zero even if the SMT level had been removed...
 >=20
 > Please take your time and do not rush out half baked stuff.
=20
Sorry again for my mistake. I will fix it in v3.

Regards,
Li
