Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF60413B284;
	Tue, 24 Jun 2025 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750746939; cv=none; b=YT6Vj9+mahAxgaZYBywKbUhFYjkb/U+S7rtWgIPk24uKNwNX+T8NXL/EjGrcQKhScTomrEJB25f0EG91N3KmwC7hm9YEMTWtXGvj1Ev0RxtPV+mRv1n9wmcHI7uiEnrO03feafOozRGjg0xTer63iN3ealv1zLYsRxWAkZOcZlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750746939; c=relaxed/simple;
	bh=/lYFJDYHmYFQgmRSEXyjjfh598VT71rpReMsxjXzqY4=;
	h=From:Subject:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=sdS/v4qfj1uqIDU5TJzxH9F0ft1F2HXkxCy7emUD+IRXav5KRtC+pa5qBIYoBLZnyDcVdnDPO6BpYkNBAYFPlpzuPNY3pmB1r2bcnup0ACfDtAxdKr+olQ3n1OyHx4wXvAKrViq3bSt4578677UgoGybetjHMYZoYuYDP6xY1DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8AxquA2R1poNg0cAQ--.22147S3;
	Tue, 24 Jun 2025 14:35:34 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMAxDcUuR1pooWwoAQ--.52280S3;
	Tue, 24 Jun 2025 14:35:28 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: Re: [PATCH v4 0/2] Loongarch irq-redirect supprot
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, tglx@linutronix.de, jiaxun.yang@flygoat.com,
 peterz@infradead.org, wangliupu@loongson.cn, lvjianmin@loongson.cn,
 maobibo@loongson.cn, siyanteng@cqsoftware.com.cn, gaosong@loongson.cn,
 yangtiezhu@loongson.cn, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Super User <root@localhost.localdomain>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
 <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
Message-ID: <6d1eba98-e5ae-4f8e-cddc-b6dbdf20f721@loongson.cn>
Date: Tue, 24 Jun 2025 14:34:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxDcUuR1pooWwoAQ--.52280S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXr43WF15AF1kJF1UGrykJFc_yoW5ZFyxpr
	WkGrWUGrW3Ar4xCr1qvF1DZFy7Ary8G34Yqr18Wa4DGanxCr1IqF1UWr90grykJrZ5Ar4U
	Xrn8Xr9rZF1UJacCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUstxhDUUUU

Hi, Huacai

在 2025/6/10 下午7:54, Huacai Chen 写道:
> Hi, Tianyang,
>
> Have you received my comments in V3?
> https://lore.kernel.org/loongarch/20250523101833.17940-1-zhangtianyang@loongson.cn/T/#m2883f379ce7eb663f3f3eb4736bf9b071c7fd8ab

After a few days of effort, I did not let that email reappear in my 
mailbox... so I am replying to the above email here

* Re: [PATCH v3 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
   2025-05-23 10:18 ` [PATCH v3 2/2] irq/irq-loongarch-ir:Add Redirect 
irqchip support Tianyang Zhang
@ 2025-05-24 14:12   ` Huacai Chen
   2025-05-25  9:06   ` Thomas Gleixner
   1 sibling, 0 replies; 7+ messages in thread
From: Huacai Chen @ 2025-05-24 14:12 UTC (permalink / raw)
   To: Tianyang Zhang
   Cc: kernel, corbet, alexs, si.yanteng, tglx, jiaxun.yang, peterz,
     wangliupu, lvjianmin, maobibo, siyanteng, gaosong, yangtiezhu,
     loongarch, linux-doc, linux-kernel

 >> +
 >> +#define REDIRECT_REG_BASE(reg, node) \
 >> +       (UNCACHE_BASE | redirect_reg_base | (u64)(node) << 
NODE_ADDRSPACE_SHIFT | (reg))
 > IO_BASE is a little better than UNCACHE_BASE.

yes, it is batter, thanks

 >> +#define        redirect_reg_queue_head(node) 
REDIRECT_REG_BASE(LOONGARCH_IOCSR_REDIRECT_CQH, (node))
 >> +#define        redirect_reg_queue_tail(node) 
REDIRECT_REG_BASE(LOONGARCH_IOCSR_REDIRECT_CQT, (node))
 >> +#define read_queue_head(node)          (*((u32 
*)(redirect_reg_queue_head(node))))
 >> +#define read_queue_tail(node)          (*((u32 
*)(redirect_reg_queue_tail(node))))
 >> +#define write_queue_tail(node, val)    (*((u32 
*)(redirect_reg_queue_tail(node))) = (val))
 >You can use readl() and writel() directly, then you can remove the 
memory barrier around write_queue_tail().

OK , It is realy a good idea.thanks

 >> +static void irde_invlid_entry_node(struct redirect_item *item)
 > s/irde_invlid_entry_node/irde_invalid_entry_node/g

OK , thanks

 >> +       avecintc_sync(adata);
 >> +
 >> +       return IRQ_SET_MASK_OK;
 >> +}
 > Have you tried to build with no SMP? This function (and maybe more) 
should be guarded by CONFIG_SMP.

I did it at the beginning... Okay, I will supplement this test in the 
current version

 >> +static int __init redirect_reg_base_init(void)
 >> +{
 >> +       acpi_status status;
 >> +       uint64_t addr = 0;
 >> +
 >> +       if (acpi_disabled)
 >> +               return 0;
 >> +
 >> +       status = acpi_evaluate_integer(NULL, "\\_SB.NO00", NULL, &addr);
 >> +       if (ACPI_FAILURE(status) || !addr)
 >> +               pr_info("redirect_iocsr_base used default 
0x1fe00000\n");
 >> +       else
 >> +               redirect_reg_base = addr;
 >> +
 >> +       return 0;
 >> +}
 >> +subsys_initcall_sync(redirect_reg_base_init);
 >Can this function be put at the end of redirect_acpi_init()? It is too
 >late in an initcall() function because the irqchip drivers begin to
 >work before that.
Ok I got it , thanks

Tianyang


