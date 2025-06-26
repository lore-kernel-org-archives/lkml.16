Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3331D267F53
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750962515; cv=none; b=MaPUMVlF+s65hOsOGPoZbzZLy7YP+HljvYZ2d2KelD6KhPhGipCDmM728kj9sRdTbkr6MOWfQYV2/wxXV53j90JUqD4Yto9q94f/nwxS1r/Vo5+DrmSempkL9GcojxG0q7BLRt1yJTHHcl1IpJ9ekDCeQ9gQdX7GQcCZMjJviyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750962515; c=relaxed/simple;
	bh=CxxHu059Ip3Gb+b13aZDweRP9JMPbhaED+WqXDkeXe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvFMAeFvH4PYwcF5kIimFI+HxYryOaIFQ6cwgxMqrH8u41zd4yEd79dmBXOPlBY6iHi0mlC4zxwW6UuY96DLjrvwits5kR6KX0cOAxQQM7AajXdzdDwmpcbnOEmqlPSyTRm/Qiackcwp0D6PZwj0PyiGsGDv3Q4Qw80eT+po3Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWIWqK/Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWIWqK/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750962513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ov4Qfp9MektJ9nsSeT7fzwz52P8rVreuDPUuWKEhKo=;
	b=RWIWqK/Qz6JE5afFDIhBGq4VNjQltF23Psoa8HzASUQX6kZIiMZpvrBC00Kc4i3nPstoPK
	N/vB3X+yrunGwr3DLj+ET3/5ng/1LCAMEvIajQ9uir4yO15aCX2hSsCanmD42IrvD+/A9m
	nOPNHYVEgASWFrQPOo8O1+SNjTwS7BM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-P5vKH-BVPZuQOFRVqNVx7g-1; Thu, 26 Jun 2025 14:28:31 -0400
X-MC-Unique: P5vKH-BVPZuQOFRVqNVx7g-1
X-Mimecast-MFC-AGG-ID: P5vKH-BVPZuQOFRVqNVx7g_1750962511
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad9167e4cso25087436d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962511; x=1751567311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ov4Qfp9MektJ9nsSeT7fzwz52P8rVreuDPUuWKEhKo=;
        b=TwRVFcQNDtEgEa77z+rt49njheReNLWTO61bKwAJiFNkJqWSpSCZip0jW3xbHfrUMb
         hGHXHf5cty4R2kKk6/MAzSWlzbsIxLt9fiWsdMvFsBAe0aJsQXIKSlej/mIl1ogBFXGv
         g04LoLEH/+4FZeA2bIH/bobbWg5WQGzKgHS74mv/t9Y7gK6GO8+u2jF4t3VFXWFQNqF4
         GTs1B4bIBVa5SEbNmsp5q0LzX6GyXaur3Rqr6rqOF9yarUJHRD1lxxQmk9ji4CcCkAKm
         WaLqg3Z4gGclnXHJOet9w2R6KdeSZL2Ywv4sLaGOGdQIxc8UQge8TML5ZXjhFHDTqYES
         1wig==
X-Gm-Message-State: AOJu0Yy/QT/6YW0kkXgKqaBPwol8bo6LF4WUsXngtmFS3V9qJGGIpppq
	PaCxf4dsE0PRwZ+EMgK3opjhHIYHxOzwbROEwqF4mgr8H9HNPT4UI/yDE+KsmUB05WpAI1iHQHC
	vaWyNK4vsgBSuQiouKTWWYRmr2iXHYg4MG8UkdGHZrR8ymMMexNrusYPq/xD4psqH8A==
X-Gm-Gg: ASbGncuSNe1uDa2cxXZHCxXfKGCTP4Ctw1cHsyxVk+E9WGiXkwCLC0HwxgMGOMC11IW
	0aIT6yP8nhwZTLbOGOXpdhUepKfDVipNsUDlwYqGk7o7dXshIxikgDXpEDPgpagy1HCX6zK7kr5
	hmVnPmjURl0NF6G4sDo1fNhtGVSWVTGKPyMQ/45b2Ice8l89ItLgZ+SMsSi4BzyT6fKiWC7g42H
	WCBqJ2qMjm83qjx578aYgzNAft3aguO1vIHOR7WYlEWtGtSE1N5qnVZCwgZXsSkmZEdFjiSaCOb
	nqOZ9b8LKyT1Gw==
