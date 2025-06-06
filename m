Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39526288C37
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749216297; cv=none; b=WGuoyjJzGpuSw7ddFzkyKBADH9XKDjKUDMOFnOEUanZnephqH06vN9Tkv+P/n1q0SzZz135HpNtTkHzKWUhWUf/JEDp7yA+3p1i4J1HUCLgOfgSuxeqHvHWZ236XJoyfpMRfEg0GWaOBn9BFYIQy9aaU5XUIp0Y0T4r/nvYMHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749216297; c=relaxed/simple;
	bh=XaUFchsTlj47ki7jmwSOkGfvA6QoHDzYcRN06zVBsh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=si/dP7ZUTRUj3SbL1abCEZda+j03ooAeXjVSwD/vx/SNFR9R87VfgE5U4yODwS8kwpuxglQ7XDF+QUeCgsycC16wQ7/X/JXcOYAAjGJmkq2X9e5uMtfvlMVb8gD5RTeTOW8C3fX8lGs+H2HsvYhsNITKsA2XLOitSyaHcK89bWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bMeXzgKt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bMeXzgKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749216295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ky+WeROHZ4Ae+uVfELGBGltSg87Rkj3Uw9xYsa9j3qg=;
	b=bMeXzgKtFZH5L+oZf1hFR+XQI6E8Tbd/sEYeWgE75j5Rs4jXghP8SAo4wlrfFI16vuJtk+
	LVSjAOXGf2EaHjNJuxT8dlTk3E6Oj6qFWAg0XUnZztTdhFpWZxmFZp1brkqiUSsPTAIbav
	PSrrx4kbcrTWiMhLzJVQChORU/XrmWQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-UTzIust-MY2jkAHA4zm9DA-1; Fri, 06 Jun 2025 09:24:54 -0400
X-MC-Unique: UTzIust-MY2jkAHA4zm9DA-1
X-Mimecast-MFC-AGG-ID: UTzIust-MY2jkAHA4zm9DA_1749216294
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0962035b7so355967085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749216294; x=1749821094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky+WeROHZ4Ae+uVfELGBGltSg87Rkj3Uw9xYsa9j3qg=;
        b=OX/Jp8/ulewqUl6DJ6FD06Xcr6O7lJLWCCoWbszIDRiX8Yu+sa+Ecwwpul1I18ZroA
         MFdjWgAU1U/9qmhdxRrHEkgLXVR7E6kRAHIVNc36HaUGWkI+4WXzet6nJlF5r6R9PXze
         XzAJtYoIRHemXnonvrOj5Jl/QZBnrsblpS0ZUJe3hyoYCvdKFJBEvRWvYs7Mf1lPaAC2
         V23hgr16tV4Q7Hxus0lD2/IfblAojbwZfzTZAN+Sg4waVL5XEpcbIQ12LKG7QlpIM2XE
         mN55nD+y2YiVstRgKtNrklyk/Nc+yYQxTHA1xifajqpsZAAPXxsE8VeI2wsiVhGsgzCv
         GPgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbjzQNzXsJCNbZX/B0ptadtuF6m5n8g9TJL5UI40vOtJOc2obo0kCRsV70OWmm7QDrUDyRzcqndJO8pS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTvy7/RW79n1Snpz1R0l+YYSpzB77QIylrZo3pBM2OISTnQoM
	hKM6zXvlKROsbr/kJN4Yvm0jgNrsZvmWfU+KwLCvdLF4FzdoadQZVhYpFnzQrXRg9n104rOuGgi
	mIXBrcRhpB06UAQlUiKuFqCejxP5LIQ9yUhcEaG/w6QY/CGdpQ2bKKJGBX2hi4wxO6Q==
