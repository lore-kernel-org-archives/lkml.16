Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE22D5419
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810064; cv=none; b=ca5tJGx3pXQLJINEpwOGk/ARc6RtUY+/MT8zzpLVPnShgqQxOOu8QixB7rzFoxZn1dMDe6tDmAojSjS5VZi3wwIf/skKuPBU32uxLS6clVXLW+CICWX4TQQ/h7jmOAAndSbdbSeoHJqie3pdnM2mrGbZtVKv/7LROvBmXUTgT5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810064; c=relaxed/simple;
	bh=3DshbZQ6H1gyKpLq1Hj5233kw6POE3tSn0w5kgOIK1Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=os/RFOaPGDnLSajMj7IQ7XDeb2/au93DBimgRiX7TYZowbcoGfuaCmfwFv9iQlhWw/S1Voob3q48xcN97aVdujeYRryu4/kGr4RTrqSOdm3yP8jt+ADa4XXp8Hu1A9+mpAoxXoW/1IIYTnpQgzj/LLuMconw5TIjiyWn/5qBgvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.b=FYU8IcCJ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.b="FYU8IcCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749810059; x=1750414859; i=efault@gmx.de;
	bh=aMzHmRsGC65UDtPINQXSlVAeL42niPaWLmzMIRmICZ8=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FYU8IcCJHNleAOffLFZ5w5f1W6qdHMzkWiU3vt22+URuLdcthd9WshafCguvDv0x
	 Ex/6VIqqjCbAnuE2PbBrHyTf/Oj2Gqa0Q0wSRXxt5El8ymm5fsb6NGo3M25wPNWrR
	 m5zAd7UEINaZoU9k4DQFm8W6ENjsaCjdaZtpdTvgFxvkidTy+82rCek4obGyU1WHY
	 LBypy7YBRg/d4LJdYRvgApe0GNb6jeQzimU7vpyBfJsFv83DFNkqb6f7pTQgHLqwJ
	 2YObEHoZeR2YAdeJ6tGwaeZK0V0JgVEcn62Kcn1iAWeUTI92vtO15W6x8QuPe8Scg
	 FYEw6CDPaUCNYWbofA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([185.146.50.50]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWics-1uJIOJ2SwC-00Vdtu; Fri, 13
 Jun 2025 12:20:59 +0200
Message-ID: <b638eb73e6da733afd6eb758cc144bf119e1b600.camel@gmx.de>
Subject: Re: [RFC][PATCH 2/5] sched: Optimize ttwu() / select_task_rq()
From: Mike Galbraith <efault@gmx.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de,  vschneid@redhat.com, clm@meta.com,
 linux-kernel@vger.kernel.org
Date: Fri, 13 Jun 2025 12:20:56 +0200
In-Reply-To: <20250613094052.GF2278213@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
	 <20250520101727.620602459@infradead.org>
	 <334e48ebbf34d853777672449cb29d5f06c751b7.camel@gmx.de>
	 <20250613094052.GF2278213@noisy.programming.kicks-ass.net>
Autocrypt: addr=efault@gmx.de;
 keydata=mQGiBE/h0fkRBACJWa+2g5r12ej5DQZEpm0cgmzjpwc9mo6Jz7PFSkDQGeNG8wGwFzFPKQrLk1JRdqNSq37FgtFDDYlYOzVyO/6rKp0Iar2Oel4tbzlUewaYWUWTTAtJoTC0vf4p9Aybyo9wjor+XNvPehtdiPvCWdONKZuGJHKFpemjXXj7lb9ifwCg7PLKdz/VMBFlvbIEDsweR0olMykD/0uSutpvD3tcTItitX230Z849Wue3cA1wsOFD3N6uTg3GmDZDz7IZF+jJ0kKt9xL8AedZGMHPmYNWD3Hwh2gxLjendZlcakFfCizgjLZF3O7k/xIj7Hr7YqBSUj5Whkbrn06CqXSRE0oCsA/rBitUHGAPguJfgETbtDNqx8RYJA2A/9PnmyAoqH33hMYO+k8pafEgXUXwxWbhx2hlWEgwFovcBPLtukH6mMVKXS4iik9obfPEKLwW1mmz0eoHzbNE3tS1AaagHDhOqnSMGDOjogsUACZjCJEe1ET4JHZWFM7iszyolEhuHbnz2ajwLL9Ge8uJrLATreszJd57u+NhAyEW7QeTWlrZSBHYWxicmFpdGggPGVmYXVsdEBnbXguZGU+iGIEExECACIFAk/h0fkCGyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEMYmACnGfbb41A4AnjscsLm5ep+DSi7Bv8BmmoBGTCRnAJ9oXX0KtnBDttPkgUbaiDX56Z1+crkBDQRP4dH5EAQAtYCgoXJvq8VqoleWvqcNScHLrN4LkFxfGkDdqTyQe/79rDWr8su+8TH1ATZ/k+lC6W+vg7ygrdyOK7egA5u+T/GBA1VN+KqcqGqAEZqCLvjorKVQ6mgb5FfXouSGvtsblbRMireEEhJqIQPndq3DvZbKXHVkKrUBcco4MMGDVucABAsEAKXKCwGVEVuYcM/KdT2htDpziRH4JfUn3Ts2EC6F7rXIQ4NaIA6gAvL6HdD3q
	y6yrWaxyqUg8CnZF/J5HR+IvRK+vu85xxwSLQsrVONH0Ita1jg2nhUW7yLZer8xrhxIuYCqrMgreo5BAA3+irHy37rmqiAFZcnDnCNDtJ4sz48tiEkEGBECAAkFAk/h0fkCGwwACgkQxiYAKcZ9tvgIMQCeIcgjSxwbGiGn2q/cv8IvHf1r/DIAnivw+bGITqTU7rhgfwe07dhBoIdz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:D7nHal4Ntrr316AmP5iSLywM5kUQNWWoOiT7CRozYxQ941T8DYj
 Yj7fwAsY/DEYodJjhjmdniY4eLyLgF+2N/QpwbTinGe8FnfxnbLH2u5VRz4QV0eHEt++1dY
 IZ6fQORdUrsVAnPWn2YSZ5fvFQnqL4RkoTlJJnyeEJ9967tSHE2N0gvktj7ZW3apnn9gTId
 fLYVBBaSV4hIZBNTfviBg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1TYA3J/5OFQ=;BdfK6sC/jzVriGijEIYlirW3/ea
 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

On Fri, 2025-06-13 at 11:40 +0200, Peter Zijlstra wrote:
> On Mon, Jun 09, 2025 at 07:01:47AM +0200, Mike Galbraith wrote:
>=20
> Right; so the problem being that we can race with
> migrate_disable_switch().

Yeah.  Most of the time when we do fallback saves us, but we can and do
zip past it, and that turns box various shades of sad.

>=20
> Does something like this help?

It surely will, but I'll testdrive it.  No news is good news.

> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3593,7 +3593,7 @@ int select_task_rq(struct task_struct *p
> =C2=A0		cpu =3D p->sched_class->select_task_rq(p, cpu,
> *wake_flags);
> =C2=A0		*wake_flags |=3D WF_RQ_SELECTED;
> =C2=A0	} else {
> -		cpu =3D cpumask_any(p->cpus_ptr);
> +		cpu =3D task_cpu(p);
> =C2=A0	}
> =C2=A0
> =C2=A0	/*

