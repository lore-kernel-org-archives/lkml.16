Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DA34B1E45
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686006; cv=none; b=HU7JLhJqGa1T+MGH4dvp4L/H6vDTo3mdGsu9Jw/BZxVNJWBO9wonfID6ue8af8DwpJqyyLRJGfbIZJHO0MAVhvptCnmv8hVzhRdqvCUJ1Sjr11/Mb+vNGZLfAAa1AZL+wILDHJFG8wjDR4+R/5szYN4SEmFzjeS9jAgLFp7ycIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686006; c=relaxed/simple;
	bh=v/gZOoYkpcXqBs6iIOIuHeFy9Ne5qxFjnODSuurr3zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YwTRGeUC9KoGz+bZIoosOKK3a206pmxjSIqtG+ODv9eZK8QuM08yyzqYP4m4Z/j9bPVd6vLSdHAALCPpOh7W8gc/3tkYQ5N76SP7yOyRRK3+1FqQpso1qMLYEr0NLyk5G63zyILUJidAg4fyeGt23rDWJJRbwaaFYBHo/KDb8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XDnvnMnB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XDnvnMnB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b1fde81de05so350910a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746686004; x=1747290804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlgheUo164rlqXvFGQwU6HpEq4bJ/pYk3yvNMQQtoWM=;
        b=XDnvnMnBScY2mTm0aoQDPW7WOzY/gqxeRz5rg/Ci3LeWf+OWCz+v6lKCs+Zr5ySq7m
         RhfmL750lT6c8aFW7Q+AgKwRQNMCRMXay8L8zn8T0pFZJZdv/8dzSzjF8/SkmJXUk+VO
         VqIC6fV7/baigvrkQJX8L2KBciS1leJX18yXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686004; x=1747290804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlgheUo164rlqXvFGQwU6HpEq4bJ/pYk3yvNMQQtoWM=;
        b=aVxId8V1r1EepL409J1ywAXYSyawmYdg9pzV6+j/WS4JfFCwucHFCTg4IOpW5Setu4
         9yXsvKrLy3gVe3dEYVR47aI72Ay5GK5ylEIlNdRmoAoektbGpFUSPlctoY0X4D+eGwpz
         L6zw57TVZA/ux8K9LeN/a91biF6e5Sn1jEopJRWu7jL8BbBtD5HgNp3d3kvDLbCnn9z8
         dovwWAP0yf0q9936PD0wDKytT8rPE+TGVMDU7FZRE/gsgziRjOd+7SoIPWGglx8/Y9MQ
         ggavmeQi7DViBAdf0EYiN+H4Of24lLNfSiLMu9Lx684VdfohFt/PCNBRUIt+6BpTgTXL
         ZFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs3uJTXEVSEbp9Zsyk14ZJ6h87FzPjQmtmqYXCgfG96oPgPjJqie7aNIY56sYbjCXWO2CC1oC30Lku86A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9XC87jqtM9GAsFISd4I/0CgBKYe+kgsr1NmFYNoAksMv1jKrr
	f/9BAsgEaOFf7fLpnZevOTkqDedJbMhfLh2iJo6a+Z4H72ozzf9J2kpUxLIw5g==
X-Gm-Gg: ASbGncvzYx8h3H0ZnOZrHizi5lgoU1AbDvYlS5Ia5jPX/wnGnLW5ZFe13GKiTfTE6nR
	x0PZaBusqBXD/rroY6Ib37bS9xHUeuFQkw4M7GudmB1yX5ozDsQ3dk+4VyvteiNWekdcqYpWrPj
	aiwepDpuh+xlFQHt1xxhjQBuSNC0IXHkDVNAQNVmnLtuIV8GNOJ5Y760a22wN/ZD0LaDX2+GzMw
	eldC7gCsml4+XfNUoyQQHLapnNsTFyfrV7QAngcap+J2Xzr9fthWd41z39JXx7TAMabW+nGi6Vp
	akqF7HCXEWlv0jn65tu86UO5EMLgQ1VrhdjBvi/cfqqF
X-Google-Smtp-Source: AGHT+IFTxdpBpcI+dt+ewP/ixBZ5/vcOfiMsuXdPx9TL9kjiJLwdfxwmdioqqOx3ETJijnVQIrm7Kg==
X-Received: by 2002:a17:903:1b6d:b0:224:255b:c934 with SMTP id d9443c01a7336-22e5ee1e42emr85523305ad.51.1746686004087;
        Wed, 07 May 2025 23:33:24 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c794:38be:3be8:4c26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm11012065ad.17.2025.05.07.23.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:33:23 -0700 (PDT)
Date: Thu, 8 May 2025 15:33:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Christoph Hellwig <hch@infradead.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>, 
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <fbftgni67wha2c6zdx3w5ccsxwlrr5yog6ifipkr4ft7h3hezo@kwb66muoctdj>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
 <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
 <aBsDj0IGQBJC_JMj@infradead.org>
 <unyov4aypoaotj56m5scgd4qtjfn2mceb4zdmtaek42dfqaq3t@lrrqwojlmudp>
 <aBxIlUYEPojTopek@infradead.org>
 <at4djawky2n5d2nrxor62osid3mkaid4ttmlmc3xwsju2hstun@bos2kgakshpa>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at4djawky2n5d2nrxor62osid3mkaid4ttmlmc3xwsju2hstun@bos2kgakshpa>

On (25/05/08 15:17), Sergey Senozhatsky wrote:
> On (25/05/07 23:00), Christoph Hellwig wrote:
> > On Thu, May 08, 2025 at 02:58:14PM +0900, Sergey Senozhatsky wrote:
> > > Oh, I didn't realize that zram was the only swap_slot_free_notify
> > > user.  zram already handles REQ_OP_DISCARD/REQ_OP_WRITE_ZEROES so
> > > I guess only swap-cluster needs some work.  Are there any
> > > blockers/complications on the swap-cluster side?
> > 
> > I think the reason it was added it was so that the discard can be
> > done non-blocking with a spinlock held.  Which seems a bit sketch
> > when calling into a driver anyway..
> 
> swap_slot_free_notify is not guaranteed to free anything on the zram/zsmalloc
> side. zram attempts to trylock entry

.. I keep forgetting that slot-free can be called from an IRQ.  That's
some complication.
