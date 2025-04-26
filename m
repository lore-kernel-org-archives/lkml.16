Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A256E2C9D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 20:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745698480; cv=none; b=FuH5G0WSsxTz2MiWCKggWUJ0TO9RI3mZ/TDLf3P7s1F5HIVyIsZ7VFdBvtW7uQJovpNhAqoa/dlRo6pOGsy+e9ZGxcMM4HvMAIZnwEapiMUxZPBUti3oWx4nh0dooU8wefUF4wNiic8KbrPgCRxuodp4yc3lynfahBcZ/Gqy3h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745698480; c=relaxed/simple;
	bh=7LNu7v1jz0aiIiM5mfAjNvEqZ5cWO67PVyK5u0S37to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxoqnR8lRREBrJp2DLmt4vjCKJXfBJnbE3LosJ7Vc4x7En1xgbUwr3V3sGsk9+5dZYMzz+um4F0ovKoX0M59ugW0VBCYUXP9VQa8vl3bISCwKBHSHazEGF+dEjoWjOBfkxXrG3poXq1RH5v5RInWVIF65VFhNWfVNAj3aGfOCgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/CYDXbz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/CYDXbz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so6534010a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745698476; x=1746303276; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iMFVi6kMs2GlW3FqbZ+c8W0mX4h+96g36QjGWqU5rnM=;
        b=q/CYDXbz7U2/orLSpSTCakYT0O5fcWRRngE/rlr2vl0E16GoxCgzx0nbytoyEF/AH9
         NWlanfpKmaWfKLGBpPGRyUTFIOWVGDHPHGty18Tzp88v/gvV3KsZ+2exAGC1ib8+X/xD
         h63deaBEKADVAFka0j11r31eiumEd8754bf3J0J3LE35qHDqV3L0Jf6NF9EKMl7ocMcc
         4JsQTOZzFytwjRtDfiq0EOi0nYWEGo+9+FF/zfXkwn20bOqcGZnZ0U/wRX61NORfroTB
         tuVAI5vwGPOFu/1uNCAfGr+Oz5133HhphrP9PXuQPLrgyOMfsSf8c1yrOFeCOC1fAiG5
         SdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745698476; x=1746303276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMFVi6kMs2GlW3FqbZ+c8W0mX4h+96g36QjGWqU5rnM=;
        b=bFd6FNhuLflfi/tJkMEYyqkD4vWAglC1xkTXV0Ht2BBEghHkwdXOgvOW1524L9tOGu
         Wh2aKKI+fs/9ZWUh+D7r/zpTinjmyGWedDAgxwwMPdMAod6kwdSEN5XUf5srLokxDhEw
         hWZzT5WHc15FJEWZmeqQ7Y9HFQv2xyqPykshJ72Z4kOKezLjzj3/ylfJi5f4wCevNBQZ
         pCbN2jF3TiUqR6HONr4eXMzcKU3fvlK/Q+RZ+dn8jkMZlLsCFwbRbkgTYcWJI9lKphn8
         kt3P61p46+kjJS1VIUxuAxHvhvf1Kf8z5yVxgxJlHHFvrGcEbgd/GTr1wPgnKz9yE27L
         L6hg==
X-Forwarded-Encrypted: i=1; AJvYcCUg3ByC4s30Tu2vSnqXaS1OGTz5QUK3O5tCK9+knv3LshYj4Us99b6xqfU8NBf8Dx42N9uEY7aJuRvn3F4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmSwHDfRsq7o9bpv8cwz5QA0Quc8rwQa3gApPAjzPGIRhdEtQ
	SwnGOBASm0d8iiBd8rkCBCTaX6cN2k13H3LKzKQ8OpRA1IhdbYEasAAxDHT/bh2Ti1fR5rRhx/G
	nHKW01DSohiiY66CJH9JJ2hVUId6/lK1Wk3Hc9A==
X-Gm-Gg: ASbGncuKTU4N6zhmdD9riEBxi546Kg7IGV2xhgc/u/YhdGsk821HE5IxFvocRXIzLyt
	ikMLL3maOfARAD3YPWP+2xXBfmOIRFp1/5t5f5kX2UTet9ez8N88oH9zxb3u0q+ZWV+6IJr/PVU
	ZsPL/ih0Cxkm+bQkcXjiel1jsNsXgJEsMCNeEyfmXRkRKJlbo+yA77d6Dd
