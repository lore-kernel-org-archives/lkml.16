Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC39721CFF6
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599504; cv=none; b=XVcOmS2npjnREDAb9jgIrlpz5Cn3+XJZVotUdu4EihfrM0yg2GVrC5RBM9VgytVrj+ZEt+ZUmWSkEx0p+6M9quS/wqUVPKNBPAtXlxhazJSK8J/YqzrN351smwRhR7V+fWPpgSmfqVYRfJf7xujGwpbiHYw0u6rpBKNZ9Eyg1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599504; c=relaxed/simple;
	bh=6CbaZyZk4xOXik25RDP07IMS7IVET6/eZ4E/LEtd8QQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LACnNgXl0KMYrbfbebe0tXfZF3ozycA9eV3+Hw703t9pYAjhz3YE+rdn4PWqO10AjZzmt5c31UJCHoTPlQxr+0Y4lF7HXBnZrRdM0D6PIetP/XfmLOr35c1Y/qtWUXZUFUXaJ8KE1fvR/HNp9fnyJnjgx3Yt9bYyTrh9lyGpXPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VyFTPnrf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VyFTPnrf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22c336fcdaaso17295285ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748599501; x=1749204301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fixXkG1M1gZVe7aX0RDjGdTtF+Z43t8pJite6GNJwOE=;
        b=VyFTPnrfD+vJzBcWD/Sc/rDJO5liMUOGCW2Q5++sDAnIZNQB5NDjJ1h2QspA8K5sii
         g+QnBGeu2i7ILu5Z8Kr1WD0jdpSMsXYh8JXx/5hae5TMDxSGn5ispQfaM8ao2oofidHn
         gIuYVgbw0lERDzUESf2P+XKFFFeVS4wGCryECcjoWXL3jIB1H+8ICxkEOzGKMuLsvZxI
         /RhP7ZiCzAMn6qxrONd2kyuNIEEjbcuYCY0vsoJ+JEESgS7axf/vF+ijljwloEQMhJa0
         h7Inx6lDywTSZ+/kl00FgW/VisKmgumChhnHk4DbYLHnu/rWcoiJaKrSar1vd2SA6tdD
         ywuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748599501; x=1749204301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fixXkG1M1gZVe7aX0RDjGdTtF+Z43t8pJite6GNJwOE=;
        b=UjlTV9UmjHinHOAtS8fmpwFZDdURNNvOLn7LiVctc0Q7D1Avo4N5LRSBqjKOneqTyv
         cn8JZpebp3biVZDrBn/uIAV8E8WRAc2/7YFv7l8uclW9oeAjOeuNDAv7qiWKHEYxxZgT
         AXXF51DclLmo3BHYlHYk+rlw/VoEBvIiTspA66t3c5+pFd1A8p07Wtmn/Q79v8LI+eVN
         emuYjgkK0qJtE/4uXhY1q1D/hy+y599n2CIXhNeCdEgSfc2HbENa3lZG65d7ol61krHk
         3kG29VTy6seZN5BoD8tgTcfpGZX6CqlNp+YqugeBrzbCgtwwle1Lp+Ku+RlcByIQXWgH
         q9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD2RcsXoHDnss70TjBdaDWJjs4nVxtNFRPZ8YsPMsn6LstkX6rH+LGzTVL7qYhlE88CcOGel39UOdIoOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSR6hZ9xnMfYoSH4qsDhcuvhq+4a/dpu/4uedZhEg9hG7Z22Gk
	1ngrCyhjwil/QDJHAEnhNDBsHznJ8Z5Pph8HWg18W/666jfjRoPKzGtIqPccApOGQtU=
X-Gm-Gg: ASbGnct+Vqa4FFQeyTi9a9jBynPpB6rMmlvywzS0cYBcfm50x8ezKKJ031cvtEI9nLV
	+o5tt/G23l5YacyTqtE/ImjhQBlJs8+tg/CUHreYQT0P4UDzkhqu9Vk+t+3vr+5DA9YGidqsE79
	7bjgaqAbLvYK4xCCtp4lelsRMTuNTPF85pxq6v0f8LovjIx1O2CPN1lHwV61DZGXayTsl7otN3n
	HvGU2+wUfIJq6+zBBdHT+NCE4ITD9h0BXU5Y0Yoo8WZWGSOO+6e643tY58iEwbLLSKwLfgozFTK
	Cs9uUthDt7w2K5HfEy7cIQ5wFfjz1OEPbxxEpZyccG0zLj9TbzT5oNTI4hJ37g5NyKCU27U+Cna
	kXQ==
