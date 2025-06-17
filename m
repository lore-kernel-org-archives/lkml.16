Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB020C028;
	Tue, 17 Jun 2025 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172099; cv=none; b=TQkFPMr5GuwiKnkU0UCckKAa4EJ6HJN+FiEJE99imBYQnJRv+RcQns6f32v+kmuwCSwEfbQaUwIW6WtUPgcpFCnvaHdjv0VYntzCyzdqln8MTwcHbniiScNrroP3k6DQMTXf6o0I+tPuBiOQ0hwdDjDtaUE4E+LlM8VCunI1Cgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172099; c=relaxed/simple;
	bh=WlsqYl8XHOpFK2916YvNKbhg2OIoZ5baI1A6jC+Jx4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKoSe8+EYzH2oOUga62I+sj+fotoI2EuA2ckN0kBzV18Dgv7VFgJBwjFO/jOBXqyr9U6J03PMZTY9Qa19shBDfQzbJic7kH3S8llo1waXJdQyo2wez0VzvsmRXjta9qruupegjcp9pKgraKRijm3t5Ziu3NrTxBt/sR6heUvJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3dkbfB5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3dkbfB5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so50196075e9.1;
        Tue, 17 Jun 2025 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750172096; x=1750776896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wOiAASZQ1fSoiMZFjqnunFPeJrMlMkcRR6CTRxTDfeQ=;
        b=F3dkbfB50775Vi6ZEt+iPCdMkqpKiTTpfpCL0fFwiSoxa2zOtrFOYLRPnrBTQp8TvL
         onfJB145qdc62Vlm69q9GKbOE2E8Ycb6ZK0ETzkczWnLPaTZbBhNQVD0x1tdlMT93MDz
         uAcMlvU+bDltPjC4LNb7aWmyCrjOiCr3gnN4omKeiRwD0RDBA+dR+gqf1jzd08X0dOK6
         cpKpIFp6le3Fv2+2Img8PC5v0vmt2NAqoZk++vLWbp5t/Fu+hZgnVCahYYsgcImQziue
         rfWI2w5LAqyUdqSKJNdDP4tmJYbmLcdY1sIj+BtA+h0uIVIq9BCMY/ybsDfHzDTjWcx9
         d2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750172096; x=1750776896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOiAASZQ1fSoiMZFjqnunFPeJrMlMkcRR6CTRxTDfeQ=;
        b=hdnH9+EOSgizjrMHvNaU0ZO9aAZuD2P0oDJSqYayWQ/lrn9fXitP6Ew/BP/V/R6Dzk
         eKMPk/uuZ89Tn7YHxS2hCcvTxW5XmXT+sz9dyNDwD9Z8HsRJFGckVGsirLtS+y1W3qTz
         nbR7cLrMtPSg1VcoQQfTD7Y7L0wqugyTMjz4s1wOGdl8xK7v1QXWLo77+VcTW/Q9c7Ta
         6x2bAHycFQ35io2VnJ7gWDihpDG6WPBoUdHYypDN2cfprbda6zXxzEtjivdM2sGGnZyU
         edFandHnM9f5gpXLJStLug0kd0+ITbPeSZ5T/41ZDurFzCSOvX3IQM8bRK0Eq7q0OyoT
         B+qA==
X-Forwarded-Encrypted: i=1; AJvYcCVJXYm7nEaZca8ayvko51rVEVU6YhVJVyjnfxkamTt18W/hwvjKb1cqoF7CPGDp9uLmlSd5u3phFu7/SR4t@vger.kernel.org, AJvYcCX6WimsTuJ7WGjwYlhhErKL+4GNR3HAJwiSIyGsR/G+8zo5lpcJYrvQG8Mw1B//ZZMslO24w013Iasx@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrWFxx2QucF8bmlHzDj4P3GVvKlk8ojcrZy3TkkwN+1JihznJ
	z37aEJjNcmF8XgQYbdJASCKnJyCWA83h8YhaOVcxC84R0GNSsa5ctd8C
X-Gm-Gg: ASbGncsdys3vNGsU+T3JtSsxXfrq8kWKO4HxX0DLBsHv18Z974ssLh2QJRaHsJcdt5Y
	X0BfRGwrRzunKmU3xL0GqqHbVux4RPBLi3FsahhQ4SriaCzoubSj7mKe9/Bpsa624tPFNJobxSg
	UXL5Y13JBCEF7H0VWNxwpAsMbWBLXYngNNqywDVwr4FiUnojkWqphaVAvDIRbwTy3UFRDC+D0dI
	a+fNZ1hHpMTr57AP7irz6q3bRFEMcDjpkXV1tNBqLg5X8QdVKrSk8GdSpYZM4S1jb4c9vrCF9A5
	ua+BwDvQDm0JTNF5dTnLbnWtaQulY6c94htU93fhck4yS3I22oLxQLcItkxBL4NxC4ABKTNHswF
	AIkUfDSU=