X-Google-Smtp-Source: AGHT+IFzAcYkrWSpLnALMz4IOmWDHGW3c3A0BJ5sxt15g5Kcfu+Hi0BvKk6p41FqxLu0PhKfP/bQOHVtQB7bKF8yLXM=
X-Received: by 2002:a05:6402:274c:b0:5ec:fb3d:f51f with SMTP id
 4fb4d7f45d1cf-5f72269088bmr5668937a12.10.1745698475929; Sat, 26 Apr 2025
 13:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426065348.1234391-1-xiaolei.wang@windriver.com>
 <20250426065348.1234391-2-xiaolei.wang@windriver.com> <20250426131804.GA13806@nxa18884-linux>
 <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
In-Reply-To: <12b34414-94cc-4f84-ae63-0ecc38bf5efb@windriver.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Sat, 26 Apr 2025 14:14:24 -0600
X-Gm-Features: ATxdqUEm-fDJNLvyvlQsgTBEC97JqhRG-_wf6f2Ng6j5VajbYKC45hcbu2ANAzk
Message-ID: <CANLsYkzNE-Z8LwEtpXrmnWLLDNvzjFYaFHVePE_mSkmWVdQ6Zg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] remoteproc: imx_rproc: release carveout under
 imx_rproc after rproc_attach() fails
To: xiaolei wang <xiaolei.wang@windriver.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 07:46, xiaolei wang <xiaolei.wang@windriver.com> wrote:
>
>
> On 4/26/25 21:18, Peng Fan wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> > On Sat, Apr 26, 2025 at 02:53:47PM +0800, Xiaolei Wang wrote:
> >> When rproc->state = RPROC_DETACHED and rproc_attach() is used
> >> to attach to the remote processor, if rproc_handle_resources()
> >> returns a failure, the resources allocated by rproc_prepare_device()
> >> should be released, otherwise the following memory leak will occur.
> >>
> >> Therefore, add imx_rproc_unprepare() to imx_rproc to release the
> >> memory allocated in imx_rproc_prepare().
> >>
> >> unreferenced object 0xffff0000861c5d00 (size 128):
> >> comm "kworker/u12:3", pid 59, jiffies 4294893509 (age 149.220s)
> >> hex dump (first 32 bytes):
> >> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................
> >> 00 00 02 88 00 00 00 00 00 00 10 00 00 00 00 00 ............
> >> backtrace:
> >> [<00000000f949fe18>] slab_post_alloc_hook+0x98/0x37c
> >> [<00000000adbfb3e7>] __kmem_cache_alloc_node+0x138/0x2e0
> >> [<00000000521c0345>] kmalloc_trace+0x40/0x158
> >> [<000000004e330a49>] rproc_mem_entry_init+0x60/0xf8
> >> [<000000002815755e>] imx_rproc_prepare+0xe0/0x180
> >> [<0000000003f61b4e>] rproc_boot+0x2ec/0x528
> >> [<00000000e7e994ac>] rproc_add+0x124/0x17c
> >> [<0000000048594076>] imx_rproc_probe+0x4ec/0x5d4
> >> [<00000000efc298a1>] platform_probe+0x68/0xd8
> >> [<00000000110be6fe>] really_probe+0x110/0x27c
> >> [<00000000e245c0ae>] __driver_probe_device+0x78/0x12c
> >> [<00000000f61f6f5e>] driver_probe_device+0x3c/0x118
> >> [<00000000a7874938>] __device_attach_driver+0xb8/0xf8
> >> [<0000000065319e69>] bus_for_each_drv+0x84/0xe4
> >> [<00000000db3eb243>] __device_attach+0xfc/0x18c
> >> [<0000000072e4e1a4>] device_initial_probe+0x14/0x20
> >>
> > Fix Tag?
>
> I will add it
>
> >
> >> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> >> ---
> >> drivers/remoteproc/imx_rproc.c | 14 ++++++++++++++
> >> 1 file changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> >> index 74299af1d7f1..c489bd15ee91 100644
> >> --- a/drivers/remoteproc/imx_rproc.c
> >> +++ b/drivers/remoteproc/imx_rproc.c
> >> @@ -595,6 +595,19 @@ static int imx_rproc_prepare(struct rproc *rproc)
> >>        return  0;
> >> }
> >>
> >> +static int imx_rproc_unprepare(struct rproc *rproc)
> >> +{
> >> +      struct rproc_mem_entry *entry, *tmp;
> >> +
> >> +      rproc_coredump_cleanup(rproc);
> >> +      /* clean up carveout allocations */
> >> +      list_for_each_entry_safe(entry, tmp, &rproc->carveouts, node) {
> >> +              list_del(&entry->node);
> >> +              kfree(entry);
> >> +      }
> >> +      return  0;
> > Could "rproc_resource_cleanup(rproc);" be used here?
>
> Thanks for your suggestion, I will try it

Before sending another revision, please detail the steps needed to
reproduce this problem.

>
> thanks
>
> xiaolei
>
> >
> > Regards,
> > Peng
