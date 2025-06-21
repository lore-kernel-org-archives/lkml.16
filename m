Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD76288CC
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750520546; cv=none; b=NFgF4ivG8P5GIle/WpVNRiaO3xD7J4IlENlHH2aPpjja+Z5Qb1HHdkbkwX/CVq7Znzd4qYyJihwPGOWXMz+I5PjX2pN4WJ8v9aDUZfSJCEhZgo7WQ6Am3yVCcjfk/qnf3ev9+/woC1+2agMNQoPY2dXQwulP2ail3PdECX+AlIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750520546; c=relaxed/simple;
	bh=Xr/UM44xfNVWN+nqycgJvhMyK92KfXG2//OD+BsMsGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VYMIXDZjzCR2fIoyYRVyliUZywxF6ZBTN8j4MRPIxxiShPVBxKXBn2iPIvsxaZz/qgNk/GGDCDIN8bhQjELnM6Y9RgORZGPfJgpV64sRDhD8wQ/CgBxHUtmUcxx3ypkhcDhQnQyutO21IecmuKSleRvzq8/y2JuHyoUSKsTu8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DZuoZrQy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qRpVT1Ez; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DZuoZrQy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qRpVT1Ez"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750520542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4i8scJlAGV+GpOYEKKV1KzgbXWXKbnRcAtdwbZvm+o=;
	b=DZuoZrQywZo0EWOkvlZ6JKShxNfBI3anJJsSF2LlOA6eey7KS5Ix8wFcpkZuxC/uwWdblX
	fSmnXB0Is9HURc/t2PsZSw8X0uNseZamH3EPrKEsxRQWEK4LNKFMBcRibffpZjRwb+3UFE
	v3dAWwA/7ffliEoymEbNogcswsrVM/4o6Qxth3HYnO4Te+69qBVXqSwrwCcqQ0ciSZ2sOC
	AZ/W3ZK56dXwazVHeRzW4CzUotkAsnyglnnPFhYvlZrfnA/gkvWXCn4xhPn7lpCnOFZiei
	QcgeoyP3b8BDJ2Pj4L3BTs4/mmTuTem8MYPzCx1SO2GRQfgSRz6VI+esqORTYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750520542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4i8scJlAGV+GpOYEKKV1KzgbXWXKbnRcAtdwbZvm+o=;
	b=qRpVT1Ez6I3Jig3Hq77jQ0ZnWSZC25OrI+fIwOXae+2eNk5uqx6Qnyya1ircIFNVxhf0Jj
	P2HAVkROxC6gJ+Cw==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Alexandre Ghiti
 <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
In-Reply-To: <20250612155635-ecade4e1-0235-464a-bcb3-293f7452510a@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
 <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
 <20250612155635-ecade4e1-0235-464a-bcb3-293f7452510a@linutronix.de>
