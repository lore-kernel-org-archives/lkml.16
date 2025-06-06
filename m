Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3B3234
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215037; cv=none; b=pSrGZiK1aCAhflQEwTaGMp2T2dz98wlsggyvBMLVcsFHs+Zs4/MXkCrAB6Vagypf2xRtYm4cM9baUja1OAiTVm7X4nuS2BDPn27s2SOJ3oZWkVkWcvLKWOVfCVfkPOGK/IDB1Xdh6o8LmrjWoqkNfD7LxFSZqrTC3b1u/C7I7Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215037; c=relaxed/simple;
	bh=6jsVoGWo/dSumAGNOxr7UqFGaeO67eYLVmbBwUc5Zos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsXvVxJcqdvbIF9nY1JmAgTWjJXeqPDmIoJmUjqIleUutiEY04+XEyj5ExFOHJPHCk0nQtp6KXz1mog+lv0Gmu/B5UHoekQw65cFxfUJBI9IbOiOwlOeM7ujl+h8mmiX+HB/MttEh2ob3FK30Jtp/qQmFYkYEbTx+n/j70c4vwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmIzByxE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmIzByxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749215034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HArWEAkGZW4SwR4M4QK2P5FGuqV07y/wP1+Sj+8Jiv8=;
	b=ZmIzByxEBd9h3xSVfz7lMfcoNvu7mm0WozdKdn5P7/nPuANo3Vq28Y7gSOf8U+K3+dsVS8
	vLvyQQM4/zq+FoPeAUuLACXO9V/MO16yDqvtKsUB5VvxiTysOhL+jj1OPhsLgIY+/AaWGM
	ZRAUzfhoSpyDhWLDajtUpfbesmEsPss=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-UhNdEOdCMZ20aWQ4sm_L4w-1; Fri, 06 Jun 2025 09:03:52 -0400
X-MC-Unique: UhNdEOdCMZ20aWQ4sm_L4w-1
X-Mimecast-MFC-AGG-ID: UhNdEOdCMZ20aWQ4sm_L4w_1749215032
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6face35aad6so19183236d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749215032; x=1749819832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HArWEAkGZW4SwR4M4QK2P5FGuqV07y/wP1+Sj+8Jiv8=;
        b=Q3Z37ncyYgVr9TahVYoByda+LNkGMaJtxXD8u1MGzFJ0U8a2b2J+bEbHVE+L7em5gf
         gNu5euEBCOuWurUzUrpZMCGZ14hlMQ79KMVHjrpg2KxDA/WuzoesmJH3KEIm518xBOxf
         P2a0GquuO0ztkpNpzduXIZXoJhxPHfdfKhDqEJomae+/E7jipcZay9n+j17mrqi0hCsd
         WQlFbAuWk/7WZiTWdSr4W4WnG6zP0yQPfTTe+56t6pm3Gf9IMZymDoJMmjAfjaXWrVxp
         u69+Pq+H7wm+ikDGStzBkhSmA3aQNY4EVLxsMvF9Gai5JNSoolKob7DOPvHvU1XRG1/z
         QHxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3z5jcqZyOn13EuMT9i7hAM1huLeH3w8HYoEjPVDD3Gu+roMFaU6NDl4Z2cUJhzTmFGslPJ4TnODmfB2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zUubHRAJ6ct1H5FtDHULbFwx2QcabGoKo3yOxY77gcwveUBv
	WTw9xUHaPzKQRmswn4XUEDoDuG9N60e+MGhXUW1sXzkQ0rjyLI8bfjQSdOV/UIhVoDeMSZIOLcr
	i/Kd0bwMs0aLuxdf+jfX/26QgL1hfTQbbNEtYBqGFFbwMK0iL/gSTBOU3wyO6HrDKcA==
X-Gm-Gg: ASbGncsK6MDG3oRRcMgXtdk6oLjQaqfQRFlGKtImNn/0Wg9v/mbIYSVcmL8r5gpNLWO
	T0wFVZhetpL8+ihiQuMBD+6CxSA06lBflD0B0HwmGJew+t1HhgSVDV1IOY6yexrmKuHm4M2kBjM
	dD5/WTOayhylR6TZLmrKR0JEjqUaxJGzYT+8GoeXQasvQupv/6sdPd3J4Bg2zk1vIba8RdycbjA
	FHAT9PbShl6Tevi3Ea0EM8nGHY0pmEdiF7dYZOpLh0veGOHkXYIqRsyZnayBcz4K5hv64yVXe83
	a7c=
X-Received: by 2002:a05:6214:21ad:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6fb08f4307amr50047306d6.4.1749215032192;
        Fri, 06 Jun 2025 06:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BHHM9w2tx8ul52pjQVd+s0UKMZd6LqtfDIdl4wDxhdTCW98c/Y1W4GzTHfIwhEhwfgDeWw==
X-Received: by 2002:a05:6214:21ad:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6fb08f4307amr50046486d6.4.1749215031425;
        Fri, 06 Jun 2025 06:03:51 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ab8a19sm10972746d6.8.2025.06.06.06.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:03:50 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:03:48 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Tal Zussman <tz2294@columbia.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Pavel Emelyanov <xemul@parallels.com>,
	Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/3] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
Message-ID: <aELnNH5LTFHmtdfQ@x1.local>
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu>
 <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>
 <aEBhqz1UgpP8d9hG@x1.local>
 <0a1dab1c-80d2-436f-857f-734d95939aec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a1dab1c-80d2-436f-857f-734d95939aec@redhat.com>

On Thu, Jun 05, 2025 at 11:06:38PM +0200, David Hildenbrand wrote:
> Not sure if relevant, but consider the following:
> 
> an app being controlled by another process using userfaultfd.
> 
> The app itself can "escape" uffd control of the other process by simply
> creating a userfaultfd and unregistering VMAs.

IMHO it's okay if it's intentional by the child. E.g., even after this
patch, the child, if intentional, can also mmap() a new VMA on top of the
uffd tracked region to stop being trapped by the parent.  The parent might
still get a UNMAP event if registered, but it'll not be able to track the
new VMAs mapped.

Thanks,

-- 
Peter Xu

