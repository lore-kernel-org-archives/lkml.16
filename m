Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B51624DD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200310; cv=none; b=Ez0/V8DVuMmiieBerC12k2JihdvbvjLV/Pu541+dJIkXFgeSZyXeMNTK+8zIGyRUy6O9308qILT+ZikdsRHY6VQFVu2YwOJdGzkXD946CDApr0Qh4Zfui/yLiKVaUn7mXCEazujWj0C7MuwjWBOLsaswbjthh2VegG1LGAkVqYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200310; c=relaxed/simple;
	bh=qb8DMH4gF6S93MskjiiEecUdSv/LDFJZcaoLws8MM/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwWSiC/pFbgYn29WqZvgg9HtQW8K/4Ge2xWMtw7RvaCHcew4tF9ZwhU2XhaU9oj++qOalDMQWFzkkI4imJpRpGOEVkZKra/61tTiqPsenWns/eK3UTZwHot7xct/GLikv7S38NCw6T19y/cosMD+nJ0Kk4mwzwJB0m2/bjKRikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KUlKyzwx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KUlKyzwx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231e8553248so19304575ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 01:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749200307; x=1749805107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymOcQmc1za1KFmVBfx7ccy1EEL2Tdf1lKKtdHUAzlqI=;
        b=KUlKyzwx6ptV/yUOBej77ZFnR+jio2oOFcE8nkKpWul7damnoAE/ZoZ9yDtjQEPVUD
         +k0tKrfJAHH5ZuEvHKWHGmD/7t/TSZcDS1oFbDJ2ZGT0bHqRj6cMT1V6rZVEL82lpPS4
         fycYB5M7xkLWEvID1HS+xjgWN6QXcihua4E+rgwKJXhaZV3SH1qcmHwJMn8xHY3lisVD
         nLInNXeJLgMs5cxXJUK5xdqP+UJPzah3cGnpFEShC1fhaZmL0y4C7ppxL1DV4Msh/Fey
         BhGcq2U2Mi78rmp3pp4stXK1rNJodel+b+DajCCJ/S3qiNSqkvAojzK56yX4cDBkwzey
         Pn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200307; x=1749805107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymOcQmc1za1KFmVBfx7ccy1EEL2Tdf1lKKtdHUAzlqI=;
        b=WrxYg+i7CeubJbehlU+unnFIutqViI4laa6Ym9PNFWoJlVAwr3oyNjpOC2pim5UGOY
         ux3qtc68Dl0kpJQczkoIhzBS2fLAmuy9fceRhVQSwAGGMsoylhm3TfgIoN0t9IxxqZZ5
         xXD4DqPSM7uphSo8+y803Y/f/OkLdZK6yKiSBKruprW2gHaN9VYLgTBgLt9n9iEeZXdj
         6eRiPp5HNc+Ibi4rq87HPcTBSWzgtYWn1jkRsaLlCheSOxp4NgwiMEztKO4H+zrvRw22
         Ve4qjJ5hllR0tzhn5hxjiCob+Q3b+7xCz2jj79IeEFBNSyixpHHsvlVQfJaozsfGjqUa
         w1mw==
X-Forwarded-Encrypted: i=1; AJvYcCX7iHC48sOlaxHKOrbGt/ZYF2aSC58nv++knoyG6iWSOqTxsgMGXRBvSkI0mIvXHYcxT4iRfd53L1kJvKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN5jnloHzpXoc6TxkW/Dv7Q6D/PhqvixG1wSFkLo3nnzCzYK/B
	WgaySYIsENu7i6T8rQyqio1+n7Qn/afa/SpxGP8B7SOtYMvOudXkzgMrgv3k27bZuO8=
