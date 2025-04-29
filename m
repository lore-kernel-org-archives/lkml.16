Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112C62459E7;
	Tue, 29 Apr 2025 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960770; cv=none; b=kri3D954jNaqrYUVCOQLr2u2Sw+uksy5OkZyIECkMqtZ+UlckS+r3lLgqZ/rwV4yY+7glEitcj1anLrBxVmNqM10mMkGOLlK1ek7yXwLCaAOg540T7D+E+aP9/q3m78TdN/+Reo2fG2QuEgvXNqILIj2fQNLLyeJI5dQPOJ4fLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960770; c=relaxed/simple;
	bh=RzYDec4OkUoNNepxzZ4lUv/mU5kGCwxZnzY5XUXzBI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFU9NGS5QbJpVQDwG8pc7ENT8YTsV9ecq8EmuYTjD3FhbCHvTKB1Dp6HOQd5XFx1Q9T3SIhJcwmmh3gnavBlEr3pbOMxQqh8DQVqxRvQthub3HWAZZMyjBRvVUq2prnce7LZfQiYre7JaTV1WbjNXx5GflWiKoNC6wz3uPOYU68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsOWWrGH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsOWWrGH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2241c95619eso12435835ad.0;
        Tue, 29 Apr 2025 14:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745960768; x=1746565568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzYDec4OkUoNNepxzZ4lUv/mU5kGCwxZnzY5XUXzBI8=;
        b=EsOWWrGHL3iBfF2VWNeM1+Ffv6+vG9Z8WCKU/Q7N/dUBJWoJrVMBtzRT4X3cLRpUWj
         4qIa+Hwg2cF9W0cHS0MICSvBbKiSHxnvcMjdbRF771XgiUP8Yc4/lQNc7oPs+5miQIAF
         /gXqytkqrLIuQ24nmLAyHk7pr2OKOOjX9mzKozRH1WxOvkVF4NOj9pP7vN4WEIzONCKl
         9tShBvPGmtQVeihgFYIFExBrg41x87G0hRraaT6uY90WSHXcuxIhCJVBNHLmdhPhCnER
         TZSJA80vbt+sXnakzW7nkKwAFdBGdduP1LBYOklGtoXAc6GOMGTlh9uig9SVS4sfi6Lk
         py/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745960768; x=1746565568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzYDec4OkUoNNepxzZ4lUv/mU5kGCwxZnzY5XUXzBI8=;
        b=uYX77DDqsfPdwJdfnbu3ZL2N6Yafaajlg5eu/W3ih3tptVcrVvAe3EOf3vJd3MAW6T
         8zY0PlzSsCLIo+MmiK3AVwuQkD6DtLmofkrI6uD1DTW4Z1R0DTO/7ROIF1o1JGdyqYtE
         Km0ouOISdUaLdxFB2CgeGakiJIr9osYoTQB2j1goh4GBg+NOY8YnFnuck1DFW9Tr64di
         qYggJScOfFCdyIeXcSjAqgyf29dLyBUn8Fb6N0dWk+LoQQn+4kKxYh9z+ALQXL/aazI8
         Ldlf1Zi8U7FxFmgjGZTxGiUgjzqAD2AkIoW8w0iT/BP1IbFaMVuYFSxVV32rPKsPWkZJ
         dNog==
X-Forwarded-Encrypted: i=1; AJvYcCUdqG0RwABARXzD33CeTGl8zkLDdXmiRdDZzk01uoTW6RTQCAdKZLjPWGsbME3HJmaP6LIyPfXorUvavvo=@vger.kernel.org, AJvYcCXPdpaJQzuDLy7R9AD3Wo5ZmJsd+CQ4R1d+5g94Ie8mf1n5t2r7Z6khOmzAMOeBSCiQr8iMf0N4n+ETRix8eY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4thfUBRMJw2jLetmtNEqOm1iDkMYM+zJfxfbNhNI1x7U6XR5B
	7X+m1IqdFurKUldWDe97lvP0+SY3PzzWUfo1TH/Ky5baZKjhXewiz8HKWVZj64wO6I8l6veD2p8
	QooQHxHC95trDJSD6t2YGGs658Vw=
X-Gm-Gg: ASbGnctEiuLLKexiY+7H+ctUgxh8YwG89JA87Nokd/B8v28hX9r5s22PnIGRJqm1fwd
	pDxp9rb2KzQ7zYQZoKHK2MhkrC32wMV2PxuyY1fUFauYeA06m/7uaWgstu3OL1K9Bs5925rkBQH
	UagZOlbM6eehm08TjQQU5KCg==
X-Google-Smtp-Source: AGHT+IFewB/iZu8YBL7iv9licgKWpCeJ3akfnuCA15ddgmQh6O79GlP5m1SYAeybuWOt0FWlzEQ3UzhLhfJQQC+RgUI=
X-Received: by 2002:a17:903:3b86:b0:215:a96d:ec36 with SMTP id
 d9443c01a7336-22df5789ee1mr111155ad.5.1745960768311; Tue, 29 Apr 2025
 14:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429150346.392050-1-ojeda@kernel.org> <aBEXUG7QH0ymRuLm@pollux>
 <CANiq72nf86+OcMTNPQVnF=pXuaJVw0bFixMxs6qwS5vTh7RWxw@mail.gmail.com> <aBE8qQrpXOfru_K3@pollux>
In-Reply-To: <aBE8qQrpXOfru_K3@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 23:05:55 +0200
X-Gm-Features: ATxdqUESGlgll5eIXdsnljOXRn_rEs7-l9d2t102HYDNgJ3Xon0Dx10c7oqOVjQ
Message-ID: <CANiq72kf3HY1FUwRVTGGGQVOXxgBkfurHustX6VfM3kYrz-3iA@mail.gmail.com>
Subject: Re: [PATCH] rust: device: allow `dead_code` for `Device<>::parent()`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 10:55=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Well, that is much better, thanks!
>
> I prefer this then, I really want to catch if some other code starts usin=
g this.

You're welcome! I will send v2 then, in case it is not "fixup"ed.

Cheers,
Miguel
