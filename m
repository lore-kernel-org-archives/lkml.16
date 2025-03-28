Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B87211A05
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148048; cv=none; b=V9ezjC3Ejbd8JkUOXwbMCrvU9xvqdtcyB8bagNK22hAXn/893BQEhqDZpKGeb3CFRygLo6N7vWkpMP0DiAI2jX0V1PXSwpUsSqDOE3zDfTrEgyLxWsrkPCk2nFkvNeSWNbzB74qJecaswhed3lKh+laFIJqSzAKVwIIySo7s4iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148048; c=relaxed/simple;
	bh=PtP+NGCGW7qLVQ3maqLF1JTTzGIcq5Q0+GUEyuhMre4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0PfREkurK+Y1XpTGC1VYvZi/J9jyB8CRoBWDs7ooMBNfDQGzExd0ykoaL8GQf11xR8PQkMzC5YP83J1U6ggghJ8jweOmimOm8DGTRibUVhYl+z9MhO5jp6+ZBsKavo65X1Phi3E9LXGDZPewcl/eZBREaIM2ewyzi54QrOEXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xM3+fQuP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xM3+fQuP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223a7065ff8so55504875ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743148045; x=1743752845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSRNCHHEeuWVfsyhWJ175d+kGZyBEPrk7OGj2+IPcUM=;
        b=xM3+fQuP8P8ZfbhsG+LCJA/H0VyHCf0zyyEmszt1M/dLLh8Ry0mQ0ZtOG20T1q8evf
         K2dsjBJedhy/AUnc/FQE3ENj2bFv1/+z1lZsbj0w228k5WMIQcJJzyFp/nDoNyn7lDgW
         i55vuF2iRRCuUeVTUgHhaJU4r1fA9aVLYcSzW/AFkbVtpB5n4nfLw+ljLdVzr5I/mj0r
         sfQUXEbHsIsuw54BmwrFOQwu2y0LWJHtQ3QsL1mEJB00QsBfMKrxVRm81qSO/N4jRJTL
         MPZj0S8+NYYnqM97xV9M5jBLtO1VyOoznRnDAiCS/65LXt9MgjaZo3rnMs1ze8oYc0NQ
         WqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148045; x=1743752845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSRNCHHEeuWVfsyhWJ175d+kGZyBEPrk7OGj2+IPcUM=;
        b=fvUSI27Pv2X6avkdz8VOnKL1VkIBHrwyrUIYD/QnOa1EnT7UfUJRh6G7YI+BZljoaj
         s8/dZ3yUPnsR+xjBpFRfamNI/OncpadQ7qFKjVdrYPoemaZEI9rlPzdnAMgyZXgdUkE+
         4J40f/J5j2DQgQp6M/Jrvl/7jwKKw8fILjCSvyDEtAYPI25lOI19kDnrWUyCMz1W9cFe
         WKCiU6rh4UdPeuORffhw3CuTU6DDvGdyIEQkjtJJJDBnlkGmuww9yPjox6HheVigG4ti
         IpMOjUUUTf15UOHxreF477H4DpWkQjzh9gC9EVvohVNeOqlCrU99CXMlv2yBhWjwIYTl
         9n7w==
X-Forwarded-Encrypted: i=1; AJvYcCV6e37FMe3zoEuPTpumILHWpFGaAlwBJptEr9NSfWuSqpPrtWAJ695ECZ/vs9M3+akwn2qIbB1LDUzNYF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5Y4bpSCn+Q0Z8MLoWsOylSt4Vb125LY2wCTolLUwyr6BjlmE
	1zDXBv5ezGmk//NovWMOE3cF7I3H/UY4+5/9iYKtR+1uS9v3BnzAPazUfBGZOfI16yraufXi2Eh
	83/fO4bXB+JfZl5SM7FGuD47+FyAVVAcslMYz
X-Gm-Gg: ASbGncvlXN09BxUgGTs6SWiMuWkdpqMSM6bp9unMuhL6pRiDEUvgIYTwVF3FunZtrro
	yn6fBRa+p1jm/kyXs2hL+9eE4EqFMT+vvCR64q/7EU4XIQdj4TRFM8esE/F9M67Gh5qHcugaaGT
	0nYrgUSBI9vXqJZRBCTlMhmO5PJZcACAyF/aH3deBdtq2ZF6QeToinA7rf
