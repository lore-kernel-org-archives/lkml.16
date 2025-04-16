Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E6189B8C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826137; cv=none; b=evgSQ842HBFjkag1gE+p7pNPtTPBQxFAGnyXz7n2BNrfbhYufw1J3VjHBOxlshzfKUhRP7o4K2YJnR35YHJY3XhEdAk7K8CvmSVehEONK6uOwxhm2AG5+uHkxga9SGlJzn1Z4A6ephyNh5XgPmsJwmX/V3vCSvRAQVig43q0hLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826137; c=relaxed/simple;
	bh=2CfjplX8zscpXUoal04dv9hwYU8t1NGe72Imp4iy5fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZoimKQHN8QtA+/0+v+KUW9WY0vwAajo8O7bEoMfFKH5f3GSH3E3fyKKNmXE/Y13HBylQ96LZv0hKx+SEwRAouvTElI+Ieh+jyojhz5XZaunkaS7oeYY1VyrQHZ5KE0O48lJtje6e/hhMXg0DnqkC4NVDGIHS9jRyyXUMZDOEZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nrF6BGcQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nrF6BGcQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe808908so7215e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744826134; x=1745430934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tO3E3xALB/t7rctpx9zy1Q881g7OQ2piRAkNHbzMn8=;
        b=nrF6BGcQmW0K3vznUjHilJ1OTF0iDniW6uCHjcGtnIe53FOjQ6bQXUbNIegdH8g4BM
         rx79IS5Pjzn6xZJCecb/N1XzM7Nk1zEdlV2bdL3G3tZFRShDWHwxr2ToT8cxsBlFcc64
         TrbVtn76n8bkaKpK1lBzG8zegQqHZLF7f4KOQYLQ7PhsC2JrM2H+HwaMBhfNSDb0B/Ls
         /iOS/Sb8UmnbUh4vjaSOSWHlIYMhIB8XeObdXkT3oA9Tdkei8DTU+RvjC9a0zMyYB2pt
         +bbd/qs2/VNvsyp+c8Z/QpJOT5wc1AMGyhXe2QHS2Rlot+CxWgqFSIMtIBPW/RTdqKp7
         wKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826134; x=1745430934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tO3E3xALB/t7rctpx9zy1Q881g7OQ2piRAkNHbzMn8=;
        b=CEauPVV1RaK30/AcfxLFuz05u7nccqziy7ywGtr2oHmSWU6bo24TDktO5ghKCG2VCU
         RLRwf67JrnPCcU+dmVIDJit/5RHT+eOGHz3c3/CUHJe90rX9T7hG5OghOgrqlsb2TYqw
         OEq2TvwE/q83SuvyABTDkPX6i5Y2rrD/6px7s625phYq+1FQ4tqo363/DX0yafSMt5JK
         0f+oztV/sEiMCfz1OB7A3YWIipQRLP9oB3WfrVFeOsA4MwtjR836yekacEo9bXDfKwcG
         dwAmOs63mOscV+FWkwuhNKvOt83K8yBtc5x8+y2YNI0eYs8f/0x5Pe1NvpEpXNGRzgS9
         I6Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWoUIIbOam8c0JdkYJ2Al4ynE5pJsSy7lgGb6c7g7c702C4MUO7vmNUVsqWY9HI9/1q9Yy/13QgfkZ/SEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyut+tHaSWksnQyCL2AGYckBgzQ7Uz3OLtbwmukcGB3gMGF/fkX
	PxSN4ZLaZ9p4xowcI018yDywMoWHfukAKXzObrmgV5cbVygG5y9/onyTHO/AI5kFu1xxYb3B71Z
	yu76OuLWcBIZFLIJWFHQGTwlJvL4868rdzL/Nu90dMXtP0WHLU5UQooUbKA==
X-Gm-Gg: ASbGncvUIoE8bEy3iN4tfOyg47mGhCIT5zOklJTu0B9xrCK/tSyFj3a5cs802C1T0p7
	IiB4mqKZcJIFiWEkv8Kwy/kblA4xQReCynX5d3fNdEb8+HZSVlSOS/wlxSL2jRU5lVJFqhiUL/N
	7zYD9iT0R4G+vqPgJQMpEhgEPEETg5mrxNQDeuHXyy6+Sjvtl+cqLF
