Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1C288CA3;
	Mon, 19 May 2025 17:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676829; cv=none; b=M+YN1YZt1Csvz622V/rDklJafuIPCw9fznE5TeSQ+RSUSvvV5BXwYitwgLu2Q45FLaSMS/MZuV2Lrd8c8DOrTL6C8Ij5O3vO6FFlA/w0ef5w3VmoYzpgLvAkiw85jQIN3B/CeXb49/ML/YMoBwLwHWCv/Vka3vqk5ijvkeGpViY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676829; c=relaxed/simple;
	bh=DFhJYazfoHDblQFnaonh7jg5Y06axl6MG9yo5ppu7zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jnIHYsjAKyCKSYEIUgWbRR6PgOg/x0TBTJFMDQipwiH0E0R1X8P0+gs6RoFS8S8+fADSpjC/ccyHE819Jxh2PyWiv/1f8g4gpFzTFAGv192s03KJGvMjK7HrKBbj/Rz6SWWkaYhtO/k6QT1iUeHjc1P5Dddv+yTWLEtuXzWJV+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV/26R3w; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV/26R3w"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2db2f23f174so1719437fac.2;
        Mon, 19 May 2025 10:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747676827; x=1748281627; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ChLEr86ZFedRuooYVXm+1oKgwf+je0INxoHyO6ITtYI=;
        b=PV/26R3ww6fGpwoCBmsLugZnr5eHn3ZYnsubmBTo1wsWtZGglM7umQs4WF2kO/9Yu6
         ZffzXiDFr7EjsXs8DHgP39q6MqaGwFiY54i7zW2/AwhTpWMRg/DAChnN6Syz6Q0uGKo2
         6C82RToYQU3YkLqJFPYh1d4sf/jAvsV7PmoOcSUYj6C825EQFeXZTlZDke5Q20E8mpgh
         kgebmg5o83Fg6GoeC4/Hm3cMYcMyMQ8a7THFuJA4YwFbvo25Cl05z+t3nHhOwpxJDkTA
         kDOYxqq9DJZZEYPhMuH7BOl/JlxtbRV6GXtKXIMduRtT/Nf7I0/wnYRuRwxLgWcewHYw
         l4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676827; x=1748281627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChLEr86ZFedRuooYVXm+1oKgwf+je0INxoHyO6ITtYI=;
        b=L+LUpLqiQ92Qw0wPWr6lEUziu8huOGGUqMQPno7tc8R/XhFAV7dn/Ae4Rcxqolhcxd
         FRo76ON7zbwOTPU5S0hlbV7wiMeHJq1tsot2JVroLbqDd7YPA7tccsnqxrbhTRSKjWxh
         ykWbiHKOzrcpRRTGOWpFr1C3WLfgbxUmxpxXod6dOnHuNjrO3KA3T1egtEAf++CD7cV8
         M/q6l6u2rsdlPIXUZUCtvjY8NhuDmerM2Z6hrv+9T6UO5LS0VLKMwlhqUgP8H0yVj00R
         q6zjXJHPwec+1sBp51dt8uMfq+QWBtnqz3qDXMJi68w5CvA0SatnDEVP7clkUHpM0e+Z
         JLJw==
X-Forwarded-Encrypted: i=1; AJvYcCVNZho6eGTkcXhI312A/f8OuJLdvicqUZiBxenmqoy5pXoKcPYZCu9lSy94yTvo6C4T483AVSr+Gow7@vger.kernel.org, AJvYcCVuYjzFY80+eu8qGms+n+nb8YraSiSEX3opZaoIJJs1lMfWmRi7WyCLGeJqyawsJr2W9LvIsOxM/sfUnWIZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxu6PR6B83wQMh6AOtQNaiZpBAr/8Vv1IayTZZERKyvsIQU5ux
	PVdiWVo4c9T+AxC+mobOLhY7djI+PZ0gfPzRM+DwAl6ufDpfs2AB2OoZshm/U1NNQNyBbFeV7XX
	siqwIguGeSliFDmcmWdd/M38ASQ0aBhI=
X-Gm-Gg: ASbGncsENa9EHO+uGBaDx7FfrIlTILlGuZBa8+ryQyVpXiSgLF4aCBxN/gdQiQMoOmu
	kfA33bk7uE1oQZL/z7J3s4kiS5TEQAP7rYIbogJCM//hlawZ52PYA/UOqPoKP1MTrGRUq9dIgCL
	IpwXZ0OQnEVHomRxS2O/SZQZ2qN0f5MRsuFw==
X-Google-Smtp-Source: AGHT+IEnVUWDSHozz254hL30P9c6EGyyee0LNYouexPzbQED3hJ2ptthmdDRcsit789Wt6mIUbjJZ0ZsBECK59uKEsA=
X-Received: by 2002:a05:6871:d302:b0:2d8:957a:5164 with SMTP id
 586e51a60fabf-2e3c1c0489amr9135265fac.10.1747676826966; Mon, 19 May 2025
 10:47:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513020327.414017-1-peter.chen@cixtech.com> <20250513020327.414017-6-peter.chen@cixtech.com>
