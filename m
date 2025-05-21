Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9BF1A5BAC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747794997; cv=none; b=q0yDOPEwHvP7dgv8epQkTDpX+kyQYkeSCZIO0V4gkOxa5ESzRmvqmYATIzNtVgYk36ynrPQlQCVMc4i1J5dP3yj3eZaOZ/T69Wa0hUGJHT03JdBEi11w8QeWnhJVQcYGvNE7Hm3G7pXsdKDnIBJhRjqUC5smcApSag4pXAbdpz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747794997; c=relaxed/simple;
	bh=3LlIVLVn2XJ3bMks/YIj5H5Gooj2k3xn5/ho7pAcaJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+mVF4f89EvfWRytMnL5jdEaQA9X6EKUhxHatoOD5DoaHmoxmTtKNLJOhn6a/pqwfal7bESGr5nSaFBBS6fu69RQL/IddZYZyFNqrAtNpX1mPeUROrfqoinsTXx2zclvOh1z9qgoGeyXpCekCivpZFiiabOM2SnXYX3AEPlBu1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Z81FHlM8; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Z81FHlM8"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-551f14dc30dso2936397e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747794993; x=1748399793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qM0G5JhOcdolicLe8qE3SREPLKhOhXvUArudMo2s51o=;
        b=Z81FHlM8AL7io41PK5/8o+Wpu+4y+GIEsKMMgfN362nu1It+WN2+J7y1LLw3Z8/7US
         aae/hrGrcYrAlw6uidhsqBtxoVrG9O/WnAfh1MGj/qb9CfEMsDkWFcVfYPsfX4ae8Uzi
         ntPqYWnWeBHnLNOV91NTDEuP7qiHDwFGow3b7maWB6+MdTEkZIu0A5jLq5CK1lv1p0aN
         cLsWno6R8VzmOIEQ71zV5dkZW6pNFABfOuh1NI21tcdB9SsUjvqZuzxpT+RXeYR4vTMK
         xajs+OMiQua98ddphvJ2kWBjqffuzzF9TCvJIYWL9RBzAAvT7d8htSRP6SMw56SCTL+W
         DuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747794993; x=1748399793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qM0G5JhOcdolicLe8qE3SREPLKhOhXvUArudMo2s51o=;
        b=CCoikMaQEe36NVYLTOFpHVSM/tQjGSPOEaY22I/PgAWhOYeuIMAV6daJ9uqdoLUQ0y
         +gi9PKj1GNw8HQhzjejxOrf8xiOoXHrFyzoGUVjfLTO+ZSoBVnGV+lFSr0p4/e/9/qpY
         ex4Z9Ns+GTw1/tvqljYBF2Oyx57WElMIM6cQMYmgoddVL2scUOsXui2zkgqpuuZ6F3AE
         bezR3uDjwjFj2Izntz1qTeuJP2ltsg2nkMT8S5JOmurNxMY0RHUaRCTy0Y2kItlFbfBk
         iySyQQ50wUn1DK7WnkKBrSACnUetOF72Km1x7A8+Ugyf7lB9syLEKlTNKmAsnwCh9hBq
         kOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsfE0/2TTMuMSyR63oACuIJFV+93/E///NZxaV8W19tj0Z1OG3pGLbGfYuFslMy1LyQti5hzSy7eGveU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg3ZXI4bvd3zdMJ8t94dJLO5wx8oli4IGoL2z921e48AmBiaIR
	A3H854vgQTrdMTcP5np3ZX3lFMSr840WtcAQ6wUqf6/uPsHq40Am7BmRKSa4BHCblKtAcjL5DpQ
	mazlYuZdwYntDxmKlpa0HHWFVGVzgm2z0qVpDqbKFdg==
X-Gm-Gg: ASbGncs4ecvyu3Fi0PDMyBJm9ClM9qiairde6tl3Oro0Kj1VL9YZzkIpKSaUiwCSNKw
	8OAaFat5a7k0Zx6EqA8zEj0l92dIorH/05E4SEmSdTL4jUghtYaeEm35dm93FOfeJ0ht5l0KfSQ
	IZDLF6c2LAPYWR0ZDH6W6/sd519a13zNgj5qE41z0zNSFEt9c=
