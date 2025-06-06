Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E447FD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749195459; cv=none; b=oztAaymUqxLb1E02qAc9sV5bIfxSNxFD5G5cGv8d70D0VXwjgXD8mzOMZtC+l3fbxArHoujLsBkpXwi+HDkt/Nz1gyjTir/KFZ8yNoq+Dp7rjDH9rLNtiBuaIKcQR+2wJztA/DLgK/2a4ZHhbMeHnYhJX5GTtu+LG//Za+4nwag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749195459; c=relaxed/simple;
	bh=u+T6cIVhNhv/qyfhgQ/zXrEWGFz9EE0IbwkEi9jrs2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJUIqe4iaXFZ0H8uRaiBFH8KtIaHl4NJcpNzRHCm09g6iGd1MyfyD0QfKPd/7PN1iVuBX39GP1qOVggSnqb1/8YhOmAmt/gmkohuKxadlt2QGkdhgF+w/wAVplxVoTgWjCb6A4WhgY8G00CtDkAzjcYLeMhbhl3aL3gJLsHLwws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=a7L67Qlr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="a7L67Qlr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742af84818cso1359365b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749195454; x=1749800254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33c7y+CazJ/DvZvuneiI8heu0XV0fCbhYkEnt57IjrM=;
        b=a7L67QlrAdABtz7jDCQ+c44VUJl5AFVuj6tfpc+LSrwxxY2UF7Gz8gPcTbBSQibwtR
         Z7Ud6d1LElPCnoI83h6YOkZ+H5CVeLievBggxgi4Zd5jcErYwsA0FfGddzBh8Pq7BlcA
         VLYGr5SdHmUoqZ0l63B1Uz2QxWSWWJxAIec4T5AScYKypXmjsgcDxQuiAtaiWw6axjfg
         Ecck54e1p1oFUbWkIavJdjaV+kSUJz1nqEYk8dCfNo7DeSF0zHU+aprI/AqmSYfKv9tV
         TKXDdUk/pHb56Lm/2MmYMf5SncfQkPYTLC9brOgyAK4LNV96vqWzseW7et/smSjgIu6S
         59Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749195454; x=1749800254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33c7y+CazJ/DvZvuneiI8heu0XV0fCbhYkEnt57IjrM=;
        b=K9T3RQJOI79peQ/obtlLDgwiKBJsJxXM/kR3BzihMsA44qTCoIJj21wt5TqvMqnOD0
         vEmL29gf5Itku1vwiDtlygI+F4urWJiqNFV5weBVQXu2SODMdnNKyeGP0JHtX+ZZid9n
         UFtqM2jsjtXj/yw/7IwczBoGgn8jwHxRtuyQGRQ4WcaP2vmyxr9rpgXLgKLZVeOA0hVD
         ZSXWO931a0J4UfeDYl8s0bOVLg/3jBlJqbmiQ43oUGjZCLRDmxcssgU4fl0N1K2QnCqG
         vHae374JYbQdIgQrFFWtt1VLIBKUzmNrZYerwI0Hi+7Vy8iH/jIkhZRh3PGz00fIV2Gr
         BLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/kGTOEOst2IXxf7z+FP3HyjIKSjxRtSdzSEUuHwDrAaIbp3x1nH83oTPWI482N0z1jgpmRzi7X9H51WY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtdoPmTifwpoXT9BZNlkaNUefOZjKRvaCILwQlHvAdlkSWPU6y
	CYEVXyV4lMjKwsCN08VOHkcvhZucnX5oPjoJ7O+ITN0n/X7xDoQ9BBJMssvN3ZQ2CEM=
X-Gm-Gg: ASbGncvLbTCiVNeBuWQwPLsBZYE6pMQb8YzZqnqpnCBZ+AcT0q3X0OnpMUc2ouAqDZM
	RlfAPvjBhw3geewA6g7QCUyasso79IVnjWpupG8AHGd8n07zUoFrYPhSGziHf+zcTHaHMiDiI7X
	kCXohFKu9ZXH9k31vz86Ww/fgnuXegljQO7UnRM1JZUBWzwpR+2o0st6d+7UCfIxxAq6FJMECwT
	1xp4q3JnMhw6F0hDXMzHnpcZXb9MbpvoGB6g2k6tmB5nWbHdQfNVuSgrkVfxkpS7nI8xR0DL4te
	qbL5KF062Rx4yOqaUTlmGgELAGTABvbVqYUSRIRHnIL/V8DL+qnzYRnRosr6j2wYK1i1zm7snzm
	2Fyw77mtYBsB1NO+qCX6ZfiUq
X-Google-Smtp-Source: AGHT+IFJifjuABwe6hOSGhqTuhjmPR0mvt7WzgY42R+ZoxvG04mzhQgG888ikvN2I5zB6ByvxkY2fw==
X-Received: by 2002:a05:6a00:21ce:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-74827e52515mr3436900b3a.1.1749195454387;
        Fri, 06 Jun 2025 00:37:34 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0eb0f1sm713508b3a.169.2025.06.06.00.37.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Jun 2025 00:37:34 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: akpm@linux-foundation.org,
	dev.jain@arm.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v4] gup: optimize longterm pin_user_pages() for large folio
Date: Fri,  6 Jun 2025 15:37:27 +0800
Message-ID: <20250606073727.82993-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <8b68e7f0-46b8-4814-99a2-02f0044cda9c@redhat.com>
References: <8b68e7f0-46b8-4814-99a2-02f0044cda9c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 6 Jun 2025 10:37:42 +0800, david@redhat.com wrote:

> >    * Returns the number of collected folios. Return value is always >= 0.
> >    */
> > @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
> >   		struct list_head *movable_folio_list,
> >   		struct pages_or_folios *pofs)
> >   {
> > -	struct folio *prev_folio = NULL;
> >   	bool drain_allow = true;
> > -	unsigned long i;
> > -
> > -	for (i = 0; i < pofs->nr_entries; i++) {
> > -		struct folio *folio = pofs_get_folio(pofs, i);
> > +	struct folio *folio;
> > +	long i = 0;
> >   
> > -		if (folio == prev_folio)
> > -			continue;
> > -		prev_folio = folio;
> > +	for (folio = pofs_get_folio(pofs, i); folio;
> > +		 folio = pofs_next_folio(folio, pofs, &i)) {
> 
> Nit: indentation is still off?

In my editor (vim with ts=4), after applying this patch, the folio on
this line would be positioned directly below the folio on the previous
line.

The discrepancy here might be due to issues with web display or email
rendering?

> Acked-by: David Hildenbrand <david@redhat.com>

Thank you very much for your review!

Thanks,
Zhe
