Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3672607;
	Mon, 26 May 2025 18:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748285213; cv=none; b=APufKtCmXZ3Xf/KMg41tt9IUA55Da1goWugXFmHOIQzSIyrEiO+D4AA4d+ZRWfRf5NwNXkbLbc1t4KbG2WmVpODFJxMa8d+4mUv2XlDyhh14AMWarqcK0eB9WOy7ctYGHHs9ARIJpCTDJnGNG14D+4PmjWX6pVyJBy8tZAtNzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748285213; c=relaxed/simple;
	bh=Lsr4bVmd+hLUzILtQaE7DnjbxkvXxlOzELoVmKLYLBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtkpj558Ktf9M5PJQdqM2fZmdozTBIWMuYpK/Urh89vqQcdjM3Mf76lzOEjcUC+S61j+esWxY2RK8X4I1qINP86vlRl+U0MWUsxNTfqVFpjZ/dc21jURuaxLJ6eYSN2oFNv9zLrPCTXmZyMLKwyecY1urZPMCk3+nYcqBeY47Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUuJSQYa; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUuJSQYa"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-309e54e469cso347006a91.1;
        Mon, 26 May 2025 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748285211; x=1748890011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Fof5SyO9Y1rauzqYmUz1Uops4LK2EJWd8S1VclhC/s=;
        b=LUuJSQYarbLvnmOHx6ny7SUgyxD+1pVCIG4PLvF0YDNMlDyKexSjcoexFB3RD6j3cm
         MKYVQ73Dc1pAB/HGuMv6JjY/xnog9msPrLq80skFQ2qajtjLZnzytgsy+1ogN3xPR6zK
         NXhN0BH2zbrkO4IcytLtZbI31beIzWGyKevjsBdduDGoNAHsITO1H7l6IRZj68bKwWGl
         vjM9Mj7ZmgjJcSDWKaxInzcuyHoHRlwYrQvq6PEoxf9w82bi7NRHYOAxlQG668YqPGYI
         EycDJC/uXrxPGX9/4egoGuCiaSVjIMjeLS37kOSgDWN/Y3JlPwRT25JB0Flk6wi0ZWXC
         EWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285211; x=1748890011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Fof5SyO9Y1rauzqYmUz1Uops4LK2EJWd8S1VclhC/s=;
        b=vIC1diWtoin2nSiTdPrzMHZpw/bcRSyYq155+AJ/ihlxafKpOA310zag6WXcws5xRq
         A82bqfTTmCRzjWyS+BeLtH7mBtexIscxuxsrkYH5oMxjdp7ZDI5IaLpwv4SFECjd3BaJ
         u8osFmCydnYtzlD6nfOpnY8GQ1gdXIkqdy9LpFPAnJtIYvEHgzcKLIzDOt+tbMon/Rcm
         4IbawXiU8ISr+kXbRZWsQ4LJ3tl9EkS1rGpWm+LT8HIKGlGyYK64m+IFfaefnxvi3Qd8
         EnrUVzI2V2xEnvmKCgCs0mPZE0n8xxAswxcftvz4kZERm6hmnAC3XUykXV93ajLI+lD5
         RB7w==
X-Forwarded-Encrypted: i=1; AJvYcCUzTt8wMYbYCqP6UWDCnGukuGyvuZ8wiNFUYO4IeCCHO9QFnn6QOT/vZISeQlSLHoGLK91+BEyGaNepvknJ/jU=@vger.kernel.org, AJvYcCXzZaHQMlA62WWJkg5rdH+iGQDlCLA/TcjmpZyYIzNVCGu4EwZN2Sjj49bH9JQ8aLffkOEpttiZODQsaos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrwS3HAEBe69MaJo0lmmCdSez8opyokF2b7oHIVNc+Km3pzG1B
	W6W+P9WbhuzyNo0JPqWt8mWgRs6RhwmKZD9Fl+eW7F8ubFQhUFOdYE4l/uMqvhDURO2EVgZFBnN
	i8HCVy7p4melgSu+niVCPGwhlfb2gegQ=
X-Gm-Gg: ASbGncs3OOB0AHBvKPfOiy55ZhMKjOy8WznXdg+qc21iz3EIBPvc+tjjWoGp5+aPwwr
	8i1+fsLDqQiZKYyFq63kwX2noO+ZZso0MhwUpbtM38LkuOMWxJF3Ozh/GgAKJ8LLY5ScxZ2vOj6
	qm5FUJXUp96Z2A0KdFusDeZmPW+3em+k5vzM4dIIBslpk=
X-Google-Smtp-Source: AGHT+IFzl1m7HWc2fjOsnOSy6UjMQrC1VDyLJQxaAXZswGlaFWkZe5vYMzKYaAOh1/w1zUrRNpSoZXFmVO5YVBnHFBg=
X-Received: by 2002:a17:90b:2250:b0:310:cfd2:bad5 with SMTP id
 98e67ed59e1d1-3110efe16b1mr5997256a91.0.1748285211494; Mon, 26 May 2025
 11:46:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525173450.853413-1-lossin@kernel.org>
In-Reply-To: <20250525173450.853413-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 May 2025 20:46:38 +0200
X-Gm-Features: AX0GCFu4Dw5twC8ejdBaxSvVXT5rnEG8M4cTShj0x4LieLkSWrUT9T53bN1Gpw8
Message-ID: <CANiq72=G5w4D=c4U0KEQnRcy7vmARbWovmJwO3+vkyhixFinjw@mail.gmail.com>
Subject: Re: [PATCH] rust: list: fix path of `assert_pinned!`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, stable@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 7:34=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Commit dbd5058ba60c ("rust: make pin-init its own crate") moved all
> items from pin-init into the pin-init crate, including the
> `assert_pinned!` macro.
>
> Thus fix the path.
>
> This occurrence was missed in that commit, since it has no current
> users, although binder does.
>
> Cc: stable@kernel.org # I haven't found the commit in stable yet, but jus=
t to be sure.
> Fixes: dbd5058ba60c ("rust: make pin-init its own crate")
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Applied to `rust-next` -- thanks!

    [ Reworded slightly as discussed in the list. - Miguel ]

The commit is in v6.15 (rather than just in e.g. rust-next), so it
should indeed have the Cc: stable (I removed the suffix).

Thanks!

Cheers,
Miguel
