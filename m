Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15B51E883E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343587; cv=none; b=SDQy0vh5g6AWqIqrHBXoCwzCcOf/VgL7Zm1mk8fIK+W1MVN8WIWe9QSG9QlpgTDzh/7yRD/s+ZqDqi2CY7O60buXZVehzAVylUPU6gy1Dwbz4l0oV+HB7BoMpLqjvv8uQFnJWNwMMqh5w7OVGzMV5Zb43P40uN0FJs/i3J8Q7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343587; c=relaxed/simple;
	bh=dXd13byQNqK2noN66Hx7h1DsFrkGacJxiklfE2xIw4E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj2ikPPBPG6XXQkPiFajR20qFUb4gmP5ujmbf8I+1OewjdiSc1bwxSpzQWo+1IX97OvUzOzn1+gl0ouWxyMsEI/3qtY8JA1stLXUrHzAfvxwkQKagmuSTRwPP0FNEbtaPBvAqwf7f4vMfB0X0+enlkzFcYzSW/uXkbrU2iH9Sj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dh6TXAdu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh6TXAdu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385de59c1a0so1216733f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738343584; x=1738948384; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v73pmvXqiho5WEdT7QxUjB8R4XydyyW0ihhgFNC55Qc=;
        b=dh6TXAduO74rGF3O+/AioJB5OTk/mkA4JhXdj2kSP6xP+LoS2iIOL+wiLkHzXydaE4
         5qtS1CXfM+H9SHLppznq13nh8oBy9Q8DUnrygZAUEZbKoNhuNVw8rw8rrH0Ue31kTsd8
         KN2+y7YBm62QfUaC3yHPrKrUaX8TuISPvzCXLNiu6iVT6eaQA3DX+PgsCNG50h9JUtXZ
         YV6AJCrbCwcZFoC84dOxs/+lTt0oJRdpne8Gt98VOOfZfIXu4gBQsGhnNMLQ9prUmcFB
         ehssfQM7RkQSyUYwOPERA0zcZJwnj2iSENL/+rBoJc/m74usVBNEntu4ASXYpL7Js1zw
         CHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343584; x=1738948384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v73pmvXqiho5WEdT7QxUjB8R4XydyyW0ihhgFNC55Qc=;
        b=DDpW+t/uAiNafyPt5dLqGjYNhBPDVdjk1UAYJuW85eSSZFhJ4D2lmGQvw9ybUJNZfH
         B1B2T+uRU7e+rfoBp4LWWtZn1WTPCiESU3WeQRCDJxbzEssvlU8r6f97UHGhd4JPSlTK
         3en7+mNvFnZ4K6AUx0ssMh+Taqf5uiuWq0B8ewCpCSAZAg62+aPaEs4BdK+4ZJ7THaGV
         Rgye218BWKXq6Pupe+a6ytJlND6bdJrBVEgzLwW91Qyu/W7JMg7/Ilv53hV+evAqQfSA
         3yQiIs3yyT7Sv34gNqi0bTuygGvcvAFFNccQKYTrBNeRPUUrIEplpujseaOyO61hgEUa
         vh2A==
X-Forwarded-Encrypted: i=1; AJvYcCXKPtwZKVC9Ba3Rs0LdAY9lCeclcTK6MWxLO6oCQ98U/jvB/0EaeCevFJCHwaUXB8r+trHxFs+mqTZplDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAlx75k49Oefn4Evai5jLVrweZ431aY+N1VqQkvVxGw5O4AuFQ
	KmAqV+1oc53GN/EerqZf01V7vhm07T0e7B7TmlXFrVhlpvVw3MvY
