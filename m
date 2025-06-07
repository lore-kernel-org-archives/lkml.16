Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFC13AA2F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749303739; cv=none; b=dcljQojZ6z+b25CRydnRsILc9aErfbRRYj5caypCo0NMx6oJcGoiB3QgHVnjhwRUz3/EHyRba77zStUvIz3R30tWmuo3mBokAbYSkshEKd+9DY+zzlbgXcN3JRMzuSTSQ16B0G6iUybgFGHhmMMdp58EjYR2yAgKuHwGgLrvJTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749303739; c=relaxed/simple;
	bh=F4kuCLiPBNXtqGi3vMrI/aHdSKkNx+kAi3dTgCr/8dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8DgAaTHcNUgXUakZ/clLEHbbp2fRNxbsn5O7HjnBDPOvTbyjb5H3SpDy+1T7SVpCA3Jp94Dw3YtV9H997F315FyYw042yol59RTwjkUanI7cyz8YYH0KBvY2jKgcgFdnso9gcRdelbCHhMS5eQT0xBceGbmheO3bEAVBrlz1gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RZZs5ZKi; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RZZs5ZKi"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d0976776dcso286476285a.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 06:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749303736; x=1749908536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=59D9xyE1wMBpDDtvice5CrCodJL07qD5HLVD9Zhx6wk=;
        b=RZZs5ZKisjxTrRyXMp6JWTbEhgy7LKPIcbwSAlLhkqf991XD/9CBIrnXoXe/IT5fVr
         CWxq+JhHYBZ5e/YW+pKSaRAkp9oLrgCZkBsFTI1KKcluTDdvcG4WOXvgH+OH5gPLCULF
         7MHkS4xZKxuWfHpW1O/v54vR/63tvPbEs8jCbZOUF/MSWAXoKtGNWfKqres/YMvQIXgT
         3md63YvSxDaG4+Z0voUE5ZCR+CRsrO6ghO/zy2SpDQ+OB9uZHN2PcvhvlkUT1iPKE3Ys
         XMXjTWNW1MB85Hzis7YldnNPbpEsYJHpOET/97H+2svpekKSAh5FC/Dkql6UX5fm4AuR
         1+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749303736; x=1749908536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59D9xyE1wMBpDDtvice5CrCodJL07qD5HLVD9Zhx6wk=;
        b=pbXP+y4SVW5AxT4emohSvqG+4Y53cpCngV0o4NNToDC8hPaqH3FD1Cnw5dtUkAUV7+
         GH+GvciByMhtOSndFpAEEoHy6jUZkbX5LPA7/mHfuZzAYnCEzO9i0b8U21XRZW58q1PQ
         14iZkBkerQPE1XkemRp2vFrWXIQjymJj7drBs8S6l6764JNgQy9JARPm9pjTTG+kqFUa
         +/HpWj76qlmV+TB/TacVe5q9RDpNoNTpBiCRHkyrbmyEJ3EiP+llzxbhfNIrb01mQwN7
         omYaafFmUHvxrKQ7fooGB+ZWKHbMu3T61mx+CW8/lJt0pK2aL4Hv0wRWhHAYp3vuYEa0
         mEWw==
X-Forwarded-Encrypted: i=1; AJvYcCXYz/aT1bMkYBuxz7uHCXUncipimp0BnZYLRgG0Hy6ekbIQhh1i2m95acPpPotW/Ky9EX2a+9pNPBRxOzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBvB5DEkxsvifDEVOGQ019A44oniaZNFYAyMFs+dyHqlayAvum
	LO4uYg7YlDhc+ljR/dW09DYgt8hb3LMytKaUY1+4eVdo6h2nrRRZAXSa6l7rDNGT5x4=
