Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D02877EB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244649; cv=none; b=nw1KmKZb1d3LGBRviJV+/RRHcsKrwL1zNFSSwoNsDldYBIb0dx4AquCNqcElJqYGq7c693lmOrrpzfFRHAzkPr7FRdmTK5R2SwSdS4dtfodPoOOt84ui/PEq+g8X+zRC+BFECIohCC8nkMH9JmF2j2S3AYpF+LmEE8T7xaBungU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244649; c=relaxed/simple;
	bh=0SA69pGfRWuvjDgHBAfjbCGriuPqOl1zfjJIlMsiDz8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nb6F9FEywkLeo60+5ny+uVqxM23OCvVDvT3mLrKpEtTZeNn3poyXT3Njuc3Xxb7eTn54EKUKW24qJqqeqvzmEtCSo3J6qsddWmRsH2k5k4Pop2N7lWyVtesI3IdY2R1Ap/+obAnY9XPgeztBRPHqEmdiB/5zcfa6ak5a2DwV/Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/NyUBR9; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/NyUBR9"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso5465980a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750244646; x=1750849446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dUenCjAQgAW49xFMABhpBqz+UuOLzSOrlkr9V3lY8oE=;
        b=Q/NyUBR9fa/KotbB8Knz/8WcLGmG5NB+fP7aDmnmtvbYIngLgOFv/cAxN4uJ1zhV0o
         dLQz6WlRUiRE/AvPTqV3ehR3TVUk5IoI+tHrEfZn29g3+yFfPTU3spa/+cYh69r93Y4s
         wyvhzakau7WzponIrP2gmpHJ0dqLyNxvDLhLY1qsn8/YUE+P7/yFqFjXcml/XTFcE+dE
         qG7KgUvRmxQYH6qodjfwTsBmrGwpiMV1q+Ll6VfkkW4bI8goXJ1mf/9X8P0q8UYtu4Sr
         duTJnfb6Y9eQ7x1R8slQ7G4u1WK1+Z3lVmowCHRHAaCs1/mHAnusyBuwpVeBY2sucXU6
         VB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750244646; x=1750849446;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dUenCjAQgAW49xFMABhpBqz+UuOLzSOrlkr9V3lY8oE=;
        b=c0q73lKI5TgMmTZ+LKQlf5vxZ72h8a4Z+AE2SmXqlRusZxzVetmTTAo+2D5pU9uB+o
         lOchHSwPOC/ZpLBIdwKS+IklfArHGYuXytbTodGGxh9F9+u3+gjGrLeDE+sVBbYPmlei
         CW8QCRaILaUTKErVZSn6VWa0DuH0QUJ4A8LTM0btWCwI76PQNXss9K2KOcJyQxEbIht6
         FINq/lOt2kUtQpur/1vUSGtd5aVVZSqAK2xuXkaRrInzAMQQhJFyNtYmDK9j1TQ0/t4+
         hWRG79RFTsrxNwrj2KxNSp32fxEuGA2ZaYqXGn8owKA780f52UCuOEcc++OXbMp62UTL
         /low==
X-Gm-Message-State: AOJu0YxVT67Y3iH50dcJBAkwQtbPNhAbKXu0Q/LQcsw5CM+e9LbE7fGU
	pQsl9z5oE5XUhgDcxQK9+WnLWk3DsKHe6FIfflJMOq8gnV/MdSMLEbAT
X-Gm-Gg: ASbGncvSKKihXgrxnJiU5xiq4jwce+nL5SlX/Or4fhPNSWloG4ycGGVGaGFUctF62Hh
	5H+KSuGi2fiOLyHnspkw2nfgqxF3Omx8FjLmnczbWm4Cp1KVtvRoiZ/RAkrpRdCZ1huPSSqKgiT
	Y/dB7wRhedtZnTqOtPW4l8NEBl7neINpNXusft7B/76GZaclbh7W55ehRYE95SQ+3mS1yXFplF7
	WXbxv8RLux3pOt17kZZT4FF2wQwLHGHFMVPaApe9sRlwgaGvk1dQRQ+LEmcwNC+5sz5O/LBRhYN
	BQ15INKdrrmAj+v+9lJ0e7ig3TEE+Xbcb/nOpPaTyW7joSKxPYL4G11gKCnH5bNpOO4KUmU=
