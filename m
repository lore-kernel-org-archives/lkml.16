Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE4223DF9
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749506987; cv=none; b=CmqUbiDiMdUhoBqtTHGQezJ05SSiFqxECXTcki+490mTOFCNEFdmod0LiLNWGYl5mssxGNFpIIFkS0wTLwK/I1/tXFXZv6CkDGra6W9QeG7bDxiYCgYjmK1kVXqQP7cnD4F8NCzxJZphxP2ZzM/LVJiKhmji5ePIgNBRotgjtug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749506987; c=relaxed/simple;
	bh=P86jwe07mJu0URyv7CIAAu6JKNG/T38Mc49w5ZxaFR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKE0+vXLwUeRy/WwFrDKYzcSvNzL9VN/CpJvKKnN39nPi9uj63vFzwh6S6rfl7wuvJ5muSVTdlQFf3HruiltWGBTlH6sr65sMq6xbb+zYxLXLNPDOMIXoAzH9rAt0wWbjkmv+cID6iqcB1f6NKNEnUHDe4bzw9Z3atvmNF7grQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hxAoL2iJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hxAoL2iJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2353a2bc210so41445535ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749506980; x=1750111780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lo+xuu6/evF7Kj69JUrQ4+v7ESydcrUGBnfBq/70hhU=;
        b=hxAoL2iJzdzAVbj1WJ3RP6vhQPNqlUTTKahIr1ZC/9qj+AzyHqG+OnBl5NZIFu7gId
         ZnqaW79Lfct2qKpDQ9X80ECZd4L0XzCqLv89cYaci0Wdarcy6j4+gmm4DEdnh5D479yq
         esMqG1k0W2XiKCVvBrJwzwGeR3NBGpH83tVy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749506980; x=1750111780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lo+xuu6/evF7Kj69JUrQ4+v7ESydcrUGBnfBq/70hhU=;
        b=dtcXqubOpOws4GQ2OnkUqXkIpDQu1ZkNOm/6Fyd8eLCHeCkvADl43AE1YKgaqSqH/K
         qzF4tzS/cFizxorN6K7aC6OrlRbfP3EVNDlQf2nkvbEGjle+aUlI1g23wDKhiK2blAOj
         RFkHM4RVoexUhvxVeDftwOsy5xI9xfIsERnIXisXd3q6ADPVYADGXfE3kZBuUFB49lEp
         jcwzxzyYnsZbj/+VgxIh2ip3w+MsSOoLNstH77aGDmQx3hop5f7mMGlaqam5/JUIvf+0
         3HGtwCVwU021jYXjF3qyanRTvcBHV3krm9xBTt1Ss0cCzdOodFQiOeI9MOBQ1hgHkgUM
         7dqg==
X-Forwarded-Encrypted: i=1; AJvYcCVfes+3tirGqoDAR4r/CKkTof1yZS98ph36mLP4oskAZ+tq08gwdXAqoDj5wmFaYsfRqPnw2SqUXaV0d3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8sGaPot6KuorBL1S92UkRTL3pDNT+3CjTNVnG0hDBrEVB1jd2
	msMOJnr2e2VK9mzK/rWwtvZVZYY7XwWSdqf3rhhPmeGDehgeTyNwQcv9dhJg1N2jD1ilbGIngL5
	0p+outw==
X-Gm-Gg: ASbGnctuxNd+JN5CmRzDwghWt6HCD8NNsQxnBmlPC/VTzEtXmNVfUcMAYZwu8YVV0Mu
	AY8QjLMu6C7uhv2FoY7CdiuREx/OB6M/sOwPl6VhWyPXdoIQUlz+L8HejOG/+5tSL8nvX2a8nBv
	GMXanwuIYgAR9b8CmRKUDwXrgNO8LsFsRRq4nMwLbPpFLDqspX+cSU4G/Gmkzt6fU3sEpw8lBGn
	TdVjJWBd7T5GIAuIVEcXqDFaZYOaHZ8Oij+9MGEyJPdJ/9DH9K1WzA4DQk6Kl+ih/2K/EbVn09V
	mwzvH8m8+wG+JW2xkOE1TlKOjtZ0ERqrOOYsKtowgD3327LV56QlVvWyQgVIY+hGnaX43Gu9R+V
	xj1YuzQGomoOjywsIJvzUJsKsoM08xg==
