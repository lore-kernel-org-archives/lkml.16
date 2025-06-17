Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CFE291C0C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153043; cv=none; b=Q40m3HazFxM5xJff+pIiZiud2V5Lqgzg0g86eiLIG51VXvpbYBQ2iayG+/6qTYTQXDdC6kgrufdjU0egXV1d3R6O4Fi+nL8YqgUahFNS3KDH0PKkVlBzvn5PSawNK4p/JbE4fMM7Y+qFZN0gXSKXNjAg4ATMJymZXgzMLHbf/UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153043; c=relaxed/simple;
	bh=YHPHcbEtKx3e1/IQVsfntHxD7KeC7qvG/QgbnDsiHg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7k/yHwXiKj7X+kxpLbe+yUZEci2p7oVbtjHh0EPttr1qFCpub0fJFG2x6wzKQS2enasnTfmYR9pKl0DMVuxbAIFgdlgvpR0a9lCrm32nlt63fpuCqMvGTJQ1CExU6KFukIB1rqB66aH1Q/gfwCuHgBNU7JjrATkAXzmT6tvmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=JFNCPeRz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="JFNCPeRz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3671313f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750153039; x=1750757839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQLWgJwCNGpOjHI3jmeKcf+m7mG0t5rZQIDZcAxVNp4=;
        b=JFNCPeRzV4Q/sEvCpJfsD6F5x52Sa2rYkHfmHEvcu/fAPZLLFbWWDdU/wrDO03VnFp
         jtkKIb1YEgPyiPDHmW42bMf1r78dETpgvxLHX1/hxZunMeVl3LCcFfhHjkhB04y+FLIf
         9nTWvSeyYxp+NySeyswlvCMkBPifOk710Dag/KpsNLPfdEcqpsAatqmN4T/q6OLAcrFW
         CdqVjwCXMOrCUakyBnmfsn9IX7nO+RBlYw5AmURErwtoew0IOaK375qQXFBiPzFnyyzC
         uzokLF9EOHDArdycaQdsbnIjhFJlIsBGjo/HbfTw5lcf817BkXllTMjHoF5Cf7lMS9Pk
         s7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153039; x=1750757839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQLWgJwCNGpOjHI3jmeKcf+m7mG0t5rZQIDZcAxVNp4=;
        b=cuItj/ypYOpwz5NoHaHG9Gjo4Y7zrSN38XbNaUoitQIbNA0GvlQ6e9mpvcHM8fXFKs
         mvZT++UJvPTW3XkoqDykd1qaUw/ci2lLA98YW3C+1cWZVDNCxNF4kfrX5wmyrLvdoyGK
         kb9eRzLIvn634PbjXa1l/bIKXL9PbCDmUGgqNMJHhU03YkYFy8b4/lBuuGtKRwtt+n7p
         YootEHCuj65dkosgU+/HV8BgIFU8m194FPp/OnPlYgwwUJPcNELPFYA59yK3vhDonRyy
         TuK6HSmvUztTHd8+JY+lf63fOw1h0FjMVoF3dWiI+u8VIp0O4ebLzx01U2NFU501/p96
         4hSw==
X-Forwarded-Encrypted: i=1; AJvYcCV/qhQ/vr1ibE+edAPCpohU284auxiKx8O6qfts3IeXyX0IvHtyOOJ/lpRRrO2FnSH5Dxn5EpDB7J9c9AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJcyjMSOy+NzUCps4lHh6HC4W7KmFNB39hpOBsz2ERGrW/lPbf
	Sg7ZSYEgGa0JUO0tEvQKHCxXvYXh3cTcK48H8sx1NTzsi/Mpu4iMf7VU5WoVYMnZ7A==
X-Gm-Gg: ASbGnctesPI0t784s6cdVi4zsqTY2KpaD9zbHRqFSLeqo1KYr6YAyU99Tl11wgDkciL
	N1+HpZULWwe2CjuAblBzZ515jvKrP1zhyC30URaryawjur5owDfyMvZX3YnYqdOAsDeM4o44cLH
	MnzdqeKWkTssHIQyoIh5OYlxYFQVydeoX0yKhQqwc4mjhh7kUDNbESblpJ287YHuyKBn2TcgFVS
	oCUg1MwAe2No/31osdvWXPnYgueVPD2sKYaBe+wflGB7I6uaWKAyB/NNkN6QqlxIs5C2e5UQEsv
	+XWkXMYcckK3PGaM9ZEcojSMGRRhB6znFqx+HfImAgkeDEwu6uAjchFBVUtUjZ9Q5oaCBZoE0PX
	wKGGZGNlV2ZT020qoZzIbQQEOU2D+buH2bQAPSLMOvA==
