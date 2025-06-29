Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116A23CE;
	Sun, 29 Jun 2025 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751225501; cv=none; b=mHqD2hjx+iYJsB1UmmJyO2SWKOKrySljMck2LUQ6wrrnpg3EXdWuU5eN4DkcsvKLDTQ7TRPmElA6a+KX/7X9p2w4u0n/ERL5lCdiON7LXAPOo2i4nqv6/xCnjRFHVAmbiwMzuYTd9MYnzMe5686KKrrQPKmcseH/T0zQyHh+yRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751225501; c=relaxed/simple;
	bh=puCx3m3ijJhv2xY8UD7sxNgYdB4S0Z5zGmnfB9JdlU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yq0ovoA1lCcV1QFmyQIG/6PlAjem3p8+ZBzOtMnZ3UjsfQE224VblislrsvhrDtexzqD3qBTt4nf7TU3BTEWhzhV95NTsByQC58bXjY10mtbZST8ulPxastN3npYpKq76TfjHwb6awCxv5WVXFgnUoHzoaitfRR8yxY2BEioB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWalgRHc; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWalgRHc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-313fab41fd5so896198a91.1;
        Sun, 29 Jun 2025 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751225499; x=1751830299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fmT08YCirP/kmmox56H3YoamB4syz6uTiliCsGLSQo=;
        b=OWalgRHcvN6FTAzROxfEsrPkCLv9IxCb2bZfT/bLyWvG0Og4Oqt6ZNtJEQRLXw7ERs
         /bvTLPgxAuvWEWNdL0INQ+1oCrMZSVEgKuEeRiYyOFPEOzttLqjGzk0EmjQQYkAJdrTr
         YxuPO2bEtmdUp7qOt4FR4NJc7m8gihvoBitkIKLzcafX9awTb6cHnJfcKNW8DlTVePE4
         G8U771aJ1xKPJdrvq02egi+rAESx7RRklXA1lp4WefXTX8W/VJIz8uOtZyTKFeShvlK8
         5FWvno9YMjJ9D00E9umqmMcNQ+tWNIwGPseKI9VGLtdh8p0UkVC1l3XZqfEgOuV2hlmr
         xrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751225499; x=1751830299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fmT08YCirP/kmmox56H3YoamB4syz6uTiliCsGLSQo=;
        b=uj6bYm6+wwOoT2NGZvKreSqaScb4LSNttIOf751vMGs+sWHUOuh4ps1E2Ir3pIVLQt
         N9pZTF1Z3BK1CfME1L1KafxsDqLsGLCGowjRVt7KT9Aj4rNjz/hlU2uUUj0fyLi4a7JA
         ica0Qi8me3ByyOO9VtfPKxeVLgWeG4uqeYJSmRuHBHqobZA+aO+yDPdj8gKEsk9lQMnk
         KNHoE04AQAeI7f72FCCI7wR5TRUMOf6m+BgF28pRTvAIREPXdT8lG3mCbPiN6Vyz3iNn
         kOjlZRINniAkvcurE9vOYG9w8IeHrU3tI8Pd30qUTE8Q73WsfWZsGj6/ZKu4gJKih/ez
         OaIw==
X-Forwarded-Encrypted: i=1; AJvYcCUN2NkBbz+Sphrwu/7b2VKFFs1z+VOyI5oVPC97INuryTVWeQX945W7cgGpXegZmjNeZ/z8cRCeqTwY91U=@vger.kernel.org, AJvYcCXdWI1VBfzhjH+G5Sjo+tBow9QUGKt7MNeklqNsgemsWobRodXoblejoIO2ed2unVC9jrVZre8ALnGROrPgq9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZP8Z+AJ98dsyPo5lOc4da35TjUR8MpUNiRDuvWrRkzc28E6i5
	7DnZKTBy7IAwtmjLebo3mdOIhfU0Z4xb+fOr/x6KT32aLOvToM1SPHySeS9UWwMaZtbLcnglk8X
	FB7si7DjAfxS2lk9N//9feBgpwb79XpbdkA==
X-Gm-Gg: ASbGncsD+8+8JsfC06Z0nWVVXm0WPbMTDsCFCdOfEFSF7hJqv1MIxYFBmat2i3WJS8i
	FRbfnn2xPo8JqkQfcsUtOOWdskQ01SJmAtPuiFQFDfmSdDZEPGH/PfCcbgtyjiQzlzKwpjQaRKz
	R/r0rs9s3PG6u1hk63z0XPl9sffBObTa82N9mgCmJMwaM=
X-Google-Smtp-Source: AGHT+IGZYieEqw2ODJl+hKmg36Rl5gmEpYYPtY6vZPl8MK+pU74wXw+EenxLwyMwZIaULnIcEV1W8vEKAKDvimvBXyY=
X-Received: by 2002:a17:90b:2e4d:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-318ec4117d4mr3562570a91.3.1751225499417; Sun, 29 Jun 2025
 12:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-rbtree-is-empty-v1-1-61f7cfb012e3@google.com>
In-Reply-To: <20250616-rbtree-is-empty-v1-1-61f7cfb012e3@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Jun 2025 21:31:25 +0200
X-Gm-Features: Ac12FXy_D0bZVu53droi3lbTffW__2BqoowFoMIqkIbtxn1YlU9-dOm9gLt0uco
Message-ID: <CANiq72mHAJvjKkJmOu3EPi7Xy7NiHFPawz32-yxWHKGeaFtjHg@mail.gmail.com>
Subject: Re: [PATCH] rbtree: rust: add RBTree::is_empty
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 12:36=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> In Rust Binder I need to be able to determine whether a red/black tree
> is empty. Thus, add a method for that operation to replace
>
>         rbtree.iter().next().is_none()
>
> This is terrible, so add a method for this purpose. We do not add a
> RBTree::len method because computing the number of elements requires
> iterating the entire tree, but checking whether it is empty can be done
> cheaply.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

    [ Adjusted title. - Miguel ]

Cheers,
Miguel
