Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485192EF9B4
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965603; cv=none; b=NM2gHlLXX3y0hmgKQmOjWYpcQJxV433P8t+kgkCU6zKWX8gnWqI2Tw5U+hUhFL8UDTXud5Zunt0Z6bBP7NHP7kjc1ZZ31cfnmZUp2voPHfj0q5PIsdewNmXd8TK+2RIdj7zi5ve+zwo0abgnlw6naZvdqOdZXoQ/65sq4rLn6XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965603; c=relaxed/simple;
	bh=NXZiagHgTh4ICA7Z9PcDT/eyqyxuGCGLWpxNSBxlOw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6KYTm6YsSBmTDnqt4Gv1TYOKkyiCDOLsf0DJSiHSTQ5JJZzVqRIQaZEZ0UyEzAQw8t5QgNYb6oYRl5MR1uRGie+NBGQTVFYmyVdXASnfKpuMYmRtqEEdkydkUd7cEem5h0hwOOp2mHPeqmBuo2w0KyVw9EVx5OOZ7cZiwBSFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIuVPbbW; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIuVPbbW"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-408d7e2b040so874634b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750965601; x=1751570401; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jw2OSuwMAy9W3gBCyzotqn/e/diunkHgHz26UnXH3Nw=;
        b=iIuVPbbWVInQpHTSprJ00+lT6wWh02neX7BbaD18PF04kpXUOkt4kUymkIB0Xz03wN
         5ApOnyonMmn7fTP1R755abBMy5NjYxXxK+qQvgJV0cVIwJPEQweuVpfOXjikt8/29n3f
         PHVls6a6qTSBmKHm0XO9XR4HnDE9209W2RDmpmHET+SKdOVdgkztFnZieK0fgFxHm4pP
         q2I+BLpz6tjjarb5iPzkeakbBBUNeqiXNEf+ajj6IUnH3G43Z3y+liiiEseAj5918JZ2
         nUExCTIgacmxWn/0GBPeNquKMb+9BD8Zce4oQj7yVvs8CfZA9akn/LwpVKv+F37x900Y
         R7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965601; x=1751570401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw2OSuwMAy9W3gBCyzotqn/e/diunkHgHz26UnXH3Nw=;
        b=Mt+dSHVJ0SjNP6pESOaLMZREGHCkJ054D8dG5tVFcLx7t0XwZ9jHIt9c4n/enEDosr
         NWD0AFFZf4Y3WLfURV77Zql9CETq47L/uKTCOA0jGx5T40g/fICWz19J/ia17vP9OiFJ
         8oRZs38jARlbg+ubMGdFaezoTwejsdOKWM3633v3WqD6zh3D7Eil8BXQGV8ZmQKGil7S
         0Jw8XrFBvuxlIVsmqkT3yn0bTMn6OBoCVX1ceABVTeyRZ5OJM4vQXhm3Q/+Xufi/GbW2
         H1oFZb3f9xGrGG15v8IwSZQU9Gz2Lu+YUE56v3/tOT23lTD4oscTXQG+RcKL28jw9T51
         j+vw==
X-Forwarded-Encrypted: i=1; AJvYcCVWDxPm82VmU1bCmNcTp+gu9szUb2C8DyzUvBqFjhzqK6SA8eWcgJUPTdA+r89sbCsiWjwNbxlz/Yvoso4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoEKvp0yC+hiUclIEuDrOrd/mi+RO87CHlmlqfiBvOG3rS9FTh
	rf1pTimYSvQK5DuJvANHo43j6mtdt1uDpA6L9eh8dAsr1uY3a0bRD33AVzdoYliCYkR4OpU1+ke
	5NIe8
