Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966421B90B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748560480; cv=none; b=cZmEU//RisbEyUatN/kBK1Hic7lXbnJ0lmxlVcHkaWYkXa7Lm5GNSwzjal+J1Ppd0DXRND7loQp7U/XnT4UtsYPwfWBG+my1fi4tuBN/WPHUu4Xa1rgX6VvC6UH+Wq4ktc5vdRgatUgqB5oTLBHoh/vr+xhqdR0XLbwtQ1uS5Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748560480; c=relaxed/simple;
	bh=82aH58/OR0lhXutdEGfFFolRSVqVk4YWdp/gYCJthhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geqo4juA8fChaIimykb4NoU4wnA/ExBPnEyh+l979YDThh52i8HCgYtT3kqbEdli8XO32JV4Mz3sW4HxM4oFlECxPUgdnWeVp86mbzz366A6bqvtIqOXtJ3xk6Rh4T3CzdXVvQQrcjaUe3S7aXP9Qf6YyfNFkVxIU236YuxxWfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=HyH5Ogtv; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="HyH5Ogtv"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a43cbc1ab0so11139881cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1748560477; x=1749165277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/B8M5wTYZuijeurw8QK1WHO/ILS2jrTlhZFmFoRTN/Y=;
        b=HyH5Ogtv/bAKYdeGFzkyKULzvcWBQ61X3a0HjhTxtCLXQX0Bl0xKR9BEh0KGoKMKSj
         otczVuO2br0wmF2rFklkafmoV0hxzHen4tYQB9A/FsAJb8nBmfJlVKYIZg+1sB95cCOq
         Zy9Q9DW18+JYlsFZApL8iyVmqLn1Jgfg9thXFshmBAr1PgBakIgGdh4tymdC91HRIoY5
         sRQtefrELhWmW67eLkro/GffOiRU3/bxcF9wZZqXQeXPPAPmhqIU0f7y54/VnOF5w1o1
         VoZAc+xqNcLdkQ/bGRjCfsPrOKVrRPlmlfBSXQxdoeUUE2Y8Be3oxDifdR42JMvqka5x
         MhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560477; x=1749165277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B8M5wTYZuijeurw8QK1WHO/ILS2jrTlhZFmFoRTN/Y=;
        b=k7qSnUvNmHevRC13tPQla2CtpqUpZG1kbYzDHrE1BvMVRbU0riEfM/QdW7oJQ8OKz7
         JsjvwT0NHYz+8PsVLnmao9f0k0hX8qaf9KcFu+/8fB7UBmMjivWU0ESLQuv6/gPxG7DF
         FJTM5gEjPcvnNPRt1zof8QmosgLzI04ofcLiEuJyPCgclKAkvsIEq23310tDHvOwtbWP
         hcKZhzyL7pN4+w3blZ1aaRYS2u4U+4sgDfVNGW9vOOCpa5RTOBIfHE1g6morcTfLcB4D
         XgKEhoy44G1afx9KTHnK00f7XSMBY86raz5uZVSN7G8ru8xLYf3fFo+6KL3FYIulrYvy
         Lwiw==
X-Forwarded-Encrypted: i=1; AJvYcCVpH6N7L5QTR81+ILm3XUrV5tcj/ZV5t00eBX9f4G+wXpShvYkmhkR5dMX1FHqOUcGT0cIJadC7H9IZ+tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCX9vTTQgPFNhYMPcf5QnBiKn7E5HD0jCa5ESTW32P1GUiwhsj
	jVyUpyk4W6lqjIAiK8a6mGq/yAX28OBzhiR5P2juUGAxMgsctoMJP5rTOd7P3Isdh00=
X-Gm-Gg: ASbGnctffZTls3D5lKGI4PduOUU0EP8hEgXo94gI97cxjOteDD23Y2v38sj4bhROSoS
	65yppqEqjnA7qFEGwre44+a9Lne4TFqUHEa3srQf46wniA2p8vJ/gyqQ6Wli/oMFzbkG3XXQ1ho
	r8g/5WKAYk0H9OLjHOonpEDvkgXISBYCEWPHi5u1ZKoDobP2y0iLQwzIDyOH+aJj+GQhE6YuVYr
	NMG2Vc+0SvzqtIG2tkwqhT3PehvbzQycj+V57hUfRw90J3S5axGcXu+rlf29mGQ0ocJXWOFLB1i
	oLfBLL2bpitAeFcakkLNtGNrqLbt74W+RgD5SH2Nz9FVfyy91Q==
X-Google-Smtp-Source: AGHT+IH39k+/aVil5iL6wSfx1rri1NcKXfcLj3pE16Pc8yYjcX2Yvk9Lsla/f5OW48LamZwx8C0WJg==
X-Received: by 2002:a05:622a:608f:b0:4a4:3924:96b9 with SMTP id d75a77b69052e-4a4400e2419mr23361561cf.52.1748560477322;
        Thu, 29 May 2025 16:14:37 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a435a377f1sm12758531cf.61.2025.05.29.16.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 16:14:36 -0700 (PDT)
Date: Thu, 29 May 2025 19:14:32 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
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
Message-ID: <20250529231432.GB1271329@cmpxchg.org>
References: <85778a76-7dc8-4ea8-8827-acb45f74ee05@lucifer.local>
 <aDh9LtSLCiTLjg2X@casper.infradead.org>
 <20250529211423.GA1271329@cmpxchg.org>
 <klrw3rjymes6phs5erz7eqkjji5oe3bg4j4jbqpjv3qzuw4vra@k6ei5pssfany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <klrw3rjymes6phs5erz7eqkjji5oe3bg4j4jbqpjv3qzuw4vra@k6ei5pssfany>

On Thu, May 29, 2025 at 05:24:23PM -0400, Liam R. Howlett wrote:
> * Johannes Weiner <hannes@cmpxchg.org> [250529 17:14]:
> > On Thu, May 29, 2025 at 04:28:46PM +0100, Matthew Wilcox wrote:
> > > Barry's problem is that we're all nervous about possibly regressing
> > > performance on some unknown workloads.  Just try Barry's proposal, see
> > > if anyone actually compains or if we're just afraid of our own shadows.
> > 
> > I actually explained why I think this is a terrible idea. But okay, I
> > tried the patch anyway.
> > 
> > This is 'git log' on a hot kernel repo after a large IO stream:
> 
> Can you clarify this benchmark please?
>
> Is this running 'git log', then stream IO, then running 'git log' again?

Yes, but it's running git log twice first. On the vanilla kernel this
is the number of references when we usually activate.

You can substitute any sequence of commands that would interact with
the git objects repeatedly before a pause where programmer thinks.

You can probably get similar mmapIO patterns with sqlite, lmdb, etc.

Periodically running executables and scripts are another case. They
tend to be less latency-sensitive I suppose, but would still
unnecessarily eat into the available IO bandwidth.
