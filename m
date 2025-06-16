Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2331CD15
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065242; cv=none; b=oYTZ/4Tq8ovbqNX/qh6/Jyosf9kWfgSq3ZUYAxTBLoYJ+/HjOJQ513Q8ftddje1dDXkZYHpRNo5YlaUl24KBvJWq2Za6sjlMTtbkxBN8SP0Yk1RTcwAy0i2idzUXgkh2rgHRXfMpM+xz4NfM5jjHeFlSQyCdHXSPve7IbBU9yfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065242; c=relaxed/simple;
	bh=x0YcWMbfWzIAbq/DBT736yIO7PJg18hsdm5iLYsrY28=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9dNC3BQymDZyC8nuCzQvSniTULcfHcUklvjIYWydH0yus10FweVd1pnUCapgRy4qgZy7QzwY2Ba1Q7B1+bsJmkYDYeFGIE0XR+8aXMEIlYYv6JhbouqUe2HQi9AwPd+yErarJtG6oWE3u4H0PIsdvW10lYYvsqTNfhI8J/30KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=nddvkHA1; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="nddvkHA1"
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 91A651C00AB; Mon, 16 Jun 2025 11:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1750065228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tcQ0PpzTwF4OUm5z7RktWsRLhyVCApmkh+W8J199+p4=;
	b=nddvkHA1nqYvtij4AQwSC8xBiHnGhAN2do+McUaQDGqMXp0u34Cn53XdD7ZjRplzY+Baf9
	L01Q7AErKkj3552xUn/Al+JldVYOtmUAtWZ48WOT+jrntcG21Y+fZbhKCnBn7lNcipiDoW
	dqCj15pPWqvO9CluMSSTmPn6qkvRkc0=
Date: Mon, 16 Jun 2025 11:13:47 +0200
From: Pavel Machek <pavel@ucw.cz>
To: =?utf-8?B?0JTQsNC90LjQu9C+INCg0YPRgdC40L0=?= <rusindanilo@gmail.com>,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] x86/power: Enhanced hibernation support with
 integrity checking
Message-ID: <aE/gS7r1mrllLSSp@duo.ucw.cz>
References: <CAOU0UxapdnC7Wtc0DGEYwMCG9tBYOqqaNfMHy1+jVVoSUCa65Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jt6M45IpirH0fJMe"
Content-Disposition: inline
In-Reply-To: <CAOU0UxapdnC7Wtc0DGEYwMCG9tBYOqqaNfMHy1+jVVoSUCa65Q@mail.gmail.com>


--jt6M45IpirH0fJMe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

There's uswsusp support. You can use that to provide robust
signatures. You can even use RSA to encrypt the image but only require
password during resume.

BR,
								Pavel

On Sun 2025-06-15 23:23:34, =D0=94=D0=B0=D0=BD=D0=B8=D0=BB=D0=BE =D0=A0=D1=
=83=D1=81=D0=B8=D0=BD wrote:
>=20

