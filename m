Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD21BEF81
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738566728; cv=none; b=YIY8rurBV4RokbT3Y4VUChLHZJVtCg8j5gODdstmXRtizNQXiiGJo9crc8v+uWK/P+O71zhIOGFqL+xnrPYsj9UPN/IBZNEDforQtNFft0ekVqn/ADRKT4/7Iva7WrE1/DUuGf7c2zHxaUuZG1Ei9kgksFoPPKekd3NwbYXoFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738566728; c=relaxed/simple;
	bh=EOPXAYXuXV6V4CIhi2Vvb3rrrgQM0nAF22Yro39e2O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g10665s5ed2bAxtrkij9OMWF/7D88GK1dvaN5eCUzaM/RCZqMAd9MUoLQWV8fpe72GeCsuZoxR1tEtvQbCjeY/HS9HwLFgg7Ykhi0Hr62ubQxI19Lgoh28rDjo7sprWUwZPDxjUiGNqkpr1JehdL/QorTyyA6OOZsO2ycye+2vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n9KB1dIr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n9KB1dIr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-216395e151bso47311915ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 23:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738566726; x=1739171526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jovPlsXMD8ercV5vJxs/GxduF9oWwr/XATh+6VZzu5o=;
        b=n9KB1dIr9kOT7mWZU+rfOp72jpww390vMPxh30gjIy647qNeneiCVW0a9QTwxGc+zS
         GsHktkHkGLgCUi42f61VVnb5xREUkFwfL45jrvepWHkYfarltwDE4y8h/3D+WS+G8Nxn
         LL2Hx9yPH1GaKgHeOulx/B+bTA+z81OQ20Ftg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738566726; x=1739171526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jovPlsXMD8ercV5vJxs/GxduF9oWwr/XATh+6VZzu5o=;
        b=KgwB/APb6VxyOBzD3xNDCF0KemUOc1S5dCQ4s99hp+o9FXBr+rK/wg+wkC80LNZJwC
         PvMWiq1DoP1AoLIWBE9EmI68h5V40SXkFYvkBDEOgLC28igV6/FCdI0hxFoHmSgkn41o
         YgRpeldbQTeqgqG6QFmhkz0aMj4rv83HiDSu+XWcW9bjike7O+Aro/cF5GAZhUPW4iVp
         5R7vLA8pd6zMuU5F0DBdqE5sKdGkCuNxSalwaNC5f3ROSBmZVHvUxfTpWeblw+qgnM8v
         zis+TeAU2rlAyHIt+i/YTYu3aIfbwmunWIEGPusH71sxeFOkrXy16sTjgXnobbVRO+FB
         doYw==
X-Forwarded-Encrypted: i=1; AJvYcCW/SCZiIvlHneXp9BwVL1kPu2mgO+neOisflKc666L37dAyavN37cYOFnRDsiWSVN1OW1sdK8wM+/tSQXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyx69PzGyzyB5of2geE4bMM14RZjdg+DQluchnIHH8DKLsBCGS
	p9oz+8lds3gLMqRwu0MHVFmyCQn+QqjsUZHFxQsbNxiM1BoXJZDgDupnuRxZZg==
X-Gm-Gg: ASbGncuwmagmdcY5wtLjq3Y8OBTE2M3KL/8Hw9F7ddoMp2wLDDbB5VfS03buMdwDWbE
	qBXb0mLDW09mqqeTHAspg68NPAsY4BXcqIGK4kUBMC8JDwB6rGmuzq/NU3p8pmawl0aQtY+tcGH
	iDuuWJyNWgzNsQ6FCUsP/zRhPblHJwp2r6gGKNuyBZGYp6hFBc9blK2cYI8eYzXtOGuk7Mkg6Qu
	btvyMmuf++2Ve9uXZ7YdhTg+z6BggHcOFGZNrX+1Y3bHsr/7zD3e4vzSNmN+M/qEAfhBe+sipNV
	dIvEYpaIYHl9WWk7kdQ=
X-Google-Smtp-Source: AGHT+IGqQ0PsxVAoOO+ElcY+N0qt1g48OM/XXdS8cTwo49Ct8aebIUudjNCCzURajXn8/tcTIjIyig==
X-Received: by 2002:a17:902:e342:b0:216:4fad:35d0 with SMTP id d9443c01a7336-21edd7ed325mr141655805ad.9.1738566726025;
        Sun, 02 Feb 2025 23:12:06 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:b77f:f2de:f99c:2d0e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee1efsm69263255ad.28.2025.02.02.23.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 23:12:05 -0800 (PST)
Date: Mon, 3 Feb 2025 16:11:59 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <cr3ekbanqyzmeqeohwwlfqyced2fvtqh6kzermiahm4blonhd2@fod2itisib5f>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
 <dj2k36obadhbxlvecsdhdyf7edkmtgocf55jkbiq5gbnpvkygt@mcwolkrhicvq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dj2k36obadhbxlvecsdhdyf7edkmtgocf55jkbiq5gbnpvkygt@mcwolkrhicvq>

On (25/02/03 12:26), Sergey Senozhatsky wrote:
> On (25/01/31 14:55), Andrew Morton wrote:
> > > +static void zram_slot_write_lock(struct zram *zram, u32 index)
> > > +{
> > > +	atomic_t *lock = &zram->table[index].lock;
> > > +	int old = atomic_read(lock);
> > > +
> > > +	do {
> > > +		if (old != ZRAM_ENTRY_UNLOCKED) {
> > > +			cond_resched();
> > > +			old = atomic_read(lock);
> > > +			continue;
> > > +		}
> > > +	} while (!atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED));
> > > +}
> > 
> > I expect that if the calling userspace process has realtime policy (eg
> > SCHED_FIFO) then the cond_resched() won't schedule SCHED_NORMAL tasks
> > and this becomes a busy loop.  And if the machine is single-CPU, the
> > loop is infinite.
> 
> So for that scenario to happen zram needs to see two writes() to the same
> index (page) simultaneously?  Or read() and write() on the same index (page)
> concurrently?

Just to put more details:

1) zram always works with only one particular zram entry index, which
   is provided by an upper layer (e.g. bi_sector)

2) for read

 read()
  zram_read(page, index)
   rlock entry[index]
   decompress entry zshandle page
   runlock entry[index]

   for write

 write()
  zram_write(page, index)
   len = compress page obj
   handle = zsmalloc len
   wlock entry[index]
   entry.handle = handle
   entry.len = len
   wunlock entry[index]

3) at no point zram locks more than entry index
  a) there is no entry cross-locking (entries are not hierarchical)
  b) there is no entry lock nesting (including recursion)


I guess where we actually need zram entry lock is writeback and
recompression.  Writeback moves object from zsmalloc pool to actual
physical storage, freeing zsmalloc memory after that and setting
zram entry[index] handle to the backikng device's block idx, which
needs synchronization.  Recompression does a similar thing, it frees
the old zsmalloc handle and stores recompressed objects under new
zsmalloc handle, it thus updates zram entry[index] handle to point
to the new location, which needs to be synchronized.
