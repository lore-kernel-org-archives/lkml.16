Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D5EEACD
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180962; cv=none; b=EmUFPIcd9+cMUD0nQ5jPa6bZSou4zV6YPwnZl+uQdnm1GJKPGXdaWypd+z4OGdhHIvN2UE/HcDMaBgzQrRzTNdYiRQUCeCHoKTtjlLJE88Rp9swdwqNh1oO0ydjHntTQrbw4AozUuV3lB3V1i2J4iX/ftT/SfIr/QJB+KIj//os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180962; c=relaxed/simple;
	bh=fkSOfdAa8FY7s1fiIR9x8hwRIn5eu9HjdWI0CIobf48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYCCB4Gsgq41wqo7qH3oSDdhzlGL8BvUX+9plUcvhdk/o3hKuubbR9/0dMtXuHs/5D+Hz0CpVERogel0nfhahQk0jFKWWCTScaBkxYWBf0pbOm7uGEK1u7b2iUPK8coXoATlhFlBqHFG/QkMPMgrcc4BcF4dNuyG/qwGeoGd9dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h3OG3ntj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h3OG3ntj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750180959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=34DKIigEpcgfa4tv94Inm/gSRCZZNbs35BdPm5ILfHc=;
	b=h3OG3ntjL0Min7R6XomFqByaPlb76RuMxrt7RreqVQQQL6Pu9YOmibUfNk7I0ggb9yYv82
	wsYgVPR22y0/si14hHNL742aOUi7AYj3fcUmFfgyWe+AMLf3vwuY9H0jvR/gbYtRT0YNSz
	V+bPOFZLbExy3VOt2ll6ZLv1d+CMwCQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-OF-yaW4bMe2mrSFoROJWxA-1; Tue, 17 Jun 2025 13:22:38 -0400
X-MC-Unique: OF-yaW4bMe2mrSFoROJWxA-1
X-Mimecast-MFC-AGG-ID: OF-yaW4bMe2mrSFoROJWxA_1750180957
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7425efba1a3so4911545b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180957; x=1750785757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34DKIigEpcgfa4tv94Inm/gSRCZZNbs35BdPm5ILfHc=;
        b=Lj3KgkZCQdZeUyIrwehC1fnHXjKNNjj3wO5RAVZStkr7N4nEDnumdRThfl2/9a7R8T
         bMHvpP7GIGIiO0McO+Da41IZW5Z7fiZjMJjAcUkVO5QDcLMCWMoqopbJeUlKbY0Q9dq1
         lY4PBAXpNQ2SkOgUtjzuFXX4fQiCtVnFSXonkNXVAtzbnYZkxeIICQFGMDdr0jtLN+m0
         iNvMd47SgBtC5wqBTvtRjzKs9sX4O7Ktp09+k6bBVqJWgBcTDLeVD3lylOU95VbHFtqJ
         1VA+OX5A/h9kYsBbQfYuv32gD7Htc373+ubb4Wp4Mcdi6jUiXLbFhZootkb61hphylTw
         7RYg==
X-Forwarded-Encrypted: i=1; AJvYcCXcIiWLUbjhtHQhv9QXjSPZjOUbigfbmKUUOCn9anuWHYTRr5fbRzeEJWdJTGLz8sJRrQTVqUtxxJkM/iU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70vZ3fFb35d4PTbsUxX3UlaSm3TYB4cfbj5Mdc62TRLXOR0HD
	IhaW+0T6MKiXf5v0PySL6qObJm8P19cSpr+6HxAaoiYtU2582i2zXSaccjm5Akl2W4C4fH6YKWZ
	ikffKF5g61Eejrhnx+4+x6bB4x0MyTehvJT90RXFEBhkM3rU/aMYnPHC1j9OJ96qlBK93rbffFQ
	==
