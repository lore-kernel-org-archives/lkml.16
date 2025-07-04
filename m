Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C42F272C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623887; cv=none; b=YulRMGbkQsRudMzahPpTk3QNBP4xIAhCxLVe3wiymKN2N8y7/5OkmUpL3GXUi7POep+IXVMHdPMIDHZH2IbMqheXxzg8fqZ4eKr3OVR7IkWj1WNieqC8/y5DSIxi9F/dKxpTO2+jt2w/hb6lt8mDe0jceGi218IV3NxdYj2jaf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623887; c=relaxed/simple;
	bh=ZJfiMH6yrhrW4z13OYY/q+7njP7HRfoaeaZaIxvoLsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHkt76M+tUXlX4gtOEXmNIuJnKC71AlcF4C8wn6+sKFEgiP1KIR1sRvrmEICWXEwRRdOrzElZx0Url/gcTkZBrGAFD9ltzvo6BgdEMrS0S/RIU1tvvcP3CbBjcCQEzoIjDIOvRx6u7LUN2iIdw3Q/K4bpzpNX8es6BhBMt6hTJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=NlfZj2fr; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="NlfZj2fr"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553dceb345eso973133e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751623884; x=1752228684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThnYue16skpDKY73i8RkpzoMae/+gmhFicLx/ccew8c=;
        b=NlfZj2frJ0MoI/3h7QveKv3Y0EgzXgLQw8j2Ge+Wo0BaXCzdjZufQmSA/ijuVDP9gi
         gJz4g/4zLumrGQqytWbXxeWHMEK0gbxZzTnKz0n7dciwIIWnDBRKLTHvXypSBwF4d9i1
         nzIqaSMslKbZh3agm9XKrIDh4JTKzk2qwzddiGAXIXGtyp7+cqPObMq3H+2oSMRCLEJG
         JeqMmMdhVRY0YOqnhqCkiV5Ho1k8WTQduCIqx5tuK/tX66Mi0GDGRrjdo0KTeBKK6VPa
         6dJSqsdmSoDN5QvRnopc0iXMyN3DGNdd08Za0D5A0OiMXr1MFTIDRjxVmRZAXd/GPNJZ
         N2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623884; x=1752228684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThnYue16skpDKY73i8RkpzoMae/+gmhFicLx/ccew8c=;
        b=X6EakB29IrW5kpLiGgBKDcK32Fwh55+dUiy4lAuG5dcGZ4NMiuNFBvPXh1MdzYJNOE
         KwcMDjSzaGNrchNdSbYdAkUiNl0p3yEGsGqspCZgM93FuZO2mWBwIQdqIGHyX+pz3iU2
         3MrzjAT6avoJHTySfUQ2YujAiejEZHczm4a6CJxAW324hW+BpydxpEzdpyQ5zrRRGi/b
         6Hy8CS7+2H1iLnRb2ljSwCYBdrxzqEADb8ds8UKVly56hZFj6zygQWSVOiseP/w2piSV
         MHgv+o1POSfi2h3ufFlTzZdEjD0IMruE+IGMe4WNsUZ8E3viAa3M5eRq0qE1PfJOgNPC
         kSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW8ofMXRNR21DXoBg07nvcG5v8SZfq88+Ju50BPC2i34OQNMhrVWqppnLhOY/8Ao8qy0K78Sz0NkACNt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz98/4Xp7nUyAgjb744YgeNAg/TtGp3ZCQ0VeyQD3KgTVrBWkLR
	vsJ+0juMvhRKycSnbXQU4GSIRvpIBdlRz/bp1iz+KKPN8JwxMRiszJAOLBsq5zeXURp617eOeyr
	SWIARIPQSa1Qlb7tOdXQSwd28AFfN9gJY1xp9paKLUQ==
X-Gm-Gg: ASbGncsHfXwpE7ON69SKXJqyGGpHQB+Zx21d2o/lBXViUB+RR02PedBFt150IUWJMDg
	yWEBJ1FQub8tm2Pnz6ItrCiOI9mdS9omhqIUEcayT5WoU6qkYs9qNBznTyoB9Ouncni/hgsma4F
	kIKpeeG50EKVgGceOGLk9dSgcTxHlghdzkL9FBsIDrYlw/Py8n1WpiWsY=
