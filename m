Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDDE18E050
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171219; cv=none; b=QoSjBnnEfylN1hvrfi7FhA6I4BBZHnhqHAVZrkEjZKohXmEEbv/p5i+NMNL0T0SHFQC6ttHE13Im9qAiqENAhm372dtUWFpK31MJPxKLEUKH+tqsF6WPiqiZiVDRPo8BR4sp7znuYq8C1J1SJL+bUDADcP/w7N/tQhIjB0VnbIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171219; c=relaxed/simple;
	bh=EDg3kKKIvfEhUiYXRH+ndG2/75Rept+NH2hSveV8OqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IR/UBwb7AUCg+fwhS4hm+o36s2JcTAGYnWSjA5WrLYcxS4IuL5a3pvgXQg+IFMZ0q1wTyMhZpQ7JHiTF1aRYEq2S9dx+6wZ6NzKQaCNfWbBIA38qmqjl8vWMKH1nHYsUGqyAQpNDQ1F/1o692lFGwgL6HEE9a3v40Axf+kq3CsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Ee/b1DJX; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Ee/b1DJX"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe574976so9758535e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746171215; x=1746776015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UWRNVnMKXNccoJcCss0GstFdOZQPVXx8WsepyduJpeA=;
        b=Ee/b1DJXHUQgC4wmLGAphjkLUG4rv5cPrIYNZUubp3F6SAuaHNrYfUXTAFJRbtkQAS
         ksVHaoNzUz2yWGcrYXyBKwXMVWbe38u/Ryv6i2WONIZCIkt2dw8/FauMQY3CW2Ej/D7J
         EARdQYi3vxjK4rFEVzO8lqA6X4GWw0iLIeJ3+hHnwrV3quFidrE0Sn5ZwQodLQ3U5lAZ
         d7/Na3GwEteeuEKM5vSPGUoBVRB0QB2qCvZSbbzCeCJKtUx5TIt7DISvcaVZt1JH/BJL
         Ux1fvavYU7R4+/tyOmjFUTWzIVswDyE9FapuYnXMtaIipZ0Soh3q5/Q69QnhbPLP8roT
         DqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171215; x=1746776015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWRNVnMKXNccoJcCss0GstFdOZQPVXx8WsepyduJpeA=;
        b=snmwIVaT8Yl1pujWNPUF0PdaKUc+ziAEaQH23L4g9i1+hwzvqyWfT+EPfbkmGRpXje
         ovERrT4wHL9vW51OkKxaldUnFhuNs0wjmgd863XNq30Sby0rxkG9HSnjE6+kLI3bEN3X
         i/Wop3cnyb4xMCfIpbi8JjDYQQgZ+qZTQDcI8UpibKTS9/mIKBhuUI22iW0guEPZimj4
         4jlC6xWMX/7BBBPbEG1fJXFtkF6MzjErBzSM/nOszPXoOMombMbFQ143Pum/JOT8FUX0
         tSqySSuLxjXG0kSdlNxPGqvM6j9B4iAxQ9bUGVqAsSOlQR5JPcS+6Bp80l7nuExpYW8X
         nLiA==
X-Gm-Message-State: AOJu0YyJWU3gsumhGEpkXX0RhGC/WvRmJlQz4wqYK4BU8zYYNp62A/+C
	AzMnDa7FcVtiWv9VT+RUnzV9TyA6GoZA5BhBr5Q+eXcMqxga2/rc/Jr+i87mTdHZcb3RFEtNdYQ
	5480=
X-Gm-Gg: ASbGncun2kgqaKaNf++tEdWfUSAKjhHXceTHb1V39xq2KZFyU97GD6zPwlfmpvSn9HO
	D+NLjbsx0hYo+/C+LPiTPQ7HV7vq2xZkqGIg4e3P8jjonlbhkgSDRGeXFcWo4bhrloZ/GoctKLx
	o61VC8g2SwLv4H07nlHExx8Br7WkYufvP96aJrd72/dtidjrRRneCSC215frT2Qu182/Vmu3NGu
	FCPsbjaU+IDg3EeN7qx2KWgHfWsBmK/gybSz9W3JQtWl80dppYOAbNbEMj9R/mw3kTV6qKsVs0H
	iW5T0zu0x6DdePzTWrmci9vcYQPso3MsGYou5txJuT2r2iZTtGy46jRu0GM691SY3K3IvQ==
X-Google-Smtp-Source: AGHT+IHzjAEzu9ZL/LhJfp0WdVFIWrXMrUcG3FYUu2qeTaco/Yb6x8ITazyFLVUXwQMAA117DeA/ng==
X-Received: by 2002:a05:600c:37ce:b0:43c:f4b3:b094 with SMTP id 5b1f17b1804b1-441bbea0e40mr12222395e9.6.1746171215074;
        Fri, 02 May 2025 00:33:35 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b276052bsm81480795e9.0.2025.05.02.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:33:34 -0700 (PDT)
Date: Fri, 2 May 2025 09:33:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Hans Zhang <18255117159@163.com>
Cc: linux-kernel@vger.kernel.org, tglx@linutronix.de
Subject: Re: [PATCH] genirq/msi: Fix MSI domain debugfs show
Message-ID: <20250502-10084e4c093eceb9a3d276e2@orel>
References: <20250430124836.49964-2-ajones@ventanamicro.com>
 <96a6e4a3-c89c-4446-8c3f-a0f173aed26a@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96a6e4a3-c89c-4446-8c3f-a0f173aed26a@163.com>

