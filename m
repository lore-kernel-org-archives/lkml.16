Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB4A8C1E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684462; cv=none; b=OV0fkFT4jsIS9UHPUBNVdSft8utRns8/k9tuOJPZhSHfrXtyLlT9ObrC2fqxyTbY+dFt7jXrj46tchJRvG5uFrJqY+5ui5dlWkzgAcB3FAznW8g9gOtRbAJYPftnrYd3zyJOMWY8K2NFJ0Pw+PZjWkONXRU6dx1K55hKgaDXVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684462; c=relaxed/simple;
	bh=ozO5RMv5eUPn8jxY5pXkiQIfnbO8xu10dvO/77lVByw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O51Fkw7qoDPmJzmega63mKmMr67p5mgwTSm6Xa1AhniFC65gkylEaNXWxJDl0LzxK+fM4eDm8XpMRdrmYZZGA0j/NKqTBG+5r5Ukgi2YUocN+ERzR/pvLOo6otpq/9sprBfgYHgJPit3CjR7sraQL75MGVFyKXgmbEVi/ytZBlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U5pzhAA9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U5pzhAA9"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736aaeed234so597991b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 23:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746684460; x=1747289260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gD6p3LDYmN4HnSqNAjc/2GGWmyPj6vrCx2RAEa4xFwU=;
        b=U5pzhAA9Y8j6Ptq3DyuwHzwmjZJnSlCH5PNS7ZqtWQEB46Dqnu7BqOYgAwBexbWL+6
         HqSyd1eDiO1f0IjXVgjYABUeglMYF8P+ICAZi/9UlM3/Bco/TqUh6/R36mMdKgdXyF54
         44qvEm0fUkU6H6uG1KUkIL4k4E6Gm9RVi9ZDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746684460; x=1747289260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD6p3LDYmN4HnSqNAjc/2GGWmyPj6vrCx2RAEa4xFwU=;
        b=NWABASllIPcqGPOvEuHMTUKHqu6rumzGaiP3t/sXzo37olvd3ifdOvjxsGqiszajK0
         O4rzmsOW8aZS45ArIMYCD+oZ6HHmNuT764PIZHc2RGIe70dpD5riT41JZu7AGP+Zh2PX
         xhkQQpxXCQal0A4HoCyJjGFA7pCNts+OcP13CIAvBHWgr5oDAi2GzCcU3oAfq6SJvkXm
         8MDERT8KdaVCTPlV3TJyYzfP1hBc0NRap8q3zwMfgfovWA4QTZ2cTUEBszJSrnvHGdKW
         OzlkfLaPfOI/TArcxzVXly/l3Yd9Ltk+55aY0tWMByrFtx31aY50/sJ1EntIHNXmNmaB
         tgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+3isF5amV/yboRvEgykz7vMrziM9TJj5ibuorYiBx2rRNwBzIktPEVnnU0xxYhy2XGFiaHOTmRDxN/kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsjVhDolchyypG0TCMM52Wim5IS4tDcJw2i1a2uKF9zV2vnFyx
	W8XrO16RNliMtTR8jXRN7MCiWVWa5PZOvuTjU+1yoZNQX/zaIuz7At/esG0ikA==
X-Gm-Gg: ASbGncuXZ8moLm5nOmd5ETO+PfKhIIH4HvEJHLTIfwBVXOZkIOY+SsfW8lD94L/cxjy
	7ENLq4F59mFqHKsNztyDgDdY0IeInQrAUA7jIWTTjjKoncxnGqpRG7AjIVLjV/evJyu2LWfj2sF
	9xAi13qFBmuSa3l/aycbB/sV71UmKWHdjpFREMIHk2t4vqM1nF0Beb5YcOvJ+gQ4w79E0JkRR90
	6TT3QgPgmDLeBf6N1wPmf929FfrSraNY3AcKk7yv1Vw1z4O/7TakUIR2XHdCT3pPclA2so2+jt9
	+v6iNkOMU3Af712QZslNkTVMGtvwZ+M1joyFHxgM7LIMC7Tel5w4lic=
X-Google-Smtp-Source: AGHT+IGQV8UCjLjaLkpFFN9jqJEmjl4XPsqvizG2tfcBx2LWo18DpGyLnM0uzIGQx5hGiMTU/EEK6w==
X-Received: by 2002:a05:6a20:ce46:b0:1f5:884a:7549 with SMTP id adf61e73a8af0-2159b08aca6mr2899868637.41.1746684460685;
        Wed, 07 May 2025 23:07:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c794:38be:3be8:4c26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b20010bdec2sm297173a12.52.2025.05.07.23.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:07:40 -0700 (PDT)
Date: Thu, 8 May 2025 15:07:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Uladzislau Rezki <urezki@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>, 
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <iituwnw72ia3nabbstaaldmnk4gnm3bqzanzlfli5hdpavzp4i@zgyl23wbmdr5>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
 <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
 <aBseynlpPBIIvlPY@pc636>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBseynlpPBIIvlPY@pc636>

On (25/05/07 10:50), Uladzislau Rezki wrote:
> On Wed, May 07, 2025 at 03:08:08PM +0900, Sergey Senozhatsky wrote:
> > On (25/05/07 14:57), Sergey Senozhatsky wrote:
> > > On (25/05/06 13:13), Yosry Ahmed wrote:
> > > > If we can use vmalloc for zblock, then we can probably also use vmalloc
> > > > in zsmalloc and get rid of the chaining logic completely. This would
> > > > make zsmalloc simpler and closer to zblock in that regard.
> > > > 
> > > > Sergey, WDYT?
> > > 
> > > This sounds interesting.  We might get rid of lots of memcpy()
> > > in object read/write paths, and so on.  I don't know if 0-order
> > > chaining was the only option for zsmalloc, or just happened to
> > > be the first one.
> > 
> > I assume we might have problems with zspage release path.  vfree()
> > should break .swap_slot_free_notify, as far as I can see.
> > .swap_slot_free_notify is called under swap-cluster spin-lock,
> > so if we free the last object in the zspage we cannot immediately
> > free that zspage, because vfree() might_sleep().
> > 
> you can use vfree_atomic(), it can be collected in any atomic but
> no in NMI.

Indeed, thanks.

A bigger problem than zspage release path is loosing GFP_MOVABLE,
I suspect.
