Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50BE2DF3CA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750167776; cv=none; b=ONRSHmmKQjk7fi55HWeadWnIt2DiP3cfhQwCngWOjAKtoWvm2A/VpAh3mAGppmXr+pkI5gSIiq4KkotwmqhjUXOL812RWkOLygNbwdT51To6S2DXKNmGaQXL4AOwuuI5NWoF4Wi6xvZ+hSPJou5fqqe3qDeCu7vNfOvrCe+wR/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750167776; c=relaxed/simple;
	bh=cMxHivxmB+8Qj8vZ8+ux+Xy/UOyTCG9DUeFMW8rcqAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3lOGrObSYOPM/5PxnsQ+CzN0mWrma5M0MiF2tZ2UVRe2RW85+TF7qaE6xk7YSiEEA0FCioOFo9dPZh+AiaAK43oYh6reahTMgkpG25+tf31kH2yq06sBcETUnTiqP0LyJsnrt9xsWxwtGeEgb5c61WPw61xuPnedBPtGLJrrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TCyFz5TC; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TCyFz5TC"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fad79433bbso61017376d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750167773; x=1750772573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxBrg9yjhh0CNTc60c5POeHRluMG4w5cQfO2cpUAxgw=;
        b=TCyFz5TCxr+pgctd+76PT2t2s+tcrA5DEge5xmSvRuGcionl2pK0ZBLSglqWVUUVXM
         UbSyEICB1roLQWgzc9qSf1m0Py08QTCAI4YGrNjZ0z5GgIH9KUI798y1nIRsTzDXYM9g
         dm5qRUTwt8yfKe8VohL/s8lUbXWjwrqki5PDYIqfi72wUodGbLnF2KyAjOnUw2HVaDVF
         3u2F2R1NIVNZakHdnF4JCVU2qv1VCMed9Gjd6qmw+COhCtzvsMPBM6W5mkhpd0cNhb74
         dApGk56UbvpgwjFlYnIPA9a9EiBWvMs69+P4D9798lOuWNeqeZUUpA8r2QED3wa9V3YE
         YRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750167773; x=1750772573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxBrg9yjhh0CNTc60c5POeHRluMG4w5cQfO2cpUAxgw=;
        b=kV9JQeDWQqoOr9lkfshGP21xGQHuOF/JlJ1Jm71M6umxGRsTtbYxEBvEndhNH1Iok6
         KB4YPXf94CaiYIdRD0XH3MrR8VIRWc8jtqeyePhSjdNuxlWbyf+f704LoTq1mQ6tV8sg
         aKSByXYUrz5rt2MZTFniuxg42S4s7ECz6/flgbHNrqbY01HAfr4RUcim6b0SRFN8nc+F
         xBULGwiIoPNL+TPlad2KZzHqaUgU5ghFOmpB5o4DZgh30Hf91zedOc0AUy4kXe/jIFQx
         +hXWx6ZrzNRd6EaL7c7pa2MJi6t7tnhH8Enz+c+A+TpsvWC2++NJIfd90UFP33SLw3Yl
         VzNw==
X-Forwarded-Encrypted: i=1; AJvYcCVRDe6nEKX20FnTyZrDhVaCD+7RMw/pJeDEsA91kQoRG4c4Ns2AruJxc1C3cng1OY31Z+tbAGrmOsAWGP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeCqeINjZvPu1bGmsoLbRkBv+N03f0AZ68zRDIX82eiEvGUEG3
	VivW97TVgU8Cy9Z14U52/is/unsnOGQxLpqAvxt0TPSeFovl9OmT/d44x7yzS5BxtXQ=
X-Gm-Gg: ASbGncsH3ixAQkpHKtZkt6CzMv5kmR2k1G6iA6AW7oCXvUmZtnl4bKMNr/zs/tdNBkr
	7bv2iJ4xEBlyI14Rj5d/jQtS0dU3uuvOrbvzzcwGWHM4eFqNKJwXwiKDcvEULhIqXC8ygY/1mVv
	CalB06KAl63jAyIDhFAYEIl3yZMjW6QY866nG6wJsF6dVQRVhV/JgX0lh0sPD+ynrpLOdhqvThl
	clxPD9/JWPIg9J7L0tlfKiz76WQA/2OUI1C/rM+ezZKh5l0gdPxrqlSYGmNWRvpu3efYK6rLpfI
	ErVQdgFyh0Ns5OxsISV+dbT6fGo965A49XM4kxYjIYRoVnOndMJP6BajujDGGQ6UrWF4Ln0L5Al
	wa6cr17QWWBztcyCBZ+a5tcM3j5eP8hbzCrpL6A==
X-Google-Smtp-Source: AGHT+IFEZ8nthWy5jI6l0U78X3cHgEw8q6a0mxGxgcwvH61XQjN0X9TnLrxMyQsbjOJQTgPXejMaNw==
X-Received: by 2002:a05:6214:252b:b0:6fa:cdc9:8b02 with SMTP id 6a1803df08f44-6fb477430a7mr207174626d6.16.1750167773087;
        Tue, 17 Jun 2025 06:42:53 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb57a66df2sm18569776d6.27.2025.06.17.06.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:42:52 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRWaR-00000006Usp-3gz8;
	Tue, 17 Jun 2025 10:42:51 -0300
Date: Tue, 17 Jun 2025 10:42:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: lizhe.67@bytedance.com
Cc: alex.williamson@redhat.com, akpm@linux-foundation.org, david@redhat.com,
	peterx@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Message-ID: <20250617134251.GA1376515@ziepe.ca>
References: <20250617041821.85555-1-lizhe.67@bytedance.com>
 <20250617041821.85555-3-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617041821.85555-3-lizhe.67@bytedance.com>

On Tue, Jun 17, 2025 at 12:18:20PM +0800, lizhe.67@bytedance.com wrote:

> @@ -360,12 +360,7 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
>  
>  	for (i = 0; i < npages; i += nr) {
>  		folio = gup_folio_range_next(page, npages, i, &nr);
> -		if (make_dirty && !folio_test_dirty(folio)) {
> -			folio_lock(folio);
> -			folio_mark_dirty(folio);
> -			folio_unlock(folio);
> -		}
> -		gup_put_folio(folio, nr, FOLL_PIN);
> +		unpin_user_folio_dirty_locked(folio, nr, make_dirty);
>  	}

I don't think we should call an exported function here - this is a
fast path for rdma and iommfd, I don't want to see it degrade to save
three duplicated lines :\

Make the new function an inline?
Duplicate the lines?

Jason