X-Google-Smtp-Source: AGHT+IFj3pE5zdkYxEZY4aBG+o6bCeM3IfRKyL3i3Kw46tKIu/J5VpCIswp+cj2mEYBuvzx+IfzLj6h4UxCBN0hfGPw=
X-Received: by 2002:a05:600c:358e:b0:439:8f59:2c56 with SMTP id
 5b1f17b1804b1-44062a912f8mr34195e9.2.1744826134040; Wed, 16 Apr 2025 10:55:34
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415235308.424643-1-tjmercier@google.com> <46892bf4-006b-4be1-b7ce-d03eb38602b3@oracle.com>
In-Reply-To: <46892bf4-006b-4be1-b7ce-d03eb38602b3@oracle.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 10:55:22 -0700
X-Gm-Features: ATxdqUFGVI9JR-cfNSa7cIRPm3k9k6vDZ64btl4ethiLao_mMPbM-xa3GVv2MjA
Message-ID: <CABdmKX2zmQT=ZvRAHOjfxg9hgJ_9iCpQj_SDytHVG2UobdsfMw@mail.gmail.com>
Subject: Re: [PATCH v2] cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
To: Kamalesh Babulal <kamalesh.babulal@oracle.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:19=E2=80=AFAM Kamalesh Babulal
<kamalesh.babulal@oracle.com> wrote:
>
> Hi,
>
> On 4/16/25 5:23 AM, T.J. Mercier wrote:
> > Android has mounted the v1 cpuset controller using filesystem type
> > "cpuset" (not "cgroup") since 2015 [1], and depends on the resulting
> > behavior where the controller name is not added as a prefix for cgroupf=
s
> > files. [2]
> >
> > Later, a problem was discovered where cpu hotplug onlining did not
> > affect the cpuset/cpus files, which Android carried an out-of-tree patc=
h
> > to address for a while. An attempt was made to upstream this patch, but
> > the recommendation was to use the "cpuset_v2_mode" mount option
> > instead. [3]
> >
> > An effort was made to do so, but this fails with "cgroup: Unknown
> > parameter 'cpuset_v2_mode'" because commit e1cba4b85daa ("cgroup: Add
> > mount flag to enable cpuset to use v2 behavior in v1 cgroup") did not
> > update the special cased cpuset_mount(), and only the cgroup (v1)
> > filesystem type was updated.
> >
> > Add parameter parsing to the cpuset filesystem type so that
> > cpuset_v2_mode works like the cgroup filesystem type:
> >
> > $ mkdir /dev/cpuset
> > $ mount -t cpuset -ocpuset_v2_mode none /dev/cpuset
> > $ mount|grep cpuset
> > none on /dev/cpuset type cgroup (rw,relatime,cpuset,noprefix,cpuset_v2_=
mode,release_agent=3D/sbin/cpuset_release_agent)
> >
> > [1] https://cs.android.com/android/_/android/platform/system/core/+/b76=
9c8d24fd7be96f8968aa4c80b669525b930d3
> > [2] https://cs.android.com/android/platform/superproject/main/+/main:sy=
stem/core/libprocessgroup/setup/cgroup_map_write.cpp;drc=3D2dac5d89a0f024a2=
d0cc46a80ba4ee13472f1681;l=3D192
> > [3] https://lore.kernel.org/lkml/f795f8be-a184-408a-0b5a-553d26061385@r=
edhat.com/T/
> >
> > Fixes: e1cba4b85daa ("cgroup: Add mount flag to enable cpuset to use v2=
 behavior in v1 cgroup")
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
>
> The patch looks good to me, please feel free to add
>
> Reviewed-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>
>
> One nit below:
>
> > ---
> >  kernel/cgroup/cgroup.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
> > index 27f08aa17b56..cf30ff2e7d60 100644
> > --- a/kernel/cgroup/cgroup.c
> > +++ b/kernel/cgroup/cgroup.c
> > @@ -2353,9 +2353,37 @@ static struct file_system_type cgroup2_fs_type =
=3D {
> >  };
> >
> >  #ifdef CONFIG_CPUSETS_V1
> > +enum cpuset_param {
> > +     Opt_cpuset_v2_mode,
> > +};
> > +
> > +const struct fs_parameter_spec cpuset_fs_parameters[] =3D {
> > +     fsparam_flag  ("cpuset_v2_mode", Opt_cpuset_v2_mode),
> > +     {}
> > +};
>
> A minor optimization you may want to convert the cpuset_fs_parameters int=
o
> a static const.

Thanks, I copied from cgroup1_fs_parameters since that's where
cpuset_v2_mode lives, which doesn't have the static currently
(cgroup2_fs_parameters does). Let me update cpuset_fs_parameters in
v3, and add a second patch for cgroup1_fs_parameters.

> --
> Cheers,
> Kamalesh
>
