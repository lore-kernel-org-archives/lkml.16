Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26DD2F22
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739173978; cv=none; b=omyXIePVgbGTaF8tdVl/PifFbKcwwHoJqG7XbyRi6/Gma55Fo5ugomkSaXC8Ix1cWTKdLPD2rTlItdKr6pAh2DfRjrziEZEb2o/HBkwdMXHk09nXuuboW+YOH8mCso3afEdsHgN/5MR+7c5EuS1UX/hdNmKAVCvRaZ0YqQKGr/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739173978; c=relaxed/simple;
	bh=W8zdIY1rYsE45zOuPrzevizg1Izts5KX52qEocX1Sco=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhkCK8cjjIJ++HFUGaFPl74dZC8F7QcQX6G8eNnc6OwwEg6usmHLVhbjSUerkPT853mV4gbEu4iZJCHTr0NYCkiHiF83hgOzEHSF453HrAhcAYgwxtn1i6N51dJzf7aqVbHR/dNWhyUWjVpRgzZCisL2toeLqbc0vHW+EGmXnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=g9alD5FC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="g9alD5FC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43675b1155bso45067205e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1739173974; x=1739778774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qkfv43O1g5zvAJXOqIcSrZ8ndK2BrDyyauC15WFvoaQ=;
        b=g9alD5FCVL0Ag+3KY7hlP6GzVwTNT1zd8fRru50sDnF3J+wWjJXMdJTncklnrPrD9e
         5t9f3AeC2TECoU16lU92mutiM3TYOREd7Jt5EeIlRZr3AZvvG8Tj6Qquy487ErgiGOu7
         25PxjTc0c6hQGY1oQN36xzToGtxKhtgEUHNz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739173974; x=1739778774;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkfv43O1g5zvAJXOqIcSrZ8ndK2BrDyyauC15WFvoaQ=;
        b=pYueaSr1z+4Cz0ZuSsgwrCbfVQFBsM+HJTEFobuanqzImn+7egHWO27mbw06AsbSGF
         bZBO78BTVmwe6ufkzxGrmLB5PS+alzonGlY8scu7JXYhStW4zU5jShkigAcMFqsZZ41N
         B56ndYQOoGHd0vdCQzh5go4q6MFHknlySVjENd0UtkHG3oynl3qgCaLFdV75TyxlfAfM
         TwVipDa92R2H95EJ0FSd54Rr3C9fpNSbBg6+rWhqYXuASg5qajEeOUIR+uicChf0yPAj
         ncXHkHbsp7/wKlip0zM0ecH5KcZdUtrq2GjhKUa+C26uwxnUwb/xKoijGr84Hy7LJfBt
         +Cbw==
X-Forwarded-Encrypted: i=1; AJvYcCWO6aDLY6fhty+oOebEQnb4eBc5L/gvU40ydm3zmXQzoJgWK7TH/fDapef/s1sqKGdjyubs5m2YPhgntC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Pq3YqVAXbtWiQA7kp9dVxPB2CDWd8alnPq5+M/SCZwi4MIVg
	hbCKHNq0j6dmsH3oXOLv0bDFUauE73MZK/yL3cgq4FyIaoe9pBerJYPadz5i9Q0=
X-Gm-Gg: ASbGncs8zHN56+dZJp23RQV9WMyiujRt3IzqZb7o18s8H3/eDK68T3U0PWBt3iE2KO3
	4sjKOvQjsXG8GF46SkIapFSXapTGtqCQYaAmsca0BOPnBfXfY+cYpVTB8oOh655DOLWVOPhToc5
	t7Nbg4a/Do8Iy3yViK0mFo1UidSZ65pOrIUZYUiipVAbSZvMZgIHVxaNTsbxQ4zhx5ZdUsD0xAx
	VpdqOszwrzfBDnTtbLdl24wFyDBwl2R9THmE06AOSWWwC03q8OaryllFEJHoCxa2SUSm8iSjVWL
	AN20q2dOEp2ctb631o6UyH5hqDQ=
X-Google-Smtp-Source: AGHT+IFDgbl8wGVpble5Zv0abCqTht8o2Ov+/uOG64czyzOx5fpcCwEyGABd1B3TPwQLwmivIDhgfQ==
X-Received: by 2002:a05:600c:4f8e:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-43924989dbbmr123507065e9.11.1739173973845;
        Sun, 09 Feb 2025 23:52:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc565d62dsm10287702f8f.93.2025.02.09.23.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:52:53 -0800 (PST)
Date: Mon, 10 Feb 2025 08:52:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Hector Martin <marcan@marcan.st>, Simona Vetter <simona@ffwll.ch>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z6mwU1Yiy-PQ4lXb@phenom.ffwll.local>
Mail-Followup-To: Hector Martin <marcan@marcan.st>,
	Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	DRI Development <dri-devel@lists.freedesktop.org>
References: <20250130154646.GA2298732@nvidia.com>
 <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <4c143b85-063a-4413-a6ca-e9d80e26da96@marcan.st>
 <c5a49bcb-45cf-4295-80e0-c4b07083df00@marcan.st>
 <Z6YPfsDSNdRUskvp@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6YPfsDSNdRUskvp@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.11-amd64

On Fri, Feb 07, 2025 at 02:49:50PM +0100, Simona Vetter wrote:
> When you're that harmful with your calling out, eventually I'm going to be
> fed up, and you get a live round shot across your bow. And if that then
> causes you to ragequit, because you can't actually deal with the heat
> you've been dishing out coming back around the corner:
> 
> Fuck off.

With some sleep, a w/e and slightly less ill temper: As I'd say in Swiss
German, this was suboptimal wording. Or in plain English, a disaster, I
screwed up.

I do not rescind the sentiment I expressed though. I cannot stand people
who punch where they're stronger, and eschew conflict and fold the moment
someone hits back.

> Or as Dave Airlie put it upthread in this conversation:
> 
> "Being toxic on the right side of an argument is still toxic, [...]"

The irony has not entirely escaped me. Oh well.

Remorsefully, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
