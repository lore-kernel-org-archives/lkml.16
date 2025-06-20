Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B144A27AC44
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409262; cv=none; b=Twl8Jjimo+C0wRKtbmPw9YgYwkbVCEKBJYGN3rjvCKEc9BFeYjIzotbY4mRYzq86HpQOurOvGsITMdOkjH0/meTx7rBeIoA1bwEoLdLwtjaL1pHSAheNdT0cu4YtktUII50z+Q48zkA0SfiG0i0smdBM0zFvmMYSZzKt8PxXTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409262; c=relaxed/simple;
	bh=SGobpLuVUs7D23HfBqLMyecSiLQVVDb3avZcnsTrn9o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAXutLXf1ktkb2ehrGpcnIgYxj49xc/vGMcXN2ykJdI/i3CT08yd8xCxDKl/0wJhMf6lTreQ64T4/X7VC5D9iFOyYozvNUNXEIJ/a21h4Fzy0ogctQPfnc1qWgFZnlgYP5T7fmr7M+wd9fEAOCQYNZ/Jm2bJdqp6bBDiQXoor10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IM2lB094; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IM2lB094"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5535652f42cso1787161e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750409259; x=1751014059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NaWs4xvvPpeaCjJCWs098f2+kCHkcJzonLJVPQ9irHg=;
        b=IM2lB094ehZfICYGbghXJQilTHtezSWOOQ3GtgSL2UwG7X+6tty7D+qjjA21pKkGqN
         Bk//DSFM7T1q7JMxH6EzW/rQgK9ALczIxfPlVQvEEBB9MYtG2Er7BPuWq978qbCRH9U3
         YxrXah9yxqB+OBFEYwXVtk3IoEFK5aJMXGzfFwmLLxQlemG2eqShJ6MdrTUwYHChm8mP
         MduktXcEkWEEFQehEtfMm0yVEYLYkuXHTDL7xeSQ676+SpjT06yo0R/myVF6egkEEZRC
         JuAsP0+RXrkgtaebLqv+ceOeZK5eFk6Rr828K5gCMn7gHdHIakkzMrFEJAMsSV9Xkbe2
         6CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750409259; x=1751014059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaWs4xvvPpeaCjJCWs098f2+kCHkcJzonLJVPQ9irHg=;
        b=dvTLJfFacVwc1nTl466xiF8NPKdwUSIb0/M/PQe2bOHVA6h2zdEYaQGZSKjmSx0z6W
         EDnSQ91nXFRPack51xMqyAqoPIbJ2bfs6Mi+oWg6jtX1XxpbOSP+2mzmJ+ItMOhDZa8y
         Zx0zK3nWkTmQ5WWPWVHyTANDdEJtcCoOpHzUJr7JrYYGPuzp4Rgjiq0R/sE2SCBrCLeM
         zVkbWYmNxYelxLGXuPHt9CeHQYuhaPIj0eN/kcQ9xouEQwigwMBguhylD+6EQ0CSX9B9
         Jm8svCZw3d3yVweXjHvj6DhKsyYa6q0iTAMGjNUTahGzHmMQie+GS08gJLYZK4DPcGUa
         sdZg==
X-Forwarded-Encrypted: i=1; AJvYcCV9q7LCmKrT+aUyxkHwyL2QXIBLVPaSJg8Mkg68GM+TmeF4oeXdUPXkOvhDqwsLWBqt2+vimQwLRZhMQeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZK8sVQTmOLeAKHuKKkwW4noHB4JxiKxUpephk6wb9mJ+PIBRR
	xVRamsoRxORfS+8fgUsxsFZflSzlSd/zPLNeHLYOI2749yk3Nun2MRoo
X-Gm-Gg: ASbGncsxa41LopaZ2HLpZzEOcWu0VFPxl+KevN6xBSzCMJrMJa+MDoCp0e6v6HJeVlN
	y8xFE7lNbAAP9/Gbn4zoqbJnXZWc2orkNUgAcoUCcWTX7C01T4Ez63tsvMHi8G8BssdyVY1pHvw
	dFso4CQh5zZJikRNuEz5N+wYmCjh8KXSiu7kovhHFEJc7X9wslKhMbnQwJKSZG6iufAcEoZ7fc6
	SbZ0PkBNUwskAYBy8X0oXDyFAlRouYL3bzblhtG8M5/XIpfcV3ylyKePfnKm3CLZStJ7ayRcsns
	T/ho8b7P/+EVPpVeGcExgdz49VqzkaGgzb1CLgezhI3fm1bFToAIApYzugBYYJlv/++U+ipXqzd
	k+i3tQVuYhfnWNII9
X-Google-Smtp-Source: AGHT+IFOvPmfqOBZOG5VL73wW51rn1KE6VYniA2GZLKFP8gJr25s/3ya10MiUT7/JdsCkGykUpR+/A==
X-Received: by 2002:a05:6512:4014:b0:553:acf9:c430 with SMTP id 2adb3069b0e04-553e3ba865emr810575e87.17.1750409258480;
        Fri, 20 Jun 2025 01:47:38 -0700 (PDT)
Received: from pc636 (host-95-193-182-189.mobileonline.telia.com. [95.193.182.189])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41d73f9sm204956e87.252.2025.06.20.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:47:37 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 20 Jun 2025 10:47:34 +0200
To: Harry Yoo <harry.yoo@oracle.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Uladzislau Rezki <urezki@gmail.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Adrian Huang <ahuang12@lenovo.com>,
	Christop Hellwig <hch@infradead.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-mm@kvack.org,
	Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: Re: Kernel crash due to alloc_tag_top_users() being called when
 !mem_profiling_support?
Message-ID: <aFUgJgrc_eIHRy5-@pc636>
References: <202506181351.bba867dd-lkp@intel.com>
 <aFQaY4Bxle8-GT6O@harry>
 <aFQnEj0UASzl2Lxa@hyeyoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFQnEj0UASzl2Lxa@hyeyoo>

On Fri, Jun 20, 2025 at 12:04:50AM +0900, Harry Yoo wrote:
> On Thu, Jun 19, 2025 at 11:10:43PM +0900, Harry Yoo wrote:
> > On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > > 
> > > Hello,
> > > 
> > > for this change, we reported
> > > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > > in
> > > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> > > 
> > > at that time, we made some tests with x86_64 config which runs well.
> > > 
> > > now we noticed the commit is in mainline now.
> > 
> > (Re-sending due to not Ccing people and the list...)
> > 
> > Hi, I'm facing the same error on my testing environment.
> 
> I should have clarified that the reason the kernel failed to allocate
> memory on my machine was due to running out of memory, not because of the
> vmalloc test module.
> 
> But based on the fact that the test case (align_shift_alloc_test) is
> expected to fail, the issue here is not memory allocation failure
> itself, but rather that the kernel crashes when the allocation fails.
> 
It looks someone tries to test the CONFIG_TEST_VMALLOC=y as built-in
approach test-cases. Yes, it will trigger a lot of warnings as some
use cases are supposed to be failed. This will trigger a lot of kernel
warnings which can be considered by test-robot or people as problem.

In this case i can exclude those use cases or even not run at all unless
boot-parameters properly sets if built-in.

--
Uladzislau Rezki
