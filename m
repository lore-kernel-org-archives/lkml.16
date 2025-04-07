Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBB118DB0C;
	Mon,  7 Apr 2025 03:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743998158; cv=none; b=XYmwLYWeN8w4Ng4EEFK4mLmtFSJaUdpxWvnw36srITHxOJ60xd00sytyw4MrG+x716P4yH6DDltyv9b9kPISlzMz1JASxDGQk8HElIOJ3zRhsSfnV1VtwYD9V698e+hm3dT6J2meBsrCjPAaFEEMUzwivd13wSMvG+ekYjbJKvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743998158; c=relaxed/simple;
	bh=U5jdwZlcjyjEjduol5nDR+eGakkfA8QWCZmZiMztG1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upT7QlxcEGDXlIoPOD0nljwqsQGLoPIrEyKy/Tw5GK3QFIFchYjIVOz7W7uOGZrvw6u0LZl9fckEAfADpxtXu350IYImluirMJWF+bH4H48VW+T3vH04PxzwsB2ZhZOTWV3CJZcG+npjtpkbX5jJQKTQzsKsfJHmyj43n+LLedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtXjJDYq; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtXjJDYq"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5e39d1db2so221951485a.3;
        Sun, 06 Apr 2025 20:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743998156; x=1744602956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/kQC/tIMD1tMIkQuSZnRPeYkAdNSaBJYK92HmChoZH8=;
        b=CtXjJDYqao1qUzl6kiwqqE94IQxrYGxW7gnJW8l/bczigS6yJO/5s+YvXCX8XliLhy
         H5lqh2k98qQhUoINYCXzALGzyYtCRDh9PLKB6nxfyhrxgwV1CmxDyLga48FrlM7dL21r
         eddvUE0u6xxazN/DaNkyJXUR2v6/LUrhIdiagrzR8+WfrBb8f+I6Ako6hU0mb/hLv2iM
         GWWb0YySpFELl/q8o/W1hA2X3xU3/PoTxDWkQacTqJoTsoqZoMD2+bHe0aO5ods7X1Ms
         WJQ7rBWCCCTt66tUCFMIiNpg/rhhR9jLs0TdawneCV6fcjGmhRRZ6zIzznFrDkZvX6su
         jByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743998156; x=1744602956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kQC/tIMD1tMIkQuSZnRPeYkAdNSaBJYK92HmChoZH8=;
        b=RUvfhy+bxekPoZfVsHlSfo4tJl7II18zF7ZKS6vBKtJAOn66rsoCe4IeE3mfxCWfIC
         D8B2ixTwi0WY0k/JGEbm4K6JGtQgSLn3jiL0ODI6vd2Hegcqh7SIcopZITtKc6vcXqeN
         rMyJTMxaquKM+2ZVCgeP4HZYXEvkq4b2WsJOP46kor1tYe0UwqsVzHBWhUTi5DljYb+n
         Som61Z3UpIfkv1fd/gqVuFLprVYCUEQelFyVtsuFCORNGL5XRYGojx0gnKdzJCftRuFU
         7PBx+wrrprW4k3GNR4BCIgGXwCTbmMgWiAAiw2kyy/XaFZ/zYz4fnlVVWUmiG9q/21TP
         hvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdvkCye9QCVivMXIejWz69pY+/aNYgUPs0IzlcsoFESigi2o8OL53l9F7Ur/8139X8JhRv8QNRQpGSAJNF@vger.kernel.org, AJvYcCX0+7vBcdp1a5amcQ6bqL7Ekum1EkB+SRTIxonIByNEdmwrx4uF7o9SbS4tz4KyrRPQNiOu/5I6Fk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLFKVCWxVjbSfqch2nHAU10zh/sXxISWJFR0eDxuHliFvJYCW6
	gWGEU9fL08HAb1UNmdWfaTlYS5lHrLaePtidftuwgMGp2F5YIWxA
X-Gm-Gg: ASbGnct4ifb4Sb08kGvelKPzr7272UdTeoic2tXKcHYscrGzXxufRBgb6MsZUBFOw2Z
	DqLYPkwhjXrKYtI+DMkSfXx5Oh6KEvT3kH9ZGrk245AsXZDQPi4RSK8K/SdrwZLbeZw7znco1nG
	mipxGH/PcckydK08eCFTR3FQ3Jd777n7C3PdwZIgbcnCYn3Uq1wzOaakIG+r3/K18797VmZ98I7
	fWAjO7xZQopASNmWZ4Q/XZONWlZXaW+Jk1Kb/bXOq6RPxVfb5a0UfFHiBJp8PvqT1aIr+GNGQsC
	zDUW5joX/eJqp8y8NsuS
X-Google-Smtp-Source: AGHT+IHC9d4BLjSK0ieI9+wg92vPQIALBBVaydsqLsbTtunMd5NlBiO2IarUZouiQvLbwXXE8Jubbg==
X-Received: by 2002:a05:620a:d86:b0:7c5:5286:4369 with SMTP id af79cd13be357-7c775a2efd6mr1356538685a.28.1743998156116;
        Sun, 06 Apr 2025 20:55:56 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e739269sm549538985a.6.2025.04.06.20.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 20:55:55 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:55:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: xiaopeitux@foxmail.com, sboyd@kernel.org, mturquette@baylibre.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH] clk: sophgo: Fixes Coccinelle/coccicheck warnings
 reported by do_div.cocci.
Message-ID: <h765x3o4lndngmcllxst5pqsz5p6xmi6rd7qc63ntd6xklghk2@4gbg4x6tcwgq>
References: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>

On Mon, Apr 07, 2025 at 11:21:46AM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> cocci warnings:
>     drivers/clk/sophgo/clk-sg2042-pll.c:217:1-7: WARNING:
>     do_div() does a 64-by-32 division, please consider using div64_ul
>     instead.
> 
>     drivers/clk/sophgo/clk-sg2042-pll.c:160:1-7: WARNING:
>     do_div() does a 64-by-32 division, please consider using div64_u64
>     instead.
> 
> replace do_div() with div64_*() which doesn't implicitly cast the divisor.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
