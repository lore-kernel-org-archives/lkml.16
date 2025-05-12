Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA82571C1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036468; cv=none; b=vBm3JRqE6f8vEkyqRhH6xwdUgWR73gS6NMJnO6FHfk5vjm3vUORXqDVp9uB+ExRYu89PqYZLzllIG22tDctHh/ViXDmiVNhfutLkkXz88kA9iVsf8gCGOQgPfjOaL4GFxIgNmOHkjnOK5Ib0f9KlADc5QBrXDoeiP0NUbRW4H4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036468; c=relaxed/simple;
	bh=+Oo5fh9d8VnuMc4Nn+hlYERl5NdoZXlNbbYdekAcnpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZG6/oD5IKljQbsxEZCcnKdel0IyPIysjK1ywUwLYdJMqF4ihwSPmO40MkSkl00StUu7ckDU/EuXQLgg7OW8QYQmgXhHKhk8tGKLxhjcMT9mFxvcEXeh99yVPBxeA9HWAL2yELE2OtVpdKeJ1Br9cJwcxdHbXQ1pzGEVj0qTHX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XBCsmPTu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XBCsmPTu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso8333796a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 00:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747036465; x=1747641265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MWqGdFljhLF9kqr9O7GoIoJmYwn6/islKv50qdi93EM=;
        b=XBCsmPTuWsSImBKJEApuxkp/kHDhgnc4YKdeq3Sh2bRMvRUrMVfQZlmBsxLwVuFhJ0
         OnLUOhetH5iGTt7SQHOW91f1nsTzB9EwvWU9NzNWWJzeoE/qUMROSfCU194mnJkIWtB0
         x5HM3hHKOAcIb1TR3boaoAwi4Lx1S2YwKV7VVpdJ07Ph6WDAMwkwlfV+Y2AfPEuO2jEg
         w+tDW2l/n0RcMILhxJCVRgRqG/XUUQ/T1qzOSphj1NpMfP+VBbxWO7yCxhNpbTnbsxvr
         EymwyMD7XBjZk0ZlADxaFTE6Mri/6jnMFow2NuP20z2FF0H4bhoPVfirY3Eozg+8Hixa
         urSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747036465; x=1747641265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWqGdFljhLF9kqr9O7GoIoJmYwn6/islKv50qdi93EM=;
        b=P1gNyhZNzU05GZTOQfa22MQr9OQz3uuT5lRmYxtO+rD16J6Vi3P2yS/n/BxlLwCVYu
         +FPedMdQntvkPe73WhuC1d7nDNHpk2wEDEcq0utboev+ad2EeCJgJTUBajGBGr3sK5Zf
         Zd13u69dlK4SpRfIv92cIiZ98J0aScItD64Drd04ZNi2zK6olBmIzH07/RAVVts2U70P
         2RDbFK+na//8AWmN9DqxvoUcBy9n4v2UGHHdve/kRv8ynun60LyhfMlqnGC3mZnsZ4xK
         HwVWmkKdBjFYpR4Cio0rfAMIiGW33BUaG6NpVLmOX9sKh0zGqAqx+DJrKOebXD1GexrG
         TRcA==
X-Forwarded-Encrypted: i=1; AJvYcCX8lP5gFNHB8hmbx9HhZPBcJYIciNW1VzQH45/RCSCoGIb/VMsaFuBQPHcIIAJ2BL7UvWH5Dj6ntBlQI6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB9xjUIHiyKZ+mmfbUQjmy5Cb2pr2PVT/mdUEDRYH2unjyVLAW
	KN3V7Jcc3ICHh0VlQrAzLsHK7k2VeNoB3D/YmxGOKYPHSKCVUnUxk2nnkMQrwVs=
X-Gm-Gg: ASbGncve4+mZr/URIKZIPkQGhUnn/FNx2iIzkdKIEAL6lZCcGaekC5/XwB9eMrcik/M
	qYAyCgLRaT2x0mI89I3wrchj8+/xh5UAFd0bhROBqluVpfjATGCqx+YC4vm9dTzS7WVF8kx4FL8
	hwHLI8Uqr1kutQ+8TH1HBTK4svkzRir/UPKXpXU3FJ3hvgv3Oqy13zKolzBBLGETL/+4/LR0pZb
	sn4gpCptc4r2PqJ+C4kPVPhPquyviMDAdmiVFYnWQQZJyqwPyzWOhJPU8lSTiAKgLXjUJWIY0d1
	5iCOLlMu18mpOi3Lu0bqQ2yU/ko1VVJR39BnVG0jKf0gWD05P8/1qo9ZSCtu6gau3GAK57eJMTQ
	=
X-Google-Smtp-Source: AGHT+IFbOF2t4+PJvzAqMrfDAndeJYTiM9XmlsD3g/SUGHgKCKOZ2kQlzBYbMfUseWYAl43ziKKxPg==
X-Received: by 2002:a05:6402:1e96:b0:5fc:8c24:814d with SMTP id 4fb4d7f45d1cf-5fca161a30cmr11042390a12.14.1747036464728;
        Mon, 12 May 2025 00:54:24 -0700 (PDT)
Received: from localhost (109-81-86-251.rct.o2.cz. [109.81.86.251])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5fcb3773b04sm4288121a12.10.2025.05.12.00.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:54:24 -0700 (PDT)
Date: Mon, 12 May 2025 09:54:23 +0200
From: Michal Hocko <mhocko@suse.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@redhat.com>, Yu Zhao <yuzhao@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
Message-ID: <aCGpL9BHG3de6Wpk@tiehlicka>
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>

On Thu 08-05-25 18:37:35, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a reclaim memory management section and add relevant
> maintainers/reviewers.
> 
> This is a key part of memory management so sensibly deserves its own
> section.
> 
> This encompasses both 'classical' reclaim and MGLRU and thus reflects this
> in the reviewers from both, as well as those who have contributed
> specifically on the memcg side of things.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Michal Hocko <mhocko@suse.com>

Including M for Johannes

Thanks!

-- 
Michal Hocko
SUSE Labs