X-Received: by 2002:ad4:5ba1:0:b0:6fa:fb7d:6e4c with SMTP id 6a1803df08f44-70002152d40mr9739146d6.25.1750962511078;
        Thu, 26 Jun 2025 11:28:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV+2skYgdvy+Y9xdfWy6mAPgCBWnYkgHMsns9U7YqlRGI3AQZf37a5W8SXZBpDauurnthQFA==
X-Received: by 2002:ad4:5ba1:0:b0:6fa:fb7d:6e4c with SMTP id 6a1803df08f44-70002152d40mr9738656d6.25.1750962510377;
        Thu, 26 Jun 2025 11:28:30 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718e0afsm10507856d6.13.2025.06.26.11.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:28:29 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:28:26 -0400
From: Peter Xu <peterx@redhat.com>
To: Axel Rasmussen <axelrasmussen@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	David Hildenbrand <david@redhat.com>, shuah@kernel.org,
	jackmanb@google.com
Subject: Re: [PATCH] selftests/mm: Reduce uffd-unit-test poison test to
 minimum
Message-ID: <aF2RSsjuEOtzXcUa@x1.local>
References: <20250620150058.1729489-1-peterx@redhat.com>
 <CAJHvVchZHQCQnO48Q3OhTPYncZdXSoBc1CK-CHz_XAOO+CL9gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJHvVchZHQCQnO48Q3OhTPYncZdXSoBc1CK-CHz_XAOO+CL9gA@mail.gmail.com>

On Thu, Jun 26, 2025 at 10:32:20AM -0700, Axel Rasmussen wrote:
> On Fri, Jun 20, 2025 at 8:01 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > The test will still generate quite some unwanted MCE error messages to
> > syslog.  There was old proposal ratelimiting the MCE messages from kernel,
> > but that has risk of hiding real useful information on production systems.
> >
> > We can at least reduce the test to minimum to not over-pollute dmesg,
> > however trying to not lose its coverage too much.
> >
> > Cc: Axel Rasmussen <axelrasmussen@google.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Besides a small nitpick you can take:
> 
> Reviewed-by: Axel Rasmussen <axelrasmussen@google.com>

Thanks, Axel.

> 
> Making the functional tests small makes sense to me, especially for
> poisoning. Only reason to use a huge number of pages is if we're
> trying to stress racy bugs or so, but really for that you'd want even
> more pages / more threads / run for a longer time. It makes sense to
> separate that use case out / maybe not run it by default, and leave
> the functional tests small + fast.

IIUC the major complain from others are the pollutions in the dmesg.  And
yes, it's also slow and IIUC it's because of the messages piped, at least
when I ran it in VMs with a serial console.

> 
> > ---
> >  tools/testing/selftests/mm/uffd-unit-tests.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> > index c73fd5d455c8..39b3fd1b7bf2 100644
> > --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> > +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> > @@ -1027,6 +1027,9 @@ static void uffd_poison_handle_fault(
> >                 do_uffdio_poison(uffd, offset);
> >  }
> >
> > +/* Make sure to cover odd/even, and minimum duplications */
> > +#define  UFFD_POISON_TEST_NPAGES  4
> > +
> >  static void uffd_poison_test(uffd_test_args_t *targs)
> >  {
> >         pthread_t uffd_mon;
> > @@ -1034,12 +1037,17 @@ static void uffd_poison_test(uffd_test_args_t *targs)
> >         struct uffd_args args = { 0 };
> >         struct sigaction act = { 0 };
> >         unsigned long nr_sigbus = 0;
> > -       unsigned long nr;
> > +       unsigned long nr, poison_pages = UFFD_POISON_TEST_NPAGES;
> > +
> > +       if (nr_pages < poison_pages) {
> > +               uffd_test_skip("Too less pages for POISON test");
> 
> I think "Too few pages for POISON test" is more grammatically correct.

Right..  This is currently in mm-unstable.  Andrew, would you mind take
below as a fixup?  TIA!

===8<===

commit 810f5674e1b990775600ffca533dbf75505adbef (HEAD -> test-poison)
Author: Peter Xu <peterx@redhat.com>
Date:   Thu Jun 26 14:22:21 2025 -0400

    fixup! selftests/mm: reduce uffd-unit-test poison test to minimum
    
    Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 39b3fd1b7bf2..50501b38e34e 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1040,7 +1040,7 @@ static void uffd_poison_test(uffd_test_args_t *targs)
        unsigned long nr, poison_pages = UFFD_POISON_TEST_NPAGES;
 
        if (nr_pages < poison_pages) {
-               uffd_test_skip("Too less pages for POISON test");
+               uffd_test_skip("Too few pages for POISON test");
                return;
        }

-- 
Peter Xu

