Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A8BDDC1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050265; cv=none; b=Gn/icW88fFJA5sGhSwCoBfO+w4lftyy42qzYVF3Yf7NWWqoXCFuFxUwKp6r2ZPK0q7MJLn5yIpmM+HCv98SEnyXYtFQ9urU+wwLUg5t2u9J+5YQkLYDvG6+YYlU2cN/mQjH9RbgSu+5e5Efvye1NnoiPb9OCk9qGiKf3Dwsd5Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050265; c=relaxed/simple;
	bh=8Gq3Y/uvohcsvzwLNdUtL26ruFEWnJr+Etw5fxSYLMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1Cc2n083d6/kvOLI4KOuXCUh/yuSV52TUtIcbr2QI3FfHd8D/ADh3z1H4gWLKib2tYkmbaWq+Z8QghKTTNJrTTrADRVHNsLCBiIDqB5/h4LDAeQCJizNrTV3bQkkz3igsGZGAqhi0XkeChcNB9CSFolsy8cphTCJprIhcTvOw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EXeSszf/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EXeSszf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749050263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=17ROtvgVsdbIKrmBl8d/GBNPYAsLTBphWL9RC8WVDIU=;
	b=EXeSszf/Gsq3Cd6VqK943NILhWZPzNWtl2Xgj4zL/Dgf9qWHxtS3iiZ/DH3pRK0khR/mlb
	D5lSsWM5qMejO0QFVWcY4l8bTub+j7qc0IrQLB2bDvwmnYlzglO/vnve1XNgppqoIaqcCT
	y7QQ6HWIZOYSiIcUT7H0D2S9pjMyAhs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-Ksx956KVPSC0xyGSboyT2A-1; Wed, 04 Jun 2025 11:17:42 -0400
X-MC-Unique: Ksx956KVPSC0xyGSboyT2A-1
X-Mimecast-MFC-AGG-ID: Ksx956KVPSC0xyGSboyT2A_1749050261
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facd1cc1f8so15329086d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050261; x=1749655061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17ROtvgVsdbIKrmBl8d/GBNPYAsLTBphWL9RC8WVDIU=;
        b=J2QVdWLc/8FjKQJaTmrpmfgQ68HmsORiP6qpp4i2vMiS/UaYdKOYtn1AF2Qlp2Tsid
         i79sV+5c+4vV3xl0TMOXXpM0x5QtyGBoe1OinIFNaGlOZON6UwvRR9T3r1BO581GgAEJ
         E/YF1f96mM1EvOlkTSTZX87DQ5jKjJJsyt2ZqhcKFwNTg9arqTprVu8bzuimOj3JAxmb
         hwQacIe1kmaidW0oNECfvmqQkDT0CQ8va3/C0FIFJGI05GfpvGrCONA9UgJBXCIhMGAd
         sFXT3pNvMQQuQIRpny15ET6BAHIGidYLUbKo+aHufeRbr54laSZCYlFddiwUz1kYwsTl
         wInw==
X-Forwarded-Encrypted: i=1; AJvYcCU9WLLzMb03tDJtCICYFTyyIIL31v0obTj9PxOteBfCXyTCUyyW2ueHqTg5rG6ayJcvFW6lkROKp8zIwZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKBni198tEaU+lYWFr6b4AVykksQRVm89jY8fGa0Ek7MogV/rJ
	qEO5PGSUh5M5BMWehi+o1/JQXMmIz6fcjwP8czqLMMOO0Dg4obsRS+zx0YGcyerP96tBsgiY5Jo
	po3cLbNraS6YndXNW16ugtuqkjgVT3bpjQDm7eHQ6mA4YIU2rqRrOTpvAjQZ16Dh/FKxUJUCmUw
	==
X-Gm-Gg: ASbGnctmhqlYHOU2EyF+g8kLPCqGVQgnJXOys9njFzaagG0SRyjZPB/Fc1CrojerQiS
	Wb+2DR5/n9g/VQHb1soB+rafGRMZMcFD9f10j+of8l1VgoXBAZVjbb7hAviHG7VsZSVaURgP3Dn
	iddAetF11EmccX9xjZH/X8Eq2IDEphgpvHW4A9Db6Xk9SnRWOoFRHr3nY18rR7p92VMGN8D2j6/
	uu1asqndyCznAX0+Ykt/e4UsQ3B6fVeviTazMRW5KE+YsUci3Dh6U7kEW3nQmPPB3plfbamWzd8
	NFE=
X-Received: by 2002:a0c:e947:0:b0:6fa:fdb3:5879 with SMTP id 6a1803df08f44-6fafdb35bf9mr15208836d6.1.1749050251191;
        Wed, 04 Jun 2025 08:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXQGonqucBZYf2UC6ALyavoKYFeNdR0ADIrtP4iOYjEGlMnFQRQchn5m5Iki7I1+wf+k+Rzg==
X-Received: by 2002:a05:622a:5c8d:b0:4a4:310b:7f0a with SMTP id d75a77b69052e-4a5a56833aemr52154661cf.10.1749050240172;
        Wed, 04 Jun 2025 08:17:20 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358b6017sm91032051cf.33.2025.06.04.08.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:17:19 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:17:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	David Hildenbrand <david@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Pavel Emelyanov <xemul@parallels.com>,
	Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/3] userfaultfd: remove UFFD_CLOEXEC, UFFD_NONBLOCK, and
 UFFD_FLAGS_SET
Message-ID: <aEBjfQfD4rujNlaf@x1.local>
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-3-9c638c73f047@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603-uffd-fixes-v1-3-9c638c73f047@columbia.edu>

On Tue, Jun 03, 2025 at 06:14:22PM -0400, Tal Zussman wrote:
> UFFD_CLOEXEC, UFFD_NONBLOCK, and UFFD_FLAGS_SET have been unused since they
> were added in commit 932b18e0aec6 ("userfaultfd: linux/userfaultfd_k.h").
> Remove them and the associated BUILD_BUG_ON() checks.
> 
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

