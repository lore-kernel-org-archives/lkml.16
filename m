Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095FD256C8D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739206715; cv=none; b=m0I4SFYbWUfj6X6dP9K2MoaBBqRg4/FMhHahhAqVep+EHyxU1/Ugy5LRQ5tN7/v+b+mNfgz4bUySvgYof7SOux+VBlr5K13lA9iKSe8jOZiUQiEb21jmwEAOx2gy5BXiS3AQPQoNVe6AhFy0ZS6umdZ/5tkho+pn0KyeIEzXn0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739206715; c=relaxed/simple;
	bh=+EYxoO/4eaTKKnUK7wm1jcos/P6WRb0f5cS36rove7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJ7czAoK7dv3PdWm9b+f1KAdqXXRktNIGlCzh/JGEAr1Qp33au1OHUcFsTVCwSczQ8tyfiSRyJ8QVRGf0GjNez921Sr736Wg2RR8WZV6cuiwZ4tXX4tTyLZQgjXAGvXJTbQ+zd7ZPeAiF2uvJuGW++DGmT7D6u3u6NiB9BxOW+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bDzyzdby; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bDzyzdby"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so14248a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739206712; x=1739811512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cm57wNvbQ2vdjEciVDp1te7Id5gFdsUL8knVkzn6Sqk=;
        b=bDzyzdbyLoZak/jvy+BCX89O+5+eN8rT93N2fG1TR0Wl3V0bfe+VMr2MmYF/OPo5lb
         wt5ATiuuyjHa1T/Ox6dbkNrYqWZ96r65IJwW8tS4b5qBZfBMFV/Q/AV1KPAFk6aTG4Yq
         HY0BayNEDSj8UhPVOVGTCvGFgj/g94w7XTUODX90w7Eh6IMuHXlchQW0RS//TZnit5X1
         ARTOz5dqmRRUypawQJxv3TRi3UYHksEl11PSbvXZBWDLQAuOmmxiCu0UN/vrWpGhljtO
         +9lv5r8DTidY7Bz3m/O4IMXn4rnVbcIuWoXxtTlglNdwVFvqpnif+bYj9A8jfGhSk2XP
         NK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206712; x=1739811512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cm57wNvbQ2vdjEciVDp1te7Id5gFdsUL8knVkzn6Sqk=;
        b=M25jRF6NHdqOhU1KYlPkenHK6EFwVoP7eCIxJxkUYokX153CVBcunBKD/CLr6NSbjN
         A5CkPbkOM03atcTtZnrAIVgdwKKZMPLIGZ17uzqmPWxmUcY6qQuJR2YoQaLWC7gWXX3I
         90kCbW8jr1tGFEYvR78Bl7FmajrZ1TEsWv0KdbSUUEiQcJUefVUxl2UrkPTAFgTNMvnW
         91ObvJuzAFq1snAk1ft4v/Q4zR5fNpzWm6bc49t3tW7aTwkVpmTVg0eM8MHEHLICTG3n
         j4CsGFFq2DTfo4eOTfq26cXk3L8k2u6w5mcXU5joc7wp51Nk1qtUmbBXAPS4peJ+dFMA
         G2gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnhTHIWxWeq5sZ+w/p1t3QykJgkdBlIhkqSgyp4BMwOIBzcSB8K+I+DZe+AEMRLjxMVKg0mvQ6irOGBio=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsy7j9RG1ruUMR239MUZo0wZYkpaMJ7Ia+AFGukdkpnPhd2Z5n
	iTrHu4DRz9y08RFSEEt/vYeSvkf6pD/ViokaHCnzo+xafMMoz9jNEFSd0mJJFee5P+kpwr6lRg5
	opQjTApRb43p1Yl5RJ8BdSRuGXwsL/daHEZHwKlZzkK1mQQPk0Ltm
X-Gm-Gg: ASbGncuaY7dgphS8baT983gZUviVAYKFv++QaLYILmb1CNeCHg8cJF7Q0FTaEoVTcNp
	ogB2AGg7ulntK+MLEvume0uwmtXrQrCnONiSKj2O/7eAiyzia0+3UYiLpD97NuC2vwGDmwQ==
X-Google-Smtp-Source: AGHT+IFnw841MFqZMe6UVhOR0RXEyOzas0we/b8udxrzoxTVjI3QHNpgdB6s5ClL8XfbUoDdeSPb0JGGXaFyvlKzHfw=
X-Received: by 2002:a05:6402:2054:b0:5dc:e09f:d069 with SMTP id
 4fb4d7f45d1cf-5de5bf43e67mr177841a12.6.1739206712123; Mon, 10 Feb 2025
 08:58:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <629167c1-9be0-6128-8605-eb02391e821d@redhat.com>
In-Reply-To: <629167c1-9be0-6128-8605-eb02391e821d@redhat.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 10 Feb 2025 08:57:55 -0800
X-Gm-Features: AWEUYZmZq810A2nkZIkAKPj4stps_q_lRKH-4FpQTq4FT9GxN7r_QaAqRE1hH8U
Message-ID: <CABCJKucmOTVF1jY3vM7VKHuLkDeUxK1EU7YK=C+vgfWvgZFWPQ@mail.gmail.com>
Subject: Re: [PATCH] dm-verity: do forward error correction on metadata I/O errors
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Akilesh Kailash <akailash@google.com>, kernel-team@android.com, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, Milan Broz <gmazyland@gmail.com>, 
	dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mikulas,

On Mon, Feb 10, 2025 at 7:04=E2=80=AFAM Mikulas Patocka <mpatocka@redhat.co=
m> wrote:
>
> Do forward error correction if metadata I/O fails.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>
> ---
>  drivers/md/dm-verity-target.c |   19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> Index: linux-2.6/drivers/md/dm-verity-target.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-2.6.orig/drivers/md/dm-verity-target.c        2025-02-04 13:52:=
45.000000000 +0100
> +++ linux-2.6/drivers/md/dm-verity-target.c     2025-02-10 15:55:42.00000=
0000 +0100
> @@ -324,8 +324,22 @@ static int verity_verify_level(struct dm
>                                                 &buf, bio->bi_ioprio);
>         }
>
> -       if (IS_ERR(data))
> -               return PTR_ERR(data);
> +       if (IS_ERR(data)) {
> +               r =3D PTR_ERR(data);
> +               data =3D dm_bufio_new(v->bufio, hash_block, &buf);
> +               if (IS_ERR(data))
> +                       return r;
> +               if (verity_fec_decode(v, io, DM_VERITY_BLOCK_TYPE_METADAT=
A,
> +                                     hash_block, data) =3D=3D 0) {
> +                       aux =3D dm_bufio_get_aux_data(buf);
> +                       aux->hash_verified =3D 1;
> +                       goto release_ok;
> +               } else {
> +                       dm_bufio_release(buf);
> +                       dm_bufio_forget(v->bufio, hash_block);
> +                       return r;
> +               }
> +       }

Don't we still have to check for io->in_bh before trying to correct the err=
or?

Overall, it would be nice not to duplicate code here. Should the
metadata error correction / handling be moved to a separate function
similar to verity_handle_data_hash_mismatch?

Sami