X-Gm-Gg: ASbGncsARTSpoQVwaSDk41NPLqtPzaRxx4YUvB4T3ycZYfu52/x2dlKA585e/Tjg1Fr
	NEqpfAPCpAFgBAxfPZXyVBDsl3NP8bqAQ4TQx27BCogoGU4krMZ13LxGUC7sG4e/I9Bxf6CXKHh
	YuqvyZm+jAGfVyiglojCTvqIL/TdSO75rdBbxiisZA6Xn6W+sSWNN1X/ntsTvKQRj5XmquO19+4
	qHsCeXZ/ZwQeC4614t6mkQ6F8OHuEigzqYG6evZbRIU/JrNl6uGZAw0qoyQmJdJVBVySoUlTCaO
	C1ZHZCja30n3fw==
X-Received: by 2002:a05:6a00:b8b:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-7489c47e470mr18490191b3a.10.1750180956725;
        Tue, 17 Jun 2025 10:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM6/AhfqpvtyHQaLreUDoYWYWZc8npPOOqClxjD7RFi7IF9gRDq4KeeMPXcwtHEi9K0833AA==
X-Received: by 2002:a05:6a00:b8b:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-7489c47e470mr18490157b3a.10.1750180956304;
        Tue, 17 Jun 2025 10:22:36 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083bb2sm9450419b3a.94.2025.06.17.10.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:22:35 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:22:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ujwal Kundur <ujwal.kundur@gmail.com>, shuah@kernel.org,
	jackmanb@google.com, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 1/1] selftests/mm/uffd: Refactor non-composite global
 vars into struct
Message-ID: <aFGkVh-rs2ZqcL6g@x1.local>
References: <20250501163827.2598-1-ujwal.kundur@gmail.com>
 <20250616100406.2853-1-ujwal.kundur@gmail.com>
 <20250616172618.0609127a8b1e406d4c228d24@linux-foundation.org>
 <aFGPVPDKGLOIEucg@x1.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFGPVPDKGLOIEucg@x1.local>

On Tue, Jun 17, 2025 at 11:52:52AM -0400, Peter Xu wrote:
> On Mon, Jun 16, 2025 at 05:26:18PM -0700, Andrew Morton wrote:
> > On Mon, 16 Jun 2025 15:34:06 +0530 Ujwal Kundur <ujwal.kundur@gmail.com> wrote:
> > 
> > > Refactor macros and non-composite global variable definitions into a
> > > struct that is defined at the start of a test and is passed around
> > > instead of relying on global vars.
> > 
> > Well I guess that's nicer.
> > 
> > >  5 files changed, 616 insertions(+), 542 deletions(-)
> > 
> > It needs to be!
> > 
> > Thanks, I'll queue it for testing while Peter thinks about it :)
> 
> I didn't pay much attention on this one as I saw Brandan was actively
> reviewing it, which was great.
> 
> This is definitely an improvement to the test.  Thanks both!

I did give it a quick run today, but I found I hit this:

$ ./uffd-unit-tests
Testing UFFDIO_API (with syscall)... done
Testing UFFDIO_API (with /dev/userfaultfd)... done
Testing register-ioctls on anon... done
ERROR: munmap (errno=22, @uffd-common.c:277)

IIUC it's because after moving most globals to stack, they are not properly
zero-initialized anymore. In this case it failed at MEM_ANON of
register-ioctls test, trying to munmap() some address that will start to be
random garbage since it's on the stack.  So maybe we at least need
something like this?

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index bed96f41c578..0b66ca3e7b82 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1744,7 +1744,7 @@ int main(int argc, char *argv[])
                        mem_type = &mem_types[j];
 
                        /* Initialize global test options */
-                       uffd_global_test_opts_t gopts;
+                       uffd_global_test_opts_t gopts = { 0 };
 
                        gopts.map_shared = mem_type->shared;
                        uffd_test_ops = mem_type->mem_ops;

Even with that, it fails somewhere later.

Ujwal, can you reproduce these issues and have a look?

Thanks,

-- 
Peter Xu

