Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C853210F65
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613676; cv=none; b=RGLPse/pg+axcNxqVTyM0PyHmcIUQvFwQfcETvDSy96+pEvzV8uO+MUzi+DgocpQxRm9QsdgdRVL0dZu2+9shU7yvRQHNUM5cchIMtCmXXOBEalCdWqn47n7ytL73y1HMfDKhHbAMzpD5iEzo9trZwMoH8VKyfIVvvIXRItSIg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613676; c=relaxed/simple;
	bh=1vHGXUlZtyebRmzmZ6aE2d3iSmKznh50LzT5ifgwFgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9eYU5bQG3iDYy+NztU21xznE2raN5jEMIoQ5EDs3rpmKzAQcDLPnnordi/ipVEmEngyNcc/xJwSxBf0NgfmR+riH3gv6OVHDZznaBfjkii79NICn5zkj3ilm50cI948z7N5ISW7RzwnApJlo6EMee41ZbDgK1EtXrSK09nOZug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ZLumVnCF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ZLumVnCF"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-557e20222c3so114110e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751613672; x=1752218472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss38OfQK2BPStY8bJhweUCCLJplXw3xTcQ9jkhK3PpA=;
        b=ZLumVnCF2+nN5qwCH87I3PU9oH2u1oQ8wzZENkRl0lsm/+gw3A5xKwsyBsPxnyMcrh
         LK7HE488njmpN3ESoDePs26O0HgBFtDJo8ERHFV4q6gOLlfcPJGHmV5IHr2FlQByI+QK
         ALKw9biucn6UflQSoB+MX71yuLDF8vA3wq2ou0ZpHqf6oV9kmvkkgTknVYeg2zgUwH7p
         v9DkxaGHAwOR7QfsHvwifT8wIZXZiRVY5uggASO0fMPlOkVraupLbWAPv4JVQSf6Ez2F
         h/mUK8NFdw6jem9TP/YLtiaUDwUzhwcotMsOXw1YgV7963u/hKNDjpG7S1BGm2NVEdjY
         LFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613672; x=1752218472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ss38OfQK2BPStY8bJhweUCCLJplXw3xTcQ9jkhK3PpA=;
        b=EXtCp/LQFrpCVnY9GkPz+ySSDDy17fEa1AxIUa6W+5nPYwTqaIE4ptwS2375/Hw8oI
         1lWloPbNI6HrOOOBKHsOzfHJ0RhXoeTvxuIvRJ4SriASeYwYAUOH6pzC+zcwicnD4PJB
         bgvzF5Wr/UCh3EeCID3xvQDKAXRNse3VuQr6aNbQgO2HcZ38xJZxbWzIXOmzrQC6KtWP
         QEOrYAIzLN1RsSgWvxcDCKzJ5P7HOuyMzelGrYYMTJVMZx3gh2a4HtCNm0gy6mCQsIEx
         TYXxXn0Ko9wCjxwrgUpTJzo8+Vl8VG3vWdlT47TVxJpQSVADfcM8kVT7lDPWw+/Pz4dQ
         7VRw==
X-Forwarded-Encrypted: i=1; AJvYcCU/nJZc3C4uK2PxMM6/KsTVmZsWsBw9jq69s3FTG5h7MUC+xEwBZfMYXfE4vo8vD4XAby7s9MYKEpu9wRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWnp1xmowtS/c2waBTi6gmgC/K/Med+ISrVH6HI4gJOe0C74qO
	G9UdC8bJqd2nNIa7rs+bM0BUIJ9ds+zT7PaKTuCY+d+TCrtHrHp1zyfDkoGa9orqfB9sKSd/Iqa
	M5hflrsg3qdOI4+CyQ9ImoFsEb1spmNe4qYSzhwzHjg==
X-Gm-Gg: ASbGncse3gozbRiW9xaQeV8Q63lfSyfxkgtGlwmWg64kgr6dtDcPJMR4V2wsJBnu0fw
	BF6uwMRYReMZJhZn9ECoxzxqT3zgAgUm7DjnUfN0lw39MzNjmoHv78bl2K2VyjbUtE4DhpT8PWI
	l4WiaVFHRHbysIcPUpPWbY4RsVqX0LDZomzHdxLjsmQH2C