X-Google-Smtp-Source: AGHT+IFMmXewRgXmjMlS3bxDt2y7GJT60G7EnBYDGZNqy8uaRaWPsxnVln1J9UYx1YxOtQE5xrFUWK1Pch5pIN1ljkA=
X-Received: by 2002:a05:6512:3995:b0:551:eb1b:f41d with SMTP id
 2adb3069b0e04-551eb1bf4c0mr4190306e87.27.1747794993380; Tue, 20 May 2025
 19:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520031552.1931598-1-hezhongkun.hzk@bytedance.com> <8029d719-9dc2-4c7d-af71-4f6ae99fe256@redhat.com>
In-Reply-To: <8029d719-9dc2-4c7d-af71-4f6ae99fe256@redhat.com>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Wed, 21 May 2025 10:35:57 +0800
X-Gm-Features: AX0GCFtf0DIpERFZQTx7FOHjO5TPfEvgqV99Xyao4ksnN0_IE5VVyJ-ZpLeiARg
Message-ID: <CACSyD1Mmt54dVRiBibcGsum_rRV=_SwP=dxioAxq=EDmPRnY2Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking cpuset.mems
 setting option
To: Waiman Long <llong@redhat.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, muchun.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 9:35=E2=80=AFPM Waiman Long <llong@redhat.com> wrot=
e:
>
> On 5/19/25 11:15 PM, Zhongkun He wrote:
> > Setting the cpuset.mems in cgroup v2 can trigger memory
> > migrate in cpuset. This behavior is fine for newly created
> > cgroups but it can cause issues for the existing cgroups.
> > In our scenario, modifying the cpuset.mems setting during
> > peak times frequently leads to noticeable service latency
> > or stuttering.
> >
> > It is important to have a consistent set of behavior for
> > both cpus and memory. But it does cause issues at times,
> > so we would hope to have a flexible option.
> >
> > This idea is from the non-blocking limit setting option in
> > memory control.
> >
> > https://lore.kernel.org/all/20250506232833.3109790-1-shakeel.butt@linux=
.dev/
> >
> > Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
> > ---
> >   Documentation/admin-guide/cgroup-v2.rst |  7 +++++++
> >   kernel/cgroup/cpuset.c                  | 11 +++++++++++
> >   2 files changed, 18 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/ad=
min-guide/cgroup-v2.rst
> > index 1a16ce68a4d7..d9e8e2a770af 100644
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > @@ -2408,6 +2408,13 @@ Cpuset Interface Files
> >       a need to change "cpuset.mems" with active tasks, it shouldn't
> >       be done frequently.
> >
> > +     If cpuset.mems is opened with O_NONBLOCK then the migration is
> > +     bypassed. This is useful for admin processes that need to adjust
> > +     the cpuset.mems dynamically without blocking. However, there is
> > +     a risk that previously allocated pages are not within the new
> > +     cpuset.mems range, which may be altered by move_pages syscall or
> > +     numa_balance.
> > +
> >     cpuset.mems.effective
> >       A read-only multiple values file which exists on all
> >       cpuset-enabled cgroups.
> > diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> > index 24b70ea3e6ce..2a0867e0c6d2 100644
> > --- a/kernel/cgroup/cpuset.c
> > +++ b/kernel/cgroup/cpuset.c
> > @@ -3208,7 +3208,18 @@ ssize_t cpuset_write_resmask(struct kernfs_open_=
file *of,
> >               retval =3D update_exclusive_cpumask(cs, trialcs, buf);
> >               break;
> >       case FILE_MEMLIST:
> > +             bool skip_migrate_once =3D false;
> > +
> > +             if ((of->file->f_flags & O_NONBLOCK) &&
> > +                     is_memory_migrate(cs) &&
> > +                     !cpuset_update_flag(CS_MEMORY_MIGRATE, cs, 0))
> > +                     skip_migrate_once =3D true;
> > +
> >               retval =3D update_nodemask(cs, trialcs, buf);
> > +
> > +             /* Restore the migrate flag */
> > +             if (skip_migrate_once)
> > +                     cpuset_update_flag(CS_MEMORY_MIGRATE, cs, 1);
> >               break;
> >       default:
> >               retval =3D -EINVAL;
>
> I would prefer to temporarily make is_memory_migrate() helper return
> false by also checking an internal variable, for example, instead of
> messing with the cpuset flags.
>

Sounds reasonable, thanks for the feedback. I'll give it a try later.

> Cheers,
> Longman
>
