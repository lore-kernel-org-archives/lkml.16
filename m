Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3DD1D5151
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581910; cv=none; b=FWCqpwW0oVWj51Tv9tf8nEd47jYuWK5G731wvbCDCZnPeM7/mmz3YzSYKUSX843NGczbaSCqUpoIFTCV6rZCYTKOuC9phoZuPsiRNSBysqLL3LNrirjCpZeD+Dl4JPzYrj0kvt5m/6qM9MPYCI/uXTLa+snRX5j48ogR02K/i3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581910; c=relaxed/simple;
	bh=8e67ubdqmXXBC04FIgzHLvstXdZ6qmZT0OFP6KZR0u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxHuF150Qtttx4L7DiibU8+jTs1lBo1iqhiEjF7mNVYnm659ufVbRElmCWevjcHSj/cD1Ef6bYstwpo7dThaIb56zWRy59uUDLTMbu5wxuQYgXL0I3fYCkhbl+ABo4PQ7WodcvCRVR60CW1UwAXYqnD6pAKuIlHWACBdWTZynVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=A5ho/n3g; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="A5ho/n3g"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-477282401b3so66180581cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1743581906; x=1744186706; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8e67ubdqmXXBC04FIgzHLvstXdZ6qmZT0OFP6KZR0u0=;
        b=A5ho/n3gHd2rV4p7XfzB5VGcOp4GNex9ukg+juOtFE8MifTGOjlOtK3kD0gI6ukfk6
         nuCaVVobh4+IcK4YaDbgDfMLjyCmY3JWFtp2+097z5QUGMWVhShs8dXwaZ0jcW0+F0r1
         FIRlymj/RhypJ6TFwOCSHaXZqBeL0CzzrMvfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581906; x=1744186706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8e67ubdqmXXBC04FIgzHLvstXdZ6qmZT0OFP6KZR0u0=;
        b=eXP4oBRkSCOKpzRgHEopQhM6uKTqAYLibxNVVCg7j5KdZjJa2ialoc87gtIl8vk/rl
         rHDs8zC9WxYMoac377IQsUN5RRmHkTrGoyHtAAisefjRgckqaPJ95Y9F1I5RQ5LzHjm3
         MjvHG3qNtUDYAw9L9wnEkwzLGDjfMKPxJB0yUdxlvt+KiNJMMiyQLazGHJEkqL/EoAUX
         IU5w2Bj6UI2U3A+7dMK6KAczsBNUOgNlbc+5lHn+J2bSLL0zmumbsY7D7F+YqrW0T1lS
         qh3pUTk3rLnS0UOudNKliSWWYVRvorEL0PEtS6GpNOsoDMwoCoNb1uIo/dKqIx/oFp9b
         3uOw==
X-Forwarded-Encrypted: i=1; AJvYcCVHsI2kU/P+Tgrhwslk0Cfeh54Qedm5WPok3R18nuR9Dbl/MlMGq5Uw9vUrmA4OdwRDS0iGDsQXsPYKNOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZKh/P9ALjHd7H9aF57MwLYkoPSI8mZ6FmSZ+Qs7Rr3GRAFhhV
	3OrccZ3vNZlWyQBg6D1tuwGt72C2nSUv19/kwmO9rxYAUjm7cKtp1gZJXugaiIa2cNTNv3CpCMo
	ajG5YM7H1aRmsIBTwCwnV0IAHo2iNPtRI02WUbQ==
X-Gm-Gg: ASbGncuCuKM2kho2AyLPvaRh66nQrqCePRJsQ1TSo2jLTvknw/U/fVQrFF+VDp4RGsS
	3RMHKQ0dfj5oQz87M0TL/z5VbwO2bg22WkV1yYLT9EItyYcKhCVKmhlkHIQxBp5Dzkt3iTPicJR
	8fLFZiFVQ/OOwamxqwNnX7kMhodA==
X-Google-Smtp-Source: AGHT+IGGKKwBKL/VRF9cyKMWEhNhYseEiH+wMiAFaohjj/Y3WhTHu7xHwzMyIT9ilqyaBMYQYXa+ng7b4i5Y46INwpc=
X-Received: by 2002:a05:622a:1a95:b0:476:7018:9ae4 with SMTP id
 d75a77b69052e-47909f81afcmr19689571cf.16.1743581906347; Wed, 02 Apr 2025
 01:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314221701.12509-1-jaco@uls.co.za> <20250401142831.25699-1-jaco@uls.co.za>
 <20250401142831.25699-3-jaco@uls.co.za> <CAJfpegtOGWz_r=7dbQiCh2wqjKh59BqzqJ0ruhtYtsYBB+GG2Q@mail.gmail.com>
 <19df312f-06a2-4e71-960a-32bc952b0ed2@uls.co.za> <CAJfpegseKMRLpu3-yS6PeU2aTmh_qKyAvJUWud_SLz1aCHY_tw@mail.gmail.com>
 <3f71532b-4fed-458a-a951-f631155c0107@uls.co.za>
In-Reply-To: <3f71532b-4fed-458a-a951-f631155c0107@uls.co.za>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 2 Apr 2025 10:18:15 +0200
X-Gm-Features: AQ5f1JoWWGW4t6Lowi9LpB5qejIwEk88bDTMV0GNUyEy49v_ytvZJkDPy_jQANE
Message-ID: <CAJfpegtutvpYYzkW91SscwULcLt_xHeqCGLPmUHKAjozPAQQ8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: Adjust readdir() buffer to requesting buffer size.
To: Jaco Kroon <jaco@uls.co.za>
Cc: bernd.schubert@fastmail.fm, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr, 
	joannelkoong@gmail.com, rdunlap@infradead.org, trapexit@spawn.link, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 09:55, Jaco Kroon <jaco@uls.co.za> wrote:
>
> Hi,
>
> I can definitely build on that, thank you.
>
> What's the advantage of kvmalloc over folio's here, why should it be
> preferred?

It offers the best of both worlds: first tries plain malloc (which
just does a folio alloc internally for size > PAGE_SIZE) and if that
fails, falls back to vmalloc, which should always succeed since it
uses order 0 pages.

This saves the trouble of iterating the folio alloc until it succeeds,
which is both undeterministic and complex, neither of which is
desirable.

Thanks,
Miklos
