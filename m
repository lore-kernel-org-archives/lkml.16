Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BE1223DF0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 22:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750718541; cv=none; b=WbhyWeqBVLHe5vJW7WtTGK+B0TOrS5H0xJP5l5nX9T5UTaJaIw9T3GYmlEcdzq2nUnuY9jyP9cjwZEjRxbfrQ26kma34Axd6qkl6xsRdkoKFWZ6ovx9RrQwzif/G18kweoV4wc66/cQ8gdogWkv4/BDyNKZIljkuh5LOgXC5keU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750718541; c=relaxed/simple;
	bh=+AR+6uApg2kSxhlLWg6NRBaI06UmvJPbUnW0z2YQCH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj7/U9VlSIRLw9gb6qlo3Hu2H4lfXrhIaoREmg6dD9Nznx981bKAG/NNfbb2iI/twa/5F7E4GUXgYfAqcSi9LvYkONlUT7iMcOO95hkvW8RpY6i40Sl/SfFFLTDg4/GKh4GgEOFcxMB6Sf0BFEwVeqx1nVW6i+/q5KvRDVEIVjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjKGMlRv; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjKGMlRv"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-87f1b3a3e7bso927856241.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750718538; x=1751323338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzQnzMm3L02bPdTXbZuTp5b7wDNpDsZwf1hW8aglqvY=;
        b=JjKGMlRvGvxmAnmf+tOGkmvrDgIzUf+qKrvaoYQX2nU3Gh2cRorarph14yGvE4GsP5
         HMO4Rn8bLYmlq8Jul319dBR2c1ojZI/4gFI2oqysdgJdSIyN/nHwigooz8ABL1bVCtPI
         6dTfCkNP2+h8TDvVFhE+IJZcPLgmmk6Um6/niY3oHoOahA4RkgEPZuI6eunoonvpQf6M
         FxkPXfs6Cl0SeBiAn6w7Cy3TO7m/UaBbA3rDjZJrGu7mVz6PFi5/yP4ILZy4mrpUr/Yr
         DKWJgxHNJWOTy2Go9fWJap2nNWyQHblyqhYYsgfXPzvIYsZdjQTbExZiqa0CBdqw4Cht
         KF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750718538; x=1751323338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzQnzMm3L02bPdTXbZuTp5b7wDNpDsZwf1hW8aglqvY=;
        b=XBQpHM0pYCRkyAWnlgYkl52jHuWPJ8GRNGdcB46ahlnkDiRRQ64siUFt+nqKdnm/64
         hjBbFnIsNEcA9SB4qcnHq22BJQMitDaxPprmGLO+E+H0lCXPIaZIbgyMbXsmb+P4fXnk
         fbYNe6WpXRR6xz674CwDhI7F/Is/XO8J+t+eSw29ABRAjOJ4SiysHDHfVpHQLJY3T8yR
         FJlxtVFaRc7PnjJ3WHviShpTZIffWnTQzIm0qdDnaxzrnn/YXuTw5NQSjKeysomoz6Kn
         OJSffYnamlBAWLpZgjcuMTNXU7y8FFLe7rjkVBUc8dgTkE3LST0Pj5ueX2STQlWJLCxr
         H4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXWMtYiiUL2hhyhWxmAIgt7nv3QlbBmLnLIl9DiUeYElOMr4Yulf6t/FPGFq9SIkwJzgzLqGeYYJHJjPag=@vger.kernel.org
X-Gm-Message-State: AOJu0YydaqWX9SYphChAJW++MLK3AexoIwKQ31TY2fYk0syV37DqWuWv
	Z1GxMMlzFz5BW7EVRVPkekvld2X2LKZJ0gNphHDaaVl+1R6q/oLTDpdMgjoGwFQXhWS6AbYIJBc
	K/25Fc+qs9OpGrsVNvuxzyb6ei9CgqDI=
X-Gm-Gg: ASbGnculVRCTdBiYGwkVd34XLFbWweWeS8YX027FvshxphMDhlzWl8CcyPkXNOs2oZZ
	1EUpY5xmNSBiY/CKXc6gnUj3m2KVPj8oe/7a+bgxxoO3bBfSspz0RSflEwv2pK3FTh2WRy4Z9Gk
	FoqfqNPqyi/7JBjr8nUVij5MyFQM48q28r5fzfRUjFO00=
X-Google-Smtp-Source: AGHT+IF8bNrJl9IJ+HjC+ukNA+ksCPZwFOZqclXQPkszYjFgRKTePlwQD78jMUDAfUtIhD1MAllr2ztBCefdm8nCL50=
X-Received: by 2002:a05:6122:4f92:b0:531:2afc:461b with SMTP id
 71dfb90a1353d-531ad7cd0damr9034931e0c.4.1750718538463; Mon, 23 Jun 2025
 15:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com> <a47d850b0111735e026d438c3300c0e3b7f439f4.1750433500.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <a47d850b0111735e026d438c3300c0e3b7f439f4.1750433500.git.lorenzo.stoakes@oracle.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 24 Jun 2025 10:42:07 +1200
X-Gm-Features: Ac12FXwc_6EcLlZdAQCf1-KLulYmexF_gkriJoD5WYmVZ4MgVZ5f7XIXV9nizk0
Message-ID: <CAGsJ_4xqd=5aLXnQfNkk85KBCYCFPUo8bijaPZRiL+cBpHLRSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] mm/madvise: thread mm_struct through madvise_behavior
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>, 
	SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 3:33=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> There's no need to thread a pointer to the mm_struct nor have different
> functions signatures for each behaviour, instead store state in the struc=
t
> madvise_behavior object consistently and use it for all madvise() actions=
.
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 110 ++++++++++++++++++++++++++-------------------------
>  1 file changed, 57 insertions(+), 53 deletions(-)

Reviewed-by: Barry Song <baohua@kernel.org>

Best Regards
Barry
