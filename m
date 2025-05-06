Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3701F2D47AF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 04:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746505566; cv=none; b=gyle6UD3Xk1H7gujSPdETtWbARQQy/vyEP1owwaDR1dnBUXSqHthPn0sEzKxwWAUoW6CXM3B4B7b2UmN1d1gP1K8s8E5QJUT8DqHJUKEnZvb99k8fVBHMmopk8ObP8+qY9PSFUW9pmKqXWOH4yyy7jEumTZoezkuXDKRQzxGqxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746505566; c=relaxed/simple;
	bh=TccdsHTZ4zEQ0BZo6VZ3JHzZ41BfCgq+4cveb1ajcCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDuWNgazpnhRoDmFnaX533jww0JmlgxWkh3CCTfeEhNfjIydfbMAW8RLP9XY7dKQltUvlA7sGhauOAIXTbyjxBInGwMv8snvSUkHLtCJFH+BQ6up8Gp0FFbAf6Prs3aqf0dAdi821m2RuczE6VfK9h/N3PADTmfORAjUas80vR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xltf+vph; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xltf+vph"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7403f3ece96so6852493b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 21:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746505563; x=1747110363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lpTvVcHQ5NB5y7+VuyI90vpjgAMkQ7kpY0hgN5edgAQ=;
        b=Xltf+vphv0gOIcjcd2mLmcQ86u9Fc6vsEsGtar/Jc9kKCI4JIr6YO5G1OK9Jy9DIaO
         8Lp1IxaK4vvs4k7YroILo/29FZlkubBF4mVoXHRcXBhPCQ4JYptsNtbSEjx1LOsg54Dm
         cK64NPPm3ZGRuTAKR+fGCYKl/31xl/TqMvDIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746505563; x=1747110363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpTvVcHQ5NB5y7+VuyI90vpjgAMkQ7kpY0hgN5edgAQ=;
        b=KEW5uBkUtEnqdNLuU+e4Hi6HhbON+dwQiDfDpI2gqmjHqFCzwSxxGJKx0ElfFsdVoM
         XvaixJQA9gKNRvcuGQLSSxlAbNOMPkap+O7jMfwOjDpIthRTgbmfnriUhH6VzR4LMe7Z
         ciWKI17ccwfpkoFjntTZeqtPCkURfmqE6dNVJSCkfyyfIwHFOWQ2mx8NIK+DmjIRka++
         Jjw4VHZTQdrEtXHbN43s+J7ZY1bwwGQ82ckHfaBFZ4NUYiVWA6he0M/kqHBsljP7G4YY
         Q5W7c+C9NO8NpBa/E3j4p+EWoKRvNneLoRb39T1ttbOwS9Kvzd57FHsUzkewaLC3iQvl
         sXkg==
X-Forwarded-Encrypted: i=1; AJvYcCW5//fqaKEeF4U9AeaNETCHNsJeAxg+wnIV3jpcWGyitQGHjAvbjLU5mo19uzDOSvFFNv2b7RyJQmYom44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu9gvzosJoHl8ZislWyGMitICAqIanqKphpisyU3fyiAjvXxmF
	2WTdalweu9t/T9I8RMAouBLopmrrlY2ZWyert71HmeaqWLRN17CESkVbk25JCg==
X-Gm-Gg: ASbGncvtQjaNibBLgxhNwPQpxrZ5CiEHKfkmBZwt/KC+phtZngcnzEED8pWlIaAMz3a
	OqMIWbkO5xi1JohuK0tfJVbeUySiNyCW/hS55ls7iGWEV64RIPUS5KPanjm+9txyOAhBFVxuIAV
	i1GSpWb9/6v6ttDEkiMkZXoxbyBh63pCpBZJeGLrTdscoqaLrLqkD3mjpyqKQV61sLvxGE5/8Xi
	yW4px9tf07eGcRnCaVgHnyPd4dTNe5fcbwd6zj4qMrHIewxX9rhAyEcdoQc2yt7SOK3d7+lVo9A
	wCrDhau6Tzk4sWV4IXkCxERvbaL2JVk2d75YJg5oiNb0xv6cEBy+MQ==
X-Google-Smtp-Source: AGHT+IH2lUDpOcji/4HaHFx3QdH6baMYj7NqZym6Fql1fkgTO/Dhci0Df2ouxUuviW5c8PoLDQ9qGQ==
X-Received: by 2002:a05:6a00:8d82:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-74091acd3f4mr2575582b3a.24.1746505563516;
        Mon, 05 May 2025 21:26:03 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:761:97e0:917d:ad1e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020de2sm8063478b3a.103.2025.05.05.21.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:26:03 -0700 (PDT)
Date: Tue, 6 May 2025 13:25:58 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Igor Belousov <igor.b@beldev.am>, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] zsmalloc: don't underflow size calculation in
 zs_obj_write()
Message-ID: <rp5x24bqoaiopfnbjee2f3n7nrg4vh6mt2j4ewutjj42n6dmn7@exl7zdf7pvwx>
References: <20250504110650.2783619-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504110650.2783619-1-senozhatsky@chromium.org>

On (25/05/04 20:00), Sergey Senozhatsky wrote:
> Do not mix class->size and object size during offsets/sizes
> calculation in zs_obj_write().  Size classes can merge into
> clusters, based on objects-per-zspage and pages-per-zspage
> characteristics, so some size classes can store objects
> smaller than class->size.  This becomes problematic when
> object size is much smaller than class->size - we can determine
> that object spans two physical pages, because we use a larger
> class->size for this, while the actual object is much smaller
> and fits one physical page, so there is nothing to write to
> the second page and memcpy() size calculation underflows.
> 
> We always know the exact size in bytes of the object
> that we are about to write (store), so use it instead of
> class->size.

I think it's

Fixes: 44f76413496e ("zsmalloc: introduce new object mapping API")