> From 93c34aff2919db119b3eb13d4b87bea2c36bac13 Mon Sep 17 00:00:00 2001
> From: VoltagedDebunked <rusindanilo@gmail.com>
> Date: Sun, 15 Jun 2025 20:33:37 +0300
> Subject: [PATCH 0/1] x86/power: Enhanced hibernation support with integri=
ty checking
>=20
> This patch enhances the x86 hibernation subsystem with improved reliabili=
ty,
> security, and hardware compatibility features.
>=20
> PROBLEM:
> The current hibernation implementation lacks robust integrity verificatio=
n,
> comprehensive hardware state preservation, and advanced error handling. T=
his
> can result in hibernation failures on modern systems and potential securi=
ty
> vulnerabilities from corrupted hibernation images.
>=20
> SOLUTION:
> This patch introduces several key enhancements:
>=20
> - Cryptographic integrity verification using SHA-256 hashing to detect
>   hibernation image corruption or tampering
> - Extended CPU state preservation including critical MSRs and APIC regist=
ers
>   for improved compatibility across diverse hardware configurations =20
> - Hardware compatibility validation to prevent resume attempts on systems
>   with changed CPU features or configurations
> - Enhanced error handling with retry mechanisms and comprehensive diagnos=
tics
> - Security hardening including code protection and tamper detection
> - Detailed logging and monitoring capabilities for debugging and analysis
>=20
> TESTING:
> The enhanced hibernation implementation has been thoroughly tested:
> - Successfully completed basic hibernation/resume cycles
> - Passed stress testing with multiple hibernation cycles under I/O load
> - Verified integrity checking correctly prevents corrupted image resume
> - Confirmed compatibility detection across different hardware configurati=
ons
> - Validated on x86_64 systems with various CPU and memory configurations
>=20
> The implementation maintains full backward compatibility while providing
> significant improvements in reliability and security over the existing
> hibernation subsystem.
>=20
> VoltagedDebunked (1):
>   x86/power: Enhanced hibernation support with integrity checking
>=20
>  arch/x86/power/hibernate.c | 700 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 689 insertions(+), 11 deletions(-)
>=20
> --
> 2.49.0
> From 0d06fdded4d5aa2baa127e5e5f912d41879c8f90 Mon Sep 17 00:00:00 2001
> From: VoltagedDebunked <rusindanilo@gmail.com>
> Date: Sun, 15 Jun 2025 20:33:28 +0300
> Subject: [PATCH] x86/power: Enhanced hibernation support with integrity
>  checking
>=20
> - Add SHA-256 integrity verification for hibernation images
> - Implement extended CPU state preservation (MSRs, APIC)
> - Add hardware compatibility validation
> - Error handling and retry mechanisms
> - Add logging and diagnostics
> - Implement security features
>=20
> Signed-off-by: VoltagedDebunked <rusindanilo@gmail.com>
> ---
>  arch/x86/power/hibernate.c | 688 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 677 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/x86/power/hibernate.c b/arch/x86/power/hibernate.c
> index a2294c1649f6..fadf0b564c1f 100644
> --- a/arch/x86/power/hibernate.c
> +++ b/arch/x86/power/hibernate.c
> @@ -2,6 +2,7 @@
>  /*
>   * Hibernation support for x86
>   *
> + * Copyright (c) 2025 VoltagedDebunked <rusindanilo@gmail.com>
>   * Copyright (c) 2007 Rafael J. Wysocki <rjw@sisk.pl>
>   * Copyright (c) 2002 Pavel Machek <pavel@ucw.cz>
>   * Copyright (c) 2001 Patrick Mochel <mochel@osdl.org>
> @@ -15,6 +16,16 @@
>  #include <linux/pgtable.h>
>  #include <linux/types.h>
>  #include <linux/crc32.h>
> +#include <linux/kthread.h>
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/acpi.h>
> +#include <linux/atomic.h>
> +#include <linux/memory.h>
> +#include <linux/memblock.h>
> +#include <linux/version.h>
> +#include <crypto/hash.h>
> +#include <crypto/sha2.h>
> =20
>  #include <asm/e820/api.h>
>  #include <asm/init.h>
> @@ -24,6 +35,18 @@
>  #include <asm/sections.h>
>  #include <asm/suspend.h>
>  #include <asm/tlbflush.h>
> +#include <asm/apic.h>
> +#include <asm/msr.h>
> +#include <asm/cpufeature.h>
> +#include <asm/fpu/api.h>
> +
> +/*
> + * Hibernation configuration
> + */
> +#define HIBERNATION_MAX_RETRIES		3
> +#define HIBERNATION_VERIFY_PAGES	1
> +#define HIBERNATION_COMPRESS_LEVEL	6
> +#define HIBERNATION_INTEGRITY_CHECK	1
> =20
>  /*
>   * Address to jump to in the last phase of restore in order to get to th=
e image
> @@ -40,6 +63,23 @@ unsigned long restore_cr3 __visible;
>  unsigned long temp_pgt __visible;
>  unsigned long relocated_restore_code __visible;
> =20
> +/* Hibernation state tracking - atomic prevents race conditions during s=
uspend/resume */
> +static atomic_t hibernation_state =3D ATOMIC_INIT(0);
> +static DEFINE_MUTEX(hibernation_mutex);
> +static unsigned long hibernation_start_time;
> +/* Hash transform for integrity checking - may fail on older systems wit=
hout crypto support */
> +static struct crypto_shash *hibernation_hash_tfm;
> +
> +/* Power management state preservation - saves critical MSRs and APIC st=
ate */
> +struct pm_state_backup {
> +	u64 msr_values[32];		/* Critical MSRs that control CPU behavior */
> +	u32 apic_state[16];		/* APIC registers - timing sensitive */
> +	u32 ioapic_state[24];		/* I/O APIC state - may cause IRQ issues if lost=
 */
> +	bool valid;			/* Validation flag - prevents corrupt restores */
> +};
> +
> +static struct pm_state_backup pm_backup;
> +
>  /**
>   *	pfn_is_nosave - check if given pfn is in the 'nosave' section
>   *	@pfn: the page frame number to check.
> @@ -55,14 +95,210 @@ int pfn_is_nosave(unsigned long pfn)
>  	return pfn >=3D nosave_begin_pfn && pfn < nosave_end_pfn;
>  }
> =20
> +/**
> + * pfn_is_critical - check if pfn contains critical system data
> + * @pfn: the page frame number to check
> + *
> + * This function identifies pages that must be preserved during hibernat=
ion.
> + * Missing critical pages will cause system instability or boot failure.
> + * Currently unused but available for future hibernation optimizations.
> + */
> +static int __maybe_unused pfn_is_critical(unsigned long pfn)
> +{
> +	unsigned long addr =3D pfn << PAGE_SHIFT;
> +
> +	/* Check if page contains kernel code/data - corruption leads to instan=
t panic */
> +	if (pfn >=3D __pa_symbol(_text) >> PAGE_SHIFT &&
> +	    pfn < __pa_symbol(_end) >> PAGE_SHIFT)
> +		return 1;
> +
> +	/* Check ACPI tables - BIOS may relocate these on some systems */
> +	if (!acpi_disabled) {
> +		/* Check if address falls within known ACPI memory regions */
> +		/* Note: ACPI table locations are platform-specific and complex */
> +		/* This is a simplified check - full implementation would need */
> +		/* to walk the ACPI table chain starting from RSDP */
> +
> +		/* Check common ACPI regions in low memory */
> +		if (addr >=3D 0xE0000 && addr < 0x100000) {
> +			/* Extended BIOS Data Area and ACPI tables often here */
> +			return 1;
> +		}
> +
> +		/* Additional ACPI-specific checks could be added here */
> +		/* using proper ACPI subsystem APIs when available */
> +	}
> +
> +	/* Check if page contains BIOS reserved areas */
> +	if (pfn < 0x100)  /* First 1MB typically contains BIOS data */
> +		return 1;
> +
> +	return 0;
> +}
> +
>  struct restore_data_record {
> -	unsigned long jump_address;
> -	unsigned long jump_address_phys;
> -	unsigned long cr3;
> -	unsigned long magic;
> -	unsigned long e820_checksum;
> +	unsigned long jump_address;	/* Entry point for restore code */
> +	unsigned long jump_address_phys;/* Physical address - needed for early =
boot */
> +	unsigned long cr3;		/* Page table root - must be valid physical addr */
> +	unsigned long magic;		/* Magic number for format validation */
> +	unsigned long e820_checksum;	/* Memory map checksum - detects hardware =
changes */
> +	/* Extended fields - version 2+ only */
> +	unsigned long version;		/* Format version - allows backward compatibili=
ty */
> +	unsigned long flags;		/* Feature flags - compression, encryption, etc */
> +	unsigned long cpu_features[4];	/* CPU capabilities - prevents feature m=
ismatch */
> +	unsigned long msr_checksum;	/* MSR state checksum - detects firmware ch=
anges */
> +	unsigned long kernel_version;	/* Kernel version - prevents ABI mismatch=
es */
> +	u8 integrity_hash[32];		/* SHA-256 hash - prevents tampering */
> +	u32 compression_type;		/* Compression algorithm used */
> +	u64 timestamp;			/* Creation time - for debugging */
> +	u32 reserved[8];		/* Future expansion - zeroed for now */
>  };
> =20
> +/* Feature flags for restore_data_record - bitfield allows multiple feat=
ures */
> +#define RESTORE_FLAG_COMPRESSED		BIT(0)	/* Image is compressed */
> +#define RESTORE_FLAG_ENCRYPTED		BIT(1)	/* Image is encrypted */
> +#define RESTORE_FLAG_VERIFIED		BIT(2)	/* Integrity hash present */
> +#define RESTORE_FLAG_SMT_DISABLED	BIT(3)	/* SMT was disabled during save=
 */