X-Google-Smtp-Source: AGHT+IHp83XMB3hs9kIXUVOw1BkW7osPtl3xgqCJV23FdxhPgCZfxhcMaKwGJMNhPIpGaA1nHTlqqg==
X-Received: by 2002:a05:600c:6097:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-4533caa11ecmr140958915e9.18.1750172095717;
        Tue, 17 Jun 2025 07:54:55 -0700 (PDT)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([137.71.226.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08dfesm14435672f8f.60.2025.06.17.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:54:55 -0700 (PDT)
Date: Tue, 17 Jun 2025 16:54:52 +0200
From: Jorge Marques <gastmaier@gmail.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <i6lqe2n42gueqzs2xru4yk5jzlt766jsmoolhb2q3nnvbkz6uu@dijk4qihk37f>
References: <20250606-adi-i3c-master-v2-0-e68b9aad2630@analog.com>
 <20250606-adi-i3c-master-v2-2-e68b9aad2630@analog.com>
 <11b278ac-20ba-4e75-b307-6608ea8b4522@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11b278ac-20ba-4e75-b307-6608ea8b4522@oracle.com>

Hi Alok,
On Sat, Jun 07, 2025 at 02:03:42AM +0530, ALOK TIWARI wrote:
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b3799071573f4066eb14123c94ee599cc6331b3d
> > --- /dev/null
> > +++ b/drivers/i3c/master/adi-i3c-master.c
> > @@ -0,0 +1,1037 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * I3C Controller driver
> > + * Copyright 2025 Analog Devices Inc.
> > + * Author: Jorge Marques <jorge.marques@analog.com>
> > + */
> > +
> > +#include <linux/bitops.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/i3c/master.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define VERSION_MAJOR(x)		((u32)FIELD_GET(GENMASK(23, 16), (x)))
> > +#define VERSION_MINOR(x)		((u32)FIELD_GET(GENMASK(15, 8), (x)))
> > +#define VERSION_PATCH(x)		((u32)FIELD_GET(GENMASK(7, 0), (x)))
> > +
> > +#define MAX_DEVS			16
> > +
> > +#define REG_VERSION			0x000
> > +#define REG_ENABLE			0x040
> > +#define REG_IRQ_MASK			0x080
> > +#define REG_IRQ_PENDING			0x084
> > +#define   REG_IRQ_PEDING_CMDR		BIT(5)
> > +#define   REG_IRQ_PEDING_IBI		((u32)BIT(6))
> > +#define   REG_IRQ_PEDING_DAA		BIT(7)
> 
> typo PEDING -> PENDING
> 
Haaa ups, thank you!
> > +#define REG_CMD_FIFO			0x0d4
> > +#define	  REG_CMD_FIFO_0_IS_CCC		BIT(22)
> > +#define   REG_CMD_FIFO_0_BCAST		BIT(21)
> > +#define   REG_CMD_FIFO_0_SR		BIT(20)
> > +#define   REG_CMD_FIFO_0_LEN(l)		FIELD_PREP(GENMASK(19, 8), (l))
> > +#define   REG_CMD_FIFO_0_LEN_MAX	4095
> > +#define   REG_CMD_FIFO_0_DEV_ADDR(a)	FIELD_PREP(GENMASK(7, 1), a)
> > +#define   REG_CMD_FIFO_0_RNW		BIT(0)
> > +#define   REG_CMD_FIFO_1_CCC(id)	FIELD_PREP(GENMASK(7, 0), (id))
> [snip]
> > +
> > +static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> > +				     struct i3c_priv_xfer *xfers,
> > +				     int nxfers)
> > +{
> > +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> > +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> > +	struct adi_i3c_xfer *xfer;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < nxfers; i++) {
> > +		if (xfers[i].len > REG_CMD_FIFO_0_LEN_MAX)
> > +			return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (!nxfers)
> > +		return 0;
> 
> this can move before for
> 
Oh well, I will actually remove the LEN_MAX define since the depth is
actually a HDL parameter. Instead, the FIFO ROOM will be checked before
writing new SDOs and CMDs.
> > +
> > +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> > +	if (!xfer)
> > +		return -ENOMEM;
> 
> Thanks
> alok

Best regards,
Jorge
