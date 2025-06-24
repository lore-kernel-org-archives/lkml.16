Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9EE13B7A3
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750736473; cv=none; b=RVCzsDgSy2itFY+FLwCHYkJZ6POmqGCe7I81sISnpoUI4KbhnaOKDhQ7XOYLpTr5XA8mkoOi71MQjrcg32NlxgYtn2ibD2EP49w4cCG1ATRwBjAeMUn5i39Ca5k3ZGrkFIJT1I6ovv9jNWVdbKLAk0YjNSnluFw78q7hgGhYQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750736473; c=relaxed/simple;
	bh=8duITZWSk5LJ20ogr6uX9uCsfXO3PVMWBcmZOtYbUrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQEqyFNwSwquPNcREfZRVcJIDb2oV/pNx9VUVse077pUOg7GSlXtHC3ikYIU5DIL/zsRpnyMDX8NYCJt8+HBx0FrQA3/pVW7iU67bmnlAIMP6BfEwgP3PRoMLhGqaZCQhOa4Y60gjvfVEB14+pC7r8phke1jYVyDDYL0ciqqVJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJx/YucV; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJx/YucV"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2ef891cd058so672850fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750736470; x=1751341270; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a0QpBqKmrjEGavl66oW9Pik2pFeBPW+JLKIZ/tJDBmc=;
        b=MJx/YucVAuzLQaXuwfGBqsg/VjMEyVROACTDnEshlQQO1Yc6hwlHk8D624l3rwaUL+
         HcUIORbt/FMi3r7L93odFmvwd6biiu3/+gIZglLvKgjWC8dv350lQ0vtXOanYZ5V86Tv
         IbDiziqrDirc59F+XtR3G3WIMbN9qjnQ0zjPB1QU1OZlR0WRlOxr0dAm0XQyfXEvOz0K
         CTmNaCFQX9G7YbBNh741aXg7aKtKe+FWaSgqob7b5VBrmUu6/7ja/27vo0qVuq18FOgc
         y1wO/BDdWaFkMCSqOquzwOegnD1vq/SAXTvaxUWibpRjmUujKBqHO79ElaAFYnK7GS4b
         HZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750736470; x=1751341270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0QpBqKmrjEGavl66oW9Pik2pFeBPW+JLKIZ/tJDBmc=;
        b=U3kkiErYbUZyOvwqUX1SmMnvngWU90dCO/7xdx42dyta9yOEGWyfxnQREVk/40d+I/
         Lj6cy87ZCXlu8Xbl08/WPLAexHXkLn0o851dHl8FRME/Oh5srA9pXC8WlETc7XG0Qwex
         fndmgFuHhWMEQXy8f9guwAPPzK9pApsp/hgDFO/hQDve1l2DL58uHPxTlTDpK/KG3orL
         ZJgNen1aMCDxF0fhzXQsZUnQld8GneR80jQT9p79MkPpRCE4Z40agSomoHbC8/5tvXHK
         3/M1yOoAGQkLz0dfU5hFw10fgoS/6ob3wEdkni5xaDYQcw9w9fQh5ofItmtQAXIfUs/n
         I3VQ==
X-Gm-Message-State: AOJu0YyHX+VjtBoYR/BJsBjXRVpFAmk35d+HyEnj5hGpYYOoonQshSYE
	XFS7mD2lGgPHrbQanIDhUfLAcYKlIoAFBUTiDJQU/PsZ0QGaA8UPVNhl4QOWQ1yeRxeNpIcpve0
	Jf2lwwedibF7s4wQNI/W2QG8E0HP9f/GXaSL9J9A=
X-Gm-Gg: ASbGncvb/zw/UbQpQNrUF5F7k1IsdfgRnUowL0Asqse09W3vdJqeQcVmQFrF/stS6mD
	jj67k3KPQUiLYnnumfSPb9+R2EJD6e8q7oPpr48qxwIDErLSrowCT1b7Ek2LpbPKAmf6Pyvkw1t
	+pK4JFbdMBo654+0nYcUnQlornMmXos3Lfqldi520hPu20og==
