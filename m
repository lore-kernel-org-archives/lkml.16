Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3477AA48
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748090737; cv=none; b=Jpt6O8DYfOFK2h+s9BARr2FizPPEN3++P6NeMH9NxiEbnuzIJw5heeMivdfRps3Cj3FFCaeCSketk8e1fFjN0dVF1GTOE9QKDc7bvJlg6zy1Eobu9fs7aJiJ8bU4CFMqq/wYI8Ii/cMxM/EMIbMQWwpJYIIbv2iuoCXfIFIlxMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748090737; c=relaxed/simple;
	bh=xH4h0zgppRosl/vzGNdRwpydm6+l6L1Aflr9XwKFWYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dyMdeAZaM6d695ZAzsxXcMNEZ23l7/CLzRZZdZOpRzkh7ECOnAxv4X3PaOevMl4WCa20gRPBrNCKPT9A26CALxQ16woUvQkV45hc6mbaQVt0dNlLG4ClJ3X94i2kAcXR9m8EkYLJWY6nhpZDDDL/0eBJL7X4gEnbYFuhPKLBkcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VlIIX9Ey; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VlIIX9Ey"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a36c2d3104so372715f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748090734; x=1748695534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fAadodyaUJ3UfjakUQd1RzRTpxjoFJWx5tx5bxrnsE=;
        b=VlIIX9EytuDBptqZrd3HmigCucJ51OOm9+g4MQbPYwAJJoUnJd2YhmYE0n0/QN5SRP
         R7GjJPBg6IYh2Z3OK1ypZJJo6iOBJ9R+v3xsoDsmDmaDbjQANkcKDS1feFVhN5cLkRp7
         eAKqvuJrQFCHx//SI6X4KeSdZK7e4r35tNcSKQovFRQG5cmoK9l6TcA1BqyJDhvBRlK4
         1N+ltuZ23qMoCIJdFWzWeOY5Mc5zEU2a+w3xylgdh+Lk1xoJ/eAxzTn5R/kU2hUkLNQt
         LrlWqugRaSeggUvzs2k9fPMHaHJhid+e0A7CumlIG456zoqnynuJnSSWIM0Tj+vDE+1L
         xYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748090734; x=1748695534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fAadodyaUJ3UfjakUQd1RzRTpxjoFJWx5tx5bxrnsE=;
        b=PyLLySa7rIsBYVuvPi/fGpGfcdEmklwLKq5MqCVsrszqYQ0WUUSka9Bi0lxf4f0FSy
         AtKmXsYQVw3uTnOUfSCqR22+YFLk8zR1Hk/5nKov0+bgk0e6f7yEpjIURf79VkXbZ/jK
         tXr7XNOJ++YTRQAd9ATvYTOYhjpKIgqWMUEt9aLJInw8afyEGE6yU/+E3IKCnwHjnubO
         fuI91Hpth+wVZDk/xqpSIoIm46Ct5mPxV+KitT84cYpGGFmh2CqmZSY88saT2nc1uUns
         2CG2N018bzE7NjDIetl/48G0f41RQ9gNOu9pvz5ssWZ0Di5+gQnYIDbu7ayskNm/lX7Z
         kEHw==
X-Forwarded-Encrypted: i=1; AJvYcCXu50QTtbaUZVVrzUtfelG+k2IDbWSXDDX9pva24rgUoo/D4R1TCQTb+9ATHfzpFiauQ402hYqabzQPJsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOsYwnuxq2OaMBpxOegxMXTFvga9JKY+tudWMXtrMBG2l23yu
	NEu0qQBrNjmbKDNmrp2Ylw0YE0ucuE599qpTymiCffdZC2yzf7lCHx+O
X-Gm-Gg: ASbGnctFsMpT+cBBao6ddJwtvJb3E7Kiim7FRcrci+ZqEXm+7Yi/eCt/fmKgAvaxCR6
	1gv/Sxs+LlbFHo3ypIvAe8keKgkT5yKBi1uBwdtzh1Ki7Ph0S8PqKqWSpeH6GGFZ8IeilYVJ2Eo
	dbiKy6nbWevaTer5XtYssHlnAXvQKZsK0jWVqRjfIFRnD9secSm22GcD7s+/zrvwK/j3u9DExCM
	H5/8E0DPP4OCxR/vQ7/7ykfG8E8+08o/ymT9TymG2fZCcQTnndJ5/j2+y5X5BZrGZD+twdNqk/s
	X0/2poxfesYnuOzpRXEHgN8A7u4yqLVWVZwAe3Leua56e/AcFzekAGfNLXneWEbAJC203SerFu4
	ZPAHa7JbzQf5Zkw==
X-Google-Smtp-Source: AGHT+IG0i9qFukv9w5pfMACSVf+KHuxboeRS6v0mNA/Osrs5ViQtvkt7VCdtpYqD3/7fW94dkWb+DQ==
X-Received: by 2002:a05:6000:26ce:b0:3a4:d004:94a8 with SMTP id ffacd0b85a97d-3a4d0049624mr1244031f8f.5.1748090734156;
        Sat, 24 May 2025 05:45:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a36835ef41sm25766737f8f.94.2025.05.24.05.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 05:45:33 -0700 (PDT)
Date: Sat, 24 May 2025 13:45:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] container_of: Document container_of() is not to be
 used in new code
Message-ID: <20250524134526.28285a0b@pumpkin>
In-Reply-To: <2025052306-childlike-operating-d9c7@gregkh>
References: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
	<aCyOzUIIvMk6Gp8o@smile.fi.intel.com>
	<2025052000-widen-lip-350b@gregkh>
	<aCz9jlMcXDooqx0s@kekkonen.localdomain>
	<2025052138-carport-applaud-61b8@gregkh>
	<2025052121-drastic-hacker-aab6@gregkh>
	<20250522220142.14876993@pumpkin>
	<2025052306-childlike-operating-d9c7@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 May 2025 10:36:45 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Thu, May 22, 2025 at 10:01:42PM +0100, David Laight wrote:
> > On Wed, 21 May 2025 15:31:36 +0200
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >   
> > > On Wed, May 21, 2025 at 03:27:19PM +0200, Greg Kroah-Hartman wrote:  
> > ...  
> > > I tried it for the whole tree, and ugh, there are some real "errors" in
> > > there.  The nfs inode handling logic is crazy, passing in a const
> > > pointer and then setting fields in it.  So this will be some real work
> > > to unwind and fix in some places.  
> > 
> > Perhaps change the really dodgy ones to container_of_deconst().
> > And fix the easy ones so they compile with the 'const' check.  
> 
> Ick, no, let me fix these up properly.  I'm picking them off, and have
> found some real issues here.  It will give me something to build patches
> for over time while doing stable kernel test builds :)

I was mostly thinking of it as temporary measure help find the easy cases.

But having container_of_const() that preserves 'const-ness' and
container_of() that always removes it seems wrong.
Wouldn't preserving const-ness for a W=1 build would be a more normal way
to do it?

	David
