Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66EF28934F;
	Mon,  7 Jul 2025 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891181; cv=none; b=nY5qT3fgdf5XJafq5NYyj3C/g4/l4RHnrMxM0W8KJLsf+EI61AtjM/XMT7ZqL+b11Hx4A69KQ3Gvpv/vFSPb0Yi53JkB4GmcFhaU73gnet2mvNuje+VKYqGrwVNpL8tY1c+HZmV+m6C9AEulH3bSKtGNi47J5JwRD7T3ki0DTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891181; c=relaxed/simple;
	bh=loQYuB51UYzG6L+suojRDrVegUMKFh96HVE6imtV/HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNZhmw+8IdTgdAU0YH4rWyD531nsuzlNPRNWBvn4d9nn92GVA0J4KtHB4QFntIDiM+3lmM5zwHRct2LNe/+kZhzT4YiqeK6NrqOw7L0fVyqzSXWjRKmR914s2mRyxUhnkQkpGtN+7hjS4wCH2GfTyZ8KJ+FIV/EsVP3DfSaWth0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSN1q1Ea; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSN1q1Ea"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31305ee3281so630423a91.0;
        Mon, 07 Jul 2025 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751891177; x=1752495977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loQYuB51UYzG6L+suojRDrVegUMKFh96HVE6imtV/HU=;
        b=OSN1q1EaZahG+/AHRnzk3X+3M5UxVglclgZfdF+c9nWxTdBu5T/7fpLnBybXvmgb7Y
         Tod4E8tyJcjuR6LrIuz0g1rT0+7p0LQ23q7bwiGzuLIlnPbmUIbGrrOejbMvFr8NvCDQ
         axgUZvDrcoZF2nZ13B7WfI/xNo7uYsgAy+czMN3SST6n6HGp5pByXRdZADKoHotgnuAy
         IkwrcdRpWeXIJm42/FA0hV2d2aFg1xBFB0x1JBsvRq74t/7XRoDF4OtxYx1+Y0fdI5UO
         oGDE+f/SBC7/2OfSads8zpuAeTSyXfOl6vmtIRLBwZ/B3FqzrMCgYzuUaheVfAyurXp+
         Ec9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751891177; x=1752495977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loQYuB51UYzG6L+suojRDrVegUMKFh96HVE6imtV/HU=;
        b=c0Kz2y8ibe5LTESHxTAMyEICU9OaTZRE5KN8czkqYHbpmoE3uF+YTdLPCl27sGzqWu
         /i0VyRR/P4J7wv8+BNEDWw/Xv2geOJjItk9e0gWkoIJU1CFN7EVKaxT1jrGCqo/+PfG/
         MjSrAXb8iVdySW9ZndTdWzX//2Ap8phkm3bPaS7WunQHBgh96S8PE/EtVzOcFBsmbldK
         x1VFEYa6Oh/ohtjMrIu9tZ7nU6IUvoES1GCBA2BN2tGRd8Kd9vCfUpqfnAnAq/oFTWEB
         8gWU9N77xCPwzM2EATXpnQiOQPjaL7UYU9ZeocTtPJhRYwJnjAas2kut34hrJ5P/lj3q
         EgKg==
X-Forwarded-Encrypted: i=1; AJvYcCU1YAidrIjlV9QlnFB+6fMaZIu1ceOSNBf+5eT7EIt0DI/1qNqVuf8WO1MXkdzGvtJft/qt7SeWg0UbJ/BawGQ=@vger.kernel.org, AJvYcCXkL3YQEwNml9mN2tcvsW6utkC+trPJNGqEeFrhZ9WhREIYOZnrRV6oy9FdR2VVa+MMdSEYJY/W+J8qcd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YywJtCCfbL2jkhTftn379BKf0Rjy3z0UAGDMdWjUqFBKcgsPNK+
	G8A1Z9m3P00pxGmz3pqhwNowY/OPt61jz76fjfy+E+dmbhv3vu31DwIM+MvS4Wqr506+8hrAXRy
	Jv0dl8wiFc04R8GUkOKhppQhXPWVlyoM=
X-Gm-Gg: ASbGncuGHf7L7UAKoCteaQnjjRN3f5Bh9d2zg1efz1RHaj/ovX8uZzlMmo0vDxcnJzk
	1jyz3x9drLS9uv0jQ+pbUvl2wn9Mj2ZiSzftDvqyhUBXV1ddyTITfL386CFJ0o3BimB2agn8FRX
	2saqGExh0ZIw22ZRA++F+CgYuEQg+vkQIakfC23qPTx7Tm
X-Google-Smtp-Source: AGHT+IFR+/js7lsN6sTqO0hg5fxkf91/CnwTjzYVj4M18l74sMLxSZ/jbBl0Svf98OfTmcD9Lxf/1/V3HiEqGyWp5yU=
X-Received: by 2002:a17:90b:17d0:b0:313:f9fc:7214 with SMTP id
 98e67ed59e1d1-31aacbe7a04mr6622147a91.1.1751891176785; Mon, 07 Jul 2025
 05:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618-unique-ref-v11-0-49eadcdc0aa6@pm.me> <20250618-unique-ref-v11-1-49eadcdc0aa6@pm.me>
 <DB1IPFNLFDWV.2V5O73DOB2RV6@kernel.org> <aGtv9qs682gTyQWX@mango>
In-Reply-To: <aGtv9qs682gTyQWX@mango>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Jul 2025 14:26:04 +0200
X-Gm-Features: Ac12FXziHaW9R0W2SbmJR4fsOa92AQ5mTX3QsWxwcMo0BEL-F90H_Zx7y7-IwO0
Message-ID: <CANiq72kzznGJT0ai+xFgq5QkOa=nRCC5sYPYmUqsECdqREKUqA@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] rust: types: Add Ownable/Owned types
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina+kernel@asahilina.net>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 8:58=E2=80=AFAM Oliver Mangold <oliver.mangold@pm.me=
> wrote:
>
> I don't have much of an opinion on on that. But maybe refactoring types.r=
s
> should be an independent task?

Yeah; however, putting things in the final place now (even if we don't
move the rest, which as you say, is independent) avoids a move later
on. Moves are themselves easy, but they can end up being painful to
coordinate between trees / across kernel cycles, and they also make
things harder for backports.

So, if possible, it is best to try to add them in the right place, and
move the rest later.

Thanks!

Cheers,
Miguel
