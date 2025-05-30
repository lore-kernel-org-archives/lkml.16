Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49921E833F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593694; cv=none; b=oG6uUG81H5XTe4dSe1fR0KKl5yRHN/z2NFOtkKyh3XyWPyA8SL9ze8jUf1wijdjGVSTpTWAtNYIwuK/XOmyGC/sm0i9Q7bYg08JF0pUzXtbIZS+LQKuoThjoYgE1f/2utT880lAHufrQwWC/sbacjmYC/hJ4zVpZ+sc3700tgMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593694; c=relaxed/simple;
	bh=fmJb1Vge/hV+b9FDVR4QT1MmeFZnpkrgLzRxdbhhX+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iaj2Cgy1JC02Ukd/zAa8/e/M6HlRQ8GE6rfiqH4pU4xqqbmaLCysif8LXoMPnBZU5sX+wf2GELW6yHDIw/rSdBlAcxbusk6lZ6Qm8JuPnRYu8MizwXPZPC0ABpKNRQesY0WUyAKHXBmSvmOGiCKpEg+30VWF1qPmhFRC8X4UUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f88FU4Lw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f88FU4Lw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a3798794d3so1490546f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748593689; x=1749198489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+KfoeGtydTUpyMLEw3lr9UQ8n4o3PGMI0cTKplyap2g=;
        b=f88FU4Lwp761A7x7tJ3K9+IQ8VeNJnGUpmWkDivwZmH7r9gm2AdxqNYYLvEJ4aOW92
         aWcp+2h96h9JHYhzI7ssvv/qGNwDmUl/ylI+NJ4mpocr84AW8GFUUfyVEH5Y3PIHAT0R
         RyEnda5E9oiqf+TWMLXBT2w8iq1F5YmNlCJMM9ylSq21CwdJHjt30PQHYtlCBSjZyozp
         0QKdeBfVMiMrDDpeRLtu9xQWvLA8lauVqdAj3v3OkoAvaJdyYlClT74LEDVtXtgS48sC
         iPAomtjz4EC3i7y8++AZE20qI2tGZ7WGWnhcUm9ZUbByf3jzPOiS3Bk2GVf5bPACOe0w
         n6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748593689; x=1749198489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KfoeGtydTUpyMLEw3lr9UQ8n4o3PGMI0cTKplyap2g=;
        b=hj/sZJKdjLKy2+ehsQLxphx/evx6iNInUpLNYzMf88MK4SMf/BKO+GFuaYdfuhjbR5
         4diClzjd466mk0yMcw+UtPwk7EJB1xxaf+p/LRQRd963IFBuZfp+k4S50p4yBrLsxqRh
         LHI+qBtcBQ/uZjh6/8SzwHUnuxjoPwve8QVNjqVnE3vz6KJK//JMVSe1eRFlsa3mul9L
         aAXImaOuc/Aoqqes8QBiLEFfaT9allY53T/SxYYHN2grKJDm24unSUu8gByPXo1paVnH
         j9dHQIdGsvrxQm0ugW3PopJFaxAHabRtm3JL6INT86OPDdsFEeojvBVHnSdg4QaGgIUA
         kr7w==
X-Forwarded-Encrypted: i=1; AJvYcCVjzWq6GtuLZgs97gXFlTRtzJoN3pQfJbElhY1yPBqslwR21rn5nWmCe75IEGstjfs/j0nreS1bzN/xwyU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz24jqIAAcsfduXyiBfk3sFFSwIYbrWuno+n8+75RQJbYlvNoaj
	W54KAJoWnLT7RvyGm1cxEWocYftYWJj5Vmh8/biI1JCUjr69KZ3HIQ+GgY67KomvR9k=
