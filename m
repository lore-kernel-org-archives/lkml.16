Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3622609F8
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043956; cv=none; b=ioNNcl3Bz+MOcckm9ME0gkjhzDsmJdVMQa3Ewt64msOFFMQ+e9lN2ZTSh/XSGbKj7Qs9KsVN//BZnxXvtJT9+0ketIxacR1LQC4lJcl9WQI98CSWZ/DjInKqW71E+RR4zhbArczL4yV0YOti43EMKvsCxNzrMjSPesRvNRtgYD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043956; c=relaxed/simple;
	bh=AYjiI7iDlgaKI4VfxRLB11vqsjEJ8N0oG12haWvW6Sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHVNy5laLZ6rL8ftJ/yMoZog9FwAimVnQtUP7NEWQb5lRGZvR5pIGG3IHOdpqWLuEU2PjqX71wgfAcvvjwwxvQHlQdXsqvCiBs73Tpn5MU3duA7iG0OfRKgGoZiDc6atddWu8zXaT7HAWP67Spa1nyJS6NpnLpojfqAn9RI/dnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=l/7SxO9q; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="l/7SxO9q"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30c7306890dso2085053a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747043953; x=1747648753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3Bg40GR4NpfXrAg/Ch4DnXqg4ghwkqgvCQYfyo4D0=;
        b=l/7SxO9qfErW3jwY3CZvB/18AvH0SGKFdGgGvxUbLrtZSFDDX8oeDcCBgKif3o7pHX
         JqeCo0WhFs2Ko9NgMbmKf5ZxzP4V+buYvC8kKztw60XbpoRUWZb8+UE3UMCOByMioTjS
         C5oqrtJEKKPATgi+6EzOaxk5tcmCDG6d/KNWAzk2cHOeX+rNKRHph/LVfUj8VPHFVKwy
         Qr+2mfBtf9TIrIxueLPGU5UeQDm0W/gGMtKFHdPKi+O9GqZv2+1M2iUJzPLW45nxJJTO
         1A0mQCyePRIBKUxmuquhR3PJNoR2RO/O4P8TnlsKde6zymUce/I6rLqNs47FnIPW78JC
         CcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043953; x=1747648753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gf3Bg40GR4NpfXrAg/Ch4DnXqg4ghwkqgvCQYfyo4D0=;
        b=xUTsjjAXQA6GzMIoXX50xLIEkpVoDbOCtC5yR7MI5kg2kvWhYNGk/M9idnGJvrjYLQ
         ECN1AyAVTC7uZhihkvmbluY/WN+c5Kh4U+6EHiwXHx93ewP1H1elgbR0kM4bpnnFT+Bl
         KnbPeOGMhgBAnhnSLSAU17dkD/NXatmHmlfL0Xhm1fDqYimw8l4FytyN9E9u8X5hYjcK
         GwhIszvdsttuRMzSFSFQFrdFXDF+5KsGxQ18Y0I3GNQJ79zM8v95KOrky0Rva+U7345V
         Xw2N8uAds1MSkqzW+LwrWOF4iNsJQF+rMGSG1EZMnPkWhJF1TsiVbkG+xvdTf9Zyby7H
         pSYw==
X-Forwarded-Encrypted: i=1; AJvYcCXaNjJ46JuRHe2D8aUciSX/zsLLqU6YUU6o43pHacFExo2K40g9aEg/MtH9lGdUOiagGQwWhb7Oe7BTv/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf6sLy5rNPLvURjTrUnCLs32mCadr6M7DxL8GZx4DTC/yD2ssN
	iYkm1wJRS60kVAJD02qO8RbVn/e+F7yxQand+GauohF075mAvvFmJSXn6qhBdL2JLEUAXjg8yAr
	YEmAuZeeUIZCav/QPzz84ucfR/ofkxFPLdVsCAg==
X-Gm-Gg: ASbGnctpvfZHScR3PYG/PXYzwBk/+0FxOhTw4MYpxqlJWck4uOIuFoK+QElWDV0mjO1
	rWEo6+eDu1QxZ0AF9LdhMDaNSA5Rv1Tmn2ZKjxQIqTlhnoC8q3YPkU32os8sST0IqwIuE1Np1tY
	mWkWrDhuKZz9RZaiNqLfowB0gsWc+1BVgzyebWAQSeUbl//ynfdK+VLIxO8wxh1EP+Hg==
