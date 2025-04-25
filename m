Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575324A06E;
	Fri, 25 Apr 2025 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583302; cv=none; b=UUV2n8xKx+C0muTIkRHosrkTe2tOvEuMJP8wa+jmM6zeYbBsXdudwluSaB9+sav1hDc32ZTeX3uLPK9D1dDX9Jm1pVjgDOIciEZ0gBJ9vZ0tducvpc6+hhIZbjQk8k2B/Ng8hfpa0ht6uXEvPdmyzxlhnyQM+BVfKG/4zY7EAgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583302; c=relaxed/simple;
	bh=VISaaN5/oynVwYe1Pa2J3mm8H2AZefhGvlffDYM1Tdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkgcgfY+QFM++vBgMooPs/U0Ft3WpdtXp7mzpduz/NJmLUhpTlFa//vEUMFsDGnIFFhMyTB7URtLW9g+LY5+AH8rEb8ZTSk7abZHuX57+omlv2Iy/gzwvkI5nJnkwL86Ox1RmVL3I6hQ/WJw/MkvZ2dk8TQOG46eXTD953MB8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoOLsXKe; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoOLsXKe"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4772f48f516so36160821cf.1;
        Fri, 25 Apr 2025 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745583299; x=1746188099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xu08WpWbP9VRkJIe5+B7WyB4NPIRhaxkc0XM7hm0jVU=;
        b=JoOLsXKes9V4YvYAXe3qNNscuVsHahmdymD6Q35Fylo6q2K4ikJ8uixUSkkHGvkTNq
         LwDrThwwdij1rDaUv9jYyN5BMuJziaQZS7KjgtzCmGW1CCZ96DFbmOm0IwnjJT2KxPkL
         b/j7Hm0uWnYG9WUHuKUg+bOR/HSw/HeIipavKuiDvHY/nnOzZ5Ql3Z5gU2LevCU1zzDB
         s3qZwbooSa/b4mkvlCAeItxhbj2wGM0pMIyfhobt9oMu/Jj4m8u8lgTV8PG6X6ZhMN/f
         2fr8/NQqJ5k16mpkZObOEQhRSTs6ib1f1NG6oPOEmYZAYEvjG+fXCu8RGy/ijpeacUdR
         kFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583299; x=1746188099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu08WpWbP9VRkJIe5+B7WyB4NPIRhaxkc0XM7hm0jVU=;
        b=IpAzz14hpuFbq1KxhzfeketZUTESkuVsIqHgQR1o2BiouWsb/1UpbVuCdeOKbVioPt
         WlNiSb/1sE8Sp8aViGned1gH1dOOCWcH1fGT7HZIgku6ajVwEpPqkIOsZOIwE0uptGFC
         jhr0W8j4kMxxtnm6ZwhErBQVCTC5OIhae0uhAtCw55x74QVaQLHNqzZN5ioOYgWSshSC
         yTvwjt+KLktmOK9s08Zuanh7080S+M0qR3nLio+yAm4uUa2xS6EQ8RC3IQvjanxXJ06Z
         Nn8KOQ9DZ7pF0ZCEhWmn+xzcf8bEZZsWFpP77nhx5+kkZFnl/j4DbJmSlXHEgldIjwmz
         Ia6A==
X-Forwarded-Encrypted: i=1; AJvYcCUVIJmp/caUDV+e0XwsZcqjI9NyCxihJyzUI1COXnwTTVhHAVhMrf4jxYX4AA3btPVDgZCj7RElBuve@vger.kernel.org, AJvYcCX5zStiqYxQHrOPthjXIABOv2OrtHBRpRxft+IKuEWJ89Dvf5NFQKxTs5DPgXekhBqk6H+PclbS2It4pXQc@vger.kernel.org
X-Gm-Message-State: AOJu0YwK7ARR/DV0djIbwVex/7V2MLyv8WQD3/Mnrbsj/Jq0eSs0tRp+
	3tCr9kNQytMGnccJk6xEnpoTi1FXBFASYWtgBB+8ruu//ST3ABtxxTM2LitH4hnOC3abqvlkV0G
	Wal7KWs+C/xy74amu6HFIjYN3b/I=
X-Gm-Gg: ASbGnctQWsHAB066GveqH7xMJnId6hF7+VNnok+Chigl7hz74GTVna3J+LDuIhuPWHy
	Oj2BUCXUZ5C/Q0yJlwGrh7UvKO7B9z3jQvuNKTxh6a+tHTkBEGOvuaK06ZEvfUzyDMIKgV9Ol7l
	U705XiccTtN2TE7yPkCAI7kXqwCNwyW6OE+FyxP1xz7TALJUeF7pc+EA==
X-Google-Smtp-Source: AGHT+IGalm45BLBaTkyJlEQ78yqfTdEaLzyEHrABmorXnt1Rm8owTSj9BrL3OmFlL2yuC97CUZHOtQdTyCPwtz+wv2g=
X-Received: by 2002:ac8:5f8a:0:b0:477:1dd7:af94 with SMTP id
 d75a77b69052e-4802d4d0fd8mr29566751cf.2.1745583299424; Fri, 25 Apr 2025
 05:14:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
 <20250423-wmt-soc-driver-v1-2-bd8bf32521c2@gmail.com> <c38b3dde-f4ea-4812-a673-137d4727aefc@kernel.org>
