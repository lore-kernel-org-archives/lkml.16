Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A2D1A26B;
	Sun, 25 May 2025 18:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748199207; cv=none; b=gidkllZ4r38Pu5d/HUly4/wc5G4ywACQas23XxRMRFEMcWeCVYFKAY6UU/5W/jlPkMVTaFbSilIk9SuI11T258lVxfur5Nj02rRv2yLwA+fBp28QggcW7FvKJG6E/8FDOLWrFP94O8rPZMo6Non9HGB483XcJttN2DgBYAgmATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748199207; c=relaxed/simple;
	bh=2gPgmfjskzJdIskNfaVvHXNPinXXcQfyBjjYX0jx1N4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myLnznvS0VXfmcDvU4Y/lAEIKrL/5dsu/v6C4fSarhcYRdcOWq1FQBDORPYIAmsRSTr7vNKZG5Wbgq6ZhrQCATbAswLzvPH1zFsO1y8MZg/cSbyLQvW40ioTQku/FF5mNCBz2eHz4EhReIIWBmmJhoLCTTkUwbRLsB0vUT46bto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePOTn3Fe; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePOTn3Fe"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-30e7ee5fe74so247351a91.3;
        Sun, 25 May 2025 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748199205; x=1748804005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gPgmfjskzJdIskNfaVvHXNPinXXcQfyBjjYX0jx1N4=;
        b=ePOTn3FetL5XGi8XBzgE1tsxW6RVvvvcWcxwPfaM/V0WpRk2rSKlpSSv7MKvOGjAn2
         tlTgmB82yvkT2QDgmS55/qBiyA4SHadi4o05jQ1aQxebxweau1BEpYyidZ0ADo0jS76z
         L5f9WqpH+L/fBzqQZcYDxeE1OBgHGAokF5DBOb1CMOJDA14Nrn/Y2yZVcrgONXjXbXoJ
         TvsQNRKTpVbIqbmHONkvh5O+FcWoH5tfAoOh6Wj09eRsRWMBQXgw/iU4yPMrQ75r2GNo
         aENho0Kf9FSsMyifgVK1vWwQZfoDs5/kYnMOcj2CDfoG3brGTB87uBdS+0TJkTcu8eo8
         7W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748199205; x=1748804005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gPgmfjskzJdIskNfaVvHXNPinXXcQfyBjjYX0jx1N4=;
        b=jKAXpHv/lWhC8LlCzYjdcByZLkZEkpCub2U8WgWk2Ry0GgPtpUJ+WnoId7azMZ4L1f
         NB2OHqsBjO+og3vbwimN78XiqWaGnLFBN3FXAfmLHvTl07pwg4yTHD03Dvo0UGH+u+IH
         68m4Xnu5Nj5HtlggX3/tsps9as4Vkdv9rabvZ1H7MMQSrhoMrzMiwtgAvfq1EQ237oWD
         1iGJnzkbW8aDyw3mZgQQdn1TmtUe1POV//aknEkyRAUPV6878BXbz9KUM++/gScfSoAJ
         NshdUhc7kgWiweYWb9OdHJrXy9ClnNIKZr5iZZ02rVT8vjlwoAwjjREdSucVq2YGeeRE
         QAfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMHvuZCq+zvGWOH9BdhJEhBQwBtW2uViP+9lEv1VW2DJRQmrPzhEZdIzyDquRZkgKXl+TM2sEB8sVQL16gwdY=@vger.kernel.org, AJvYcCXRLuZO70rAfCW8dmSCVSpjCGBtQX/reeag8WjmmBfuibPQHa8rHTrUnO7FTVL4QFyYhvltXxTCRHUn/J8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gcnG4yDpahBCdCNfptvf+WXKBh1WHnCZGyt5CwKxbzl5a59r
	bPmQ3LHPOChKwvZ1r0UxYUNxEN974W6IWZejvcq/x917SXfBqplA9BP1NlOmIWa7xzvtlzSDHpc
	E06txEoqpt/99KbYmKPEHunC8BBIl9js=
X-Gm-Gg: ASbGncvoHBNOUUycbF96wRDWEMsSUCtI9WdBjqBXzp35BXqsiUVI8FSZodArurxPXng
	agzb+Ig+tCO8hMvbD0hR8eFbeTuWjAQJPy07g/XKbNGsy5hGahIrydTGQFJc8GZpK3px/wGzVya
	gUfe0S9euCQJXpwYu0vzFgjkGliMzFPRam
X-Google-Smtp-Source: AGHT+IHPbjHmkktQpunauEixOD0vBORcBMu0TaaJXSJmqky/ipOJRAkvadeOFXObU2fHSWRrDSr97XlaPRm/aSNgZvo=
X-Received: by 2002:a17:90b:4c0e:b0:301:ba2b:3bc6 with SMTP id
 98e67ed59e1d1-31111563086mr3421365a91.7.1748199204941; Sun, 25 May 2025
 11:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525173450.853413-1-lossin@kernel.org> <DA5FBED7E1NX.W675V3MKQSMD@kernel.org>
 <CANiq72m_L3YBX-_1yKdknyn1VU9h2fDcTROzTghzA3grz8aT0g@mail.gmail.com>
In-Reply-To: <CANiq72m_L3YBX-_1yKdknyn1VU9h2fDcTROzTghzA3grz8aT0g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 25 May 2025 20:53:12 +0200
X-Gm-Features: AX0GCFv6bdO23CSjXotARr8wUp8FdPrEk93lrYYa6YDBXM5tMoKbVMxGcayxe7E
Message-ID: <CANiq72=5Qh-9Dp4-+PyNhTWCmknSzLzU1mSC5wFprZ_rbj6Y7Q@mail.gmail.com>
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

On Sun, May 25, 2025 at 8:51=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> "since it is in a macro <rule that> has no current users"?

i.e. the macro has uses, but not the `tracked_by` rule in particular, right=
?

Cheers,
Miguel
