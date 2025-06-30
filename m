Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C4125C833
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293199; cv=none; b=naZhspW8X9tFy4AFOplEhKaXqY4xnviF1HRvqu6joQ6wgO2Le/ESS+lR5HqZygufIRoh3p9DS6BezoNUDvc4dh+E3DbGH9zChtzWCL948WLYliaCWAzD7XdRHjINr1OEeMxy9bQmFfxBQOVAxqh7G4OfWrG5OQyc+mUbiMbNK9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293199; c=relaxed/simple;
	bh=okEPAxGeUI67Z8DUbJWQ8Cf3p5/Hcr4IkrNPudjZ9oU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPs+Y5XKybttaWH+xV9SKJNn+3TQ0N6H+2cksHBIrrx3zntYDIit5DdsJzCwt8mv4o1Wg8K7kQ++EKFIngT2Hbkjq/xA5nSQO2QFchUPfeXIuX2JnWIwKsvUBJiC0Tk88cxAsFLnagy1MgdVOKJLS6sxnafuDjxbNapwxXS6kYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZO+z3+BS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZO+z3+BS"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-711d4689084so48665197b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751293195; x=1751897995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XZNz81abEgW0MY3vS9sEZI3H/0FwCGSV3q7Vd6ujToI=;
        b=ZO+z3+BS+8kCy/DHlyUcyL8b07Be9mU8+Bfj/PHL0qKYgEGECzoS4QWhppWYKFFCip
         pwu5g5MXlIx+yLfVVSpWpRyjV/c85qVLtRSSIB3p6MPkAtKr7Y5JBLcQm4KOvC8mh2bO
         rrIyXWkxWjKPkYYPyHkOVmk4Mwd489b+6bO/yRQmxE52hksBAvAZZCqFeQrs5D7i+RR3
         Chtc7efKkiG3+wWgps6zXu8IziCSyPgjmK1Z3vUyir8EdrYVrinY28x9fuwVHqwPlkYs
         PyrdQcqof+n7SW5pUgmfej2txps5ZAw3plKEb7m+jq1uXGAKOkaPeEzrxxgRzgK7lNIl
         gxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293195; x=1751897995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZNz81abEgW0MY3vS9sEZI3H/0FwCGSV3q7Vd6ujToI=;
        b=qc2a1KGTmyIPyaEP+NvIFWw6vPLgqJ7ztFEKIsaukMcjTPwq5i+EFBfB7ItivwO6BM
         VQW9f/jpCWjRYHwFRgT440TvzPUMBUYLuqr3hrk6tulIyykrXMu+mXshxtY4DNotk8mQ
         2l/2yAxPz10dHP5KphigzQEOwmBXZbL2mylMVKazLNz+NQL1WfCcsA6KdLzLA/8CFcSM
         DFGIqnPizwX2QQa2VRMX4Q+6dndgNGvSrmLfBlSHRYxlSu1DJ9s0w0U28BMIjp4sM9kM
         bhgtFYIgY8fFX6rwBpjgD5ZcT+SaVXXIgVbiZz/28bzfhonVjwlKK4J1mhLNAFLuQhuy
         rtog==
X-Forwarded-Encrypted: i=1; AJvYcCXT6hhGlxBl4nhH9Eiigp0TF3tj19VBhqCWM9Pz+LnbA7iMEFcWloAXFREYbDkIroLaQZ5/dqbsajhNN3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxruGCntctCLiv4j0jJNt1dhiRofJB2KA5ENRK46y7wY14OjJVJ
	y05U5XWECiNX2euPsCf5OAi7CvnjTHSIeu/Pe1iF5k0ZX3bhSU+qWrNwdvgMt3nHeFsnFviJFI1
	LK5HUvKbqlsp/fuweMy1MEFbT6aV8+Yx8uLiWmmaegQ==
X-Gm-Gg: ASbGncvXxAqjznkf1zxQDRu7Y8sD9y3ULpiFzFLjSRF5zE8J8Ji2FlN8x7yExDPqZhZ
	NXGXV4ca41XorGoqZJPN+4qhN990TNXkiq3aVM3KXLHzzPTyD08C4Ku5ENLD7JtIhfQSjT65I8C
	YRKm7xljTaN1JDwZ//ypXl1WNgIEx1EXDRbZlUyuW6vQXjmEABAcuGMY4=
X-Google-Smtp-Source: AGHT+IEvlxsuyNjSG2baoIuvTQwgrdpag841OQRlT5eGmzeyivJDJn8CLRei+Oyc3j6Zz+HULGB0qA9R/gOwvS6KYxY=
X-Received: by 2002:a05:690c:6a06:b0:70f:88e2:c4ae with SMTP id
 00721157ae682-715171d56e1mr205407717b3.37.1751293195139; Mon, 30 Jun 2025
 07:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627200501.1712389-1-almasrymina@google.com>
In-Reply-To: <20250627200501.1712389-1-almasrymina@google.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 30 Jun 2025 17:19:18 +0300
X-Gm-Features: Ac12FXzHjqOcGcSbvKjlKEVRTT2E_tZYkZTADywaL4gsQ2efvDkNiYV5BxCcVxg
Message-ID: <CAC_iWj+Rzcf7_1wYF3F-iGUMhJ9sNtaY_gw_FmvEMH6QEx+scg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/2] selftests: pp-bench: remove unneeded linux/version.h
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 23:05, Mina Almasry <almasrymina@google.com> wrote:
>
> linux/version.h was used by the out-of-tree version, but not needed in
> the upstream one anymore.
>
> While I'm at it, sort the includes.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506271434.Gk0epC9H-lkp@intel.com/
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> ---
>  .../selftests/net/bench/page_pool/bench_page_pool_simple.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>
> diff --git a/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c b/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
> index f183d5e30dc6..1cd3157fb6a9 100644
> --- a/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
> +++ b/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
> @@ -5,15 +5,12 @@
>   */
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> +#include <linux/interrupt.h>
> +#include <linux/limits.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> -
> -#include <linux/version.h>
>  #include <net/page_pool/helpers.h>
>
> -#include <linux/interrupt.h>
> -#include <linux/limits.h>
> -
>  #include "time_bench.h"
>
>  static int verbose = 1;
>
> base-commit: 8efa26fcbf8a7f783fd1ce7dd2a409e9b7758df0
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
