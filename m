Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95593234
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 00:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746923760; cv=none; b=nZZj7qsi3R7PgGsYP4h5Tb3pbqthxd3/sndNj8/s69ekbleKlb4ZJW/AVR/CwwofplZ8nXV+yQ+nsvaPOo1LSUQb0vty9E+5WTXtL+6aFBfkjUfquREncULZynv9WBDkbD6cN2uvH70m3ourgxB3+L8HZn0bc4QuUsR1giafINA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746923760; c=relaxed/simple;
	bh=r03nLJvgUgmrXUBp6pwwH1baawwiopAwlukRYtT8E8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZXRdtnxkpWpLOpLJcwRUsXLJbi+Zi+XSHVs9aaHYuWJMwj9+WegvEzOiVhdjsaAsOn6DtOs4/ECYnco+9VVP71/D+oPLUjRjaunjz2HU9+Hk1WTOq1+OALKNv6BeEWK/uKt5qlnLlc2HGjZtmbiLOMeLVTElAwQ5tR5hTCxAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YBKcljK1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YBKcljK1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7373aa99e2cso626322b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 17:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746923758; x=1747528558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtRaVsiUBI+SZ9IP8U8WDTO4rTZdygKMrFtkoyTuE/s=;
        b=YBKcljK1hLQ/txMdxQ1bK1cdOGHYDVulrCIfYr6zlA6qpQcrIlDwsulYknuGx7HFl2
         UuV5kF2t7r0BEerB+2rwnefXHqPkA3F7WgBlxBHLnq6wSQxgm/Dwg1BdNyT4rTSehxyS
         JQeruB4lNcl6A+tr9j5SA+n5t1wB7vEeZT+y0I0TMHACuOubs61o5yPSincVRFORTyIp
         yTaHyaB1w5FesWJVlcoPGFH7e1GhqLZPFJnG6rP7uuecSBp7com0PP+Y40d1c+bp4IXc
         9OtM9Xn9POU2FM+Z2uw0R062OZawBGEfDETnYlkvZYwwgSI4vBgcksn3D17NPBV52/fg
         s3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746923758; x=1747528558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtRaVsiUBI+SZ9IP8U8WDTO4rTZdygKMrFtkoyTuE/s=;
        b=c1l/91T/Cpdpu++LE4JyloeZiw0u8Db8jtKlyMhnIAr7IOswXkefThRVIjsXTtyC/R
         7jiSLtZoQh+sORdb71XZZU/kN14sN9etHK/2mPfBHjRcXXgOrWjKkVEeh1zxC1o1ZydG
         MBcWXIPCNhrR6wFRP21i2UBOiKXUkH/6Ts78n1u6K+Tye/MVN/7GUmepCPx/b9AhPhYf
         INRWD+n55qr2OwU4hAJhHGvIGt6XYC1n+k+RfhPfl8KR4AUotX8j1QcvuPrAAS/alUdk
         zD6/gjf6HXxeCdZ/SXd8JNHpENsL4fGzLiQkhp3QsAR6BKFlW1XEvhi3iQZlNQTZB62V
         4nww==
X-Forwarded-Encrypted: i=1; AJvYcCU7qegkeo1WX9M0CJTMZhWOcZzXnS3kbjJFjTOh0LjI0tcEf4vhEx1fADuMtQh6RsnFQffq1O4KaK79RQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIwGIU3XM1Bql72CXW7UufJspS6S4wc06P88KYLRbH8d6XgFk/
	ias34YHTeDvkU26o9ONollBVqoFiLIkwinJOlCKbGBEo9KVE0YS9fMndc2KbxandAijz9nucd4P
	8ULAzdbqRVcJfDD1uFeMvNZj0Er8YM6AfwohjiQ==
X-Gm-Gg: ASbGncvxsDx9l5BYhem3xZASjXNyRXuJccHJHeKAceH3g+theWp4cA954vMeaUq5URF
	C3hBxzS+Kp83Ve3y9vmWqbVhAC4xuj4cYlOm0sKVIvTVFvKYaOz0/kZ/4eExjwJTAyLdqFrWrXF
	JM/U4NAXIKqbzg5r3uKYLTX6aDSKyDyNY=
X-Google-Smtp-Source: AGHT+IEQchr0wi7aB6E+8gcZ5oqBZRv0bHhEJAH4Nl3ce9Fg2GOxYYgtWBIB9g4f0p6+kGvZGmGTGjU/TmWpKmQUugs=
X-Received: by 2002:a17:902:ced0:b0:224:216e:38bd with SMTP id
 d9443c01a7336-22fc8b3b40fmr53521885ad.5.1746923757953; Sat, 10 May 2025
 17:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com> <20250507-ublk_task_per_io-v6-2-a2a298783c01@purestorage.com>
In-Reply-To: <20250507-ublk_task_per_io-v6-2-a2a298783c01@purestorage.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Sat, 10 May 2025 17:35:46 -0700
X-Gm-Features: AX0GCFvq5YiYiXLcLb8hsdNH-xK5jnR1e6XUTmKox4Zk6Icabgf3xuys_D3kZR8
Message-ID: <CADUfDZrhsQfx6nyCZQq=8HDZLysa48uBWuENY6oKnFuayt-wCw@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] sbitmap: fix off-by-one when wrapping hint
To: Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 2:49=E2=80=AFPM Uday Shankar <ushankar@purestorage.c=
om> wrote:
>
> In update_alloc_hint_after_get, we wrap the new hint back to 0 one bit
> too early. This breaks round robin tag allocation (BLK_MQ_F_TAG_RR) -
> some tags get skipped, so we don't get round robin tags even in the
> simple case of single-threaded load on a single hctx. Fix the off-by-one
> in the wrapping condition so that round robin tag allocation works
> properly.
>
> The same pattern occurs in __sbitmap_get_word, so fix it there too.

Should this have a Fixes tag? Looks like the off-by-one wrapping has
existed since 4bb659b15699 ("blk-mq: implement new and more efficient
tagging scheme"), but it's only a correctness issue with round-robin
tag allocation, which was added in 24391c0dc57c ("blk-mq: add tag
allocation policy").

I don't have much background on blk-mq's round-robin tag allocation, but FW=
IW,

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

>
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
>  lib/sbitmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbitmap.c b/lib/sbitmap.c
> index d3412984170c03dc6600bbe53f130404b765ac5a..aa1cec78b9649f1f3e8ef2d61=
7dd7ee724391a8c 100644
> --- a/lib/sbitmap.c
> +++ b/lib/sbitmap.c
> @@ -51,7 +51,7 @@ static inline void update_alloc_hint_after_get(struct s=
bitmap *sb,
>         } else if (nr =3D=3D hint || unlikely(sb->round_robin)) {
>                 /* Only update the hint if we used it. */
>                 hint =3D nr + 1;
> -               if (hint >=3D depth - 1)
> +               if (hint >=3D depth)
>                         hint =3D 0;
>                 this_cpu_write(*sb->alloc_hint, hint);
>         }
> @@ -182,7 +182,7 @@ static int __sbitmap_get_word(unsigned long *word, un=
signed long depth,
>                         break;
>
>                 hint =3D nr + 1;
> -               if (hint >=3D depth - 1)
> +               if (hint >=3D depth)
>                         hint =3D 0;
>         }
>
>
> --
> 2.34.1
>