X-Google-Smtp-Source: AGHT+IHV25c05P0LQqx4Kqm+b9kXPiM8HsKpvA7n3LcP8KhUNma2+sRlDVMMbx/VHWjmyWUTbhFB+w==
X-Received: by 2002:a05:6a20:a115:b0:218:c01:ddce with SMTP id adf61e73a8af0-21fbd5d90aemr29021932637.40.1750244646369;
        Wed, 18 Jun 2025 04:04:06 -0700 (PDT)
Received: from ?IPv6:::1? ([2405:201:900e:b1b1:9025:ce8f:3766:9930])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffee587sm11070759b3a.16.2025.06.18.04.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 04:04:06 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:34:02 +0530
From: Abhigyan ghosh <zscript.team.zs@gmail.com>
To: Marco Bonelli <marco@mebeim.net>
CC: linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_RISC-V_32-bit_debug_builds_reach?=
 =?US-ASCII?Q?ing_breaking_point=3A_too_many_symbols?=
User-Agent: K-9 Mail for Android
In-Reply-To: <1714337938.319508.1750244108368@privateemail.com>
References: <1714337938.319508.1750244108368@privateemail.com>
Message-ID: <5BB59D35-BFA0-43AC-939E-213925DD4869@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Marco,

Thanks for this incredibly detailed analysis =E2=80=94 those stats are eye=
-opening=2E

I had a quick question as I'm exploring ELF internals and kernel compilati=
on workflows, especially in the RISC-V context:

Would using split debug info earlier in the build (e=2Eg=2E extracting `=
=2Edebug_*` before `vmlinux=2Eo` grows too large) help mitigate the symbol =
table overflow =E2=80=94 or is the linker still forced to carry them throug=
h regardless due to reloc dependencies?

Also, does this behavior differ between GNU ld and LLD in your tests?

Appreciate the time you've taken to compile all this =E2=80=94 the plots a=
nd breakdown by section/reloc type really help visualize the scale=2E

Best regards, =20
Abhigyan Ghosh =20

On 18 June 2025 4:25:08=E2=80=AFpm IST, Marco Bonelli <marco@mebeim=2Enet>=
 wrote:
>RISC-V debug builds generate *millions* of symbols in vmlinux=2Eo, and th=
is number
>is now getting beyond the limit of the maximum symbol table index that ca=
n be
>represented by 32-bit Rela relocations=2E The ELF32_R_SYM portion of Elf3=
2_Rela
>r_info is only 24 bits, therefore symtab indexes larger than 16777215 ove=
rflow
>and cause bogus Rela entries pointing to wrong symbols, ultimately breaki=
ng the
>build=2E
>
>I recently noticed this [1] when "MODPOST vmlinux=2Esymvers" failed with =
thousands
>of errors and warnings on a particular build of mine for v6=2E15 RISC-V 3=
2-bit=2E
>
>The majority (99%) of the symbols are for local temporary labels (=2ELxxx=
) that
>would normally be stripped by default at link time, but seems they cannot=
 be
>stripped as they are referenced by Rela relocations=2E The number of such=
 symbols
>has always been huge from the very first RISC-V Linux version (v4=2E15) a=
nd has
>been steadily growing since (I plotted a bar chart for v6=2E5-v6=2E15 her=
e [3])=2E
>
>For reference, on v4=2E15 a simple defconfig + debug build with GCC 11=2E=
1 produces
>a vmlinux=2Eo with around 7 million such symbols=2E On v6=2E15 with GCC 1=
4=2E2 it gets
>to around 15 million=2E We are close to the 16=2E8M limit, and already ex=
ceeding it
>on some configurations (the discussion in [1] is an example)=2E
>
>What can be done to reduce them down to an acceptable number, or even bet=
ter get
>rid of them entirely? These local temporary symbols referenced by relocat=
ions
>seem to be ubiquitous, so I suppose this is some RISC-V ELF ABI design ch=
oice=2E
>Could those Rela relocs just avoid referencing any symbol? Or could Rel/R=
elr be
>used instead?
>
>Otherwise, if those really need to be kept as is, perhaps splitting debug=
 info
