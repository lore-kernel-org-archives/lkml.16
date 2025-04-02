Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DC920B1E2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 04:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743567090; cv=none; b=XKBzBhpf5+Pk+m8szLQ4DwQbKDE0cLKCx2DnHWqH8oFOiekiXA3DsB8TQL9wEmW7lE9zMFoln/MLjN7uSp/q6OGXHPSiwU3CBTc95EbqwaD+HQTjc1LDn1BurE5UAUPz9nyP7b3JMkTSmPmzmNeaFcyvzkJXljrem8oF8JXADXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743567090; c=relaxed/simple;
	bh=XMnN6MxSnV0ghuItn8lbmWAM6dZEuCFwAl9WOCQVvEE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ektUxKCNDRL6ID9LXZkRll8y0CUrILyBi/hBA4re46bjdpKgQQsQqIJxZbqBDgZS7CUOkUyCJab6pRi5Wb52uUA1BHwil8RRnj7/puvkdb6nnV8oFfx86oCwdo/eH73Ou2Ro41YZiGk5ho3R4d86MvlDYu2ywEgpfq/hz3bAXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=b98aZd4K; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="b98aZd4K"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5324AwFJ4060073
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 1 Apr 2025 21:10:59 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5324AwFJ4060073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743567059;
	bh=/Gsq5hj0WdIjz3EJ9H19ef/TgdfGVDdNESH7a5tyw24=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=b98aZd4KBC92jK+1kspkM+d7zh9+Ubs90nkHQ5+L+i9omycCbobB774lgN/zYWwuA
	 eoQwWNypEf+JGKA3/9c5w+Z2wer0E02VNdbom2mzh72rmiu2ZDXK9YG+cEHxJ+hoDs
	 a2KRwMaioE9iFz2vt0CZth26unFodvJtut4rKmALJsWzgKMEspH+/hO9W+0y1zXVpt
	 Zot25GtvX6ys/8bhm6LosD7n+aMiuiku06mEvjhqiga9EgVBs3KZJZDZnGTSU9VhHg
	 q7OWkPC14eKOPsjZhgt1d4/rvIhYzLkj+n+lIkYUVJMERQmt7Ywkg3TvoJXS9vUiAT
	 cBou5Mpq66Nqw==
Date: Tue, 01 Apr 2025 21:10:55 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
CC: Juergen Gross <jgross@suse.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_40/41=5D_x86/alternatives=3A_Rename_=27te?=
 =?US-ASCII?Q?xt=5Fpoke=5Fsync=28=29=27_to_=27tex?=
 =?US-ASCII?Q?t=5Fpoke=5Fsync=5Feach=5Fcpu=28=29=27?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250327205355.378659-41-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org> <20250327205355.378659-41-mingo@kernel.org>
