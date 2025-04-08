Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5D322F167
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130617; cv=none; b=V0d2pjY3DOqVW+Re2TReEsD6NLyhIaaG98XoL9EZFj00R3xJ7dr+qZSv/YjmH0kSXPdaCJPqMt0OvgcXIzPVx52OqzqDtlE8v7lPUQouTbw1tHkTKR/xh5gcFqsrgXJQNHYeh9RpGc7hFVSFXYO1N5MwNoPCc/5/OquKvQl6twM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130617; c=relaxed/simple;
	bh=EMGJL06zBcH8/bK3L8ffU+XphSEbrqEm5rUSMYBj7/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVO8G7yF5dWYQNtSYxUsg2wzfdsVvJeEdLnUT5lBDClRIirUCpu6TNmFHbkpDsMKcvieHhXTJG8kZRAtfvsxHwXW6LbYC6uecycE3KCyrRC5UEjjDAv+NDLC5u5KeI7JlnLuvQbnNmO9pljxc8brlCRECz2ZlV6TPT1h0Sb/EYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vNQahXzs; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vNQahXzs"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47666573242so3431cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744130614; x=1744735414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FiKiNCaVFv2Cyr7Q7f6YrTxmfWsn+IwY5nbyf35odU=;
        b=vNQahXzsxZQPqCDqJ2G3MUDKA3glypyAPy45iqIf/f7jNW4dqbxT7rKfiVHoxcrQEo
         /C0dWzRQlJys1QyVpq8F4OwYo5xnd8ajx8ywWEQkBjDPYb8n737jqq3+rnI4CGfoN/5v
         spFKxUS9+CSnumPNJIwBlSOR3V3SxKXGzi0KgoVYsywwSYzcaf38ts9ouifDDCAxZvru
         yPYVRXrTBnVQ9dk1IdVs/6mwY58L/5nGSqJwp7k/04IGmWXs3dgWh2zKuXCcv+loENsO
         div/IDFazsntD7jM29aGBdl+jfpuO79SlX4qVnkXCrQWG8gftS8Vpcotq+3iYCHp3zVS
         MHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744130614; x=1744735414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FiKiNCaVFv2Cyr7Q7f6YrTxmfWsn+IwY5nbyf35odU=;
        b=fsPFWsjDhwrTvO075bIXtc8Z9HId4OR0IIA2b+rHfHNCieMmRxdIifwIBg0mCFI71O
         a+5eM7xCJXa9kmHJNhMiAMhGt25DWL+axjYxHgy8lfz6TY/up4VS6eWsErpxnrmqF6IA
         KfTrtleLex4g+mtgg1bbNSGYJnApKz+iDzCD4gIEXR8PUGwN+s4/kZFQwaT42Xuei/on
         0+rI4MShs+FG8t40GIXk3/LAlRsIvx3Tsb9Z6cYppwKjxk7s2RI+UQ7fHNQooUXTCTzi
         AEJ1hZwEIBzgnuWUR0jKMLsZi6gov3hPSCloKX7F3U9dKfBUzzf5ILtURmG1zf+MNnlF
         PTcA==
X-Forwarded-Encrypted: i=1; AJvYcCUZlZKFs7V+rYdmkWuhyPJUNyrqHGR5Zr4t9jPtICW6ApdrXXT94X2FfNTZRDWajdJIpUa/YPqruqlyC9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3NsPM4s5EEwTglpaY/zzy1J/0Vm5goA8sosRHyNOYIiQREaKs
	Iw8wZvXjIP8nSrqEYx8SxcIBCQvIukk9s4QFnOQvmYNuXScx6hB6Ve/5WgI040fn3WoxJr7t2Lo
	48I1d6RBf+5sx830NpMh6o+D802gwZlznmJBo
X-Gm-Gg: ASbGnct7bmlTtUV8gba0IaTKCe+RukKEhVwGVKFpyT4ZMK8PlQ+V7+u7wTTgoaNcPcp
	mbjalh87NZCAgz1iRz5gG6RZq0zuB6AyVLUDpQSFE3MbEPtB6eXYBHJtuQ9M9bSsL+lK4v1hfSG
	Gbv4z75Wyt1V/v5nbMzL6JG5LR0oYEQc4e9fqBM0/MWRVxygbf7rIih/iZgA5wR+0QQ5w=
X-Google-Smtp-Source: AGHT+IHUWQvLcrCIeytX8WdQFcIxjeAwfPlwbo7B6E6aJQhKTc0WFzSxKyLGGdC974vlRDvFfaEJkQN1B0nRXBOv2FI=
X-Received: by 2002:a05:622a:198e:b0:477:86aa:8829 with SMTP id
 d75a77b69052e-47956216f1cmr3920371cf.3.1744130614272; Tue, 08 Apr 2025
 09:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407200508.121357-3-vbabka@suse.cz> <20250407200508.121357-4-vbabka@suse.cz>
 <D91BI0ICWA7L.3P7ILKPYMKGMZ@google.com>
In-Reply-To: <D91BI0ICWA7L.3P7ILKPYMKGMZ@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 8 Apr 2025 09:43:23 -0700
X-Gm-Features: ATxdqUGBt28o8ERjPE6GWLD7R0zA_rTTTrRVJtvv2fQ4PNvjAZyr1xF_AaXtqn8
Message-ID: <CAJuCfpEgFTvfAgfrsks_gSTLNfDF0Ehf5tX6FLPwj4piPPC60g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] MAINTAINERS: add MM subsection for the page allocator
To: Brendan Jackman <jackmanb@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, 
	Michal Hocko <mhocko@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 7:13=E2=80=AFAM Brendan Jackman <jackmanb@google.com=
> wrote:
>
> On Mon Apr 7, 2025 at 8:05 PM UTC, Vlastimil Babka wrote:
> > Add a subsection for the page allocator, including compaction as it's
> > crucial for high-order allocations and works together with the
> > anti-fragmentation features. Volunteer myself as a reviewer.
>
> Thanks for volunteering and thanks for proposing this update.
>
> > Extra reviewers would be welcome, including/not limited the people I
> > Cc'd based on my recollection and get_maintainers --git
> > Also if I missed any related file please lmk. Thanks.
>
> If this is a "more the merrier" situation I'd also be happy to be
> an R: here:
>
> +R:     Brendan Jackman <jackmanb@google.com>

Same here.

+R:     Suren Baghdasaryan <surenb@google.com>

Thanks Vlastimil!
