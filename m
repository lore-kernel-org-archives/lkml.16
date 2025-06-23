Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96A3145355
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688352; cv=none; b=LzI3dkb5/nDotMzDtH981TL6RqF3imOA9FovBpAPh90Zs2j1VmXNhSJ0RUcPwyU0c3c8qYUnANfmIMxdUV9o//9zP2gZgt0AYUVCBuwI1LKrqDwzdMW2bWTzDa9Xto9VvZV3nKH+WwdEFjtivLj3afNx+X2AyoN2hNkNJ448h5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688352; c=relaxed/simple;
	bh=fVhp0kk7yln1GhbmDbmrjitgG6RCsk2hQ/F1Nvr6mtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUjQb7rmIDwB2Ww+jheGuDmuocrZSEPniQ3ALZlEkFD9+gq01/yKeoapn+I8/DCD8g843XFWFFSa5b9tTn9/HS5Q0yQ4DLZYWzZTc66AYqer1ceM6HxR3fuTRvPFYmdpmNlzxjlrhN9IRcilcBpE4FRsLdxkDUYcZqDVjTVkwt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZnNZp+L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZnNZp+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51009C4CEF1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750688352;
	bh=fVhp0kk7yln1GhbmDbmrjitgG6RCsk2hQ/F1Nvr6mtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JZnNZp+LLaJ8KO9x57Tz/ajV6KNYO9yexAuAR2XDfO3FnBSTEJy1LAEHQAEE5PU3v
	 IKuE08Arh1w6G5+Dp93vf0uq+M0OaaSBUvYMMGXYIp/OvXyRZPjVdvpeCK1PzC4hws
	 D+SQrWRLeAeh73wOUaqE7aQ8CBqTCY6vllWRZlB9gyqFja2uLt/azBgVmT5BBRg8gJ
	 zN0LCza166nQXqN0ZpKe3RUiuLlvtLCWQQqZsQ5zxn8LzyQgHfcHZ21aZMi9Kiuivt
	 BKTyoxUZyYLWxGSyLwHwVA1eyTRF6iSBFqjUybBiggvs8EJmVnUa3IIefyAX2iB5Z2
	 FqHgeS5/ZAOxg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso806303166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:19:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+TEsgBY4ymiSwldDhV8vG223GLnaoKQGe2rBB+zGfkaGp4ZOyWH1W0eWHzy/GVzVq7eRHoV1gpTEklHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyekQSP23s0EmmJd933SPtOTWm8o7hkDUKxs5bfTnTcBjjIGwQ
	uDDnnzFjA2XcqpYLC68gv2CO4plU5un23JWblOAOCKu9L1pnzXIXSTRcPTyNuRJaiaEekrDABFD
	RKL8oj+uwiJm15mYnlUnP1ItWJ8S5nQ==
X-Google-Smtp-Source: AGHT+IGeXE26nG6p38Uwsxy/FoXelv+Ic5l+L6Q9K3HztXzstCPX04+L+Jc0Grcp9OXJDzvM7GKtblQieEdXimJfEws=
X-Received: by 2002:a17:907:7b96:b0:ad8:a41a:3cba with SMTP id
 a640c23a62f3a-ae057bc88cemr1354358566b.43.1750688350806; Mon, 23 Jun 2025
 07:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613130356.8080-1-james.morse@arm.com> <20250613130356.8080-2-james.morse@arm.com>
 <20250617170323.00006688@huawei.com>
In-Reply-To: <20250617170323.00006688@huawei.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Jun 2025 09:18:59 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+vA1AR+P0se3njU-_P0cjBM1h-4YGAShFZ-gy53SkZfw@mail.gmail.com>
X-Gm-Features: Ac12FXyYCMsH7OEBDSoHPIw_JXHCyml3peBYjUguFKyZJOLaAbRm95SwgGPeNzY
Message-ID: <CAL_Jsq+vA1AR+P0se3njU-_P0cjBM1h-4YGAShFZ-gy53SkZfw@mail.gmail.com>
Subject: Re: [PATCH 1/5] cacheinfo: Set cache 'id' based on DT data
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, sudeep.holla@arm.com, 
	Ben Horgan <ben.horgan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 11:03=E2=80=AFAM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Fri, 13 Jun 2025 13:03:52 +0000
> James Morse <james.morse@arm.com> wrote:
>
> > From: Rob Herring <robh@kernel.org>
> >
> > Use the minimum CPU h/w id of the CPUs associated with the cache for th=
e
> > cache 'id'. This will provide a stable id value for a given system. As
> > we need to check all possible CPUs, we can't use the shared_cpu_map
> > which is just online CPUs. As there's not a cache to CPUs mapping in DT=
,
> > we have to walk all CPU nodes and then walk cache levels.
>
> Is it ok for these to match for different levels?  I've no idea for
> these use cases.

