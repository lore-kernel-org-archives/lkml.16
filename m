Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FFC160783
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743885281; cv=none; b=Ic0tJZSXQfaE8cdd8YSXSdM30JFWBwFUIIsOFeu3djNxInvmCNw17BABFPGZHxMh5ZcbfMMDn2kYtzXlgNVZe6on8hzK6M69QJ4k4svL692mzteKEYGN6AjxexRKa+7JAP2ioFi8Jkvui7HsGUcGUcQXdm07ubREARIGwhUqDVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743885281; c=relaxed/simple;
	bh=v61BhWwATA4KOhgsMu7FZcgQjluYJqfLdjooILwM6Ag=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=J13iiCLzJsWkUNqWeJEDW45PFs0ZABDXfnk089/VddeMT+c8j6TU7NdxuUlva5x0DswzoAfU3wJMcbAooHS3E/9oWK5yHV9jW5rMF5GgKbtOJWm10qUordz7XSmbZPzzQF5Bg/di1+ioXZYZ81Br/lEZOBVehQiiiZqJEhRpdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Tub6aUhc; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Tub6aUhc"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 535KXlxQ1640815
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 5 Apr 2025 13:33:48 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 535KXlxQ1640815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743885229;
	bh=pHH++npD0a2GOVXNaA+Sl7u0eZKfC4tVk6Fz4FSWzA8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Tub6aUhcNkZz3Mz7X9vAccxd5ieCJL18xhwLwhObwRkiGuKMC9qoh7JDjfNmQ4scT
	 eu/ji0iNHEPeS5ITbyX/GfqqjOqlg05iS8z97xHYpmEEwyApeyBtj35mKYQEa5lcBU
	 Q2Aet2wZvY0YejHF3UzmxxtBOFmWSozKj78nscXooSa5IUfHQ0ddLhBJcuVk0kPcCp
	 s0OYcF6sTABWWW4YjYicu92ymsIPs6zQp0OmPwNjJyZKW3LGgq+D7OK4sEwT2sp6GE
	 +wHengZkHUnMQrgL9uxWQ+loy9Jfe0T/OgLVeBd++5iBhqfA+7JkYsWvuLX9issJxk
	 2Y9xy+XAKOPzw==
Date: Sat, 05 Apr 2025 13:33:46 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>, Kevin Koster <lkml@ombertech.com>,
        Oerg866 <oerg866@googlemail.com>
CC: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86/microcode=3A_Fix_crashes_o?=
 =?US-ASCII?Q?n_early_486_CPUs_due_to_usage_of_=27cpuid=27=2E?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com> <20250405130306.ca9822c1f27db119cc973603@ombertech.com> <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
