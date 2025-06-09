Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D64227BA1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502863; cv=none; b=VDJtoRDQVqeyXq/xTLW+U8uK+XYTKskAVddsDIme1eRXHlXPCprNZ7bhoucdiwaLV3s2v3+Udj+EdOyDeAIIXtGaJ8GynfgGgacCnC4jo+n7bWKNak56k2QdV7sipWz2cnFc9klwSM4nzLPCO6JOP+27JU9RYhK8Fzxs5EZ3A2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502863; c=relaxed/simple;
	bh=eyd7dkYdmo76NiWyqd8qco4AxCsmAyol0TU7H7ybWZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k08lX4KYu7jDoLQ8cQADz7yJN3LqElgRsdtmXbZTHXtFXj2wAFaH0MIANE8EebF7uRCRCC6V8chp7PNx4jKvMb8jHLjEm/gRDuy1X+1VhUfWmaSVzn8iz9O9fE/vLIF8BwZsUOas4AQ+4DHgLmYOBLysw63yYv2gjEIXMFlu+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LN/K8y/2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LN/K8y/2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2357c61cda7so4415ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749502861; x=1750107661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp1HLmID6Po0ISnRZLWOoZOSkshz6QhojcHHKeJ34Ns=;
        b=LN/K8y/27AM9H4hzMzRkQYqiKDUj1tn/AaaCflq0A0tUX9mXsxRWe4Kao/DX1Kjai5
         qYLP5Es955opVSI2ZJNAABf5twsj4Oa+j2TgZ1TYSDX9U7n4xXNpXvJLXRJM6qpMCfxA
         PovGyZIj1T7xOumAH/GhdplLub8mDMdfQ6pgq/oVdzdH6GgHI7qQitW7n0O0vKMhKhHx
         8hNON85wrOiu88I63Inz2pia+EQ9JDVm3kbtgBUh+1b0kX4vjHqnkibzfGHU6jZPDkMy
         XkQ0cj8JBmBLbqyuIMZIJiSaIKQHQHOkNCC7LoBg3jNUJHq2/YnTUxZIlWA/91LImMQK
         3M2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749502861; x=1750107661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fp1HLmID6Po0ISnRZLWOoZOSkshz6QhojcHHKeJ34Ns=;
        b=wTJyQN6BcjmyC7dGq+8GJtL9H30WgBtSdj0kDcP1zc02GaTzrOJREhw0sR9ztVHKId
         eel6S2YeaT32WQl0+hNbK7YHut7uBhVB5MAZ/616Wz2X83ALyRKxQ12UzMoxGUPFHsSB
         A+qcCPMZ96IlG9UTq/TIb3AOysUflvb0vaDzhpX9doTTbVwjjdKAxjx3Pabo7jw1Kvzy
         TVXgK2wmM0EJfQ/E/MYM8J3cdQm2L3fPdZbzFE+vZZacYpJqLx9/MKQepV4kZEsSO+9U
         5Lts8VykrhFrekT+doVOAseyGynlaLu+hGp18pjMB6cFY14zaBs9VFcouXWAh4Cwx3QA
         Nf3g==
X-Forwarded-Encrypted: i=1; AJvYcCUXhfCdhx6wFuFXfvrEqdDmXtYEDHPtytjMXJKhFhI/7Lo8EmOuDUX74+5sp5L1UY2ZgfefMVRlsepkKDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSVmJj7YggxG5bDCn6g78M1UAdAvURclRSZpyyOzXc1vGvf68
	f5WwTfjU32i0PpQLU/V583is8tHzbHJK4YeTPmezsMuU5c2v1uK4ZtbLYtjrkz3Qrc0BOkvJ+J7
	sue8wrmRE+BuETxuRXe/A/ArH7SEtcrJdSoVJVx6l
