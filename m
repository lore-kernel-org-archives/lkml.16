Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E79AD21;
	Mon, 14 Apr 2025 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744592058; cv=none; b=A6nclFJWGaZhn6X89jxFDLu7ctDSIVyzvtrprr22N49zAfYGShB4Nipu6ytYRcGa1Mfo/cjkY+pVvuDdRCE1rT/UMHsxe4pMN+WwiaC3IkKGfsLA7uDFnmxn52vqrkULMALUQXQWPSdliNCDzKHdgplo+J6EWaxwZUUOPP20d1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744592058; c=relaxed/simple;
	bh=qgC/Ro2YCevvViw7+wQ4N9W6yfmfYdFYPh0FG4Rejzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yd2vuYihkWC9XgE8RqKzF6zDEnqoaAIrY9iZK2X3ApHjTx5vMWj0BOIP0Psxf4a/DtxoV+/+skX5/ygQe7izZjBx6Jue2gWv3JRPIRHPl+F/Mo/HY8wTYcJ2w8DEzPZA7b01w2SuPMbvqpqHM7dXrAssWpFro/N5A9vyW3sfukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1/yWyBe; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1/yWyBe"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476b4c9faa2so47824831cf.3;
        Sun, 13 Apr 2025 17:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744592055; x=1745196855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=asGs9dXkrGA46BHiM7NeGGpvrCsy2QV43JKsFZnCKvA=;
        b=d1/yWyBeoS5Qr2poFHlTAuPuBJ8ETCg5gJ7ZYete3FF7pXDUQHr66bjlNpSMWqj/Tt
         Z2HyrV1+R7sDZXSSZZ/pww0HY4PYzMOrn2P82paTM5Z2F69nyFCGuwG/bpJKGGakp+Yp
         Tr+yEqhLoxYRbL5BB6JGQEgki+Qb58roSYqsy9zGPQf7G5sssBbeWOTT7267yTKQo5wJ
         Q/37RPftdVxR669D2SHrSbSJyf4l+Z166AaS1G8kAnk0ufhGKcl4eZA/mPJyfuzvtw5T
         kKgbUd7stDy0khn19tH+eakH95UFJcvyFA0xhTHhjRJKxwqiOYoBSSLcmjL0jnAzLB9O
         a71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744592055; x=1745196855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asGs9dXkrGA46BHiM7NeGGpvrCsy2QV43JKsFZnCKvA=;
        b=N51onTCniPjpdBI/ftIfPK6QNrjq5PEuopGuqklR4cSJyV55F5oLckh9mWM2v+EZNd
         fY4GI0SDpIQKIT2U6n8SnTFk7wVtigBauUMnD3I8iq8MtFwoWPSeHXqvKrmymL56O1s2
         jAMEaW7ZJOvjNc7laZPobZ0z+zmVzjoyOPyxa83JCrAcKX7bB6nFtRL641iIsUckeiEc
         inum68Yi4Sb4tssa4oBd856D3xJFhGH+uZNuZwGqtEpCbl9T5qAMdWdAIzO9vS8k4z2y
         Km/rGpVEES4YQwiwgdbO3YlUnH7LwwvcG2DJXsERDFUERn06zeYS1YLMKvt0qnoDung8
         uuFw==
X-Forwarded-Encrypted: i=1; AJvYcCU43qqsdID+9MqI6gMEXZNrdkS6JCQ6Xm8lUO1aAOnUQjNmkrfLmGuYU0Bdxlpi5rZO9PYBXGKxolwU@vger.kernel.org
X-Gm-Message-State: AOJu0YzeHAqL9hrnyMXeML6PcUeGR1GpY7TSjbvzw0FzDXjbui+9znrz
	IzUH7wjXw2aQ1YMM0iGzs2g0srjfKeV2J9gjiIOSa69ZUIym8LH1
X-Gm-Gg: ASbGncuTAxRZJRUSC6h3454z7/i6/XMX3Z20WORl021GkhQVmr05typu+7w90Um0HFW
	tFSTlZRCx2CQmkaYrE0oEhfYuGVs4QGotzhuWA/TF0B6ifdJJxPug0uqGDFkAU7/gE+KoW53Uw8
	swvnFCd3z3TH0VfDRTO0SvpgJ3AeIevzlaRShf25T1Ob/8obX/ZF1ZhVR10fASQamn1+WvR45py
	5xiqy602/bBzfwhnkv9gBUDwOZSgJfLWhJjUlMx9XRKuiFM9ivkM/6AVakOYt9+8ySUn6X5d04w
	N8D4zzSuh5EZL9rj
X-Google-Smtp-Source: AGHT+IE/g553Jq6yYD7LJpfkVi+E7INfcm4IyV0loUESRRflBjB6CD+tv0Ju2q/t0uPdjZL7ZYpN9g==
X-Received: by 2002:ac8:5d16:0:b0:476:9f3e:1806 with SMTP id d75a77b69052e-479775e3614mr176219131cf.46.1744592055398;
        Sun, 13 Apr 2025 17:54:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796ea65130sm64422851cf.0.2025.04.13.17.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 17:54:15 -0700 (PDT)
Date: Mon, 14 Apr 2025 08:53:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Chen Wang <wangchen20@iscas.ac.cn>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 3/4] irqchip/sg2042-msi: introduce configurable
 chipinfo for sg2042
Message-ID: <rss7pih2lpzi65vw57exbr57qby6edsb5dvsntcvkllp32t6ou@nbub4ubbrd4i>
References: <20250413224922.69719-1-inochiama@gmail.com>
 <20250413224922.69719-4-inochiama@gmail.com>
 <MA0P287MB226272482F161A5C6A74638DFEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB226272482F161A5C6A74638DFEB32@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Mon, Apr 14, 2025 at 08:44:46AM +0800, Chen Wang wrote:
> hi, Inochi,
> 
> On 2025/4/14 6:49, Inochi Amaoto wrote:
> > As the controller on SG2044 uses different msi_parent_ops and irq_chip,
> > it is necessary to add a structure to hold the configuration across
> > controllers.
> > 
> > Add the chipinfo structure and implement necessary logic for it.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> > Tested-by: Chen Wang <wangchen20@iscas.ac.cn> # SG2042
> > ---
> >   drivers/irqchip/irq-sg2042-msi.c | 52 ++++++++++++++++++++++++++------
> >   1 file changed, 42 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> > index c9bff7ba693d..1001c1117b00 100644
> > --- a/drivers/irqchip/irq-sg2042-msi.c
> > +++ b/drivers/irqchip/irq-sg2042-msi.c
> > @@ -19,18 +19,33 @@
> >   #include "irq-msi-lib.h"
> > -#define SG2042_MAX_MSI_VECTOR	32
> > +struct sg204x_msi_chip_info {
> > +	const struct irq_chip		*irqchip;
> > +	const struct msi_parent_ops	*parent_ops;
> > +};
> > +/**
> > + * struct sg204x_msi_chipdata - chip data for the SG204x MSI IRQ controller
> > + * @reg_clr:		clear reg, see TRM, 10.1.33, GP_INTR0_CLR
> > + * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
> 
> I remember asking some questions about this last time, but you didn't
> respond.
> 

Oh, I forgot to respond this. Since the SG2044 document is not opened
public for now. I think it is possible to leave this for someone to
reference it. Also, I find nothing about this address in my copy of the
document, and was told it follows a similar design of SG2042. So I
think it is OK to reserve it at least for now.

Regards,
Inochi