Message-ID: <DB27EAFA-8793-4B0E-BC33-C9E9E2C41777@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 5, 2025 2:32:26 AM PDT, Borislav Petkov <bp@alien8=2Ede> wrote:
>On Sat, Apr 05, 2025 at 01:03:06PM +1100, Kevin Koster wrote:
>> On Sat, 19 Oct 2024 08:29:04 +0200
>> Oerg866 <oerg866@googlemail=2Ecom> wrote:
>>=20
>> > Starting with v6=2E7-rc1, the kernel was no longer able to boot on ea=
rly
>> > i486-class CPUs=2E
>>=20
>> Thanks for this patch! It solves my problem with kernel 6=2E12=2E11
>> rebooting at start-up on 486 CPUs, which had me puzzled=2E (tested on
>> AM486DX2-66 and CX486DX4-100)
>>=20
>> Is there a reason why the patch wasn't accepted?
>
>Yes, too many patches, too little time=2E :-(
>
>Anyway, does the one below - only build-tested - work for both y'all too?
>
>---
>diff --git a/arch/x86/include/asm/microcode=2Eh b/arch/x86/include/asm/mi=
crocode=2Eh
>index 695e569159c1=2E=2Ed53148fb893a 100644
>--- a/arch/x86/include/asm/microcode=2Eh
>+++ b/arch/x86/include/asm/microcode=2Eh
>@@ -17,10 +17,12 @@ struct ucode_cpu_info {
> void load_ucode_bsp(void);
> void load_ucode_ap(void);
> void microcode_bsp_resume(void);
>+bool __init microcode_loader_disabled(void);
> #else
> static inline void load_ucode_bsp(void)	{ }
> static inline void load_ucode_ap(void) { }
> static inline void microcode_bsp_resume(void) { }
>+bool __init microcode_loader_disabled(void) { return false; }
> #endif
>=20
> extern unsigned long initrd_start_early;
>diff --git a/arch/x86/kernel/cpu/microcode/amd=2Ec b/arch/x86/kernel/cpu/=
microcode/amd=2Ec
>index b61028cf5c8a=2E=2Edda7f0d409e9 100644
>--- a/arch/x86/kernel/cpu/microcode/amd=2Ec
>+++ b/arch/x86/kernel/cpu/microcode/amd=2Ec
>@@ -1099,7 +1099,7 @@ static int __init save_microcode_in_initrd(void)
> 	enum ucode_state ret;
> 	struct cpio_data cp;
>=20
>-	if (dis_ucode_ldr || c->x86_vendor !=3D X86_VENDOR_AMD || c->x86 < 0x10=
)
>+	if (microcode_loader_disabled() || c->x86_vendor !=3D X86_VENDOR_AMD ||=
 c->x86 < 0x10)
> 		return 0;
>=20
> 	if (!find_blobs_in_containers(&cp))
>diff --git a/arch/x86/kernel/cpu/microcode/core=2Ec b/arch/x86/kernel/cpu=
/microcode/core=2Ec
>index b3658d11e7b6=2E=2E972338a2abae 100644
>--- a/arch/x86/kernel/cpu/microcode/core=2Ec
>+++ b/arch/x86/kernel/cpu/microcode/core=2Ec
>@@ -95,12 +95,15 @@ static bool amd_check_current_patch_level(void)
> 	return false;
> }
>=20
>-static bool __init check_loader_disabled_bsp(void)
>+bool __init microcode_loader_disabled(void)
> {
> 	static const char *__dis_opt_str =3D "dis_ucode_ldr";
> 	const char *cmdline =3D boot_command_line;
> 	const char *option  =3D __dis_opt_str;
>=20
>+	if (!have_cpuid_p())
>+		return true;
>+
> 	/*
> 	 * CPUID(1)=2EECX[31]: reserved for hypervisor use=2E This is still not
> 	 * completely accurate as xen pv guests don't see that CPUID bit set bu=
t
>@@ -146,7 +149,7 @@ void __init load_ucode_bsp(void)
> 		return;
> 	}
>=20
>-	if (check_loader_disabled_bsp())
>+	if (microcode_loader_disabled())
> 		return;
>=20
> 	if (intel)
>diff --git a/arch/x86/kernel/head32=2Ec b/arch/x86/kernel/head32=2Ec
>index de001b2146ab=2E=2Ef29dc9c95c50 100644
>--- a/arch/x86/kernel/head32=2Ec
>+++ b/arch/x86/kernel/head32=2Ec
>@@ -145,8 +145,7 @@ void __init __no_stack_protector mk_early_pgtbl_32(vo=
id)
> 	*ptr =3D (unsigned long)ptep + PAGE_OFFSET;
>=20
> #ifdef CONFIG_MICROCODE_INITRD32
>-	/* Running on a hypervisor? */
>-	if (native_cpuid_ecx(1) & BIT(31))
>+	if (microcode_loader_disabled())
> 		return;
>=20
> 	params =3D (struct boot_params *)__pa_nodebug(&boot_params);
>

How the Hades does c->x86 not get set to 4 (hence < 0x10) on this CPU?

That's the real bug imo=2E=2E=2E
