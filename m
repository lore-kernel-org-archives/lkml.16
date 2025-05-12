Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF7C23C4F8
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064087; cv=none; b=DsDA/nJta6DSnUb8wxkTZkOQ5hSd21gR00T6HYsWEqPPpgdDGEZvDYrRumV7DPbDuMTepSmo4uyulKfucy2m5hn3cUF1jZcWttFwOXwbO07XLjorhER7FgIpPsHF0J4kAwqhyXjWFxDFO3Ns6PxGoov4VVkPWT4d3T3KGi2c/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064087; c=relaxed/simple;
	bh=BUkwgzL+MSLKCC2+REuz9ThllAAWTrnd1vUtZmKWiw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rsus+vOvCWe1OAf23yVHAxsvslHvpTczda+fU/gYOVH9yGD6oyRr/434Du7j4l75YqcncfBrJvcSf2I35DSFoO9z5H3v1ZA53Ot11SMbG1iTRlpufhZqlNf/bhRzSLHEBPHY7/daz/svljGQ3VWvGBh4bxJEfn2qanIrwNTB3h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=l/ds3KL6; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="l/ds3KL6"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47691d82bfbso82780721cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747064084; x=1747668884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2IEqsFP6mbIlWzLtUHadM7bvGmNt6W1aQGNu23yom0=;
        b=l/ds3KL6tIKam7TSWf/Lf6ADIj5Swve9HbgiBkjBGdDRDKRgbbrex+Br/9SfHoGomZ
         AB464YIvyLqxMrdFZXeC1W4OqtPmJQ8+J2OgKQxCmg+kR9zPXmLS/O5byP65rua0CXyO
         mwl6Evy5G7nuZKDGl8GuQKKjxkkdke6fp4wDdG3mMfHXPiIWw5WZKBwrgqri7clvHs2l
         e4oil6u/pelzIpls1rlyK5daKsVFbZ3kaYWf5Z1dnK2BBS+b60hSitx9HBLrKeMHi9Qg
         RjuJLDDM1hK8Ij3CIghuELrU23HbS/btYr9yyTwYRXH70rKDBDKIZFhiTy452I2O9RYF
         udKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064084; x=1747668884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2IEqsFP6mbIlWzLtUHadM7bvGmNt6W1aQGNu23yom0=;
        b=wr60wSYbT1Rp4lZHwp1Sj+C5WF/peeaVWAw8UKEfNFSsIwfSeOB1qNqK209FyU54Wi
         noS9+B3b/teXFBQAkFRR0mt+OT4p1LYzBOnNiQKVaHMBUey85dHHJbK8DoBHpP/SVvju
         xE1EYYAx1tsKo5BOyyhVy6K9KGgDx1S0qlrZGXGEWCTwzI8RQhJuBurb5jN0RiRlNp//
         cwScde8jaEgIohKJuPUus77ynqJk9WiRCn+hbcUfeMqGJfxPY2ZPkf837v+ajEDwmi1+
         qNXBqadg8T2pZezdZpq0I95/6DVAyyir35Caijrh7YntGb8cTMc/foiDdy+/KwEMWIvo
         I+0g==
X-Forwarded-Encrypted: i=1; AJvYcCXM8DcVPwYYX6GiT2u8RbEFt1FCr9Pph9BCkDcyBPA7GUSSYIlQ0zUzhQ3urZFIysPqghtHFmJKQl4K1J8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+GHWOXjXf9pj0JKV5iIdP9+4TcIDekKZ2dXr2Uw7sVPQa+XxJ
	f1gNuAkuJYaChJT5dH9vrjI6KpF0iNSxwIJd+rT/b2PB/ZUIhBsKQZgl8nzzKw==
X-Gm-Gg: ASbGncu1QnSWgO/56shdG0TBnTtB6A9nSSuOXoNMPdvRgpo4bAHLu8f/JyC40EgcAVk
	/Mp427iY2c/i0wmU6dvs6zKV9ya6Wi+4vnaZwcShy76oDjyi6rBaaxTUcthPVAX7+fvF3+B0V0u
	sdMddytO0/Rvf5HvjjGne8nvH7tfbeU56ZcQBsPGoDdard1e8YgjUyUv4OTOlDlmh9t5rklVx7k
	hjCOzuWiV9kXSfxXoLuLxiKih9lzNR2Ww9Mp6qaqVf9VLqcOYqWtrk3gQgwCXBufVYiwk7XtVm4
	dMUxD2/t5eT603MJd31tgC46t57LqjuYPCFpBbzm7AiiOGRuFoolURxMN0qxPcT+9nawM2Akw7t
	5aM5e
X-Google-Smtp-Source: AGHT+IH8OuHVn8EU95Z0dn+sa4fi7WbCN1/rL8STfDNceTR/nqBxCTh41lLOcwUGLyaoM7eK6RifBA==
X-Received: by 2002:a05:622a:14b:b0:478:f4bd:8b8e with SMTP id d75a77b69052e-494527deb21mr217626471cf.39.1747064084310;
        Mon, 12 May 2025 08:34:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4945259e3acsm51685791cf.72.2025.05.12.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:34:43 -0700 (PDT)
Date: Mon, 12 May 2025 11:34:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	surenb@google.com, kent.overstreet@linux.dev
Subject: Re: [RFC] USB: core/xhci: add a buffer in urb for host controller
 private data
Message-ID: <7fd35044-3719-44c1-b4cf-89551e27da26@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512150724.4560-1-00107082@163.com>

On Mon, May 12, 2025 at 11:07:24PM +0800, David Wang wrote:
> ---
> I was checking memory allocation behaviors (via memory profiling[1]),
> when I notice a high frequent memory allocation in xhci_urb_enqueue, about
> 250/s when using a USB webcam. If those alloced buffer could be kept and
> reused, lots of memory allocations could be avoid over time.
> 
> This patch is just a POC, about 0/s memory allocation in xhci with this
> patch, when I use my USB devices, webcam/keyboard/mouse. 
> 
> A dynamic cached memory would be better: URB keep host controller's
> private data, if larger size buffer needed for private data, old buffer
> released and a larger buffer alloced.

This sounds like a better approach; you should try it.  Allocations and 
dellocations from a private memory pool can be really quick.  And it 
wouldn't waste space on buffers for URBs that don't need them (for 
example, URBs used with other host controller drivers).

Alan Stern
