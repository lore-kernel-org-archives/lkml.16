Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5BB1E87B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336936; cv=none; b=pcxA7zyajOhaQfUZzzh7UScTKQuJFDC8MTvFNk1+GBGPkvR6T6jStK5QCuJlT/Qbh1QnUEAbvYJ6sk5LBbHNjFRCLmPCJV2dlum24xLOLxqqV+DCA7rZQzWV9I2TXnVSDLM46yZnRSVBZiNdmHoXJBMGfnhhOTmZ8rR5AYQ2JVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336936; c=relaxed/simple;
	bh=UMtNs131EaLOx7wO3hdnO/FjcPM0kkHKVloE7mySrEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WwU0OVTvSgOyLNWXTftmXKCCkmdQLlB3lk37sY1eJhcJaGBqCHCkdKd0HNaNdqJPMWilNunUYyIqiEVyXkjCJ1QCuCu2Yokufmqn77PD7tscqaFsBAUTkCQtzsaZYRk0cxr66G860fTVsl3FyExsX8OgGCsIaXlWJlj7uEzcpe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIMvFOq5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIMvFOq5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22c3407a87aso79903025ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745336934; x=1745941734; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3BuEXZnKsXPHQ5Xh9DOgfd6QvLyVRzAGX4k5Jq5y8M=;
        b=XIMvFOq5YlJNZYLDkXTrfjvhWiQ2kMGrDMGYVLifr5CGk76PYj5eZQuNbOoFkwWJA4
         Fvo50j9a4oyugOmoXPhoK5SldRcr1dYSkrflr+4MtBA98ld15zSlHp0/5z333gz+Ng4u
         a4Ef3bm/6tqodJf6mNHjxq+mNJtgLQEGI9RLpmGxZlBDQyprTOf7U5xYT4eVtgtbbhCl
         nS2u4TdT9bMieAiWM5XYN6p/scobsymf0jQeR54+TUhB8w1xvNVtICL1QSWX1RpSFV4n
         pyE/6dDfVVPHn9eKyeXvExmzfUV5fMPusVuH4p94kXpGgbWRpMGbpo/ozwHA95JMoI3K
         YBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336934; x=1745941734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3BuEXZnKsXPHQ5Xh9DOgfd6QvLyVRzAGX4k5Jq5y8M=;
        b=E+nvAtx+9+oJkxOmfOhD0HnjBPYdgaG24lyJTIDEi37T70W/UbMH4yUL4fSC2uj+70
         2Xq785PeyXegv35J8E6zQwuZtRvFfO5LDNzfwq1LjKsBhKhUX0VmkkXT3+xH/MIqlwAf
         b7hhyp79qnCR+G5UXNTSqKwR6xY3TX07U7hCoRrOgoWMOureGpnhkvErLwkywrz34AOG
         x/R0sM6k/SzWFwRfVPcNb9aTCJkxGjGp3BNcyK6l30p0T0/8BglXLwH5BwIeFsk6CTlK
         +ujZxwBPPvRIMUbQlzNFNLG1/G0eiwNKSWp5nYYHvHfAl6Q04NEs/cttNJkfin6BsGgf
         a6yw==
X-Forwarded-Encrypted: i=1; AJvYcCVxTSxFUF1Pabhd5X9Ef4SZHU3T3n9D34mHYylAY5jRQyGgxXF8/w46KNQ2tiDI9Sjf3iWWTtsg+XXbHoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwINV4l4loot92qsYnTAD21iZMAvumaMH1NO4vQkyVfm5ztr5q
	xHmFJFCJmfornEMCGVJSA4z6nvt22s5b5p58JJetVu3s2M6A9isZPdJJ75+1Fl+f02gsZdzQvF6
	E04/h08j0dY4ZTHkI+NeeeTcwrGQ=
X-Gm-Gg: ASbGncuAeOmTrGhftZD9k5c0KMed/krL7p9/LFf4t9GbBB8X//loIMvkjK3aCF010X3
	rZhI0bgNXbsuABSVAIPDiRppCYAa2t4cydAxpMzCIl+/HilTK5TlYcmezEfEOTAxaR22wkwUxiA
	lSalzupGbUg3XlmCY+iHujpTww
X-Google-Smtp-Source: AGHT+IF5RXtOoSyS+g1JsVzJ0J7F82ka7oNT7qpCZYOvJpmeKw8xROThdScpfeWwjTXd9BOT4dsrg2Qf8Ljbor5QgSo=
X-Received: by 2002:a17:90b:582b:b0:2ff:592d:23bc with SMTP id
 98e67ed59e1d1-3087bb39a57mr24696993a91.4.1745336933752; Tue, 22 Apr 2025
 08:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422131449.57177-1-mykyta.yatsenko5@gmail.com>
In-Reply-To: <20250422131449.57177-1-mykyta.yatsenko5@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 22 Apr 2025 08:48:39 -0700
X-Gm-Features: ATxdqUHTSugEKAn0vqFWcZ94mbFzB-E9GL_UC5IMPhdbs5lblBBMn_m60AT-9aM
Message-ID: <CAEf4BzbTSAp6-2HZYuALuoF8bDeaJGtSyePe0DvmdRK29pN0aA@mail.gmail.com>
Subject: Re: [PATCH v2] maccess: fix strncpy_from_user_nofault empty string handling
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, andrii@kernel.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, Mykyta Yatsenko <yatsenko@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 6:15=E2=80=AFAM Mykyta Yatsenko
<mykyta.yatsenko5@gmail.com> wrote:
>
> From: Mykyta Yatsenko <yatsenko@meta.com>
>
> strncpy_from_user_nofault should return the length of the copied string
> including the trailing NUL, but if the argument unsafe_addr points to
> an empty string ({'\0'}), the return value is 0.
>
> This happens as strncpy_from_user copies terminal symbol into dst
> and returns 0 (as expected), but strncpy_from_user_nofault does not
> modify ret as it is not equal to count and not greater than 0, so 0 is
> returned, which contradicts the contract.
>
> Signed-off-by: Mykyta Yatsenko <yatsenko@meta.com>
> ---
>  mm/maccess.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/mm/maccess.c b/mm/maccess.c
> index 8f0906180a94..831b4dd7296c 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -196,7 +196,7 @@ long strncpy_from_user_nofault(char *dst, const void =
__user *unsafe_addr,
>         if (ret >=3D count) {
>                 ret =3D count;
>                 dst[ret - 1] =3D '\0';
> -       } else if (ret > 0) {
> +       } else if (ret >=3D 0) {
>                 ret++;
>         }
>
> --
> 2.49.0
>
