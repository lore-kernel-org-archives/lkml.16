Received: from mail-10624.protonmail.ch (mail-10624.protonmail.ch [79.135.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BDC1F3B9E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 22:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749855322; cv=none; b=rvHYYDTCq0dKZVQCb57QqwE+cLLcEGc6oQ0Jm+bC5KVmiDya+oE0yG6NftJLkRyxgmBSMJXMmm5TofdUw/XDhIhuBWNauOD1Z39LWuSpL0rmfcs+hL2XbSK6SIi/lw0Ga2czu9uHlYU/hQL12Bg0QK1QHGJ1i72kzsZJMi7loyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749855322; c=relaxed/simple;
	bh=Yx1App3feMsTQum+u3OMY7+IiP5knCuQfsVKPFlpV90=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEDrGVKi8eKsedV1MI6ug7TDEdyXnBzwHyv+I6fFwPMhKi2If9vB3jDXEz5RjzSz/eRWBF57jznTXVLaax+A5Yt2FvpAg9dSFTPPAu+7zcelPXa6BUQ2J7RhsEht1xVvUyVp1Uce/ecqKK+hFBw6QUGscs0VFxe9jqANeQYyYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca; spf=pass smtp.mailfrom=gianis.ca; dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b=eNv3DSPz; arc=none smtp.client-ip=79.135.106.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gianis.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gianis.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gianis.ca header.i=@gianis.ca header.b="eNv3DSPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gianis.ca;
	s=protonmail; t=1749855318; x=1750114518;
	bh=Yx1App3feMsTQum+u3OMY7+IiP5knCuQfsVKPFlpV90=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=eNv3DSPz3MP3yEpPVco7Hj5+fsN9DMZZg6U/4Ek1GZBgcqqghAmJcOsYmkCnmbWzv
	 hFf21Ey3+od6Erfpx0EN4DGiWe8eJkfj4rDzRYv5ZLjOXpF2jspQIPCdAKhCwj98yo
	 iIpxbr8mHNo/vJ1cvNkWgzkMc/3ETEE66hI0hM9EbvuHbhz2GOeZHUihuvyJnJPI/3
	 UEmQZUq6pqnNR8IPChzgxYVz9NhEsOOQx6Vhx7680lys0BcFzjOuShgVlA62CsxVch
	 BoSShdEHrB3swvMZQUF/ke7Ee0B4XBw9zEgGksr9pFNyj9w9jT+1KjI/9Ktifeh8d8
	 tofKyC8Topl/w==
Date: Fri, 13 Jun 2025 22:55:11 +0000
To: Vincent Guittot <vincent.guittot@linaro.org>
From: dhaval@gianis.ca
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] sched/fair: Improve NO_RUN_TO_PARITY
Message-ID: <3xnsz5DduwrP5NZ4fLZuWCqqljSUXjsZ4rP9oiX-ojKy8iQiLE6ukWqn0V6f_iC_jNsKNzdwSSCqkthvPLjB9_uLumSLU8AbeH0BbpptxzY=@gianis.ca>
In-Reply-To: <20250613140514.2781138-5-vincent.guittot@linaro.org>
References: <20250613140514.2781138-1-vincent.guittot@linaro.org> <20250613140514.2781138-5-vincent.guittot@linaro.org>
Feedback-ID: 128275035:user:proton
X-Pm-Message-ID: 5aed3dc8399385749f8355118232c4b8ff2a251d
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable






On Friday, June 13th, 2025 at 7:15 AM, Vincent Guittot <vincent.guittot@lin=
aro.org> wrote:

>=20
>=20
> The slice protection of RUN_TO_PARITY should also be applied with a
> minimal quantum of time for NO_RUN_TO_PARITY in order to ensure a minimum
> runtime for each task with same slice duration but also to ensure
> periodic switch between threads.
>=20
> Signed-off-by: Vincent Guittot vincent.guittot@linaro.org
>=20
> ---
> kernel/sched/fair.c | 22 ++++++++++++----------
> 1 file changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d8345219dfd4..73bde511c53b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -921,15 +921,20 @@ struct sched_entity *__pick_first_entity(struct cfs=
_rq *cfs_rq)
> * one in vlag, which isn't used until dequeue.
> * In case of run to parity, we use the shortest slice of the enqueued
> * entities.
> + * When run to parity is disable we give a minimum quantum to the

"disabled"

> + * running entity to ensure progress.
> */
> static inline void set_protect_slice(struct sched_entity *se)
> {
> - u64 min_slice;
> + u64 quantum;
>=20
> - min_slice =3D cfs_rq_min_slice(cfs_rq_of(se));
> + if (sched_feat(RUN_TO_PARITY))
> + quantum =3D cfs_rq_min_slice(cfs_rq_of(se));
> + else
> + quantum =3D min(se->slice, normalized_sysctl_sched_base_slice);
>=20
>=20
> - if (min_slice !=3D se->slice)
>=20
> - se->vlag =3D min(se->deadline, se->vruntime + calc_delta_fair(min_slice=
, se));
>=20
> + if (quantum !=3D se->slice)
>=20
> + se->vlag =3D min(se->deadline, se->vruntime + calc_delta_fair(quantum, =
se));
>=20
> else
> se->vlag =3D se->deadline;
>=20
> }
> @@ -981,7 +986,7 @@ static struct sched_entity *pick_eevdf(struct cfs_rq =
*cfs_rq)
> if (curr && (!curr->on_rq || !entity_eligible(cfs_rq, curr)))
>=20
> curr =3D NULL;
>=20
> - if (sched_feat(RUN_TO_PARITY) && curr && protect_slice(curr))
> + if (curr && protect_slice(curr))
> return curr;
>=20
> /* Pick the leftmost entity if it's eligible */
> @@ -1215,11 +1220,8 @@ static inline void update_curr_task(struct task_st=
ruct *p, s64 delta_exec)
> cgroup_account_cputime(p, delta_exec);
> }
>=20
> -static inline bool did_preempt_short(struct cfs_rq *cfs_rq, struct sched=
_entity *curr)
> +static inline bool resched_next_quantum(struct cfs_rq *cfs_rq, struct sc=
hed_entity *curr)
> {
> - if (!sched_feat(PREEMPT_SHORT))
> - return false;
> -
> if (protect_slice(curr))
> return false;
>=20
> @@ -1307,7 +1309,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
> if (cfs_rq->nr_queued =3D=3D 1)
>=20
> return;
>=20
> - if (resched || did_preempt_short(cfs_rq, curr)) {
> + if (resched || resched_next_quantum(cfs_rq, curr)) {
> resched_curr_lazy(rq);
> clear_buddies(cfs_rq, curr);
> }
> --
> 2.43.0


