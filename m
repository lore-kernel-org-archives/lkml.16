Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5C21F463B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750921373; cv=none; b=VwFDHSpivo8d2ZTwI9cz3bFA29ee4q23X7d+HkhQruivWKFaVEBhSUDEiSTSxnMl/he4E/Assi2hm5ipjHiSFhvKm54ZMIX+lT2h9LbQftYSd2Ee3zFu4Vj1Z7YQNroJtiMT2+FyF6u9Wgm6daYfAO5y87vBXKCzJRmujP1r2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750921373; c=relaxed/simple;
	bh=JeCIQ4IL3sxvd31af3WXViJMtBO5qnzW2MhlAjyRs1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hprIfWYghbPwWw9H1/fzxl6PEL6iJ0Xvf/EWVF7iQpb1060EEiqJgOeK+YHzKe9e69XS0tGYFc9sMEMYeIdP/xGP9SvIJ3LWQyhqKedVJvzA6FLvxrVCAXDR1SRgO2A9WlvoPHjBwaOEWgMAMfyhbugz04bxCXBSmjG9JBqJunI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=i1gVJWfN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="i1gVJWfN"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3138e64b3fcso505449a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750921371; x=1751526171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ezoYursQ3Oig93OOMoe1zsrf1bzMlW/yf403T+KaH4=;
        b=i1gVJWfNiLyhUcEcFUbfe/c/uC7/h+7IK74qX4Vp4Skj2ekvmi5K+ARpUJaC3eLrt+
         lXCYlz/ytrjo2KK8IehtCYyEdAAgCPdcv18GH+bEN60IhRusVgtsOFCyHrY/5TzbWUCC
         K+XruDWEGSnvhmMKG/ITx22LxuJWoTFOL1F28bJtq2NfsFcfUZmWOtGiGMz2E2CWawOT
         T+8Kcq671boFyGMoo+3G5JlR9NnjI9fNTp7gGwpZTB336xfHOPoZQtxkzJHJBKnVKZGH
         OUIgGsxVDQ/eLWjvaB+I6ketc/WFKBWrPWWvWHa6+6hp6E0iCJJHo3rYilIBZp4jba7U
         KoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750921371; x=1751526171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ezoYursQ3Oig93OOMoe1zsrf1bzMlW/yf403T+KaH4=;
        b=fA94IUQKXuFSV3/epSicnSgVnfkRBoK16jHu2oFWUts+a2TVGCF8IpVYcNsf/4xbD2
         Z7aiyn40Tk8uGCWFGOiEU2/gK4I5iCZRJkp0dvhjyzYmNzsNPFZZN/jjejGUECSX5baw
         h/iajTHVNsXsNIsy0DKk4MxdTWrMwgVmZqdJT6dK1Q2mwQYZh599yh4hl5VqcZrlNemC
         jdvSQv36MUQvqlLX/Ja98noeh8hTFdnvLtBNypQlpNkSkQLcvpelSKz2MPgfV103j972
         l/MVJI6qAK6r7DwKWUnrHA4uTqI+sTEL8MTnmG7NYXoygonwTA5GZ/oysLec9nrwenys
         lO4A==
X-Forwarded-Encrypted: i=1; AJvYcCVrntCaZ+ds3M4ynkq8UdHMDirmm+pq3umxdZbGkmtehNgCMeaxxOHbam9U8SWuWXRUsWWtI35ZJGGaR8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDwzW52UoKfi2uYdxlE7l1jt2eqRKhUrxHvPjAClF4YFFfNyvD
	hzDPasEs8fe7J2dXSRuSLSMM5hXWsjm1O9VmfpJhdngU9oGwvYOUKrpA1q4+7L4Djp2WessJdAL
	5hauKghLI2io01PO0Hec+2mYNLjAw4/NrDCXMTEuVDg==
X-Gm-Gg: ASbGnctdbS+B0swVDVh53oNcAgvOHFLwyLATcxZXNJJVIQtbK9ovRt7Txan9tI7b1X2
	Eygn2pl5AKlassSQeay5fjaqzVTMdX/AYMU3p/wPb7n/b+e0J7I49M4UFzsw8YAS3liBTbfUiLm
	JbVoOcSGbzSGckgDECGbfM4nqS7zSZuUm921ZerNnx71PtB027WzliYZ9X7Lg7EYI2lYzItMeG9
	RjPofThK5D1wmY=
