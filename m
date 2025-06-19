Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B383522A;
	Thu, 19 Jun 2025 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361507; cv=none; b=BiOlOc0Riba+IsQpEGlg6svI7qC02biJLvNg5t3jOoNydyvF+agi1Yn/+rLjDBEDj22HA1N24yLhttopTXsiblnamkdzf9nFN2/zf9OZrRZhiR9OupjRp7uyu0SHjxsZgp/H6oB4Ks08CFINvJwwmS+tdCP5mk2X/QEhVcgpSOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361507; c=relaxed/simple;
	bh=sAV37d0cFXJZyNIU7TPKo9STDXldlu95Ciz5b1DMJso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P54LGdCInUp40YD275I1f3rsW6+UdQQrD3jmEff8Pwa1hM7g1/qQQHpC4lueKab5hPIyfm+kjq9XKzQPRAJbekkzgB7W3ebgpvk17I/1mF/wsJ2tJC3c48bl7MA6w2hovSo38StEsP5IjPeTeuH90zzAM5aVXkq0d2qKyivmaMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vtx2zPbm; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vtx2zPbm"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b31c9132688so132604a12.1;
        Thu, 19 Jun 2025 12:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750361505; x=1750966305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtEHKWJLefufP89E8LWjawJdakPNym2pyBrvAO8Qp3I=;
        b=Vtx2zPbmdnfRk8fTpTBkd/uf+Uq3UaxTWdvV2yRg0pq1TQ7oT/nIH94EgGFePVujQi
         xnd+7DwC3n/bfOLKqaaQZtmmaE2GN3daX/LkB/Gm9W0RJo9ze0AWGNq6bgHrzwkXHypx
         Wy1euK9BziFtA7IMV7HymhEDjei5DqAUHO9V87i/A6T0a1RuJQcotZQViMAF/ErcHxfa
         2aR323ENi6YjTFW4Zx2jP8VxNOFpiTag00nhIkKdv8skZwMoH/VNNrlAeYo9Nhr3WMaV
         NWbk51nsP9Kk1jDQiQYSGJf/7DfWu054SPmfwHVL8ceqNFrj8prf1Nf6eJhRnsJYeUy6
         pOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750361505; x=1750966305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtEHKWJLefufP89E8LWjawJdakPNym2pyBrvAO8Qp3I=;
        b=GS9yHLUynbIq/OVf2yXwsBEPa8J9OipVZmJVdYJa2eU9wP552Ia/6XM0JKIW6n+xEe
         f3UZZFA2LpBzyUIeW3dlxhTMXZ5yjxQoUINNw7y6iW//LLf7GK7/Dll6CY2kq7Lc8D/V
         XY25oBL54JyfJqr5hSkiGZd1XREur+xakHyF4fuw9fDS6scjBI7iYjzTVpke3dr5zOm2
         /jJ1fEydP6x5Zf+IUFgCvnZ9RlqKt4Dz61mtL6fQgwjJKyfiq2dJX/nU2A5mbGetpMWx
         HAbWXeKo6WfXVvRH5YD3h0ARwzpC/ctK3nHw//zgub22lIxKIk0BA/vGpU4P/zTlAsAN
         iZhA==
X-Forwarded-Encrypted: i=1; AJvYcCUkBMWmRZhTGxYNYbY8RCxe5yPibbebtV2HKXbRBO96Zx8pEfCd0X3zGBAfOnkovz55sFsgBz19/FjuyNQ1Lwk=@vger.kernel.org, AJvYcCXBAvzC35HTVoD2rY97uo7PXILqd5LDz7G5Hvq70xJtDjbiTytH3+29G+1c3JsRB/MHhN1X30kj7CHXsFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxUIEubPwoEVyZBAvC8hMQuf7P6LOsQM45cw68Qf3JJq25mIez
	8ZaOHeIFkFrsqGDDY1/G+eE899aRv2elemAbhgbLhUOUKhj2RVW5/Swey48mD+QIvG91OHGzQxx
	BNS9xrzNv3AdI4Jliq7Jq+fwme5Iwa2Q=
X-Gm-Gg: ASbGncuGMy4+/4bkib+B4E3rfk/CGqvD05oYV8F35JZUQ6bwZtIctZWzgNMdzutQo6m
	mJS1cs6+4akY+/QtWW6dzvhI3qbkNLQfU3XXDQhAxwycHJKG4ue1EXQ6dak9PJU0VrzSEcilXMd
	Qwj36UNqi4c9LXVuA0X839oZmi81Crtl5rhhUaXyaprto=
X-Google-Smtp-Source: AGHT+IHEq4DFo+/yVvsQe9ARdAM9/iGz0q2OVWhVoh1F6aZJ3o8LIx/dcNW1+DvX57Dl2Z2Jegdu69eVZoB45yljgM4=
X-Received: by 2002:a17:90b:3a43:b0:311:fde5:c4ae with SMTP id
 98e67ed59e1d1-3159d8e2be9mr207043a91.6.1750361505301; Thu, 19 Jun 2025
 12:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
 <CANiq72mnxRquFmjoJemb=3LSq+ZdUfs9J+HXTwM6AavprsVNUg@mail.gmail.com>
 <CABm2a9fVSGm+WWjdkAmJHUH9eH=Qx5efORKxyJtt0HnQrs0QHQ@mail.gmail.com>
 <CANiq72=s6Ugqrf5Ot6fJOMyCug2XyvKpjFCzya_Mr5iBkpitLA@mail.gmail.com>
 <CABm2a9e+XJsess6XY5ukz8vav30ADcmBrufmek+Bd-TNJpR2aQ@mail.gmail.com>
 <CANiq72kY=sSnhzYPRo3Zuj-7RjULMpRfCBYfoDDCpCHttX-3-A@mail.gmail.com> <DAPWP2IC7HZ1.F1GYTSUGD8WN@kernel.org>
In-Reply-To: <DAPWP2IC7HZ1.F1GYTSUGD8WN@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 19 Jun 2025 21:31:33 +0200
X-Gm-Features: Ac12FXyddGraOnaHyCE5OHVAk2L4ld60yghKyl3hA61dKQn8bMId7m3JSW3tsDI
Message-ID: <CANiq72mZYSd2bFRY30HbHQAsptbr9YYa6Veak6_eehMXxNKyLA@mail.gmail.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
To: Benno Lossin <lossin@kernel.org>
Cc: Christian <christiansantoslima21@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 9:29=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Yes, the prelude won't have precedence over locally defined items. So if
> someone does
>
>     mod core {}
>
>     your_macro_that_uses_core!(); // <-- will error with `core::mem` not =
existing

Yeah, ideally the custom prelude thing (or Clippy or similar) could
warn about having any collisions with things in the custom prelude to
begin with.

Cheers,
Miguel
