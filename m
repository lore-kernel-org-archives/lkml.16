Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571332ED14D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175584; cv=none; b=RyNhcgM0MueWoGA1cP8NmkiYV2SXq3ozVfB4shMTv425hMphmqhDeu9Ojk4RGiumeiYAGqLI9mb9wMbyw53na7QD1H0SdmmswZGbA+vbZd8Pu77A7ai8oLxuVb/DV9XyljfCFbnlTZR07W3ZEfEm34lQDZP8WX8iZTTnG08FW30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175584; c=relaxed/simple;
	bh=CegLsk2HTM1Hl73lhn5TKBE5LOOF2SGiJXvYLKeQAxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mk/LmjBlRAPjDJxUWCSueGSuxScKHMmDxD8Jw/FRyFJ5hW/Y9Kx5helVZhy4RiNrL6twtydPiwRqV31hpo8frIDiU4Ih0lcscskS3AYSeSgDpulAxYfzScwP/EnnINaVNLl8JQYkj7iLARENeKB9DARz/5Lsjc8/g1JzHBOHo4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cen/5uIb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cen/5uIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4OJt/a44jwhdTN+yTSXPXvzY99d5n2WtYczgJuAvKg=;
	b=Cen/5uIbpm0j9dvEd4nQlsNp8SiafLLqUe1wTRs9lI+pCeGjM8JFcC1EtR81JDZgu+iVa+
	+gU99l7QktiH94NhJGpFF7PGmcwXp38HqwRo8G7TiNrgV8QIPnfF8DI7d8CHd4tPUvvnbH
	1lIeb7tshTxxGGf+wSB9dKFYnq5EdM8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-tBVrcv1lOMKgEi8f1NVZzg-1; Tue, 17 Jun 2025 11:52:58 -0400
X-MC-Unique: tBVrcv1lOMKgEi8f1NVZzg-1
X-Mimecast-MFC-AGG-ID: tBVrcv1lOMKgEi8f1NVZzg_1750175578
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so409612a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175578; x=1750780378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4OJt/a44jwhdTN+yTSXPXvzY99d5n2WtYczgJuAvKg=;
        b=MdEMeRFIs6RCwfq28sVS9Q4ZMTfrtgk/pouRi5H3s925J0lwr0Z6b3OG448g33Ugfk
         +fLWrg1TcFKsQMLNC4uzihnKEip0XaQOQrm7VGE5fXbvKSfdQYOTTpAK0mioF1jPO2Dn
         BA2aOszeiVtiTVXH6SCIxA5+I7Z+gvN6M+rn5FKvYOcUnUHEGodQJvtrGlOXs+mo01UF
         aBvUyZAHvZsFsKWAbN4zSeb1/Loa8jrqoSxDdXsWGC6+IfbM7D9WejiDJfTuTp4g+Sax
         zihPFuTaGU2u0NJqAI79UJZGGT0JGa4pEkvbESFi6t7bp/UuvUC279tS/6LxmfRbIPoi
         lEEg==
X-Forwarded-Encrypted: i=1; AJvYcCWti3nLxBFtEiOcRdaryHKoEDdok/wM9q/+Z/qP1JVeHqRpvnAlIon6Hg1xWAU1mdsR6IHRlSwExqH5QiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4QWn7UW6wPt9djd3TVrWil57I85+4OixJ2tlNSZaxDYCry/T
	+IPgTgmgDB8CvQXshXlCsMQTKBOdBAtE2g0tj0m7PMm/9YDbnDUzlI+93NwsdrdqR8ocmAcbeAV
	n7qTTIQiUDUsaQVT7ZCWEbs7H5Ok66wwpOGKdFEhD8EallehTZz+ziRqhNmQvmlGakA==
X-Gm-Gg: ASbGncs7Yds0ePvSWOWO/JMLthbsF87yLdoNNwnHUkfyiSz+L1h9IozJVyBEILmkkyS
	OgAHpyGLuhfhJdBPgbE4ERwVnE6SsrzjesZoAfJlTJ5y91X/XSN2dwoag+X48TO1+NqK9djzVCu
	2kaHWBpeqcNJiQa1u9eSmnFYMzwRaYZm9fYYo/wrJLzOWrIafgMl4C8E5CiJDZ0r+KFgbGJhWck
	4jRLBmp2OfAoYxtNBKCH8w3Ru9Vz8FWysXakKtrRAzoB13CNkvojqZVlv2PAhQAEcJ+ibvGn1GZ
	joalgZ1lTVkhBA==
X-Received: by 2002:a05:6a20:d04c:b0:215:e818:9fda with SMTP id adf61e73a8af0-21fbd67f904mr20435851637.27.1750175577739;
        Tue, 17 Jun 2025 08:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj36Oe4A2jcNoqS2BQRql6Igh2aHBYLuNua+frzBld7sGbq1gUwnVFHIYvO1JZJWclqgsPDw==
X-Received: by 2002:a05:6a20:d04c:b0:215:e818:9fda with SMTP id adf61e73a8af0-21fbd67f904mr20435835637.27.1750175577393;
        Tue, 17 Jun 2025 08:52:57 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748a6b1d620sm6123165b3a.116.2025.06.17.08.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:52:56 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:52:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ujwal Kundur <ujwal.kundur@gmail.com>, shuah@kernel.org,
	jackmanb@google.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 1/1] selftests/mm/uffd: Refactor non-composite global
 vars into struct
Message-ID: <aFGPVPDKGLOIEucg@x1.local>
References: <20250501163827.2598-1-ujwal.kundur@gmail.com>
 <20250616100406.2853-1-ujwal.kundur@gmail.com>
 <20250616172618.0609127a8b1e406d4c228d24@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616172618.0609127a8b1e406d4c228d24@linux-foundation.org>

On Mon, Jun 16, 2025 at 05:26:18PM -0700, Andrew Morton wrote:
> On Mon, 16 Jun 2025 15:34:06 +0530 Ujwal Kundur <ujwal.kundur@gmail.com> wrote:
> 
> > Refactor macros and non-composite global variable definitions into a
> > struct that is defined at the start of a test and is passed around
> > instead of relying on global vars.
> 
> Well I guess that's nicer.
> 
> >  5 files changed, 616 insertions(+), 542 deletions(-)
> 
> It needs to be!
> 
> Thanks, I'll queue it for testing while Peter thinks about it :)

I didn't pay much attention on this one as I saw Brandan was actively
reviewing it, which was great.

This is definitely an improvement to the test.  Thanks both!

-- 
Peter Xu

