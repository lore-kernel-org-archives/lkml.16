Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EEC4207A;
	Sat, 21 Jun 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522038; cv=none; b=D8imvqY11duNaHJylBEhGCilyZqP2+pbvvwqAO6yZrGgi2Bk//WQNrJazB5quzzq00bE2+IGGQMtu+xY/+DPqOgor/0mmTRY9VAJlX3VVq/pdWsp4AJMVZF6xBugDb4UA4euH9qctt4K1pWNWsxVxVutaGK/a/iyfx7UlXrlINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522038; c=relaxed/simple;
	bh=AtD0WPHmwHEkjbgjKd6OvQ1DlE7GB95bsgIbqGMhEOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NpAgWZa1jSad6crUjv0jmt3hENsCfweNnBzmxaGlOvNUdx5ZvFGNyStOJYt/SA6lWD95ZL54e9q29mB9cG1WdUqgeKpQI2hnov8DzZoeqxV/XrHxGE5tc8kw/sYUmnAnbF/X0TY9s+fpbGIOlLxBxlrH5UGvvce03mkt6Ye9ZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvNWobMp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvNWobMp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2369dd5839dso6222915ad.3;
        Sat, 21 Jun 2025 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750522035; x=1751126835; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajQtgc7bclxcGCfy/XXGZgpXq5TCKj7iHP18vW/22w8=;
        b=TvNWobMpd3sj9RMysaNnahGyqe141cBz6PDv209NvTl10bMDpV7lfe3vfwgr2CKcmy
         iDMUJ3u5mr8fA0hTZfrw/2OBVfub9L2mTyR34/d5Od74cWvrvVfG+fhFPtMzqrrpVnX6
         5Jt15NhMoQBRUWM0iSSgojidCUGkMQv153Ahzg8O1ZdawldFUYyzMB2y1xbFa3HzAUJi
         UoVOUug2tYUGciemYYP2gxqiBldhhT7WY69ZfklX1s+rUh8WSxYBsTDDIfEIkoRQnsx3
         diGfnBVwxIclKyd+D+q+Q/3w0FWcZG+E+Im2ZHkATn9prniZCBbaMPBl0wnD++Nc2AjM
         lEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522035; x=1751126835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajQtgc7bclxcGCfy/XXGZgpXq5TCKj7iHP18vW/22w8=;
        b=viVxYoajjJ3mX3V+zB1q+1Ay0hPS4NhZkq9fOj4ZHxrrhueguBujBTsg79gh0ZOYq1
         wQZ5JTIrH1EsjG+bZuXyHE18eFpgE1nztJssWEgI17sK35DdR6glNe783EZb8wMXFqRC
         7x2DUzne1DwulxJQGJLu608W0Gpre1Jz/okPfe1ii3XOlOY7NH/kcjf6njOYXsERRQ0a
         wxGdqo8Bvcpt/HiXiakkOwjk9hWvlOpqyWLzGJEY95iSBninzBICHDEelduybxhqGCZ4
         Uom9rJTDwGzxVhB2e44vbZ2r0LkfLqJDmCDTUbL750tJumSa3bS9qFt5ngTc9hnHrA1t
         THag==
X-Forwarded-Encrypted: i=1; AJvYcCXoGX6T0W1pcGGVVpi2ksQnGOV5BJ9VFWbGAIbFMHwYIOrfcjgJcQvBMHlbiBdbFk/Kr+mMpka/jnGkSGmHiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvE/g2eE9cDBy1+AhwiBZWLl9nfnaSXTj1lIo+2DwdAFWkb4+1
	6geLfer5Zr5mspI3tKC5mh1kPu2I3yXUHlESQDYdnJ23mefDLjX5r1NbomfW/GBkek4bKuZv/jS
	S710edx5FcKzha5A0fjFZoKnf4xacDnA=
X-Gm-Gg: ASbGncunNQo56GL6/+sl9pK/mhSBPmqqhcIdg6mXfZvRxlLDvbQOwsjC/kthdEooueH
	b+aruYjDz5MafAFV03xl/IsYcWmQWywzq0NFDJSXXHD25LzIdbQrdGD4B4Mhfq90pkOD85YUn93
	Ur9GwB7bHcxkZrLITef0jrV6UHETp0IfJ2GL0WNizig9k=
X-Google-Smtp-Source: AGHT+IG6iGrjwtr5gmBCm7JqmpGiMTIcHXdasNLVivu7539ejoXqYxEhehCw/CPcTx2MnSPreVu4LSnUB/eS7FWU1EM=
X-Received: by 2002:a17:902:f547:b0:235:239d:2e3d with SMTP id
 d9443c01a7336-237d9a7513cmr35867345ad.9.1750522035189; Sat, 21 Jun 2025
 09:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621152142.25167-1-work@onurozkan.dev>
In-Reply-To: <20250621152142.25167-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 18:07:02 +0200
X-Gm-Features: Ac12FXxSfnvN5aXmlOVsQAKlwfWdQUDM8zUvoRwwKSWswZ5mQmTRRDhiaWaBOW0
Message-ID: <CANiq72mh9a7RpJpRx1toS4z46cHmeXni1oPTpUdi58wQhyN4xA@mail.gmail.com>
Subject: Re: [PATCH 1/3 v4] rust: add C wrappers for `ww_mutex` inline functions
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com, 
	felipe_life@live.com, daniel@sedlak.dev, bjorn3_gh@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 5:22=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
>  #include "workqueue.c"
>  #include "xarray.c"
> +#include "ww_mutex.c"

Please keep the list sorted.

Also, a couple nits on the series:

  - The title would normally be ... vN 1/M ..., rather than the other
way around. You can make Git generate it for you with `git
format-patch -vN`.

  - Typically you want to give a changelog, either per-patch (ideal,
especially for non-trivial patches that change a lot) after the first
`---` line, or per-series (in the cover letter, which is also
generally good to have for multi-patch series).

Thanks!

Cheers,
Miguel