X-Gm-Gg: ASbGncu9g64orFAgnDhWq+EdVXoss8nbRIvnVf2/U7bxnxiAmbqA3+yhSDXMu50eXBW
	DRhSVCvg9HEKNyl7vbWleJOEQzdHUiSkVMaQbwskhYqfVzB+7pRXumglwVKg9ukQZIhf49lIeVF
	XM92MWGafiMHywlWQGttQIRNFTNESs7n0x8HAKs1r0BlV21sF9BzBsgf87RVH02A0tK8DQRBT3b
	isJO7s1e+EjcCy7+Zs3sTNOAUHe0t923E+jGg6JcfdnzTVjv4a9ewODRd/wdTPRYt3hxwT3OqSN
	RfGlNwugWvOQTKpnFSGkBkQcwU9vwbwONWW3fy+raWDA7oM7kCh8ppXlMWOsQ3Y/J8nfAcsBq1I
	=
X-Google-Smtp-Source: AGHT+IH/hoDLzGQW3Ae82uMnYvImx0K/Ml7TX7h0dog4n2USqtNGdiSnfxDJz88krhbw1SEsk2vu0A==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:ee3f:e9a6 with SMTP id ffacd0b85a97d-3a4f7ab1641mr1698397f8f.54.1748593688757;
        Fri, 30 May 2025 01:28:08 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4efe6d0dbsm4093471f8f.40.2025.05.30.01.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 01:28:08 -0700 (PDT)
Date: Fri, 30 May 2025 10:28:07 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
	Jiri Bohac <jbohac@suse.cz>, Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
	Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
	Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
	David Hildenbrand <dhildenb@redhat.com>
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
Message-ID: <aDlsF5tAcUxo4VgT@tiehlicka>
References: <Z7dc9Cd8KX3b_brB@dwarf.suse.cz>
 <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>

On Fri 30-05-25 10:06:52, David Hildenbrand wrote:
> On 29.05.25 09:46, Michal Hocko wrote:
> > On Wed 28-05-25 23:01:04, David Hildenbrand wrote:
> > [...]
> > > I think we just have to be careful to document it properly -- especially the
> > > shortcomings and that this feature might become a problem in the future.
> > > Movable user-space page tables getting placed on CMA memory would probably
> > > not be a problem if we don't care about ... user-space data either way.
> > 
> > I think makedumpfile could refuse to capture a dump if userspace memory
> > is requested to enforce this.
> 
> Yeah, it will be tricky once we support placing other memory on CMA regions.
> E.g., there was the discussion of making some slab allocations movable.
> 
> But probably, in such a configuration, we would later simply refuse to
> active CMA kdump.

Or we can make the kdump CMA region more special and only allow
GFP_HIGHUSER_MOVABLE allocations from that. Anyaway I think we should
deal with this once we get there.
 
> > > The whole "Direct I/O takes max 1s" part is a bit shaky. Maybe it could be
> > > configurable how long to wait? 10s is certainly "safer".
> > 
> > Quite honestly we will never know and rather than making this
> > configurable I would go with reasonably large. Couple of seconds
> > certainly do not matter for the kdump situations but I would go as far
> > as minutes.
> 
> I recall that somebody raised that kdump downtime might be problematic
> (might affect service downtime?).
> 
> So I would just add a kconfig option with a default of 10s.

kconfig option usually doesn't really work for distro kernels. I am
personally not really keen on having a tuning knob because there is a
risk of cargo cult based tuning we have seen in other areas. That might
make it hard to remove the knob later on. Fundamentally we should have 2
situations though. Either we know that the HW is sane and then we
shouldn't really need any sleep or the HW might misbehave and then we
need to wait _some_ time. If our initial guess is incorrect then we can
always increase it and we would learn about that through bug reports.

All that being said I would go with an additional parameter to the
kdump cma setup - e.g. cma_sane_dma that would skip waiting and use 10s
otherwise. That would make the optimized behavior opt in, we do not need
to support all sorts of timeouts and also learn if this is not
sufficient.

Makes sense?
-- 
Michal Hocko
SUSE Labs