>out of vmlinux=2Eo before linking into final vmlinux (when those are fina=
lly
>stripped) could also be a viable solution, though the debug info would ha=
ve to
>be split into multiple files or the same problem would arise=2E
>
>Thoughts?
>
>Here are some stats from a custom script I hacked together (can provide s=
ource
>if needed)=2E
>
>	# Clean v6=2E15 tree
>	export PATH=3D/path/to/gcc-14=2E2=2E0-nolibc/riscv32-linux/bin:$PATH
>	export ARCH=3Driscv CROSS_COMPILE=3Driscv32-linux-
>
>	make defconfig
>	make 32-bit=2Econfig
>	=2E/scripts/config -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>	make olddefconfig
>	make -j vmlinux
>
>Stats:
>
>	Total symbols: 15138556
>	Temporary local symbols: 14972044
>	Referenced by relocations: 14971527
>	By section:
>		=2Erela=2Edebug_info                  8783573
>		=2Erela=2Edebug_line                  3649412
>		=2Erela=2Edebug_ranges                1110915
>		=2Erela=2Edebug_loc                   972349
>		=2Erela=2Etext                        398789
>		=2Erela=2Edebug_frame                 283422
>		=2Erela=2Erodata                      17182
>		=2Erela=2Einit=2Etext                   15732
>		=2Erela__bug_table                  11163
>		=2Erela__jump_table                 10830
>		=2Erela=2Edebug_aranges               10253
>		=2Erela=2Ealternative                 4510
>		=2Erela=2Edata                        3504
>		=2Erela=2Etext=2Eunlikely               2650
>		=2Erela__ex_table                   2044
>		=2Erela=2Esched=2Etext                  1405
>		=2Erela=2Einit=2Erodata                 541
>		=2Erela=2Eexit=2Etext                   538
>		=2Erela=2Eref=2Etext                    344
>		=2Erela=2Einit=2Edata                   321
>		=2Erela=2Enoinstr=2Etext                234
>		=2Erela=2Espinlock=2Etext               194
>		=2Erela=2Edata=2E=2Ero_after_init         98
>		=2Erela=2Ecpuidle=2Etext                36
>		=2Erela=2Esrodata                     30
>		=2Erela__modver                     27
>		=2Erela=2Ehead=2Etext                   21
>		=2Erela=2Esdata                       15
>		=2Erela=2Eirqentry=2Etext               12
>		=2Erelaruntime_shift_d_hash_shift   10
>		=2Erelaruntime_ptr_dentry_hashtable 10
>		=2Erela=2Elsm_info=2Einit               3
>		=2Erela=2Edata=2E=2Epercpu                1
>	By relocation kind:
>		R_RISCV_32           9665623
>		R_RISCV_SUB16        3652043
>		R_RISCV_ADD16        3647245
>		R_RISCV_ADD32        1174187
>		R_RISCV_SUB32        345881
>		R_RISCV_BRANCH       168074
>		R_RISCV_RVC_BRANCH   104031
>		R_RISCV_SET6         87790
>		R_RISCV_SUB6         87790
>		R_RISCV_PCREL_LO12_I 81819
>		R_RISCV_RVC_JUMP     76539
>		R_RISCV_SET8         29260
>		R_RISCV_SUB8         29260
>		R_RISCV_PCREL_HI20   23416
>		R_RISCV_SET16        4798
>		R_RISCV_JAL          4676
>		R_RISCV_PCREL_LO12_S 1410
>		R_RISCV_CALL_PLT     1
>
>[1]: https://lore=2Ekernel=2Eorg/lkml/960240908=2E630790=2E1748641210849@=
privateemail=2Ecom/
>[2]: https://x=2Ecom/mebeim/status/1934950596693635410
>
>--
>Marco Bonelli
>

aghosh
