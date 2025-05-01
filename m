Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E31922D7B5
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746064301; cv=none; b=fUQleP4fUJuw3oYdP29uuRNt95OnxIoCeRfjcd0bfjhkUKptWGwusfzITJkp0sp5qZOpmkb8neCfkcB55hn0ifGFB3T9oSGhVX2Rmp9EgfVYsX0hgLU0kNBQlfo7jerzFa21/+St4ZQCAGwq2WEZAjtfn8bITpR67pw0ari4zxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746064301; c=relaxed/simple;
	bh=/WtA148shuoup9n14wdXWf1bxHAhvI78tAqC9NQM9l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3+sHZiT5JLKmCIgepeTyzjY4KfI/NROK8GXdV6h/nnLV/HcYNs4ASDiPAcxofn7iekn+QpjH/ih7O7Ml4IRQ3GCiTrpuOymu1kxkEgdC2yAirXIqvgbG4faQjFmZHv6o6bHm2G22xcuGkysyuwnUtT7u5oAkbTx9FOiQDrz72w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hoYffa9l; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hoYffa9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=xHjs3G776GQCInNJMqFbCKA6zqU6gkWzs3y0Au26jIM=;
	b=hoYffa9lFQMW3D3FW7/p9h3QCBx/By9aocndzMtf7bMwC031pz3JXIpmXY77Ie
	YTPwDvJFl6BFx+aEU555NHW+NTiOyxQV3kXndAjG7TYB7PsWJFH21BComZXb8snl
	+PlkIL6GwMbr5/J+i5vv2RB56uopARYA3zYvtFw15xT7s=
Received: from [192.168.142.52] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgB3P7uL0xJoO5G4BQ--.13005S2;
	Thu, 01 May 2025 09:51:09 +0800 (CST)
Message-ID: <96a6e4a3-c89c-4446-8c3f-a0f173aed26a@163.com>
Date: Thu, 1 May 2025 09:51:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] genirq/msi: Fix MSI domain debugfs show
To: Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de
References: <20250430124836.49964-2-ajones@ventanamicro.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250430124836.49964-2-ajones@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:PigvCgB3P7uL0xJoO5G4BQ--.13005S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4kCryfuF43Xr17uFy3urg_yoW8CFW3pa
	y5Ka17Xr4UJrn8Wr40kF4DuryaqFy0qrW3t34Ygr1SyrZ7Jw1DKF1IgFWkCF1FvrW8JrnF
	yF4jq34Iva4DCFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zid-PUUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWwBAo2gSzliGKQAAs7



On 2025/4/30 20:48, Andrew Jones wrote:
> irq_domain_debug_show_one() calls the irqdomain's debug_show() with
> a non-null domain pointer and a null irqdata pointer
> (irq_debug_show_data() calls debug_show() with those the other way
> around). Ensure we have a non-null irqdata pointer in
> msi_domain_debug_show() before dereferencing it.
> 
> Fixes: 01499ae673dc ("genirq/msi: Expose MSI message data in debugfs")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   kernel/irq/msi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> index 5c8d43cdb0a3..c05ba7ca00fa 100644
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -761,7 +761,7 @@ static int msi_domain_translate(struct irq_domain *domain, struct irq_fwspec *fw
>   static void msi_domain_debug_show(struct seq_file *m, struct irq_domain *d,
>   				  struct irq_data *irqd, int ind)
>   {
> -	struct msi_desc *desc = irq_data_get_msi_desc(irqd);
> +	struct msi_desc *desc = irqd ? irq_data_get_msi_desc(irqd) : NULL;
>   

Hi Andrew,

I think irqd will never be NULL.


static int irq_debug_show(struct seq_file *m, void *p)
   irq_debug_show_data(m, data, 0);
     if (data->domain && data->domain->ops && data->domain->ops->debug_show)
       data->domain->ops->debug_show(m, NULL, data, ind + 1);
         msi_domain_debug_show



static int irq_debug_show(struct seq_file *m, void *p)
{
	struct irq_desc *desc = m->private;
	struct irq_data *data;

	raw_spin_lock_irq(&desc->lock);
	data = irq_desc_get_irq_data(desc);

	If it needs to be judged as NULL, should it also be here?



static void irq_domain_debug_show_one(struct seq_file *m, struct 
irq_domain *d, int ind)
   if (d->ops && d->ops->debug_show)	// d->ops->debug_show is NULL, not 
irq_debug_show.


If I'm wrong, please correct me.

Best regards,
Hans

>   	if (!desc)
>   		return;