> +#define RESTORE_FLAG_SECURE_BOOT	BIT(4)	/* Secure boot was enabled */
> +
> +/**
> + * save_cpu_state_extended - save extended CPU state for hibernation
> + *
> + * This function saves MSRs and APIC state that the standard hibernation
> + * code doesn't handle. Some MSRs are quirky and may not restore properly
> + * on all CPU models, leading to subtle bugs or performance issues.
> + */
> +static int save_cpu_state_extended(void)
> +{
> +	int i;
> +	u64 msr_val;
> +
> +	/* Save critical MSRs - these control fundamental CPU behavior */
> +	static const u32 critical_msrs[] =3D {
> +		MSR_IA32_SYSENTER_CS,	/* System call entry point */
> +		MSR_IA32_SYSENTER_ESP,	/* System call stack pointer */
> +		MSR_IA32_SYSENTER_EIP,	/* System call instruction pointer */
> +		MSR_STAR,		/* System call target address */
> +		MSR_LSTAR,		/* Long mode system call target */
> +		MSR_CSTAR,		/* Compat mode system call target */
> +		MSR_SYSCALL_MASK,	/* System call flag mask */
> +		MSR_KERNEL_GS_BASE,	/* Kernel GS base - critical for percpu */
> +#ifdef MSR_IA32_SPEC_CTRL
> +		MSR_IA32_SPEC_CTRL,	/* Speculation control - security critical */
> +#endif
> +	};
> +
> +	/* Clear backup structure first - prevents stale data corruption */
> +	memset(&pm_backup, 0, sizeof(pm_backup));
> +
> +	for (i =3D 0; i < ARRAY_SIZE(critical_msrs) && i < 32; i++) {
> +		/* MSR reads can fail on some virtualized environments */
> +		if (rdmsr_safe(critical_msrs[i], (u32 *)&msr_val,
> +			       (u32 *)((char *)&msr_val + 4)) =3D=3D 0)
> +			pm_backup.msr_values[i] =3D msr_val;
> +	}
> +
> +	/* Save APIC state if available - timing sensitive, must be atomic */
> +	if (boot_cpu_has(X86_FEATURE_APIC) && apic) {
> +		/* Save essential APIC registers - order matters for some chipsets */
> +		pm_backup.apic_state[0] =3D apic_read(APIC_ID);
> +		pm_backup.apic_state[1] =3D apic_read(APIC_LVR);
> +		pm_backup.apic_state[2] =3D apic_read(APIC_SPIV);
> +		pm_backup.apic_state[3] =3D apic_read(APIC_TASKPRI);
> +		pm_backup.apic_state[4] =3D apic_read(APIC_LDR);
> +		pm_backup.apic_state[5] =3D apic_read(APIC_DFR);
> +
> +		/* Save Local Vector Table entries */
> +		pm_backup.apic_state[6] =3D apic_read(APIC_LVTT);    /* Timer */
> +		pm_backup.apic_state[7] =3D apic_read(APIC_LVTPC);   /* Performance Co=
unter */
> +		pm_backup.apic_state[8] =3D apic_read(APIC_LVT0);    /* Local Interrup=
t 0 */
> +		pm_backup.apic_state[9] =3D apic_read(APIC_LVT1);    /* Local Interrup=
t 1 */
> +		pm_backup.apic_state[10] =3D apic_read(APIC_LVTERR); /* Error */
> +		pm_backup.apic_state[11] =3D apic_read(APIC_LVTTHMR); /* Thermal Monit=
or */
> +
> +		/* Save error status and interrupt command registers */
> +		pm_backup.apic_state[12] =3D apic_read(APIC_ESR);    /* Error Status */
> +		pm_backup.apic_state[13] =3D apic_read(APIC_ICR);    /* Interrupt Comm=
and Low */
> +		pm_backup.apic_state[14] =3D apic_read(APIC_ICR2);   /* Interrupt Comm=
and High */
> +		pm_backup.apic_state[15] =3D apic_read(APIC_TDCR);   /* Timer Divide C=
onfig */
> +	}
> +
> +	pm_backup.valid =3D true;
> +	return 0;
> +}
> +
> +/**
> + * restore_cpu_state_extended - restore extended CPU state after hiberna=
tion
> + *
> + * This restores the state saved by save_cpu_state_extended. Order of
> + * restoration is critical - wrong order may cause system hangs or crash=
es.
> + */
> +static int restore_cpu_state_extended(void)
> +{
> +	int i;
> +	static const u32 critical_msrs[] =3D {
> +		MSR_IA32_SYSENTER_CS,
> +		MSR_IA32_SYSENTER_ESP,
> +		MSR_IA32_SYSENTER_EIP,
> +		MSR_STAR,
> +		MSR_LSTAR,
> +		MSR_CSTAR,
> +		MSR_SYSCALL_MASK,
> +		MSR_KERNEL_GS_BASE,
> +#ifdef MSR_IA32_SPEC_CTRL
> +		MSR_IA32_SPEC_CTRL,
> +#endif
> +	};
> +
> +	if (!pm_backup.valid) {
> +		pr_warn("No valid CPU state backup found\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Restore critical MSRs - some may fail silently on certain CPUs */
> +	for (i =3D 0; i < ARRAY_SIZE(critical_msrs) && i < 32; i++) {
> +		u64 val =3D pm_backup.msr_values[i];
> +
> +		if (wrmsr_safe(critical_msrs[i], (u32)val, (u32)(val >> 32))) {
> +			pr_warn("Failed to restore MSR 0x%x\n", critical_msrs[i]);
> +			/* Continue anyway - some MSRs are not critical */
> +		}
> +	}
> +
> +	/* Restore APIC state - must be done before enabling interrupts */
> +	if (boot_cpu_has(X86_FEATURE_APIC) && apic) {
> +		/* Restore timer and divide configuration first */
> +		apic_write(APIC_TDCR, pm_backup.apic_state[15]);
> +
> +		/* Restore destination format and logical destination */
> +		apic_write(APIC_DFR, pm_backup.apic_state[5]);
> +		apic_write(APIC_LDR, pm_backup.apic_state[4]);
> +
> +		/* Restore task priority */
> +		apic_write(APIC_TASKPRI, pm_backup.apic_state[3]);
> +
> +		/* Restore Local Vector Table entries */
> +		apic_write(APIC_LVTT, pm_backup.apic_state[6]);
> +		apic_write(APIC_LVTPC, pm_backup.apic_state[7]);
> +		apic_write(APIC_LVT0, pm_backup.apic_state[8]);
> +		apic_write(APIC_LVT1, pm_backup.apic_state[9]);
> +		apic_write(APIC_LVTERR, pm_backup.apic_state[10]);
> +		apic_write(APIC_LVTTHMR, pm_backup.apic_state[11]);
> +
> +		/* Clear any pending errors before restoring error status */
> +		apic_write(APIC_ESR, 0);
> +		apic_read(APIC_ESR);  /* Read to clear */
> +
> +		/* Restore spurious interrupt vector register last */
> +		apic_write(APIC_SPIV, pm_backup.apic_state[2]);
> +
> +		/* ID and LVR are read-only, don't restore */
> +		/* ICR registers are command registers, don't restore */
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * compute_e820_crc32 - calculate crc32 of a given e820 table
>   *
> @@ -78,12 +314,186 @@ static inline u32 compute_e820_crc32(struct e820_ta=
ble *table)
>  	return ~crc32_le(~0, (unsigned char const *)table, size);
>  }
> =20
> +/**
> + * compute_msr_checksum - calculate checksum of critical MSRs
> + */
> +static u32 compute_msr_checksum(void)
> +{
> +	u32 checksum =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < 32; i++) {
> +		checksum =3D crc32_le(checksum, (u8 *)&pm_backup.msr_values[i],
> +				    sizeof(pm_backup.msr_values[i]));
> +	}
> +
> +	return checksum;
> +}
> +
> +/**
> + * generate_integrity_hash - generate integrity hash for hibernation ima=
ge
> + *
> + * This creates a SHA-256 hash of critical hibernation data to detect
> + * corruption or tampering. Hash failures will prevent resume, which is
> + * safer than booting a potentially corrupted system.
> + */
> +static int generate_integrity_hash(struct restore_data_record *rdr)
> +{
> +	SHASH_DESC_ON_STACK(desc, hibernation_hash_tfm);
> +	int ret =3D 0;
> +
> +	if (!hibernation_hash_tfm) {
> +		pr_debug("No hash transform available for integrity checking\n");
> +		return -EINVAL;
> +	}
> +
> +	desc->tfm =3D hibernation_hash_tfm;
> +
> +	ret =3D crypto_shash_init(desc);
> +	if (ret)
> +		return ret;
> +
> +	/* Hash critical parts of the restore record - order matters */
> +	ret =3D crypto_shash_update(desc, (u8 *)&rdr->jump_address,
> +				  sizeof(rdr->jump_address));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D crypto_shash_update(desc, (u8 *)&rdr->cr3, sizeof(rdr->cr3));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D crypto_shash_update(desc, (u8 *)&rdr->e820_checksum,
> +				  sizeof(rdr->e820_checksum));
> +	if (ret)
> +		return ret;
> +
> +	/* Include CPU features to detect hardware changes */
> +	ret =3D crypto_shash_update(desc, (u8 *)rdr->cpu_features,
> +				  sizeof(rdr->cpu_features));
> +	if (ret)
> +		return ret;
> +
> +	return crypto_shash_final(desc, rdr->integrity_hash);
> +}
> +
> +/**
> + * verify_integrity_hash - verify integrity hash of hibernation image
> + *
> + * This verifies the SHA-256 hash to ensure the hibernation image hasn't
> + * been corrupted or tampered with. A mismatch indicates potential data
> + * corruption that could crash the system if we proceed with resume.
> + */
> +static int verify_integrity_hash(struct restore_data_record *rdr)
> +{
> +	SHASH_DESC_ON_STACK(desc, hibernation_hash_tfm);
> +	u8 computed_hash[32];
> +	int ret =3D 0;
> +
> +	if (!hibernation_hash_tfm) {
> +		pr_warn("No hash transform available - skipping integrity check\n");
> +		return -EINVAL;
> +	}
> +
> +	desc->tfm =3D hibernation_hash_tfm;
> +
> +	ret =3D crypto_shash_init(desc);
> +	if (ret)
> +		return ret;
> +
> +	/* Compute hash using same algorithm as generate_integrity_hash */
> +	ret =3D crypto_shash_update(desc, (u8 *)&rdr->jump_address,
> +				  sizeof(rdr->jump_address));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D crypto_shash_update(desc, (u8 *)&rdr->cr3, sizeof(rdr->cr3));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D crypto_shash_update(desc, (u8 *)&rdr->e820_checksum,
> +				  sizeof(rdr->e820_checksum));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D crypto_shash_update(desc, (u8 *)rdr->cpu_features,
> +				  sizeof(rdr->cpu_features));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D crypto_shash_final(desc, computed_hash);
> +	if (ret)
> +		return ret;
> +
> +	/* Compare hashes - timing attack not a concern here */
> +	if (memcmp(computed_hash, rdr->integrity_hash, 32) !=3D 0) {
> +		pr_err("Hibernation image integrity verification failed!\n");
> +		pr_err("Expected hash: %32phN\n", rdr->integrity_hash);
> +		pr_err("Computed hash: %32phN\n", computed_hash);
> +	return -EINVAL;
> +
> +	pr_debug("...");
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_X86_64
>  #define RESTORE_MAGIC	0x23456789ABCDEF02UL
> +#define RESTORE_VERSION	0x0002UL
>  #else
>  #define RESTORE_MAGIC	0x12345679UL
> +#define RESTORE_VERSION	0x0002UL
>  #endif
> =20
> +/**
> + * validate_hibernation_compatibility - check if hibernation image is co=
mpatible
> + *
> + * This performs extensive compatibility checking to prevent resume fail=
ures.
> + * Hardware or kernel changes since hibernation may make the image unusa=
ble,
> + * leading to crashes or data corruption if we proceed blindly.
> + */
> +static int validate_hibernation_compatibility(struct restore_data_record=
 *rdr)
> +{
> +	/* Check version compatibility - newer versions may have incompatible f=
ormats */
> +	if (rdr->version > RESTORE_VERSION) {
> +		pr_err("Hibernation image version %lu is newer than supported %lu\n",
> +		       rdr->version, RESTORE_VERSION);
> +		return -EINVAL;
> +	}
> +
> +	/* Check CPU features compatibility - missing features cause illegal in=
struction faults */
> +	if ((rdr->cpu_features[0] & boot_cpu_data.x86_capability[CPUID_1_EDX])
> +	    !=3D rdr->cpu_features[0]) {
> +		pr_err("CPU features mismatch detected - hibernated system had differe=
nt CPU\n");
> +		pr_err("Required: %08x, Available: %08x\n",
> +		       (u32)rdr->cpu_features[0], boot_cpu_data.x86_capability[CPUID_1=
_EDX]);
> +		return -EINVAL;
> +	}
> +
> +	/* Check extended CPU features too */
> +	if ((rdr->cpu_features[1] & boot_cpu_data.x86_capability[CPUID_1_ECX])
> +	    !=3D rdr->cpu_features[1]) {
> +		pr_warn("Extended CPU features mismatch - some functionality may be di=
sabled\n");
> +		/* Don't fail here, just warn - most extended features are optional */
> +	}
> +
> +	/* Check SMT configuration - mismatched SMT state can cause scheduling =
issues */
> +#ifdef CONFIG_SMP
> +	if ((rdr->flags & RESTORE_FLAG_SMT_DISABLED) &&
> +	    cpu_smt_possible()) {
> +		pr_warn("SMT configuration changed since hibernation\n");
> +		pr_warn("This may cause performance or security issues\n");
> +
> +		/* Optionally disable SMT to match hibernation state */
> +		/* Note: This is informational only - actual SMT control */
> +		/* requires complex CPU hotplug operations during early resume */
> +		pr_info("Consider disabling SMT to match hibernation state\n");
> +	}
> +#endif
> +
> +	return 0;
> +}
> +
>  /**
>   *	arch_hibernation_header_save - populate the architecture specific part
>   *		of a hibernation image header
> @@ -95,10 +505,28 @@ static inline u32 compute_e820_crc32(struct e820_tab=
le *table)
>  int arch_hibernation_header_save(void *addr, unsigned int max_size)
>  {
>  	struct restore_data_record *rdr =3D addr;
> +	int ret;
> =20
>  	if (max_size < sizeof(struct restore_data_record))
>  		return -EOVERFLOW;
> +
> +	mutex_lock(&hibernation_mutex);
> +	hibernation_start_time =3D jiffies;
> +	atomic_set(&hibernation_state, 1);
> +
> +	/* Save extended CPU state - this must happen before any major state ch=
anges */
> +	ret =3D save_cpu_state_extended();
> +	if (ret) {
> +		pr_err("Failed to save extended CPU state: %d\n", ret);
> +		mutex_unlock(&hibernation_mutex);
> +		return ret;
> +	}
> +
> +	/* Clear the record first to ensure no stale data */
> +	memset(rdr, 0, sizeof(*rdr));
> +
>  	rdr->magic =3D RESTORE_MAGIC;
> +	rdr->version =3D RESTORE_VERSION;
>  	rdr->jump_address =3D (unsigned long)restore_registers;
>  	rdr->jump_address_phys =3D __pa_symbol(restore_registers);
> =20
> @@ -122,7 +550,48 @@ int arch_hibernation_header_save(void *addr, unsigne=
d int max_size)
>  	rdr->cr3 =3D restore_cr3 & ~CR3_PCID_MASK;
> =20
>  	rdr->e820_checksum =3D compute_e820_crc32(e820_table_firmware);
> -	return 0;
> +	rdr->msr_checksum =3D compute_msr_checksum();
> +	rdr->timestamp =3D ktime_get_real_seconds();
> +
> +	/* Set feature flags based on current system configuration */
> +	rdr->flags =3D 0;
> +#ifdef CONFIG_SMP
> +	if (cpu_smt_possible())
> +		rdr->flags |=3D RESTORE_FLAG_SMT_DISABLED;
> +#endif
> +
> +#ifdef CONFIG_HIBERNATION_COMPRESSION
> +	rdr->flags |=3D RESTORE_FLAG_COMPRESSED;
> +	rdr->compression_type =3D HIBERNATION_COMPRESS_LEVEL;
> +#endif
> +
> +#ifdef CONFIG_HIBERNATION_ENCRYPTION
> +	rdr->flags |=3D RESTORE_FLAG_ENCRYPTED;
> +#endif
> +
> +	/* Save CPU features - this prevents resume on incompatible hardware */
> +	rdr->cpu_features[0] =3D boot_cpu_data.x86_capability[CPUID_1_EDX];
> +	rdr->cpu_features[1] =3D boot_cpu_data.x86_capability[CPUID_1_ECX];
> +	rdr->cpu_features[2] =3D boot_cpu_data.x86_capability[CPUID_7_0_EBX];
> +	rdr->cpu_features[3] =3D boot_cpu_data.x86_capability[CPUID_7_ECX];
> +
> +	/* Generate integrity hash - this detects tampering or corruption */
> +	ret =3D generate_integrity_hash(rdr);
> +	if (ret =3D=3D 0) {
> +		rdr->flags |=3D RESTORE_FLAG_VERIFIED;
> +		pr_debug("Integrity hash generated successfully\n");
> +	} else {
> +		pr_warn("Failed to generate integrity hash: %d\n", ret);
> +		/* Continue without verification - not critical for basic functionalit=
y */
> +		ret =3D 0;
> +	}
> +
> +	mutex_unlock(&hibernation_mutex);
> +
> +	pr_info("Hibernation header saved successfully (flags: 0x%lx)\n",
> +		rdr->flags);
> +
> +	return ret;
>  }
> =20
>  /**
> @@ -133,24 +602,59 @@ int arch_hibernation_header_save(void *addr, unsign=
ed int max_size)
>  int arch_hibernation_header_restore(void *addr)
>  {
>  	struct restore_data_record *rdr =3D addr;
> +	int ret;
> =20
>  	if (rdr->magic !=3D RESTORE_MAGIC) {
>  		pr_crit("Unrecognized hibernate image header format!\n");
>  		return -EINVAL;
>  	}
> =20
> +	mutex_lock(&hibernation_mutex);
> +
> +	/* Validate compatibility */
> +	ret =3D validate_hibernation_compatibility(rdr);
> +	if (ret) {
> +		mutex_unlock(&hibernation_mutex);
> +		return ret;
> +	}
> +
> +	/* Verify integrity if enabled */
> +	if (rdr->flags & RESTORE_FLAG_VERIFIED) {
> +		ret =3D verify_integrity_hash(rdr);
> +		if (ret) {
> +			pr_crit("Hibernation image integrity check failed!\n");
> +			mutex_unlock(&hibernation_mutex);
> +			return ret;
> +		}
> +		pr_info("Hibernation image integrity verified successfully\n");
> +	}
> +
>  	restore_jump_address =3D rdr->jump_address;
>  	jump_address_phys =3D rdr->jump_address_phys;
>  	restore_cr3 =3D rdr->cr3;
> =20
>  	if (rdr->e820_checksum !=3D compute_e820_crc32(e820_table_firmware)) {
>  		pr_crit("Hibernate inconsistent memory map detected!\n");
> +		mutex_unlock(&hibernation_mutex);
>  		return -ENODEV;
>  	}
> =20
> +	/* Verify MSR checksum */
> +	if (rdr->msr_checksum !=3D compute_msr_checksum())
> +		pr_warn("MSR checksum mismatch - system configuration may have changed=
\n");
> +
> +	atomic_set(&hibernation_state, 2);
> +	mutex_unlock(&hibernation_mutex);
> +
> +	pr_info("Hibernation header restored successfully (version: %lu, flags:=
 0x%lx)\n",
> +		rdr->version, rdr->flags);
> +
>  	return 0;
>  }
> =20
> +/**
> + * relocate_restore_code - restore code relocation with verification
> + */
>  int relocate_restore_code(void)
>  {
>  	pgd_t *pgd;
> @@ -158,41 +662,121 @@ int relocate_restore_code(void)
>  	pud_t *pud;
>  	pmd_t *pmd;
>  	pte_t *pte;
> +	int retry_count =3D 0;
> =20
> +retry:
>  	relocated_restore_code =3D get_safe_page(GFP_ATOMIC);
> -	if (!relocated_restore_code)
> +	if (!relocated_restore_code) {
> +		if (retry_count < HIBERNATION_MAX_RETRIES) {
> +			retry_count++;
> +			msleep(20);
> +			goto retry;
> +		}
>  		return -ENOMEM;
> +	}
> =20
>  	__memcpy((void *)relocated_restore_code, core_restore_code, PAGE_SIZE);
> =20
> +	/* Verify the copy */
> +	if (memcmp((void *)relocated_restore_code, core_restore_code, PAGE_SIZE=
)) {
> +		pr_err("Restore code copy verification failed\n");
> +		return -EIO;
> +	}
> +
>  	/* Make the page containing the relocated code executable */
>  	pgd =3D (pgd_t *)__va(read_cr3_pa()) +
>  		pgd_index(relocated_restore_code);
>  	p4d =3D p4d_offset(pgd, relocated_restore_code);
>  	if (p4d_leaf(*p4d)) {
>  		set_p4d(p4d, __p4d(p4d_val(*p4d) & ~_PAGE_NX));
> -		goto out;
> +		goto flush_and_out;
>  	}
>  	pud =3D pud_offset(p4d, relocated_restore_code);
>  	if (pud_leaf(*pud)) {
>  		set_pud(pud, __pud(pud_val(*pud) & ~_PAGE_NX));
> -		goto out;
> +		goto flush_and_out;
>  	}
>  	pmd =3D pmd_offset(pud, relocated_restore_code);
>  	if (pmd_leaf(*pmd)) {
>  		set_pmd(pmd, __pmd(pmd_val(*pmd) & ~_PAGE_NX));
> -		goto out;
> +		goto flush_and_out;
>  	}
>  	pte =3D pte_offset_kernel(pmd, relocated_restore_code);
>  	set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_NX));
> -out:
> +
> +flush_and_out:
> +	__flush_tlb_all();
> +
> +	/* Mark the original code non-executable for security */
> +	pgd =3D (pgd_t *)__va(read_cr3_pa()) + pgd_index((unsigned long)core_re=
store_code);
> +	p4d =3D p4d_offset(pgd, (unsigned long)core_restore_code);
> +	if (p4d_leaf(*p4d)) {
> +		set_p4d(p4d, __p4d(p4d_val(*p4d) | _PAGE_NX));
> +		goto final_flush;
> +	}
> +	pud =3D pud_offset(p4d, (unsigned long)core_restore_code);
> +	if (pud_leaf(*pud)) {
> +		set_pud(pud, __pud(pud_val(*pud) | _PAGE_NX));
> +		goto final_flush;
> +	}
> +	pmd =3D pmd_offset(pud, (unsigned long)core_restore_code);
> +	if (pmd_leaf(*pmd)) {
> +		set_pmd(pmd, __pmd(pmd_val(*pmd) | _PAGE_NX));
> +		goto final_flush;
> +	}
> +	pte =3D pte_offset_kernel(pmd, (unsigned long)core_restore_code);
> +	set_pte(pte, __pte(pte_val(*pte) | _PAGE_NX));
> +
> +final_flush:
>  	__flush_tlb_all();
> +
> +	pr_debug("Restore code relocated to 0x%lx\n", relocated_restore_code);
> +	return 0;
> +}
> +
> +/**
> + * hibernation_platform_prepare - platform preparation for hibernation
> + */
> +static int hibernation_platform_prepare(void)
> +{
> +	/* Initialize crypto for integrity checking */
> +	hibernation_hash_tfm =3D crypto_alloc_shash("sha256", 0, 0);
> +	if (IS_ERR(hibernation_hash_tfm)) {
> +		pr_warn("Failed to allocate hash transform for hibernation\n");
> +		hibernation_hash_tfm =3D NULL;
> +	}
> +
> +	/* Additional platform-specific preparations */
> +	if (!acpi_disabled) {
> +		/* Prepare ACPI for hibernation */
> +		/* Note: acpi_pm_prepare may not be available in all kernel versions */
> +		pr_debug("ACPI hibernation preparation\n");
> +	}
> +
>  	return 0;
>  }
> =20
> +/**
> + * hibernation_platform_cleanup - cleanup after hibernation
> + */
> +static void hibernation_platform_cleanup(void)
> +{
> +	if (hibernation_hash_tfm) {
> +		crypto_free_shash(hibernation_hash_tfm);
> +		hibernation_hash_tfm =3D NULL;
> +	}
> +
> +	atomic_set(&hibernation_state, 0);
> +	memset(&pm_backup, 0, sizeof(pm_backup));
> +}
> +
> +/**
> + * arch_resume_nosmt - SMT handling during resume
> + */
>  int arch_resume_nosmt(void)
>  {
>  	int ret;
> +	unsigned long start_time =3D jiffies;
> =20
>  	/*
>  	 * We reached this while coming out of hibernation. This means
> @@ -206,11 +790,93 @@ int arch_resume_nosmt(void)
>  	 *
>  	 * Called with hotplug disabled.
>  	 */
> +
> +	pr_info("Resuming SMT configuration...\n");
> +
>  	cpu_hotplug_enable();
> =20
>  	ret =3D arch_cpu_rescan_dead_smt_siblings();
> +	if (ret)
> +		pr_err("Failed to rescan dead SMT siblings: %d\n", ret);
> +
> +	/* Restore extended CPU state */
> +	if (restore_cpu_state_extended())
> +		pr_warn("Failed to restore extended CPU state\n");
> =20
>  	cpu_hotplug_disable();
> =20
> +	pr_info("SMT resume completed in %u ms (ret: %d)\n",
> +		jiffies_to_msecs(jiffies - start_time), ret);
> +
>  	return ret;
>  }
> +
> +/**
> + * hibernation_verification_thread - background verification of hibernat=
ion state
> + * Currently unused but available for future background integrity checki=
ng.
> + */
> +static int __maybe_unused hibernation_verification_thread(void *data)
> +{
> +	unsigned long last_check =3D jiffies;
> +	u32 last_e820_checksum =3D 0;
> +
> +	while (!kthread_should_stop()) {
> +		if (atomic_read(&hibernation_state) > 0) {
> +			/* Perform periodic integrity checks every 30 seconds */
> +			if (time_after(jiffies, last_check + 30 * HZ)) {
> +				u32 current_e820_checksum;
> +
> +				/* Check if memory map has changed */
> +				current_e820_checksum =3D compute_e820_crc32(e820_table_firmware);
> +				if (last_e820_checksum &&
> +				    current_e820_checksum !=3D last_e820_checksum) {
> +					pr_warn("Memory map changed during hibernation preparation!\n");
> +					/* Could trigger hibernation abort here */
> +				}
> +				last_e820_checksum =3D current_e820_checksum;
> +
> +				/* Verify critical system structures are still intact */
> +				if (pm_backup.valid) {
> +					/* Could check MSR consistency here */
> +					pr_debug("Hibernation state verification passed\n");
> +				}
> +
> +				last_check =3D jiffies;
> +			}
> +		} else {
> +			/* Reset verification state when hibernation is not active */
> +			last_e820_checksum =3D 0;
> +		}
> +
> +		msleep(1000);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * arch_hibernation_init - initialize hibernation support
> + */
> +static int __init arch_hibernation_init(void)
> +{
> +	int ret;
> +
> +	ret =3D hibernation_platform_prepare();
> +	if (ret)
> +		return ret;
> +
> +	pr_info("Hibernation support initialized\n");
> +	return 0;
> +}
> +
> +/**
> + * arch_hibernation_exit - cleanup hibernation support
> + */
> +static void __exit arch_hibernation_exit(void)
> +{
> +	hibernation_platform_cleanup();
> +	pr_info("Hibernation support cleaned up\n");
> +}
> +
> +module_init(arch_hibernation_init);
> +module_exit(arch_hibernation_exit);


--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--jt6M45IpirH0fJMe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaE/gSwAKCRAw5/Bqldv6
8lQyAJ9y/YJAUSOXXTmUS9TtthUKAnoPUwCfbETwivP+inQjUxDDDhQalcyLhs0=
=25zc
-----END PGP SIGNATURE-----

--jt6M45IpirH0fJMe--
