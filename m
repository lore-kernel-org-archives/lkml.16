Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50331F3B9E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749855245; cv=none; b=hSRV0eZwjGP9Na8k6FTdGPEx8epxB/rckwqsYDBdqlDhyoMeG3V+FHhiX1rUxnDUFDET+bC4dkj0LiLq30tPVBsO3sSXrVqSw1O3oTeaU63Dg4H/joaW4oWinVXCQhL8ZbJ9HtUdxJMGB1eYqMs0vjUfYf9XOwGlh2kW02qUYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749855245; c=relaxed/simple;
	bh=qTj1ltlCf/y7nFmuC/42HSkUba3LnmgVgtHJ+9u7aGo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0BoMdRw0V+JqGHsuMn6RR7+6Wp+I8wj0zDF54MUmFnffVqlfXVe3nK1in7JmrGFlKEcwSPx9ygi0RS3AKDNBanApjschzl09CxbvWZRNjTIMgwxIlG/6zFUEi8kt4cq6QgwbnSTB8Si+dzk+phIFlg03QFQX3DgTv3qgDax4Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=EXY3Tppn; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="EXY3Tppn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1749855234; x=1750114434;
	bh=qTj1ltlCf/y7nFmuC/42HSkUba3LnmgVgtHJ+9u7aGo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=EXY3TppnHpA2b12h+c3PQ6kalSFZ8DV7gPD+5WvCs5Avh0qvPQY/GAlQ3ZAOQDYBw
	 kppPncRmcElWx2hvUqiFn0E7Ov2yLpkbY/kUXW3ocLKa3mQUjt1ojP+f0f8R1i1fku
	 3mtsi5qH5G45cMHK64aMt1+Ni7JSfKoqYosRHUieNljb6t2BY52ss0jcS2Hymz7aeZ
	 N0c6qhXWPht8qkJd7zxWqC/eaojvuRPePsX6B6O298xoqkqRz7q7JjTzDtt6QFD/Jj
	 lGHL+jX7cayAFqfmTAd8+6LyVSr9RipTc7OQLbrBRJh7xZaa3HMuUBtza9XigH65j8
	 +vGoB+cYcYiYw==
Date: Fri, 13 Jun 2025 22:53:48 +0000
To: Vincent Guittot <vincent.guittot@linaro.org>
From: dhaval@gianis.ca
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] sched/fair: Limit run to parity to the min slice of enqueued entities
Message-ID: <aDL3YCahMtyzYFS7MCqCyLoUruq24dC-oYxqdVFYuTN6yOd-qDT-x84Qab63lblcfdAjzof0PY68xNw3s19PXrh9plszZxiavmEjnyBuPGg=@gianis.ca>
In-Reply-To: <20250613140514.2781138-4-vincent.guittot@linaro.org>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org> <20250613140514.2781138-4-vincent.guittot@linaro.org>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: d63062cfaf8f62a39d0b36c700ff5796fa139960
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Friday, June 13th, 2025 at 7:16 AM, Vincent Guittot <vincent.guittot@lin=
aro.org> wrote:

>=20
>=20
> Run to parity ensures that current will get a chance to run its full
> slice in one go but this can create large latency for entity with shorter
> slice that has alreasy exausted its slice and wait to run the next one.

"already exhausted"

>=20
> Clamp the run to parity duration to the shortest slice of all enqueued
> entities.
>=20
> Signed-off-by: Vincent Guittot vincent.guittot@linaro.org
>=20
> ---
> kernel/sched/fair.c | 19 ++++++++++++++-----
> 1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 479b38dc307a..d8345219dfd4 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -917,23 +917,32 @@ struct sched_entity *__pick_first_entity(struct cfs=
_rq cfs_rq)
> }
>=20
> /
> - * HACK, stash a copy of deadline at the point of pick in vlag,
> - * which isn't used until dequeue.
> + * HACK, Set the vruntime, up to which the entity can run before picking
> + * another one, in vlag, which isn't used until dequeue.
> + * In case of run to parity, we use the shortest slice of the enqueued
> + * entities.
> */

I am going to admit - I don't have a good intuitive sense on how this will =
affect the functionality. Maybe you can help me think of a test case to exp=
licitly write out this assumption in behavior?

Dhaval

> static inline void set_protect_slice(struct sched_entity *se)
> {
> - se->vlag =3D se->deadline;
>=20
> + u64 min_slice;
> +
> + min_slice =3D cfs_rq_min_slice(cfs_rq_of(se));
> +
> + if (min_slice !=3D se->slice)
>=20
> + se->vlag =3D min(se->deadline, se->vruntime + calc_delta_fair(min_slice=
, se));
>=20
> + else
> + se->vlag =3D se->deadline;
>=20
> }
>=20
> static inline bool protect_slice(struct sched_entity *se)
> {
> - return se->vlag =3D=3D se->deadline;
>=20
> + return ((s64)(se->vlag - se->vruntime) > 0);
>=20
> }
>=20
> static inline void cancel_protect_slice(struct sched_entity *se)
> {
> if (protect_slice(se))
> - se->vlag =3D se->deadline + 1;
>=20
> + se->vlag =3D se->vruntime;
>=20
> }
>=20
> /*
> --
> 2.43.0


