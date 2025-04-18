Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E470520B213
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990030; cv=none; b=oAcycGAQzLLrIvyilJR3CCXhHpvmRocuwgeCmAUAJxiLX9/mIzf/hOnBiOfVTbc4yGWtx8VxWdO2hd+9KvhfmHVtCKn72QqMlZqH5XRoovRcfxNiio3SG0sL6cgePJxLK4YipUEHn+qAmGM4NcoGw61pQhsda3YMJ0K1TFRrdSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990030; c=relaxed/simple;
	bh=1y2iPseqL2w86pZS2dL9URh+00OkH9KHtKB0vDKnJ98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3TJUTs3iCTkvkrDz4weHz1xQ1k11q8g4DG0ifddVdKxOLw35fb8qGk5woa1G9imxzjI3eFXU0nfw/UmPrRnz9FKvoatURaralfM+epLvu4IqReVAWxWu8QJx5wmdO+AcHRF4Op+y5mQ8rJPPaqnaDl6OYr/6Cys2OOnbETuol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvsGrvfV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvsGrvfV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224191d92e4so22567815ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990028; x=1745594828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xsrPSUNVhs8rFdAYEhSxzuxV/b3f8O8Pmn1WUkmnoGs=;
        b=HvsGrvfVNn5pVW9AkjGVqQ5PTOC1fgdyYpUvdgqLy6kLKJHeEdhyvi9BwBzYF47zoD
         Su6NxxdP5Aqnzh2esLJKeGWDL+5hxkuywgTCaB11kTvCSSmatvv5VZW4wqGE3931REcd
         3/tL6dSsL/Y+LHuokqkT/GUKz7NddWql+Em0wxLdX/FoZmzQ7jjQT+z9VTFdPoB7nhg+
         2r7TW1Lay67mu2TvKfMldv5lb9gux7beVtyRnC4+KvD7U/Hkc08wkb8EzbujuMsSZ6h2
         vSPhJsb8yG2DslH5WSHlWk6NWMjOqYkHofigE0N/9Nv/VAQF+vaxOxLj39u0tTfzuWtU
         FnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990028; x=1745594828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsrPSUNVhs8rFdAYEhSxzuxV/b3f8O8Pmn1WUkmnoGs=;
        b=dNgZdf84z/MN2mvwiU6w2u1t3zgmJgi8sBQ4inLcQfKntEVXf3cWhUs2RkT5FNLw+u
         /bacdKwOXC3yHJwtLbcjfIoLn4VhsXziokhurMEb0cU8iY6nLmBuA/Z+cOjH78dRq+RK
         yJalVQOX2rOqBhTkSB4/29m6LvMdbBRubSbagy9o57xV0tFch/Uua8nOzNEISwO4HeFZ
         4EkKoEbEKFQ5GI7afH/DHPhzH4km9O90+rzHKW23V75MIss34+OcDEMUh2Yt2eGJe0U+
         DmqGECbWxfn/HaCwFqldkTwGUb9sSKXfFcteXSGUbsk2/yUA9iSs3vEyDD1cdoHJ+Jt3
         bYMw==
X-Gm-Message-State: AOJu0Yx6As3L9nx0+tKyUEfS8p+v/wxPhZZHcmw8l2fQ9jdJ1nHoxTWx
	sYTpQoPECz4AYScxBYMdMAoXy+qMTx9ObuEZasYaiwIzylZSJiHHC09/sEpn
X-Gm-Gg: ASbGncu0749LnLJ0R/jBJDc42aG7IIujc/6UzqLAEMNr11Ndz+NmeeQAzoZ8FBt2V7e
	7dmcpo+bWsByV764onXuIJ/TRuoRANwp3yhUF8hwwvITjxBjmITEBliUXvDtQzS0C7p7hraAvuf
	01Qlzp5mPAoDyiqzN7P6G+kBnShazYGkUf1OiOY1peiAi/chxe62P/hNhfklSU/ijmKdCzV+A1X
	2Nj10U18mEPvRCPma1vhWSu+orJO3WzuNn2VzOlOwMYVWVIG0Zv2tJbUt17vqNhQJCDNACe+Mc3
	uSMM/o8muzbn3L4GLs6Y4nYsXLSNqLZuc1fFLwNk
X-Google-Smtp-Source: AGHT+IFPpY3AqHEGN+2bikmaarSJdAe7G4sJHwQs1lzBSoepGKAswgBppOLcaCIGETxxligMJ8lpxA==
X-Received: by 2002:a17:903:46c8:b0:224:584:6eef with SMTP id d9443c01a7336-22c53606ee5mr52825455ad.41.1744990028178;
        Fri, 18 Apr 2025 08:27:08 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf30f3sm18295105ad.59.2025.04.18.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:27:07 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:27:03 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v3 0/2] bitmap-str: A couple of cleanups
Message-ID: <aAJvHI-iTejAImul@yury>
References: <20250417161858.611211-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417161858.611211-1-andriy.shevchenko@linux.intel.com>

On Thu, Apr 17, 2025 at 07:17:14PM +0300, Andy Shevchenko wrote:
> A couple of simple cleanups to the bitmap-str.h.

Applied, thanks!

Thanks,
Yury
 
> In v3:
> - elaborated even more what is missing and why it's good to have (Yury)
> 
> In v2:
> - filled the commit messages (Yury)
> 
> Andy Shevchenko (2):
>   bitmap-str: Get rid of 'extern' for function prototypes
>   bitmap-str: Add missing header(s)
> 
>  include/linux/bitmap-str.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> -- 
> 2.47.2