Date: Sat, 21 Jun 2025 17:42:20 +0200
Message-ID: <87cyaxp0df.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12 2025 at 16:21, Thomas Wei=C3=9Fschuh wrote:
> On Thu, Jun 12, 2025 at 10:31:20AM +0200, Alexandre Ghiti wrote:
> We could introduce per-architecture configuration. Essentially reverting =
parts
> of commit aff69273af61 ("vdso: Improve cmd_vdso_check to check all dynami=
c relocations").
> The final logic for the intermediary objects still needs to be more compl=
icated
> than for the final .so as those contain relocations in the debug informat=
ion.
>
> Or we could add a C hostprog for validation.
> That would be much more flexible than the inline shell command.
> It would then also be easier to use an allow-list than the brittle deny-l=
ist.
>
> Or we don't do anything, relying on the selftests to detect miscompilatio=
ns.

That's a bad idea :)

> I'll run this by tglx. If somebody else has any opinions, I'm all ears.

This is all a mess because the relocation type numbers and their R_*
names are not uniform accross architectures. Neither are the valid
relocation types which are suitable for VDSO.

I don't think you can reasonably cover all of it with readelf and
grep. I did some unrelated relocation analysis some time ago and I just
modified the python script (yes, I hate to use libelf) to show case how
insane this gets. This is just as much as I needed to analyse files
compiled with some random cross gcc I had handy. But you surely get the
idea.

Thanks,

        tglx
---
#!/usr/bin/env python3

import sys

from argparse import ArgumentParser
from elftools.elf.elffile import ELFFile
from elftools.elf.relocation import RelocationSection
from elftools.elf.enums import ENUM_RELOC_TYPE_i386, ENUM_RELOC_TYPE_x64
from elftools.elf.enums import ENUM_RELOC_TYPE_ARM, ENUM_RELOC_TYPE_AARCH64
from elftools.elf.descriptions import describe_reloc_type

class relocs(object):
    def __init__(self, arch, sections, types):
        self.arch =3D arch
        self.sections =3D sections
        self.types =3D types

i386_relocs =3D relocs('EM_386',
                     [ '.rel.text' ],
                     [ ENUM_RELOC_TYPE_i386['R_386_NONE'],
                       ENUM_RELOC_TYPE_i386['R_386_PC32'],
                       ENUM_RELOC_TYPE_i386['R_386_GOTPC'],
                       ENUM_RELOC_TYPE_i386['R_386_GOTOFF'],
                      ])

x86_64_relocs =3D relocs('EM_X86_64',
                       [ '.rela.text' ],
                       [ ENUM_RELOC_TYPE_x64['R_X86_64_NONE'],
                         ENUM_RELOC_TYPE_x64['R_X86_64_PC32'],
                        ])

arm_relocs =3D relocs('EM_ARM',
                       [ '.rela.text' ],
                       # Probably incomplete
                       [ ENUM_RELOC_TYPE_ARM['R_ARM_NONE'],
                         ENUM_RELOC_TYPE_ARM['R_ARM_REL32'],
                        ])

arm64_relocs =3D relocs('EM_AARCH64',
                       [ '.rela.text' ],
                       # Probably incomplete
                       [ ENUM_RELOC_TYPE_AARCH64['R_AARCH64_NONE'],
                         ENUM_RELOC_TYPE_AARCH64['R_AARCH64_ADR_PREL_LO21'],
                        ])

# Minimal set for an example VDSO build
ENUM_RELOC_TYPE_RISCV =3D dict(
    R_RISCV_BRANCH        =3D 0x10,
    R_RISCV_PCREL_HI20    =3D 0x17,
    R_RISCV_PCREL_LO12_I  =3D 0x18,
    R_RISCV_RVC_BRANCH    =3D 0x2c,
    R_RISCV_RVC_JUMP      =3D 0x2d,
    R_RISCV_RELAX         =3D 0x33,
)

riscv_relocs =3D relocs('EM_RISCV',
                       [ '.rela.text' ],
                       [ ENUM_RELOC_TYPE_RISCV['R_RISCV_BRANCH'],
                         ENUM_RELOC_TYPE_RISCV['R_RISCV_PCREL_HI20'],
                         ENUM_RELOC_TYPE_RISCV['R_RISCV_PCREL_LO12_I'],
                         ENUM_RELOC_TYPE_RISCV['R_RISCV_RVC_BRANCH'],
                         ENUM_RELOC_TYPE_RISCV['R_RISCV_RVC_JUMP'],
                         ENUM_RELOC_TYPE_RISCV['R_RISCV_RELAX'],
                        ])
supported_archs =3D {
    'i386'      : i386_relocs,
    'x86_64'    : x86_64_relocs,
    'arm'       : arm_relocs,
    'arm64'     : arm64_relocs,
    'riscv'     : riscv_relocs,
}

# Probably incomplete
invalid_relocs =3D [ '.rela.dyn', '.rela.plt' ]

def check_relocations(file, arch):
    elf =3D ELFFile(file)
    res =3D 0

    if elf.header['e_machine'] !=3D arch.arch:
        print(elf.header['e_machine'], arch.arch)
        raise Exception('Architecture mismatch')

    for section in elf.iter_sections():
        if not isinstance(section, RelocationSection):
            continue

        if section.name in invalid_relocs:
            print('Invalid VDSO relocation section: %s' %section.name)
            res +=3D 1
            continue

        if section.name not in arch.sections:
            continue

        for reloc in section.iter_relocations():
            if reloc['r_info_type'] in arch.types:
                continue
            res +=3D 1

            symt =3D elf.get_section(section['sh_link'])
            sym =3D symt.get_symbol(reloc['r_info_sym'])

            type =3D describe_reloc_type(reloc['r_info_type'], elf)

            print("Invalid VDSO relocation: %s %s" %(type, sym.name))

    return res

if __name__ =3D=3D '__main__':
    parser =3D ArgumentParser(usage =3D 'usage: %(prog)s arch elf-file',
                            description =3D 'magic VDSO section checker',
                            prog =3D 'vdsoreloc')

    parser.add_argument('arch',
                        choices =3D supported_archs.keys(),
                        help =3D 'Target architecture')
    parser.add_argument('file', help =3D 'ELF file to parse')
    args =3D parser.parse_args()

    with open(args.file, 'rb') as file:
        try:
            res =3D check_relocations(file, supported_archs[args.arch])
            sys.exit(res)
        except Exception as ex:
            # Do something sensible here
            print(ex)
            sys.exit(1)