X-Google-Smtp-Source: AGHT+IFmptyqWaBaNLC9k0gsNSW1Mdny4736KNzExVRpf+rPHHgsVAfgbx/JtvVdU///OameWngynORVG+ED15XYxz0=
X-Received: by 2002:a17:90b:164f:b0:30a:4d18:c71b with SMTP id
 98e67ed59e1d1-30c3d3eb986mr18159261a91.20.1747043953353; Mon, 12 May 2025
 02:59:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-11-apatel@ventanamicro.com> <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
In-Reply-To: <aCGeTPS4WiGYMTTo@smile.fi.intel.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Mon, 12 May 2025 15:28:37 +0530
X-Gm-Features: AX0GCFtBWusa8PQze3o0UbkP-799T9yoI70LiT3XQ9z7ouWVSYyLKKQP5YJzFHg
Message-ID: <CA+Oz1=ZXJOrXT28V+MVSmvh-4ddnwZ8hJAFzB6tmNbcohLMT=g@mail.gmail.com>
Subject: Re: [PATCH v3 10/23] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rahul@summations.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 12:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 11, 2025 at 07:09:26PM +0530, Anup Patel wrote:
> > From: Rahul Pathak <rpathak@ventanamicro.com>
> >
> > The RPMI specification defines a clock service group which can be
> > accessed via SBI MPXY extension or dedicated S-mode RPMI transport.
> >
> > Add mailbox client based clock driver for the RISC-V RPMI clock
> > service group.
>
> ...
>
> > +#include <linux/clk-provider.h>
> > +#include <linux/err.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mailbox/riscv-rpmi-message.h>
>
> Just to point out again that the above misses a lot of headers definition=
s
> and/or APIs this driver uses. Follow IWYU principle.

Sure

>
> ...
>
> > +#define GET_RATE_U64(hi_u32, lo_u32) ((u64)(hi_u32) << 32 | (lo_u32))
>
> Hmm... Perhaps add this kind of macro to wordpart.h ? IIRC not only this =
driver
> uses something like this.
>

Sure, it makes sense.

> ...
>
> > +enum rpmi_clk_type {
> > +     RPMI_CLK_DISCRETE =3D 0,
> > +     RPMI_CLK_LINEAR =3D 1,
>
> > +     RPMI_CLK_TYPE_MAX_IDX,
>
> No comma for the terminator. Please, clean all these cases.

Sure

>
> > +};
>
> ...
>
> > +union rpmi_clk_rates {
> > +     u64 discrete[RPMI_CLK_DISCRETE_MAX_NUM_RATES];
> > +     struct {
> > +             u64 min;
> > +             u64 max;
> > +             u64 step;
> > +     } linear;
>
> Have you looked at the linear ranges library we have in the kernel? Can y=
ou
> utilise it here?

Ok, i will check

>
> > +};
>
> ...
>
> > +struct rpmi_clk {
> > +     struct rpmi_clk_context *context;
> > +     u32 id;
> > +     u32 num_rates;
> > +     u32 transition_latency;
> > +     enum rpmi_clk_type type;
> > +     union rpmi_clk_rates *rates;
> > +     char name[RPMI_CLK_NAME_LEN];
> > +     struct clk_hw hw;
>
> Just a reminder to use `pahole` to check that your data layout is optimis=
ed for
> memory consumption.

Ok, i will check

>
> > +};
>
> ...
>
> > +struct rpmi_get_supp_rates_rx {
> > +     u32 status;
> > +     u32 flags;
> > +     u32 remaining;
> > +     u32 returned;
> > +     u32 rates[];
> > +};
>
> Is it ABI? (I mean if this is interface with some kind of FW)
> If so, Use proper endianess aware types. Same Q for all data
> types defined in this driver.

Sure.

It's the message format defined by the RISC-V RPMI spec.