X-Google-Smtp-Source: AGHT+IElXRHb8AeyvjsE60XnoXTskqkG7mVIdqD6XqTsneIyVbSSuSbPkVCD++/03g/BUgFObgjhQw==
X-Received: by 2002:a17:903:32cf:b0:235:6f7:b918 with SMTP id d9443c01a7336-23601d225cdmr217494835ad.28.1749506980178;
        Mon, 09 Jun 2025 15:09:40 -0700 (PDT)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com. [209.85.214.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030968c9sm59149375ad.87.2025.06.09.15.09.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 15:09:37 -0700 (PDT)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234c5b57557so44065905ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 15:09:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoBq9ygLFlhvCIE8XwslSBzGotyE9RA3EnsT7adveyT+c7mIGaOrAeMNnmgAytyxOkHI5seL9gFLUW0UM=@vger.kernel.org
X-Received: by 2002:a17:903:1b45:b0:234:c2e7:a103 with SMTP id
 d9443c01a7336-23601d82e8bmr214458545ad.33.1749506977132; Mon, 09 Jun 2025
 15:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529110418.481756-1-j-choudhary@ti.com> <2baf3c31-3edf-4c26-bd44-1d0560134871@ti.com>
 <CAMuHMdUi7pf1YfKRjMv_7VuKwjR5XekRXfcEzuPScGzHraGjyQ@mail.gmail.com> <84fdbd23-d694-453f-a225-dbac19b34719@ti.com>
In-Reply-To: <84fdbd23-d694-453f-a225-dbac19b34719@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 15:09:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XaR6Pq7E-13zR5PC_u=3SD=sc05_TzxWJR2FS040zESg@mail.gmail.com>
X-Gm-Features: AX0GCFuY9zmj0FHZgee9_PnbGi-N3ssFASItEBDN5ajNB22ll-m4fMNSbkRbwcE
Message-ID: <CAD=FV=XaR6Pq7E-13zR5PC_u=3SD=sc05_TzxWJR2FS040zESg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org, 
	max.oss.09@gmail.com, devarsht@ti.com, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, ernestvanhoecke@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 2, 2025 at 4:05=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.com=
> wrote:
>
> Hello Geert, Krzysztof,
>
> (continuing discussion from both patches on this thread...)
>
> On 30/05/25 13:25, Geert Uytterhoeven wrote:
> > Hi Jayesh,
> >
> > CC devicetree
> >
> > On Fri, 30 May 2025 at 04:54, Jayesh Choudhary <j-choudhary@ti.com> wro=
te:
> >> On 29/05/25 16:34, Jayesh Choudhary wrote:
> >>> By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> >>> added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-en=
able
> >>> call which was moved to other function calls subsequently.
> >>> Later on, commit "c312b0df3b13" added detect utility for DP mode. But=
 with
> >>> HPD_DISABLE bit set, all the HPD events are disabled[0] and the debou=
nced
> >>> state always return 1 (always connected state).
> >>>
> >>> Set HPD_DISABLE bit conditionally based on "no-hpd" property.
> >>> Since the HPD_STATE is reflected correctly only after waiting for deb=
ounce
> >>> time (~100-400ms) and adding this delay in detect() is not feasible
> >>> owing to the performace impact (glitches and frame drop), remove runt=
ime
> >>> calls in detect() and add hpd_enable()/disable() bridge hooks with ru=
ntime
> >>> calls, to detect hpd properly without any delay.
> >>>
> >>> [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >>>
> >>> Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge conn=
ector operations for DP")
> >>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
> >>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> >>> ---
> >>>
> >>> Changelog v2->v3:
> >>> - Change conditional based on no-hpd property to address [1]
> >>> - Remove runtime calls in detect() with appropriate comments
> >>> - Add hpd_enable() and hpd_disable() in drm_bridge_funcs
> >>> - Not picking up "Tested-by" tag as there are new changes
> >>>
> >>> v2 patch link:
> >>> <https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.c=
om/>
> >>>
> >>> [1]: <https://lore.kernel.org/all/mwh35anw57d6nvre3sguetzq3miu4kd43ro=
kegvul7fk266lys@5h2euthpk7vq/>
> >
> > Thanks for your patch!
> >
> >>> This would also require dts changes in all the nodes of sn65dsi86
> >>> to ensure that they have no-hpd property.
> >>
> >> DTS patch is posted now:
> >> <https://lore.kernel.org/all/20250529112423.484232-1-j-choudhary@ti.co=
m/>
> >
> > On all Renesas platforms handled by that patch, the DP bridge's HPD pin
> > is wired to the HPD pin on the mini-DP connector.  What am I missing?
>
> If the bridge's HPD is connected to that of the connector, then I am
> pretty certain HPD will not work for renesas platform. The detect hook
> always gives "connected" state in the driver (even if it is unplugged).
> Do you have different observation on your end?
> If not, then we do need something like this patch while addressing the
> backwards-compatibility concerns.
>
> During v1 RFC[2], I did observe that renesas also have DisplayPort
> connector type and might require hpd, but since the support was
> already there and no issue was raised, I assumed it does not require
> HPD.
>
> [2]:
> https://lore.kernel.org/all/01b43a16-cffa-457f-a2e1-87dd27869d18@ti.com/
>
>
> >
> > Regardless, breaking backwards-compatibility with existing DTBs is
> > definitely a no-go.

FWIW, we are in a little bit of a sticky situation here. We were in a
bit of a bad place from the start because the Linux driver ignored HPD
from the beginning but we didn't actually document that people should
be setting the "no-hpd" property until a little bit later. You can see
some discussion about this in commit 1dbc979172af ("dt-bindings:
drm/bridge: ti-sn65dsi86: Document no-hpd") where I noted "this is
somewhat of a backward-incompatible change." ...but, at the time, it
wasn't really a big deal because there were very few users (the one in
tree at the time was cheza, which was a dev board used internally at
Google).

...so, as of that change in May of 2020, it was documented that eDP
users were _supposed_ to be setting NO_HPD. I even remember Bjorn
requesting the "or is otherwise unusable" phrasing because we pretty
much wanted to set this property on everyone using sn65dsi86 as eDP
(even if they have HPD hooked up) because the debouncing time is so
long that it was better to hardcode the max delay instead of reading
the HPD line. Of course, even though we documented that they were
supposed to have the "no-hpd" property didn't necessarily mean that
everyone did. The code has never enforced it. I don't believe it even
checks the property...

So if there are dts files out there that don't set the property and
they were submitted after the bindings change in 2020, _technically_
they've been wrong the whole time. We're not changing history by
adding a new requirement so much as fixing broken DTS files. Although
the Linux driver always allowed them to get away with being broken,
technically DTS is separate from Linux so if they've been violating
the bindings then they've been wrong. :-P That being said, they've
been working and it would be nice to keep them working if we can, but
one could make an argument that maybe it would be OK to require them
to change...


> Got it.
> Let me try to figure out a way to fix it without messing it up.

While a bit on the ugly side, it seems like perhaps you could just do this:

1. If enable_comms is called before the bridge probe happens, just go
ahead and disable HPD.

2. When the bridge probe happens, if you notice that HPD should be
enabled and comms are on you can just enable HPD then (grabbing the
comms_mutex while doing it).

3. Any subsequent enable_comms called after the bridge probe happens
shouldn't disable HPD.

...you'd probably want a comment about the fact that "no-hpd" property
is unreliable, which is why we can't figure this out in a better way.


-Doug
