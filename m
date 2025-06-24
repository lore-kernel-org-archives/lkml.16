Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E5023E347
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755635; cv=pass; b=MpI88n2ks6guc3dm7NEUMQSLVwtcKUskG7gju+hLRlySs0W9cKJg+QJ2XjLtm4VLaj60DirWaGUU52rPGqWwjkXoVD6KJ4GFbnHW0ZlJsAnMCI3UMFIW2gooYUQolL/2neTBvlhc50Ykq+4f8mi6sB9qTQ31dPoIH4+gn6+dgiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755635; c=relaxed/simple;
	bh=4K0NM+vKNt89P8O0St3H8OSt+KEIUfTeyKMNZO6oOsA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=nbrQniqaktk1DcsdQTsD5WdGpbdmj/YZYqBopkpiOTazPmkCELlvt8JsKcG9HZHn5wIHnVfUtZ9ThIx5G7APr1wxw8V+bDn7bx5WoAM0E3PrnpUVi3sardOLEsE5CGIcVg5O/i7fzpUNT6bA1McJBDCD7Jz3LK/rNcJWfDt7UZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=Wh1bdq5q; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="Wh1bdq5q"
ARC-Seal: i=1; a=rsa-sha256; t=1750755616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ePgDGzLyDqsst/OeoyJcw/+LMyZtmdi9TOjBmIRVsZDq9a9Gnar2qIzy5Uyfp7RWgXHAq7DvmqDAviHN3zRTwMbW0AvUYS2+z7hFfWFBdwxp2kRzdFKiU7LCF0EbhvyM2xgseFVjgSnscxBin/OvmfZbsv+X1C8cCe4PMwaj/ck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750755616; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uuD2qsW2ew9Eqmu6etOMFYxuRs2nrQjQpEPGvsAgh10=; 
	b=cA3qmsumdZKrnjkiqb/+ANMYVWhNQfQA2T8lHjxWwMPqnEyu4dRmilKAOdSQN3lwi1zAWMv90PMR+rzWlhER2VPZWyTTth2VvmAKECaNGJtluSNci7E443NDuOP0x5w/ezWx/GNv7YnC2dT/V2UNicixipIiM+9IrWevObcQlhA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750755616;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=uuD2qsW2ew9Eqmu6etOMFYxuRs2nrQjQpEPGvsAgh10=;
	b=Wh1bdq5qoIMg8FtfSSRNsel4aUWwaMuyHYA2dp+JBLiyBWg3jMHc4Ugc3gskYnpx
	6ejLiXU8+3x+cwn78R5+FFh6v0bIEy52rwuHe0LAFipKuuW4qFHxrKkD0MfZ6RCc0UP
	ATFHlXo5PizAdxk18gObzILLuu4uP34fl4A+QkRE=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1750755613424629.1811837027934; Tue, 24 Jun 2025 02:00:13 -0700 (PDT)
Date: Tue, 24 Jun 2025 17:00:13 +0800
From: Li Chen <me@linux.beauty>
To: "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, "x86" <x86@kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <197a12a9ad3.fd934d491886677.9127792630090954752@linux.beauty>
In-Reply-To: <87msa2r018.ffs@tglx>
References: <1965cae22a0.12ab5a70c833868.7155412488566097801@linux.beauty> <87msa2r018.ffs@tglx>
Subject: Re: [PATCH RESEND] x86/smpboot: avoid SMT domain attach/destroy if
 SMT is not enabled
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

Hi Thomas,

 ---- On Fri, 20 Jun 2025 21:54:27 +0800  Thomas Gleixner <tglx@linutronix.=
de> wrote ---=20
 > On Tue, Apr 22 2025 at 16:47, Li Chen wrote:
 > > Currently, the SMT domain is added into sched_domain_topology
 > > by default if CONFIG_SCHED_SMT is enabled.
 > >
 > > If cpu_attach_domain finds that the CPU SMT domain=E2=80=99s cpumask_w=
eight
 > > is just 1, it will destroy_sched_domain it.
 >=20
 > If cpu_attach_domain() ..., it will destroy it.
 >=20
 > > On a large machine, such as one with 512 cores, this results in
 > > 512 redundant domain attach/destroy operations.
 > >
 > > We can avoid these unnecessary operations by simply checking
 >=20
 > s/We can avoid/Avoid/
 >=20
 > > cpu_smt_num_threads and not inserting SMT domain into x86_topology if =
SMT
 >=20
 > the SMT domain=20
 >=20
 > > is not enabled.
 > >
 > > #ifdef CONFIG_SCHED_SMT
 > > -    x86_topology[i++] =3D (struct sched_domain_topology_level){
 > > -        cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
 > > -    };
 > > +    if (cpu_smt_num_threads > 1) {
 > > +        x86_topology[i++] =3D (struct sched_domain_topology_level){
 > > +            cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
 > > +        };
 > > +    }
 >=20
 > Looks about right, though I really detest this coding style. I'm not
 > blaming you, as you just followed the already existing bad taste...
 >=20
 > Thanks,
 >=20
 >         tglx
 >=20

Thanks for your review, I have fixed the wording issues here: https://lore.=
kernel.org/all/20250624085559.69436-1-me@linux.beauty/T/#t

Regards,
Li