X-Google-Smtp-Source: AGHT+IFAHFhc1sG2VjqU+uJ8gNcDmA7e/PrfZ8E+mKfaFvA9q0lqjh6eFhvh0NJwzb3bJOHZBhk/+7B5CQz0QdRGscA=
X-Received: by 2002:a17:90a:d60d:b0:313:f6fa:5bb5 with SMTP id
 98e67ed59e1d1-315f26893d4mr9452944a91.18.1750921370751; Thu, 26 Jun 2025
 00:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-10-apatel@ventanamicro.com> <aFkZJKnweqBi64b8@smile.fi.intel.com>
In-Reply-To: <aFkZJKnweqBi64b8@smile.fi.intel.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu, 26 Jun 2025 12:32:14 +0530
X-Gm-Features: Ac12FXy2D20JGtdoC12UYlFRQvl9rpENvx4ZUy4WrZrFd5OnE24sZvklsv5hZz4
Message-ID: <CA+Oz1=a65HvfXHWjeSq4Ubq=5kzHp9pkLJVr77hvTYAGFHv0Mg@mail.gmail.com>
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock
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
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 2:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 18, 2025 at 05:43:44PM +0530, Anup Patel wrote:
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
> ...
>
> > +enum rpmi_clk_config {
> > +     RPMI_CLK_DISABLE =3D 0,
> > +     RPMI_CLK_ENABLE =3D 1
>
> It's still unclear if this enum can be expanded in the future (and no, yo=
u may
> not answer this either). Hence, to reduce potential churn in the future, =
leave
> the trailing comma here.
>

Ok, will update

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
> Have you looked at the linear_range.h? Why can it not be (re-)used here?
>

I did the first time only when you commented. And i dont see any
benefit in that.
linear_range has slightly different way to access any value using `sel`.
Here this union represents how RPMI protocol represents the rates and
reusing linear_range will only introduce conversion to and fro.

> > +};
>
> ...
>
> > +static u32 rpmi_clk_get_num_clocks(struct rpmi_clk_context *context)
> > +{
> > +     struct rpmi_get_num_clocks_rx rx;
> > +     struct rpmi_mbox_message msg;
> > +     int ret;
> > +
> > +     rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_NUM_CLOC=
KS,
> > +                                       NULL, 0, &rx, sizeof(rx));
>
> ...here
>
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +
>
> This blank line should be rather ^^^

Sure, I will update.

>
> > +     if (ret || rx.status)
> > +             return 0;
>
> Why rx.status can't be checked before calling to a sending message?
> Sounds like the rpmi_mbox_init_send_with_response() links rx to msg someh=
ow.
> If this is the case, use msg here, otherwise move the check to be in the
> correct place.

Yes, the rpmi_mbox_init_send_with_response is a helper function which links
the rx to msg. It's a very simple function which only performs assignments.

Using msg instead of rx directly will require additional typecasting
which will only clutter
I can add a comment if that helps wherever the rpmi_mbox_init_send_with_res=
ponse
is used.

