Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D1C202F79
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210929; cv=none; b=NU0RjF8kociNTS3t0xKyLPNvDMLT/o96A63sqDM0nAR1hUFQut4AMSqCbGcfEvcO6MOfKYUC7FoL0TwpLkz30aG7AFNSMHGT0VVpv/UQU63AoUeJ0KKml7hxT/JMyoftGNQU59QmP2+SL1WYgBdfl0pg+CDSTG6swLkVdPBvxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210929; c=relaxed/simple;
	bh=8lWfZsdSxUqerbmGaP0duk7TyrAHBahlElvneHGOfo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mH+5IbbANgA6XBsqvP5H98TLiwRPyK1UNLaT8p9HNjJ70rDfuf1+p1pr9j12U5cYENCmCDZ/7KGcIrdLr6GBssdpKFEjITTh9gmfu7Sw6qILMogXH9aiN844wGOsI7PJr0FeRNYvCwkxLpk4mdQd39tmtPWg/sXi6xceU6zORYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id D90FA432ED;
	Wed, 14 May 2025 08:22:03 +0000 (UTC)
Message-ID: <b6df6923-1028-4a6e-8cf4-e10e8fd55475@ghiti.fr>
Date: Wed, 14 May 2025 10:22:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250513151631.3520793-1-namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250513151631.3520793-1-namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeihedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepuedukedutddtfeefhfffgfdvgfevgeejgefhieduveefleejgfeikeekffegtddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpthgvshhtqdhkphhrohgsvghsqdgrshhmrdhssgenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehnrghmtggroheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsi
 hhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

