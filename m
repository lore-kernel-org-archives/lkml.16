Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0F1A23B0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445133; cv=none; b=h/9r0gMj8jG2L8dy1nhfXoREv6Vabhn6fTNMKHrJpbUdjbHYsghJDfDWYhbIjHzxJtwa5+JEEkcrUQa0snWBoo5jlc9NM2/2OECJXBngLp4M7PukAC4fmOubAVHpv9/QWxV4cWF894kL7wbOMF5YBkEg5n3MThuCEMIqFLs8KDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445133; c=relaxed/simple;
	bh=4H9HY5RqGL162neIVzWOm8Uj2ZqBpnwCSCJKABZ2oIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNxnrmjvwk4OvyJDa2UqRZam7RGSbTglIfe2gpDsizjwt28t7QjausRbk2Ks/+d5zBGdY82wuIIRC+eMZkP/u0yNmEWzOkA1ubEVk0FwYe2uZECDKor9KeYO6UGsdZ24+eH9y0z6plyGSLqObdUaaFrieWVSuROU/QbAshtIwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i30gJ5hX; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i30gJ5hX"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so3082738b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445131; x=1747049931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GMQp9j85OZqKlkrHyZMpU/XUq0rYEnvHyaTGQjhBF4=;
        b=i30gJ5hXlJlom8grIMq6E4Kt+LXqfIUaNG29RrZnFUNkYeOANhrJ83grVdp6SCxXjD
         kgAlXe/tT3pSNH5CYc+SER6H4SxxW3Wo3gter9/KUx58/hgx4LS6xvDJxJ2gR2b0d4aT
         WX+koe5U7b9CzPGOSXWzhGir6EmpEfM8jpspB3OT5EyoRPsAuy7lqOIU5DV9ab7OLfzt
         ZSZ+0ofjRuUtOwa09PoXMvPyYx+j1yfPKQMIWC4fhoi+2YyP4uQbsHbBHgIO9Jq2VYAI
         v8Lk52shWaIlYO1Gvd7C3REa03pkvcOOyPEl41VfwGuO+5DOI75Ca4jPqg20UuJ9KJDy
         uIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445131; x=1747049931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GMQp9j85OZqKlkrHyZMpU/XUq0rYEnvHyaTGQjhBF4=;
        b=Uv6l1ZNh60ToVfEmskfcoEiHIikecMQObcBcDRXiGhM8aAnGMpR+TkK3agTOZfIVQi
         G5SooCKY/0ez3JQjgAfZLk/Xmz+oHjpBzvYrj5fEVe5OOe+tkfxG6LHsRG0Jd8lKlAJz
         4Y4isPYyISXpZpSvS8hNZWvs95pQvFVpr9FKmIii28tp8a9+DixmfIRHHgoiwQ+T7aPt
         J1B/bAQFUKzbO40vFClaO2qyJQyUaS+2FwVhChRgPdpGOrLbCm23zQdALV2qjqi0Rwp5
         nukeI239u81uPgOSPVulzO8YAKseZVBmJPYxfyPClYWqA8s9agDUafuPXlmkxeZepc7U
         Oo/g==
X-Gm-Message-State: AOJu0Yz96ZM+412BvUW1iUTeRVaOADEgXXCEEiYRIiUihQlL6K7LsKjy
	pA49Pdc7o3czqMcn9h/U3a2JyZiWlpjFZKi6njKZj0PtDn0biqt3N4W2UnBLmvR1vS+VQKNJROn
	OsZZ5kX45qIQJikl8++dcS850FYZRlOuJ8zoQrQ==
X-Gm-Gg: ASbGnct3qdfxbF4/jaNUyUh3mYfKdxVg76hLDTXOlCEEOIvdPVNVv/RNVAhyhYJwvF/
	9k0BVEfYSHqo3BD5QZ9OJSBMk8lYNff1pIkVqBZ5TUPZQV9BeV3E3m1fDl+O7wv7JgdVz0nzly6
	ru1/V1FAFQGAcVq3sbJAhe8zU=
X-Google-Smtp-Source: AGHT+IFsXXtVZfrIMVAYeKVEaw/tyOZiD5EOR3pAScS4csZ0mXU9Ezu4MEU3Ox8q9DYU0yBa6wml39ms50QahdcbUm8=
X-Received: by 2002:a05:6808:1a1c:b0:402:11c2:253e with SMTP id
 5614622812f47-403536715ffmr4977375b6e.21.1746445130746; Mon, 05 May 2025
 04:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-10-jens.wiklander@linaro.org> <aBTpiMIevmAmp5vr@casper.infradead.org>
In-Reply-To: <aBTpiMIevmAmp5vr@casper.infradead.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 13:38:38 +0200
X-Gm-Features: ATxdqUHaC_cUwJGh0_wJGsfxAOxe5bhlKMecpe-U61GAupKguhd7Rz5skfHcbL8
Message-ID: <CAHUa44HOq91O0yUWVUKcUzYv9j3xqOU3WsDg9KDXiExcdPO8fQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
	Rouven Czerwinski <rouven.czerwinski@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 5:50=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Fri, May 02, 2025 at 11:59:23AM +0200, Jens Wiklander wrote:
> > Export the two functions cma_alloc() and cma_release().
>
> Why?  This is clearly part of a larger series, but you've given those of
> us who are subscribed to linux-mm absolutely no information about why
> you want to do this.

I'm sorry, it's part of this patch: set
https://lore.kernel.org/lkml/20250502100049.1746335-1-jens.wiklander@linaro=
.org/
 I'll CC a bit more in the next version of the patch set.

It's needed if the TEE subsystem is built as a load module.

Thanks,
Jens
