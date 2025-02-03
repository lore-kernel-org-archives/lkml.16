Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E4C205AD5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595290; cv=none; b=rODfzqPtDcSq03PyBhw44ElVI1XjlZzKXaAqAPJQmtyAEdDjSrv0RebgD1OqMSitG1y66kRg7OpsYBtGUw7Ns0ZDGz2PHatl/HEN271nQWdp8tAabORKiF0nNvs1EXekPHEDoyviBWl3sLpXJz8EIjV8PAhFObk8zOBlrcinVog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595290; c=relaxed/simple;
	bh=8L3lZCr5Yh9GUMcmv4LwjtFjnj2T4yg1op4QyO5LEUg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DD6+PBTqNu+kUw7LjJkJOibrr3Rl3awnmb3FgEAz8bPe/tfNHJ5x3bVFcXYmt0hzmY/3BZE8AL98hE5gjNQwRZcc+gVSrTJDXC9cSl2t5asJLqmoY6IsrwLOE76WI0043U5b7yeH2tkSA5i/nkVjSCUpWmaa/xZmfKgSla92XgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=KaeveK5b; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="KaeveK5b"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7b6e5c74cb7so371881385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738595287; x=1739200087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIfqpXWa2saTTZIkeCGgjoPhbUp2hEhSFcQHJJf5WU0=;
        b=KaeveK5b8zakSjNQ+ijy/xtt76OcNkiWLeRJ5f2vhHz0xHNqLfGFbnm3VFN/Pr90Hl
         3h3MTP1H2FOclDm085BBIjuCY+L5MJAcqgrirObXQE4M7OdntaFnudIVn0w8/Hr26qoo
         3ijZAphccXyyf307aC5mljLI8ETsKiIf7wXNFYpM35SFOggE/E3h1wZlA5PaBkX9WGAl
         a7B4dio7079kBk0mKEpODVE0WRqHHlmeevUc6FP7BvadrY3KDWtyWZI5zn6L5mC6xsZ4
         AJV5vvAaN0rtf1RYeaSy+SszNEfdXvuTxptX8FbVRdpuzH8qkYd1kTEswBaG1EfsZ+8w
         4V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595287; x=1739200087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIfqpXWa2saTTZIkeCGgjoPhbUp2hEhSFcQHJJf5WU0=;
        b=LkIIkYWHhVVlBjN394Uy3/eCmDSfd9lPr0yuNDZb8/O+pQCx7QAFAqRySYVnOxU1Ir
         WaCNeyg99ClrVsGShwufmHsUjn6YDgpw0tZKWhanwwfZE2G+kOH9szNiGdYnWJR9rFS1
         bW5LeRFqJcUJ7XlxeacXFx2sKWe3AcmxpWrgYl6Gn0iJMZckKISxfGLCBbzGamoEDt7n
         F4DpMNY4uRTHWlmoX8AH6wzcc/2BzICx8souliPYeTZGmnqv/LNGlQifhEc6kerDza0F
         4VLvlfsgv75VLr3yJW1Kk5ur1avRhetdJ+3VchYQuOP0mWusxsDi8m9qVkWqkdm6o7AL
         mohw==
X-Forwarded-Encrypted: i=1; AJvYcCXa/NsZqLE/K/L+rOE+batNotYVksnNxidcjsAqD0qJ76H0/RnjLcoKiow2pYV7x+HC0U6QGXBh4Od6gjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/YFd5I5oDdscLeKOcX0FJ8/1C+fXhyxJL6zmcZBdJCoxM/sUt
	d5IHs1yONUeWH1QdcrdhDeu2Frfmzfz2R5ubC5fSeHmkyvECQ8Y/SWJXbOhxKpI=
X-Gm-Gg: ASbGncs8Lhm1ujSECZMjCm3YBQK9mK8UiIXm8hE7lg2TOP9dDC4tUOmAHXbr0W7Ly9z
	gn4WojdB4lKfF+UBNFCwxGgAnI3w6O0xs5GyGBGYdNflFc4aFxTYFCNg1O6RKECs4GN5c/tOPY8
	po3Txd7sPLlCPdxAtXZB7zZCZEgdNsJzd4YCSA5zeKMEu+MHneoybSe2zjTNsqv/YntPwmoyZM0
	o46ooHn9EPcZBz9JEvBKOVmrBUMnd5E5nDOich00kOuKT1Tw1oMPu01SDNCqO8qSw==
X-Google-Smtp-Source: AGHT+IH/qa1lrVLcKxozjVl1Axtfg0S5tmpdY0Hz1inHc6vNMg7mQBJDuUSeOKIlGn70ib6W5YOi8A==
X-Received: by 2002:a05:620a:19a8:b0:7b6:c540:9531 with SMTP id af79cd13be357-7bffcce8d01mr3518318185a.18.1738595287317;
        Mon, 03 Feb 2025 07:08:07 -0800 (PST)
Received: from ziepe.ca ([130.41.10.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d1280sm534889985a.45.2025.02.03.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:08:06 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tey3R-0000000As1Z-1rVV;
	Mon, 03 Feb 2025 11:08:05 -0400
Date: Mon, 3 Feb 2025 11:08:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com,
	lyude@redhat.com, dakr@redhat.com, airlied@gmail.com,
	simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
	akpm@linux-foundation.org, GalShalom@nvidia.com,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-mm@kvack.org, linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250203150805.GC2296753@ziepe.ca>
References: <20250128151610.GC1524382@ziepe.ca>
 <b78d32e13811ef1fa57b0535749c811f2afb4dcd.camel@linux.intel.com>
 <20250128172123.GD1524382@ziepe.ca>
 <Z5ovcnX2zVoqdomA@phenom.ffwll.local>
 <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z50BbuUQWIaDPRzK@phenom.ffwll.local>

On Fri, Jan 31, 2025 at 05:59:26PM +0100, Simona Vetter wrote:

> So one aspect where I don't like the pgmap->owner approach much is that
> it's a big thing to get right, and it feels a bit to me that we don't yet
> know the right questions.

Well, I would say it isn't really complete yet. No driver has yet
attempted to use a private interconnect with these scheme. Probably it
needs more work.

> A bit related is that we'll have to do some driver-specific migration
> after hmm_range_fault anyway for allocation policies. With coherent
> interconnect that'd be up to numactl, but for driver private it's all up
> to the driver. And once we have that, we can also migrate memory around
> that's misplaced for functional and not just performance reasons.

Are you sure? This doesn't seem to what any hmm_range_fault() user
should be doing. hmm_range_fault() is to help mirror the page table
to a secondary, that is all. Migration policy shouldn't be part of it,
just mirroring doesn't necessarily mean any access was performed, for
instance.

And mirroring doesn't track any access done by non-faulting cases either.

> The plan I discussed with Thomas a while back at least for gpus was to
> have that as a drm_devpagemap library, 

I would not be happy to see this. Please improve pagemap directly if
you think you need more things.

> which would have a common owner (or
> maybe per driver or so as Thomas suggested). 

Neither really match the expected design here. The owner should be
entirely based on reachability. Devices that cannot reach each other
directly should have different owners.

> But upfront speccing all this out doesn't seem like a good idea to,
> because I honestly don't know what we all need.

This is why it is currently just void *owner  :)

Jason
