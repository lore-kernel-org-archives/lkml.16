Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64024EF6B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198444; cv=none; b=IEhIm9HPs0omAy0plNnu/h0U6sU2AEME/mq+1UhzHQLUWngug9ZuHGgnubQVqjVGZ+rf0cgZCYdagrAe9vFexZJwiiiSrLLyzmDilaG8jF76/A+OoY1xEVXSNHbsERchQzWhPce113PfhjwnqA8sJ4BTKlmTs4ha/Q/e+5whJao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198444; c=relaxed/simple;
	bh=OhGHkhlhsWkEXzpD84HgUOBXnBUgHnGtjN3NZKBrsBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MH/bKZQi2WoBIYZMgDILFFCzqEylICqLwYL55FntHPddVG936PEb/y5p5m/QBVtckTi95Q7kI5yUvkXlon3A9zncW0UNVkbN4+KQ3o8dJ7qtT+5URG2+PWnrR8xRTeSdhxGYxA0ZOY6CMJUlqZye8+J+vVvseuQA/jajSMegjU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gmOpoVux; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gmOpoVux"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234bfe37cccso24642515ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 01:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749198441; x=1749803241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=extr3XZ/haT3dc79zffQPJHDsai5V/OpqWCLpKSp2E0=;
        b=gmOpoVuxWN/dhQWAkvqk/G6Htj7sDmKhGBwSUOaMbXtQZUe6M855b6/v/HpiXOrWDw
         Tulv/xpvQrxZJgEHh0dFqEOdnaFl7Un+gMff03EbWlch1xSX2B5YCKWrAUpAgYqR7UOy
         vYk+rR6nommTm8buBqvqnix9tAL1QXUrUByppSHWbqm5qdLNllDgHpdBiWk8aHuzyLrw
         tFVVWQQR364a0Nz6ChUvEBR9VZPIVWKwxVXK7+aOyTMAbk2sLNkU/1pwtY9UrNWn1QCp
         6sWYsG8cssEQmzKBj/zCBy8k4PBoQHBrqJlRaNxCyqqov51Xw8pd9d1xP51E1USYHPik
         h8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749198441; x=1749803241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=extr3XZ/haT3dc79zffQPJHDsai5V/OpqWCLpKSp2E0=;
        b=hoy4sLyNjW0GAlJEWvJOS1CZd1QF8p4j1qeXG4Vpbn5YUC0paf+cYqBjC/EgNcHTdi
         vxb/onN46SJGSWH+XqGljqHcp+X8OPzeNCeCan/8+zBe7F/8qRfupcAP3ooLWtxVBV/6
         kEDnqIO+MmrTCEvlYKXut9cPQMaRwMZfGSPNi4CM+L6C3DHn0zhAwJZixUGvaMWVX9Ur
         /30K0zIjc5KY4++y0DFBGDJhmlcovnOZA6sy1a5aKGQLcs+VXdm0HttONzhajHwvzzNB
         +Ht8y4oQgOleeBr990lczz0JgOW4Ohqe6HaeP6Cg0BFDyLeMSyP7BulnILzhOu6ZftUv
         gKUA==
X-Forwarded-Encrypted: i=1; AJvYcCVL8K95ybsIPbOuYPIX+/1mUV1IKCVWi2ixiJUk5bS3dQ72dRdQNZVYZWIvaS7jPSqkXGUmvpg/UisB29w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9pTyGDgiquI/O3azzxiOx6hJF/Pxan/kEKFArw1WJ4cwI+zHt
	5/eg5cKUkodFVCYvWUU3oEIfKY4JMbarT9H+oqQXHO4Mc66vAYEgLxiPQlxeDvgbkHU=
X-Gm-Gg: ASbGncv8pgQVkFUn9GJD93HMWuSzDWfdZUhXG12fPVqtnEQiXSOYG9R7K8BN5+3kdME
	TnfN3fCBE8AFAAPwn9erKfj1ixGvmRdd1SlelozFy1nyXSRev0R5FX2kEf9cAiuNSsP7IJXLbl1
	GC9u9wef3axiLn78CHWbmxKMey0hFj2DGSSHjbteSZLA2DJ8zLTqBjXh5wDYBVjfWV45hiYvQih
	PZRJRHSZg833PHvOir34YRf34/d/pjEgMnxs1CB90bnQOEz/HXniJvoLybpnd5bTAo1k/v1Upky
	61IcX8cf1OHe/oSpEl1lIIfljQMvqMrrXlX1NKdTP+H57Bza4YqWQGMor6P7zs2wZBIOy8YDEKs
	rvhJolZdnJlZBuw==
X-Google-Smtp-Source: AGHT+IFUlGXn2qNj4ZqTz0dX5zZ8LVzeKqWCQat20Jw46/I0Y3IPj/UjlGDTiNQPDJuEycZswR0MVw==
X-Received: by 2002:a17:902:cf10:b0:235:ef79:2997 with SMTP id d9443c01a7336-23601debd78mr32214005ad.47.1749198441000;
        Fri, 06 Jun 2025 01:27:21 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f38sm7684535ad.79.2025.06.06.01.27.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Jun 2025 01:27:20 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com,
	akpm@linux-foundation.org
Cc: dev.jain@arm.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v4] gup: optimize longterm pin_user_pages() for large folio
Date: Fri,  6 Jun 2025 16:27:13 +0800
Message-ID: <20250606082713.87113-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <6f0ee0d4-60a9-4453-a08e-2353b234dac1@redhat.com>
References: <6f0ee0d4-60a9-4453-a08e-2353b234dac1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 6 Jun 2025 09:58:45 +0200, david@redhat.com wrote:

> On 06.06.25 09:37, lizhe.67@bytedance.com wrote:
> > On Fri, 6 Jun 2025 10:37:42 +0800, david@redhat.com wrote:
> > 
> >>>     * Returns the number of collected folios. Return value is always >= 0.
> >>>     */
> >>> @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
> >>>    		struct list_head *movable_folio_list,
> >>>    		struct pages_or_folios *pofs)
> >>>    {
> >>> -	struct folio *prev_folio = NULL;
> >>>    	bool drain_allow = true;
> >>> -	unsigned long i;
> >>> -
> >>> -	for (i = 0; i < pofs->nr_entries; i++) {
> >>> -		struct folio *folio = pofs_get_folio(pofs, i);
> >>> +	struct folio *folio;
> >>> +	long i = 0;
> >>>    
> >>> -		if (folio == prev_folio)
> >>> -			continue;
> >>> -		prev_folio = folio;
> >>> +	for (folio = pofs_get_folio(pofs, i); folio;
> >>> +		 folio = pofs_next_folio(folio, pofs, &i)) {
> >>
> >> Nit: indentation is still off?
> > 
> > In my editor (vim with ts=4), after applying this patch, the folio on
> > this line would be positioned directly below the folio on the previous
> > line.
> 
> Documentation/process/coding-style.rst
> 
> "Tabs are 8 characters"
> 
> :)
> 
> Good choice on using vim. This is what I have in my .vimrc regarding tabs
> 
> set tabstop=8
> set shiftwidth=8
> set noexpandtab
> 
> set smartindent
> set cindent

I truly appreciate your correction and guidance. I sincerely apologize
for the formatting issue that I've caused.

I noticed that Andrew has already integrated this patch into the mm-new
branch. I'm just wondering if there's still a need for me to send out a
v5 patch. I'm happy to do whatever is necessary to ensure everything is
in order.

Thanks,
Zhe