X-Gm-Gg: ASbGncsLh2zPABMW5fLUPKOewwCmPD2mho0/s1mHVv+FC8En6QIcjUX9FQzlsm24t1H
	Xn5T4bzZELq0efZMcR8VldMcZ/s30EFZWo7AWGzNb3FgraoqbkxynsFHswIS4K+T0DnhdutynMm
	hMpGzUFe+5/e8bSgHKzeT9GjH9xwgNFSw3WfYxK+Gm0LfUxiDPYokkFcoAqwfNi3lC7xmShitdJ
	A==
X-Google-Smtp-Source: AGHT+IG6N3NUPJBNAz8TsmsFXeRPi1cuCX22IbhMPJCSWiBMY1aDF54kxjYnyw1Y7GWByXZ5qflX3DqDd9s37j5ptwI=
X-Received: by 2002:a17:903:1a4e:b0:234:1073:5b85 with SMTP id
 d9443c01a7336-23613cab9c8mr5630515ad.1.1749502859032; Mon, 09 Jun 2025
 14:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530162353.541882-1-den@valinux.co.jp>
In-Reply-To: <20250530162353.541882-1-den@valinux.co.jp>
From: Yuanchu Xie <yuanchu@google.com>
Date: Mon, 9 Jun 2025 14:00:42 -0700
X-Gm-Features: AX0GCFvi4bmJzefOCchySkDZ9yW59quhp2Ry0TqIK1IoccCC_Koa-wNcf5Bulk0
Message-ID: <CAJj2-QHU9q_xi4+Z_JrPCgm2DXuRWTj2rpL5pGRDoNV5yZF_og@mail.gmail.com>
Subject: Re: [PATCH v2] mm: vmscan: apply proportional reclaim pressure for
 memcg when MGLRU is enabled
To: Koichiro Den <den@valinux.co.jp>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, yuzhao@google.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 9:24=E2=80=AFAM Koichiro Den <den@valinux.co.jp> wr=
ote:
>
> From: Koichiro Den <koichiro.den@canonical.com>
>
> The scan implementation for MGLRU was missing proportional reclaim
> pressure for memcg, which contradicts the description in
> Documentation/admin-guide/cgroup-v2.rst (memory.{low,min} section).
>
> This issue can be observed in kselftest cgroup:test_memcontrol
> (specifically test_memcg_min and test_memcg_low). The following table
> shows the actual values observed in my local test env (on xfs) and the
> error "e", which is the symmetric absolute percentage error from the idea=
l
> values of 29M for c[0] and 21M for c[1].
>
>   test_memcg_min
>
>          | MGLRU enabled   | MGLRU enabled   | MGLRU disabled
>          | Without patch   | With patch      |
>     -----|-----------------|-----------------|---------------
>     c[0] | 25964544 (e=3D8%) | 28770304 (e=3D3%) | 27820032 (e=3D4%)
>     c[1] | 26214400 (e=3D9%) | 23998464 (e=3D4%) | 24776704 (e=3D6%)
>
>   test_memcg_low
>
>          | MGLRU enabled   | MGLRU enabled   | MGLRU disabled
>          | Without patch   | With patch      |
>     -----|-----------------|-----------------|---------------
>     c[0] | 26214400 (e=3D7%) | 27930624 (e=3D4%) | 27688960 (e=3D5%)
>     c[1] | 26214400 (e=3D9%) | 24764416 (e=3D6%) | 24920064 (e=3D6%)
>
> Factor out the proportioning logic to a new function and have MGLRU
> reuse it. While at it, update the eviction behavior via debugfs
> 'lru_gen' interface ('-' command with an explicit 'nr_to_reclaim'
> parameter) to ensure eviction is limited to the specified number.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
> Changes in v2:
> - Leverage the new evict_folios() parameter to ensure correct eviction
>   limitation via debugfs
> - Update the commit message to use the latest upstream kselftest instead
>   of LTP memcontrol03.
>
> v1: https://lore.kernel.org/all/20250404141118.3895592-1-koichiro.den@can=
onical.com/
> ---
Thanks for the update. It seems like Andrew already pulled the patch
into mm-new.

Reviewed-by: Yuanchu Xie <yuanchu@google.com>
