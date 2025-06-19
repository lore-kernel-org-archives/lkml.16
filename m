Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B85224227
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750329660; cv=none; b=pQRzBCWZl2ikHERkrqWYguXJw9WJYzyJyMe36O0Yfbwsww9jMVwO6buNuEEk19HP3ve1KlOIB+DlUBqg0FL45O0TdOhglc9M50wZEAX38XCg2Bdycx8IpSoaV7fz0/SP0n4HveGM/jh+q4wkRXnXx9b/JNl/cFnW7OtSKdu2kMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750329660; c=relaxed/simple;
	bh=Az3HnVVruQb6K2JnBShyMnhLhpoJ5cnpifQhkUn2gsw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FxoSH6VnAD3qAbeKqM/WUv4lcwVCznsN0JfhayGDjv8BywIhDNQOvWmxfnv2tx/jz6sC5Ko6NC4fqlXcoc7xTHzj0AYyQByrpq41feyolTNoSzEPzChLGJSSK6oT5z3XHVp8rLE+RmZW3scQ9ngpf0X8qfyH/HdWgrSUVatqNsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=by3q6MBR; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="by3q6MBR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=JIXQl7kPA2kTbpEaXSHIxKDvEWNaKOXoyKqW/5vzYPA=;
	t=1750329658; x=1751539258; b=by3q6MBRmrspm/OPXiqRAQISoXM2OAC3yYQXvem0UsCLHtV
	vUt4OWuxyVLn0GNNUK+ylU1b788yApRL8wVY+WBXtoqrNIYo/hrXSWi4792pJ00bOKAayfDpKOJMl
	41XZMhEBzsDP3CCV2U8v+L/V7sjtMvJb9x1hjzpaX7r9f6VUO63IgcsT0aaYDgkg8N+rYQNP0mISo
	MMnsFTd+hQVjeoudgUOMw0gEY1I1N4LDB2Nf3OVXed9w6Dzfc6B5RvrfQTW9Xa2geZEsqpz2137zt
	NV3NxQh4TPRVgO5sOgTIMElzpO3TfcClwpgB5MOeN8DQsgGUMETwzF5f3gP6+aCw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1uSChR-00000000wrN-0OCc;
	Thu, 19 Jun 2025 12:40:53 +0200
Message-ID: <412c514334ac14a992cab3e7b86170b96d60be1c.camel@sipsolutions.net>
Subject: Re: [PATCH v9 07/13] um: nommu: configure fs register on host
 syscall invocation
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Hajime Tazaki <thehajime@gmail.com>, linux-um@lists.infradead.org
Cc: ricarkol@google.com, Liam.Howlett@oracle.com,
 linux-kernel@vger.kernel.org
Date: Thu, 19 Jun 2025 12:40:49 +0200
In-Reply-To: <2863dab9b3f9d6536b73623398a3f39e4ae70957.1750294482.git.thehajime@gmail.com> (sfid-20250619_030511_737629_D1683245)
References: <cover.1750294482.git.thehajime@gmail.com>
	 <2863dab9b3f9d6536b73623398a3f39e4ae70957.1750294482.git.thehajime@gmail.com>
	 (sfid-20250619_030511_737629_D1683245)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2025-06-19 at 10:04 +0900, Hajime Tazaki wrote:
> As userspace on UML/!MMU also need to configure %fs register when it is
> running to correctly access thread structure, host syscalls implemented
> in os-Linux drivers may be puzzled when they are called.=C2=A0 Thus it ha=
s to
> configure %fs register via arch_prctl(SET_FS) on every host syscalls.

Really, I still think that we should "just" get rid of libc entirely
inside UML. That would avoid so many weird/potential issues =E2=80=A6

Doesn't change the fact that FS/GS needs to be restored when doing
thread switches and such. Though one might be able to do it entirely
within arch_switch_to then.

Benjamin


