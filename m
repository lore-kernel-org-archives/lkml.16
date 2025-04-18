Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF232253E4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745007574; cv=none; b=oc2Tg0c8j1L1v7fx6v41eTUl9GLleqsleF3JYe5nxVLdcrxzH+U5y1xcSxecaF2+H7xSwWZ/VpLOeGcu4M91JGDi1eDZwHgOkQTh8TIvYhjOCZkWsuzl+m4/TCkRPe320zT6aiHqiyUswQvXSEglq4O2dpMwtHm5q2T1tcAbpyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745007574; c=relaxed/simple;
	bh=xJYmpdCnSHWhWbWjYZkJPELxKSBAcPREU2gnjEv+SqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fz+pBVtPcA1A5VxNktSoNjSVjeicHvJy5YKkGXT3T6dOk59b4BdF3pRfJS/BFv0vIh4PVZxSQA4SXoRTUrT8JnNccUwVYVqGT5aZyca3/BFe7L6YKiXBu1SsQwEBMY/DchtcFMSj2bvzlTZ6990lZG6XOnC3m3ybWLM6V6MA+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aX2hHJpK; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aX2hHJpK"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so12864a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745007571; x=1745612371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZXFKeC9M/Del26pDuuytW82irsQUL37Nct0skl7UqM=;
        b=aX2hHJpKwjDV8WBcFrStgIq7vqmrwIWCegJq6lWeRXd6vq2g+QUHEE8A+mI4ZEApKW
         y5tAGAw10+wl/3gj5+6AUA/2WB3VNvs+WLDxaKF02ICM9zZFNDchLOStZAZ8ZmjHkk5y
         +ahrIhbxzbmNdVwjUNu8bJX1yyzP/w0C0bIYf5smQtCRtxXCJywAMDnITyVS6eSDzo+4
         6GkHwcCZwWnAg4qeBNHztn5cfchJ0nsZSOGN5yRSDfYvULi+gqfxGfz3Gtu+2Ru4d9of
         Jx8BCGuJNQ/YV2NTS+MjxMN66RXtYxUlHKxaVo+rzu5LKA7gHAbhnCyvzcTkWPXZrXGU
         IpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745007571; x=1745612371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZXFKeC9M/Del26pDuuytW82irsQUL37Nct0skl7UqM=;
        b=b/fQz3ix2y5sSITDctjneFxkOGsn5XLRao2mAf2jEGIVm7ilvdtUBq/JqCm78k46v1
         dyM/REGplM/235pNTA9Q21PzIH0qHDOUbff/JZ6rDVLbFOiUzv/qx/AKylj+8tv5UUuM
         CyFfhDW4aVXjFbPRp5HyCfdgG5RDqsxEcglnQtaiv/Wk0+6Jf18EfFmbkPElE5VRvQlG
         josx7W1ZLhMWvB2odN5I27gZ75ulhGIpJ+hiDXqJyJg7RLH1nv48FncSCWkLxTFIzqz5
         Oh8VPJtcd8jR3Yx243CQwr9KPwBwdiz74Xy/yYd2ewDFXLjGFyIFv2MMV6e5u+MQd2DR
         jwYw==
X-Forwarded-Encrypted: i=1; AJvYcCX+8LkOhL2lfnsUTahGX1hh46aa9JIqocTXP47W5MQUuebILGzxWzKvydaQMGhxxRJEdUMbk7r+g6CqUM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzDC7Bd/H9RcDW989c0LoLvktKO0jcTi+FjaroFJAyEsQQLA2D
	7azV0Aam246A4D73yDdCQV9NopSEh+lXcpziBXn29CvIu1AKaEjH60ACYseq/zx6F9l2YjHCKyf
	fD3zLybogc10EOzdTlLqqJiZHPHLShp7vQoRa
X-Gm-Gg: ASbGncsxWUXJmZ9j3XW4SstRQ4+C8tZuKb6WHHpjYOU5VsDb1BOUPAXnKFQ/s3NoFQP
	NqfGECDZD6rUVlYK/hBROMXMq7NtiICE2JKiPrnMrlQMoRTmc01Mtc5W1kHefsKJdO8ux04jPtD
	NKHIV18Yh54iTcGnCnF+K73w==
X-Google-Smtp-Source: AGHT+IGFe97Mx8SoIIgHDiHuNwRkro7YcFs1R7KuODBZY8K/NGiuCZqNbl0JcflhwH61kKBZ35/7bfZnv2ML0wJSyyc=
X-Received: by 2002:aa7:d596:0:b0:5e0:eaa6:a2b0 with SMTP id
 4fb4d7f45d1cf-5f6289ac180mr92807a12.5.1745007570788; Fri, 18 Apr 2025
 13:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418195956.64824-1-shakeel.butt@linux.dev>