X-Google-Smtp-Source: AGHT+IFjlntASsIZFKKFarjsob5FA/YWx+0UwMbHPg7tbz1FC4RqdXsuMvg0Aor7xktvtHSjvCWuvoZcUzL+GRvbomQ=
X-Received: by 2002:a17:90b:4a02:b0:2ff:72f8:3708 with SMTP id
 98e67ed59e1d1-303a815d765mr10177056a91.17.1743148044642; Fri, 28 Mar 2025
 00:47:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-7-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-7-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:46:00 +0800
X-Gm-Features: AQ5f1Jqq_y-DoImoixkLsT9RYwh8uFNtxMSR53od-9VW8uNfYNhDBtnFa6MwHG4
Message-ID: <CAGCq0LaDzCVau0jZ8WydSFF7FVAAXuUHaR=3gPcteew6X4kP=g@mail.gmail.com>
Subject: Re: [PATCH v36 06/31] usb: dwc3: Specify maximum number of XHCI interrupters
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:53=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Allow for the DWC3 host driver to pass along XHCI property that defines
> how many interrupters to allocate.  This is in relation for the number of
> event rings that can be potentially used by other processors within the
> system.
>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/dwc3/core.c | 12 ++++++++++++
>  drivers/usb/dwc3/core.h |  2 ++
>  drivers/usb/dwc3/host.c |  3 +++
>  3 files changed, 17 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 66a08b527165..17ae5c13fe36 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1699,6 +1699,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         u8                      tx_thr_num_pkt_prd =3D 0;
>         u8                      tx_max_burst_prd =3D 0;
>         u8                      tx_fifo_resize_max_num;
> +       u16                     num_hc_interrupters;
>
>         /* default to highest possible threshold */
>         lpm_nyet_threshold =3D 0xf;
> @@ -1719,6 +1720,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>          */
>         tx_fifo_resize_max_num =3D 6;
>
> +       /* default to a single XHCI interrupter */
> +       num_hc_interrupters =3D 1;
> +
>         dwc->maximum_speed =3D usb_get_maximum_speed(dev);
>         dwc->max_ssp_rate =3D usb_get_maximum_ssp_rate(dev);
>         dwc->dr_mode =3D usb_get_dr_mode(dev);
> @@ -1765,6 +1769,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>                                 &tx_thr_num_pkt_prd);
>         device_property_read_u8(dev, "snps,tx-max-burst-prd",
>                                 &tx_max_burst_prd);
> +       device_property_read_u16(dev, "num-hc-interrupters",
> +                                &num_hc_interrupters);
> +       /* DWC3 core allowed to have a max of 8 interrupters */
> +       if (num_hc_interrupters > 8)
> +               num_hc_interrupters =3D 8;
> +
>         dwc->do_fifo_resize =3D device_property_read_bool(dev,
>                                                         "tx-fifo-resize")=
;
>         if (dwc->do_fifo_resize)
> @@ -1851,6 +1861,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>         dwc->tx_max_burst_prd =3D tx_max_burst_prd;
>
>         dwc->tx_fifo_resize_max_num =3D tx_fifo_resize_max_num;
> +
> +       dwc->num_hc_interrupters =3D num_hc_interrupters;
>  }
>
>  /* check whether the core supports IMOD */
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index aaa39e663f60..fbe83914d9f9 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1083,6 +1083,7 @@ struct dwc3_scratchpad_array {
>   * @tx_max_burst_prd: max periodic ESS transmit burst size
>   * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo =
resize
>   * @clear_stall_protocol: endpoint number that requires a delayed status=
 phase
> + * @num_hc_interrupters: number of host controller interrupters
>   * @hsphy_interface: "utmi" or "ulpi"
>   * @connected: true when we're connected to a host, false otherwise
>   * @softconnect: true when gadget connect is called, false when disconne=
ct runs
> @@ -1330,6 +1331,7 @@ struct dwc3 {
>         u8                      tx_max_burst_prd;
>         u8                      tx_fifo_resize_max_num;
>         u8                      clear_stall_protocol;
> +       u16                     num_hc_interrupters;
>
>         const char              *hsphy_interface;
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index b48e108fc8fe..1c513bf8002e 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -182,6 +182,9 @@ int dwc3_host_init(struct dwc3 *dwc)
>         if (DWC3_VER_IS_WITHIN(DWC3, ANY, 300A))
>                 props[prop_idx++] =3D PROPERTY_ENTRY_BOOL("quirk-broken-p=
ort-ped");
>
> +       props[prop_idx++] =3D PROPERTY_ENTRY_U16("num-hc-interrupters",
> +                                              dwc->num_hc_interrupters);
> +
>         if (prop_idx) {
>                 ret =3D device_create_managed_software_node(&xhci->dev, p=
rops, NULL);
>                 if (ret) {
>
