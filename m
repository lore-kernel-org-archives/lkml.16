Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867EE19D898
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023145; cv=none; b=rUqdAbb0m24wcb7Wx0a+VP3Je9pvQXlc49ButuYtu5P5Gi1YhOEiOC0X0EAFrJO2ILv/n+kveyFls7YCPZxOIudXm8OFik1HAeR8sN4EfGb4kIs4+pUVpLxfxc34MAn8x8surFfBqKywsTDv7nL7D2vXOiOktTnXLAqDhI4BRt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023145; c=relaxed/simple;
	bh=azv7dy+V9qtN/B4MRwCfouvh1u0P9FFBepJiCoKsfiQ=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JlWSrPf0MPfw/taU48TuotWDjtb3arLLynpLHbtFtYp0ZOP7nB7YPwP6s2fkj6RGpOSnXxM0yK2CcROEeEq+aSsYcrBU3tHTXbAzHX+LyrHERa3BdKpi+BGLfRWYkzMU8ROT0McTKZ7mR7+jrXG8LqBue30KDtCkhk9R/q42GfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxQK1irvNn9UW0AA--.20958S3;
	Mon, 07 Apr 2025 18:52:18 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxbsVbrvNn4VJzAA--.18984S3;
	Mon, 07 Apr 2025 18:52:12 +0800 (CST)
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <202504011011.jyZ6NtXx-lkp@intel.com> <Z+ttzRArSBMqfABz@rli9-mobl>
 <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6>
 <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>
 <lcozyamcrcuff6a3pgly7sptluuj7ubzvy4na2vrus7hfmwmb6@zv7tooy3pmkh>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0cbe7ab8-bd87-b5f7-0513-07c82a7e76c9@loongson.cn>
Date: Mon, 7 Apr 2025 18:52:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <lcozyamcrcuff6a3pgly7sptluuj7ubzvy4na2vrus7hfmwmb6@zv7tooy3pmkh>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxbsVbrvNn4VJzAA--.18984S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxtry8XF1rXrWDGry3tFy7Arc_yoW3uFWfpa
	1IvFs8GF4kGr10vwnrtF1YgrnxtFs5AF15Wry3JF1jvas0qF97W3Wftr4UuF1kJr47Za40
	q393AwnxtF1jywcCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnEfOUUUUU=

On 04/03/2025 10:37 PM, Josh Poimboeuf wrote:
> On Thu, Apr 03, 2025 at 05:35:51PM +0800, Tiezhu Yang wrote:
>> On 04/02/2025 03:45 AM, Josh Poimboeuf wrote:
>>> On Tue, Apr 01, 2025 at 12:38:37PM +0800, Philip Li wrote:
>>>> On Tue, Apr 01, 2025 at 10:44:57AM +0800, kernel test robot wrote:
>>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>>> head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
>>>>> commit: 9016dad4dca4bbe61c48ffd5a273cad980caa0d1 [12681/13861] loongarch: add support for suppressing warning backtraces
>>>>> config: loongarch-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/config)
>>>>> compiler: loongarch64-linux-gcc (GCC) 14.2.0
>>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504011011.jyZ6NtXx-lkp@intel.com/
>>>>>
>>>>> All warnings (new ones prefixed by >>):
>>>>>
>>>>>>> drivers/i2c/i2c-core-base.o: warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24
>>>
>>> Tiezhu, this looks like a loongarch GCC bug with asm goto, or am I
>>> confused?  See analysis below.
>>
>> This is related with GCC optimization "-fshrink-wrap" which is default y
>> on LoongArch, use "-fno-shrink-wrap" can avoid such issues, like this:
>
> As I showed, it looks like an actual runtime bug, not an objtool false
> positive.  Disabling it only for CONFIG_OBJTOOLonly wouldn't fix that.

Here are my thoughts:

(1) -fshrink-wrap

The prologue may perform a variety of target dependent tasks such
as saving callee-saved registers, saving the return address, etc.

On some targets some of these tasks may be independent of others
and thus may be shrink-wrapped separately. These independent tasks
are referred to as components and are handled generically by the
target independent parts of GCC.