>=20
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> Signed-off-by: Ricardo Koller <ricarkol@google.com>
> ---
> =C2=A0arch/um/include/shared/os.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 6 +++
> =C2=A0arch/um/os-Linux/process.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 +++
> =C2=A0arch/um/os-Linux/start_up.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=
1 +++++++++
> =C2=A0arch/x86/um/nommu/do_syscall_64.c | 37 ++++++++++++++++
> =C2=A0arch/x86/um/nommu/syscalls_64.c=C2=A0=C2=A0 | 71 ++++++++++++++++++=
+++++++++++++
> =C2=A05 files changed, 141 insertions(+)
>=20
> diff --git a/arch/um/include/shared/os.h b/arch/um/include/shared/os.h
> index 1251f08e26d0..7c6a8bc0447c 100644
> --- a/arch/um/include/shared/os.h
> +++ b/arch/um/include/shared/os.h
> @@ -189,6 +189,7 @@ extern void check_host_supports_tls(int *supports_tls=
, int *tls_min);
> =C2=A0extern void get_host_cpu_features(
> =C2=A0	void (*flags_helper_func)(char *line),
> =C2=A0	void (*cache_helper_func)(char *line));
> +extern int host_has_fsgsbase;
> =C2=A0
> =C2=A0/* mem.c */
> =C2=A0extern int create_mem_file(unsigned long long len);
> @@ -213,6 +214,11 @@ extern int os_protect_memory(void *addr, unsigned lo=
ng len,
> =C2=A0extern int os_unmap_memory(void *addr, int len);
> =C2=A0extern int os_drop_memory(void *addr, int length);
> =C2=A0extern int can_drop_memory(void);
> +extern int os_arch_prctl(int pid, int option, unsigned long *arg);
> +#ifndef CONFIG_MMU
> +extern long long host_fs;
> +#endif
> +
> =C2=A0
> =C2=A0void os_set_pdeathsig(void);
> =C2=A0
> diff --git a/arch/um/os-Linux/process.c b/arch/um/os-Linux/process.c
> index 8a1ab59a089f..3a6d34ccd12b 100644
> --- a/arch/um/os-Linux/process.c
> +++ b/arch/um/os-Linux/process.c
> @@ -16,6 +16,7 @@
> =C2=A0#include <sys/prctl.h>
> =C2=A0#include <sys/wait.h>
> =C2=A0#include <asm/unistd.h>
> +#include <sys/syscall.h>=C2=A0=C2=A0 /* For SYS_xxx definitions */
> =C2=A0#include <linux/threads.h>
> =C2=A0#include <init.h>
> =C2=A0#include <longjmp.h>
> @@ -178,6 +179,11 @@ int __init can_drop_memory(void)
> =C2=A0	return ok;
> =C2=A0}
> =C2=A0
> +int os_arch_prctl(int pid, int option, unsigned long *arg2)
> +{
> +	return syscall(SYS_arch_prctl, option, arg2);
> +}
> +
> =C2=A0void init_new_thread_signals(void)
> =C2=A0{
> =C2=A0	set_handler(SIGSEGV);
> diff --git a/arch/um/os-Linux/start_up.c b/arch/um/os-Linux/start_up.c
> index 4e1f05360c49..55dd92bd2a0b 100644
> --- a/arch/um/os-Linux/start_up.c
> +++ b/arch/um/os-Linux/start_up.c
> @@ -20,6 +20,8 @@
> =C2=A0#include <sys/resource.h>
> =C2=A0#include <asm/ldt.h>
> =C2=A0#include <asm/unistd.h>
> +#include <sys/auxv.h>
> +#include <asm/hwcap2.h>
> =C2=A0#include <init.h>
> =C2=A0#include <os.h>
> =C2=A0#include <kern_util.h>
> @@ -36,6 +38,8 @@
> =C2=A0#include <skas.h>
> =C2=A0#include "internal.h"
> =C2=A0
> +int host_has_fsgsbase;
> +
> =C2=A0static void ptrace_child(void)
> =C2=A0{
> =C2=A0	int ret;
> @@ -459,6 +463,20 @@ __uml_setup("seccomp=3D", uml_seccomp_config,
> =C2=A0"=C2=A0=C2=A0=C2=A0 This is insecure and should only be used with a=
 trusted userspace\n\n"
> =C2=A0);
> =C2=A0
> +static void __init check_fsgsbase(void)
> +{
> +	unsigned long auxv =3D getauxval(AT_HWCAP2);
> +
> +	os_info("Checking FSGSBASE instructions...");
> +	if (auxv & HWCAP2_FSGSBASE) {
> +		host_has_fsgsbase =3D 1;
> +		os_info("OK\n");
> +	} else {
> +		host_has_fsgsbase =3D 0;
> +		os_info("disabled\n");
> +	}
> +}
> +
> =C2=A0void __init os_early_checks(void)
> =C2=A0{
> =C2=A0	int pid;
> @@ -484,6 +502,9 @@ void __init os_early_checks(void)
> =C2=A0	using_seccomp =3D 0;
> =C2=A0	check_ptrace();
> =C2=A0
> +	/* probe fsgsbase instruction */
> +	check_fsgsbase();
> +
> =C2=A0	pid =3D start_ptraced_child();
> =C2=A0	if (init_pid_registers(pid))
> =C2=A0		fatal("Failed to initialize default registers");
> diff --git a/arch/x86/um/nommu/do_syscall_64.c b/arch/x86/um/nommu/do_sys=
call_64.c
> index 5d0fa83e7fdc..796beb0089fc 100644
> --- a/arch/x86/um/nommu/do_syscall_64.c
> +++ b/arch/x86/um/nommu/do_syscall_64.c
> @@ -2,10 +2,38 @@
> =C2=A0
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/ptrace.h>
> +#include <asm/fsgsbase.h>
> +#include <asm/prctl.h>
> =C2=A0#include <kern_util.h>
> =C2=A0#include <sysdep/syscalls.h>
> =C2=A0#include <os.h>
> =C2=A0
> +static int os_x86_arch_prctl(int pid, int option, unsigned long *arg2)
> +{
> +	if (!host_has_fsgsbase)
> +		return os_arch_prctl(pid, option, arg2);
> +
> +	switch (option) {
> +	case ARCH_SET_FS:
> +		wrfsbase(*arg2);
> +		break;
> +	case ARCH_SET_GS:
> +		wrgsbase(*arg2);
> +		break;
> +	case ARCH_GET_FS:
> +		*arg2 =3D rdfsbase();
> +		break;
> +	case ARCH_GET_GS:
> +		*arg2 =3D rdgsbase();
> +		break;
> +	default:
> +		pr_warn("%s: unsupported option: 0x%x", __func__, option);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> =C2=A0__visible void do_syscall_64(struct pt_regs *regs)
> =C2=A0{
> =C2=A0	int syscall;
> @@ -17,6 +45,9 @@ __visible void do_syscall_64(struct pt_regs *regs)
> =C2=A0		 syscall, (unsigned long)current,
> =C2=A0		 (unsigned long)sys_call_table[syscall]);
> =C2=A0
> +	/* set fs register to the original host one */
> +	os_x86_arch_prctl(0, ARCH_SET_FS, (void *)host_fs);
> +
> =C2=A0	if (likely(syscall < NR_syscalls)) {
> =C2=A0		PT_REGS_SET_SYSCALL_RETURN(regs,
> =C2=A0				EXECUTE_SYSCALL(syscall, regs));
> @@ -34,4 +65,10 @@ __visible void do_syscall_64(struct pt_regs *regs)
> =C2=A0	/* force do_signal() --> is_syscall() */
> =C2=A0	set_thread_flag(TIF_SIGPENDING);
> =C2=A0	interrupt_end();
> +
> +	/* restore back fs register to userspace configured one */
> +	os_x86_arch_prctl(0, ARCH_SET_FS,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void *)(current->thread.regs.regs.gp[F=
S_BASE
> +						=C2=A0=C2=A0=C2=A0=C2=A0 / sizeof(unsigned long)]));
> +
> =C2=A0}
> diff --git a/arch/x86/um/nommu/syscalls_64.c b/arch/x86/um/nommu/syscalls=
_64.c
> index c78c442aed1d..5bb6d55b4bb5 100644
> --- a/arch/x86/um/nommu/syscalls_64.c
> +++ b/arch/x86/um/nommu/syscalls_64.c
> @@ -13,8 +13,70 @@
> =C2=A0#include <asm/prctl.h> /* XXX This should get the constants from li=
bc */
> =C2=A0#include <registers.h>
> =C2=A0#include <os.h>
> +#include <asm/thread_info.h>
> +#include <asm/mman.h>
> =C2=A0#include "syscalls.h"
> =C2=A0
> +/*
> + * The guest libc can change FS, which confuses the host libc.
> + * In fact, changing FS directly is not supported (check
> + * man arch_prctl). So, whenever we make a host syscall,
> + * we should be changing FS to the original FS (not the
> + * one set by the guest libc). This original FS is stored
> + * in host_fs.
> + */
> +long long host_fs =3D -1;
> +
> +long arch_prctl(struct task_struct *task, int option,
> +		unsigned long __user *arg2)
> +{
> +	long ret =3D -EINVAL;
> +	unsigned long *ptr =3D arg2, tmp;
> +
> +	switch (option) {
> +	case ARCH_SET_FS:
> +		if (host_fs =3D=3D -1)
> +			os_arch_prctl(0, ARCH_GET_FS, (void *)&host_fs);
> +		ret =3D 0;
> +		break;
> +	case ARCH_SET_GS:
> +		ret =3D 0;
> +		break;
> +	case ARCH_GET_FS:
> +	case ARCH_GET_GS:
> +		ptr =3D &tmp;
> +		break;
> +	}
> +
> +	ret =3D os_arch_prctl(0, option, ptr);
> +	if (ret)
> +		return ret;
> +
> +	switch (option) {
> +	case ARCH_SET_FS:
> +		current->thread.regs.regs.gp[FS_BASE / sizeof(unsigned long)] =3D
> +			(unsigned long) arg2;
> +		break;
> +	case ARCH_SET_GS:
> +		current->thread.regs.regs.gp[GS_BASE / sizeof(unsigned long)] =3D
> +			(unsigned long) arg2;
> +		break;
> +	case ARCH_GET_FS:
> +		ret =3D put_user(current->thread.regs.regs.gp[FS_BASE / sizeof(unsigne=
d long)], arg2);
> +		break;
> +	case ARCH_GET_GS:
> +		ret =3D put_user(current->thread.regs.regs.gp[GS_BASE / sizeof(unsigne=
d long)], arg2);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +SYSCALL_DEFINE2(arch_prctl, int, option, unsigned long, arg2)
> +{
> +	return arch_prctl(current, option, (unsigned long __user *) arg2);
> +}
> +
> =C2=A0void arch_switch_to(struct task_struct *to)
> =C2=A0{
> =C2=A0	/*
> @@ -42,3 +104,12 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned l=
ong, len,
> =C2=A0
> =C2=A0	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off >> PAGE_SHI=
FT);
> =C2=A0}
> +
> +static int __init um_nommu_setup_hostfs(void)
> +{
> +	/* initialize the host_fs value at boottime */
> +	os_arch_prctl(0, ARCH_GET_FS, (void *)&host_fs);
> +
> +	return 0;
> +}
> +arch_initcall(um_nommu_setup_hostfs);