X-Google-Smtp-Source: AGHT+IHl0anSuCV28m+wBt/pQKmYZ5qadLtN+OtUZtNzD4BGMVPWJRUhSNJ8xp/UPzt1CKEvmCpeO3tG7GjBin9q7m4=
X-Received: by 2002:a05:6871:810e:b0:2e9:11d9:f8ad with SMTP id
 586e51a60fabf-2eeee506790mr10003981fac.24.1750736470380; Mon, 23 Jun 2025
 20:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624032632.63845-1-seokwoo.chung130@gmail.com>
In-Reply-To: <20250624032632.63845-1-seokwoo.chung130@gmail.com>
From: Ryan Chung <seokwoo.chung130@gmail.com>
Date: Tue, 24 Jun 2025 12:40:58 +0900
X-Gm-Features: AX0GCFv6qCzoNdk6bqtXBpFizsR0w80wuX6LFvpxezWcPS8UEvUl1ZLNo2LjGd4
Message-ID: <CAB1jyqw1-DX_hivw0WMXV04EQTjWq9F-qu8TsrN55RhkUnt18w@mail.gmail.com>
Subject: Re: [PATCH] xen-pciback: Use sysfs_emit_at() in slots_show() and irq_handlers_show()
To: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I sent the wrong patch. My apologies. Please ignore this patch. I will
send a V2 shortly.

On Tue, 24 Jun 2025 at 12:26, Ryan Chung <seokwoo.chung130@gmail.com> wrote:
>
> Replace the use of scnprintf() with sysfs_emit_at() in slots_show() and irq_handlers_show().
>
> This change uses sysfs_emit() API usage for sysfs 'show'
> functions as recommended from Documentation/filesystems/sysfs.rst.
>
> No functional change intended.
>
> Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
> ---
>  drivers/xen/xen-pciback/pci_stub.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index 5c2f829d5b0b..d0a889474a46 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -18,6 +18,7 @@
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/atomic.h>
> +#include <linux/sysfs.h>
>  #include <xen/events.h>
>  #include <xen/pci.h>
>  #include <xen/xen.h>
> @@ -30,6 +31,7 @@
>  #include "conf_space.h"
>  #include "conf_space_quirks.h"
>
> +
>  #define PCISTUB_DRIVER_NAME "pciback"
>
>  static char *pci_devs_to_hide;
> @@ -720,7 +722,7 @@ static void kill_domain_by_device(struct pcistub_device *psdev)
>                 return;
>         }
>         /*PV AER handlers will set this flag*/
> -       xenbus_printf(xbt, nodename, "aerState" , "aerfail");
> +       xenbus_printf(xbt, nodename, "aerState", "aerfail");
>         err = xenbus_transaction_end(xbt, 0);
>         if (err) {
>                 if (err == -EAGAIN)
> @@ -1261,7 +1263,7 @@ static ssize_t slots_show(struct device_driver *drv, char *buf)
>                 if (count >= PAGE_SIZE)
>                         break;
>
> -               count += scnprintf(buf + count, PAGE_SIZE - count,
> +                       count += sysfs_emit_at(buf, count,
>                                    "%04x:%02x:%02x.%d\n",
>                                    pci_dev_id->domain, pci_dev_id->bus,
>                                    PCI_SLOT(pci_dev_id->devfn),
> @@ -1290,7 +1292,7 @@ static ssize_t irq_handlers_show(struct device_driver *drv, char *buf)
>                 if (!dev_data)
>                         continue;
>                 count +=
> -                   scnprintf(buf + count, PAGE_SIZE - count,
> +                   sysfs_emit_at(buf, count,
>                               "%s:%s:%sing:%ld\n",
>                               pci_name(psdev->dev),
>                               dev_data->isr_on ? "on" : "off",
> --
> 2.43.0
>
