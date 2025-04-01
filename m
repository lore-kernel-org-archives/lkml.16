Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29441C2C6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473155; cv=none; b=Zn3QAdHcpHPbvJBJuLwle7TNMshRZYOZUzmIbTYx+r7YDoYDcvET5v9aTgU8rgrU1YdKptwxeB9RhfMPbxnK7+UpV5im/Mc8hgv2ZXDdNXDULQTOJWj+qyTNnMoNM50B5Si3tar/hdh+G6C6BDkrk34qFHwlKNp7ggDBnWMgIaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473155; c=relaxed/simple;
	bh=CkrBqxuCzRtBWuZQaSvr72zdRk8rDVRjaKYELcQedRA=;
	h=To:References:Subject:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=LTYljD4bazal5ct+0No+0pOJfYsrnLXgOFxM+J6KMC8+Lss7PAJow6dqT5CG/7Z9tnrnxorDn+4fePyM3sEondV+qWt0jEmNMLKPyh2ktiTCuPd6VvBIku3pqBsxft2Xe8mo7vAxbAGMW5X0Y08Pb0sdAW+250YAPBIAWWZhIMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxjXL9SetnFiutAA--.26860S3;
	Tue, 01 Apr 2025 10:05:49 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxPsf1SetnLAZqAA--.57939S3;
	Tue, 01 Apr 2025 10:05:42 +0800 (CST)
To: philip.li@intel.com
References: <Z+s1ceHFa0L1GMrn@rli9-mobl>
Subject: Re: [GIT PULL] objtool fixes and updates
Cc: a.p.zijlstra@chello.nl, akpm@linux-foundation.org, bp@alien8.de,
 jpoimboe@kernel.org, linux-kernel@vger.kernel.org, lkp@intel.com,
 mingo@kernel.org, tglx@linutronix.de, torvalds@linux-foundation.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <703f98e1-5638-5feb-2b66-7cf7bb21a896@loongson.cn>
Date: Tue, 1 Apr 2025 10:05:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Z+s1ceHFa0L1GMrn@rli9-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxPsf1SetnLAZqAA--.57939S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF43trykKFy5Jr1xtFW3XFc_yoWkCrgEkr
	y3J3WUJrZ5X3WqkF10v3Za9r1vq3WUKF95Zr1UXr4fJwnxAa1aka93Z3yfAwn3KrZYgrZ8
	ur45J3ZF9wnIgosvyTuYvTs0mTUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
	twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0mhrUUUUU=

Hi all,

Sorry for the late reply.

(1) The following objtool warnings:

modpost: "kvm_restore_lsx" [arch/loongarch/kvm/kvm.ko] undefined!
modpost: "kvm_restore_lasx" [arch/loongarch/kvm/kvm.ko] undefined!

have been fixed and merged (2024-08-26):

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=80376323e2b6

There are "Reported-by" and "Closes" tags in the commit message.

Reported-by: kernel test robot <lkp@intel.com>
Closes: 
https://lore.kernel.org/oe-kbuild-all/202408120955.qls5oNQY-lkp@intel.com/

(2) I did not meet the following objtool warnings before this merge
window:

arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack 
state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack 
state mismatch: reg1[23]=-1+0 reg2[23]=-2-152

and I did not notice the robot report due to there are many unread mails
in my inbox, I will try to reproduce it and take a deeper look at the
problem, maybe it is related with some special configs.

Thanks,
Tiezhu

