Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714AA1D5CC7;
	Sun, 18 May 2025 22:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747609044; cv=none; b=r2naCjpgUqSr+KrnnkaydAvC4G98ZDt9fHJRsJSm2LaHQ9uYi5BuyVpzJ/KcAB7tWARwjGsuwcPcxsT3uMuwKmFWvfYNHswytsrANvJKrEEIfKq+GE2iTXAQxK4KQqX0W8/Scs4HSxTZm/N6WIjDAq/F/0Cin4hNvpU1RphsuFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747609044; c=relaxed/simple;
	bh=yowWa6pSn0T/KbzG+5rviDwqhzTDjFxuWOZdq74H1BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIpd16UnnJAB8tP7otNYPTLmOpwpVHJPAvuGwc5EsSSDDi3vBBF62YqVdmAjkjsFoHupnp8929jk9/8cV/paagXSAaAkAnM/FLby9f+QmmF7PKCr2wJL71x8RiBbBnCo3AodDRNHbM/SFtV5+tU9K29Q8xFy8hX2EDsz4je1oVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3y/FncJ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3y/FncJ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b166fa41bso5700643e87.0;
        Sun, 18 May 2025 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747609040; x=1748213840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2expOzKdfcVjHpwet97BjvVsz+R8rCtLpKyQivyIAU=;
        b=R3y/FncJy+dhcDpBHKXQbhG+OkkxBTFuCIMnPEBOZCTnOi99jqrTe9Jyys1rcrk8xw
         3BKBA2OEbBhMJuG1TSWzAdrVNlZasZ8ncfFKf09D2RRFP8T9vK+6mMPRe1NRbFs53bUU
         xjfMFbR6thW87gbkg5iOdoVqK4Q2Jrv449dwKzEq7bx19H0EdEQynleoms5cfy/Nsnrf
         2KQfUnOTuA9GVHRCa6ZboJpo9/RFtabTlHbOYKFJeA9PcdUMMeeqeIFjNyAKS7Zij1cp
         sjSO6uUTupVOLSnwGKwTJQhSBEbmJG1IHIx79wfv4YTsyAxTcEHXbGpICBNhxHhSBQ6x
         2OiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747609040; x=1748213840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2expOzKdfcVjHpwet97BjvVsz+R8rCtLpKyQivyIAU=;
        b=ZZJjDbYOKB8Cv9b7SA+UAfEqpfx5TWQFZrRI8NivXkdiCp+zh7COhO3VJRA2H2OMh4
         NvKvO2ChbfW1N4XWmiaMz4y1nZN1Y/AG8EElanjClxXDDg8KN6mc6xZyWqicAKUP6gN5
         S1UNRuRJAoioYEnvLJEsE53zYBX7EZoKoVGegNjPigjNk730R9Lx8nDeHeKOZY/lJE0F
         34ywtBTl7SiryYW8teNv4qOdOBDmdpk1ShwfwgR/6Uvtqc4kOG6pbHSsknDFAFbBw7TN
         tHiwKmnZZkqLktrRL3aM8uEKR0/4t9T8qhPPuP+KrvvRwAPnOKykCh2jKOd43X1UxsFv
         83EA==
X-Forwarded-Encrypted: i=1; AJvYcCV6StbJR4uY2goeyhJVlEMrRZrbshuLdiIpIK9MOJqCgt6WeX+pWK+uNMvAsdNEMVRO7Zouka0Pp0O3+BY=@vger.kernel.org, AJvYcCW75B9WS1DYcSAuEH11gXSOBcHa9JaXGK/nYTMa0z/G8TY8OUXNnyHTPQRWqesQ3tJ6h+zS/GXxMQb7@vger.kernel.org
X-Gm-Message-State: AOJu0YyBRzgrdUm4uz4ns/N7BmLkdKzpuFdwyLA1TUFDU99yACWXTmC8
	lV0lg0J5/f5vd8wtQAq4a3VG+0JA/379kDaeg3vIakki8gnSpXCylXqN