X-Google-Smtp-Source: AGHT+IG4RVcsHdkULblvqJ9RcJsiNDGpRBvkyi2qIaWH8X2iwlPWSqWZz/tZYrxglTFEBNbZ93Sw7A==
X-Received: by 2002:a17:902:fc8f:b0:234:cc7c:d2fc with SMTP id d9443c01a7336-23529a0f482mr37363735ad.27.1748599501190;
        Fri, 30 May 2025 03:05:01 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9711asm1060857a12.57.2025.05.30.03.04.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 May 2025 03:05:00 -0700 (PDT)
From: lizhe.67@bytedance.com
To: dev.jain@arm.com
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com,
	ryan.roberts@arm.com
Subject: Re: [PATCH] gup: optimize longterm pin_user_pages() for large folio
Date: Fri, 30 May 2025 18:04:53 +0800
Message-ID: <20250530100453.36028-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <7684103b-8c06-4f6d-9e8c-da0267a83bf0@arm.com>
References: <7684103b-8c06-4f6d-9e8c-da0267a83bf0@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 May 2025 15:23:49 +0530, dev.jain@arm.com wrote:

> On 30/05/25 2:53 pm, lizhe.67@bytedance.com wrote:
> > From: Li Zhe<lizhe.67@bytedance.com>
> >
> > In the current implementation of the longterm pin_user_pages() function,
> > we invoke the collect_longterm_unpinnable_folios() function. This function
> > iterates through the list to check whether each folio belongs to the
> > "longterm_unpinnabled" category. The folios in this list essentially
> > correspond to a contiguous region of user-space addresses, with each folio
> > representing a physical address in increments of PAGESIZE. If this
> > user-space address range is mapped with large folio, we can optimize the
> > performance of function pin_user_pages() by reducing the number of if-else
> > branches and the frequency of memory accesses using READ_ONCE. This patch
> > leverages this approach to achieve performance improvements.
> >
> > The performance test results obtained through the gup_test tool from the
> > kernel source tree are as follows. We achieve an improvement of over 75%
> > for large folio with pagesize=2M. For normal page, we have only observed
> > a very slight degradation in performance.
> 
> 
> Thanks for the patch! I have no idea on GUP but in my limited understanding
> the patch looks fine, let's wait for more comments.
> 
> [----]
> 
> >   }
> >   
> > +static struct folio *pofs_next_folio(struct folio *folio,
> > +				struct pages_or_folios *pofs, long *index_ptr)
> > +{
> > +	long i = *index_ptr + 1;
> > +	unsigned long nr_pages = folio_nr_pages(folio);
> > +
> > +	if (!pofs->has_folios)
> > +		while ((i < pofs->nr_entries) &&
> > +			/* Is this page part of this folio? */
> > +			(folio_page_idx(folio, pofs->pages[i]) < nr_pages))
> > +			i++;
> > +
> > +	if (unlikely(i == pofs->nr_entries))
> > +		return NULL;
> > +	*index_ptr = i;
> > +
> > +	return pofs_get_folio(pofs, i);
> > +}
> > +
> >   /*
> >    * Returns the number of collected folios. Return value is always >= 0.
> >    */
> > @@ -2324,16 +2343,12 @@ static void collect_longterm_unpinnable_folios(
> >   		struct list_head *movable_folio_list,
> >   		struct pages_or_folios *pofs)
> >   {
> > -	struct folio *prev_folio = NULL;
> >   	bool drain_allow = true;
> > -	unsigned long i;
> > -
> > -	for (i = 0; i < pofs->nr_entries; i++) {
> > -		struct folio *folio = pofs_get_folio(pofs, i);
> > +	long i = 0;
> 
> 
> Why not unsigned long?

This is because I want to match the type of pages_or_folios->nr_entries.

Thanks,
Zhe
