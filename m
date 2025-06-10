Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B5B1EB5B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571070; cv=none; b=AWkUlfduCbKHq5WuQABCzCR44FpAAq0Aju0s4mtYgDsEs1gFp55KP3X/rHubRlTHX3IT/cOlQEiU9Hi6RoCOehM0nt89/zEoIiiS/yaPYrDVA52l+1OsARrouGrbnRpiZbBJ8HvvllSCNxqEIjsf3lEPj4Z38+Mi/sYWZ+FAqDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571070; c=relaxed/simple;
	bh=Fh2a9ae502uMadM+WpPTJPlaqiFnwOupET+iDiSh9QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYe+tWS/4ddVTj7L9Zp89JUb86FbCi3cjwwiU90qRxKU6uUh1UkTN2vjkx4x9EgMORiQKcIvNCReOhNryvZfhFn2DTeWHg3ldvcLWmja4PU745PCI+ih/4rn9Xp/TO7zfer4frHuAAPXnwcmfAT+sj6/o8Q76s/paCkSbANGPvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xdbt1o8j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xdbt1o8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749571067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uOjCSskmNbeaSFJy6FGRwxS46o+v7MvRvYHyqSTJRjo=;
	b=Xdbt1o8jq29M8p2Jq/y8h0cKZARmlLbjKifMtPk72oR7py4dOQgCsKcqjlasCDPkzhcMx5
	vuVXkiYzui2dw+nyx4jAagCR+WHa2yWT+5wBIEpjNF8E8hpwxsy4uaOWruObaYoSQHJpXK
	lMoPIfSIcZ/XSE7Jr+nmDB6+y5hoVZE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-5LT5T6OhPMiVPcUDR0ibSg-1; Tue, 10 Jun 2025 11:57:46 -0400
X-MC-Unique: 5LT5T6OhPMiVPcUDR0ibSg-1
X-Mimecast-MFC-AGG-ID: 5LT5T6OhPMiVPcUDR0ibSg_1749571066
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a584d0669fso103782741cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571066; x=1750175866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOjCSskmNbeaSFJy6FGRwxS46o+v7MvRvYHyqSTJRjo=;
        b=gcOAugHitjn4KA8CkwAwsDJraDIfa4SlBcU2RJbnMs334QHFdDKtVwn7hKA8iTXGvx
         18xVWmk/dRrW+bAcOfLEurPOs75flTZoO5/ac9ZAVK7T2jiQ0CORhlKFyc4Z5SIvEuEZ
         C9EQycEaKMtC+NPUPavQSdNQStNokT7VKQRJD2wkpv42dFE6k2iQaqH6ds4MJaAr5+ZG
         PPOgCPsdyWFWlMkkPvC9iN1HciZ92bE9teTB1capy08UmMVbo88laL8D9cSpfjEEIm/S
         ZRRqtocNPcIu784wsUbX7Wk8X+gQHLMg+rBUE/UOp+vwsrK0bGSMBcV8bGzZjo2M35Ev
         erpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAVZRXczeLlsF3qJ4F7Xb/cQVLiztSHqO3Nbou8Jo1lqNd14p7tASvR9I0lw03fOLVDa2cehpcvqTHdsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyX2RhWVyetfW0Z2TcD4DkrxV6oMT59SLKei2c0hqinXTpvn/V
	qqOKB2VkRhS5piHCmLzyf33kfHnQ3wO42MPwmEJSUQnFaVuliRM1JgGmKD2LLyC7Lxje9whPc+M
	ZugK1hoAKNjH3p8A4BDnB6WPd4udVWAYQ5YP2TQHSNAi61NAKVJYJmKW9WgjGNqUvoA==
X-Gm-Gg: ASbGncsnotgyzaiR6t2AcHAEbizOwW+8xZ0TRrM+PRVlUreE02vDshBZB/lqgVePRzs
	elC0uJnAH3v5a9sJm/mIEOas7oAQ472LGGPt8EenO17/QtyuoE8Wmd+pTQ2knmNUMETGHTiTaQV
	iKLyXSA9ixGcqXZX/qXd1GlPoVGR1isnjJxxMc0wm2NBeR5UfEwi8eJHXyBDXha+5JG9zrVaQG1
	HJ0jrDfb2xyA9siqOVq4aApIZPpsrl0l0vDKi5cJImXALezXuRneg5TNUxrifETRO6z/ZKbe+3E
	05UWC3Pp2eVRoQ==
X-Received: by 2002:a05:622a:5a14:b0:494:aca0:1116 with SMTP id d75a77b69052e-4a5b9d80efemr293979651cf.38.1749571066050;
        Tue, 10 Jun 2025 08:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6B8UunFSKuMgPqWUZeL52U7fzg9fDDYw+dG6q9S4c1KPZ9vYbGvQ7lVhUS9pC7GX6BgcfBA==
X-Received: by 2002:a05:622a:5a14:b0:494:aca0:1116 with SMTP id d75a77b69052e-4a5b9d80efemr293979411cf.38.1749571065724;
        Tue, 10 Jun 2025 08:57:45 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a61115048fsm72814851cf.9.2025.06.10.08.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 08:57:45 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:57:41 -0400
From: Peter Xu <peterx@redhat.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@redhat.com>,
	James Houghton <jthoughton@google.com>,
	Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] mm, hugetlb: Clean up locking in hugetlb_fault
 and hugetlb_wp
Message-ID: <aEhV9eXyzg5k3Y2y@x1.local>
References: <20250602141610.173698-1-osalvador@suse.de>
 <20250602141610.173698-2-osalvador@suse.de>
 <aD2_0qoh1Os6srsA@x1.local>
 <aD4NyEmRc50OCUBy@localhost.localdomain>
 <aD4X68QSmrvI4P_D@x1.local>
 <aD79vg-jQQU69raX@localhost.localdomain>
 <aD8NUSUV5zA4yNY3@x1.local>
 <aD8_c9uEMn6NXXAX@x1.local>
 <aEg9mTDDA1TXJ9by@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aEg9mTDDA1TXJ9by@localhost.localdomain>

On Tue, Jun 10, 2025 at 04:13:45PM +0200, Oscar Salvador wrote:
> [1] https://github.com/leberus/linux/commit/b8e10b854fc3e427fd69d61d065798c7f31ebd55

Two trivial comments on the change:

(1) maybe you want to still mention the trylock -> lock change for the
folio in the commit log. Looks like it was only needed when we need to lock
two folios to avoid deadlock (even though I don't know whether it could
happen in any real reproducer..).

(2) you can also drop need_wait_lock var now.

The change looks all good otherwise to me, thanks!

-- 
Peter Xu