In-Reply-To: <20250513020327.414017-6-peter.chen@cixtech.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 19 May 2025 12:46:54 -0500
X-Gm-Features: AX0GCFtqWXwTFFZgneO-96euSqh3v7WYcX1AxmZ5ENB9ZjD1grFsFnZXGgF2UB0
Message-ID: <CABb+yY2fj13YDCYD9B-Hwta47=+CLy6eGSOOc_ez2HrR4-xbjg@mail.gmail.com>
Subject: Re: [PATCH v8 5/9] mailbox: add CIX mailbox driver
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, maz@kernel.org, 
	sudeep.holla@arm.com, kajetan.puchalski@arm.com, eballetb@redhat.com, 
	Guomin Chen <Guomin.Chen@cixtech.com>, Gary Yang <gary.yang@cixtech.com>, 
	Lihua Liu <Lihua.Liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"

Hi,


> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
> new file mode 100644
> index 000000000000..c2783dd7d145
> --- /dev/null
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -0,0 +1,632 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "mailbox.h"
> +
> +/* Register define */
> +#define REG_MSG(n)     (0x0 + 0x4*(n))                 /* 0x0~0x7c */
> +#define REG_DB_ACK     REG_MSG(CIX_MBOX_MSG_LEN)       /* 0x80 */
> +#define ERR_COMP       (REG_DB_ACK + 0x4)              /* 0x84 */
> +#define ERR_COMP_CLR   (REG_DB_ACK + 0x8)              /* 0x88 */
> +#define REG_F_INT(IDX) (ERR_COMP_CLR + 0x4*(IDX+1))    /* 0x8c~0xa8 */
> +#define FIFO_WR                (REG_F_INT(MBOX_FAST_IDX+1))    /* 0xac */
> +#define FIFO_RD                (FIFO_WR + 0x4)                 /* 0xb0 */
> +#define FIFO_STAS      (FIFO_WR + 0x8)                 /* 0xb4 */
> +#define FIFO_WM                (FIFO_WR + 0xc)                 /* 0xb8 */
> +#define INT_ENABLE     (FIFO_WR + 0x10)                /* 0xbc */
> +#define INT_ENABLE_SIDE_B      (FIFO_WR + 0x14)        /* 0xc0 */
> +#define INT_CLEAR      (FIFO_WR + 0x18)                /* 0xc4 */
> +#define INT_STATUS     (FIFO_WR + 0x1c)                /* 0xc8 */
> +#define FIFO_RST       (FIFO_WR + 0x20)                /* 0xcc */
> +
> +/* [0~7] Fast channel
> + * [8] doorbell base channel
> + * [9]fifo base channel
> + * [10] register base channel
> + */
> +#define CIX_MBOX_CHANS         (11)
> +
> +/*
> + * The maximum transmission size is 32 words or 128 bytes.
> + */
> +#define CIX_MBOX_MSG_LEN       (32)    /* Max length = 32 words */
> +#define MBOX_MSG_LEN_MASK      (0x7fL) /* Max length = 128 bytes */
> +
>
Move these above register defines where these are used.
Also, no need for brackets around numbers. Here and elsewhere.
....

> +
> +static void cix_mbox_isr_reg(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +       u32 int_status;
> +       u32 data[CIX_MBOX_MSG_LEN];
> +       int i;
> +       u32 len;
>
cosmetic: tidy these up by merging and sorting in reverse christmas tree.


> +
> +       int_status = cix_mbox_read(priv, INT_STATUS);
> +
> +       if (priv->dir == MBOX_RX) {
> +               /* rx interrupt is triggered */
> +               if (int_status & DB_INT) {
> +                       cix_mbox_write(priv, DB_INT, INT_CLEAR);
> +                       data[0] = cix_mbox_read(priv, REG_MSG(0));
> +                       len = mbox_get_msg_size(data);
> +                       for (i = 0; i < len; i++)
> +                               data[i] = cix_mbox_read(priv, REG_MSG(i));
> +
> +                       /* trigger ack interrupt */
> +                       cix_mbox_write(priv, DB_ACK_INT_BIT, REG_DB_ACK);
> +                       mbox_chan_received_data(chan, data);
> +               }
> +       } else {
> +               /* tx ack interrupt is triggered */
> +               if (int_status & ACK_INT) {
> +                       cix_mbox_write(priv, ACK_INT, INT_CLEAR);
> +                       mbox_chan_txdone(chan, 0);
> +               }
> +       }
> +}
> +
> +static void cix_mbox_isr_fifo(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +       u32 data[CIX_MBOX_MSG_LEN] = { 0 };
>
Is it really needed? Can we do with just zeroing the byte after valid data?
At least move it under "FIFO waterMark interrupt is generated", so it
is only done when needed.

....
> +
> +static int cix_mbox_startup(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +       struct cix_mbox_con_priv *cp = chan->con_priv;
> +       int ret;
> +       int index = cp->index;
> +       u32 val_32;
> +
> +       ret = request_irq(priv->irq, cix_mbox_isr, 0,
> +                         dev_name(priv->dev), chan);
>
Can we do this later just before returning from the function? Or
atleast free the irq before error returns.

Also please make sure you run scripts/checkpatch and have all warnings cleared.

Thanks
Jassi
