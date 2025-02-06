Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB5413AD1C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811068; cv=none; b=UPBq15IQw0QI+oLq50z/biZw5zO4GZ5X9fTW92H3rW7cs6qlwRjeQ5M6S+8XPrEqjwdudfEECyWJZRIJKv4+G7EZWrox9B1ZdKg6y4Gf6lpdfweBA+9GqkB8l+fd/iRkTmSoBc6ui1hKMo9VXYypr+G6cbFkXipnt5d9frkZqFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811068; c=relaxed/simple;
	bh=bMNaySAiVfKEoMfLWjDwwedVnyphy/yHvzElicLmEuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZyH17a1Blqr/XVXc0y4Hbm2TqGk8NVYndv4Nvnuj6eIw/Eskr53LnV/NajPU24Pj9n8tsTwOzKgjr0dg1c0epfjd2W2E0yaXn6sVtJ6ZZpbPwwQwp+n2E3piYyXGoxR9alUZpGcBESis4kJ8blCyXE2AP/N6fAuRZ1q8kpmmm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=VaGXHHb5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="VaGXHHb5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab6fb1851d4so84902066b.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1738811063; x=1739415863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kHXeN8LIM9w54fK8BX5YrWdpuop7tLiyGoSgZk7eNoc=;
        b=VaGXHHb5uT/gczoARljDffZA8u7DIE4N9ZGLw1ixIg6UeD0adaGeTF96tDr5oIXYZL
         p6/kMR71wrwBnMe0l2UxwRDtrVSWP9vTuDze33oA2Xp1NwdXN4xjFFheYN6aFWLAVlYp
         f6xmfTjxm/IcB7ExAiAIBDR2GO1hIAEo1es6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811063; x=1739415863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHXeN8LIM9w54fK8BX5YrWdpuop7tLiyGoSgZk7eNoc=;
        b=b6ZhRHF0oCkX+4obWBzB8UA+DBKsqpK+WfFa2hxgMDvx+T5Neth771353RNm4P2VKj
         +wgIBSE93awZsbYjs3wR4cvYHNzd/6fobNs87El3NMYoS8agL1WAuTWFYyqgrtOmyNtM
         pWO21g/2BHakJwRm1nTe9S2JpsanL68mhAb5+CN98MU1YJwE5FnweZflFdO/l4zdbyt6
         xcEPyqW6NQKxkdgvR6QwtekE5OQ27SmW4Qph++/k0k3ywQZzG7oenqFXTI75PhNLPDFj
         DyCaAXFczqqKgu37/4TmcDhBuu4dEi2KEguD+38dxj8eBbv7SSYJ8SJDd2p9fcX9hR9E
         fyow==
X-Forwarded-Encrypted: i=1; AJvYcCUrAgDnwJrpuJXz4lQdQmMUoEOTNp+pG3R/96uOU9k74J8PV27SOiv0+xyLhO8hfVDO3rN5xC9i31encrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5DHqme5uZmJFq58NtB7nNijMV0nmSBZ4cHBc9npONIj+yVps
	X1UXYPlms5c5CfLQCoZ5Es7p+pIfaCWNBMRlg5FeiqIfvrr29Dsrc1KQF2gMCe2Nf6yyVN55T50
	au8TuAwLoP0V7CYpkM9XUytbI2TI=
X-Gm-Gg: ASbGncvCD+N8I+GrCpVuNUUSP7hdDNOKPbH2qTQtfJyM5qOqDXRONkFTDVX02n3Awmh
	xNAvtfFNH/ouKUglWy6Dk2CNnAKOt8o2G/q/qxK1KAA0Tfgqc8O80ixtZxfnFqLXStEs/+hWG
X-Google-Smtp-Source: AGHT+IHqxAD/mAroNe/du82YKfNv9KCYjKV/xBzj38++g3h5xV+O074K8SXXeCFqLMo6ZY+71Vf5+TGBbTDseAZx9Xc=
X-Received: by 2002:a17:907:72c1:b0:ab6:d575:3c4a with SMTP id
 a640c23a62f3a-ab76e878417mr125480566b.9.1738811063095; Wed, 05 Feb 2025
 19:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
In-Reply-To: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Feb 2025 13:34:10 +1030
X-Gm-Features: AWEUYZnF0CfsV_4ImWi4JVAR627wkvGoxLYm6rTH2Jjlr9IDQ3zsK4d4k_9LZjU
Message-ID: <CACPK8Xe_3t0n=BDcbFQLt+M1K-PTHMWGs37k=4B9P6tfsqEXeQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, arnd@arndb.de, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2025 at 13:27, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> From discussion in [1] and in-person with Joel, flip my entry from R:
> to M:.

I'm off the hook!

Acked-by: Joel Stanley <joel@jms.id.au>

>
> Link: https://lore.kernel.org/all/CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com/ [1]
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: soc@lists.linux.dev
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa06545e2861abe46ea7029f9b4d3628e..305e5530560e53c10f0b610fa7b4456ca78fdfc2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2285,7 +2285,7 @@ F:        drivers/irqchip/irq-aspeed-i2c-ic.c
>
>  ARM/ASPEED MACHINE SUPPORT
>  M:     Joel Stanley <joel@jms.id.au>
> -R:     Andrew Jeffery <andrew@codeconstruct.com.au>
> +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-aspeed-maintainer-dddbbe22da46
>
> Best regards,
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
>