The initialization is not done as frequently on execution paths
where this would unnecessary.

"-fshrink-wrap" is enabled by default at -O and higher, will emit
function prologues only before parts of the function that need it,
rather than at the top of the function.

https://gcc.gnu.org/onlinedocs/gccint/Shrink-wrapping-separate-components.html
https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-fshrink-wrap

There is a potential execution path with only using s0 and ra
(without using s1, s2, s3, etc): 2d58-->2d70-->2f88-->2e78-->2e84

0000000000002d58 <__i2c_transfer>:
     2d58:       02fe8063        addi.d          $sp, $sp, -96
     2d5c:       29c14077        st.d            $s0, $sp, 80
     2d60:       29c16061        st.d            $ra, $sp, 88
     2d64:       28c0408c        ld.d            $t0, $a0, 16
     2d68:       00150097        or              $s0, $a0, $zero
     2d6c:       2600018c        ldptr.d         $t0, $t0, 0
     2d70:       40021980        beqz            $t0, 536        # 2f88 
<.LVL1023>
...
0000000000002f88 <.LVL1023>:
     2f88:       1a000006        pcalau12i       $a2, 0

0000000000002f8c <.LVL1024>:
     2f8c:       1a000004        pcalau12i       $a0, 0

0000000000002f90 <.LVL1025>:
     2f90:       02c00084        addi.d          $a0, $a0, 0
     2f94:       02c1c2e5        addi.d          $a1, $s0, 112

0000000000002f98 <.LVL1026>:
     2f98:       02c000c6        addi.d          $a2, $a2, 0
     2f9c:       54000000        bl              0       # 2f9c 
<.LVL1026+0x4>
 >
0000000000002fa0 <.LVL1027>:
     2fa0:       02be8404        addi.w          $a0, $zero, -95
     2fa4:       53fed7ff        b               -300    # 2e78 <.L845>
...
0000000000002e78 <.L845>:
     2e78:       28c16061        ld.d            $ra, $sp, 88
     2e7c:       28c14077        ld.d            $s0, $sp, 80

0000000000002e80 <.LVL994>:
     2e80:       02c18063        addi.d          $sp, $sp, 96
     2e84:       4c000020        jirl            $zero, $ra, 0

 From this point of view, it seems that there is no problem for the
generated instructions of the current code, it is not a runtime bug,
just a GCC optimization.

(2) Analysis

In fact, the generated objtool warning is because the break instruction
(2ee8) which is before the restoring s1 instruction (2eec) is annotated
as dead end.

0000000000002d58 <__i2c_transfer>:
     2d58:       02fe8063        addi.d          $sp, $sp, -96
     2d5c:       29c14077        st.d            $s0, $sp, 80
     2d60:       29c16061        st.d            $ra, $sp, 88
     2d64:       28c0408c        ld.d            $t0, $a0, 16
     2d68:       00150097        or              $s0, $a0, $zero
     2d6c:       2600018c        ldptr.d         $t0, $t0, 0
     2d70:       40021980        beqz            $t0, 536        # 2f88 
<.LVL1023>
     2d74:       29c12078        st.d            $s1, $sp, 72
     2d78:       001500b8        or              $s1, $a1, $zero

0000000000002d7c <.LBB2114>:
     2d7c:       400150a0        beqz            $a1, 336        # 2ecc 
<.LVL999+0x4>
...
     2ecc:       1a000004        pcalau12i       $a0, 0

0000000000002ed0 <.LVL1000>:
     2ed0:       02c00084        addi.d          $a0, $a0, 0
     2ed4:       02c5a084        addi.d          $a0, $a0, 360
     2ed8:       54000000        bl              0       # 2ed8 
<.LVL1000+0x8>

0000000000002edc <.LVL1001>:
     2edc:       0015008c        or              $t0, $a0, $zero
     2ee0:       02bfa804        addi.w          $a0, $zero, -22
     2ee4:       44003d80        bnez            $t0, 60 # 2f20 
<.LVL1008+0x8>

