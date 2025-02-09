Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F81BBBC0;
	Sun,  9 Feb 2025 11:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739099458; cv=none; b=Ac7hJnMXKIobVYcFoiedg7NqKdL4h4W4253mTppOIKqsIO7db/cbbeEekTHHmm1pwVnXjWBKSQzPZK+skwUnJE/Hmk/0is2XWwasBSLij8rcB6xclb6SaatZHysyV6FA0w20EC8pkHaV5DiPFHnn2hcAQy7+/9xwfdLc8rCcXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739099458; c=relaxed/simple;
	bh=sAUWDNd4UVR0TtxUxTWX41EzwA9qLihbaqkGNklYOg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sq89KFUIQvpi0dMfgrC8bPwrAxgj9mpLwYs4mHMp6IgWW+TNt+cNGLXZ5yqfrFcjExng4PypZy39yr+EwsTOTfZr+AoWvajBsvZ3OcgXgQlOTHKV+sE0k0bb3LIGRmc6iicQymsJoDDI03H3GLDOKrMqOwvPxwtaiZ0lfUWaiig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9uAS2Ec; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9uAS2Ec"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9dcc3f944so838046a91.2;
        Sun, 09 Feb 2025 03:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739099456; x=1739704256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAUWDNd4UVR0TtxUxTWX41EzwA9qLihbaqkGNklYOg0=;
        b=A9uAS2EcJj2hQIVteJfis+HoJQDkng+w6jT1TUDPeILb0/wxjkN9GTiX9MwizyFVhC
         3+rXD7exL4flhVmtdfrIpP2hL5pyVKduUvddhIGlbpe8+PlQp+26H9yQqG0NiVqRzMpB
         WmFnd4bS4217wospcrbT9g/MAFYeWTOlR8MTMrXo9MAoVg3EIvWBwuD8iXFQTP1ogujr
         Xp0DmxBP3lJzsatEby9dITTewlkdVpPQH+mBJm6OWuxOzIXaKKbGOzAeqroU13YcCidc
         Nuc3wpuUV5BGrzSnzDPMoBvR/sfFG2y9jX8Hv1/k4bJ/Wu+s+HYztWVLG2vR06qB/lWU
         gbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099456; x=1739704256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAUWDNd4UVR0TtxUxTWX41EzwA9qLihbaqkGNklYOg0=;
        b=VEs71CanIg0Wg3HACh7x/kYXJmDqEKxeYvWdgA3XEmOi2S48fGTDex057ZMakW7zan
         mA7yg8RlQ/KbNfm3rhoV7x4SGRFCd3vjbqR50fyFpONGY7+KVXucMbqcO4rYPF58YcAz
         V0AcOtNYk5LLIGbiqHDN0fj/1L7P20RqxmD/uH8Lfobxp0BPv9pOic9+T6AJDW26rEnM
         ouLj9FyyRCuOOV9FPlsJOsyb8ZgkWICAammZbntXDJVhQif9mO9mLx5q+RwMa2UTJOjq
         VoYV/QL575u9vUtIUuwceV56HItRI4RabK7nPK25hNGWdqFmkfbRNT4OvEzuveiBEnUn
         yqzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMdKYVJT6OkSRnLRz1guOs6FOVtKcJUTQJJOjaxzipyp4YNvsPkHEuk+6QsteJIgxvRddHVlGr2iOetjFTQl4=@vger.kernel.org, AJvYcCXkWggLXRHi2ZMgR4/oAYW0pHprIIsMx4yz3miegu/ceTHm3fv2ouvP9gUh/9N8ZDScrnZh0wsl6MWSP3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSzKlmG+Thsa8xonUQd7e3BBdvrQnCo3sAYjMUUosg3rO98ipU
	ei+8SPexvbxp3EGnbvng81bVWLyWwyCf7rHMXvKz1qX1h5fMZEe/3hC5olDiIyd+6q98d3D9Ylt
	5l+Bu3MimOCQnyNbMnLbcihUgXgY=
X-Gm-Gg: ASbGncuex3hZLkz5AFnoQWhN2icEMa9JNzPDQSdmccp5e7YlPXoj3nv42+gXbIfDW4l
	MolmaRp3+Qe/srudBwvhK9TZrz/hKegQ16j0GzyhunlFkj7Rr7Ig/QOWWcOaozXPLfa7/mdp6
X-Google-Smtp-Source: AGHT+IHBbyCHbpkYdlHKP7Zgz134DG8QfDlMRDxS+CKLmHCcyVzaGizjy4LK80ZbJWlLanTmRafM56xb6Yjx98+5GBM=
X-Received: by 2002:a17:903:32c2:b0:216:1d5a:f348 with SMTP id
 d9443c01a7336-21f4e758a83mr56641995ad.11.1739099456319; Sun, 09 Feb 2025
 03:10:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207004049.178049-1-lyude@redhat.com> <CANiq72=bspqRga-hTTb3Vh9kD0ctyTehM9dvJdR=8biTE+iCQw@mail.gmail.com>
 <2025020715-subsonic-silenced-36c5@gregkh> <2ac39b766dbf5f9606107d3ead216ba384cfdd2b.camel@redhat.com>
In-Reply-To: <2ac39b766dbf5f9606107d3ead216ba384cfdd2b.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Feb 2025 12:10:44 +0100
X-Gm-Features: AWEUYZnDKLh3EIex9NQOXmi6qm1UFhlq0vORv6A8ksfhqUePHfYjkBmurxUF0co
Message-ID: <CANiq72ndFNw2uDLjOsd1nFjQMFXMHCxAZgUztaq_AR4HA5E-PQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
To: Lyude Paul <lyude@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 11:10=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> This is a very good question :), especially because it turns out I actual=
ly
> think this function is not thread-safe! Though I don't think that's actua=
lly
> much of a problem for Send/Sync here:
>
> So - my original assumption was that since faux_device_destroy() just wra=
ps
> around device_del() and put_device() we'd get thread safety. put_device()=
 is
> thread-safe, but on closer inspection I don't see that device_del() is. I=
t
> _can_ be called from any thread, but only so long as there is a guarantee=
 it's
> called exactly once. I think that's fine both for C and rust, but it
> definitely warrants a more descriptive SAFETY comment from me.
>
> So for the C side of things I might actually add documentation to device_=
del()
> for this that would look something like this:

Thanks for taking a look -- I am glad I asked (asking is easy... :)

> And then I suppose we could refer back to device_del() in faux_device_des=
troy()'s
> documentation if we want.

Yeah, the idea was that, since Greg welcomes tweaks on the C side,
then whatever guarantees we use from the C side, if they can be
documented, even better, and it makes it easy to just refer to that
fact.

It should hopefully also make it slightly less likely to drop the
guarantee by mistake on the C side.

On the Rust side, we can even be explicit and say e.g. "..., as
guaranteed/documented by the C API".

Cheers,
Miguel
