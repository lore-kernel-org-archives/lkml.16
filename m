Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BC2149C7D;
	Tue,  1 Apr 2025 19:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743536746; cv=none; b=ikli/8eow0KZ6P0IXL5V8f85Y0nz24+ecaRxbPA53eEkd+BV9Jad17nLkVk+rO4EEgiQ/8AAUo+jrCbCB219hbHOE0q3A5EwMT/XUGhqfFRXX6Hbs+Sz8xp9Vr3Ypdh8HvaPYYKzwORGz2bJODuxsAv0+tWtm6MtFIxeNFHW+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743536746; c=relaxed/simple;
	bh=TwX5OaqDYnptYUoV1VfrVdMnHt4LWp+L48CJwUkLQBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwyG4wbUI0ggwwKcVqA88CvGEq+EgKFLGxMr+gTdrxl2ujIj94bdP7lp3zhfXaZohJ7rfWEY6DEhcDvbHkNa+SdLQqWtziwlg2jJ+C6cfc1MaPb8u+7Z3Ui9R/f4UL2kGEi496qWGC5W6mC/9EAwqeThyWZ4egENtmaHqPDezQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKfSa25M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKfSa25M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EB2C4CEE4;
	Tue,  1 Apr 2025 19:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743536745;
	bh=TwX5OaqDYnptYUoV1VfrVdMnHt4LWp+L48CJwUkLQBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JKfSa25M0djsGVdwu2s6ex7VU+YN/F4U+Bo+G4rkIruxmeuiM1enQGaiXAU62qIBV
	 adHyV9qCIil8jgnUYzL+Be2A1FwfhHxngwJ0QbAlTjfV32azNiFpUrZvz0LtrqKPzs
	 ImNQoroSIb7P0+ken5XFlH1YuwjCkarwMHnSe85QQS4cqo2klyXqyx0O8QOmF8zmK/
	 I8mD9XLq3Lov4rkSH42PoGKM70TwjvaavalaqShmggIxAw5YW2euMgOnvZVi9iiqGY
	 QyJU9T297V02vPH/Sya2cQYMqub+SxwvBjhKekD3lA1LDn4SVWRl6n+MQVl2HATT+S
	 o+/cJ9Ll7fzjg==
Date: Tue, 1 Apr 2025 12:45:43 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Philip Li <philip.li@intel.com>, Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: kernel test robot <lkp@intel.com>, Guenter Roeck <linux@roeck-us.net>, 
	oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Alessandro Carminati <acarmina@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
Message-ID: <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6>
References: <202504011011.jyZ6NtXx-lkp@intel.com>
 <Z+ttzRArSBMqfABz@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z+ttzRArSBMqfABz@rli9-mobl>

On Tue, Apr 01, 2025 at 12:38:37PM +0800, Philip Li wrote:
> On Tue, Apr 01, 2025 at 10:44:57AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
> > commit: 9016dad4dca4bbe61c48ffd5a273cad980caa0d1 [12681/13861] loongarch: add support for suppressing warning backtraces
> > config: loongarch-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504011011.jyZ6NtXx-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/i2c/i2c-core-base.o: warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24

Tiezhu, this looks like a loongarch GCC bug with asm goto, or am I
confused?  See analysis below.


make-loongarch -j12 -s drivers/i2c/i2c-core-base.o OBJTOOL_ARGS="--sec-address --backtrace"
drivers/i2c/i2c-core-base.o: warning: objtool: __i2c_transfer+0x120 (.text+0x2e78): stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24
drivers/i2c/i2c-core-base.o: warning: objtool:   __i2c_transfer+0x168 (.text+0x2ec0): (alt)
drivers/i2c/i2c-core-base.o: warning: objtool:   __i2c_transfer+0x6c (.text+0x2dc4): (branch)
drivers/i2c/i2c-core-base.o: warning: objtool:   __i2c_transfer+0x58 (.text+0x2db0): (alt)
drivers/i2c/i2c-core-base.o: warning: objtool:   __i2c_transfer+0x44 (.text+0x2d9c): (branch)
drivers/i2c/i2c-core-base.o: warning: objtool:   __i2c_transfer+0x0 (.text+0x2d58): <=== (sym)