On Thu, May 01, 2025 at 09:51:07AM +0800, Hans Zhang wrote:
> 
> 
> On 2025/4/30 20:48, Andrew Jones wrote:
> > irq_domain_debug_show_one() calls the irqdomain's debug_show() with
> > a non-null domain pointer and a null irqdata pointer
> > (irq_debug_show_data() calls debug_show() with those the other way
> > around). Ensure we have a non-null irqdata pointer in
> > msi_domain_debug_show() before dereferencing it.
> > 
> > Fixes: 01499ae673dc ("genirq/msi: Expose MSI message data in debugfs")
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >   kernel/irq/msi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> > index 5c8d43cdb0a3..c05ba7ca00fa 100644
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -761,7 +761,7 @@ static int msi_domain_translate(struct irq_domain *domain, struct irq_fwspec *fw
> >   static void msi_domain_debug_show(struct seq_file *m, struct irq_domain *d,
> >   				  struct irq_data *irqd, int ind)
> >   {
> > -	struct msi_desc *desc = irq_data_get_msi_desc(irqd);
> > +	struct msi_desc *desc = irqd ? irq_data_get_msi_desc(irqd) : NULL;
> 
> Hi Andrew,
> 
> I think irqd will never be NULL.
> 
> 
> static int irq_debug_show(struct seq_file *m, void *p)
>   irq_debug_show_data(m, data, 0);
>     if (data->domain && data->domain->ops && data->domain->ops->debug_show)
>       data->domain->ops->debug_show(m, NULL, data, ind + 1);
>         msi_domain_debug_show
> 
> 
> 
> static int irq_debug_show(struct seq_file *m, void *p)
> {
> 	struct irq_desc *desc = m->private;
> 	struct irq_data *data;
> 
> 	raw_spin_lock_irq(&desc->lock);
> 	data = irq_desc_get_irq_data(desc);
> 
> 	If it needs to be judged as NULL, should it also be here?
> 
> 
> 
> static void irq_domain_debug_show_one(struct seq_file *m, struct irq_domain
> *d, int ind)
>   if (d->ops && d->ops->debug_show)	// d->ops->debug_show is NULL, not
> irq_debug_show.
> 
> 
> If I'm wrong, please correct me.
>

# cat /sys/kernel/debug/irq/domains/PCI-MSIX-0000:00:01.0-12 
[   51.954695] Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000000000010
[   51.956868] Current cat pgtable: 4K pagesize, 57-bit VAs, pgdp=0x0000000101a9a000
[   51.957207] [0000000000000010] pgd=00000000407e8801, p4d=00000000406a9001, pud=00000000407ac001, pmd=00000000407ad001, pte=0000000000000000
[   51.958324] Oops [#1]
[   51.958417] Modules linked in:
[   51.958721] CPU: 1 UID: 0 PID: 83 Comm: cat Not tainted 6.15.0-rc4-00147-gebd297a2affa #1 NONE 
[   51.958993] Hardware name: riscv-virtio,qemu (DT)
[   51.959196] epc : msi_domain_debug_show+0xa/0x8a
[   51.959736]  ra : irq_domain_debug_show_one+0xb6/0xf4
[   51.959871] epc : ffffffff800a26a4 ra : ffffffff8009f064 sp : ff2000000035bc10
[   51.960035]  gp : ffffffff81516710 tp : ff600000802d7080 t0 : ff600000809f20c3
[   51.960204]  t1 : 00000000000000de t2 : ffffffff80e01470 s0 : ff2000000035bc40
[   51.960373]  s1 : ff60000080285f00 a0 : ff60000081eb5000 a1 : ff60000080285f00
[   51.960533]  a2 : 0000000000000000 a3 : 0000000000000001 a4 : 0000000000000000
[   51.960697]  a5 : ffffffff800a269a a6 : 0000000000000000 a7 : 0000000000000010
[   51.960854]  s2 : ff60000081eb5000 s3 : 0000000000000000 s4 : 0000000000000001
[   51.961017]  s5 : ff2000000035bd00 s6 : 0000000000000000 s7 : ff60000081eb5028
[   51.961188]  s8 : fffffffffffff000 s9 : ff60000081eb5038 s10: 000000007ffff000
[   51.961349]  s11: 0000000000000000 t3 : ffffffff80e5d850 t4 : 0000000000174000
[   51.961509]  t5 : 0000000000000002 t6 : ff600000809f20de
[   51.961635] status: 0000000200000120 badaddr: 0000000000000010 cause: 000000000000000d
[   51.961886] [<ffffffff800a26a4>] msi_domain_debug_show+0xa/0x8a
[   51.962098] [<ffffffff8009f064>] irq_domain_debug_show_one+0xb6/0xf4
[   51.962250] [<ffffffff8009f0b4>] irq_domain_debug_show+0x12/0x2a
[   51.962389] [<ffffffff80246bd6>] seq_read_iter+0xc6/0x316
[   51.962516] [<ffffffff80246f12>] seq_read+0xec/0x11e
[   51.962634] [<ffffffff80381d20>] full_proxy_read+0x48/0x88
[   51.962771] [<ffffffff802184de>] vfs_read+0xb2/0x288
[   51.962897] [<ffffffff80218ecc>] ksys_read+0x56/0xc0
[   51.963012] [<ffffffff80218f4a>] __riscv_sys_read+0x14/0x1c
[   51.963147] [<ffffffff809f3566>] do_trap_ecall_u+0x186/0x206
[   51.963290] [<ffffffff809fdf42>] handle_exception+0x146/0x152
[   51.963588] Code: 0209 9181 b7a5 4981 b759 7179 f022 f406 e44e 1800 (6a1c) b983 
[   51.963910] ---[ end trace 0000000000000000 ]---
Segmentation fault