Yes. The 'id' is per level, not globally unique.

> >
> > The cache_id exposed to user-space has historically been 32 bits, and
> > is too late to change. Give up on assigning cache-id's if a CPU h/w
> > id greater than 32 bits is found.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > [ ben: converted to use the __free cleanup idiom ]
> > Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> > [ morse: Add checks to give up if a value larger than 32 bits is seen. =
]
> > Signed-off-by: James Morse <james.morse@arm.com>
>
> Hi James, Rob,
>
> Mainly a couple of questions for Rob on the fun of scoped cleanup being
> used for some of the iterators in a similar fashion to already
> done for looping over child nodes etc.
>
> > ---
> > Use as a 32bit value has been seen in DPDK patches here:
> > http://inbox.dpdk.org/dev/20241021015246.304431-2-wathsala.vithanage@ar=
m.com/
> > ---
> >  drivers/base/cacheinfo.c | 33 +++++++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index cf0d455209d7..9888d87840a2 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -8,6 +8,7 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> >  #include <linux/acpi.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/bitops.h>
> >  #include <linux/cacheinfo.h>
> >  #include <linux/compiler.h>
> > @@ -183,6 +184,37 @@ static bool cache_node_is_unified(struct cacheinfo=
 *this_leaf,
> >       return of_property_read_bool(np, "cache-unified");
> >  }
> >
> > +static void cache_of_set_id(struct cacheinfo *this_leaf, struct device=
_node *np)
> > +{
> > +     struct device_node *cpu;
> > +     u32 min_id =3D ~0;
> > +
> > +     for_each_of_cpu_node(cpu) {
>
> Rob is it worth a scoped variant of this one?  I've come across
> this a few times recently and it irritates me but I didn't feel
> there were necessarily enough cases to bother.  With one more
> maybe it is time to do it (maybe 10+ from a quick look)_.

My question on all of these (though more so for drivers), is why are
we parsing CPU nodes again? Ideally, we'd parse the CPU and cache
nodes only once and the kernel would provide the necessary info.

Take drivers/clk/mvebu/ap-cpu-clk.c for example. The code there really
just needs to know if there are 2 or 4 possible CPUs or what is the
max physical CPU id (If CPU #1 could be not present).

> > +             struct device_node *cache_node __free(device_node) =3D of=
_find_next_cache_node(cpu);
> > +             u64 id =3D of_get_cpu_hwid(cpu, 0);
> > +
> > +             if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
> > +                     of_node_put(cpu);
> > +                     return;
> > +             }
> > +             while (1) {
>
> for_each_of_cache_node_scoped() perhaps?  With the find already defined t=
his would end
> up something like the following.  Modeled on for_each_child_of_node_scope=
d.

That seems like an invitation for someone to parse the cache nodes
themselves rather than use cacheinfo. Plus, there are multiple ways we
could iterate over cache nodes. Is it just ones associated with a CPU
or all cache nodes or all cache nodes at a level?

That being said, I do find the current loop a bit odd with setting
'prev' pointer which is then never explicitly used. We're still having
to worry about refcounting, but handling it in a less obvious way.

>         #define for_each_of_cache_node_scoped(cpu, cache) \
>                 for (struct device_node *cache __free(device_node) =3D \
>                      of_find_next_cache_node(cpu); cache !=3D NULL; \
>                      cache =3D of_find_next_cache_node(cache))
>
>         for_each_of_cpu_node_scoped(cpu) {
>                 u64 id =3D of_get_cpu_hwid(cpu, 0);
>
>                 if (FIELD_GET(GENMASK_ULL(63, 32), id))
>                         return;
>                 for_each_of_cache_node_scoped(cpu, cache_node) {
>                         if (cache_node =3D=3D np) {
>                                 min_id =3D min(min_id, id);
>                                 break;
>                         }
>                 }
>         }
>
> > +                     if (!cache_node)
> > +                             break;
> > +                     if (cache_node =3D=3D np && id < min_id) {
>
> Why do you carry on if id >=3D min_id?  Id isn't changing.  For that
> matter why not do this check before iterating the caches at all?

You're right, no need. There's no need to handle the id in the loop at
all, we just need to match the cache node. So perhaps just a helper:

static bool match_cache_node(struct device_node *cpu, const struct
device_node *cache_node)
{
  for (struct device_node *cache __free(device_node) =3D
        of_find_next_cache_node(cpu); cache !=3D NULL;
        cache =3D of_find_next_cache_node(cache)) {
    if (cache =3D=3D cache_node)
      return true;
  }
  return false;
}

And then the cpu loop would have:

if (match_cache_node(cpu, cache_node))
  min_id =3D min(min_id, id);

Rob