Below I reconstructed the code path indicated by the above backtrace.

(On a side note, I wonder why the toolchain doesn't strip the ".L" local
symbols, they're rather distracting.)


Here's the jump table to explain the static branches below:

Relocation section '.rela__jump_table' at offset 0xc7f0 contains 9 entries:
    Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
0000000000000000  00000a6d00000063 R_LARCH_32_PCREL       0000000000002db0 .L1^B1 + 0
0000000000000004  00000a6e00000063 R_LARCH_32_PCREL       0000000000002db4 .L849 + 0
0000000000000008  0000059c0000006d R_LARCH_64_PCREL       0000000000000010 i2c_trace_msg_key + 0
0000000000000010  00000a6f00000063 R_LARCH_32_PCREL       0000000000002e64 .L1^B2 + 0
0000000000000014  00000a7000000063 R_LARCH_32_PCREL       0000000000002e78 .L845 + 0
0000000000000018  0000059c0000006d R_LARCH_64_PCREL       0000000000000010 i2c_trace_msg_key + 0
0000000000000020  00000a7100000063 R_LARCH_32_PCREL       0000000000002ec0 .L1^B3 + 0
0000000000000024  00000a7000000063 R_LARCH_32_PCREL       0000000000002e78 .L845 + 0
0000000000000028  0000059c0000006d R_LARCH_64_PCREL       0000000000000010 i2c_trace_msg_key + 0


---------------
start execution
---------------

0000000000002d58 <__i2c_transfer>:
    2d58:	02fe8063 	addi.d      	$sp, $sp, -96
    2d5c:	29c14077 	st.d        	$s0, $sp, 80
    2d60:	29c16061 	st.d        	$ra, $sp, 88
    2d64:	28c0408c 	ld.d        	$t0, $a0, 16
    2d68:	00150097 	move        	$s0, $a0
    2d6c:	2600018c 	ldptr.d     	$t0, $t0, 0
    2d70:	40021980 	beqz        	$t0, 536	# 2f88 <.LVL1023>
    2d74:	29c12078 	st.d        	$s1, $sp, 72
    2d78:	001500b8 	move        	$s1, $a1

-----------------------
$s1 saved and clobbered
-----------------------

0000000000002d7c <.LBB2114>:
    2d7c:	400150a0 	beqz        	$a1, 336	# 2ecc <.LVL999+0x4>
    2d80:	29c10079 	st.d        	$s2, $sp, 64
    2d84:	001500d9 	move        	$s2, $a2

-----------------------
$s2 saved and clobbered
-----------------------

    2d88:	64014006 	blez        	$a2, 320	# 2ec8 <.LVL999>

0000000000002d8c <.LBB2115>:
    2d8c:	28c9a08c 	ld.d        	$t0, $a0, 616
    2d90:	0340058c 	andi        	$t0, $t0, 0x1
    2d94:	44016180 	bnez        	$t0, 352	# 2ef4 <.LBB2119>

0000000000002d98 <.LVL978>:
    2d98:	28cc008c 	ld.d        	$t0, $a0, 768
    2d9c:	40000d80 	beqz        	$t0, 12	# 2da8 <.LVL979+0x4>

--------------
branch -> 2da8 (adal->quirks == NULL)
--------------

    2da8:	29c0e07a 	st.d        	$s3, $sp, 56
    2dac:	29c0607e 	st.d        	$s7, $sp, 24

-----------------
$s3 and $s7 saved
-----------------

0000000000002db0 <.L1^B1>:
    2db0:	03400000 	nop

---------------------
static branch -> 2db4 (i2c_trace_msg_key enabled; branch to next insn
		       b/c clause is empty due to !CONFIG_TRACEPOINTS)
---------------------

0000000000002db4 <.L849>:
    2db4:	1a00001a 	pcalau12i   	$s3, 0	2db4: R_LARCH_GOT_PC_HI20	jiffies

-------------
$s3 clobbered
-------------

    2db8:	28c0035a 	ld.d        	$s3, $s3, 0	2db8: R_LARCH_GOT_PC_LO12	jiffies
    2dbc:	24006eec 	ldptr.w     	$t0, $s0, 108
    2dc0:	2600035e 	ldptr.d     	$s7, $s3, 0

-------------
$s7 clobbered
-------------

0000000000002dc4 <.LVL982>:
    2dc4:	6000f980 	bltz        	$t0, 248	# 2ebc <.LVL997>

--------------
branch -> 2ebc (adap->retries < 0)
--------------

0000000000002ebc <.LVL997>:
    2ebc:	00150004 	move        	$a0, $zero

0000000000002ec0 <.L1^B3>:
    2ec0:	03400000 	nop

-----------------------------
BROKEN: static branch -> 2e78 (i2c_trace_msg_key enabled; again tries to
			       skip empty tracepoint clause but branches
			       to the wrong place in epilogue, skipping
			       reg restores of callee saved registers
			       $s1, $s2, $s3, $s7)
-----------------------------

0000000000002e78 <.L845>:
    2e78:	28c16061 	ld.d        	$ra, $sp, 88
    2e7c:	28c14077 	ld.d        	$s0, $sp, 80

0000000000002e80 <.LVL994>:
    2e80:	02c18063 	addi.d      	$sp, $sp, 96

--------------------------------------
return without restoring $s1, $s2, $s3
--------------------------------------

    2e84:	4c000020 	ret



Full disassembly below:

0000000000002d58 <__i2c_transfer>:
    2d58:	02fe8063 	addi.d      	$sp, $sp, -96
    2d5c:	29c14077 	st.d        	$s0, $sp, 80
    2d60:	29c16061 	st.d        	$ra, $sp, 88
    2d64:	28c0408c 	ld.d        	$t0, $a0, 16
    2d68:	00150097 	move        	$s0, $a0
    2d6c:	2600018c 	ldptr.d     	$t0, $t0, 0
    2d70:	40021980 	beqz        	$t0, 536	# 2f88 <.LVL1023>
    2d74:	29c12078 	st.d        	$s1, $sp, 72
    2d78:	001500b8 	move        	$s1, $a1

0000000000002d7c <.LBB2114>:
    2d7c:	400150a0 	beqz        	$a1, 336	# 2ecc <.LVL999+0x4>
    2d80:	29c10079 	st.d        	$s2, $sp, 64
    2d84:	001500d9 	move        	$s2, $a2
    2d88:	64014006 	blez        	$a2, 320	# 2ec8 <.LVL999>

0000000000002d8c <.LBB2115>:
    2d8c:	28c9a08c 	ld.d        	$t0, $a0, 616
    2d90:	0340058c 	andi        	$t0, $t0, 0x1
    2d94:	44016180 	bnez        	$t0, 352	# 2ef4 <.LBB2119>

0000000000002d98 <.LVL978>:
    2d98:	28cc008c 	ld.d        	$t0, $a0, 768
    2d9c:	40000d80 	beqz        	$t0, 12	# 2da8 <.LVL979+0x4>
    2da0:	57fcdbff 	bl          	-808	# 2a78 <i2c_check_for_quirks>

0000000000002da4 <.LVL979>:
    2da4:	44018480 	bnez        	$a0, 388	# 2f28 <.LVL1010>
    2da8:	29c0e07a 	st.d        	$s3, $sp, 56
    2dac:	29c0607e 	st.d        	$s7, $sp, 24

0000000000002db0 <.L1^B1>:
    2db0:	03400000 	nop

0000000000002db4 <.L849>:
    2db4:	1a00001a 	pcalau12i   	$s3, 0	2db4: R_LARCH_GOT_PC_HI20	jiffies
    2db8:	28c0035a 	ld.d        	$s3, $s3, 0	2db8: R_LARCH_GOT_PC_LO12	jiffies
    2dbc:	24006eec 	ldptr.w     	$t0, $s0, 108
    2dc0:	2600035e 	ldptr.d     	$s7, $s3, 0

0000000000002dc4 <.LVL982>:
    2dc4:	6000f980 	bltz        	$t0, 248	# 2ebc <.LVL997>
    2dc8:	29c0c07b 	st.d        	$s4, $sp, 48
    2dcc:	1a00001b 	pcalau12i   	$s4, 0	2dcc: R_LARCH_GOT_PC_HI20	system_state
    2dd0:	29c0a07c 	st.d        	$s5, $sp, 40
    2dd4:	29c0807d 	st.d        	$s6, $sp, 32
    2dd8:	29c0407f 	st.d        	$s8, $sp, 16

0000000000002ddc <.LBB2138>:
    2ddc:	02800c1d 	li.w        	$s6, 3
    2de0:	0015001f 	move        	$s8, $zero
    2de4:	02bfd41c 	li.w        	$s5, -11
    2de8:	28c0037b 	ld.d        	$s4, $s4, 0	2de8: R_LARCH_GOT_PC_LO12	system_state

0000000000002dec <.LVL983>:
    2dec:	03400000 	nop

0000000000002df0 <.LBI2138>:
    2df0:	2400036c 	ldptr.w     	$t0, $s4, 0
    2df4:	6c00afac 	bgeu        	$s6, $t0, 172	# 2ea0 <.LVL995+0x18>

0000000000002df8 <.LBB2140>:
    2df8:	24001c4c 	ldptr.w     	$t0, $tp, 28
    2dfc:	0040818c 	slli.w      	$t0, $t0, 0x0
    2e00:	44001180 	bnez        	$t0, 16	# 2e10 <.LVL984+0x8>

0000000000002e04 <.LBB2145>:
    2e04:	0400000c 	csrrd       	$t0, 0x0

0000000000002e08 <.LVL984>:
    2e08:	0340118c 	andi        	$t0, $t0, 0x4
    2e0c:	44009580 	bnez        	$t0, 148	# 2ea0 <.LVL995+0x18>
    2e10:	28c042ec 	ld.d        	$t0, $s0, 16
    2e14:	28c0218d 	ld.d        	$t1, $t0, 8
    2e18:	40008da0 	beqz        	$t1, 140	# 2ea4 <.LVL995+0x1c>
    2e1c:	00150326 	move        	$a2, $s2
    2e20:	00150305 	move        	$a1, $s1
    2e24:	001502e4 	move        	$a0, $s0
    2e28:	4c0001a1 	jirl        	$ra, $t1, 0

0000000000002e2c <.LVL987>:
    2e2c:	5c00289c 	bne         	$a0, $s5, 40	# 2e54 <.LVL988+0x4>

0000000000002e30 <.LBB2152>:
    2e30:	29c02060 	st.d        	$zero, $sp, 8
    2e34:	2600034d 	ldptr.d     	$t1, $s3, 0
    2e38:	24006aec 	ldptr.w     	$t0, $s0, 104
    2e3c:	0011b7cd 	sub.d       	$t1, $s7, $t1
    2e40:	0010b58c 	add.d       	$t0, $t0, $t1
    2e44:	60001180 	bltz        	$t0, 16	# 2e54 <.LVL988+0x4>
    2e48:	24006eec 	ldptr.w     	$t0, $s0, 108
    2e4c:	028007ff 	addi.w      	$s8, $s8, 1

0000000000002e50 <.LVL988>:
    2e50:	67ffa19f 	bge         	$t0, $s8, -96	# 2df0 <.LBI2138>
    2e54:	28c0c07b 	ld.d        	$s4, $sp, 48
    2e58:	28c0a07c 	ld.d        	$s5, $sp, 40
    2e5c:	28c0807d 	ld.d        	$s6, $sp, 32
    2e60:	28c0407f 	ld.d        	$s8, $sp, 16

0000000000002e64 <.L1^B2>:
    2e64:	03400000 	nop
    2e68:	28c12078 	ld.d        	$s1, $sp, 72

0000000000002e6c <.LVL991>:
    2e6c:	28c10079 	ld.d        	$s2, $sp, 64

0000000000002e70 <.LVL992>:
    2e70:	28c0e07a 	ld.d        	$s3, $sp, 56
    2e74:	28c0607e 	ld.d        	$s7, $sp, 24

0000000000002e78 <.L845>:
    2e78:	28c16061 	ld.d        	$ra, $sp, 88
    2e7c:	28c14077 	ld.d        	$s0, $sp, 80

0000000000002e80 <.LVL994>:
    2e80:	02c18063 	addi.d      	$sp, $sp, 96
    2e84:	4c000020 	ret

0000000000002e88 <.LVL995>:
    2e88:	03400000 	nop
    2e8c:	03400000 	nop
    2e90:	03400000 	nop
    2e94:	03400000 	nop
    2e98:	03400000 	nop
    2e9c:	03400000 	nop
    2ea0:	28c042ec 	ld.d        	$t0, $s0, 16
    2ea4:	2600018c 	ldptr.d     	$t0, $t0, 0
    2ea8:	00150326 	move        	$a2, $s2
    2eac:	00150305 	move        	$a1, $s1
    2eb0:	001502e4 	move        	$a0, $s0
    2eb4:	4c000181 	jirl        	$ra, $t0, 0

0000000000002eb8 <.LVL996>:
    2eb8:	53ff77ff 	b           	-140	# 2e2c <.LVL987>

0000000000002ebc <.LVL997>:
    2ebc:	00150004 	move        	$a0, $zero

0000000000002ec0 <.L1^B3>:
    2ec0:	03400000 	nop
    2ec4:	53ffa7ff 	b           	-92	# 2e68 <.L1^B2+0x4>

0000000000002ec8 <.LVL999>:
    2ec8:	28c10079 	ld.d        	$s2, $sp, 64
    2ecc:	1a000004 	pcalau12i   	$a0, 0	2ecc: R_LARCH_PCALA_HI20	.LANCHOR0

0000000000002ed0 <.LVL1000>:
    2ed0:	02c00084 	addi.d      	$a0, $a0, 0	2ed0: R_LARCH_PCALA_LO12	.LANCHOR0
    2ed4:	02c5a084 	addi.d      	$a0, $a0, 360
    2ed8:	54000000 	bl          	0	# 2ed8 <.LVL1000+0x8>	2ed8: R_LARCH_B26	__kunit_is_suppressed_warning

0000000000002edc <.LVL1001>:
    2edc:	0015008c 	move        	$t0, $a0
    2ee0:	02bfa804 	li.w        	$a0, -22
    2ee4:	44003d80 	bnez        	$t0, 60	# 2f20 <.LVL1008+0x8>

0000000000002ee8 <.L10001^B7>:
    2ee8:	002a0001 	break       	0x1
    2eec:	28c12078 	ld.d        	$s1, $sp, 72

0000000000002ef0 <.LVL1002>:
    2ef0:	53ff8bff 	b           	-120	# 2e78 <.L845>

0000000000002ef4 <.LBB2119>:
    2ef4:	0280080d 	li.w        	$t1, 2
    2ef8:	02c9a08e 	addi.d      	$t2, $a0, 616
    2efc:	386cb5cc 	amor_db.d   	$t0, $t1, $t2

0000000000002f00 <.LVL1004>:
    2f00:	0340098c 	andi        	$t0, $t0, 0x2
    2f04:	40003580 	beqz        	$t0, 52	# 2f38 <.LBB2126>

0000000000002f08 <.LVL1006>:
    2f08:	28c12078 	ld.d        	$s1, $sp, 72
    2f0c:	28c10079 	ld.d        	$s2, $sp, 64

0000000000002f10 <.LVL1007>:
    2f10:	02be5004 	li.w        	$a0, -108
    2f14:	53ff67ff 	b           	-156	# 2e78 <.L845>

0000000000002f18 <.LVL1008>:
    2f18:	03400000 	nop
    2f1c:	03400000 	nop
    2f20:	28c12078 	ld.d        	$s1, $sp, 72

0000000000002f24 <.LVL1009>:
    2f24:	53ff57ff 	b           	-172	# 2e78 <.L845>

0000000000002f28 <.LVL1010>:
    2f28:	28c12078 	ld.d        	$s1, $sp, 72

0000000000002f2c <.LVL1011>:
    2f2c:	28c10079 	ld.d        	$s2, $sp, 64

0000000000002f30 <.LVL1012>:
    2f30:	02be8404 	li.w        	$a0, -95
    2f34:	53ff47ff 	b           	-188	# 2e78 <.L845>

0000000000002f38 <.LBB2126>:
    2f38:	1a000018 	pcalau12i   	$s1, 0	2f38: R_LARCH_PCALA_HI20	.LANCHOR0
    2f3c:	02c00318 	addi.d      	$s1, $s1, 0	2f3c: R_LARCH_PCALA_LO12	.LANCHOR0
    2f40:	02c5e318 	addi.d      	$s1, $s1, 376
    2f44:	00150304 	move        	$a0, $s1

0000000000002f48 <.LVL1014>:
    2f48:	54000000 	bl          	0	# 2f48 <.LVL1014>	2f48: R_LARCH_B26	__kunit_is_suppressed_warning

0000000000002f4c <.LVL1015>:
    2f4c:	47ffbc9f 	bnez        	$a0, -68	# 2f08 <.LVL1006>
    2f50:	02c1c2e4 	addi.d      	$a0, $s0, 112
    2f54:	54000000 	bl          	0	# 2f54 <.LVL1015+0x8>	2f54: R_LARCH_B26	dev_driver_string

0000000000002f58 <.LBB2127>:
    2f58:	28c302e6 	ld.d        	$a2, $s0, 192
    2f5c:	00150085 	move        	$a1, $a0

0000000000002f60 <.LBI2127>:
    2f60:	440008c0 	bnez        	$a2, 8	# 2f68 <.LBB2129+0x4>

0000000000002f64 <.LBB2129>:
    2f64:	28c1c2e6 	ld.d        	$a2, $s0, 112
    2f68:	1a000004 	pcalau12i   	$a0, 0	2f68: R_LARCH_PCALA_HI20	.LC70
    2f6c:	02c00084 	addi.d      	$a0, $a0, 0	2f6c: R_LARCH_PCALA_LO12	.LC70
    2f70:	54000000 	bl          	0	# 2f70 <.LBB2129+0xc>	2f70: R_LARCH_B26	__warn_printk

0000000000002f74 <.LVL1020>:
    2f74:	00150304 	move        	$a0, $s1
    2f78:	54000000 	bl          	0	# 2f78 <.LVL1020+0x4>	2f78: R_LARCH_B26	__kunit_is_suppressed_warning

0000000000002f7c <.LVL1021>:
    2f7c:	47ff8c9f 	bnez        	$a0, -116	# 2f08 <.LVL1006>

0000000000002f80 <.L10001^B8>:
    2f80:	002a0001 	break       	0x1


0000000000002f84 <.LVL1022>:
    2f84:	53ff87ff 	b           	-124	# 2f08 <.LVL1006>

0000000000002f88 <.LVL1023>:
    2f88:	1a000006 	pcalau12i   	$a2, 0	2f88: R_LARCH_PCALA_HI20	.LC69

0000000000002f8c <.LVL1024>:
    2f8c:	1a000004 	pcalau12i   	$a0, 0	2f8c: R_LARCH_PCALA_HI20	.LC9

0000000000002f90 <.LVL1025>:
    2f90:	02c00084 	addi.d      	$a0, $a0, 0	2f90: R_LARCH_PCALA_LO12	.LC9
    2f94:	02c1c2e5 	addi.d      	$a1, $s0, 112

0000000000002f98 <.LVL1026>:
    2f98:	02c000c6 	addi.d      	$a2, $a2, 0	2f98: R_LARCH_PCALA_LO12	.LC69
    2f9c:	54000000 	bl          	0	# 2f9c <.LVL1026+0x4>	2f9c: R_LARCH_B26	_dev_printk

0000000000002fa0 <.LVL1027>:
    2fa0:	02be8404 	li.w        	$a0, -95
    2fa4:	53fed7ff 	b           	-300	# 2e78 <.L845>
