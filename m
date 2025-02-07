Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CAD1624C7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937906; cv=none; b=jhoWEIeHXwLd1/HwZ5+wQXa8Cwpz/rd1maRQzWpEqWynmjcXdks1+b8NycHX7UKwxKu3tAo5bm6+nD9SJMrVsPmK91eJEjtUewLnRUtc+aQf+Sd7ahEpF+2Iz+b1nXxhLIYprb00Mb5ZH73ASLnGAOVcnHjffEyvVY4+wbwLRiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937906; c=relaxed/simple;
	bh=zOMJPCTc26Rn5Cm/F0Re6miw0OFh4ZID0ENq6opFQgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/27EkfFX71pECn+bP8KWyDLOZLxLDnbreGLJyk6pMsN3iKv2oZJmozzZe3+4jI9Am56I2c2ErTaG3eBg1mla/kOvFCiKXJ4kQ2p44VvK9cbetUrRjPwizH/Sp9oRwgLsyQDj8BzGr5exfKAM4TXh3XyHIn3284KRSE4zd8CAuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=d+ivE/Ct; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="d+ivE/Ct"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467918c360aso25356191cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738937903; x=1739542703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fevgwhgyV9gfS8zQNSGcQtEepk5of5A5Wo+7b+adVSo=;
        b=d+ivE/CtVQyJ+8o4mFzHibI2GP1XJ/dbmzdiyliJWq3gfNmvuQAGbkXNzQqrXtkKND
         nv3jY0pRL4vxmfh0GUv9i4FnvtVSKdQDHgwmvwdpaa21O9ybmnoJWB9MdpyLwrkdY20P
         HNOzDtQ8WZu74HI2Ol2o02eoc1b70n/8J7m3FTg/+2wNOzHbPpjJRl1ygsbD/u9Rlgkr
         tESpwZw5jwNHvfc3Ny0lQGVMTGfhcH5iN7hE6MkXzg0Jn64E2HownOz3JISkpGdX6Q29
         3zEGxEWcZs/C462BGC92aBf81CkaErGOTLNS/MBqJNY8MVNtyc2PG7kWIFfQiJDcYvXc
         o2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937903; x=1739542703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fevgwhgyV9gfS8zQNSGcQtEepk5of5A5Wo+7b+adVSo=;
        b=Li3SHmVPtgh5ENvSU77MHbslOpmstWzIZjRMVEvo20Qo/uCrcVL6hst//oS6DqhHhp
         pSGGCIlAQ4H7cDP7gRUJIaCssUxA8RAgaOdmV9IhR08VigHap+8LG6fnd/D2YgtX3Fh8
         1i3KSmfnSol8/i6KwfwvMgKadcctGh714Po2vwRivg97WdnhMnxAPJalF8tX8Prhg7Ax
         U/zYFKcQ5/BZIfUCVmvULsGPSJ8UULcugWoz64oxv+L+b2RzaIt5ArCUmSveJYGvThUn
         j1TD425ruhbb0KJQOefSE3PDyTijQQytSqYaSn/4SziLhzjeb3orgz6mQcXcdhv51H7Y
         iidw==
X-Forwarded-Encrypted: i=1; AJvYcCUmRfQXOQ0jge3CYBBegWi8IFHqNNGSSix6Syc/DMtAK6jO879cxU/tW0RroMJyeP+yHguW5GHE5/8L7t4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww5pwB2GAg4qbRc+FaVA61G66kcAJvEdMMAk2ge712DKA7KX7Y
	RYykFDfRnjOGmTxJPX7w78ZVZ4nlHIbHoJ0uEIaHSNzM5y0J3M4Cipx1gkXqpKT+mBYWsaHlCft
	ugFnfOeeNWwwSlMnYGgpPE6FgEMTSUyMwUUGahA==
X-Gm-Gg: ASbGncvifBjowZY3fAktDVCHqI3qDyu6PNyVWQQAdWlVcY64ICxJJtI2kd/q+ddNin9
	zlNsfxDi+isnaFM47hhXgk9MokExzNV+IEq/sw7tkP5K+r9R91HGvzFB8yYpltENagpESffe3AT
	BYf7v/fa8n3D8EYrQabVp0jvzg8zCNtA==
X-Google-Smtp-Source: AGHT+IEMuvtJCaVWONG8YOiZdpcu/58psXHaP5dFOxnt/g7885Ktc6/fh5sL0G1K7fzdefg2eKdTQn9NCttx7uuGqik=
X-Received: by 2002:a05:622a:20d:b0:467:6cce:44ba with SMTP id
 d75a77b69052e-47167c10654mr48359551cf.43.1738937903454; Fri, 07 Feb 2025
 06:18:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206131926.91289-1-qirui.001@bytedance.com>
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Fri, 7 Feb 2025 19:48:12 +0530
X-Gm-Features: AWEUYZmc9eQPJGwXZsBpVC-3iGr2zbfZs0_g04Yayqq7sIoEU3apQ_8van-Z1HQ
Message-ID: <CAPd4WexHLCv0rHKJxHn=PkzG87HYR7492x2pK1swuA-8aeUmmw@mail.gmail.com>
Subject: Re: [RFC 0/5] riscv: initial support for Generic Hardware Error
 Source (GHES)