0000000000002ee8 <.L10001^B7>:
     2ee8:       002a0001        break           0x1
     2eec:       28c12078        ld.d            $s1, $sp, 72

0000000000002ef0 <.LVL1002>:
     2ef0:       53ff8bff        b               -120    # 2e78 <.L845>

This issue is introduced by the following changes:

  #define __WARN_FLAGS(flags)					\
  do {								\
  	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+		__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
  	instrumentation_end();					\
  } while (0)

of commit e61a8b4b0d83 ("loongarch: add support for suppressing warning
backtraces") in the linux-next.git.

(3) -fno-shrink-wrap

"-fno-shrink-wrap" will save callee-saved registers and the return
address together as a whole block in the prologue at the top of the
function, and also restores them together as a whole block in the
epilogue.

0000000000002b38 <__i2c_transfer>:
     2b38:       02fe8063        addi.d          $sp, $sp, -96
     2b3c:       29c14077        st.d            $s0, $sp, 80
     2b40:       29c12078        st.d            $s1, $sp, 72
     2b44:       29c10079        st.d            $s2, $sp, 64
     2b48:       29c16061        st.d            $ra, $sp, 88
     2b4c:       29c0e07a        st.d            $s3, $sp, 56
     2b50:       29c0c07b        st.d            $s4, $sp, 48
     2b54:       29c0a07c        st.d            $s5, $sp, 40
     2b58:       29c0807d        st.d            $s6, $sp, 32
     2b5c:       29c0607e        st.d            $s7, $sp, 24
     2b60:       29c0407f        st.d            $s8, $sp, 16
...
0000000000002c38 <.L747>:
     2c38:       28c16061        ld.d            $ra, $sp, 88
     2c3c:       28c14077        ld.d            $s0, $sp, 80

0000000000002c40 <.LVL937>:
     2c40:       28c12078        ld.d            $s1, $sp, 72
     2c44:       28c10079        ld.d            $s2, $sp, 64

0000000000002c48 <.LVL938>:
     2c48:       28c0e07a        ld.d            $s3, $sp, 56
     2c4c:       28c0c07b        ld.d            $s4, $sp, 48
     2c50:       28c0a07c        ld.d            $s5, $sp, 40
     2c54:       28c0807d        ld.d            $s6, $sp, 32
     2c58:       28c0607e        ld.d            $s7, $sp, 24
     2c5c:       28c0407f        ld.d            $s8, $sp, 16
     2c60:       02c18063        addi.d          $sp, $sp, 96
     2c64:       4c000020        jirl            $zero, $ra, 0

(4) Solution 1
One way is to annotate __BUG_ENTRY() as reachable whether
KUNIT_IS_SUPPRESSED_WARNING() is true or false, like this:

---8<---
diff --git a/arch/loongarch/include/asm/bug.h 
b/arch/loongarch/include/asm/bug.h
index b79ff6696ce6..e41ebeaba204 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -60,8 +60,9 @@
  #define __WARN_FLAGS(flags)                                    \
  do {                                                           \
         instrumentation_begin();                                \
-       if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))                     \
-               __BUG_FLAGS(BUGFLAG_WARNING|(flags), 
ANNOTATE_REACHABLE(10001b));\
+       if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))             \
+               __BUG_FLAGS(BUGFLAG_WARNING|(flags), "");       \
+       __BUG_FLAGS(0, ANNOTATE_REACHABLE(10001b));             \
         instrumentation_end();                                  \
  } while (0)

(5) Solution 2
The other way is to use "-fno-shrink-wrap" to aovid such issue under
CONFIG_OBJTOOL at compile-time, like this:

---8<---
diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 0304eabbe606..2d5529322357 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -106,6 +106,7 @@ KBUILD_CFLAGS                       +=
-mannotate-tablejump
   else
   KBUILD_CFLAGS                  += -fno-jump-tables # keep
compatibility with older compilers
   endif
+KBUILD_CFLAGS                  += -fno-shrink-wrap
   endif

   KBUILD_RUSTFLAGS               +=
--target=loongarch64-unknown-none-softfloat -Ccode-model=small

If you have more suggestion, please let me know.

Thanks,
Tiezhu

