Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C70428BAAD
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919688; cv=none; b=Frtl2hVW8dXQDLp2d5pf/tJaISAkiSRXqQSpajLxalijG0c0OgnnMD/frpTDr01/VAP15m0cuBAMUWGGec1G7jOSzDvm+sTnK+s1W7BW8s3qYVez4FbAY0NMR0jhwQrCdI0MSnwUVRIbu69EsCRhg4i7xvDdGveH9ODHPDBVq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919688; c=relaxed/simple;
	bh=THyTxK8Ib2BX4j5wHfxK22gA1ZnxQLV+NEsJmDNqy/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sbxq48RwBJqroVUb1Ko58FLhejoDAWvDot/LbyrOlPRBEubXlb2etkXbnOy2hJ5844sUjNzVwiasfd2otCnUe8DElzivYk/Apc7SXOtjf3Ayxvit0bQta56uEnlbDAoRJdT5JYQpwj3TL7S5dgJdrHimj1ttDx8zfNLf3Th142o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=bij2gCkh; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="bij2gCkh"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b27015122c4so3498822a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747919685; x=1748524485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGlIrWJBVBFchs0/Y1aBCCRRWEAcXWd3TDlUnCoMtu4=;
        b=bij2gCkh3oeGgscSKxUatE4lJJ9EpECivZm7Ipgpc655zI8ShNz8nKuvD9i98j4zZW
         TJhJqH9IowkeSQTsOowomezg+XZvNPFivA4h4HdD0RQN/Ng+XvsaFHGHnROMNvDEVBfs
         u/bIKAQAqxr4rKlZZvN3vAguUcGLyo3cOe1b2iSi9XACeI9m7o3RtOfRa4Akl9lmVPDN
         7U6hwrIw8+TG5qE8xvpSswLxNUu9RYkDqCn2ZFXRPGWKJSSHizB8O43MCzWVRMoCkZIq
         uIkt11h1cX/kd2PpAT9/iyhlWKuCMXSrzbsZXBOWizPphmqrA+pjHc2RK5UnRTwNesbg
         fdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919685; x=1748524485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGlIrWJBVBFchs0/Y1aBCCRRWEAcXWd3TDlUnCoMtu4=;
        b=g3TgeF74hsrboNXtoAsRErE9B0fXM+th2v4FD8d6jJkovXOgrriTUVhnC/e7X36CyS
         Vnv5hTQZreWAbPJV//W4a+o7tIPETVDDj8/cb9JlJYLi+kf4D1piwuVJa7WIazkqjjcZ
         S58p3UKiBX2sDc6MZSuNkNvr0mICrzDl7ukE7wBkDHDuiVChtX8bHXds1MCo06o9eXvR
         lsWopWdaOvQojQ6OtjPL1lrIZLxnkUv0D2VoA17i5+j0Prsxlfs+dSIktQGVo+ygkos7
         lkqGcm/4GpXrf8j3tuBlhCF39OJhAorTb0tyv7pkiWK2WoVoNGoM+atVy7VyOtL2nkzE
         JE4g==
X-Forwarded-Encrypted: i=1; AJvYcCXVIkN0XeSSdH86pkpDskSAVBNubP8AX2LSfN8F2/XuZWZPEE7768q8gGqDeelAEbecEf/3jPzydKpFzj0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeUiduzDwQO5sADPsjvA3ozQB5Dp/7Tf1spy42lAmrE4/2Ks4m
	hWQ0G5EqSDuNsDCqmFDzZ+mV7tpLh20rFKDlTZMUnPfncmTHN1yby+Ztv0rtmjX8R+FwhdTjgou
	JF6dm8uGlHClfscWfPt3j0MKzcrSRZuKuXjz4wglshw==
X-Gm-Gg: ASbGncsMpQBM2/dVt/PZo1pjXoTmBmWwSKlngTFy1IuGLjMIYUT77cJuEHikxOiJ3ui
	bISkC+x0LTA0V+nkSCcfmHzyVv6fyLBUP0d5Btbt/CgJIs0xm3RBdsHzb5dip6IsTJJkv0vjhXj
	HxIY2xM7WsBZCK/jsA/e3FP2iDIiS8YB1X+v83Wm/DlVF9xpMpV2nwMlV0QQijLAeXooihS9rrv
	etC
X-Google-Smtp-Source: AGHT+IEoGK3RJI5+jH0DpYUBMxkEhiQ3mORuC3aHcocT5wnnZB2VoW+JpOOqTk96BQl2MCAPqnS4MDLuyCIXbqWKkik=
X-Received: by 2002:a17:902:d4c9:b0:232:202e:ab18 with SMTP id
 d9443c01a7336-232202eac80mr243775645ad.26.1747919685359; Thu, 22 May 2025
 06:14:45 -0700 (PDT)
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
Date: Thu, 22 May 2025 18:44:09 +0530
X-Gm-Features: AX0GCFukMonDaz7YsSr5vql7vPIURSlLEpDbS2KpNPhkArtway53iQSyYkqxB5s
Message-ID: <CA+Oz1=aLgFSc+RG4=5B0ejUDRrjUh1xNYmHjJQd0sRUwjMBGiw@mail.gmail.com>
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
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy

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
>
> ...
>
> > +#define GET_RATE_U64(hi_u32, lo_u32) ((u64)(hi_u32) << 32 | (lo_u32))
>
> Hmm... Perhaps add this kind of macro to wordpart.h ? IIRC not only this =
driver
> uses something like this.
>
> ...
>
> > +enum rpmi_clk_type {
> > +     RPMI_CLK_DISCRETE =3D 0,
> > +     RPMI_CLK_LINEAR =3D 1,
>
> > +     RPMI_CLK_TYPE_MAX_IDX,
>
> No comma for the terminator. Please, clean all these cases.
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
>
> ...
>
> > +                     for (j =3D 0; j < rx->returned; j++) {
> > +                             if (rateidx >=3D (clk_rate_idx + rx->retu=
rned))
>
> Too many parentheses.
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
>
> ...
>
> > +     int ret, num_clocks, i;
>
> Why is 'i' signed?
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

So far I could only find drivers with "goto used before devm_*" pattern use=
d.
Can you please point me to the example which does not use goto before
devm_* apis.

Also, I couldn't understand the problem which may happen because of
this. Can you
please explain?

>
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
>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20

Thanks
Rahul Pathak

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
>
> ...
>
> > +#define GET_RATE_U64(hi_u32, lo_u32) ((u64)(hi_u32) << 32 | (lo_u32))
>
> Hmm... Perhaps add this kind of macro to wordpart.h ? IIRC not only this =
driver
> uses something like this.
>
> ...
>
> > +enum rpmi_clk_type {
> > +     RPMI_CLK_DISCRETE =3D 0,
> > +     RPMI_CLK_LINEAR =3D 1,
>
> > +     RPMI_CLK_TYPE_MAX_IDX,
>
> No comma for the terminator. Please, clean all these cases.
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
>
> ...
>
> > +                     for (j =3D 0; j < rx->returned; j++) {
> > +                             if (rateidx >=3D (clk_rate_idx + rx->retu=
rned))
>
> Too many parentheses.
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
>
> ...
>
> > +     int ret, num_clocks, i;
>
> Why is 'i' signed?
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
>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20

Thanks
Rahul Pathak
