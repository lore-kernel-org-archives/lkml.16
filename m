Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962B13D539
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746241848; cv=none; b=iu7mTOSaeDp+V6Q9I2E/P46RjMiedw5ZKCvlwYuduvlw2PtK3gI34RHT7HWjoA+zvqnLcwgVCf2YnKVLKAGDtop+yabaDZ7AsWC+fM0zDEXeMWRAP7Y/lPxwLawCQZwP9vIXF9XYRnzVxEeRYaf3VSwrOa2yIaM6uZMCJH2/zg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746241848; c=relaxed/simple;
	bh=EN0BXMQbblm2pZx5uSSWX3+lP5IdQKibivkWHlPTRMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDQkjc+BNXqWx/f3XBwYMhX06Ybb5Bl88KQXy+tTswtEM3oBZv+eUSzG7bEZHITFcHGzYwh4qVIs5fgbA0U6kpTxeslRE/M31fZlGgmtlUZSyek2AGsmCW7mFwthL9/+YDZVu1rQ5FCVThneT0clKaJyebY8at4b14Cw0nYfZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Is2afiz2; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Is2afiz2"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f861d16622so4433684a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 20:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746241844; x=1746846644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FdHHi6z+/1VZ4HLperPawMVsILx8Z+1OmejAc8QEltU=;
        b=Is2afiz2YtJ+3iiR0jR13B42JeyWWJGwcBoskgbuSPai1Nq9wDodKM7FQLcp8hlRG4
         CR7S2hx7DkMiQVLlhRPdMDNL202+FZ5Wg1t/QuT+D3r/Ff7OqotGyJ2mZpmdZqqq9ZAC
         UO3E9sX0Oq8QryttMncRyeP5HIQeoKhVVy/HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746241844; x=1746846644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdHHi6z+/1VZ4HLperPawMVsILx8Z+1OmejAc8QEltU=;
        b=e2cEytYv133et+aK2xfMmHqd32GtNJMFcMiHPPRAJL9QfJ77zJ+IPCv2oeEM4psZYz
         DbsJdxMBroAcg7/BR40ljm6EXzn1UOY3GIsnxkNg06PVy7pDtyanteWWbD42+5ZpkoEX
         Fx64gbWJ8I3RQ9B/LbxP/S6gGFHUfdVtBzUn8OSUsGxQvzeHkhiGEchdAabdWZ+vAho4
         jxQAdGPok9Q0QqyOx8hMx3bMc6au632k64W9MTkGAIPG81nViisDOCNmwK6Om5u4CYmj
         k/ZA7RX37f4l3P6OFLMa7ldPXa+fKktCcWgpwggh6DrHTxr5dXfVSJSy7EghH6CBqO/I
         wPJA==
X-Forwarded-Encrypted: i=1; AJvYcCV58zFZJXcsFv50gtxX6J25vT0px9CW0qd6ijAuQLasG7aGg2+5QOgDgyzZ6331yNoXegoNw04v6YiK6hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwH1/iWEvI1HpfwiMlsiA/8s4ADFRvujQF4KAsFsVp9xIxuxP6
	VRt3EKD8yYcav9KhhtPq29J96oTBcRE7wOJzsglSKjdAH55IbuInLbEQOy+CMINJ33CjUr95xaj
	/YKOg2A==
X-Gm-Gg: ASbGncu1XJPTD51byC1YAi142LGbVHcSapgXOMaNopRLJ2Wr9WqobuidsQzI0uyjEQY
	Op1cXgddZdXJ1ieXAlu99m+io/QLPHFFILtsyIEiQI903LySJIy/t+aySwhPg8ALR514H9lsIlm
	3xYe4GuXvIeUt2N+ze56fDHxrsjcVa+gQg/h5gu8gVzQj3kFc0FcFDdFQOMiB2FWGL8fUoTUkP8
	KmgldufVrC9KanJMghrkYcfKRrsRSh0mM1t5HJO8G2E0d34S/t75rjgVfylu53WYeG8H9g8njgW
	GjkLDO2wRrymz6HY1OqPT9tdvjhfL0Fjna6fofmcQO9qIA/PnIsXhTJ4h6gtWvahRo39MTbZbpN
	yTosB2n5qZH2GtlY=
X-Google-Smtp-Source: AGHT+IEBsYiGpKi7OcD/muJk8LmaOAak+eMP8iAPyPxtwQjm4jnT7aWz75NtBWuqm8oRc+ENxDmMnw==
X-Received: by 2002:a05:6402:13d0:b0:5f4:d0c3:4dd with SMTP id 4fb4d7f45d1cf-5fa77fd7135mr3853649a12.6.1746241844336;
        Fri, 02 May 2025 20:10:44 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faa2d87445sm756945a12.80.2025.05.02.20.10.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 20:10:43 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f861d16622so4433644a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 20:10:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQRdpJwJkvGMTlii8rcR/EN+XuzluAe/Iqjv4/gqgrR25tuArnB9DsCYXYazmK3/Dx9PcuYDWmXyewXk4=@vger.kernel.org
X-Received: by 2002:a05:6402:354d:b0:5f8:8d24:e344 with SMTP id
 4fb4d7f45d1cf-5fa78948c40mr3967759a12.31.1746241841468; Fri, 02 May 2025
 20:10:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502234818.1744432-1-dan.j.williams@intel.com>
 <CAHk-=wgRPDGvofj1PU=NemF6iFu308pFZ=w5P+sQyOMGd978fA@mail.gmail.com> <6815790674f6d_1d6a2949d@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <6815790674f6d_1d6a2949d@dwillia2-xfh.jf.intel.com.notmuch>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 May 2025 20:10:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgcd6BDN6=SHpf-=BdNfXab3J3p+vvAQAwfsfsemHh_gQ@mail.gmail.com>
X-Gm-Features: ATxdqUFjtXBFQdQ9SDPRybWcKcvnFj1aGEgrY4P5zeumMUtovlIsLe5tI7StKNc
Message-ID: <CAHk-=wgcd6BDN6=SHpf-=BdNfXab3J3p+vvAQAwfsfsemHh_gQ@mail.gmail.com>
Subject: Re: [RFC PATCH] cleanup: Introduce "acquire"/"drop" cleanup helpers
 for interruptible locks
To: Dan Williams <dan.j.williams@intel.com>
Cc: peterz@infradead.org, David Lechner <dlechner@baylibre.com>, 
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 May 2025 at 19:02, Dan Williams <dan.j.williams@intel.com> wrote:
>
> diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> index e3e851813c2a..cec9dfb22567 100644
> --- a/drivers/cxl/core/mbox.c
> +++ b/drivers/cxl/core/mbox.c
> @@ -1394,8 +1394,7 @@ int cxl_mem_get_poison(struct cxl_memdev *cxlmd, u64 offset, u64 len,
>         int nr_records = 0;
>         int rc;
>
> -       struct mutex *lock __drop(mutex_unlock) =
> -               mutex_intr_acquire(&mds->poison.lock);
> +       CLASS(mutex_intr_acquire, lock)(&mds->poison.lock);
>         if (IS_ERR(lock))
>                 return PTR_ERR(lock);

Ok, so this whole CLASS-based model looks much better to me and fixes
my concerns.

Let's see if somebody else hates it, but I think this might be viable.

That said, I have to admit that it still looks pretty odd, but it does
look like something people can get used to.

               Linus