X-Google-Smtp-Source: AGHT+IE8DLRDqSYLUcqchsHETOkTegf53IGv8dAwdZVbETPpZ0K8svFgBs92AbIFlCbZ+IJgkQazmLSfqkTSvGsT5OU=
X-Received: by 2002:a05:6512:3984:b0:553:2a16:2513 with SMTP id
 2adb3069b0e04-556e6e31588mr402529e87.47.1751613672223; Fri, 04 Jul 2025
 00:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com> <20250704070356.1683992-6-apatel@ventanamicro.com>
In-Reply-To: <20250704070356.1683992-6-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 4 Jul 2025 12:50:59 +0530
X-Gm-Features: Ac12FXxBYrwMwLh2b63UTR1FF-vZ-WGXFQQu9oCdF8nHTC5uuKvhl5UMFA9rxMI
Message-ID: <CAK9=C2VRtig5BUBbcriA7gkA8RAMKYiOJ0fYsz=VkNY4OeBMEQ@mail.gmail.com>
Subject: Re: [PATCH v8 05/24] mailbox: Allow controller specific mapping using fwnode
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 12:35=E2=80=AFPM Anup Patel <apatel@ventanamicro.com=
> wrote:
>
> Introduce optional fw_node() callback which allows a mailbox controller
> driver to provide controller specific mapping using fwnode.
>
> The Linux OF framework already implements fwnode operations for the
> Linux DD framework so the fw_xlate() callback works fine with device
> tree as well.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

I missed adding Andy's Reviewed-by here which I will do in the
next revision.

Regards,
Anup

