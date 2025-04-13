Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171697DA8C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 04:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744519534; cv=none; b=jcYhYz2M7FfUpxFEIjDPc5ZHF2FWrNMxbyQ0u6bP/9M+4bP2vYo+uwTQ4TG6WJVblQWO9n5XKvq0+50nuPaSdTuktvcj1GRcb68WlUTJB+DI+6GAOgZ6b8c06y0aVzSX8oJuAgyt40nPsM7QpGQn54zw7YLIoK2FJiYj7sD+cEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744519534; c=relaxed/simple;
	bh=lw5JRYrm01bZN/WGAo/rBu1PEwwZZg9mW50bAbmZG80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMqXh2KdyXqKHnjnuvfjy5npbgoFDZGn2flI11Yxe03ErGdq6DO8fUqudqoqetv+5VMazTFF3JdVelBA4tT0RDU0eLJ+jR3hptSqNuLmPxp482hNJtI6tDpPpZOT1tOpI1Cq3eFtXgvnmzBswJH6Ae5QfMJyI9kzSUZhaLfc9GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=fC+4GPOv; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="fC+4GPOv"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47662449055so16940091cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 21:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744519530; x=1745124330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C8uy9RLe6EmydLFrJvcYXD6QVbwFOjWHkxU1MVvas60=;
        b=fC+4GPOvc0TNKLU91fWR/oAlTiylmF4DyYC53+lIYOC6Y0xvVIBvO02dkR2jij+s1B
         I86Js7c0H6Y9s9FzB7hhlHOFIr1dXJJoM4tif9nl8sRTYKyAMBkvZmNVEO2ESzrDxx/R
         t/lqo4EgthYnAR2u55xs2dAlC/nkhB99RIbiTx8E+cniMjUIIwUF9m1NZCc+R+XP9BKP
         BC+lzfjkMsMUBajCdXAJX0cCcNNuhZRKLMxFjTkMu9WefGmG8/vXEEFu01RG9izJ/mt3
         9mR3NwmLlhLnKGDP9WZB4kYTH6SznSr5paRD+SdvCCfh9pO6zEQ50IIeuJUzF2MZkTYY
         Y3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744519530; x=1745124330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8uy9RLe6EmydLFrJvcYXD6QVbwFOjWHkxU1MVvas60=;
        b=NJfDaCG6kdjuE4fvP36suJL4+3jusBEKnuDQmmfzpB44pheplBu4eSQWWBc532fOsS
         3utk3jCjRWmJuB2Z7qPkZUkgYjoHvpMYrlr330Upt+wJTrFIMZicabv5W7HFkC+DcLF/
         OFm2FDyx4ytaH3THkFI/r6tS2xk6NoeeQJOi3LT89E0STh7x3GGUgO5OHkfoAsP7zz0Z
         LtWr8AjnozjkkkV6ZeSwh1/DAfu9zXaihdIKlgsiHFDnF0xzkwBa93RiUZy+mLmg6vkf
         R+OdkIcGWC0+SyhmtFj02+3pI8CbshVbaFCTPF2fjkm7JPWIrJG33YmwMnBpTxqQ4zf/
         779Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZJazDq4Jq0c675jMZ2vmsdCAqxES5p6uT8dabIGKpjTofdzLeA0W/ATC3W3pnxQA3PWC9EpaCZrBqZMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXX0E74gElCs3qnhgK9V9vsViH/0k1io0Pe51pN8Z0g8uqP5RX
	dT9JCvS3O46fnkJL0h9ngZbLwjddoxhgnrb6nQlZRPc+Oyr9YiExvHqTsLZ+K0A=
X-Gm-Gg: ASbGncv7qbQEu4tG8Xl3N8s9y2cbyV5ii3iVScjti6OP8RGFtTZsi+ycMF860DE5JPg
	ZYBVafIafH+oGLHJxnnhTqM1YpyBt2/7gdZCqzA+G9GfohnrMmcLOHPcp8SVQILGV8S9ODQyvQo
	SiF1wIcoHeB/ysGGEELYjLpO/QuydVRTU9z2S95qd16qXEqvb7i7xQpK1mvBAffirgEHrb3qX86
	d98OfZiFLtbEyyXKvZXCwO5pqndFU9oEAzCoBCLEB+L+R1FpvjYHhSeuVa+5/yMICGTjD62hxDm
	92Pn45+G2lxNmtIXEHlI0nNiU4pNVXmxCl19eeQ=
X-Google-Smtp-Source: AGHT+IHkFwzdLW17zoH0eIq/02TMpxPx02NyI7kV8LC8mAi0cTvY6AEe68rUu7uwJoEMv6jrZvCPzw==
X-Received: by 2002:a05:6214:500d:b0:6e2:43d1:5fd0 with SMTP id 6a1803df08f44-6f23f11d25fmr122831646d6.31.1744519529530;
        Sat, 12 Apr 2025 21:45:29 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95fd3dsm60193846d6.14.2025.04.12.21.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 21:45:28 -0700 (PDT)
Date: Sun, 13 Apr 2025 00:45:27 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: add MM subsection for the page allocator
Message-ID: <20250413044527.GG366747@cmpxchg.org>
References: <20250410090021.72296-3-vbabka@suse.cz>
 <20250410090021.72296-4-vbabka@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090021.72296-4-vbabka@suse.cz>

On Thu, Apr 10, 2025 at 11:00:23AM +0200, Vlastimil Babka wrote:
> Add a subsection for the page allocator, including compaction as it's
> crucial for high-order allocations and works together with the
> anti-fragmentation features. Add reviewers (including myself) who
> voluteered.
> 
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Brendan Jackman <jackmanb@google.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: Michal Hocko <mhocko@suse.com>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
