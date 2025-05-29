Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D1C20B80C
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748487492; cv=none; b=MxUXrFb0Zw051SF2lS/bCoRRIHu6tL99l2XwVj36PpG53GFUhoU+khONJxpXapI786MvtjsY+VfrL6qkLqMHMx+Sji0/8zNulak1fmC4dzCiquImtfTQCq3a1ZeWfZVlANxCh3OCFU1SUNKFmOrtDIlcP4ZMGlMJqLsdvLAviBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748487492; c=relaxed/simple;
	bh=rpoEA0roPA/6WnDuf+djP3mNqirr541LfjalROplITo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6vsxSx3zBJLDSf3FRpQXRSfxfUM6fUn0rqqqfqtutE+oHpl0iDNTAYHdai8fRcBLTTG7J9i4LO+dD+YHCHmm+CEeyqnDVsD3aq6ExrQ59hKW9+a68yEfU3dvw2vhmGfwtm9YJypAZLifgHm3nlT1bPMSXheCwoePqkIf2tPm8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LsqsPTw3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LsqsPTw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748487488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhOTjzJrPC2AOwQMqb7KHh6NpQfzO802QIZm6oK5pK0=;
	b=LsqsPTw3i4jNrM2D0qgMIIJLh7DavVMbQCjhdRLMVPvPZfCyj6lQmgnM6lkBgo8NKdWY5U
	RvXH19pM2venYcaBkM1REOC2Jwky03rUsgetqV2lWCNHep6u4cI1NGhWFWZTTHdOZZK2E5
	9DwdCzE0S/nWVuAVnmQMhT+2lD9lsFw=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-PKakjLBWOOqJujLNOAr8kQ-1; Wed, 28 May 2025 22:58:07 -0400
X-MC-Unique: PKakjLBWOOqJujLNOAr8kQ-1
X-Mimecast-MFC-AGG-ID: PKakjLBWOOqJujLNOAr8kQ_1748487486
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3dca26b6e0bso261925ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748487486; x=1749092286;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JhOTjzJrPC2AOwQMqb7KHh6NpQfzO802QIZm6oK5pK0=;
        b=gcVTbUjQE/GQpEssgyVTKDkGLi/8dqQNPlcNS1iWc7AHSNbFT0bx6XTP9tdeaK65lJ
         R+65nAXwPObW/QceOPRVPvrLoHv2eFqqCbiBsaJlygCjAZL7Qhngqbnhjtq2fEXY+kCy
         92oAiOEg3ibHqpP4OjZEUYXDfgjFRkUGQDIVfgbdm9Gq1Amwe4iH3KKFQ71Trh0o4sfL
         FfaunStqB2yg/sDo4QOvL3IctubEi3kwskcllQgqcKFDFULJBzAewoCQv49Ldl905fnc
         hxcpmTrZQfV/OhcuugfYFr9wUH8QqBas7xbhP6Hv+z8/DqUlxlqGkZHys2qLQflacyxa
         96aA==
X-Forwarded-Encrypted: i=1; AJvYcCXsqwRE0NFzgawSiLsnlx7b+HFYLP3HT93g7p46dJW+kJNJuZFafN0L+1ttxGTmwj077snAGtp5jtKzUmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH1olPbbvtRNYEYlS5D/Q+dzmQ0Q0hrAz6WzVHLBXJtWbOrbzJ
	wdm6cyBngiF3VT+IhdY30gbcRTLYkzxoxsxSZDMbKPpuYsu7anO/ONHHxQiS1QZlMfwTQQz15l5
	lTI2jaRxjpYZdZrM7hnGAF8PdFdQ9zORh7GONWQecmHbINJY/KvFaVet5dDzWy5ZtHA==
X-Gm-Gg: ASbGncvTeDVMNy7bgb5EmTwV4MqSTDy9khj7YHgTR5H345SqJ3TwBcdFcFqd1xn6/YJ
	lbNwMlXEfcDCNKRt1yyxLIL2ZOtsKluFDEviCyN6F2HluuoKoETws4T7EukCXyjR8G51KcfO51J
	yT5aszQ1IoqgE0Qzb1S6xl0QqcfP7EJJ3kchWeVjQERWH1/8KqKdkBp8+pSJQ6ooQ/Q/1YrDb0o
	5CkE/csObZ/iyPlR762oLQjIgqZTpHEJ3gBh0PucGTed8yC93RbNLguRyPYT5B+CQYVukccxIc3
	FSYiQ3c/R0ca0WM=
X-Received: by 2002:a92:c24b:0:b0:3dd:929f:87c2 with SMTP id e9e14a558f8ab-3dd929f8a5dmr5146905ab.7.1748487486193;
        Wed, 28 May 2025 19:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb9GEkjqdTNwnQ3NojrRwht7jJ0rh2LGkVZ67MSilHKitPlGwHazNwznnW4jK5o90PouRrxA==
X-Received: by 2002:a92:c24b:0:b0:3dd:929f:87c2 with SMTP id e9e14a558f8ab-3dd929f8a5dmr5146855ab.7.1748487485817;
        Wed, 28 May 2025 19:58:05 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdbd4bb4d1sm495356173.57.2025.05.28.19.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 19:58:04 -0700 (PDT)
Date: Wed, 28 May 2025 20:58:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: David Hildenbrand <david@redhat.com>, lizhe.67@bytedance.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for
 huge folio
Message-ID: <20250528205802.4afb3a1b.alex.williamson@redhat.com>
In-Reply-To: <20250529005147.GC192517@ziepe.ca>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
	<3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
	<20250520162125.772d003f.alex.williamson@redhat.com>
	<ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
	<20250521105512.4d43640a.alex.williamson@redhat.com>
	<20250526201955.GI12328@ziepe.ca>
	<20250527135252.7a7cfe21.alex.williamson@redhat.com>
	<20250527234627.GB146260@ziepe.ca>
	<20250528140941.151b2f70.alex.williamson@redhat.com>
	<20250529005147.GC192517@ziepe.ca>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 May 2025 21:51:47 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Wed, May 28, 2025 at 02:09:41PM -0600, Alex Williamson wrote:
> 
> > To be fair to libvirt, we'd really like libvirt to make use of iommufd
> > whenever it's available, but without feature parity this would break
> > users.    
> 
> If people ask there should be no issue with making API functionality
> discoverable with a query command of some kind. Alot of new stuff is
> already discoverable by invoking an ioctl with bogus arguments and
> checking for EOPNOTSUPP/ENOTTY.
> 
> But most likely P2P will use the same ioctl as memfd so it will not
> work that way.
> 
> So for now libvirt could assume no P2P support in iommufd. A simple
> algorithm would be to look for more than 1 VFIO device. Or add an xml
> "disable P2P" which is a useful thing anyhow.

Hotplug is always a problem if we make assumptions based on device
counts.  Thanks,

Alex

