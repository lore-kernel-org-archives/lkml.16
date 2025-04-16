Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F552746D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802047; cv=none; b=lu8GPRNu3ErgAkAqL5Kj1bpTkOvmcuTklXbuPoTgTCSacpERqZ6bG8LY7+42sCg48HQ1X3pRPx9YtGNpMbCHR790LP1IRjgSrrLlMkIPn7RBQepcYx3OVvXsJ0u7O3iK+KYuSZCxw6UqF3F+97Dbz2FnM6OVsG8m7FEXBroeXnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802047; c=relaxed/simple;
	bh=V0bcAVcIBXJUMVNToi/c3WDygqPJpKfs0dNrgJ/Ax5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr5TA8KgHQlJe+F/F6k/BhtDc2CDkKeBkhx1b/PRao8+APWgycTvi0U5zXMOpmIy/C2Q5I3QdlkU4TOJrRZPftwCdo/6bnTe5abiCHYPDbbi2Ci6giQqVJHfP7QU3nXRCwEvUhlycj99XvNhnwxhVquBXybbk5GzJvoexRW6kC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YB1QVpw3; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YB1QVpw3"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so6777911fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744802043; x=1745406843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0bcAVcIBXJUMVNToi/c3WDygqPJpKfs0dNrgJ/Ax5Y=;
        b=YB1QVpw3z8M//X3cWp1kZ2s5FqGb/F66hp8xvuLklA/BWrLpf9Yu5y9YQ47CmrHGya
         cXkRAer3Xs1NiGZNF6rLHQmMIRUUtBC5zEoG7BJHOMQhqPneEXlc1R58pkTxRSm07WrC
         rJyIw1s4b3eJYBhCncFPmitxfgp7eIW/MfKYkC6yhF63myhf5Tp6vt52urUxBaUF5GcF
         4vT7hS/7b5DcnBlxRKC9GFMMpmdvsl2h9pq87Yl7rHLJgxie4L3OyfHAYCArePhdF21Y
         94Rx/cmBi5RdMFfkAQugSzBkTcrKlvuzDpZT8Drq507USPjsK615UXztsAqTz6h3Kr2m
         05vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802043; x=1745406843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0bcAVcIBXJUMVNToi/c3WDygqPJpKfs0dNrgJ/Ax5Y=;
        b=BhjgcOg2Fo53qzrnkcwg4O4rjDAyvpxGM9BA+VSIsExkg+cT/0XbdYS8u5OsFQOR1M
         bwVjpI8Hga13uDofv/lXo6ik+taSbGnhdxNMjubovl9Lc0uh3ivEylStOu/6k/BsSUxf
         Hl1ah8qDqqLxaAr1brOpW2tup6fR+rNNkQC805RP/V2/I2vzaaQp3KjYQZItVTO95BJ8
         Lgce+5UiQS6mbTCKfamgnCC3kqXmTJPlRvG1ww91IjgqvjKksNAwmB4asrweAgivLZgA
         VYEkY0oN3p3D72DOiYWOg7r1YylkMOVfX2o2OB9sPvrG7YVjB/CGv0WmutNR0jTGkWfb
         E6sA==
X-Forwarded-Encrypted: i=1; AJvYcCW9z+93LiX3u2/m3kSI3cK+uJ+4zpBJkuBfbYm/kORcx3cq1bFk+lkdr2Q0HIUpcpco7GX3FMTIMHvFxbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRHKuSfPQX2Hx7rVMFCDFqrX0FKqvpgeOTuqQREFgtb2lLNWT
	796vWIbU6gptaMKvEUamw+Prlaa9FXlehPxjFqYxMWwIR/mFOsmW2czOhIFBaQjTatbz0lMGJyY
	61TFbVUOU3V79QvtaC0PSpGlcgvfsgqmWCZhUvw==
X-Gm-Gg: ASbGncslKFEdMlh7uQ/2F9fGWc6pO+g95SZgX+OyG75Auaj0lQV8nVS2F2EU53y2maL
	qJ7FT9wnxN7As+nlAPhEgJ5ZwwimvIWfKSACEbYaB5JgliYFpbaRZS9mYNwT/icONxN0mFLUMmz
	k76RYUYCq1h3SSpErxRmtZfg==
X-Google-Smtp-Source: AGHT+IGoVa8oKz/9H6qwN720SjI6iTNhQ//CNlCY1oUOFqYVxtOvYaL8+BRnRaElkmRz7KRCi++4w5Het53XuVm3gb8=
X-Received: by 2002:a05:651c:892:b0:30b:fc3a:5c49 with SMTP id
 38308e7fff4ca-3107f6cedf2mr5715001fa.9.1744802043437; Wed, 16 Apr 2025
 04:14:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414133219.107455-1-ross.stutterheim@garmin.com> <20250414142140.131756-1-ross.stutterheim@garmin.com>
In-Reply-To: <20250414142140.131756-1-ross.stutterheim@garmin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 13:13:52 +0200
X-Gm-Features: ATxdqUEiBb754m4GSLXFUAZJuTsxVh_7GqMvgbsAw6DFPoC5SezWgynWEt0JdL4
Message-ID: <CACRpkdbYZAt=gs=Fqq_VvOzpmUHiwoaQuGy9e8nfydqjdM4NyQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
To: Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, ross.sweng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 4:32=E2=80=AFPM Ross Stutterheim
<ross.stutterheim@garmin.com> wrote:

> commit 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure
> presence of linear map") added the definition of
> arch_memremap_can_ram_remap() for arm[64] specific filtering of what page=
s
> can be used from the linear mapping. memblock_is_map_memory() was called
> with the pfn of the address given to arch_memremap_can_ram_remap();
> however, memblock_is_map_memory() expects to be given an address for arm,
> not a pfn.
>
> This results in calls to memremap() returning a newly mapped area when
> it should return an address in the existing linear mapping.
>
> Fix this by removing the address to pfn translation and pass the
> address directly.
>
> Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure=
 presence of linear map")
> Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>

OMG
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Also add Cc: stable@vger.kernel.org as pointed out by Catalin.

Yours,
Linus Walleij
