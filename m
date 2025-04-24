Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D696328A1C9;
	Thu, 24 Apr 2025 16:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745512748; cv=none; b=KB1nf0deMOGM3MOIA0pGhqk4JG8Dvelb3kjlGiN5QBONOVr7qAwFl7sJw3C1hj681TZuvUhwB6/Fdwy0ydwfQbyN2qNpEXae00/c9qaPgzsnrPppBbpKMBLJeJyCc/JyuYQcnTAuhKCuHmmIJ+0Bcv5LN/z3uwUrZ2uFLTiabgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745512748; c=relaxed/simple;
	bh=F1o0DwoIj/AYQ3Qw2PMHZxsp+slRKsK7vQj4ZqueOck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e8hWX2IRvU8V0mC1VhL2JfVI6huiO4xxAJSePjhY0lM0mGvlry/c1lU60oHqzV8jtiEDkd2XIVt5IbPhNnaElXwhVBL2vD3TFyF8ilxCsbdM1wwmM1yK/2yrNztAoJOTTTqlSecmElBGOdUXihr6huTI1ImHoRZzbCErnOplSd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdKk8p5u; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdKk8p5u"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22403c99457so2665945ad.3;
        Thu, 24 Apr 2025 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745512745; x=1746117545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bt3wozjtVwbbCl/hvwfmWbF8sOCwYQJ/mqcu7tbtpKE=;
        b=YdKk8p5uBWy3n5Ljc4sc/hEgtc0th2+ix3AGrKD6xCUIZDbgCvZQpmdAE0+Esi1Hha
         aix9SiK4IC9E013jKo13p3X6CzK5vG4g+u81ZUNutI556hjPNS9SNa/R69it4rrPUrWZ
         AHHGnIwV3P4YEUYovg9ph2czQ9+QXg7n7AIl5IhWsC1Rqsfr/9e5ZzBOmK2SwPQbpO9C
         kK3LsYI8uruJrxUGYINuh7E03OE+F70KGd2KK/edbWb+Iyl1bF6bxB41khX+lVvDUvGw
         V0OVoq35ewyryA25zUTP95j5Jj4+g0kuyoE+EWdrFaTjG1Q40MzBnncx+JQhwtz/XgX9
         9hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512745; x=1746117545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bt3wozjtVwbbCl/hvwfmWbF8sOCwYQJ/mqcu7tbtpKE=;
        b=C+ToKbCOeQ9+ttsDXYT/XUO0JxnH90CSQOgz3RCflwEEK1cbj/E8bEnY3/FiXjo3wG
         mD7Xa2DCEUGgXjoByyP8YkyGOCjUZC0Zmi4NeAUsfJpE2PIPBKd09HRWfDej9m1wxTsy
         yC7Dmom8xWa3Io1LgYop9EQsDrEF0OJ9djgJwH58FyfXywJefW7bYE/xN/UUM8nd/S4t
         1DOSHEqkn/3wXT0kGZvfAY3cJnjXpXqN4eCuW8i/seLKxRGAQuGAmUAU5xhe0DGBSrvW
         qwtEZqWn6sdqj2Awz3XBdyqCzHLCw4vVFKBkMYRugdYUxZKrL+B/lLCNq2gnfj+UQuQe
         JbcA==
X-Forwarded-Encrypted: i=1; AJvYcCVh6sCY6vXImPADUt1SoipOQ/2Xp7ZFsCcmpM4b0nnAa1Ym/2oWHQPDENy9GdXZCX60h6+FyEnCzmLnul0W7CY=@vger.kernel.org, AJvYcCViG0s/RrwUG67hMizPxlTGOuHI8qTuz/klFd8C1tJ7glBnowMs72psP8ALpN/dSjZjZViVDgEhdk3DvTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAqnGFVi3zlyI77dVuh5TjmUp93sCOXviQHjg4ASUJSAtl1Pej
	0BTaBpv8C2LHlbtBIs8bnynm8Bf/8wmrDlKymBl3cyadibLCM1MpYLQJl/0Oe6SL5rOwI3UQlaL
	DOVo98J0w+qqsTMJ3/w6790mIT50=
X-Gm-Gg: ASbGncttBAqFsvTpxSp8BSwLYJINrZ/HXK2W7bVDtu7IeLQNpuqrf8x/Un52CPi2hUK
	NS8vaU4DegIeTXZg4MsJWVUvOLVpvv1F83MTDunsnQngXzra9DD3YSTzYi4JAUUE8isvob/z15y
	hfPOZnR+z1dgiXNWMqYmtKrg==
X-Google-Smtp-Source: AGHT+IHs2V78OVdwLGzToMUKP5CWdt1VwzDnIY/3AMtzu1X8L62mGCF0iWUvgxxx5GYUmOxYhoENkJutQHul2gt0IlM=
X-Received: by 2002:a17:903:32d1:b0:224:13a2:ab9a with SMTP id
 d9443c01a7336-22db3c15e86mr17965205ad.7.1745512745092; Thu, 24 Apr 2025
 09:39:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
In-Reply-To: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Apr 2025 18:38:52 +0200
X-Gm-Features: ATxdqUFV7nNES7Xs7hgJcvef5UCDv0JU-UD8dBJaT9y-LWpj3w2lxcYcitC2k4I
Message-ID: <CANiq72=VbcYroRz1EcbzHqFHwaHLewK+DvK756ropM16pDdMuw@mail.gmail.com>
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 5:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> +    if res < 0 {
> +        Err(Error::from_errno(res as i32))
> +    } else {
> +        #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> +        assert!(res <=3D len);
> +        Ok(res as usize)
> +    }

What about:

    if res < 0 {
        return Err(...);
    }

    overflow_assert!(res <=3D len);
    Ok(res as usize)

That follows a bit better what is usually done on the C side, in using
early returns (especially for error paths) and in avoiding local
`#ifdef`s.

Of course, we can leave this `overflow_assert!` to a different patch
later on with this code as an example use case, or a good first issue
etc. It also allows to document it etc. Happy to send it or create the
issue.

(I wrote that instead of `assert_overflow!` because it follows the
`{static,debug}_assert!` patterns, i.e. it changes more the "kind" of
assert rather than asserting a particular thing, like `_eq!` or
`_same_type!`).

Thanks!

Cheers,
Miguel
