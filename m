Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B803224
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738553180; cv=none; b=gYhYis4XAOlwj757ZwJCQIsfuTJqAXWsABkJTwOsIO613HTX3X9MZ72nf3RllPEdDPGW6U+mwPPKDM68ZlMuCNV2FNrGUOABy1UC1EaijhR/uFNhGw3SYUSk/bWx7LKLNm+EfWJEbI8PJXFce51zFEZOXwYZMR6vqZQzknzd37k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738553180; c=relaxed/simple;
	bh=oBnSbhCP1lXzMxt/m60GRo1uFN173PvSklDTzNI4kxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOU9oYg0lUrEurlQHpJ3FDOCoqoDXsUC+gBcKXd1Gddyk9jrvojWQFB9WR5Gn9P+uVKU6m2WuOibjEEinGsoycWPtT958z5gAabmNxy9byt5sAYy9ZrRw17038c2FFuYav1SHLmFjE8YBxttNIoruPS68tZ+li5b/Zg/rUu2pgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aXTjcBoN; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aXTjcBoN"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-216401de828so67071105ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738553178; x=1739157978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VE6EjuD91puXURhII7Ap0rMhTN6ytgbnHUVOy8xn/mk=;
        b=aXTjcBoNxZc9krUOxV907rYjQ4dwHET1/wdCEqO8Y87kBt/7KeutiHNhPiusBBNAbb
         yTSbuppmElKrz8+TLKdW9buNiepG4U6GCWi4+skkW8KNIyieQyObrO0Gho6A4VQt/4qR
         rOIEM2fsxUZLnqBCWDx0Co+OgnlY1xihfTjSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738553178; x=1739157978;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VE6EjuD91puXURhII7Ap0rMhTN6ytgbnHUVOy8xn/mk=;
        b=fbkkEigwOEfj4M/8o6O1Q91FiERMSp0yu/FVVu1N9PgJe5PfUAzPRFYcGgfrILzKRa
         zb8DMVLVQoJwGFWp6M84P0Ems9g86QXeIPJDPr1fxVj50qkn5pF0nl7kyB5QT5gR4DFm
         lpckMP7zRQAWCxPt8GZffJlDFa9DshTtXez78zbP6nFtYgwd8SbqGFah/oeW8cyS40NP
         mMV/Ukgp7kAIyY4g5yiRzcQx3AhtAcDrDS8ouu8MafCWlySqn/6ZpVtmyE8EIWz0XjXC
         A2ehNCVvZlRjb0l2ylVZJ+wSWGdqdPuBgg9OhBGRoOcLtUKvo/aVrY+Zdu9HLGKJGmX0
         ZPPw==
X-Forwarded-Encrypted: i=1; AJvYcCV1FeUGLOL30fLWHiZlLoe/QNyHA4FyRbFsVdIiLOyr4A2MpEariuyeZS9nMLvfo92TyCNACEAVkVsJaIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/kLDsNYxmwaLW42dhvnPIFWxcU1X2ma5TiD11si98w6dw4xG4
	Zm8shV81TORpPEyLcLt2EG2Y0ThBHVfV3b4B1s9qVFwpBlAROiPO50HRISYbug==
X-Gm-Gg: ASbGnctFcmBajqPwym5oUbM+OZje+lRtDhKPzueejxAC9rDeQAnI4rzQNN6T1hmEU79
	6LAxDkhg7JO67OS9CwgVCWhiwH1eXvfykk+PojJUg7i5yfsGlKeqO0suoWZ2jyqe7UgtSQ9Pg88
	48UwcoIS+PZALWctt0faVKT9BR4FHnqfk5+DoV3jSevgBQCxYCIroE8cPaBucZsQPWmNq5GPaCG
	UhQ8zr+tMsEkgizGA27VHCzYarSk3sH/d4mSLb7F4S2iaKMmSKT+e0QUhqlQkHKS5mW+PkF6qL6
	4YlA5L/l63YjtZxf
X-Google-Smtp-Source: AGHT+IE9nJtjc1YLNzeaiAKHHzczdPXp+pldjMGjYS4lTNCHnzSQS3thqbwfWXGSN8CjhN2TnoxyqA==
X-Received: by 2002:a17:903:1205:b0:215:a60d:bcc9 with SMTP id d9443c01a7336-21dd7c55e51mr342130215ad.2.1738553177871;
        Sun, 02 Feb 2025 19:26:17 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f3c0:b0:250f:9437])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848ace140sm7799046a91.42.2025.02.02.19.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:26:17 -0800 (PST)
Date: Mon, 3 Feb 2025 12:26:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 01/17] zram: switch to non-atomic entry locking
Message-ID: <dj2k36obadhbxlvecsdhdyf7edkmtgocf55jkbiq5gbnpvkygt@mcwolkrhicvq>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-2-senozhatsky@chromium.org>
 <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131145536.d7a0483331b0ebfde80a5754@linux-foundation.org>

On (25/01/31 14:55), Andrew Morton wrote:
> > +static void zram_slot_write_lock(struct zram *zram, u32 index)
> > +{
> > +	atomic_t *lock = &zram->table[index].lock;
> > +	int old = atomic_read(lock);
> > +
> > +	do {
> > +		if (old != ZRAM_ENTRY_UNLOCKED) {
> > +			cond_resched();
> > +			old = atomic_read(lock);
> > +			continue;
> > +		}
> > +	} while (!atomic_try_cmpxchg(lock, &old, ZRAM_ENTRY_WRLOCKED));
> > +}
> 
> I expect that if the calling userspace process has realtime policy (eg
> SCHED_FIFO) then the cond_resched() won't schedule SCHED_NORMAL tasks
> and this becomes a busy loop.  And if the machine is single-CPU, the
> loop is infinite.

So for that scenario to happen zram needs to see two writes() to the same
index (page) simultaneously?  Or read() and write() on the same index (page)
concurrently?
