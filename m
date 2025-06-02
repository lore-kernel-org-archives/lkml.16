Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3D62C324E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892054; cv=none; b=C6P6mkv+QdbVz91gdvg10FvJA5PGguUaYMGNIoli3X2pVRGRjRHOPeFpD9uOpOfzMdFRF4Wfv6l0XNQF5p8SLfugFmVp91qHG6DD177AyaReYXQal7brvi4rg7EOjBtRYC4GQ7MI14m6w4MJ5H77leTokMeLfMJGmmU5BhsoTwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892054; c=relaxed/simple;
	bh=XNKlHM50OeNV5Y37EFYZ0ze3VZ45dw6QiEF9GvPU0BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaGVXhldyEH1TpUX06XQ5rfJFJcMe7Ox3xwfIqmk32OS2mMZF/o9atXpSJpblDeoAsppv4/qABo4rx+6nXb7kvlJs4BHT69K88XZThW/hL1P8k2zphtQpfRWPxERGcbW2we6jM9jK77ANRoRlbphp2/9yaQJwAgpDyzx2sXPH9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ljZRUq6X; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ljZRUq6X"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso2316a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892051; x=1749496851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gwRFlc/UyGQEBimT4kA+BZOQC0ntrU0C9Q22jAptBI=;
        b=ljZRUq6X+L42CdT1bDukyCaC9F2xa/R2rY+JFfKZgHjLwPibvGn4wV4ekJXXUY0xZY
         BtIx2LfeVa74ibSEnHeaxOaegicPiKk0Scnwn6fWqO3K++Ek7vVNgouNCUun7h9yrt89
         uVDUoeWe1CV4UZdN/btZ6jT2hukAVSNG6TmVcYR0mwjAdfKI+JRome9O2H+ToMgR583W
         1p/fc0C8lA0ZWuWQhYKLg8todGbf/+Zh0PKuxr79Pu9HJUEfUEh7kP/73ItNo1nwX3vF
         bLT+zHAYkEEa82YqYFY3XheDdy36Grt06jBy+VNAmTIMYWpWbwBgk5gJax0s1kzRKQ4G
         m97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892051; x=1749496851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gwRFlc/UyGQEBimT4kA+BZOQC0ntrU0C9Q22jAptBI=;
        b=YPh+CDsiha17LiDtoiOIJQOYBwjl/Vg6io6gtAiy3L5r+Gya8LkLFobYkUAs/MsvU8
         6mwfi7HLY+O0/jiznqsDqdHoWzlV7N27bg+9q8NefdcMmBOiPzN27bWS3w3f6aK+otn2
         els9oAbwuN+Mtr8zdUwN21wwCtGdJGz/QRmXdqKhAt3sn6cE2cMVacN9OUbn8Qobucka
         +wTxeQ02cPXTEw1guTx2+rADv5x5hV4gBEGLHtL5ZW0AhgoFnsYiq/g3yMjQBofzOKId
         IpDS1tOn1BixLenk/idNl9g2rVUOmmhmZMUh32rvlaw3wwg/6+Pai/jG0KV8cc5o+45p
         VPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCU31f9GBZg7KWhLRZwaZ+ybIxSAEQAs7W/Y8DJ78TbWrkvN0OrGdrZZ9foPsW2sljLXFOo/8k/Rz8048O4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6rtw93+X8QumF5J249PscqyUQ5rUPpJOEWBqp2WQVxC57HqNY
	4z3rUbZqLbNdA7BrZbA8VDi3CjWsbZkJAbG7fznEwXsVxOTakKZPk7dC2EBOweTshmPKYu4liKI
	7/IOvc77h+YsxkUYApBBNgFjFyuZfo5u88aLrFngO
X-Gm-Gg: ASbGnctQBrp3usPOA+662wfXRFF5xoLS/32IEvmdzXPXMZFwbHWu0roIvNQiarjHO4k
	LZr9zXy2ahJTWGg6Di8ouMZP+KPM60RC2GNe50jBQekRhh5GYFr5DjNTwr+HVaywtlZ/20/s9Mm
	nW+rMB3wP9p6NzIdCEQG17dClD5q3uc2rssTywSv/9fbgJNWym3VDY6HnPR3GYMALUwwV59X3MG
	7wdVQCvz+k=
X-Google-Smtp-Source: AGHT+IFYV0PX95qdO7NRqTq5XfLrQw/yUYV2ENfg4voiHjm1KfmtxIh7AJ0OAeerlVk4m1cTPjKz7p5WqQWRPgtyMgg=
X-Received: by 2002:a50:9fcd:0:b0:604:58e9:516c with SMTP id
 4fb4d7f45d1cf-606a9c51bf5mr13611a12.5.1748892050318; Mon, 02 Jun 2025
 12:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602174926.1074-1-sj@kernel.org>
In-Reply-To: <20250602174926.1074-1-sj@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Mon, 2 Jun 2025 21:20:14 +0200
X-Gm-Features: AX0GCFtKpt8eeRNfSX98xljzde8cTOfEt7rbGQpQQpaLjCjbYAWojg23HDCM9Mc
Message-ID: <CAG48ez0cysRfJ82UKH39Ns0gYOcmn7HR=UVRDo74w=uwm6pcTg@mail.gmail.com>
Subject: Re: [PATCH] mm/madvise: handle madvise_lock() failure during race unwinding
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@kernel.org, Barry Song <21cnbao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@akpm FYI, this looks like it fixes a security bug in 6.15 (probably
leads to UAF of VMA structs and page tables by racing madvise(...,
MADV_GUARD_INSTALL) with concurrent faults)

On Mon, Jun 2, 2025 at 7:49=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote:
> When unwinding race on -ERESTARTNOINTR handling of process_madvise(),
> madvise_lock() failure is ignored.  Check the failure and abort
> remaining works in the case.
>
> Fixes: 4000e3d0a367 ("mm/madvise: remove redundant mmap_lock operations f=
rom process_madvise()")
> Cc: stable@kernel.org
> Reported-by: Barry Song <21cnbao@gmail.com>
> Closes: https://lore.kernel.org/CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nP=
XPWxUVChzw@mail.gmail.com
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Jann Horn <jannh@google.com>