X-Gm-Gg: ASbGncvI6zSI2jtN6o8MwPVdijVFnJKBSrNvgTP6Nfd48peIzyetrS5jBWM2ULYOV7M
	MEha3WzIBytKb0inQjuIZMgM645Rkv6ja/91FO3IEJ1HittukkEg7JXUc4HMmTuH29m8PT5AhHi
	a5lufoqD22DkNqJEVOO07aokEvEdbxs92cLDhvpx1woCRQEEwyFVGN+zxwGKr280WuAkwLBV/Fc
	gHuIkkVFr6ZUOGbJws8C4I2UmGrkRQ84fY3uZSu967ZqgDNiy6sXC5F2RDjsBdGSYxA2zqLtbok
	NhYyjStwT0Gs6A==
X-Google-Smtp-Source: AGHT+IH3K/xx7YhzgmmclYzzwfqAMEGQp3+WnMXLWIxhdFN6PQfffMt+hjRULJsW6CLlEBnPW87OKA==
X-Received: by 2002:a5d:64e4:0:b0:38a:88b8:99af with SMTP id ffacd0b85a97d-38c51951c62mr10419121f8f.22.1738343583672;
        Fri, 31 Jan 2025 09:13:03 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfccasm5200973f8f.92.2025.01.31.09.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:13:03 -0800 (PST)
Date: Fri, 31 Jan 2025 18:13:01 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] drm/vkms: Allow to configure device
Message-ID: <Z50EnT31Fm8EWBX3@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <Z5uDGr445jEfdt5L@louis-chauvet-laptop>
 <Z5yYVov9_z6CDU46@fedora>
 <Z5zJ1rEZyBEgd7DN@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5zJ1rEZyBEgd7DN@louis-chauvet-laptop>

On Fri, Jan 31, 2025 at 02:02:14PM +0100, Louis Chauvet wrote:
> On 31/01/25 - 10:31, José Expósito wrote:
> > On Thu, Jan 30, 2025 at 02:48:10PM +0100, Louis Chauvet wrote:
> > > On 29/01/25 - 12:00, José Expósito wrote:
> > > > Hi everyone,
> > > > 
> > > > In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
> > > > is required.
> > > > This series adds the required APIs to create a configuration, the code changes
> > > > required to apply it and KUnit test validating the changes.
> > > 
> > > Hi José,
> > 
> > Hi Louis,
> > 
> > Thanks a lot for the quick review!
> > 
> > > Thanks a lot!
> > > 
> > > This series is amazing and better than mine on many points. I have few 
> > > comments:
> > > - a "strange" naming pair: add/destroy (I expect add/remove or 
> > >   create/destroy like other function in DRM)
> > 
> > I used "add" because the function creates and adds a display pipeline
> > items and "destroy" because the opposite function removes it and frees
> > its memory, so I wanted to emphasize that the action was destructive.
> > 
> > However, I don't have a strong preference about the naming. If you
> > prefer another pair of verbs, I'll be happy to change the function
> > names.
> 
> So, I think create/destroy is a bit better: `create` with the 
> `vkms_config` parameter is enough to tell "it allocates stuff in 
> `vkms_config`". 

ACK, I'll change in v2.

> > > - usage of "complex" list accessors, can't we just create iterators?
> > 
> > Yes, on the first iteration, I used the underlying structure: list
> > iterators for planes/CRTCs/encoders/connectors and xa_for_each for
> > the possible_* items.
> > 
> > However, I found 2 main issues that made me rewrite this code:
> > 
> > The first one is that, if in the future, we change the internal data
> > type, we'll have to change all the code using it. On this way, like
> > I did with all the other vkms_config_*_get_*() functions, the data is
> > encapsulated.
> 
> In one of my comment I proposed a macro to help on this point. I think 
> this is sufficient to hide internals. (see patch 7/13)

That's a very good point, I like the vkms_config_for_each_plane()
macro you suggested. Also, it matches really well with similar macros
in drm, for example drm_connector_for_each_possible_encoder().

I'll add them in v2.

