Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF651F3FC6;
	Wed,  2 Jul 2025 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751485736; cv=none; b=JrnJjRV1jku54xQn/ePaI80RjTRKK5rbI/7LYTmnjibII7tyDAfCvn2ybRJd9qi3tZoN2l9V7QT9IzJ99fyyz+AXg60u5KW8E1YHe4bqoFOWVG68+9LyxTujiHq+iwGntZgZhZUVHdwTqGqQKRssjS30MDD0zgsvRtvh75mNimk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751485736; c=relaxed/simple;
	bh=JGNR93gvtGkrpmmNjDuK/i9jolve4ZqTyZwa9pmtb6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H7WYOc/irqtlx58IIrh/hL9lSJt+ZYYjB7xiGMXMMSPwcgcB6lNQOt+e6uBOE4yFHSMG5CM/v4M7RJmxryLY2Gqu0v0cAokcvL4AdmvmxXa1Wg3aojYPNL0khl16bWvJ6AnGsHl8pg4sCuPYUg/Ff5ODD7OOq72fSDWmwJY6ZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wu1IOp6C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9q+FwSv3; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wu1IOp6C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9q+FwSv3"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751485730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtg8I9VJThVmsyZdxQvLxh1iCecNQnK7i75deA60sMU=;
	b=Wu1IOp6CAnr71Ttqor/QQE8OnhKSMKAwvIW4S00WfbiAC6t2vTRNWH2zTyw/TZmq+EPBOC
	f8b4XeNDR6KzO+CZ33g6OW2iA30krerlB41xDwT0FlYAn9WKw/xdDdOJey7wQYj3thWK4r
	uPJ2dPyPvjsoeVTiqnqzJdlmAtJhfc/LKRMuCf4e6D1s+icwy+BcUmtJOygZsGA09fB8oZ
	Ezu/uBDhfmL0YVP28G9brqtunLKDJ1tadAN+E8nWAr0ChMZgGz+BTLdBeM5m/rhEAfI7N7
	2VJ8LHbmDNPoZcX3NWtcMqOE0SnBu8IskYcjUhnAhlvRWAWts44yUod9NPjbYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751485730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtg8I9VJThVmsyZdxQvLxh1iCecNQnK7i75deA60sMU=;
	b=9q+FwSv3rnTapDv314sP95E6GfsCIOz4brMU7S3/vB+Xe2yHlr2EtLSbYvWIpMqgxGX4It
	cmjMSl58LJm4azBw==
To: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
 <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v3] irqchip/riscv-imsic: Add kernel parameter to disable
 IPIs
In-Reply-To: <20250702122434.1514328-1-apatel@ventanamicro.com>
References: <20250702122434.1514328-1-apatel@ventanamicro.com>
Date: Wed, 02 Jul 2025 21:48:49 +0200
Message-ID: <871pqyl6fy.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jul 02 2025 at 17:54, Anup Patel wrote:
>  #include <linux/cpu.h>
>  #include <linux/export.h>

            ^^^ Neither in tip/irq/drivers nor in Linus tree ...

patching file drivers/irqchip/irq-riscv-imsic-early.c
Hunk #1 FAILED at 9.

>  #include <linux/interrupt.h>
> +#include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
> @@ -22,6 +23,14 @@
>  #include "irq-riscv-imsic-state.h"
>  
>  static int imsic_parent_irq;
> +bool imsic_noipi;    

__ro_after_init? No?

Thanks,

        tglx