Message-ID: <DA9DB9BF-2179-4C53-86A8-6205346AA76F@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 27, 2025 1:53:53 PM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>Unlike sync_core(), text_poke_sync() is a very heavy operation, as
>it sends an IPI to every online CPU in the system and waits for
>completion=2E
>
>Reflect this in the name=2E
>
>Signed-off-by: Ingo Molnar <mingo@kernel=2Eorg>
>---
> arch/x86/include/asm/text-patching=2Eh |  2 +-
> arch/x86/kernel/alternative=2Ec        | 12 ++++++------
> arch/x86/kernel/kprobes/core=2Ec       |  4 ++--
> arch/x86/kernel/kprobes/opt=2Ec        |  4 ++--
> arch/x86/kernel/module=2Ec             |  2 +-
> 5 files changed, 12 insertions(+), 12 deletions(-)
>
>diff --git a/arch/x86/include/asm/text-patching=2Eh b/arch/x86/include/as=
m/text-patching=2Eh
>index 611957617278=2E=2Eff30aa1d0c47 100644
>--- a/arch/x86/include/asm/text-patching=2Eh
>+++ b/arch/x86/include/asm/text-patching=2Eh
>@@ -32,7 +32,7 @@ extern void apply_relocation(u8 *buf, const u8 * const =
instr, size_t instrlen, u
>  * an inconsistent instruction while you patch=2E
>  */
> extern void *text_poke(void *addr, const void *opcode, size_t len);
>-extern void text_poke_sync(void);
>+extern void text_poke_sync_each_cpu(void);
> extern void *text_poke_kgdb(void *addr, const void *opcode, size_t len);
> extern void *text_poke_copy(void *addr, const void *opcode, size_t len);
> #define text_poke_copy text_poke_copy
>diff --git a/arch/x86/kernel/alternative=2Ec b/arch/x86/kernel/alternativ=
e=2Ec
>index 1b523496a2f6=2E=2E32d3707d7963 100644
>--- a/arch/x86/kernel/alternative=2Ec
>+++ b/arch/x86/kernel/alternative=2Ec
>@@ -2445,7 +2445,7 @@ static void do_sync_core(void *info)
> 	sync_core();
> }
>=20
>-void text_poke_sync(void)
>+void text_poke_sync_each_cpu(void)
> {
> 	on_each_cpu(do_sync_core, NULL, 1);
> }
>@@ -2469,8 +2469,8 @@ struct text_poke_int3_loc {
> #define TP_ARRAY_NR_ENTRIES_MAX (PAGE_SIZE / sizeof(struct text_poke_int=
3_loc))
>=20
> static struct text_poke_int3_array {
>-	int nr_entries;
> 	struct text_poke_int3_loc vec[TP_ARRAY_NR_ENTRIES_MAX];
>+	int nr_entries;
> } tp_array;
>=20
> static DEFINE_PER_CPU(atomic_t, tp_array_refs);
>@@ -2649,7 +2649,7 @@ static void text_poke_int3_batch_process(void)
> 		text_poke(text_poke_int3_addr(&tp_array=2Evec[i]), &int3, INT3_INSN_SI=
ZE);
> 	}
>=20
>-	text_poke_sync();
>+	text_poke_sync_each_cpu();
>=20
> 	/*
> 	 * Second step: update all but the first byte of the patched range=2E
>@@ -2711,7 +2711,7 @@ static void text_poke_int3_batch_process(void)
> 		 * not necessary and we'd be safe even without it=2E But
> 		 * better safe than sorry (plus there's not only Intel)=2E
> 		 */
>-		text_poke_sync();
>+		text_poke_sync_each_cpu();
> 	}
>=20
> 	/*
>@@ -2732,13 +2732,13 @@ static void text_poke_int3_batch_process(void)
> 	}
>=20
> 	if (do_sync)
>-		text_poke_sync();
>+		text_poke_sync_each_cpu();
>=20
> 	/*
> 	 * Remove and wait for refs to be zero=2E
> 	 *
> 	 * Notably, if after step-3 above the INT3 got removed, then the
>-	 * text_poke_sync() will have serialized against any running INT3
>+	 * text_poke_sync_each_cpu() will have serialized against any running I=
NT3
> 	 * handlers and the below spin-wait will not happen=2E
> 	 *
> 	 * IOW=2E unless the replacement instruction is INT3, this case goes
>diff --git a/arch/x86/kernel/kprobes/core=2Ec b/arch/x86/kernel/kprobes/c=
ore=2Ec
>index 09608fd93687=2E=2E5e35c95524dc 100644
>--- a/arch/x86/kernel/kprobes/core=2Ec
>+++ b/arch/x86/kernel/kprobes/core=2Ec
>@@ -808,7 +808,7 @@ void arch_arm_kprobe(struct kprobe *p)
> 	u8 int3 =3D INT3_INSN_OPCODE;
>=20
> 	text_poke(p->addr, &int3, 1);
>-	text_poke_sync();
>+	text_poke_sync_each_cpu();
> 	perf_event_text_poke(p->addr, &p->opcode, 1, &int3, 1);
> }
>=20
>@@ -818,7 +818,7 @@ void arch_disarm_kprobe(struct kprobe *p)
>=20
> 	perf_event_text_poke(p->addr, &int3, 1, &p->opcode, 1);
> 	text_poke(p->addr, &p->opcode, 1);
>-	text_poke_sync();
>+	text_poke_sync_each_cpu();
> }
>=20
> void arch_remove_kprobe(struct kprobe *p)
>diff --git a/arch/x86/kernel/kprobes/opt=2Ec b/arch/x86/kernel/kprobes/op=
t=2Ec
>index 54bc5e7c6886=2E=2E5efa7b50bbb3 100644
>--- a/arch/x86/kernel/kprobes/opt=2Ec
>+++ b/arch/x86/kernel/kprobes/opt=2Ec
>@@ -513,11 +513,11 @@ void arch_unoptimize_kprobe(struct optimized_kprobe=
 *op)
> 	       JMP32_INSN_SIZE - INT3_INSN_SIZE);
>=20
> 	text_poke(addr, new, INT3_INSN_SIZE);
>-	text_poke_sync();
>+	text_poke_sync_each_cpu();
> 	text_poke(addr + INT3_INSN_SIZE,
> 		  new + INT3_INSN_SIZE,
> 		  JMP32_INSN_SIZE - INT3_INSN_SIZE);
>-	text_poke_sync();
>+	text_poke_sync_each_cpu();
>=20
> 	perf_event_text_poke(op->kp=2Eaddr, old, JMP32_INSN_SIZE, new, JMP32_IN=
SN_SIZE);
> }
>diff --git a/arch/x86/kernel/module=2Ec b/arch/x86/kernel/module=2Ec
>index a7998f351701=2E=2E1c598c90e24d 100644
>--- a/arch/x86/kernel/module=2Ec
>+++ b/arch/x86/kernel/module=2Ec
>@@ -206,7 +206,7 @@ static int write_relocate_add(Elf64_Shdr *sechdrs,
> 				   write, apply);
>=20
> 	if (!early) {
>-		text_poke_sync();
>+		text_poke_sync_each_cpu();
> 		mutex_unlock(&text_mutex);
> 	}
>=20

Is that the only use case we have for syncing all CPUs?