> > The second one is vkms_config_get_connectors(). Unlike the other
> > functions, this one filters by connector enabled status. If we let the
> > caller do the filtering, we'll duplicate that logic.
> 
> That something I missed, and a very good point.
> 
> I will try to create a macro that do the filtered iteration, if I succeed 
> and you agree on the previous point, I think it does not worth it to have 
> those huge amount of code just to iterate over a list.
> 
> > Because of these two reasons, I decided to add a getter for lists.
> > 
> > > - should we use pr_err in vkms_config_valid?
> > 
> > I think it is great to show to the user a reason why their device couldn't
> > be enabled in dmesg... But I'm not sure if there is a better way to do it.
> 
> I was not clear: I agree we want some logs, but pr_err is too 
> agressive (see patch 8/13).

Agreed, we can lower to warn.

> > > > Louis Chauvet and I are working on ConfigFS support. In this series I tried to
> > > > merge his changes [1] with mine [2].
> > > > I kept his Signed-off-by to reflect that, even if I show up as the author of
> > > > some/most of the patches, this was a joint effort.
> > > 
> > > To avoid confusion, you should add the Co-developped-by tag, so it will be 
> > > clear that we worked together on this.
> > 
> > Good point, I'll change it.
> > 
> > > > I'm still polishing the ConfigFS code [3] and its IGT tests [4] (connector
> > > > hot-add/remove bugs) but the IGT tests also exercise this series and can be used
> > > > for additional test coverage.
> > > 
> > > I will take a look at those series. For the connector hot-add/remove, do 
> > > you have any example of usage in the kernel? I did not found anything in 
> > > the documentation explaining they are hot-addable.
> > 
> > I pushed a couple of WIP commits to the kernel and IGT so you can see/test
> > the crashes and hopefully share some ideas.
> > 
> > About the documentation: I didn't find much information other than a few
> > mentions to hot-add/remove. However, in one of my rebases, two new functions, 
> > drm_connector_dynamic_init() and drm_connector_dynamic_register(), were added:
> > https://patchwork.freedesktop.org/patch/628418/
> 
> Ho! This is exactly one issue I had when developping IGT tests, sometimes 
> you fetch the connector list, and when querying info about a specific 
> connector you get nothing!

I'm not sure if it is the same issue, but when it happened to me, I was
missing a call to drm_mode_config_reset(). Credit to Maxime for helping
me with this error :)
 
> > I'm still trying to make them work, but I think they are what we need.
> 
> After reading the patch "https://patchwork.freedesktop.org/patch/628418/", 
> I don't think we really need to support "dynamic connector creation" right 
> now:
> - None of the existing driver do it (except MST, but MST need a lot of 
>   stuff to works)
> - If we want to support it later, just create a "useless" 
>   /configfs/vkms/DEV/connectors/CON/enable that you must write 1 before 
>   the device initialization to make the connector working. This way we 
>   will not have to break the UAPI (the file is already there, disabled by 
>   default)

Fair enough, we can add it in the future. To keep it backwars compatible
though, we'll need to enable by default "static" connectors so users don't
need to change the way they create devices.

For "dynamic" connectors (connectors created once the device is enabled) we
would need to set them disabled on creation, but this would be backwards
compatible, as we won't allow creating new connectors in the first version.

I'll remove the connector hot-add/remove on v2... Meaning that configfs + IGT
will be ready for review :)

> > Part of the crashes happen on the cleanup of drm_client_setup(). Adding a
> > connector adds modes in the DRM client, but removing the connector doesn't
> > remove them and, on cleanup, I get a NULL pointer.
> >
> > I'm a bit stuck, so help or tips are very welcome :)
> 
> I will look at it next week (same repo/branch?).

Yes, same repo.

Enjoy your weekend!
Jose

> Have a nice weekend,
> Louis Chauvet
> 
> > 
> > > Thanks again for this series,
> > > Louis Chauvet
> > 
> > I'll look with more time into your comments in the other patches next week.
> > 
> > Thanks,
> > Jose
> > 
> 
> [...]
