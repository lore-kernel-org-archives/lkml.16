Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180724A076
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760398; cv=none; b=qRfQbE83C2CV3K4I7TFI+u7vE7Z0hzfwG5OcRZg2eU/pFjIcpSU9ORHlZfRzR1bOftEUAdGfKtakV0Wb2yALUxyTYLZ8RtjP7/rE346OEwUySVwqi7ruI1ry0e/L2r08BHRc4sdOkGWqujvOqviyjVonwfVNrnWpT9ca9BxXvDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760398; c=relaxed/simple;
	bh=Jh2BvARYgXxOW9h9dO25z5GwMY969hNL4tjAnGB4lfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVKJ2YkTmmM3VMrWbcDy9SZ4ippMRyk4XKp7y14YBoO5wTZbPFb3dApo9ACNmmXq7hdvtsBBfzTtaNyKeYU+GsGGjjsBjY0strO5iQUPW5sfewpt8x7UBOmWlBwcxKYvONG7NdbV8fyA/U8U3FmTMcwafkLiWnWjOxXqtlPfBw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UB2wxhWv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UB2wxhWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747760395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEMj9V3JwMyZ4OkKJP+U49jj1V+/NAmehjsFGeGy4Gg=;
	b=UB2wxhWvSuqbupGZOJmeaYrrxgt3U3Bwkc35cqfuNX6PGPm2w9rWAwE61pVhH1sD1UoNI7
	OPj1zoYUuzke7R69q/0Ia/jkMDmhXYhJUL9g9IGHpmW6Raz8U69x91Y80faKcMbmJsJfAk
	pHuYWUwxU3BMmrvB90EJPdclKYjLCu0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-RFNBKapqPPiw2B0g3djiBQ-1; Tue, 20 May 2025 12:59:52 -0400
X-MC-Unique: RFNBKapqPPiw2B0g3djiBQ-1
X-Mimecast-MFC-AGG-ID: RFNBKapqPPiw2B0g3djiBQ_1747760392
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c9552514so52242036d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747760392; x=1748365192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEMj9V3JwMyZ4OkKJP+U49jj1V+/NAmehjsFGeGy4Gg=;
        b=P6aUSljzgUFe0FydaDphzbpq1JhoeGAYZHK5pN+Ba2Ww6YC20tN3R6RhCsifzJPBTb
         dzSXh16KpgVwhO8h/RS7pAjaaGYiRgN4EgFZh+TAQbfXg+S2Bh1+cp8dECREu4YTcnK7
         v56C6iZAU2Ca0dx1A7h899h5tITU8S9FISxJBOEgvZquutnnyZP++wDQdHa0zd5oQx+1
         sBJrNbAbrTZooqFCX4lbiNqcGjCFGr5N0qkXFXAY6sc5MSQvcF13nlM7k8VF/LFqmION
         o/7u1k/Y+pXmV1/j8PcgJ8DewFmcOLvQ+nNy6+kYp6afGwS0iyl9LGKcn7hxuue36Qky
         KRtA==
X-Forwarded-Encrypted: i=1; AJvYcCVbn7SAbYtAYVzuAybRBxjxG8NiZtHmYAdPhNO+WysESdoIj80hQvZ57dJwVotA7agAj13wF4oZCZ1aQI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYZ/Skaj2TQ1wOnIy/0+ktl9zSD9QR688vkIDILkdqsJKFDz7o
	/rL6ADyC5FyXZoKbuW1r1aSXUSfqDB6ICT5XO/ULoFp1wjvh+0JEUrMMWYa6o/4/UBxdY7Wz8OA
	urpPMIbPDftsFOh+MnjsYFmBco8PZRQBmy9RcVVRYa0hI4KcvZTPm7lpHdl7/zXDBww==
X-Gm-Gg: ASbGncvWlnb8yxE2TaeZLIvJ+fcRzwkjQE8ixz2tzjXonav89PrT071S6DBJZCzI1GE
	3X+orUcoQdrLIhDYh2EBFBN/XQgcysmY0hOQ15hpFIZGW12itLod1Hh53+d7l8l/HpQLXsFcYUi
	dz00VWFr+BkrL8e9mred0mOkmtcQHUc4/xak3Jpxy1Wd4z48mxLuJ7tW0zY0JiXDFxaT8xPUz+M
	1tHCYJQHexpvkRSTZRkICJZDklq3G0WJ6kelRsdfWvXfaQPr32ILek/9/ncu62lcVzjZm0jLYmm
	Ty4=
X-Received: by 2002:a05:6214:33c7:b0:6f8:ca09:d60f with SMTP id 6a1803df08f44-6f8ca09d764mr183451746d6.10.1747760392249;
        Tue, 20 May 2025 09:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9IfWJXFVUh9zlVq3n1AuEKD6UqJhdqI6hkbwqQIr3nDPfW3C8vHTS4HJ61qbW6AJWrPiEAw==
X-Received: by 2002:a05:6214:33c7:b0:6f8:ca09:d60f with SMTP id 6a1803df08f44-6f8ca09d764mr183451476d6.10.1747760391869;
        Tue, 20 May 2025 09:59:51 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08aed47sm73634666d6.50.2025.05.20.09.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 09:59:51 -0700 (PDT)
Date: Tue, 20 May 2025 12:59:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: lizhe.67@bytedance.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, muchun.song@linux.dev,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for huge
 folio
Message-ID: <aCy1AzYFyo4Ma1Z1@x1.local>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
 <20250520080719.2862017e.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520080719.2862017e.alex.williamson@redhat.com>

Hi, Alex,

On Tue, May 20, 2025 at 08:07:19AM -0600, Alex Williamson wrote:
> Peter, David, if you wouldn't mind double checking the folio usage
> here, I'd appreciate it.  The underlying assumption used here is that
> folios always have physically contiguous pages, so we can increment at
> the remainder of the folio_nr_pages() rather than iterate each page.

Yes I think so.  E.g., there's comment above folio definition too:

/**
 * struct folio - Represents a contiguous set of bytes.
 * ...
 * A folio is a physically, virtually and logically contiguous set
 * of bytes...
 */

For 1G, I wonder if in the future vfio can also use memfd_pin_folios()
internally when possible, e.g. after stumbled on top of a hugetlb folio
when filling the batch.

Thanks,

-- 
Peter Xu