>
> Seems the same question to the all similar checks in the code.
>
> > +     return le32_to_cpu(rx.num_clocks);
> > +}
>
> ...
>
> > +static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk *rp=
mi_clk)
> > +{
> > +     struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +     struct rpmi_clk_rate_discrete *rate_discrete;
> > +     struct rpmi_clk_rate_linear *rate_linear;
> > +     struct rpmi_get_supp_rates_rx *rx __free(kfree) =3D NULL;
> > +     struct rpmi_get_supp_rates_tx tx;
> > +     struct rpmi_mbox_message msg;
>
> > +     size_t clk_rate_idx =3D 0;
>
> This kind of assignments is hard to maintain and it's mistake prone in ca=
se
> some additional code is injected in the future that might reuse it.
>
I dont understand what is the problem with this assignment. If any
code added in the future reuse it then it has to make sure that
clk_rate_idx has the correct initial value before any further references.

> > +     int ret, rateidx, j;
> > +

...

> > +static void rpmi_clk_disable(struct clk_hw *hw)
> > +{
> > +     struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +     struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +     struct rpmi_mbox_message msg;
> > +     struct rpmi_set_config_tx tx;
> > +     struct rpmi_set_config_rx rx;
> > +     int ret;
> > +
> > +     tx.config =3D cpu_to_le32(RPMI_CLK_DISABLE);
> > +     tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +
> > +     rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_CONFIG,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret || rx.status)
> > +             pr_err("Failed to disable clk-%u\n", rpmi_clk->id);
>
> Close to useless message. You may improve it by splitting to two and prin=
ting
> rx.status in one and ret in the other with different text. Or drop it.

Sure, I think it's better to keep and split it into two as you suggest
instead of dropping.

>
> > +}
>
> > +static int rpmi_clk_probe(struct platform_device *pdev)
> > +{
> > +     int ret;
> > +     unsigned int num_clocks, i;
> > +     struct clk_hw_onecell_data *clk_data;
> > +     struct rpmi_clk_context *context;
> > +     struct rpmi_mbox_message msg;
> > +     struct clk_hw *hw_ptr;
> > +     struct device *dev =3D &pdev->dev;
> > +
> > +     context =3D devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);
> > +     if (!context)
> > +             return -ENOMEM;
> > +     context->dev =3D dev;
> > +     platform_set_drvdata(pdev, context);
> > +
> > +     context->client.dev             =3D context->dev;
> > +     context->client.rx_callback     =3D NULL;
> > +     context->client.tx_block        =3D false;
> > +     context->client.knows_txdone    =3D true;
> > +     context->client.tx_tout         =3D 0;
> > +
> > +     context->chan =3D mbox_request_channel(&context->client, 0);
> > +     if (IS_ERR(context->chan))
> > +             return PTR_ERR(context->chan);
>
> Here is an incorrect order of the freeing resources. Besides that, wrappi=
ng the
> mbox_free_channel() into managed resources reduces this code by more
> than 10 LoCs! At bare minimum if will fix the bug,

Understood. So we can use devm_add_action_or_reset to link a release functi=
on
with the context->chan. Is this what you are suggesting? This will also mak=
e
the .remove callback redundant which can be removed.

...

> > +
> > +     rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_MAX_MSG_DATA_SI=
ZE);
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret) {
> > +             mbox_free_channel(context->chan);
> > +             return dev_err_probe(dev, ret, "Failed to get max message=
 data size\n");
> > +     }
> > +
> > +     context->max_msg_data_size =3D msg.attr.value;
> > +     num_clocks =3D rpmi_clk_get_num_clocks(context);
> > +     if (!num_clocks) {
> > +             mbox_free_channel(context->chan);
> > +             return dev_err_probe(dev, -ENODEV, "No clocks found\n");
> > +     }
> > +
> > +     clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, num_clo=
cks),
> > +                             GFP_KERNEL);
>
> (The above mention problem comes here after the successful allocation of
>  clk_data but failing of any further code.

Once the change mentioned in above comment will be done this will take
care of the rest of the exit scenarios.

>
> > +     if (!clk_data) {
> > +             mbox_free_channel(context->chan);
> > +             return dev_err_probe(dev, -ENOMEM, "No memory for clock d=
ata\n");
> > +     }
> > +     clk_data->num =3D num_clocks;
> > +
> > +     for (i =3D 0; i < clk_data->num; i++) {
> > +             hw_ptr =3D rpmi_clk_enumerate(context, i);
> > +             if (IS_ERR(hw_ptr)) {
> > +                     mbox_free_channel(context->chan);
> > +                     return dev_err_probe(dev, PTR_ERR(hw_ptr),
> > +                                          "failed to register clk-%d\n=
", i);
> > +             }
> > +             clk_data->hws[i] =3D hw_ptr;
> > +     }
> > +
> > +     ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, c=
lk_data);
> > +     if (ret) {
> > +             mbox_free_channel(context->chan);
> > +             return dev_err_probe(dev, ret, "failed to register clock =
HW provider\n");
> > +     }
> > +
> > +     return 0;
> > +}
>
> ...
>
> > +static void rpmi_clk_remove(struct platform_device *pdev)
> > +{
> > +     struct rpmi_clk_context *context =3D platform_get_drvdata(pdev);
> > +
> > +     mbox_free_channel(context->chan);
> > +}
>
> This function will be gone. See above.

Agree

>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20

Thanks
Rahul Pathak
