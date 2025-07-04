Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE5F1FC3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636857; cv=none; b=fufhiAe21R0piRr1WZGttHbOPSbZmZQENB0doJOGvYtz2Kig3Mcyn83B6RVcW5ALe8+YkAASzX8Hr9VdahAnKo/84lGemvhrAF7y8xqf9XT0ZoGD5DResW7JiiElBDNL0sy0pt4w2KAMraaGyPJPIR2xV/K1x+5wNV9igvSoo7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636857; c=relaxed/simple;
	bh=HN01VSf9c4TVDyDhVbl5djO/TXNZ8jea5qMTYo6ai9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwbIbCnKLtwUMx/y0E55XR4xohOLeJflGrgppv/KFRjhMM2KI+bFHZBtFvcwJuqo8Zb7OXFFoVhbLb5J6FeazNivc2oXPotK3bCtJK/QwwEiT2NSGY9s5mcwfkUHIm6reSLIplnNHlvm3xKftHY0xW2s7Acb0DAu3fAcqw8NE7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LUXp7HwN; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LUXp7HwN"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d41b04bf6fso97878785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751636854; x=1752241654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+Mj/zcITxndpNinPY/DINby1Bgp9brjcf+mBjGfOCc=;
        b=LUXp7HwNxpf79hj0T5qQ75a4widwokZ2lur8JDLwyw0UIlCg3L8vhFSXNRgIyy/GZu
         HDdxzcXGlr70S3nKoxQvv6/AZuRPCODEx6kYcgLkXlmmv5jPybhP0xSnIyzUJiCrNaQP
         KOSC6dfGyBs1fJUpGQkdysBXbyOf0NF4KGYGsrG9K4wAa+CYSMM+rBif8Wt5daJw7qYE
         Nkc14dtg6eznnywGu0giw7nnr2rq3WHlx/6wD2d9NGPvqszCwra2cL9RiZnxXNhvMVyU
         2ofzhGfUSF/eEzQ5MgXUrDzQzRq64qzRxmalVJLHja5ub8XSmfJvfIlZ39uOk/pIOYG3
         auoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636854; x=1752241654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+Mj/zcITxndpNinPY/DINby1Bgp9brjcf+mBjGfOCc=;
        b=MTo5blpFYgj/+tEiK5URiTcwhpQZxXECyLDo6erxfneODsab1TLFnhRQAyX2SknmVt
         nJM97DS28XNnLOjyjO1mBY4y2GcAfnaXQEaqBRgiE3snbplmteCJGXmlLyGqbtfVCuU4
         LCp9wcoQLbq5CGJ9gYwvtjxYKnwNm8Q6KMVn09NkBOe8zsUAnf4FyLuDwePKHMVqRhZD
         LrB/t2uAHBnDqES0LIFkdb0xobZ6xBB6kfY/xFC14Gp2MCwZfnZW+FgMtqkxR5iH0m5I
         2nUEs3j7/DKz3fYBvF0ivygNGWCzIJCDiMjoWz47p3wHemRxLbefep2AJJZipLiISMQX
         isVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdBwDY2V23ZFIPz+FrSdQY86xJ7ncaWZ90tVTuD8rIMuDrIpT+PaDyORw8BThZPSaK7dYi4YdvmowN6Mc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1oWyEToQPmpAkiOl9u9/BukDgxUz6ZGZAhU3wZcZKRuRDfOy
	XxCcOHFjTziurceFfm+8gRzb1oiDGieaLBDlGV68fncryDm5V6xdJIdh2EmXDw4OSHgfLUCBK/L
	DfBk=
X-Gm-Gg: ASbGncvRijuz9USBcwVjRth7ePvXk9ls+c5ysV8RnKTsO02YgHvbRJbhltdMX8t2l/1
	WTlzZT/GKZc5tOOL4UFAng31JskARsB2Gqxm9tsxi4gBjCYX3sVF1ORLIqB/8Wq3CHjl1fEStlh
	p5kTc4/mvppD9uW9r8J7LYud7mpRUNZkEhD49D20wKWNqRaSC73mChAvfggOGDyaiijLgS+lUYC
	cOM59Yb/MRmCdSBjtJs+HXBZonOOqw+2FZwD+aEU81MwCHs63RgoBeJAUr8tUinOJXpdoUEgPJX
	1+fn2d4nCqTuQTHUBYzm5KIN77fG2zTdJWnxadBDp3hF3lK5VZgIVWu0ekK1pRA=
X-Google-Smtp-Source: AGHT+IEZOPduoa4mNlId43xodqDF+iiwFhQogS5daJ16oNacslKPTR7VPv3e98DZS7jEtd8HuDPb1A==
X-Received: by 2002:a05:620a:29c6:b0:7d2:1458:964e with SMTP id af79cd13be357-7d5df13c5eemr209664385a.28.1751636854185;
        Fri, 04 Jul 2025 06:47:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::4179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c52csm144416185a.66.2025.07.04.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:47:33 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:47:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
	m.grzeschik@pengutronix.de, Chris.Wulff@biamp.com, tiwai@suse.de,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	punnaiah.choudary.kalluri@amd.com
Subject: Re: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst for
 bulk transfers
Message-ID: <cf2940e3-5430-4e84-916b-608c33028a7c@rowland.harvard.edu>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>

On Fri, Jul 04, 2025 at 05:10:12PM +0530, Srikanth Chary Chennoju wrote:
> This patch supports bulk_maxburst. Without this change
> we are not able to achieve performance for super speed plus device.
> Without this fix, we confirmed through lecroy that it is sending
> packets with NumP always equal to 1.
> 
> Signed-off-by: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
> ---
>  drivers/usb/gadget/function/f_sourcesink.c | 14 ++++++++++++++
>  drivers/usb/gadget/function/g_zero.h       |  2 ++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
> index ec5fd25020fd..84f3b3bc7669 100644
> --- a/drivers/usb/gadget/function/f_sourcesink.c
> +++ b/drivers/usb/gadget/function/f_sourcesink.c

> @@ -341,6 +346,14 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
>  	if (!ss->out_ep)
>  		goto autoconf_fail;
>  
> +	/*
> +	 * Fill in the SS bulk descriptors from the module parameters.
> +	 * We assume that the user knows what they are doing and won't
> +	 * give parameters that their UDC doesn't support.
> +	 */

That's not such a great assumption; people make mistakes like this quite 
a lot.  If checking and adjusting the parameters isn't terribly 
difficult, you should do it.

Alan Stern