To: Rui Qi <qirui.001@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ardb@kernel.org, haibo1.xu@intel.com, guohanjun@huawei.com, 
	sunilvl@ventanamicro.com, samuel.holland@sifive.com, parri.andrea@gmail.com, 
	ericchancf@google.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	Anup Patel <apatel@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the previous email composed in HTML.

On Thu, Feb 6, 2025 at 6:52=E2=80=AFPM Rui Qi <qirui.001@bytedance.com> wro=
te:
>
> From: Rui Qi <qirui.001@bytedance.com>
>
> NOTE: Before compiling the kernel, enable ACPI, APEI and GHES in menuconf=
ig
> The following options must be enabled in .config file.
>    CONFIG_HAVE_ACPI_APEI=3Dy
>    CONFIG_ACPI_APEI=3Dy
>    CONFIG_ACPI_APEI_GHES=3Dy

Hi Rui Qi,

The RERI/RAS is already under active development. I have presented
RISC-V RAS software architecture in various RISC-V and RISE meetings.
You can listen to the RISE Recording (link below) of the software
architecture (presented on June 26, 2023).

https://zoom.us/rec/share/HVCY1QmKVhVa32qQiSIOc2OM3vgL9Vg5wlOFKZHGOuci8zBHV=
kigGNJuaiWEBlsL.vLYGlGyhQq26TCfU

I also posted an initial PoC for RERI emulation in Qemu and RAS
handling in Linux kernel  in 2023.
The details on initial PoC for RERI/RAS can be found in the links below:

Initial RERI/RAS PoC:
https://lists.riscv.org/g/tech-ras-eri/topic/reri_ras_poc_for_risc_v/102224=
101
RERI/RAS PoC update:
https://lists.riscv.org/g/tech-prs/topic/update_on_reri_ras_poc_for/1067371=
35

It is a comprehensive design which includes the proposition of highest
priority Supervisor Software Events(SSE).
The chapter 17 of the SBI specification is about the design of SSE.
Below is the link for the same.
OpenSBI: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v=
3.0-rc3/riscv-sbi.pdf

My patch set is waiting for release of SBI specification v3.0 which is
in rc3 right now and pending ECR changes
for processor type and ISA strings among other RISC-V specific changes in A=
CPI.

I will send my patches as the SBI specification v3.0 is released.
Meanwhile, I will send the RFC
patches for everyone.

Meanwhile please go through the proposed design.

Thanks
Regards
Himanshu

>
> Through fault injection, we can see the following example output
>
> [Hardware Error]: Hardware error from APEI Generic Hardware Error Source:=
 0
> [Hardware Error]: event severity info
> [Hardware Error]: Error 0, type: corrected
> [Hardware Error]:  section_type: memory error
> [Hardware Error]:   error_status: Storage error in DRAM memory (0x018d848=
0019304f0)
> [Hardware Error]:  node:0 card:0 module:0 rank:0 bank:0 device:0 row:0 co=
lumn:0
> [Hardware Error]:  error_type: 2, single-bit ECC
> [Hardware Error]: Error 1, type: corrected
> [Hardware Error]:  section_type: Flle error
> [Hardware Error]:  port_type: 4, root port
> [Hardware Error]:  version: 3.0
> [Hardware Error]:  command: 0x0146, status: 0x0011
> [Hardware Error]:  device_id: 0000:00:00,0
> [Hardware Error]:  slot: 0
> [Hardware Error]:  secondary_bus: 0x01
> [Hardware Error]:  vendor_id: 0x1e93, device_id: 0x1010
> [Hardware Error]:  class_code: 060400
> [Hardware Error]:  bridge: secondary_status: 0x0000, control: 0x0003
> [Hardware Error]:  aer_cor_status: 0x00001000, aer_cor_mask: 0x0000000
> [Hardware Error]:  aer_uncor_status: 0x00000000, aer_uncor_mask: 0x040000=
00
> [Hardware Error]:  aer_uncor_severity: 0x004e3030
> [Hardware Error]:  TLP Header: 000000000 000000000 0000000000000000
>
>
> Rui Qi (5):
>   riscv: select HAVE_ACPI_APEI
>   efi: add riscv APEI generic processor error printing support
>   riscv: add fix map index for GHES IRQ
>   RISC-V: ACPI: define arch_apei_get_mem_attribute
>   RISC-V: define ioremap_cache
>
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/acpi.h   | 18 ++++++++++++++++++
>  arch/riscv/include/asm/fixmap.h |  3 +++
>  arch/riscv/include/asm/io.h     |  5 +++++
>  drivers/firmware/efi/cper.c     |  4 ++++
>  5 files changed, 31 insertions(+)
>
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