X-Google-Smtp-Source: AGHT+IFYm/wR4jTRlbIDDwF6FIxEmPbVXFWiC29PN2h5l87b4kSraGLAGzH7R/iggEXemYKU5MQvLCtTcORv1zFuOus=
X-Received: by 2002:a05:6512:3c94:b0:553:291f:92d with SMTP id
 2adb3069b0e04-556e617c939mr532276e87.57.1751623883637; Fri, 04 Jul 2025
 03:11:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704070356.1683992-1-apatel@ventanamicro.com> <20250704-attractive-sawfly-of-artistry-1c86a3@krzk-bin>
In-Reply-To: <20250704-attractive-sawfly-of-artistry-1c86a3@krzk-bin>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 4 Jul 2025 15:41:11 +0530
X-Gm-Features: Ac12FXzuBcUQShERIhU7sx8yxPVr9NpYbWLk5Qb0GVfeL-KIfhtDK6Kn6d-Jp8I
Message-ID: <CAK9=C2Xt5r0Vjw916U7hV7jR1iRwfaLpvhLYTLmWec_p_1pziw@mail.gmail.com>
Subject: Re: [PATCH v8 00/24] Linux SBI MPXY and RPMI drivers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 1:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Fri, Jul 04, 2025 at 12:33:32PM +0530, Anup Patel wrote:
> > The SBI v3.0 (MPXY extension) [1] and RPMI v1.0 [2] specifications
> > are frozen and finished public review at the RISC-V International.
> >
> > Currently, most of the RPMI and MPXY drivers are in OpenSBI whereas
> > Linux only has SBI MPXY mailbox controller driver, RPMI clock driver
> > and RPMI system MSI driver This series also includes ACPI support
> > for SBI MPXY mailbox controller and RPMI system MSI drivers.
> >
> > These patches can be found in the riscv_sbi_mpxy_mailbox_v8 branch
> > at: https://github.com/avpatel/linux.git
> >
> > To test these patches, boot Linux on "virt,rpmi=3Don,aia=3Daplic-imsic"
> > machine with OpenSBI and QEMU from the dev-upstream branch at:
> > https://github.com/ventanamicro/opensbi.git
> > https://github.com/ventanamicro/qemu.git
> >
> > [1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> > [2] https://github.com/riscv-non-isa/riscv-rpmi/releases
> >
> > Changes since v7:
> >  - Addressed comments on PATCH3, PATCH7, PATCH10, PATCH14, and PATCH21
>
> Which comments? What exactly did you change? Provide in-patch changelogs
> explaining this, because what you wrote is way too vague.
>

Apologies for being a bit lazy here. Most changes are pretty straight forwa=
rd
except the improvements in PATCH14. More detailed change log is below ...

Changes since v7:
 - Addressed enum related nits in PATCH3
   (Refer, https://lore.kernel.org/all/CAK9=3DC2VxhC6soxHtmacedbeCU=3DrFi84=
Br1RvN2uPcBKoLhRaJw@mail.gmail.com/)
 - Addressed comments in PATCH7 as follows:
   - Added minmax.h to includes
   - Removed "rc" variable from mpxy_mbox_send_rpmi_data()
   - Removed alignment and other checks from mpxy_mbox_peek_rpmi_data()
   - Created separate function to restrict scope of channel_ids used
in mpxy_mbox_probe()
   (Refer, https://lore.kernel.org/all/CAK9=3DC2Ume2CmBYHYob7HSJHu=3DZdfdWM=
+4JYPgFJ9Hir5Oi8cOg@mail.gmail.com/)
 - Improved comments for struct rpmi_clk_rates in PATCH10
   (Refer, https://lore.kernel.org/all/CAK9=3DC2VfvsbFTjecQm0OSsssXbff7wC4f=
qWf3CTmnpWSiaLcBw@mail.gmail.com/)
 - Improved refactoring of acpi_fwnode_get_reference_args() in PATCH14
   (Refer, https://lore.kernel.org/all/20250702051345.1460497-15-apatel@ven=
tanamicro.com/)
 - Improve nargs_count parsing in acpi_fwnode_get_reference_args() for PATC=
H15
   (Refer, https://lore.kernel.org/all/20250702051345.1460497-16-apatel@ven=
tanamicro.com/)
 - Added more comments describing why need to explicitly set device
MSI domain in PATCH21
   (Refer, https://lore.kernel.org/all/aGaUmpw1pVWNAmpb@smile.fi.intel.com/=
)

Regards,
Anup
