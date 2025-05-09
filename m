Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E82F1FF5E3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768781; cv=none; b=QTF87CYho6JjTYy7vdyNxUnHM9zT4+lY2ImeYvBVAjSWjFYJ+SFCyQPMIhgjFwrZQukdlF9sPWD0mzLHfMLEUVfTPQc/1d6AvSoNLKaoABZMF8jV06RRS//en1ArzbfYUfVIlc11SQArqGGDX6Mf9Iv4s2HGCZ/bAnfyFi0juBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768781; c=relaxed/simple;
	bh=ZUFSePVyuwdotfq7VANW0TUfxn/fCucz8B+J1njN1q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTYxperv/Q0qTnRcZ+mSeIQG4Vu1fNZdBKot3VcTEWtWixCRYZhvA4PVzdo4VAlvBiKJYej7BBoVFmd/F692MM/RCI/mjzfXhPy45pzqhfbMyb0D9uTAXA/cy/5qPpqEbmmPqcg5LTY7FuagDbZRcKix0zOiX7/+OZs/fC4tRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=E1qhu1Ci; arc=none smtp.client-ip=209.85.160.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="E1qhu1Ci"
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-476b4c9faa2so23112171cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 22:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746768778; x=1747373578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=feKbP8aErbrH7jN/K2XTKYfx7P/IHEPUq/2+MdM9hjM=;
        b=E1qhu1CiTfgkjG0YvfgJEV2W/76+qQiaRL1Go8l3Av8Oh499jFDHihLbAmxVyMcEZh
         9eh0YoD3CPbGcWXFbTy3dihEbVS4+R9dPPpfrKtULYnh1nlpbqKI8FKaVQ8X1WbgxHJj
         HNY4gbu6sSzXqHMQz0ZonMJ/lHIGe9RUF8ir6OTaHo6UTSBiJsoKyASg0PNErZcARnBo
         4h6UwXAlsoePShfMhvKyRM7X/J+bHRDR9vvhZKHAlYX9PSOReYmh9OjJ0QLjiaJoNUoP
         AJZ5QHsL2jnicybi9OfhR4RYbEYuDm6K2en3PS3PRYRRI2JlLXUfrQeyYpmpggtHvRYu
         3kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746768778; x=1747373578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feKbP8aErbrH7jN/K2XTKYfx7P/IHEPUq/2+MdM9hjM=;
        b=o0sLdcEkNpkLmqM6T5ZqgDZJUDrqpNsUbC1eMTOdvXt19xeReqiuoou/fKuOr4PWfh
         1G2b/WLHsJAHhB05izZMo1LZBuB9xyMXupnLoM0IQobv7U5bBy7KH5cX4BaevkcIan7U
         gBHf7MzHR/0X8SeyecfLsBN9g+yrlBthMv1EZKl6FLOgZl5f9xNNCnAQtpTBwShkPlUK
         57zukbV6bHoBaEoRiN084Aj/8F/QphCZs0dQaEOwk54q0BGjoPsZuU86MuyECafWarPb
         Uw4Uv1+gLeshcWXxWU7b7qaIG7kY4oa7yBj7uxphvyOnQr3vSaWETo/D7Slag3RCdHY3
         sn6w==
X-Forwarded-Encrypted: i=1; AJvYcCWQB7dzQzrltXTzXMXInj8rzmbFxOmdFkMWK6s2SbWV3W727MWKpDTOUVpITret3kggavB6KQKfnk5HBGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymhpm7pA8BlhmWDdySdFFL9UMWGRbhJ+cViGkwweUsJjmC6UNs
	IPE8JHGtlRQ3tbGpbM2rMsGHuGnJqW5EbS75YbEkHCh+zVBcYQuZsoUh7fJ2sto=
X-Gm-Gg: ASbGncvg7BFcpcUB4w0LYsg6mc4TNR6Mgxp0JfbB9bbLpplghKFm+NTbpdVHrN5ipGQ
	ZXUTVNeQUalyuscp3k7zZ+zz1YBMLhS40hwc8HNXI7B8HGMZ+Ejm0ZvgrrQ4o3Jtw9RZtOtZLgA
	49X/lwCQfWEaKiPSxLNJ0SrVpylAqQWUIYGGmICniiJR5nqOPVu+A5GuOd+STkid6Huo/4Pu85q
	0Zfpjt9fQo0LM9MoI2+7qIg0+wwi8WLP7ciEIFFCKydiZ8Zcv3E2w0qEuDIqUAwOZpL1P3IWGBT
	njzN7qb/yqpD9O5UYupjLN5CB1TTFQqS4GXpDjw=
X-Google-Smtp-Source: AGHT+IFgsSVlpT6UPcXtr93l/60HISYB878/SWkwE6utdKEcy6nslIq9Me1Yp82Eezu0HXCwSbRLtw==
X-Received: by 2002:a05:622a:56:b0:491:1874:bd9d with SMTP id d75a77b69052e-4945275e65dmr31161201cf.28.1746768777757;
        Thu, 08 May 2025 22:32:57 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4945259e88esm7919651cf.74.2025.05.08.22.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 22:32:56 -0700 (PDT)
Date: Fri, 9 May 2025 01:32:48 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: David Hildenbrand <david@redhat.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>, Yu Zhao <yuzhao@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
Message-ID: <20250509053248.GA606476@cmpxchg.org>
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
 <mhnz33dwwd3npj2re7dn7invntzk6dk7u75ue2pzg35vdappjd@tgqlccmoydar>
 <7d214c08-56ef-45c7-9ba3-18d7e4691efd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d214c08-56ef-45c7-9ba3-18d7e4691efd@redhat.com>

On Thu, May 08, 2025 at 08:31:28PM +0200, David Hildenbrand wrote:
> On 08.05.25 20:30, Shakeel Butt wrote:
> > On Thu, May 08, 2025 at 06:37:35PM +0100, Lorenzo Stoakes wrote:
> >> In furtherance of ongoing efforts to ensure people are aware of who
> >> de-facto maintains/has an interest in specific parts of mm, as well trying
> >> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> >> files - establish a reclaim memory management section and add relevant
> >> maintainers/reviewers.
> >>
> >> This is a key part of memory management so sensibly deserves its own
> >> section.
> >>
> >> This encompasses both 'classical' reclaim and MGLRU and thus reflects this
> >> in the reviewers from both, as well as those who have contributed
> >> specifically on the memcg side of things.
> >>
> >> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > 
> > Seems fine to me, though I would put Johannes as M (if he is fine with
> > it).
> 
> That would be lovely.

Thanks for the votes of confidence, I'd be happy to do that as well.
