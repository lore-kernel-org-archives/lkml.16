Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C72581
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 03:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743652543; cv=none; b=tPdMYeg8sifZt386VlX+PeCI03gXd/Ynm45ElZ8cj4hJk7ZGXf+1gVg29NUitE8XWTIOLSzBpYL7noTOyXN5s6DqX9Euht54Fw+t0LyUeefK4p3t7WphRu9gyRk95iSmFFwFOngxKozbq3ABmLWM4/IiYkXh7b19c6JedAkYmZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743652543; c=relaxed/simple;
	bh=FtGyWJbiMoa+plp3/UpFRv0ViOQzewyO1FWj7JSXa3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWTH+7YOzRaZi08CZHWUqOIDMu9U+l8ialeTTMCBdtP8AZaxMx+l01uBEqb2m4H0Q+DvKaJjssLCxUgBK1MU6GV1uYukI33uyCoCBtzi8x4OYv54xX9k6z/Jnx1SzJ6W6PuVy6erjQDnrZeAWRqdGeK98W+rkzJCflI+ZeQCFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmkyUITS; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmkyUITS"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7398d65476eso330523b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 20:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743652541; x=1744257341; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnm05LZuH611EkrlJvpklr8mHTu9KPvCkeLM7JCWaWQ=;
        b=LmkyUITS+ZI7eK2eRhizsts/5oqp9cTsrVV4rwi7+S5Mq8paq1zI6Z5YnVi+pwiqcb
         u6UFzMAGWcP7fQPqQO4FjEaxYpScwjLbRqq2/nsuHfwfLETYoAC/HVjQz3QKyBWG/iA9
         aiCSsaSp18JptJvwesxx5KtYzPwDooYe6fK6odNW8Ob3hV+aNTiHBOutSC/z6m0UXqga
         vego2gi9Y4Dj2izGd3jHzzL7Ibqlt8Xfvedx3Hw+tgo2XEQZwjlVtbt2qkGzvhipXzsg
         zhYe5kZqAaKPua73oVuK3I5AfCUC2TAPRCuQC+f1hR0/NlRLNibSP5UK8xnwYpQ895S9
         IgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743652541; x=1744257341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnm05LZuH611EkrlJvpklr8mHTu9KPvCkeLM7JCWaWQ=;
        b=VAiHti/wluHIzVrb5Viq4Es6SFFfJqWVzurBix7/S3cVPcxDt3j5cVI0DevuOEuaKY
         QAmRxdyE/LoJc5Jkd+R6j+Q5cCjoCRXepM4Z02R8lBQ9aabdXBFJc3g+FSDQ63T3uK6f
         EH6QLgMz8w7rFh8GF5qicJMyPhO58muHG5wkOtImyoV7giVcHMfFL4QVUJhQKRWEp2p1
         YDnAH717saJcAo080NS5pokQd89+6DdWCNM61kZFxuc7hUPyYjwI8n0gSKHH7j6w5Q1y
         pRchk5lheySLolxKJ475EdpnjYpc/YtOWO+/YPAkYpLLO3NnJw1W0+JBSAj5OiRZOQNZ
         K6kA==
X-Forwarded-Encrypted: i=1; AJvYcCVANmjB2AnxqgtejDVaq88mThjmyZcdfN8lKfHW2Q29UG+uMRwtD+9Rhv8Khn/g7bJwSvVu6Rqc+P4Q1Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx49Ji/R3aT9BBs1dfvR/oCDVX/4PSQ1oV/K8GA3vtFhIw/UmFg
	+X4cz2er4hcs0v3/Oao0/ySHXriMh2Fuau1h05B9+BgAZG0MkmTv
X-Gm-Gg: ASbGnct4KQ9qW1il6QYEDHel/qCGYiwisDA0DeU02eRQsds/Q5z5qXMGSeJlR1BJdg0
	58291r1/DvfNtRdLZ+fX0TXmvHMjAQHX7pSbDBEPdq0SxXmqg2D9vjTkY7qivR3/aAM3XwHVcem
	gBUPLpx1y9y33opfS+hI8aBWjrUcSaYb5/9PMKQ8BDkP79j0MhTPRRp/EoNmEi8/3vGyKLUTa/w
	LPaOFMW+5EPpKZvxfANvurS7um8Q/Qu7uKOOqtQQmlAvvRSAnm8u8HxEBjoG1jw+SfYUBpF0n4M
	DiF4ubhD16uSCMq8poVijPBbM8iVzU2NKiW5A2seBd24h7pZPctCC+AWcn3o0E1idaBb4mYFPVR
	Y
X-Google-Smtp-Source: AGHT+IH8j08BYrvuBj5K8jf301fuevctg92TJ2z4hWrPiNQj1/tkgwsx7przf7EmkNTKfAJAwn5FIQ==
X-Received: by 2002:a05:6a00:8213:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-739d6370b90mr2648689b3a.5.1743652540727;
        Wed, 02 Apr 2025 20:55:40 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea0985sm382195b3a.104.2025.04.02.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 20:55:40 -0700 (PDT)
Date: Wed, 2 Apr 2025 20:55:37 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Markus.Elfring@web.de, Ye Liu <liuye@kylinos.cn>,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
Message-ID: <Z-4GuZZ_BjFNm9Gq@fedora>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
 <Z-q71LlcCQ5I-2D-@casper.infradead.org>
 <6cd78595-f9d3-4f26-8ca3-d1a0bf4e8dff@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cd78595-f9d3-4f26-8ca3-d1a0bf4e8dff@linux.dev>

On Wed, Apr 02, 2025 at 10:49:17AM +0800, Ye Liu wrote:
> 
> 在 2025/3/31 23:59, Matthew Wilcox 写道:
> > On Mon, Mar 31, 2025 at 08:08:01PM +0800, Ye Liu wrote:
> >> 在 2025/3/28 22:29, Matthew Wilcox 写道:
> >>> On Fri, Mar 28, 2025 at 09:47:57AM +0800, Ye Liu wrote:
> >>>> Consolidate the handling of unlikely conditions in the 
> >>>> page_expected_state() function to reduce code duplication and improve 
> >>>> readability.
> >>> I don't think this is an equivalent transformation.
> >> Could you explain it in detail?
> > page_expected_state() is called both at free and alloc.  I think
> > the correct behaviour on encountering a HWPOISON page should be
> > different at alloc and free, don't you?
> In the alloc process, this patch does not modify the code behavior.
> Regarding the free process, the if (unlikely(PageHWPoison(page)) && !order)
> code handles the case where order is 0. When order is not 0, it does not
> matter if __ClearPageBuddy is used to process the last page of the compound
> page, because page->flags &= ~PAGE_FLAGS_CHECK_AT_PREP; will also clear it.
> Is that right?                                                             

I believe a page's "Buddy" flag is stored in page->type, so maybe this
won't do what you expect?
