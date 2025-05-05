Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F1F2153F4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446729; cv=none; b=Qaqz+69AV2jVX7Asbd1dhd2QS6/H7WlZnfPt8RrU2yeqtRaYsoHfB+gvVHxhXzOqchrms5tNVTTCemTb+5y91Bo5doQKUVoPDfWR+YpptgKO5b3XULx35trEwcFKYgOmhCd0sA63mqd4c0TJiu0o5Tp9SEkksfjhQV6UXMu6fDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446729; c=relaxed/simple;
	bh=MSmFqzFcT96hsMGWWU/+4kI2d4kvC5FO4xXgyupJZRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYWDJfwJcibvuzSEUTRKElReGRLi6ajH74L9kc1BLID0+bWiHEF5t1rKkcaBf3J4WKwXHNgvErIY397i3vLEpU2JjnKvzoHTrUh+TyozAm6L8hvR+tKYXC6aA2hxD9E3wvbgjVYuyIla11br6HMilQrFenLTFS1xpFIKRwkFyuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=m/DwMp7M; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="m/DwMp7M"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47688ae873fso53244611cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746446724; x=1747051524; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MSmFqzFcT96hsMGWWU/+4kI2d4kvC5FO4xXgyupJZRA=;
        b=m/DwMp7MQeBJVvBMVghMcYf7mBXeDRBodW7o8Csv7KDw6Etjq5GHOez1mnW8IxLTzE
         EuNbmuaYpaY3CXmVFD2RDcTf0+D6oIPigjbb12JJddTYDS/oFTgSGaAJld41qJkyuGQK
         Cc17+q2zrmVXN0JvY+MsrtQlwMdbb5kaL0yP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446724; x=1747051524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSmFqzFcT96hsMGWWU/+4kI2d4kvC5FO4xXgyupJZRA=;
        b=ct7W4mBmEO0n31E9/dZd9CdeoTekWoX9LnWXM3ei48CCAkkTcUrZAulX7iHY3P06oZ
         IOxm9wxSYkkiLj50oxU2BeLlBAaSeRyfhRejFG3FCG7Nxbrp+oiD1DWaaB3GmvnJgX6A
         OZ/8jkGCadWIGV+whFxfyTmQUgkSteBfJ7AJfU5T+HwiEfQ6VyjzFdB0vnzYDi012DgN
         YFqfS9LljFQm8/s+/zsS1/NGd8XGI/OwSFl5bGVcPOR9MPYbjfpyTK/exnJB0xO3SPw8
         hQsJDRXmlM4NAIEQ5egYyhcdWENe5k+QMxJGAx+zrpZryTaHgXNYJbvNpK8Ktwb2JTK8
         yJRw==
X-Forwarded-Encrypted: i=1; AJvYcCUQuEYu/jmFsWg3vILeCDVvS9CiXFJBGYd+HiTWAy6dhXJkycp3/tZvutYN+RjpvO8P6TvPoCctXkma/3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWzwPPLWSjIaS/hB2H3zAnvKLzvIJJgXPNLnSnSOQS7lVks/mK
	jYoVW7QQ1JKyE2m8gIx1nZ2VbMj/GLT9XEVvpIKrS0loxln5wLMGnZ/TejcMCFUnfEXgmWkb+Af
	4keVsEcXUltOqkzVsfcf1XbRQ6UZqUSaqSGqx9A==
X-Gm-Gg: ASbGnctFeh1hbrb5KabQlk7jtCx7K0rF5Vofjs5qFFD5sWDyZFnA3ziUJ2gGOux3Szy
	iwEqgQY6Ij/06Hbpmqhp/rXlNO362sZPj+PY8kjd3QqUgaXMtkri4hCubm/2kYOK75L9e6Lj0M5
	iszV0OpW1+Q6UmlkHR4V6C+nknMXEH4BOZRw==
X-Google-Smtp-Source: AGHT+IEiXnbdzV3BWwZ5IPUbUHubnoQaoHBY5S71LTjH+YEkNGnRrCKP8XO7R8Sf3Kz0X2/HrOGmLWiEOeiS3HMJDAU=
X-Received: by 2002:ac8:584a:0:b0:476:ac03:3c2a with SMTP id
 d75a77b69052e-48d5d954187mr120305351cf.43.1746446724283; Mon, 05 May 2025
 05:05:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503115202.342582-2-thorsten.blum@linux.dev>
In-Reply-To: <20250503115202.342582-2-thorsten.blum@linux.dev>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 5 May 2025 14:05:12 +0200
X-Gm-Features: ATxdqUE1WWGK6G84AJhRV9PFwu5vZGrOC5PYN7D35zd1oYWKXW2d-jpEXjo97Sc
Message-ID: <CAJfpegvY9SznVvsos1a7zk__FNbhtmhPWt-7uSXegF_DxT_dDw@mail.gmail.com>
Subject: Re: [PATCH v2] ovl: Replace offsetof() with struct_size() in ovl_cache_entry_new()
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 May 2025 at 13:52, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> Compared to offsetof(), struct_size() provides additional compile-time
> checks for structs with flexible arrays (e.g., __must_be_array()).
>
> No functional changes intended.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied, thanks.

Miklos
