Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053722AE7A
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748553271; cv=none; b=ChX57spS1bTA2Qup30k5hY3aPPSxIs7REz1l0Ae8cwqBltkudR79KSnmo1OPPk5/gghWSnDV0bCSdX23n53IAfde/+76FZaYlu6K2492osa7lnbihjnOKVctV81XnmQJihnEKZfPCoF8tXBOMXbXyDn3MuZB2FjxW0y0Zq7fRvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748553271; c=relaxed/simple;
	bh=f2V+KIgGDqpJw5DRwUoi2QcYVW2mJSTHqLwExpmGN88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJVLQcSj1TUoXck4HfmWbaISB4tTLcy0dzd5AvZ+X3TRa234keOzwEkKtIddz8IdgVNHJurqbARfcRW53nULGionVnC52hDtr1vdJcWGwcINeYRNY3Yop9/kvCfeAqoxtpgKwFTeTXuczl1/oSy0Lhq9VM326BYXWQc7IXE+v0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=Vxs6T9k+; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="Vxs6T9k+"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so2706246d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1748553268; x=1749158068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Inx4pxLodq6Sj+uZt6mETSZ7jbelrfRf7zZ42eNDTk=;
        b=Vxs6T9k+ecjQRDHhWyPzMZw+Lto4eguiKjed1CtN7lrbqeY382pBYLPZVomk0G/UCG
         J4vpPAwy+lOBUMFHI/2hCR5RNKxlStexzZUKrn67BjtJP6m19mmZut8QinQzdkmKepuu
         rivQHK8dWJyeteALAfRy7nqs7qWZKrU7mSKrGDFxQ2h9GLlRb1RQEBJBNSlPYHSUnEwd
         AwmSWxz1yZPvGiYJn7VVqOWas/vYRhrIfjvHWH6eQOpB4MVNZdyIfj0UJF2emoE41Trr
         Uzhnb9QinScEoltgNvnhnjmGt/+2/n+afWq/e6Ef29la1A6AQW3PGpmTLBq4ITopkk3o
         hlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748553268; x=1749158068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Inx4pxLodq6Sj+uZt6mETSZ7jbelrfRf7zZ42eNDTk=;
        b=Gwj975tClqzbA+ERt/VWz4RDs2DMIhNSJ5XhzPmQ2te6cvlGsv0ugadp4dqehY8Bna
         ZNHyBmCnuMWv3x6fPn7WWYXmKjuCwx783/pShIY0i3hlFnW1Z+Qi6laG6J0YH3Xlp2hd
         /AcEf6a5ADItJxHX6Jqy3b/2Pb2Qp9prKFTWLnxwXmJY9sbZjhc4+hM1fEy/yon2A/0J
         cpErSHbP1pyXJrqOzYMfhOibIPFxtDUbE/LkXxfMkbj8S32iTnFVy8J0VUn1/w2wrvtg
         +c0XqbBucaw9sqSh1i+MOzkNVMOJznA7qAkNjECiNBP5VFLeZObL6Vcz02925aqM2Cxk
         mJnw==
X-Forwarded-Encrypted: i=1; AJvYcCWwRNDzjqXLYGW90jITKYIj6idobd63g/TcVAj+ANkr/vy6DmsjeKgTP/1fZjeP/kTU5X3ijSZnRki/c1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWMjLEXo8/Wy9h5r1OjN1h4c0JHsX1tcU1ZneuJAA0BaSMLYTl
	tuTYnMKY9JAFmfq2g3ytJuUfOyIrIhYxIMvxs7e6Hxzvv6srbEvB6s25VReu4PxriyY=
X-Gm-Gg: ASbGncsgsN3mQDl/03wb8b469vOjNGV151/KCtAxQQJSUVvvPvEOjVPWJHrppHUXPqv
	NikZOsnhb/WxhAIUAhcV8LeJzpnvR3lytYGuNELTKiqH52jtXVMBMwhY/9uCsYBXxw+hmHll8Zp
	sF7Qw5E6JfVEr+HqWdAGAxEf9wtKbymTB8KL0ibTD9NyF3qH1H+HA9EhXyna0arlU+U4+0L5tqx
	kFjDzBw21MeZ7i2AqHraM0w5M/DE6MgZpUY6zkzCO58q31hg+5xcwZEmAUp+NHVnOEK88V+6MTC
	8G0wdSMQdjTRZnOXcnQjdMTEvrYm/kbsKZEgn/IC6LgCAeoXqwptEjKs41l3
X-Google-Smtp-Source: AGHT+IEtpO+KBuKwXes6mRCZhJwg+8UYV6qbO186Z2ilCwNYWWNTEzqraIWYWGdjAj73bOoeHhCr7g==
X-Received: by 2002:a05:6214:d02:b0:6f8:bfbf:5d29 with SMTP id 6a1803df08f44-6faceb61b39mr19113466d6.5.1748553268059;
        Thu, 29 May 2025 14:14:28 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fac6d4d77fsm13583166d6.47.2025.05.29.14.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 14:14:27 -0700 (PDT)
Date: Thu, 29 May 2025 17:14:23 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	SeongJae Park <sj@kernel.org>, Usama Arif <usamaarif642@gmail.com>,
	Mike Rapoport <rppt@kernel.org>, Barry Song <21cnbao@gmail.com>,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	Pedro Falcato <pfalcato@suse.de>
Subject: Re: [DISCUSSION] proposed mctl() API
Message-ID: <20250529211423.GA1271329@cmpxchg.org>
References: <85778a76-7dc8-4ea8-8827-acb45f74ee05@lucifer.local>
 <aDh9LtSLCiTLjg2X@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDh9LtSLCiTLjg2X@casper.infradead.org>

On Thu, May 29, 2025 at 04:28:46PM +0100, Matthew Wilcox wrote:
> Barry's problem is that we're all nervous about possibly regressing
> performance on some unknown workloads.  Just try Barry's proposal, see
> if anyone actually compains or if we're just afraid of our own shadows.

I actually explained why I think this is a terrible idea. But okay, I
tried the patch anyway.

This is 'git log' on a hot kernel repo after a large IO stream:

                                     VANILLA                      BARRY
Real time                 49.93 (    +0.00%)         60.36 (   +20.48%)
User time                 32.10 (    +0.00%)         32.09 (    -0.04%)
System time               14.41 (    +0.00%)         14.64 (    +1.50%)
pgmajfault              9227.00 (    +0.00%)      18390.00 (   +99.30%)
workingset_refault_file  184.00 (    +0.00%)    236899.00 (+127954.05%)

Clearly we can't generally ignore page cache hits just because the
mmaps() are intermittent.

The whole point is to cache across processes and their various
apertures into a common, long-lived filesystem space.

Barry knows something about the relationship between certain processes
and certain files that he could exploit with MADV_COLD-on-exit
semantics. But that's not something the kernel can safely assume. Not
without defeating the page cache for an entire class of file accesses.