X-Google-Smtp-Source: AGHT+IFVAOAbd/qgKSVKbDicAB2PnOt83B6zNjx9qBCLEy9aEwwB0HmDR3fUYBp5jRLGG5xc8Apugw==
X-Received: by 2002:a05:6000:26c4:b0:3a3:652d:1638 with SMTP id ffacd0b85a97d-3a572e585a1mr9727634f8f.48.1750153039313;
        Tue, 17 Jun 2025 02:37:19 -0700 (PDT)
Received: from cyber-t14sg4 (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a57b2bfc69sm7492985f8f.76.2025.06.17.02.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:37:18 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:37:17 +0200
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] firmware: coreboot: support for parsing SMM
 related informations from coreboot tables
Message-ID: <aFE3TVxqpt4-lmYP@cyber-t14sg4>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <815080fae73a4e879bae4851367ac7c0ad2cd551.1749734094.git.michal.gorlas@9elements.com>
 <aEtWtBKfNhDT1bF9@google.com>
 <aE1wvuamXqVTzpny@cyber-t14sg4>
 <aFBfcg7E38ywGD5W@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFBfcg7E38ywGD5W@google.com>

On Mon, Jun 16, 2025 at 11:16:18AM -0700, Brian Norris wrote:
> On Sat, Jun 14, 2025 at 02:53:18PM +0200, Michal Gorlas wrote:
> > On Thu, Jun 12, 2025 at 03:37:40PM -0700, Brian Norris wrote:
> > > > @@ -112,8 +122,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
> > > >   * boilerplate.  Each module may only use this macro once, and
> > > >   * calling it replaces module_init() and module_exit()
> > > >   */
> > > > -#define module_coreboot_driver(__coreboot_driver) \
> > > > +#define module_coreboot_driver(__coreboot_driver)                  \
> > > >  	module_driver(__coreboot_driver, coreboot_driver_register, \
> > > > -			coreboot_driver_unregister)
> > > > +		      coreboot_driver_unregister)
> > > 
> > > You're making arbitrary whitespace changes in this hunk. Try to avoid
> > > that, please.
> > > 
> > 
> > Sure, will do. It came from a style warning when running
> > scripts/checkpatch.pl. I thought it could be useful to fix it on the
> > same go.
> 
> That's odd, I don't see any such warning. Anyway, typically I'd expect
> such things not to be lumped together under the "separate your changes"
> guidance of Documentation/process/submitting-patches.rst (if they're
> worth changing at all), although that may not be a hard and fast rule.

My bad, the whitespace were not a consequence of checkpatch.pl
complaints, but rather running clang-format on coreboot_table.h
on a clean tree:

 * $ clang-format -i drivers/firmware/google/coreboot_table.h
 * $ git diff
 * diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
 * index bb6f0f7299b4..3d933c657535 100644
 * --- a/drivers/firmware/google/coreboot_table.h
 * +++ b/drivers/firmware/google/coreboot_table.h
 * @@ -61,15 +61,15 @@ struct lb_framebuffer {
 *         u32 x_resolution;
 *         u32 y_resolution;
 *         u32 bytes_per_line;
 * -       u8  bits_per_pixel;
 * -       u8  red_mask_pos;
 * -       u8  red_mask_size;
 * -       u8  green_mask_pos;
 * -       u8  green_mask_size;
 * -       u8  blue_mask_pos;
 * -       u8  blue_mask_size;
 * -       u8  reserved_mask_pos;
 * -       u8  reserved_mask_size;
 * +       u8 bits_per_pixel;
 * +       u8 red_mask_pos;
 * +       u8 red_mask_size;
 * +       u8 green_mask_pos;
 * +       u8 green_mask_size;
 * +       u8 blue_mask_pos;
 * +       u8 blue_mask_size;
 * +       u8 reserved_mask_pos;
 * +       u8 reserved_mask_size;
 *  };
 * 
 *  /* A device, additionally with information from coreboot. */
 * @@ -112,8 +112,8 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
 *   * boilerplate.  Each module may only use this macro once, and
 *   * calling it replaces module_init() and module_exit()
 *   */
 * -#define module_coreboot_driver(__coreboot_driver) \
 * +#define module_coreboot_driver(__coreboot_driver)                  \
 *         module_driver(__coreboot_driver, coreboot_driver_register, \
 * -                       coreboot_driver_unregister)
 * +                     coreboot_driver_unregister)
 * 
 *  #endif /* __COREBOOT_TABLE_H */

Anyway, I am not sure if it is even worth changing, its rather cosmetic. I
removed these changes in v2. 

Best,
Michal
