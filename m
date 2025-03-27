Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BEA18DB0D;
	Thu, 27 Mar 2025 23:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743118752; cv=none; b=LjXik3uAEBYQuE4gXHkjRkn0nG6vfXHPfQtTrq3tFW13q6KYMTpYb2fVWHt2R0VdwzI2eeRBJtsSwXz70OKeeZe7WAFrU+JwMPof8iTQuuWlGtmmIwoLrLtiUQt8ufTsVGrxG9NV7OezwzMk7WWnBw1ACplGOM7NK+JZlVRhVfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743118752; c=relaxed/simple;
	bh=Iq8fkabNznaIKVeBv51mGPlNivd78e3y64yDdPnKcec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dtx7KrL7oZtlLoZbxaR/Ze01/JfjQcyEOdWKzk+EzOY+3qCG5q56KsAigYd4yU80qb5WFIT77suyi0itc+ZX4ktmOXOXLtLc9KdraLjkN2FJgIkRM2L/yAdcsudLuy4Tu0P+FIQ46HCoIZ4LaGKCMElPKTFb20uQzV36e4Y6FZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBgeaoGV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBgeaoGV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so328620a91.0;
        Thu, 27 Mar 2025 16:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743118750; x=1743723550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnTm9UiQ7+ij4sa2YfjCODEx8vvL8uoupOxT8VaFfk0=;
        b=lBgeaoGVIagyNZhm8476nJJfwQBTbN4dDLiqezeH/Eb9Bhzk7zL5KXPOA3mDAUWuMr
         k/nUR3HN/tBxTsB+SOknFutIAd0RNDWU+xxjxbj4Gpw/cgS8GpncGhCRCcRZxpnpZs9K
         G4dE7T65tqN3cBJDGXJurLiOWDOvD4xtr5J6BmbzxJ118a/XoG5Q9I7qf8ARwNzCou2U
         SCBel1px6HIAB2TDU05FyochbMG1BDHM4NdXHRKahkvbjDVETrxHp9538WArjXpEP61z
         lSfktR2reTbVBgGerY/JsD4MTTTwaVE6EqQ3JY0Qv6u1D1tXuR0AXF12VbjeL9syzgWp
         dJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743118750; x=1743723550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnTm9UiQ7+ij4sa2YfjCODEx8vvL8uoupOxT8VaFfk0=;
        b=e5NHttQwi/qubGSizCvh60IVHGdQwEcwvKE3RHj+E6mpWKDtc5xXTtekaSrvtKxV2Q
         SkO4DPnKMqlHwtXkUW6P9SetRcV5V81/AbPM+Xj2O4dbFnj1P+f6+o3RP4R7ClGSit6J
         8QoYFODvkaFxTwhtznpes2KXX+Gxl+/dmz8Ew1PzEiaYHpz86kyocMEfDU9qNND5T6rd
         IoGQO8pAJw+Qj5yU3NuDvh+E3ztMXofA8IONcSNKNzBFZGSriqPTGqVecGbhkLz59x7+
         oPrl362vgm8yB0lk+sdR2K6kfHHfLzT77Ma00eCA3fvzGoN6/5DHhnTo1whEeOP7pM/W
         C+ng==
X-Forwarded-Encrypted: i=1; AJvYcCVlN5RamqStqKM/ftYst3R3Spy3q9XDW3T5i2FSPBSlcNGr5me/10299/bGABW9Yo/5ffda+XX0oIQq7Ss=@vger.kernel.org, AJvYcCWzhESshqMaTZ8G/fLq+rJoWfzMPae23Fo7y3oWGvmekztC234z3uHEV0bVtpGCvn4vDedbSPuQqFSUdtc3Asg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz5tKVL8pb8uKCg+aDFcat6wQknoiAt06MWDVtUbqbJ9wAbSEx
	jbznuI6yFL25swUHxo/8XySiotJhVbzs5aMryP7/2+3jilTnfNJwwimgJrCQrhNdhWac/77i33O
	Kf/TKo7bGRG7nseDBz9w4faM9bvw=
X-Gm-Gg: ASbGncvL0hKmU41icDwuB21L96ShZO7NU/EvBi6/DCubre2nFmLol2372wTi23pz/3l
	LEbi5wG23MVZ5lX8Ur6NKqtwx9IZuVjAwYSJ7sBzo1Q6kzY7P/cU2FeWwU0vXN4r6H/LiJlk9kk
	SrZiSU+7AzpGfo9n1QwLG4CxZDBQ==
X-Google-Smtp-Source: AGHT+IFGPH7qzBCfMvdFKrwYS6D6EKhSTXgk16xQ3JW+Qt49nZJRd4wkAFQo3rIxPuebsYm8NveXG63pCmMfMmaKFjU=
X-Received: by 2002:a17:90b:180d:b0:2ff:78dd:2875 with SMTP id
 98e67ed59e1d1-303b2754fddmr2818380a91.5.1743118749669; Thu, 27 Mar 2025
 16:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326201230.3193329-1-abdiel.janulgue@gmail.com> <20250326201230.3193329-4-abdiel.janulgue@gmail.com>
In-Reply-To: <20250326201230.3193329-4-abdiel.janulgue@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Mar 2025 00:38:57 +0100
X-Gm-Features: AQ5f1JpO0ix6LGGpIw8NmovhhECl19xyvqN09h5Zqra_u1faeMtSnDMnIzxYki8
Message-ID: <CANiq72mwp6=6PHzwaenovuJ+emW+A-wmun34oTUJQFd3vPV_zA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: dma: add as_slice/write functions for CoherentAllocation
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: a.hindborg@kernel.org, ojeda@kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, 
	"open list:DMA MAPPING HELPERS DEVICE DRIVER API [RUST]" <rust-for-linux@vger.kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Few doc nits...

On Wed, Mar 26, 2025 at 9:13=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> +    /// Due to the safety requirements of slice, the caller should consi=
der that the region could

Which requirements in particular? Link?

> +    /// be modified by the device at anytime. For ringbuffer type of r/w=
 access or use-cases where

at anytime -> "at any time" or "anytime"

> +    /// the pointer to the live data is needed, `start_ptr()` or `start_=
ptr_mut()` could be

Intra-doc links where possible.

> +    /// Writes data to the region starting from `offset`. `offset` is in=
 units of `T`, not the
> +    /// number of bytes.

I would double-check how it looks in the rendered docs (same for the
other method) -- the second sentence may be best in another paragraph,
i.e. outside the title, since it is special in the rendered
documentation ("short description"), unless you want to e.g.
differentiate from another variant.

> +        // SAFETY:
> +        // - The pointer is valid due to type invariant on `CoherentAllo=
cation`
> +        // and we've just checked that the range and index is within bou=
nds.

Please indent the comments as you would the docs -- the docs ones are
correct, and Clippy should check those, but it doesn't check normal
comments, sadly.

Thanks!

Cheers,
Miguel
