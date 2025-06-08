Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C925613CF9C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749402636; cv=none; b=KuZyx3E2LB9DSbGdIXBEReyGW3mDALcqubgOXVd+tKg7Ix8FTyfv49ZJWTUFmK7FtgleT8Alswz+cvTajH8S95Brc6NlaRAR4/kivk1uZv8FGuaWEJsyqd8FHk3YVjTkSl5j0fWP213p3+JeSXXkwY59vkPYvl9TEFuGx0aRZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749402636; c=relaxed/simple;
	bh=AV/4+MnVBVsPbWACgTfTE2rp31DkL/Ozd9nIj9gNI60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AC7b/oIwwO4Sa1NVuQrPMe2mYnMkDbyQmiCmpwnTiBK3+qC7baG1epv2AXUDNNkKQa6WbaABpiFMcCG8OHO65+RW8GlHdpD+UUIZQqeE1giMXFrttgmn8YKGmVAjACFUIqANZe5b2HJRJj+FJ2kpehz8DK/m+TRuLpeLIiJUfPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCbswJDq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCbswJDq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so45212575e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 10:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749402633; x=1750007433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFSTL7eGs6OXg4Ss6Ww7Bg0XbEMi8+OcWq/O40mgWYw=;
        b=cCbswJDqEjanAQQSj3OT76uxDVFAYpKZN02xrjkBVPWN2OLybZa/4wDUb4AC7Jh6TP
         pnbCigQEkd7eGzUX3pw7mJOv4HbTa83joLrtek5Nml3bUq6+qReBDgUhZ68bYg/WX9YA
         k+TS3T62Y6azEiOIeLv3YalGWWXXBvEBsgong9vs8hhJ1Sp7ODc51q3o71it+9PDNVrR
         7QRt6nODtoscdfU9XkgtKC5/yCt4D1vazUV6bu73ZOd5g40e2iaCHgjExJ5lORpPKGYB
         3RPLjIQhZqYTYFwHKM5RX4g3E90Ro3hMTANyxLmb+H3ZAA/eKkVx5FsgVObVtEzEClnZ
         gZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749402633; x=1750007433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFSTL7eGs6OXg4Ss6Ww7Bg0XbEMi8+OcWq/O40mgWYw=;
        b=sxmYYarJeksnXXcT3X+QaGur+QdacnrUyUSNKri3pUCslvGg+v969Jwei66FD6g4Th
         Ngy/fDi1+meh8htTokpYSA6nwlpE7YTKaoGlv6RRo+KEz0yv7xNJaamqaIMP5EpMRjpP
         Wj2wMXoiPSa+jEgcn19O/zTB5a6FCYybgrdlZ5npvtsWE5uvUr8ckFedshQmKM7HCGwa
         iuIcqbKapmG6Y4+yDEVbuc/cTLsrsoXgcXnSwuMCmDqk6pcSpzmNYu9c1cugbTizq7/z
         3g15k8c+AndoSwVkicCdQzgGl34BVcBbZCfWFn2hMS+W5naPJaRsopbnVsIifOXcyj2w
         PDAg==
X-Forwarded-Encrypted: i=1; AJvYcCVIWZDQsKkif/NMxJk/2jObXCfJr6xrLkiTFWLNvBOAAAFHcPTIIHQKu+8mRF5DtrpbxzX/g687lHEy9AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nUMmLf7BEtqK4hbxZRQjoEVUBzW2VXPuBBwJ5rhHHnzv0GOO
	TgB37qMvq0Ilol6lQmQY+oC6sLtthqvZ8rr467uYD33rEmz5j3lmlLRyjWmZvQ==
X-Gm-Gg: ASbGncsVfwq6jlPAp/Rd83Uis6q7NhIuF833IYxb/ZXGkPYtshj2ED/ZMpeI9QWg3S1
	IG90Xqbco6PVbcJRob04fSW9QOwpmcNUyN5WVqNBf/wX+Cjt2UH1wfZS/q64tRbQ6MejwFI//AM
	M4HAV7C5x2jMa3GbpqlfoK5UDhKPXPlFtOIKSijF1WgITLLHWSwNEm2Hy31bjkMpEaGWjK2HqaT
	YBqVdMcoQN6fRjod16174f5jbCG8kGqMpJR+apdrDhP68K30DQ9stYcevwaX/OrJWG1xhuuheNJ
	jiJFuK8R5rTqbznzxbFgLCFJ6hcgHofI2RP+5GTC/NRW+XoJ4CeLZUjAM8jOYke7RKFGpYVwWx+
	7UloYst6HP296CQHM9gjLek6v
X-Google-Smtp-Source: AGHT+IGB2W7rBEJhc9lsd74+MvtUod/ZOo3q6kM5X8xylBnc+7d/6WK5AGrTESPvH7AA0N7LGV9+fA==
X-Received: by 2002:a05:600c:c166:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-452013ab4b2mr108370195e9.17.1749402632853;
        Sun, 08 Jun 2025 10:10:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b33sm85698495e9.26.2025.06.08.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 10:10:32 -0700 (PDT)
Date: Sun, 8 Jun 2025 18:10:30 +0100
From: David Laight <david.laight.linux@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: lizhe.67@bytedance.com, akpm@linux-foundation.org, jgg@ziepe.ca,
 jhubbard@nvidia.com, peterx@redhat.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, muchun.song@linux.dev, dev.jain@arm.com
Subject: Re: [PATCH v4] gup: optimize longterm pin_user_pages() for large
 folio
Message-ID: <20250608181030.20741f9b@pumpkin>
In-Reply-To: <8b68e7f0-46b8-4814-99a2-02f0044cda9c@redhat.com>
References: <20250606023742.58344-1-lizhe.67@bytedance.com>
	<8b68e7f0-46b8-4814-99a2-02f0044cda9c@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Jun 2025 09:21:25 +0200
David Hildenbrand <david@redhat.com> wrote:

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

I tend to move the 'initialisation' to the line above:
	folio = pofs_get_folio(pofs, i);
	for (; folio; folio = pofs_next_folio(folio, pofs, &i)) {
		code...
For 'search' loops you don't always want the conditional, so:
	folio = pofs_get_folio(pofs, i);
	for (;; folio = pofs_next_folio(folio, pofs, &i)) {
		if (!folio)
			return -ENOENT;
		code...

The 'really useful (tm)' part of a 'for' loop is the statement
executed by 'continue'.

:-)

	David