X-Gm-Gg: ASbGncsGk+1Uii1/7n6JER5HuvfM/9blSfDEX1TWvB9jgy7hWYtBHEhFOm1zWw5MBNP
	CrLT2muNmYxu0cpp4hCgjSQwKSIIceFVKlMSi8bePuTN7Yd+LCVhX8oTaDgtLUvQbgo23vjizo2
	bG7M8k4F4Uz4k6SNeb17o5SzYiNvEw8EgVYlLQSOvvcCciMI+cAu1L/SQ7aGcW6vLMJdoK9i3GN
	/nTa6nbrbXVtDMMD/GbskzE2rET/LJ1itZiJA2uyVlP3Jy9Znkhq+V9stDifhsGi3J1L10GsEsO
	xiHwJP1l86fYUigQ+bVsOQXk9mt7YajAHbtkcY5fm0g8kIsTRa9pEPydwKyL7PMtF8DwOASUlGG
	vJws=
X-Google-Smtp-Source: AGHT+IGSu1cXHwIHRp8Sg3wueJ136zK9blpmz4N1Qjg/nEzAL2VqPuiwWwZjy4fAHlq7m7EMtekxZA==
X-Received: by 2002:a17:903:40cb:b0:235:7c6:ebbf with SMTP id d9443c01a7336-23601d82e5cmr39668735ad.35.1749200306814;
        Fri, 06 Jun 2025 01:58:26 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034037a4sm8121785ad.141.2025.06.06.01.58.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Jun 2025 01:58:26 -0700 (PDT)
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
Date: Fri,  6 Jun 2025 16:58:19 +0800
Message-ID: <20250606085819.89839-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <a6559d96-5018-43ea-8d51-4467f5f0d759@redhat.com>
References: <a6559d96-5018-43ea-8d51-4467f5f0d759@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 6 Jun 2025 10:50:34 +0200, david@redhat.com wrote:

> On 06.06.25 10:27, lizhe.67@bytedance.com wrote:
> > On Fri, 6 Jun 2025 09:58:45 +0200, david@redhat.com wrote:
> > 
> >> On 06.06.25 09:37, lizhe.67@bytedance.com wrote:
> >>> On Fri, 6 Jun 2025 10:37:42 +0800, david@redhat.com wrote:
> >>>
> >>>>>      * Returns the number of collected folios. Return value is always >= 0.
> >>>>>      */
> >>>>> @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
> >>>>>     		struct list_head *movable_folio_list,
> >>>>>     		struct pages_or_folios *pofs)
> >>>>>     {
> >>>>> -	struct folio *prev_folio = NULL;
> >>>>>     	bool drain_allow = true;
> >>>>> -	unsigned long i;
> >>>>> -
> >>>>> -	for (i = 0; i < pofs->nr_entries; i++) {
> >>>>> -		struct folio *folio = pofs_get_folio(pofs, i);
> >>>>> +	struct folio *folio;
> >>>>> +	long i = 0;
> >>>>>     
> >>>>> -		if (folio == prev_folio)
> >>>>> -			continue;
> >>>>> -		prev_folio = folio;
> >>>>> +	for (folio = pofs_get_folio(pofs, i); folio;
> >>>>> +		 folio = pofs_next_folio(folio, pofs, &i)) {
> >>>>
> >>>> Nit: indentation is still off?
> >>>
> >>> In my editor (vim with ts=4), after applying this patch, the folio on
> >>> this line would be positioned directly below the folio on the previous
> >>> line.
> >>
> >> Documentation/process/coding-style.rst
> >>
> >> "Tabs are 8 characters"
> >>
> >> :)
> >>
> >> Good choice on using vim. This is what I have in my .vimrc regarding tabs
> >>
> >> set tabstop=8
> >> set shiftwidth=8
> >> set noexpandtab
> >>
> >> set smartindent
> >> set cindent
> > 
> > I truly appreciate your correction and guidance. I sincerely apologize
> > for the formatting issue that I've caused.
> > 
> > I noticed that Andrew has already integrated this patch into the mm-new
> > branch.
> 
> mm-new is for new stuff, unless it's in mm-unstable -> mm-stable, it's 
> still considered rather "experimental".
> 
> > I'm just wondering if there's still a need for me to send out a
> > v5 patch. I'm happy to do whatever is necessary to ensure everything is
> > in order.
> 
> Feel free to just send a simple fixup as reply to this patch.

Thank you. I'll send a fixup reply right away.

Thanks,
Zhe
