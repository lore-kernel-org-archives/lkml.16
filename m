Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB21CF5C0
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750617617; cv=none; b=FpKg+eAHsze77hz6+zDBrGa/kM4NALDY+nKKE1lgHEeuWXOO6OaTa5jIasaNn5VZWLJJLnSri26QIc8SCCnC4ox2GeezOWeUY2dix8dRaPJbBdAWYXJkgquaGNw7GWjcXn/bElZU9eExmNmws+fjVY9AhHbJ9ae3LCnFUxsIbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750617617; c=relaxed/simple;
	bh=ZoxmH2TunrCDCDjgQPo3z/O4uHmyvfwyJdTVjc+Ssq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lU2NOopSTeUcZb3xI0l0Fi7wObpfpxqEVeCzHwSpuyd0/mj053Uq7BabPtbG9BnxjNL/gNSA0Qh7ZEyW32zjC66zlWlA1y0W2dvTMl1tteg/88tzhfT3H9VS863xT5LjktMRlmhQQISeXGQFu0dvVsFanFgblfSzaJcxJBL1xCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUSzGStS; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUSzGStS"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so2990719276.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 11:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750617614; x=1751222414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pKAhYxGuiuuHrWTlzTbWt/XivMd2PwwJn1ZE/8WZ34=;
        b=DUSzGStSVoswk00F/8oYBcr0tzz/uN4k9WOjy2vHwqMgvkSC7Xjj2TSr5ktRU4qK32
         pAOBZFwdAMhAGkNAKPU8D3bh0+Mu2ITXBq0iVErkFRjDY2ebaHWLcEoyrXzZUvyYt5sm
         RD7kaXKq6w3B//JiuuAK7xrJbWPqjgzqllCnOtX3p2+ayZk0CC08moEWd7FbDSF4lUFE
         kZ8uXCDrbe7uPBOC2r28iqGRV4BG93jsAo4H2ygEKhmXfuzAX8W2HubHyKk9/atkrBmm
         N+TeEyIVAdXmYpa3ba/M4f+1CWe57B54279QjJf9mmYdjTYzc83IvPkMYezDW6vgOcRM
         EgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750617614; x=1751222414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pKAhYxGuiuuHrWTlzTbWt/XivMd2PwwJn1ZE/8WZ34=;
        b=IKu9kCZeF6QiWDhiZ2GgeMlEgodugWo4xXzrMFU5eRszKdR63nXS4kDMEoWKDZ7PHM
         DPp1vNSwc24pmLnvmaZj4geyvhF1XioSLET/penA3vhhUem/ihfDl1mvz+LaVy9QG5Rr
         iKDx1qC2N9+yi+qzFNZYXvrVdHMpzurAQy1rAUq/nhuxkkXP3b3hnRtuHvqBf/afpcWN
         aeKJQzllqRyGca+oWSFwus5BLbnooZGvH9jJInYkSpDq0p2lB907UrssedGtby6d2s+z
         iov9tgezvaKk+V9kXC4Xh2E/TKSKn5Lpg6I2A9JA88GVpHzumZb6xcs0mbXC/F8F6dCw
         3rCw==
X-Forwarded-Encrypted: i=1; AJvYcCWVywu8eeT9yLSFhMp6/DLPmHIju+hnayvxQNV9Y2tXGT1d3nX27Gxm8x5VMSwwn5l26EXGmkEtgLGFYQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSYQEzZXlYpTpbOEtj2hkSEzs5ZgMIB0IliHwkWfcKetATuyv
	Awg126H57DhvCuREkcmjWg5VQyOHZn5s9NA71j+ikc7b7ZDvVv4HWZntitkg/f/kOoWqutGCwUP
	ulIjC9g3jNM5VxaV1k7+0VP/o+haE/Yo=
X-Gm-Gg: ASbGncsKeXjpRb2QgjA+qNqp09aX6Yicrgk6SG8Vz8X6XELFpeT4nDybRiGBOtmM6tx
	7Aw36DcRVwU7ZfDZ9UqCEnlsjgME9hrzuvjtBUVYFg0vNja7UNbPUcXaQkNMCOshkyJ8ufB7QQb
	NygX/EHo8xfvZ8LjH+O6h9WFLXaX9cG5Qi80UFSwh8+DM=
X-Google-Smtp-Source: AGHT+IFhTdBizPB0Z0iefmRozxDDJKg6OZOX6PwtomxBoo+nbCvl40HQaDyH9b9TDVnPz4fDGqqyN2clo2Vn+n4+Scc=
X-Received: by 2002:a05:6902:2b93:b0:e81:5824:2334 with SMTP id
 3f1490d57ef6-e842bb65727mr11527595276.0.1750617614013; Sun, 22 Jun 2025
 11:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608163559.36401-1-a.jahangirzad@gmail.com>
In-Reply-To: <20250608163559.36401-1-a.jahangirzad@gmail.com>
From: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Date: Sun, 22 Jun 2025 22:09:58 +0330
X-Gm-Features: Ac12FXxP9dKC0EW5LLLMgzVNPUlDuRamk8QpCw-O_zA9AQIV4PwNdsnIrDG_dsA
Message-ID: <CADf5TKvyKvaP3eZUR81ND6JQUfVqUEroCrXp=joZ8GHdu2EBbA@mail.gmail.com>
Subject: Re: [PATCH] fs/orangefs: use snprintf() instead of sprintf()
To: hubcap@omnibond.com
Cc: martin@omnibond.com, devel@lists.orangefs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 8:06=E2=80=AFPM Amir Mohammad Jahangirzad
<a.jahangirzad@gmail.com> wrote:
>
> sprintf() is discouraged for use with bounded destination buffers
> as it does not prevent buffer overflows when the formatted output
> exceeds the destination buffer size. snprintf() is a safer
> alternative as it limits the number of bytes written and ensures
> NUL-termination.
>
> Replace sprintf() with snprintf() for copying the debug string
> into a temporary buffer, using ORANGEFS_MAX_DEBUG_STRING_LEN as
> the maximum size to ensure safe formatting and prevent memory
> corruption in edge cases.
>
>
> Signed-off-by: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
> ---
>  fs/orangefs/orangefs-debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugf=
s.c
> index f7095c91660c..e1613e0847e8 100644
> --- a/fs/orangefs/orangefs-debugfs.c
> +++ b/fs/orangefs/orangefs-debugfs.c
> @@ -396,7 +396,7 @@ static ssize_t orangefs_debug_read(struct file *file,
>                 goto out;
>
>         mutex_lock(&orangefs_debug_lock);
> -       sprintf_ret =3D sprintf(buf, "%s", (char *)file->private_data);
> +       sprintf_ret =3D snprintf(buf, ORANGEFS_MAX_DEBUG_STRING_LEN, "%s"=
, (char *)file->private_data);
>         mutex_unlock(&orangefs_debug_lock);
>
>         read_ret =3D simple_read_from_buffer(ubuf, count, ppos, buf, spri=
ntf_ret);
> --
> 2.43.0
>

Hi there,

Just following up to see if there's anything you'd like me to change or
address in the patch before it can move forward.

Please let me know if any updates are needed.

Regards,
Amir Mohammad Jahangirzad
