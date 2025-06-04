Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C82F56
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050234; cv=none; b=NeVuqmJ64mk1HavIi5CygyHSkQBR2M70kwpopcA75IQ0V1vRJ0O1HiMvdNl5wWoo0HpE6Z2N+snsv3qSn9jdRC1Jeq9lcyZlbc4uTlCLltGDCjuZASrblRXMZuXzP1bWdXdwJ5wbmGNYa7f8XiCCFPGzbuP+Z6E9btqroW7tGRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050234; c=relaxed/simple;
	bh=tXH56JHUlfyoRgZiUau7pzUNxZ5GWldWwVrR7Gic760=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyKrwabdAQP1m3uyLlZYJr0k1vuleuqkiiviteJM2wpSqDbf11PVsVFZwziQWHnzxkHwe4/kIKCUr/jVPENCc5wVYYwWebKbyh9Bme4CdaKD8HifkZ9VLeR9/UBEK/qeWIPV7an702cI6VdyrHfv5gAyX0pN58pxuuJP39+PX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8PQgbg0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8PQgbg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749050231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kAdOdBBJjoeMC7x6P8PsA8kBAyLqFtv7E13NLSQh4UI=;
	b=F8PQgbg028cWnr3lXSoOlg+mctu/kuCshbhznluesfnElZnmzyPpUaRFRxbzlJBaFHdQaS
	ZUrbTUu4FY24Jzgn6btPdG/5JYCDqkZWoXAjygi+wPiLWaHwC2rgD5CVy5Xhu1zUljApel
	Qmkghb43WqMd/3zAtnfYnQYTQwN9wFs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-tUukNZ0MNiChSz3109eMDg-1; Wed, 04 Jun 2025 11:17:10 -0400
X-MC-Unique: tUukNZ0MNiChSz3109eMDg-1
X-Mimecast-MFC-AGG-ID: tUukNZ0MNiChSz3109eMDg_1749050230
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0aa9cdecdso416821585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050230; x=1749655030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAdOdBBJjoeMC7x6P8PsA8kBAyLqFtv7E13NLSQh4UI=;
        b=cdw4+SrLAr1FLN5VK/ip8mdtWjIuiJKJCAQ0y6mMIbtG9xHHZv7WinjoDKLRXUr38o
         iR6kduwXWkJ8DVzaP/x3ygOiwCRYoPDjK7RcRzZ7rkzNNjb2kleGTqm7v4sb2JOOwEq4
         4HSU+qmt+6qg5t+5oYd5WzDdgN/Jg3ADzlXk93DbZmMPLhmkifgn/dychNGxl62MOZQi
         0hTgq+xmq4A6qSjvYb2fiziTbOQcISne9cidluiB1cTLPpcxJmxNWX/OlVYT9Ub1xLC8
         KYFoCkKA4n8G4Bo7LMGQIx9lWnfzzjpO9RI9QhHO7BEf0PmUYCgf0KVwsU1C7Wanzehp
         K3pA==
X-Forwarded-Encrypted: i=1; AJvYcCWU6Grg1ibvoJ5A6tfd3WN/esxIsEKo8u+N6ZVyvtJ0uPClykkfj5cAQZU/9aX8IRNM9gwUQJZFnfA4Tus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3lptq7VnJSqdbVCxEMcZpJUTRqezqy7KkCnuC50wz1fXNZtiv
	wmN2vkuWAiUV0GG4AyI+touq6KA73xmNb1O+DFRS4MMsZQUmc6jp+4zr8QEV+zA4lFhjPPA9UFQ
	wbYTnYIlxi4Z8GiPlQps/H4/UDtZVCqXt4pSIoxwRFf5V9J5pKL1TrO3te2CNj89MIw==
X-Gm-Gg: ASbGncu28bVTTtMLQqUxBxjnsIt6yKokt13IXtojsDLQjezYQcQ4lrNZWeBgj1Cd6c+
	OWphHgOiUpF4yCgumq69zhphD2NGo19u3leln3oai10ZMUkgcKJVmZtzl18u81kIQodJQOWETvn
	JLAOSTNoGyl8hF/Kcap7VZ5WQm4RW1Co3lDwlyHAnKb2Dn6Sg6fO7ykKA5vHUz7VoSMuzJX0wuf
	rHFbbUolEzF1v4msQjZHYfrv383ksxKcjGzkuCPWFzh66JBMZWOKHVw7o1GgcSaEo2pUWFq8zZ0
	qc0=
X-Received: by 2002:a05:6214:20c2:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6faf6e6c1dcmr48552136d6.13.1749050229896;
        Wed, 04 Jun 2025 08:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Juz+/OHdwV5pYpuhISYl5xStTVIxTd7k3oUhwd8cUIXT1FVDQ61Tf1SCXJtXAFKxhE9W9Q==
X-Received: by 2002:a05:6214:20c2:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6faf6e6c1dcmr48551666d6.13.1749050229490;
        Wed, 04 Jun 2025 08:17:09 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a1a7579sm1042399285a.106.2025.06.04.08.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:17:09 -0700 (PDT)
Date: Wed, 4 Jun 2025 11:17:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	David Hildenbrand <david@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Pavel Emelyanov <xemul@parallels.com>,
	Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 1/3] userfaultfd: correctly prevent registering
 VM_DROPPABLE regions
Message-ID: <aEBjct3IJiDX-w3P@x1.local>
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-1-9c638c73f047@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603-uffd-fixes-v1-1-9c638c73f047@columbia.edu>

On Tue, Jun 03, 2025 at 06:14:20PM -0400, Tal Zussman wrote:
> vma_can_userfault() masks off non-userfaultfd VM flags from vm_flags.
> The vm_flags & VM_DROPPABLE test will then always be false, incorrectly
> allowing VM_DROPPABLE regions to be registered with userfaultfd.
> 
> Additionally, vm_flags is not guaranteed to correspond to the actual
> VMA's flags. Fix this test by checking the VMA's flags directly.
> 
> Link: https://lore.kernel.org/linux-mm/5a875a3a-2243-4eab-856f-bc53ccfec3ea@redhat.com/
> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