> ---
>  drivers/mailbox/mailbox.c          | 65 ++++++++++++++++++------------
>  include/linux/mailbox_controller.h |  3 ++
>  2 files changed, 43 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 5cd8ae222073..2acc6ec229a4 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/spinlock.h>
>
>  #include "mailbox.h"
> @@ -383,34 +384,56 @@ EXPORT_SYMBOL_GPL(mbox_bind_client);
>   */
>  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index=
)
>  {
> -       struct device *dev =3D cl->dev;
> +       struct fwnode_reference_args fwspec;
> +       struct fwnode_handle *fwnode;
>         struct mbox_controller *mbox;
>         struct of_phandle_args spec;
>         struct mbox_chan *chan;
> +       struct device *dev;
> +       unsigned int i;
>         int ret;
>
> -       if (!dev || !dev->of_node) {
> -               pr_debug("%s: No owner device node\n", __func__);
> +       dev =3D cl->dev;
> +       if (!dev) {
> +               pr_debug("No owner device\n");
>                 return ERR_PTR(-ENODEV);
>         }
>
> -       ret =3D of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox=
-cells",
> -                                        index, &spec);
> +       fwnode =3D dev_fwnode(dev);
> +       if (!fwnode) {
> +               dev_dbg(dev, "No owner fwnode\n");
> +               return ERR_PTR(-ENODEV);
> +       }
> +
> +       ret =3D fwnode_property_get_reference_args(fwnode, "mboxes", "#mb=
ox-cells",
> +                                                0, index, &fwspec);
>         if (ret) {
> -               dev_err(dev, "%s: can't parse \"mboxes\" property\n", __f=
unc__);
> +               dev_err(dev, "%s: can't parse \"%s\" property\n", __func_=
_, "mboxes");
>                 return ERR_PTR(ret);
>         }
>
> +       spec.np =3D to_of_node(fwspec.fwnode);
> +       spec.args_count =3D fwspec.nargs;
> +       for (i =3D 0; i < spec.args_count; i++)
> +               spec.args[i] =3D fwspec.args[i];
> +
>         scoped_guard(mutex, &con_mutex) {
>                 chan =3D ERR_PTR(-EPROBE_DEFER);
> -               list_for_each_entry(mbox, &mbox_cons, node)
> -                       if (mbox->dev->of_node =3D=3D spec.np) {
> -                               chan =3D mbox->of_xlate(mbox, &spec);
> -                               if (!IS_ERR(chan))
> -                                       break;
> +               list_for_each_entry(mbox, &mbox_cons, node) {
> +                       if (device_match_fwnode(mbox->dev, fwspec.fwnode)=
) {
> +                               if (mbox->fw_xlate) {
> +                                       chan =3D mbox->fw_xlate(mbox, &fw=
spec);
> +                                       if (!IS_ERR(chan))
> +                                               break;
> +                               } else if (mbox->of_xlate) {
> +                                       chan =3D mbox->of_xlate(mbox, &sp=
ec);
> +                                       if (!IS_ERR(chan))
> +                                               break;
> +                               }
>                         }
> +               }
>
> -               of_node_put(spec.np);
> +               fwnode_handle_put(fwspec.fwnode);
>
>                 if (IS_ERR(chan))
>                         return chan;
> @@ -427,15 +450,8 @@ EXPORT_SYMBOL_GPL(mbox_request_channel);
>  struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
>                                               const char *name)
>  {
> -       struct device_node *np =3D cl->dev->of_node;
> -       int index;
> -
> -       if (!np) {
> -               dev_err(cl->dev, "%s() currently only supports DT\n", __f=
unc__);
> -               return ERR_PTR(-EINVAL);
> -       }
> +       int index =3D device_property_match_string(cl->dev, "mbox-names",=
 name);
>
> -       index =3D of_property_match_string(np, "mbox-names", name);
>         if (index < 0) {
>                 dev_err(cl->dev, "%s() could not locate channel named \"%=
s\"\n",
>                         __func__, name);
> @@ -470,9 +486,8 @@ void mbox_free_channel(struct mbox_chan *chan)
>  }
>  EXPORT_SYMBOL_GPL(mbox_free_channel);
>
> -static struct mbox_chan *
> -of_mbox_index_xlate(struct mbox_controller *mbox,
> -                   const struct of_phandle_args *sp)
> +static struct mbox_chan *fw_mbox_index_xlate(struct mbox_controller *mbo=
x,
> +                                            const struct fwnode_referenc=
e_args *sp)
>  {
>         int ind =3D sp->args[0];
>
> @@ -523,8 +538,8 @@ int mbox_controller_register(struct mbox_controller *=
mbox)
>                 spin_lock_init(&chan->lock);
>         }
>
> -       if (!mbox->of_xlate)
> -               mbox->of_xlate =3D of_mbox_index_xlate;
> +       if (!mbox->fw_xlate && !mbox->of_xlate)
> +               mbox->fw_xlate =3D fw_mbox_index_xlate;
>
>         scoped_guard(mutex, &con_mutex)
>                 list_add_tail(&mbox->node, &mbox_cons);
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index ad01c4082358..80a427c7ca29 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -66,6 +66,7 @@ struct mbox_chan_ops {
>   *                     no interrupt rises. Ignored if 'txdone_irq' is se=
t.
>   * @txpoll_period:     If 'txdone_poll' is in effect, the API polls for
>   *                     last TX's status after these many millisecs
> + * @fw_xlate:          Controller driver specific mapping of channel via=
 fwnode
>   * @of_xlate:          Controller driver specific mapping of channel via=
 DT
>   * @poll_hrt:          API private. hrtimer used to poll for TXDONE on a=
ll
>   *                     channels.
> @@ -79,6 +80,8 @@ struct mbox_controller {
>         bool txdone_irq;
>         bool txdone_poll;
>         unsigned txpoll_period;
> +       struct mbox_chan *(*fw_xlate)(struct mbox_controller *mbox,
> +                                     const struct fwnode_reference_args =
*sp);
>         struct mbox_chan *(*of_xlate)(struct mbox_controller *mbox,
>                                       const struct of_phandle_args *sp);
>         /* Internal to API */
> --
> 2.43.0
>
