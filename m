Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080EC241678
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672973; cv=none; b=i2X/D1jtdP77VjNoTabiMvewQF1OvWGc6mWxJJepxLbsdwlzd6JDZfkTnC7k4Rh16FODRqYMgAqQBxyj6pdO686gEQIj6bCZ74mDeFFzGjlyr522rQyveUg4WrFbdUBVj0l66lZiAQadI+cxK/elB2qcPICBWpctBQ75PX0sD1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672973; c=relaxed/simple;
	bh=6tKPEyRrOoKoMd0e8cKWhIb4UdWyLCd4SdxpyxMSD7A=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=A3foFJVCWj6nneENWfHM8JQtsURLes2GwmHIBTIuxmjqSqU7E9f4jNYa+a5NHqRjZEvDlilwpNEfUEE4fb+Siv0YMKnv1EMzi8+gqAIWa2nsIyOh2q4M4dbaIS0wlWQtT32BxeDk5u3d3D5hIjKSVPrcqksj/Fqx1sy8MoqFrAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxqmqHVu5nOxewAA--.32885S3;
	Thu, 03 Apr 2025 17:36:07 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMAxj8V3Vu5n9YBtAA--.1829S3;
	Thu, 03 Apr 2025 17:35:52 +0800 (CST)
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
To: Josh Poimboeuf <jpoimboe@kernel.org>, Philip Li <philip.li@intel.com>
References: <202504011011.jyZ6NtXx-lkp@intel.com> <Z+ttzRArSBMqfABz@rli9-mobl>
 <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6>
Cc: kernel test robot <lkp@intel.com>, Guenter Roeck <linux@roeck-us.net>,
 oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>
Date: Thu, 3 Apr 2025 17:35:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMAxj8V3Vu5n9YBtAA--.1829S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cr15Zw4fWw1rCrWUKr13ZFc_yoW8uw4xpa
	y3Aa1vyr48Xry0q39rtas0ga1Dtr4DGw13WFyY9ryUZF42vry3uFyIyFZ8WF9FywnrC340
	qrWSq3Z3tF4jv3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU

On 04/02/2025 03:45 AM, Josh Poimboeuf wrote:
> On Tue, Apr 01, 2025 at 12:38:37PM +0800, Philip Li wrote:
>> On Tue, Apr 01, 2025 at 10:44:57AM +0800, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> head:   405e2241def89c88f008dcb899eb5b6d4be8b43c
>>> commit: 9016dad4dca4bbe61c48ffd5a273cad980caa0d1 [12681/13861] loongarch: add support for suppressing warning backtraces
>>> config: loongarch-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/config)
>>> compiler: loongarch64-linux-gcc (GCC) 14.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011011.jyZ6NtXx-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504011011.jyZ6NtXx-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>>> drivers/i2c/i2c-core-base.o: warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0 reg2[24]=-2-24
>
> Tiezhu, this looks like a loongarch GCC bug with asm goto, or am I
> confused?  See analysis below.

This is related with GCC optimization "-fshrink-wrap" which is default y
on LoongArch, use "-fno-shrink-wrap" can avoid such issues, like this:

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

If you are OK with this change, I will send a formal patch after the
merge window.

Thanks,
Tiezhu