>
> ...
>
> > +                     for (j =3D 0; j < rx->returned; j++) {
> > +                             if (rateidx >=3D (clk_rate_idx + rx->retu=
rned))
>
> Too many parentheses.

Ok, will remove

>
> > +                                     break;
> > +                             rpmi_clk->rates->discrete[rateidx++] =3D
> > +                                     GET_RATE_U64(rate_discrete[j].hi,
> > +                                                  rate_discrete[j].lo)=
;
> > +                     }
> > +             }
>
> ...
>
> > +     devm_kfree(context->dev, rx);
>
> Why?! This is a red flag to point that here is misunderstanding or abuse =
of
> managed resources approach. Either use __Free() from cleanup.h or don't c=
all
> devm_kfree(). The latter must have a very good justification to explain w=
hy.

Yeah, I think it's better to use kzalloc for this case and then free it.


>
> > +     return 0;
>
> (this is even not an error path, where it might have a little argument fo=
r)
>
> ...
>
> > +     /* Keep the requested rate if the clock format
> > +      * is of discrete type. Let the platform which
> > +      * is actually controlling the clock handle that.
> > +      */
>
> /*
>  * Use proper style for the multi-line comments. You can
>  * refer to this comment as an example.

Yes, I will correct it.

>  */
>
> ...
>
> > +out:
>
> Redundant label. Note, the labels are recommended to be named after the f=
low
> they will run if goto. This one can be named as out_literally_with_return=
_0,
> which makes it obvious how useless it is.

I will improve the flow.

>
> > +     return 0;
>
> ...
>
> > +     rates =3D devm_kzalloc(dev, sizeof(union rpmi_clk_rates), GFP_KER=
NEL);
>
> sizeof(*...)
>
> > +     if (!rates)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     rpmi_clk =3D devm_kzalloc(dev, sizeof(struct rpmi_clk), GFP_KERNE=
L);
>
> Ditto.
>
> > +     if (!rpmi_clk)
> > +             return ERR_PTR(-ENOMEM);
>
> ...
>
> > +     ret =3D rpmi_clk_get_supported_rates(clkid, rpmi_clk);
> > +     if (ret)
> > +             return dev_err_ptr_probe(dev, ret,
> > +                     "Get supported rates failed for clk-%u, %d\n", cl=
kid, ret);
>
> Indentation issues. Repetitive ret in the message. Please, get familiar w=
ith
> the format dev_err_probe() uses.

Ok, I will correct.

>
> ...
>
> > +     int ret, num_clocks, i;
>
> Why is 'i' signed?

This and num_clocks can be unsigned, will change.
>
> ...
>
> > +     /* Allocate RPMI clock context */
> > +     context =3D devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);
>
> Ha-ha, you have even inconsistent style in the same file! So, go through =
the
> whole series and make sure that the style used in each file is consistent=
.

Yeah, that's because there are multiple devs in this series.
I will improve that.

>
> > +     if (!context)
> > +             return -ENOMEM;
>
> ...
>
> > +     /* Validate RPMI specification version */
> > +     rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION);
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret) {
> > +             dev_err_probe(dev, ret, "Failed to get spec version\n");
> > +             goto fail_free_channel;
>
> This is simply wrong. You should not do goto before any devm_*() calls.
> The error path and ->remove(), if present) is broken. Fix it accordingly.
>
> Here should be
>
>                 return dev_err_probe(...);
>
> it's your homework to understand how to achieve that. Plenty of the examp=
les in
> the kernel.
>

Sure

> > +     }
>
> ...
>
> > +enum rpmi_clock_service_id {
> > +     RPMI_CLK_SRV_ENABLE_NOTIFICATION =3D 0x01,
> > +     RPMI_CLK_SRV_GET_NUM_CLOCKS =3D 0x02,
> > +     RPMI_CLK_SRV_GET_ATTRIBUTES =3D 0x03,
> > +     RPMI_CLK_SRV_GET_SUPPORTED_RATES =3D 0x04,
> > +     RPMI_CLK_SRV_SET_CONFIG =3D 0x05,
> > +     RPMI_CLK_SRV_GET_CONFIG =3D 0x06,
> > +     RPMI_CLK_SRV_SET_RATE =3D 0x07,
> > +     RPMI_CLK_SRV_GET_RATE =3D 0x08,
>
> > +     RPMI_CLK_SRV_ID_MAX_COUNT,
>
> No comma in the terminator line.

Ok

>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


Thanks

Rahul Pathak
