Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAA1EF394;
	Mon, 23 Jun 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674021; cv=none; b=Qc9F45WoE0Bqj/9COJTZ++So1Rr0XIxG1eQfleHJ2p2KCLqnvZxL8B/j8ZvIDn4ddJXkPibOA51s5iBQtvmujvSCoxGzebUT2IpJeeGmnEY+3KjhyES9MyZJY8KeKyaAMvkFdi6ZgIuG1d1Xj1u5N5elXz3DlkU52ql5t5zGm2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674021; c=relaxed/simple;
	bh=prOAbia71XOTgGudPMVx0Rcz5wZJl6YGFxom8jlzCYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ClU2nUzgE+zw0gwKaPWEpyhZk+0nJ01d9iHqZRQ8CLbG56QDu2US0sE2mzBkI5dtg8i2HYsuqwkHLtkfbXqI09eF9tVBYFtg43PUh1LqwkYRPhSkxqXQVAgMUPEez7JHA1gOcF5VbKuy+R/zjcyevOOaFVk5GobQxU0/ydkuuOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuF9oBa6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuF9oBa6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4340C4CEEA;
	Mon, 23 Jun 2025 10:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750674020;
	bh=prOAbia71XOTgGudPMVx0Rcz5wZJl6YGFxom8jlzCYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JuF9oBa6Afwk1Duy/cL3d0w+NKUqCONwa9cmTcb4bxwcTLpyL1l5DsXDYhsaeQgfo
	 CEiJhAXmJKPUSdkuJjOpWy6XY77QFnfFmopKfez8+Oehhl+KDqtWvepZCe+bYIcvk6
	 iKg41Bn/lHUZL80f/I62hJk/r4ionxua2injEN2obw3qsMmpbRAeVSyK0iSd3eTmos
	 sCNlkFzQ1IdYRSj8RImEs0RxR27ojin+HJPccABzre83TZzo8JllsXaLpqe5sR9Drg
	 Z0oGNcXM+WtFEs419ayMYf48IyRP7ZT0f7sJsS27MNOAafLdA+2F1236AdzdYm5QtP
	 nEqfLKxqtbajQ==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-60eefb805a4so419147eaf.2;
        Mon, 23 Jun 2025 03:20:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0SnzvBIZUPS/1gDPWcEq+L/3uTvXE+IVAmX3X/MMRR1InezlvdwkQSuVjX+P5WODHmcVaI8O45v+INp5+@vger.kernel.org, AJvYcCUe+uYpXr03JX0P68zkCjM+xtJ39aRVUgQK9b1L+hzNKhlnT5HJ+RyCzTk4Gxv2MQOFxN2sudM811Xg@vger.kernel.org, AJvYcCVX+BRNzugRySOwe2iret7Pli5BZL2o1nLq4h+WRYb46TTzBZphSamPBoIeMhdliX01r5nvRQIYcs/r@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5w4RAPhvzBoki6MwLAb58hLUz2eoVRc5EK+SkKERWRVfLXh2o
	oraNmtqbGPwOUW+sQJuWz/EWysdDxTvFEUlKemeTv0ImX4seG4iV/3GHI0HrTVUpMQMCHPtZ1dQ
	UrEwc7jUMfCySJPLRq2ZPW4souQMwkVQ=
X-Google-Smtp-Source: AGHT+IEri0Ei3Dwzz6H8TNwA8rGJX2q5j17F8+tFzd6CGT1JN8YEpn3ieZGNEirgnOf1LEjld67SQ5gYMP0WkKFEbCU=
X-Received: by 2002:a05:6820:308e:b0:610:dff3:425a with SMTP id
 006d021491bc7-6115babab7dmr8233773eaf.4.1750674019869; Mon, 23 Jun 2025
 03:20:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-14-apatel@ventanamicro.com> <aFkZj2QCU2LfTI30@smile.fi.intel.com>
In-Reply-To: <aFkZj2QCU2LfTI30@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Jun 2025 12:20:03 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j9gQE-=HQnzdfATuoYUm8xwKfhm8tR6tUCEZBQ4F9qNQ@mail.gmail.com>
X-Gm-Features: AX0GCFtTCu8RzoqPycmcUo_v8Lu1ClT5rvTpT_yMP45KXqQPNHoS6bspZg_HntU
Message-ID: <CAJZ5v0j9gQE-=HQnzdfATuoYUm8xwKfhm8tR6tUCEZBQ4F9qNQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
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
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:08=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 18, 2025 at 05:43:48PM +0530, Anup Patel wrote:
> >
> > Currently acpi_fwnode_get_reference_args() calls the public function
> > __acpi_node_get_property_reference() which ignores the nargs_prop
> > parameter. To fix this, make __acpi_node_get_property_reference() to
> > call the static acpi_fwnode_get_reference() so that callers of
> > fwnode_get_reference_args() can still pass a valid property name to
> > fetch the number of arguments.
>
> Looks okay to me, but I think it's better to have more eyes here (Mika,
> Rafael?).

It would help if this were CCed to linux-acpi, but yeah.
