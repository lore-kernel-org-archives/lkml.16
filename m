Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7D8243362;
	Sat,  8 Feb 2025 22:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739055588; cv=none; b=d8cnGMXpXbf5EiVvXuiTfJxmkde+26gf/eWaRVYhBYWrNxLxoSg9DNB05ZsH6ys3EiQTNrFSxG5Bonp40n9RzcXLRTJuvO5iuLUhXZEs03ViKWW191Tx5kkLErikQl6dntNCOTVAnxOCBpgbc3V/g61Vja1lpUSJT54TxrpMC4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739055588; c=relaxed/simple;
	bh=aabHhy82gBFlQk/8LvIO5hE8ht59SVW+LJY0gSHUcmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qj/jIJ9Q+vn6JG3pMm9pXnx5l0D5eZlOjm9sKoqdB90DWmlhbsI4brQazIojz3DrEVbyxTIaz0bzrfFrgYYFwndGU6w5qlIpHtHjvbDQB/So9KalEn13jxyJmvNZtAsxyFGR/FtlFAgWXETkX6uUkWZ07fyCqm954/vbKDTSvF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAEY329r; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAEY329r"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30613802a6bso34501631fa.1;
        Sat, 08 Feb 2025 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739055584; x=1739660384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJs+2eRR2gBOh7G6Hp3UjP141o+AZTqQQ5yldfOP0gk=;
        b=PAEY329rpeLPbg6hsL2De6oTx+ET8eHHqOX2ETpTx122nH7Nm9nxtRfatRGMwo9yV5
         bRQX34lJoOfVtUuw4n7C17e7oBJqEFhYaE10tt1OSjQ0t7Z2AZ9hDXB7lW692k4nAuy9
         dR9F10lMKcAxJLXsF0MCl4ebKcY+W00olvIOOiC/BnxYyU2kzUhNRvbM8f1mkBYNro00
         h7Kw22lsD3R4lIH+0QlmDRZdfI2HOSK+Py3HAj469qGPOFZogD3lS/DrFCe4F/rYuDCn
         SHEe259J8QFDkVB7fUfEz9rxhc/KN7brmt/73TAmKC992gXcIq7WayparPw+C8YqnZR1
         CogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739055584; x=1739660384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJs+2eRR2gBOh7G6Hp3UjP141o+AZTqQQ5yldfOP0gk=;
        b=THzt7Az00d0lngEgUfGgVcwzWdCQYLdjrJ/3bGSV2UhySpTPHBSvySYoKDaeuINLkR
         5vUDnXL9x4g3Pw/p3byYNOfr8bPnrpj8YSA4q5uaieF6M09ZGUU4zXwkoeA8nMAXbjsA
         jzVoCvwdEkLJZ5Y1MVMu0LoFUUBzogcdk9sSoi1Bkd7Q4sYH4pDpck2RlFGN1vvbNnlP
         w4b+UmI0euxu4Mf0nDYrZXx8hMy6+ykt325K4xNXYJOkuO9vIYLlNjBc4Sy17bwapuZe
         qTFXjz7RsE6CxfRz2GqU48NCJmubKATRDwus67j5hsyiwajfqvlNwKKaOWlolcfEiGcB
         kwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6NJvUeRUW59dRi8wzAMJcaN4MZ7ifzw6cYgqspsX0KBN4gkIvaPGDAhBscIF8aFb8TdwPwDX4/VA4VH8=@vger.kernel.org, AJvYcCWzolN6hFnnq/hPpflBmPvpTHc+lMKE5pkQEdDcqksSpdgmDFNDWG/F44oiAXCJ5U5Pe8jf4bvBIbwPr/Q84r8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/f79PLXZHntS9tDcPgh1SGCiOcQl4n2go/Rz/fr8pQC26xDrU
	7Xl8Ylz0bPANVioaEYX3ENfSuMYI60A9hyngT4bKA/Ze1ofbnRt2s3/a5X9GSdnI35KKEUxqSFq
	PklRIVwemFg9Vrkxe6YSikUdiRKc=
X-Gm-Gg: ASbGncvb44J8VIEnfEfP/IhevYa3ltx/X9NeasjtqP43emK+QPMb3pQJOzEc86603oM
	xG8RuWF4OcxkHpXNMeZtCOT4O6J6pgiXoqziYJT5h1vMxqpTKiCi8DWVtzju8M4zGYU+CZhZN9o
	GCz6Xp4+wYiAruCeLIObbmdVV4repY9ck=
X-Google-Smtp-Source: AGHT+IExgDhOq/NwPfHEqr9YSz2UwtRZX8FJ80tVWDzcGIY3HztGkF1Iu40uH7zHUg0C+Q0jZ533e9oZPvIX5M3R46A=
X-Received: by 2002:a2e:bc21:0:b0:300:31db:a770 with SMTP id
 38308e7fff4ca-307e5a668dbmr24067691fa.26.1739055583531; Sat, 08 Feb 2025
 14:59:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com> <2025020847-boxcar-bovine-47e4@gregkh>
In-Reply-To: <2025020847-boxcar-bovine-47e4@gregkh>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 8 Feb 2025 17:59:06 -0500
X-Gm-Features: AWEUYZkG71y2sEaehPPhj7H3hQ1BgQh7bejxrejjmY-Q7QIdI6tHJ85pCoTChkY
Message-ID: <CAJ-ks9mSQ8G+SWs7MzsBdY_BTPs8yZhsrttakyp9d_zqhhC2PA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: macros: fix `make rusttest` build on macOS
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 3:17=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Feb 07, 2025 at 12:21:51PM -0500, Tamir Duberstein wrote:
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> > Tamir Duberstein (2):
> >       rust: macros: improve panic messages
> >       rust: macros: fix `make rusttest` build on macOS
>
> Very minor nit, patch 0/X does not need a signed-off-by, and if you find
> that you don't need any text for patch 0/X, there's no need to send a
> patch 0/X at all!
>
> Hopet this helps for future submissions.
>
> thanks,
>
> greg k-h

Thanks Greg. This was me holding b4 wrong :(
Tamir