X-Gm-Gg: ASbGncs6Y8+N8+16se7b6Mnzqf5m4VbKVpLQ7ER1NG9l01wrAwHsP7GmpvG/IkGNCnK
	Rxi5UVl67ft9FfH1NQ1SlwXM3mGjMGeKgNS2GPQbMMUEOe+9U8fNnoHDKE9ozIxmGzAcyKIHaYM
	JLdYwHufHbvqYl4F1NESVXkaC7w49xX9ulJ+7ybrr3/hm6dd2zZ+0p2RvBwac3kRVYjQREhTT32
	vQHNWq6lZ7Cc1eC+Lbe4zW15oBrArcJiUWb33bmu/ileN4A4pviWwjhFPx6bG7dwej7Yqc1aZGf
	8mofJWoD7VSdt+Csqd5ZVo/VYaok/Cm1aTsx5v+Cp1XJQAgfV18hjx9GqpxDAwXBZm9fv6YK51j
	3MH9rDDsS5Pd4qcNl204wUsfdUBxy5A6NUnhJZQ==
X-Google-Smtp-Source: AGHT+IFj0uOzC7Sid/wwlvtMxCBAxx1olyUujdYH0dZwO5keyJkCZDQG3GgsjcfeLCsHn+4VITCkWw==
X-Received: by 2002:a05:620a:aa0b:b0:7d3:8cc5:8a44 with SMTP id af79cd13be357-7d38cc59db9mr119292285a.29.1749303736118;
        Sat, 07 Jun 2025 06:42:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d38c067179sm74899185a.73.2025.06.07.06.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 06:42:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uNtoM-00000000jpZ-2C2C;
	Sat, 07 Jun 2025 10:42:14 -0300
Date: Sat, 7 Jun 2025 10:42:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>, Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <20250607134214.GA158671@ziepe.ca>
References: <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <20250606184212.GB63308@ziepe.ca>
 <f2d8febc-cf95-44dc-9f01-b28151fe1282@lucifer.local>
 <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e88da7-d7c5-4a10-9318-76c1e38dd0a6@lucifer.local>

On Fri, Jun 06, 2025 at 08:03:15PM +0100, Lorenzo Stoakes wrote:
> On Fri, Jun 06, 2025 at 07:46:52PM +0100, Lorenzo Stoakes wrote:
> > On Fri, Jun 06, 2025 at 03:42:12PM -0300, Jason Gunthorpe wrote:
> > > On Fri, Jun 06, 2025 at 08:23:25PM +0200, David Hildenbrand wrote:
> > > > > One last data point: I've often logged onto systems that were running
> > > > > long enough that the dmesg had long since rolled over. And this makes
> > > > > the WARN_ON_ONCE() items disappear.
> > > >
> > > > I think what would be *really* helpful would be quick access to the very
> > > > first warning that triggered. At least that's what I usually dig for ... :)
> > >
> > > That's basically my point, it doesn't make sense to expose two APIs to
> > > developers with a choice like this. The WARN_ON infrastructure should
> > > deal with it consistently, maybe even configurable by the admin.
> > >
> > > Keeping the first warn in a buffer is definately a good option.
> > >
> > > Otherwise how is the patch author supposed to decide which API to
> > > call in each case?
> > >
> > > Jason
> >
> > To clarify - are we talking the first instance of a specific warning, or
> > the first warning in general?
> 
> OK sorry I'm being dumb, it is -per warning- reading the thread :P
> 
> So I guess you would have the macro establish a static buffer for each instance,
> and then some interface for gathering those up and outputting them?

Honestly, that seems unnecessary, just a single buffer for the first
global warning. Maybe with a 1 min rate limit for replacement or
something.

The kernel doesn't run around spewing warnings as a general rule.

> And I guess we'd not want a new interface for this like WARN_ON_ONCE_STORED()
> because that'd be... weird and how would anyone think to use that and nearly all
> cases wouldn't.

No! Delete WARN_ON_ONCE and say the new global mechanism is good
enough to capture the first WARN_ON, everyone always uses it always
and then nobody needs to think about this anymore when writing new
code.

Jason
