Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E681A28D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747279172; cv=none; b=Erh/kBzZj1IX4H/p9cyI6924AqOzN9BfgfO7FhNLX4wpKXZ5YioCsWhQQREl3STg7W4nmSVsLOKHR5rPdM1aAxF5h9kQW/QPFDzjm6XjdwFWnAy3fGUddeDuA/eqwaNdFMgpuPqderGPiBSl6M7ZU09ohLAZubasNmDGsvhyQDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747279172; c=relaxed/simple;
	bh=5falsyy2NSbhgTzsI7iw9JhcbxL9GA26schuAZMhDeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjuSOcZ/ii7j8Km7HiziJnQt0f5as9PQGpYM5LjmbYuKGhBDPP0sDzju0jcIb1zNWXuZqlP1QsU51xWYnx+5GPHxmeMppgB7sZ7PpkVC4SNVdYIcHhO502ESVwu0fCzcshcPy4zj6AlwYJsYJtxwVDO0zvWTP4SiScH5u7lIm04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fpVo0Iea; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fpVo0Iea"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c336fcdaaso4239945ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747279170; x=1747883970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NfMiph1RSohe0S02imOGJtgpN9S3gS74RbgzBkoa5vI=;
        b=fpVo0IeaKGPSAXVAJiQy0kRrVcYUoPdYmzb5KkSMIueLxsCdOfe+szPpQwplFQRodo
         JZU21zM/GjkUgYwcIJwNcbgbat0oPuRtAnuFRXXSWHiuJ9i/v5oTiC54UmY1Qm2G1ait
         AAo2peRBPyXO6j101PUfuO5+AmGfzPm8yK28w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747279170; x=1747883970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfMiph1RSohe0S02imOGJtgpN9S3gS74RbgzBkoa5vI=;
        b=GgD60+hxdbAhDr0WQfHtfbL+tG3jHHVN4cOtUKEA9iaD8lb47jltPkyU0TFjSi9Bl3
         y2n8VBTx2H7iOh1P7yqv570pnhsuQWYZLrKIg2xZVtoJ/Z7HhhvQzryx7/5hBTaMy++i
         Qhg3nZ0YWLftKaY0OiXnhnjuwgFaES0JT4JtSqtZi1+GnnvSVR07r03mn9qXS/XNVDux
         dMXXcWA1Xo/Sp6kYeRd0/1nsNimYpQnAE70aNQj+NIH/RbT0BH59zNbAZk0LTDjFvcYr
         ZNZ8IyUNHQ1k1a9z+0jDhtE9zfOgjdp+lohsCDvDXxJ7woQjq2cck2U3b7iRLvJ2r7sq
         by7A==
X-Forwarded-Encrypted: i=1; AJvYcCXbET2wdz6KRXLU41JsYgcWv/OMFAxh6eWuCxX+vfePDvgh+byA87OprJJkIVbVvsSYULqyWsuRJ1IN1tM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXP+99So+p7PonRzrzz5z5RrZeY9GyG/obEbjftS49to1afLmU
	lWdUCDAf7jQ3QVIaDSw8QaVw6/dyfAEQLbgDFoYxt0IHMmyWfkHu0FjFxQFTL2TpYxUwsQy+cn0
	=
X-Gm-Gg: ASbGncs5O/Dk36YjqOqlirHV7WtYjYYIoyJbg1cwvYICZyAe/osU3inmck2cxc3pkZ2
	7vn03yjuuMyQuFHWSzTctlzIgqafU/Og4E9baZ2BEwtJHf2mR3nYDN1IdDcrULAHpRuKIgK+kcL
	nmgjGxARiFFXWhPiqjuvoKIJQnMF7gzU55x9RHribcbUnYvgWNvmi0cba1cSf4bevT+i/r1PtK8
	PlXMpW8ex++8KjvK+smsdA7QuqypRFzEgU9Ev+CzMAxYjoszFBviHAmDYCxDVGOAGP4B/AC0cb5
	NDsIhisdWlEdnxsd56NAdjIGckkbfxpFZyKlZiVn+Ctk2xax77sqe+o=
X-Google-Smtp-Source: AGHT+IGvBDkjV4xRFAQFnM2nOHWCd9M5YhCblzNXzaPx80ufn2YWCWTUk/8FrScqDLEdru3/StH3lg==
X-Received: by 2002:a17:903:1c8:b0:215:b75f:a1cb with SMTP id d9443c01a7336-231980cb1admr80598445ad.9.1747279169920;
        Wed, 14 May 2025 20:19:29 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:291c:c511:a135:fe23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c01sm106523515ad.140.2025.05.14.20.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 20:19:29 -0700 (PDT)
Date: Thu, 15 May 2025 12:19:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Zaslonko Mikhail <zaslonko@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Heiko Carstens <hca@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 2/2] zram: support deflate-specific params
Message-ID: <2bnnkkwhqor73ls7dvsxlt57tp2u3xf2o27opkveuqwgh3xf2j@5kzgq4eej3cw>
References: <20250514024825.1745489-1-senozhatsky@chromium.org>
 <20250514024825.1745489-3-senozhatsky@chromium.org>
 <bec7391c-e40d-4633-a2d0-881eb6d18f19@linux.ibm.com>
 <ystv6cvrdllh64eqkislh47a3bnx5d2lk42ox4eiuuubioin6u@gmt5pwbkwiz3>
 <aCVcsB-M9cKdq8d4@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCVcsB-M9cKdq8d4@gondor.apana.org.au>

On (25/05/15 11:17), Herbert Xu wrote:
> On Thu, May 15, 2025 at 12:14:38PM +0900, Sergey Senozhatsky wrote:
> >
> > Yeah, so in zram we can use only raw deflate (we decompress only what we
> > have compressed earlier and the data never leaves the device.)  But in case
> > of Crypto API I actually don't know, added Herbert to the Cc.
> 
> The Crypto API has only ever used the raw deflate format.

OK, so do we want to limit user-space and permit only "raw deflate"
winbits values. that is only negative ones (either explicitly or
implicitly (by negating the value before zlib API calls))?