In-Reply-To: <c38b3dde-f4ea-4812-a673-137d4727aefc@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 25 Apr 2025 16:15:10 +0400
X-Gm-Features: ATxdqUFHg9dv2l091sWsrUupQVwQJ3q1a0X28XX0Jmt0SiDYrD-xa8cWrKC2sFo
Message-ID: <CABjd4YzQVQD1PCh3fUOzy_cwhd4j6q_N6zvb=kY4gFt-bn1Psg@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: Add VIA/WonderMedia SoC identification driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 2:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/04/2025 21:18, Alexey Charkov wrote:
> > Add a small SOC bus driver to parse the chip ID and revision made
> > available on VIA/WonderMedia SoCs via their system configuration
> > controller's SCC_ID register.
>
>
> ...
>
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/sys_soc.h>
> > +
> > +static struct {
>
> I think const by convention is placed here - right after static. It
> should be equivalent, just convention.

Makes sense, thank you. Will adjust in v2.

> > +     const char *name;
> > +     const unsigned long id;
> > +} const chip_id_table[] =3D {
> > +     /* VIA */
> > +     { "VT8420", 0x3300 },
> > +     { "VT8430", 0x3357 },
> > +     { "VT8500", 0x3400 },
> > +
> > +     /* WonderMedia */
> > +     { "WM8425", 0x3429 },
> > +     { "WM8435", 0x3437 },
> > +     { "WM8440", 0x3451 },
> > +     { "WM8505", 0x3426 },
> > +     { "WM8650", 0x3465 },
> > +     { "WM8750", 0x3445 },
> > +     { "WM8850", 0x3481 },
> > +     { "WM8880", 0x3498 },
> > +};
> > +
> > +static const char *sccid_to_name(unsigned long sccid)
> > +{
> > +     unsigned long id =3D sccid >> 16;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0 ; i < ARRAY_SIZE(chip_id_table) ; ++i) {
> > +             if (chip_id_table[i].id =3D=3D id)
> > +                     return chip_id_table[i].name;
> > +     }
> > +
> > +     return "Unknown";
> > +}
> > +
> > +static const char *sccid_to_rev(unsigned long sccid)
> > +{
> > +     char letter, digit;
> > +
> > +     letter =3D (sccid >> 8) & 0xf;
> > +     letter =3D (letter - 1) + 'A';
> > +
> > +     digit =3D sccid & 0xff;
> > +     digit =3D (digit - 1) + '0';
> > +
> > +     return kasprintf(GFP_KERNEL, "%c%c", letter, digit);
> > +}
> > +
> > +static int __init wmt_socinfo_init(void)
> > +{
> > +     struct soc_device_attribute *attrs;
> > +     struct soc_device *soc_dev;
> > +     struct device_node *np;
> > +     void __iomem *reg;
> > +     unsigned long sccid;
> > +     const char *machine =3D NULL;
> > +
> > +     np =3D of_find_compatible_node(NULL, NULL, "via,scc-id");
> > +     if (!of_device_is_available(np)) {
> > +             of_node_put(np);
> > +             return -ENODEV;
> > +     }
> > +
> > +     reg =3D of_iomap(np, 0);
>
> of_node_put(np) here... although this will be dropped (see below)
>
>
> > +     if (!reg) {
> > +             of_node_put(np);
> > +             return -ENODEV;
> > +     }
> > +     sccid =3D readl(reg);
> > +     iounmap(reg);
> > +
> > +     attrs =3D kzalloc(sizeof(*attrs), GFP_KERNEL);
> > +     if (!attrs)
> > +             return -ENODEV;
> > +
> > +     /*
> > +      * Machine: VIA APC Rock
> > +      * Family: WM8850
> > +      * Revision: A2
> > +      * SoC ID: raw silicon revision id (0x34810103)
> > +      */
> > +
> > +     np =3D of_find_node_by_path("/");
> > +     of_property_read_string(np, "model", &machine);
> > +     if (machine)
> > +             attrs->machine =3D kstrdup(machine, GFP_KERNEL);
> > +     of_node_put(np);
> > +
> > +     attrs->family =3D sccid_to_name(sccid);
> > +     attrs->revision =3D sccid_to_rev(sccid);
> > +     attrs->soc_id =3D kasprintf(GFP_KERNEL, "%08lx", sccid);
> > +
> > +     soc_dev =3D soc_device_register(attrs);
> > +     if (IS_ERR(soc_dev)) {
> > +             kfree(attrs->machine);
> > +             kfree(attrs->soc_id);
> > +             kfree(attrs->revision);
> > +             kfree(attrs);
> > +             return PTR_ERR(soc_dev);
> > +     }
> > +
> > +     pr_info("VIA/WonderMedia %s rev %s (%s)\n",
> > +                     attrs->family,
> > +                     attrs->revision,
> > +                     attrs->soc_id);
> > +
> > +     return 0;
> > +}
> > +early_initcall(wmt_socinfo_init);
>
> No, this does not scale. This is supposed to be module_platform_driver
> instead of manually re-ordering code. Then all your memory allocations
> become devm, printks become dev_xxx and you can simplify it.

Fair enough. Will convert into a platform driver and use managed
functions. Thanks for pointing this out!

Best regards,
Alexey
