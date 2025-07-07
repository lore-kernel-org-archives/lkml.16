Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CED28A1F2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874816; cv=none; b=XRfzV1hkAZkUL1e4vpZW+EBQ8DppaOVUE9LF24SYxpHrjM+3UMKh6DFzbfk6OYeeWPDT3G+bgl1ZhuKLGgjnAzdU6ptptQwSIUkdCu6er2xDGqS2x+EUy6qse8OyP0O3jslzd5Z/knnevjK3KzvpiV2XamvmP+ZwE0IXhcyRIcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874816; c=relaxed/simple;
	bh=KwFR9xyVnnLfuylQlG7sb+XE3e7Bc38FxKjn5fUYmCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABE68118AtR6oWIZKjSLbscq9xVKjDLYrcy5uAE04GDpp07BpieUgkhforCXHEog4Au2sKbvijIIgUJh6RTSNKycF28k+1DX1b/Q3jOamzcRp02ui8sPNCxb1J+ieQ4nBWZCFGXpEV49lLpuGxyzpmlFZFdWcltTUPRaIllky5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Str6ZMwB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Str6ZMwB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso29885325e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751874813; x=1752479613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t1Okpmh1buK1WgbPFPnBrSgpONpB/cKbKxghn+7iu8A=;
        b=Str6ZMwBYLLsXgHYWj6VBHs1eeN4rg8pSH8GkSnNslHdJIUhZEMi5CZddfc6Pky+Px
         pZWH2RNr7V49o520I4Z0qWMwp7iU+D3PJDZ/zapzoE7tB2x62+PIXVoBaJjnUAzhWnA6
         +blMoGhNqqyIeCyjR2OSnaClbh2jTw6FfxpHweq1wWvlbkp9/cymMBXvzAYbX0BH+iPT
         MtoxAw2nDgyEM8D5x4X04IhHcT1yr52AAtUR5PLWA2KnfzFo8f/vXTP0ET8dDX6l4yGm
         DY7wSVaUyP+87Un99dQeY/C7UbE80N0Fm7li62I8u5zLBVeuMbybmg+Os8UmSxkbrrXo
         q2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874813; x=1752479613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1Okpmh1buK1WgbPFPnBrSgpONpB/cKbKxghn+7iu8A=;
        b=CjLFwuYiJoGxjG6RdffxZoTysP2gmcRVYqVcuQypjCoS9XgegyrFYvPiBPuOlNiqeV
         /QsLEWFvBdvAPe3C9GuDJ5cHEIO2HwHLuVHoKQ3FYebbMb5M6XpVZiBQtxqe7GdKBeOQ
         8g/iT1qO+mLK2ZMb5WgS2BY+d10AGACREyXLlOLeEriqImeZ+HH0DsSlGxBFDiEZ8eMY
         SpjH95ztaVd/4scxQyCerWo24Lce/2Qr3uEOnp6Y8ZNnOet0bM+VSCpaSqbeGWCaA/xN
         4j06d0u+zetnJYPccE2ptzhV/8KHUJ0/PlSdlFGQBg6lVgtBFMBdfOtamRaepvIjX/ot
         Wj8w==
X-Forwarded-Encrypted: i=1; AJvYcCVOYaLRDroxm1gpqlthcK2Lzn+3QCKKWZm1u3ZDP8DqneuHXjcHNtgFMPYKOk3IXKwheMFFXDxi1vfl2sY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4LC7lAU39CY4uoisyDfWpq92nr6b+aNGI2iH1UT97aNyWRK7J
	bUA18dtmV4ZfT4ZySAziP1A+2dhmKh3HKGd12hxNWrzzwS8UzWbf0h44SA6v5XaQSs4=
X-Gm-Gg: ASbGncv05v6CrFKrDDRwA3ht8YyHNaPBz2P2jbgKZQIEmF5+Hau0Jo27Un/6FXj56av
	QZMDmsluWzq1DNsjOdr8BXGm2sV2e9wbqQ12MYkc6qHsHyOWVqGBSHjk2JzdCYNJi/yOEvOgO7x
	dx+Y6EXvRe2qKb/2+8nyJhmJBpS/9wd3mABKjedK76Nz7BkEyYQmHIF6Q0hA4d6Z2YtdqSr2PdQ
	W+4P6HkxeFb0gn66sdLRpaXJ/40GyIPPU9bjekuSZkCgVcGwprQgBGxxsAk0ttgYxaUjt9xIRg3
	5EV0mfVkf0loU1FhGRZX0qMj/Q0fZbkomSKxFLRWPMHZwP6WKFPrGNfQN6fK/MbB46jDGIgBlhM
	=
X-Google-Smtp-Source: AGHT+IGnqvSWm29YP7wX6hjXcVJcaB1x2eCdgQxRsL5WTn87IEOjwAQMdjmDOMI6vGlwr40PeKJzWg==
X-Received: by 2002:a05:600c:5251:b0:43d:4686:5cfb with SMTP id 5b1f17b1804b1-454bb88a2f8mr64405185e9.27.1751874812666;
        Mon, 07 Jul 2025 00:53:32 -0700 (PDT)
Received: from localhost (109-81-17-167.rct.o2.cz. [109.81.17.167])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a998a731sm131477575e9.17.2025.07.07.00.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:53:32 -0700 (PDT)
Date: Mon, 7 Jul 2025 09:53:31 +0200
From: Michal Hocko <mhocko@suse.com>
To: Marco Elver <elver@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Christopher Bazley <chris.bazley.wg14@gmail.com>,
	shadow <~hallyn/shadow@lists.sr.ht>, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>,
	Alexander Potapenko <glider@google.com>,
	Christoph Lameter <cl@linux.com>,
	David Rientjes <rientjes@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	Andrew Clayton <andrew@digital-domain.net>,
	Jann Horn <jannh@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC v3 5/7] mm: Fix benign off-by-one bugs
Message-ID: <aGt8-4Dbgb-XmreV@tiehlicka>
References: <cover.1751862634.git.alx@kernel.org>
 <740755c1a888ae27de3f127c27bf925a91e9b264.1751862634.git.alx@kernel.org>
 <CANpmjNNQaAExO-E3-Z83MKfgavX4kb2C5GmefRZ0pXc5FPBazw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNNQaAExO-E3-Z83MKfgavX4kb2C5GmefRZ0pXc5FPBazw@mail.gmail.com>

On Mon 07-07-25 09:46:12, Marco Elver wrote:
> On Mon, 7 Jul 2025 at 07:06, Alejandro Colomar <alx@kernel.org> wrote:
> >
> > We were wasting a byte due to an off-by-one bug.  s[c]nprintf()
> > doesn't write more than $2 bytes including the null byte, so trying to
> > pass 'size-1' there is wasting one byte.  Now that we use seprintf(),
> > the situation isn't different: seprintf() will stop writing *before*
> > 'end' --that is, at most the terminating null byte will be written at
> > 'end-1'--.
> >
> > Fixes: bc8fbc5f305a (2021-02-26; "kfence: add test suite")
> > Fixes: 8ed691b02ade (2022-10-03; "kmsan: add tests for KMSAN")
> 
> Not sure about the Fixes - this means it's likely going to be
> backported to stable kernels, which is not appropriate. There's no
> functional problem, and these are tests only, so not worth the churn.

As long as there is no actual bug fixed then I believe those Fixes tags
are more confusing than actually helpful. And that applies to other
patches in this series as well.
-- 
Michal Hocko
SUSE Labs