X-Gm-Gg: ASbGncvg2jldj4P4MEGjtf3b07JaM00Y7hsefXz3UFNpus81jAqNja78UPFfAMNGb7j
	prTPKCxhk1X2UjNcH6UcakFNNg53lVdKgOg0vWpiE9qD5hapviVBLXlFj1dYxNOqAl+5FJeWzhT
	Ezb0dS3dZvchqLY664DZrwDfdpDuT7vBQBH1uaBQvQUpUKGivp/+PrX5hJ7pgHImBwWV4H+iY08
	JOqFLPLw74O2tHk/AXNTqyX6O7dva/IjjFNXWcCWJ7nQJ7fY2RHmwaLPX6wwtTFpt0mOuN8JnDE
	8g8=
X-Received: by 2002:a05:620a:2608:b0:7d0:9688:b650 with SMTP id af79cd13be357-7d22990277cmr623270885a.54.1749216293751;
        Fri, 06 Jun 2025 06:24:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyw7rhIbtMEbMw7aXS5kBcEv8c0niayT/VMXPsAHzS6JTC/rav5RqlYy0t+iQ6S4rhlqvdfA==
X-Received: by 2002:a05:620a:2608:b0:7d0:9688:b650 with SMTP id af79cd13be357-7d22990277cmr623265985a.54.1749216293377;
        Fri, 06 Jun 2025 06:24:53 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a5948f8sm129289485a.49.2025.06.06.06.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:24:52 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:24:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 2/3] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
Message-ID: <aELsIq2uOT5d1Tng@x1.local>
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu>
 <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>
 <aEBhqz1UgpP8d9hG@x1.local>
 <CAKha_sqFV_0TsM1NgwtYYY0=ouDjkO7OOZc2WsR0X5hK5AUOJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKha_sqFV_0TsM1NgwtYYY0=ouDjkO7OOZc2WsR0X5hK5AUOJA@mail.gmail.com>

On Thu, Jun 05, 2025 at 05:11:53PM -0400, Tal Zussman wrote:
> On Wed, Jun 4, 2025 at 11:10 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Wed, Jun 04, 2025 at 03:23:38PM +0200, David Hildenbrand wrote:
> > > On 04.06.25 00:14, Tal Zussman wrote:
> > > > Currently, a VMA registered with a uffd can be unregistered through a
> > > > different uffd asssociated with the same mm_struct.
> > > >
> > > > Change this behavior to be stricter by requiring VMAs to be unregistered
> > > > through the same uffd they were registered with.
> > > >
> > > > While at it, correct the comment for the no userfaultfd case. This seems
> > > > to be a copy-paste artifact from the analagous userfaultfd_register()
> > > > check.
> > >
> > > I consider it a BUG that should be fixed. Hoping Peter can share his
> > > opinion.
> >
> > Agree it smells like unintentional, it's just that the man page indeed
> > didn't mention what would happen if the userfaultfd isn't the one got
> > registered but only requesting them to be "compatible".
> >
> > DESCRIPTION
> >        Unregister a memory address range from userfaultfd.  The pages in
> >        the range must be “compatible” (see UFFDIO_REGISTER(2const)).
> >
> > So it sounds still possible if we have existing userapp creating multiple
> > userfaultfds (for example, for scalability reasons on using multiple
> > queues) to manage its own mm address space, one uffd in charge of a portion
> > of VMAs, then it can randomly take one userfaultfd to do unregistrations.
> > Such might break.
> 
> As I mentioned in my response to James, it seems like the existing behavior
> is broken as well, due to the following in in userfaultfd_unregister():
> 
>     if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
>             goto out_unlock;
> 
> where wp_async is derived from ctx, not cur.
> 
> Pasting here:
> 
> This also seems to indicate that the current behavior is broken and may reject
> unregistering some VMAs incorrectly. For example, a file-backed VMA registered
> with `wp_async` and UFFD_WP cannot be unregistered through a VMA that does not
> have `wp_async` set.

This is true.  Meanwhile it seems untrivial to fix the flag alone with the
prior per-vma loop to check compatibility.  We could drop the prior check
but then it slightly breaks the abi in another way..

Then let's go with the change to see our luck.

Could you mention more things when repost in the commit log?  (1) wp_async
bug, (2) explicitly mention that this is a slight ABI change, and (3) not
needed to backport to stable.

Thanks,

-- 
Peter Xu

