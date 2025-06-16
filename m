Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B749215773;
	Mon, 16 Jun 2025 15:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750086134; cv=none; b=AxMvOMy7cI2fTaYRnw7eCdrOo83hi/dIPWJrK6zyQo3XOLXfmfPVTXcSPZHIspHi+KMr+uXuQuJEY6XR/ss+oEHgLgUFsamF0h0umNCGLpeNzho9tPT7nyeDsoJ0ZS0Tm3xgj2PqKoqizH3KhdYwiUeRB/DgM+5vTfKAa+LhH88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750086134; c=relaxed/simple;
	bh=5FGZTXPSRB9UdOMKVVzsofQp4QdGIsgXthBaH70tIlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UheCqau8eUaJtbVzJm+dln2hM6Iz6hbn3npbRnqAC6jtHC7Anvq+TvHU2a15W+0WaTT84FgP22dJKveh0pzR19nKoO+pMFY8CggamBWKVPIb/AhIpxKNVP9cKO3CFXxEko9bY0rD2Dv+bfSQMPimQreg3+nAbX//91DeRbBPkFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvUWYfKe; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvUWYfKe"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ade33027bcfso741649766b.1;
        Mon, 16 Jun 2025 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750086131; x=1750690931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxpfP09wMONaS9jpAWxQ7WCauQRBx9+f7EU0xvtD+hk=;
        b=dvUWYfKek2zCVmPOzspikptLipSo9TNJ5Od6eyaM/yk/dsZaD+BL6x677rarsMraRu
         bo2GjgoYFED9zxduzelnqw7ZbWcJDRxRChq/SUQ2D7ieHskcQyskG0B8QKdmqBj/zIZb
         ZDiX5a5tEcZqoYOZq/upcasFAZZhSbNHHhsXpZsDfVXTgx2FAZEOGEgtxvM1yaRoYx7N
         nEGzX7GF0LhkoDVmi6NBrcp8clhuDdRQrWPlL/hO5J2r/FLOYHUw9F1tzH9X1gzCcwxT
         xK6ENT5vXMj9O9eFUVNuMUYYzlpcZo0oxDesyG4HeyCdchY5b43QbmkJCCGfKcs64MOA
         lfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750086131; x=1750690931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxpfP09wMONaS9jpAWxQ7WCauQRBx9+f7EU0xvtD+hk=;
        b=sqbLJJc8wciID2BJu5nASCQqrUiOnGRB89ycD8Xf7yaeUxuUtpSslUQevGJl3qzw4c
         66uoEv3Mrtfma82jBsaHPWalAVS5j+bmoFqVmHnyjHrB7OtZih3tzwExCkpob11qTRqf
         goxKXMnMUlai0WHim06e9MJexrikP2jy5teA7zCsx7jUACBJRZEFIq5Yu2V2kEJ70Pri
         XEQfjSWy7OGWEDcoHMTkVbdNwj9DsddjoQ3pKzkYWy4GLYUT6NBXzbMPGHZaGrtM35SS
         YtK3jZILpU7LEQhY4vRmOqAD2d2dvHPRr1JlKdQJNYf0vV1pBUIjV9jh4fQjZpHXhmri
         L/qg==
X-Forwarded-Encrypted: i=1; AJvYcCUOZiOzWDMtaSpI6mNdHCKE65kisDOF4c06jcDGzm1sxrrF5BsBLluGwjmJrhrBKnsIPvRpRxX1gVo=@vger.kernel.org, AJvYcCWRNBf8Mtngpp27RNhPIM+4JeeLU6mGr0IbowjoKC4AAMpQKyR+d+QRySzmFEAf8fFeAwun3BDxqJLgGBLZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJkNghN2ewdMhIpd+ij+DizKJ6GnYhm31ouqMp+mvKhmlwdGfi
	1VlvfyJwSotOZsREK0KFXM8ZjpBh6lmlnS0X9lg/S8V50fRvPYSg9FwemVjY3NZwSkWjBUsIjPp
	xYZnwAhy9Ml6cmgefKNPGph5hRe+PGSE=
X-Gm-Gg: ASbGncvoBW2oTXsIy69Id4Z4phlBcGJ+1a8WruUBDm80BI0XX5tmSGVTyKj+npj7q63
	BgNzI9x51SePmh2GLEvnxDV2OnKJXONjiiV6Jx3w3SvLTUdJ/icxsBDZCsClG4UKE10VnV2gHr2
	rcSrIntfhrMvBXB06slB4rhTXVjP1EnS6OiTdwvfT0VfsV405WhRL+JX7Qn871t+zaacdJ1V2tg
	pi4
X-Google-Smtp-Source: AGHT+IGJ/zFE4w+JKMjUWfvDesBnew2u7pOoc4H3+qqMTkNhD/5NjNC8e3RLUAEQRY/PUbER+yrMW04GTUY04EM7Ez0=
X-Received: by 2002:a17:907:6d28:b0:ade:2e4b:50db with SMTP id
 a640c23a62f3a-adfad2a0920mr927784766b.10.1750086130484; Mon, 16 Jun 2025
 08:02:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612181330.31236-1-bijan311@gmail.com> <20250612234942.3612-1-sj@kernel.org>
 <CAMvvPS4WsGkfukNscnLWW40Agg6_wmkm_QF96m+HZrEZrstR4A@mail.gmail.com> <20250616074233.GA74466@system.software.com>
In-Reply-To: <20250616074233.GA74466@system.software.com>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Mon, 16 Jun 2025 10:01:57 -0500
X-Gm-Features: AX0GCFv72kKkxX-qe1l08YvlwPCsH3UbKfNEIk9xWqIa4M8jORlTYRaH3Xzfz5g
Message-ID: <CAMvvPS4OAHAdUJtuinCgo+oTQ8akSk8138LikLx_38pr8rtqeA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data
 across nodes
To: Byungchul Park <byungchul@sk.com>
Cc: SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	david@redhat.com, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, bijantabatab@micron.com, 
	venkataravis@micron.com, emirakhur@micron.com, ajayjoshi@micron.com, 
	vtavarespetr@micron.com, damon@lists.linux.dev, kernel_team@skhynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 2:42=E2=80=AFAM Byungchul Park <byungchul@sk.com> w=
rote:
[...]

Hi Byungchul,

> Your approach sounds interesting.
>
> IIUC, the approach can be intergrated with the existing numa hinting
> mechanism as well, so as to perform weighted interleaving migration for
> promotion, which may result in suppressing the migration anyway tho, in
> MPOL_WEIGHTED_INTERLEAVE set.
>
> Do you have plan for the that too?

I do not currently have plans to support that, but this approach could
be used there as well.

> Plus, it'd be the best if you share the improvement result rather than
> the placement data.

Sure, I could add some performance data in the cover letter of the
next revision.

>         Byungchul
>
[...]

Thanks,
Bijan