X-Gm-Gg: ASbGncsZ7JB3lvv/RshILqgDo7r6Js5ivSicaJJvNa0e4L6h4F4vT85ZhkWQLUA/yyZ
	PXwKc1VzoZs+eMi91TKYweF/G06TUNk8CC7SLFFQKaLmKkFIG7tImOF7fz8ZldO3pjw6YedaR4T
	Bjt6ZLefWZA+KrIsmXAsu7W5v85WrDXKX8jLdctujer5rnCxRV+yAIVSDuGsA91QVFvexO4PckR
	+TA8HXBGKwWOALRu79+OgMw+MXNBsdTM0hlvQTTxYSb0eW0YfPngrFSz9Ntu7QTpiqwPQNsOkv+
	8d8A1k0N6lS2HPPg6HGasG+8YTsZIAUjDIjR8HBuJoCIBM8kj9jeLtvLf9n9iwfQQypH
X-Google-Smtp-Source: AGHT+IGx9jOKMKwgpNkuCpuyVRwftEon4VRfg9krjw1d6vvtn9U0gLvgWwJ/Lj/oFiLwUvtziJCkLA==
X-Received: by 2002:a05:6512:2915:b0:550:e5b3:b1af with SMTP id 2adb3069b0e04-550e71954e8mr2481593e87.10.1747609040209;
        Sun, 18 May 2025 15:57:20 -0700 (PDT)
Received: from foxbook (adqk186.neoplus.adsl.tpnet.pl. [79.185.144.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703e7a6sm1600680e87.218.2025.05.18.15.57.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 18 May 2025 15:57:19 -0700 (PDT)
Date: Mon, 19 May 2025 00:57:15 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Jay Chen <shawn2000100@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 jay.chen@siemens.com
Subject: Re: [PATCH v3] usb: xhci: Set avg_trb_len = 8 for EP0 during
 Address Device Command
Message-ID: <20250519005715.532cf34d@foxbook>
In-Reply-To: <20250516033908.7386-1-shawn2000100@gmail.com>
References: <20250516033908.7386-1-shawn2000100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 May 2025 11:39:05 +0800, Jay Chen wrote:
> According to the xHCI 1.2 spec (Section 6.2.3, p.454), the Average
> TRB Length (avg_trb_len) for control endpoints should be set to 8.
> 
> Currently, during the Address Device Command,

Not only during this command, but forever.

> EP0's avg_trb_len remains 0, which may cause some xHCI hardware to
> reject the Input Context, resulting in device enumeration failures.
> In extreme cases, using a zero avg_trb_len in calculations may lead
> to division-by-zero errors and unexpected system crashes.

Only the xHC internal firmware could crash or misbeahve from that.

> This patch sets avg_trb_len to 8 for EP0 in
> xhci_setup_addressable_virt_dev(), ensuring compliance with the spec
> and improving compatibility across various host controller
> implementations.

Any particular problems which motivated this effort?

I tried an equivalent change (with = instead of |=) on several HCs
and found no difference, including no elimination of known HW bugs.
 
> v3:
> - Corrected author name in commit metadata and added changelog.
> 
> v2:
> - Fixed malformed patch formatting issue pointed out by maintainer.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
> Signed-off-by: Jay Chen <shawn2000100@gmail.com>
> ---
>  drivers/usb/host/xhci-mem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index d698095fc88d..fed9e9d1990c 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1166,6 +1166,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
>  	ep0_ctx->deq = cpu_to_le64(dev->eps[0].ring->first_seg->dma |
>  				   dev->eps[0].ring->cycle_state);
>  
> +	ep0_ctx->tx_info |= cpu_to_le32(EP_AVG_TRB_LENGTH(8));

The rest of ep0 tx_info is zero, so this could be = instead of |=.

> +
>  	trace_xhci_setup_addressable_virt_device(dev);
>  
>  	/* Steps 7 and 8 were done in xhci_alloc_virt_device() */
> -- 
> 2.43.5
> 
