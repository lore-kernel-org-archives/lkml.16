Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C45D38FB9
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 04:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738558633; cv=none; b=VG4/6CoQ1V+2gc8XX/jntI9tVjFSK1vKP0iTVpOpNZwreSk5Jh2a3V8A0UDh6gTKeFAZ80BeyGq5WJJOAnzxoZpMlfU08dtt7Xc+Z59QlXQslQe28rDZlOIBduyaZgaY2wfGHZMcv3duZ4dfwMz+zRCD/fsHMUJ9sE0p5hL+O9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738558633; c=relaxed/simple;
	bh=1b7PXCAjicBWEXfGN57G80d0iaDT13wM7LEca/iaZ6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9gMwkiCTXO1cv3eR8aETHFOPSjO1SYW7RPG+Xsej2TquCLVeBs/5ET8E0EKOYjIOBXT/U957GmeKCDNuvfcQKjmjaZMDn9l8fMXlU87y7z6ymSrQSB0jnkv6omqv4WmNBvOcz55br8df06tMXzZRWEwFrr0Dx6eP56ZoEkcWTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kHUNaAjt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kHUNaAjt"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21bc1512a63so74744515ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 20:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738558631; x=1739163431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VJjq60zXnUHHajG0I4v7Z4ikwINYuM0Qsned8Y7REbc=;
        b=kHUNaAjto9d38/5wfM4CFL3ehkd2/Tndoandu87EEs3M7tD708af3yX7ahpTL2Kv25
         zO6WzPUuTnVQKKww219gsbsP9BoIrzpvQ9VbR2f5uLxr8VCkLqAwiQOUDXwTmLDO5lQV
         2Rp9W9xgsrn++oSeUoTYye0VfutzkG/TDgcuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738558631; x=1739163431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJjq60zXnUHHajG0I4v7Z4ikwINYuM0Qsned8Y7REbc=;
        b=SHbGQSSO2LEB2TcAoOqYflr9jwhQJVJtG1ibA3QrtxHwDAM2QF2qTcxYYrXoGT4+Q/
         IozCGHWjGi8IZsoqWXBY2rEiURTBGIdERMmw5tnSGrAlNNMhVFXzN8YfrS4MihGM4kNi
         s0v6FDL1XE0mrI5piu07xoTJz842Sqt6Zs9I587PHLkrl5F/ecGyEUYpTZ3uLTHxxQ1m
         k47jThkUvpULFHRDk86ycYWWD1IF/fi07SNFGq6XEd94ms3E96OhW4p+deKqmvoB4rxc
         u6qPzExvct+UZDE4s5/mHDwWvDtv3uCCflJAchZeOg1NY1CeboA1vpm6vlgZxLfHi9un
         RTmg==
X-Forwarded-Encrypted: i=1; AJvYcCWBCu1GYezZWAujtTdFlZ6Sxa2ZynhUKErMxJp1Ykio3ktQLccQSEOCRpDEVQ/S10Tq3v2owo9glvovmyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP8LGpZguvawijDaD2CClaH0RJaOGf6kNGJgtjtVlbY7C3Vg2z
	7BLh9/eiJTQS6Nzxg81J4uzb4b5fBGUS45lcHasCztV3j8uIFMEze42xOa68Ow==
X-Gm-Gg: ASbGncvv7g2qEpdVE7OAiraph8JOKbcgj3pryaE/Gvi8s8VTH2w2nxn63F+vEG+rpZ8
	xWrNOlx/p7Gum0o/GPyyeMP5pmCLnX2mUAosxOlvfMC+jogkW9QqjHxwD5duYGAu41VT9OQexmv
	U/LqTbWoP4inwkZYn0MBzN2R3GpOtfGAWV12F4Gfd0JbljJ+e7d8hyreEkMnGGsrNbdkklEIkeT
	wHTjk6y0fsn34Q9HUll9aS2Xj7UUxpT35hm2GleBQdFU34ITcvMTv1fwb0r5g4fyFnbSfEITz+Y
	zCTMEKpK9sQSb+eT
X-Google-Smtp-Source: AGHT+IH9dd9ZAzS3baGwhKzff/ZE0OHYuRzYcLQN7WhWJZWpjKHAWQ9qIm7HZ6YPSjw2kbuJx7KEmA==
X-Received: by 2002:a17:903:98c:b0:21a:8839:4f4d with SMTP id d9443c01a7336-21dd7c46868mr280232625ad.6.1738558630731;
        Sun, 02 Feb 2025 20:57:10 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f3c0:b0:250f:9437])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3320ec8sm66544515ad.248.2025.02.02.20.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 20:57:10 -0800 (PST)
Date: Mon, 3 Feb 2025 13:57:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 12/17] zsmalloc: factor out pool locking helpers
Message-ID: <bsgm7xz6ffw32o55mrh3l36zn66muf4bttduu7kbxk4apwmk3f@zwtaktkdb5tj>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-13-senozhatsky@chromium.org>
 <Z5zwcPBAY7JaVW6Z@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5zwcPBAY7JaVW6Z@google.com>

On (25/01/31 15:46), Yosry Ahmed wrote:
> > +static void pool_write_unlock(struct zs_pool *pool)
> > +{
> > +	write_unlock(&pool->lock);
> > +}
> > +
> > +static void pool_write_lock(struct zs_pool *pool)
> > +{
> > +	write_lock(&pool->lock);
> > +}
> > +
> > +static void pool_read_unlock(struct zs_pool *pool)
> > +{
> > +	read_unlock(&pool->lock);
> > +}
> > +
> > +static void pool_read_lock(struct zs_pool *pool)
> > +{
> > +	read_lock(&pool->lock);
> > +}
> > +
> > +static bool pool_lock_is_contended(struct zs_pool *pool)
> > +{
> > +	return rwlock_is_contended(&pool->lock);
> > +}
> > +
> >  static inline void zpdesc_set_first(struct zpdesc *zpdesc)
> >  {
> >  	SetPagePrivate(zpdesc_page(zpdesc));
> > @@ -290,7 +315,7 @@ static bool ZsHugePage(struct zspage *zspage)
> >  	return zspage->huge;
> >  }
> >  
> > -static void migrate_lock_init(struct zspage *zspage);
> > +static void lock_init(struct zspage *zspage);
> 
> Seems like this change slipped in here, with a s/migrate_lock/lock
> replacement if I have to make a guess :P

Look, it compiles!  :P