On 13/05/2025 17:16, Nam Cao wrote:
> Add KUnit test for riscv kprobes, mostly for simulated instructions. The
> test install kprobes into multiple sample functions, and check that these
> functions still return the expected magic value.
>
> This test can detect some kprobe bugs reported in the past (in Link:).
>
> Link: https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/
> Link: https://lore.kernel.org/stable/c7e463c0-8cad-4f4e-addd-195c06b7b6de@iscas.ac.cn/
> Link: https://lore.kernel.org/linux-riscv/20230829182500.61875-1-namcaov@gmail.com/
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> v2: rewrite the auipc test so that clang can compile
>
>   arch/riscv/kernel/tests/Kconfig.debug         |  12 +
>   arch/riscv/kernel/tests/Makefile              |   1 +
>   arch/riscv/kernel/tests/kprobes/Makefile      |   1 +
>   .../kernel/tests/kprobes/test-kprobes-asm.S   | 229 ++++++++++++++++++
>   .../riscv/kernel/tests/kprobes/test-kprobes.c |  56 +++++
>   .../riscv/kernel/tests/kprobes/test-kprobes.h |  24 ++
>   6 files changed, 323 insertions(+)
>   create mode 100644 arch/riscv/kernel/tests/kprobes/Makefile
>   create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
>   create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes.c
>   create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes.h
>
> diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
> index 78cea5d2c270..5db4df44279e 100644
> --- a/arch/riscv/kernel/tests/Kconfig.debug
> +++ b/arch/riscv/kernel/tests/Kconfig.debug
> @@ -30,6 +30,18 @@ config RISCV_MODULE_LINKING_KUNIT
>   
>            If unsure, say N.
>   
> +config RISCV_KPROBES_KUNIT
> +       bool "KUnit test for riscv kprobes" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       depends on KPROBES
> +       default KUNIT_ALL_TESTS
> +       help
> +         Enable testing for riscv kprobes. Useful for riscv and/or kprobes
> +         development. The test verifies that kprobes do not change the behaviour
> +         of some sample functions.
> +
> +         If unsure, say N.
> +
>   endif # RUNTIME_TESTING_MENU
>   
>   endmenu # "arch/riscv/kernel runtime Testing"
> diff --git a/arch/riscv/kernel/tests/Makefile b/arch/riscv/kernel/tests/Makefile
> index 7d6c76cffe20..407e7e6c28dc 100644
> --- a/arch/riscv/kernel/tests/Makefile
> +++ b/arch/riscv/kernel/tests/Makefile
> @@ -1 +1,2 @@
>   obj-$(CONFIG_RISCV_MODULE_LINKING_KUNIT)	+= module_test/
> +obj-$(CONFIG_RISCV_KPROBES_KUNIT)		+= kprobes/
> diff --git a/arch/riscv/kernel/tests/kprobes/Makefile b/arch/riscv/kernel/tests/kprobes/Makefile
> new file mode 100644
> index 000000000000..4cb6c66a98e8
> --- /dev/null
> +++ b/arch/riscv/kernel/tests/kprobes/Makefile
> @@ -0,0 +1 @@
> +obj-y += test-kprobes.o test-kprobes-asm.o
> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
> new file mode 100644
> index 000000000000..b951d0f12482
> --- /dev/null
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
> @@ -0,0 +1,229 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include "test-kprobes.h"
> +
> +SYM_FUNC_START(test_kprobes_add)
> +	li a1, KPROBE_TEST_MAGIC_UPPER
> +	li a2, KPROBE_TEST_MAGIC_LOWER
> +test_kprobes_add_addr1:
> +	add a1, a1, a2
> +test_kprobes_add_addr2:
> +	add a0, a1, x0
> +	ret
> +SYM_FUNC_END(test_kprobes_add)
> +
> +SYM_FUNC_START(test_kprobes_jal)
> +	li a0, 0
> +	mv a1, ra
> +	.option push
> +	.option norvc
> +test_kprobes_jal_addr1:
> +	jal x0, 2f
> +	ret
> +	.option pop
> +1:	li a0, KPROBE_TEST_MAGIC_UPPER
> +	ret
> +	.option push
> +	.option norvc
> +test_kprobes_jal_addr2:
> +2:	jal 1b
> +	.option pop
> +	li a2, KPROBE_TEST_MAGIC_LOWER
> +	add a0, a0, a2
> +	jr a1
> +SYM_FUNC_END(test_kprobes_jal)
> +
> +SYM_FUNC_START(test_kprobes_jalr)
> +	la a0, 1f
> +	mv a1, ra
> +	.option push
> +	.option norvc
> +test_kprobes_jalr_addr:
> +	jalr a0
> +	.option pop
> +	li t0, KPROBE_TEST_MAGIC_UPPER
> +	add a0, a0, t0
> +	jr a1
> +1:	li a0, KPROBE_TEST_MAGIC_LOWER
> +	ret
> +SYM_FUNC_END(test_kprobes_jalr)
> +
> +SYM_FUNC_START(test_kprobes_auipc)
> +test_kprobes_auipc_addr:
> +	auipc a0, KPROBE_TEST_MAGIC_LOWER
> +	la a1, test_kprobes_auipc_addr
> +	sub a0, a0, a1
> +	srli a0, a0, 12
> +	li a1, KPROBE_TEST_MAGIC_UPPER
> +	add a0, a0, a1
> +	ret
> +SYM_FUNC_END(test_kprobes_auipc)
> +
> +SYM_FUNC_START(test_kprobes_branch)
> +	.option push
> +	.option norvc
> +	li a0, 0
> +	li a1, 1
> +	li a2, 2
> +test_kprobes_branch_addr1:
> +	beqz a0, 1f
> +	ret
> +1:
> +test_kprobes_branch_addr2:
> +	beqz a1, 3f
> +test_kprobes_branch_addr3:
> +	bnez a0, 3f
> +test_kprobes_branch_addr4:
> +	bnez a2, 1f
> +	ret
> +1:
> +test_kprobes_branch_addr5:
> +	bge a1, a2, 3f
> +test_kprobes_branch_addr6:
> +	bge a2, a1, 2f
> +	ret
> +1:
> +	li t0, KPROBE_TEST_MAGIC_UPPER
> +	add a0, a0, t0
> +	ret
> +2:
> +test_kprobes_branch_addr7:
> +	blt a2, a1, 3f
> +	li a0, KPROBE_TEST_MAGIC_LOWER
> +test_kprobes_branch_addr8:
> +	blt a1, a2, 1b
> +3:
> +	li a0, 0
> +	ret
> +	.option pop
> +SYM_FUNC_END(test_kprobes_branch)
> +
> +#ifdef CONFIG_RISCV_ISA_C
> +
> +SYM_FUNC_START(test_kprobes_c_j)
> +	li a0, 0
> +test_kprobes_branch_c_j_addr1:
> +	c.j 2f
> +1:
> +	li a1, KPROBE_TEST_MAGIC_UPPER
> +	add a0, a0, a1
> +	ret
> +2:	li a0, KPROBE_TEST_MAGIC_LOWER
> +test_kprobes_branch_c_j_addr2:
> +	c.j 1b
> +SYM_FUNC_END(test_kprobes_c_j)
> +
> +SYM_FUNC_START(test_kprobes_c_jr)
> +	la a0, 2f
> +test_kprobes_c_jr_addr1:
> +	c.jr a0
> +	ret
> +1:	li a1, KPROBE_TEST_MAGIC_LOWER
> +	add a0, a0, a1
> +	ret
> +2:
> +	li a0, KPROBE_TEST_MAGIC_UPPER
> +	la a1, 1b
> +test_kprobes_c_jr_addr2:
> +	c.jr a1
> +SYM_FUNC_END(test_kprobes_c_jr)
> +
> +SYM_FUNC_START(test_kprobes_c_jalr)
> +	mv a1, ra
> +	la a0, 1f
> +test_kprobes_c_jalr_addr:
> +	c.jalr a0
> +	li a2, KPROBE_TEST_MAGIC_UPPER
> +	add a0, a0, a2
> +	jr a1
> +1:	li a0, KPROBE_TEST_MAGIC_LOWER
> +	ret
> +SYM_FUNC_END(test_kprobes_c_jalr)
> +
> +SYM_FUNC_START(test_kprobes_c_beqz)
> +	li a0, 0
> +	li a1, 1
> +test_kprobes_c_beqz_addr1:
> +	c.beqz a0, 2f
> +	ret
> +1:	li a1, KPROBE_TEST_MAGIC_UPPER
> +	add a0, a0, a1
> +	ret
> +test_kprobes_c_beqz_addr2:
> +2:	c.beqz a1, 3f
> +	li a0, KPROBE_TEST_MAGIC_LOWER
> +	mv a1, x0
> +test_kprobes_c_beqz_addr3:
> +	c.beqz a1, 1b
> +3:	li a0, 0
> +	ret
> +SYM_FUNC_END(test_kprobes_c_beqz)
> +
> +SYM_FUNC_START(test_kprobes_c_bnez)
> +	li a0, 0
> +	li a1, 1
> +test_kprobes_c_bnez_addr1:
> +	c.bnez a1, 2f
> +	ret
> +1:	li a1, KPROBE_TEST_MAGIC_UPPER
> +	add a0, a0, a1
> +	ret
> +test_kprobes_c_bnez_addr2:
> +2:	c.bnez a0, 3f
> +	li a0, KPROBE_TEST_MAGIC_LOWER
> +test_kprobes_c_bnez_addr3:
> +	c.bnez a0, 1b
> +3:	li a0, 0
> +	ret
> +SYM_FUNC_END(test_kprobes_c_bnez)
> +
> +#endif /* CONFIG_RISCV_ISA_C */
> +
> +SYM_DATA_START(test_kprobes_addresses)
> +	RISCV_PTR test_kprobes_add_addr1
> +	RISCV_PTR test_kprobes_add_addr2
> +	RISCV_PTR test_kprobes_jal_addr1
> +	RISCV_PTR test_kprobes_jal_addr2
> +	RISCV_PTR test_kprobes_jalr_addr
> +	RISCV_PTR test_kprobes_auipc_addr
> +	RISCV_PTR test_kprobes_branch_addr1
> +	RISCV_PTR test_kprobes_branch_addr2
> +	RISCV_PTR test_kprobes_branch_addr3
> +	RISCV_PTR test_kprobes_branch_addr4
> +	RISCV_PTR test_kprobes_branch_addr5
> +	RISCV_PTR test_kprobes_branch_addr6
> +	RISCV_PTR test_kprobes_branch_addr7
> +	RISCV_PTR test_kprobes_branch_addr8
> +#ifdef CONFIG_RISCV_ISA_C
> +	RISCV_PTR test_kprobes_branch_c_j_addr1
> +	RISCV_PTR test_kprobes_branch_c_j_addr2
> +	RISCV_PTR test_kprobes_c_jr_addr1
> +	RISCV_PTR test_kprobes_c_jr_addr2
> +	RISCV_PTR test_kprobes_c_jalr_addr
> +	RISCV_PTR test_kprobes_c_beqz_addr1
> +	RISCV_PTR test_kprobes_c_beqz_addr2
> +	RISCV_PTR test_kprobes_c_beqz_addr3
> +	RISCV_PTR test_kprobes_c_bnez_addr1
> +	RISCV_PTR test_kprobes_c_bnez_addr2
> +	RISCV_PTR test_kprobes_c_bnez_addr3
> +#endif /* CONFIG_RISCV_ISA_C */
> +	RISCV_PTR 0
> +SYM_DATA_END(test_kprobes_addresses)
> +
> +SYM_DATA_START(test_kprobes_functions)
> +	RISCV_PTR test_kprobes_add
> +	RISCV_PTR test_kprobes_jal
> +	RISCV_PTR test_kprobes_jalr
> +	RISCV_PTR test_kprobes_auipc
> +	RISCV_PTR test_kprobes_branch
> +#ifdef CONFIG_RISCV_ISA_C
> +	RISCV_PTR test_kprobes_c_j
> +	RISCV_PTR test_kprobes_c_jr
> +	RISCV_PTR test_kprobes_c_jalr
> +	RISCV_PTR test_kprobes_c_beqz
> +	RISCV_PTR test_kprobes_c_bnez
> +#endif /* CONFIG_RISCV_ISA_C */
> +	RISCV_PTR 0
> +SYM_DATA_END(test_kprobes_functions)
> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
> new file mode 100644
> index 000000000000..6f6cdfbf5a95
> --- /dev/null
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <linux/kernel.h>
> +#include <linux/kprobes.h>
> +#include <kunit/test.h>
> +#include "test-kprobes.h"
> +
> +static int kprobe_dummy_handler(struct kprobe *kp, struct pt_regs *regs)
> +{
> +	return 0;
> +}
> +
> +static void test_kprobe_riscv(struct kunit *test)
> +{
> +	unsigned int num_kprobe = 0;
> +	long (*func)(void);
> +	struct kprobe *kp;
> +	int i;
> +
> +	while (test_kprobes_addresses[num_kprobe])
> +		num_kprobe++;
> +
> +	kp = kcalloc(num_kprobe, sizeof(*kp), GFP_KERNEL);
> +	KUNIT_EXPECT_TRUE(test, kp);
> +	if (!kp)
> +		return;
> +
> +	for (i = 0; i < num_kprobe; ++i) {
> +		kp[i].addr = test_kprobes_addresses[i];
> +		kp[i].pre_handler = kprobe_dummy_handler;
> +		KUNIT_EXPECT_EQ(test, 0, register_kprobe(&kp[i]));


Will kp be freed if the test fails?


> +	}
> +
> +	for (i = 0;; ++i) {
> +		func = test_kprobes_functions[i];
> +		if (!func)
> +			break;
> +		KUNIT_EXPECT_EQ_MSG(test, KPROBE_TEST_MAGIC, func(), "function %d broken", i);
> +	}
> +
> +	for (i = 0; i < num_kprobe; ++i)
> +		unregister_kprobe(&kp[i]);
> +	kfree(kp);
> +}
> +
> +static struct kunit_case kprobes_testcases[] = {
> +	KUNIT_CASE(test_kprobe_riscv),
> +	{}
> +};
> +
> +static struct kunit_suite kprobes_test_suite = {
> +	.name = "kprobes_test_riscv",
> +	.test_cases = kprobes_testcases,
> +};
> +
> +kunit_test_suites(&kprobes_test_suite);
> diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> new file mode 100644
> index 000000000000..3886ab491ecb
> --- /dev/null
> +++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +#ifndef TEST_KPROBES_H
> +#define TEST_KPROBES_H
> +
> +/*
> + * The magic value that all the functions in the test_kprobes_functions array return. The test
> + * installs kprobes into these functions, and verify that the functions still correctly return this
> + * value.
> + */
> +#define KPROBE_TEST_MAGIC          0xcafebabe
> +#define KPROBE_TEST_MAGIC_LOWER    0x0000babe
> +#define KPROBE_TEST_MAGIC_UPPER    0xcafe0000
> +
> +#ifndef __ASSEMBLY__
> +
> +/* array of addresses to install kprobes */
> +extern void *test_kprobes_addresses[];
> +
> +/* array of functions that return KPROBE_TEST_MAGIC */
> +extern long (*test_kprobes_functions[])(void);
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* TEST_KPROBES_H */


Other than that, you can add:

Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I'll merge it for 6.16.

Thanks for adding new tests, KUnit tests do not run yet in the CI but 
I'll add them soon!

Alex

