Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB12F35977
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 05:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750569831; cv=none; b=TUYEAG8WKAwDgc+jdrUXKHyqSpB034CRRfb6RzyvIKsFBALvlp4/ZzNf6lpEeVT5KIXke69BQJT+cpYgWFUc0xIMChtaZSISN+3i1C3NyfL/hQZSQqD5YfyAC67FiLzzEfg4Ugjr8exx7CAqiuQtr00XW0ldR6xwuvISOJDpOt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750569831; c=relaxed/simple;
	bh=UKFZiSMi/Xp/r0IR9bfV0zxY8iABN2FCJtVKYOPiEeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5pc3KaEk4939nEVmZAXHSLPosR6YpduAeMRAsKO++cVRc4zWjE6xxD5Jgxax2iywaxh+oOZ6w7BLYO9r4JETXH9QLE1nw/z2DhQwjr/bCzFMCXDYuLnOHMPfW0QAgX3PI9w+btcAxpZhpZ1mFyXOMcD7txYS91tCNa50JL5WR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKWZD8uF; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKWZD8uF"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso29701231fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 22:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750569828; x=1751174628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKFZiSMi/Xp/r0IR9bfV0zxY8iABN2FCJtVKYOPiEeM=;
        b=eKWZD8uFgyyCvvkLwbq+EaUvvoB/tW4aBNzb7BUB4saTU/m4r8WAAfRALusIUATn4B
         SUJGo0bMXh9rHArAUwlNIvy0r/ZW+3v+Pb+K4I/4Q/40dk/8U2le/f38lwiSMOwH23ZW
         35kJVfmVpnV+2yUgrkgF91uEKxeWTYrwK1GLnQzC5I6D4mpeIqT5++VM5m5F0poinY26
         W+x8hUvsqAdd9br323lH7BaeJBiiu5+UWIekmWrvI2BAm0mwXtJGI5N/ckBC2tMYSZ3X
         uT4CuKvL4qbaZEBz8ZJg2yFskqYAeBga1lBN1ZWKkRDpDN6f6NZBY9z9kh7E3PiQw2U/
         DDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750569828; x=1751174628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKFZiSMi/Xp/r0IR9bfV0zxY8iABN2FCJtVKYOPiEeM=;
        b=bTpUIKvUXWURwPxbem39s8WaZhFLRl5mqV7C2M4kajy6b99kT7ugVL/0NIcKWpb1z2
         5N3HQ19Ose30FkHkpl44YmygiT0uWKC7ieafEjbXdZ94BCb7ZhZeFI9BgxFtMO5ewxHc
         5buUCMRcKmJY4Oz0ER0VguI7BL3TxfQ0j1mLIlCYkoq0RiBCzpE5hNuAzFuHnd0Jms6N
         DomTOYWGFXUy8067qw7itNBouV5Ts9PFMzqTO1dy98TGJ9tQsOuiwqojS9BGuFNJ5Fj8
         8VC6fq9uvBJH5uyFrw9SV3763AAeekNriABmhsrXJbqDC4h5WdS4FKKQG7WOFqwaJg1U
         PASw==
X-Forwarded-Encrypted: i=1; AJvYcCXzCiiENHivUzKyuVUuHPfeusr2R08hEnef4o9MuDw4MKcUZBaHvQss2jwhkwLrsGN7acTiS0XCdwbdgzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdfv+CI5Yznjr8BBDHYXQVIU4mvGWAZG6KVY4Pl+E9FcqVlcm7
	ebyps5hYWmkOezE/YZjfk9jEOOPNGKiNliCxpI+8DZF6G5qnjpCnFW0qGOHInFEe+PnjYmB4ejs
	jCeLI/tID88T1JmDf3vGdIRttlrFCRCPrSgu5DpXo+Mqo
X-Gm-Gg: ASbGnctvcuo2GjdzWgfpJeUNa6L/1m4jmd6WXPYaL13Bw331Y/qR8Zq31aEGl9fMcpT
	S6/wvgq1mlnw8RdESIHoxpkqY0FQOOp8SETJW22m1p9oreEZc8dfBZY/EMMXqhEtn9xYTxmaavV
	ZSnOGhFi40d67y9qPIkhKDWOVziyWVt6B3hh6gNhdfBdw=
X-Google-Smtp-Source: AGHT+IFlNGgsBixKS3mKO5j/Eq7MML/JgNnTzG1FkNkAI+F75gXPFV8jm6c5uEM5B+mtAJN52naT1XuVJtIHWxtu3O0=
X-Received: by 2002:a2e:ae11:0:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-32b99460e60mr23683911fa.32.1750569827823; Sat, 21 Jun 2025
 22:23:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018151112.3533820-1-arnd@kernel.org> <ZxidW3lvA5Pqu71m@infradead.org>
 <CANpmjNNK_viqTuPxywfvZSZSdWGRsb5-u1-oR=RZYTh7YKk8cQ@mail.gmail.com>
 <Zxiev9UaoUlI1xs9@infradead.org> <CANpmjNPvBnov-EFk1PNO4GEOF7XLG7S1bYYjg9i4Ej=ZzaA6ag@mail.gmail.com>
 <ZxigQIF59s3_h5PS@infradead.org> <20241107142938.c38ce0a63add88af49216b2f@linux-foundation.org>
In-Reply-To: <20241107142938.c38ce0a63add88af49216b2f@linux-foundation.org>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Sun, 22 Jun 2025 10:23:30 +0500
X-Gm-Features: AX0GCFsU--xDO8SgX9TQ1fKOImZgHs-YoJz4cTViVoIKGVIutBqdxU3ja_tQtdI
Message-ID: <CACzwLxjW+y=r1b0RiLB-qCEzSuoA4K1V80=Qyxhnhm0GX7-Svg@mail.gmail.com>
Subject: Re: [PATCH] mm: export copy_to_kernel_nofault
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, Marco Elver <elver@google.com>, Arnd Bergmann <arnd@kernel.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 3:29=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed, 23 Oct 2024 00:05:36 -0700 Christoph Hellwig <hch@infradead.org> =
wrote:
>
> > On Wed, Oct 23, 2024 at 09:02:23AM +0200, Marco Elver wrote:
> > > Another alternative is to just #ifndef MODULE the offending test case=
,
> > > so it's only available if built-in. No need to just make the whole
> > > test built-in only. I know there are users of this particular test
> > > that rely on it being a module.
> >
> > That sounds good to me.
>
> We still don't have patch which does this, so this series is stalled.
>
> Sabyrzhan, could you please consider this?

I've just posted a follow-up that removes the exported symbol.
See Message-Id: <20250622051906.67374-1-snovitoll@gmail.com>
Sorry for taking so long.