In-Reply-To: <20250418195956.64824-1-shakeel.butt@linux.dev>
From: Greg Thelen <gthelen@google.com>
Date: Fri, 18 Apr 2025 13:18:53 -0700
X-Gm-Features: ATxdqUEFwnlg_5kC790EFWxU23bmt6mATlBYh_XFDn6utQnVCEwoEYazCJRVwyo
Message-ID: <CAHH2K0as=b+EhxG=8yS9T9oP40U2dEtU0NA=wCJSb6ii9_DGaw@mail.gmail.com>
Subject: Re: [PATCH] memcg: introduce non-blocking limit setting interfaces
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Yosry Ahmed <yosry.ahmed@linux.dev>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 1:00=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> Setting the max and high limits can trigger synchronous reclaim and/or
> oom-kill if the usage is higher than the given limit. This behavior is
> fine for newly created cgroups but it can cause issues for the node
> controller while setting limits for existing cgroups.
>
> In our production multi-tenant and overcommitted environment, we are
> seeing priority inversion when the node controller dynamically adjusts
> the limits of running jobs of different priorities. Based on the system
> situation, the node controller may reduce the limits of lower priority
> jobs and increase the limits of higher priority jobs. However we are
> seeing node controller getting stuck for long period of time while
> reclaiming from lower priority jobs while setting their limits and also
> spends a lot of its own CPU.
>
> One of the workaround we are trying is to fork a new process which sets
> the limit of the lower priority job along with setting an alarm to get
> itself killed if it get stuck in the reclaim for lower priority job.
> However we are finding it very unreliable and costly. Either we need a
> good enough time buffer for the alarm to be delivered after setting
> limit and potentialy spend a lot of CPU in the reclaim or be unreliable
> in setting the limit for much shorter but cheaper (less reclaim) alarms.
>
> Let's introduce new limit setting interfaces which does not trigger
> reclaim and/or oom-kill and let the processes in the target cgroup to
> trigger reclaim and/or throttling and/or oom-kill in their next charge
> request. This will make the node controller on multi-tenant
> overcommitted environment much more reliable.

Would opening the typical synchronous files (e.g. memory.max) with
O_NONBLOCK be a more general way to tell the kernel that the user
space controller doesn't want to wait? It's not quite consistent with
traditional use of O_NONBLOCK, which would make operations to
fully succeed or fail, rather than altering the operation being requested.
But O_NONBLOCK would allow for a semantics of non-blocking
reclaim, if that's fast enough for your controller.

> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 16 +++++++++
>  mm/memcontrol.c                         | 46 +++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index 8fb14ffab7d1..7b459c821afa 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1299,6 +1299,14 @@ PAGE_SIZE multiple when read back.
>         monitors the limited cgroup to alleviate heavy reclaim
>         pressure.
>
> +  memory.high.nonblock
> +        This is the same limit as memory.high but have different
> +        behaviour for the writer of this interface. The program setting
> +        the limit will not trigger reclaim synchronously if the
> +        usage is higher than the limit and let the processes in the
> +        target cgroup to trigger reclaim and/or get throttled on
> +        hitting the high limit.
> +
>    memory.max
>         A read-write single value file which exists on non-root
>         cgroups.  The default is "max".
> @@ -1316,6 +1324,14 @@ PAGE_SIZE multiple when read back.
>         Caller could retry them differently, return into userspace
>         as -ENOMEM or silently ignore in cases like disk readahead.
>
> +  memory.max.nonblock
> +        This is the same limit as memory.max but have different
> +        behaviour for the writer of this interface. The program setting
> +        the limit will not trigger reclaim synchronously and/or trigger
> +        the oom-kill if the usage is higher than the limit and let the
> +        processes in the target cgroup to trigger reclaim and/or get
> +        oom-killed on hitting their max limit.
> +
>    memory.reclaim
>         A write-only nested-keyed file which exists for all cgroups.
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 5e2ea8b8a898..6ad1464b621a 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -4279,6 +4279,23 @@ static ssize_t memory_high_write(struct kernfs_ope=
n_file *of,
>         return nbytes;
>  }
>
> +static ssize_t memory_high_nonblock_write(struct kernfs_open_file *of,
> +                                         char *buf, size_t nbytes, loff_=
t off)
> +{
> +       struct mem_cgroup *memcg =3D mem_cgroup_from_css(of_css(of));
> +       unsigned long high;
> +       int err;
> +
> +       buf =3D strstrip(buf);
> +       err =3D page_counter_memparse(buf, "max", &high);
> +       if (err)
> +               return err;
> +
> +       page_counter_set_high(&memcg->memory, high);
> +       memcg_wb_domain_size_changed(memcg);
> +       return nbytes;
> +}
> +
>  static int memory_max_show(struct seq_file *m, void *v)
>  {
>         return seq_puts_memcg_tunable(m,
> @@ -4333,6 +4350,23 @@ static ssize_t memory_max_write(struct kernfs_open=
_file *of,
>         return nbytes;
>  }
>
> +static ssize_t memory_max_nonblock_write(struct kernfs_open_file *of,
> +                                        char *buf, size_t nbytes, loff_t=
 off)
> +{
> +       struct mem_cgroup *memcg =3D mem_cgroup_from_css(of_css(of));
> +       unsigned long max;
> +       int err;
> +
> +       buf =3D strstrip(buf);
> +       err =3D page_counter_memparse(buf, "max", &max);
> +       if (err)
> +               return err;
> +
> +       xchg(&memcg->memory.max, max);
> +       memcg_wb_domain_size_changed(memcg);
> +       return nbytes;
> +}
> +
>  /*
>   * Note: don't forget to update the 'samples/cgroup/memcg_event_listener=
'
>   * if any new events become available.
> @@ -4557,12 +4591,24 @@ static struct cftype memory_files[] =3D {
>                 .seq_show =3D memory_high_show,
>                 .write =3D memory_high_write,
>         },
> +       {
> +               .name =3D "high.nonblock",
> +               .flags =3D CFTYPE_NOT_ON_ROOT,
> +               .seq_show =3D memory_high_show,
> +               .write =3D memory_high_nonblock_write,
> +       },
>         {
>                 .name =3D "max",
>                 .flags =3D CFTYPE_NOT_ON_ROOT,
>                 .seq_show =3D memory_max_show,
>                 .write =3D memory_max_write,
>         },
> +       {
> +               .name =3D "max.nonblock",
> +               .flags =3D CFTYPE_NOT_ON_ROOT,
> +               .seq_show =3D memory_max_show,
> +               .write =3D memory_max_nonblock_write,
> +       },
>         {
>                 .name =3D "events",
>                 .flags =3D CFTYPE_NOT_ON_ROOT,
> --
> 2.47.1
>
>