X-Gm-Gg: ASbGncs+mkiBaunplzCs7KaFvByp/CkohkYgNs32SxYetz3rLVWWvd4Ui+aK/CJw5Qp
	nuFqDJwDAu1Sd2Uvt+soPMJbxdPs+4K3H/m0bO08UdF68G+48mkJsk7lALVqWcOQ6u+kuPmDZz5
	X6zR+wqwzVjXas+Q3nFyhekpa5ZglBPPv7H05sVWvvOek5RM02NVss5MBJ3HPgg8a6cBYfeHXhM
	uXqqb0WAIQ7ni1a2j4vqY60tpYPyZG8E6NBnPs6x8tpOrrj7x+oxqfHfFFKSfprp3KPfUDvJSlV
	rEycdtvl3vVLRdUAKeC5tDAjetGYw0aJ3WrKi1YDJlBvkwbvF7k/5M/LN455U6/UtmlB
X-Google-Smtp-Source: AGHT+IFY7CJ7QeQO5lGm3SZuq1NkH2K1MhQoLCsDuDsQ1TcbQSnB0KYdrUkAGt1PGEgX5gAvdU6Ntw==
X-Received: by 2002:a05:6808:1592:b0:401:e67c:b3be with SMTP id 5614622812f47-40b33c495a1mr285207b6e.4.1750965601252;
        Thu, 26 Jun 2025 12:20:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:154:5a01:d5a1:16d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322b1d89sm75889b6e.19.2025.06.26.12.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 12:20:00 -0700 (PDT)
Date: Thu, 26 Jun 2025 22:19:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <8b08f2a3-8219-49b8-be47-fc33a95a3953@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
 <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
 <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
 <CAGn2d8PdiBRN09L__XEsH=cNYz4rDR2A-GnSqCM6Y5TmtT+wcw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8PdiBRN09L__XEsH=cNYz4rDR2A-GnSqCM6Y5TmtT+wcw@mail.gmail.com>

Thank you.  This is good analysis.

On Thu, Jun 26, 2025 at 06:19:40PM +0300, Abdelrahman Fekry wrote:
> Hello Dan , Thanks for your review
> 
> On Tue, Jun 24, 2025 at 9:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > Yes.  Nothing is checking for if hmm_init() fails.  Step through the
> > code and verify that nothing crashes or bad happens as a result.
> >
> > For example, I think hmm_bo_alloc() will print "hmm_bo_device not inited
> > yet." and return.  So that's kind of annoying but it's not a crash.
> > Search through the rest of the driver and verify how it will behave.
> >
> 
> So, I have been searching through the code as you suggested,
> and found a couple of interesting things to look at.
> 
> Firstly, no function that calls hmm_init() checks its return code,
> and it doesn’t crash anywhere because of this, so it's not a problem.
> But the thing is, the hmm_initialized flag inside the hmm_init() function
> is set even if hmm_bo_device_init() fails, and this can be misleading for
> functions like __hm_alloc() that check this flag later.

Yeah.

> 
> Secondly, the function hmm_bo_alloc() and others don’t check
> the return code of hmm_init().

hmm_init() is called from two places, atomisp_pci_probe() and
__hmm_alloc().  Is it really possible to call __hmm_alloc() before
atomisp_pci_probe() has succeeded?  That's an important question.
Please try to read the code and find the answer.

It would be better to only call hmm_init() from the probe function
and delete the call in __hmm_alloc() but I don't know if that's
possible.

> Instead, they check the flag
> HMM_BO_DEVICE_INITED inside bdev, which is set by the function
> hmm_bo_device_init(). The problem is, if we inspect hmm_bo_device_init(),
> we find that the HMM_BO_DEVICE_INITED flag is set before the calls to
> kmem_cache_create(), kmem_cache_alloc(), and __bo_init().
> This means that if any of these functions fail, the flag will still be set,
> which can lead to misbehavior in functions that rely on it, like hmm_bo_alloc().
> 

Yeah.  That seems correct to me too.

> Should I tackle these problems after submitting the original patch of
> removing the debug sysfs attr. ?

Perfect.  Sounds good.

regards,
dan carpenter

