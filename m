Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F7920E03C;
	Thu,  1 May 2025 09:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746091478; cv=none; b=I7UIsUYh7yi6Hhre9WkFx6kamE9VuhJ4i5cPuEQ43lDHdsrW+HVCsFLFxtnXuCyZbvEbPg57oIVnZW0j9gEvnq39iDC8FBitp7282r5DlOacGjNIn1gEKO0IQGLj7zRmRA1guukCK4eQmrcONkZq5kKnEa6kf8jBduxHQwuaz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746091478; c=relaxed/simple;
	bh=Rft9qxUjGEZBCn4fL+LNYKU7HZTue+kbIiXWNOABubc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jej1832sY9YnUAoCD9BcjCykjMpSd+ue4eFEfPAzxHRR19d8temy+bb+apOkqnqV6D2JppnoP54olAyvv3gTjIhGisXs15Xw7frcRMiMR3d+WVGYhEpE+5kv/gCeExwHPQn4qbFn8LHfvhsB28KBkLooy8OU6hEAMSHq7NcDaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuiVWPaf; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuiVWPaf"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so95418a91.1;
        Thu, 01 May 2025 02:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746091477; x=1746696277; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rft9qxUjGEZBCn4fL+LNYKU7HZTue+kbIiXWNOABubc=;
        b=MuiVWPafn6+B7vWJd/Lo36YF1CWXpWCDDCNljA+AStm9QEQr2g7c/69H4/AcxuIulx
         J8vK7oL6Q7ZOSGtx8N8LL8mU3ySnMjNg+jXa0gV1KylRJWQOnvePGp7+lDu6Ra7+lb9L
         bCH5UyrcVKBv5fjKIwuw55V48eTmibHu3joUxMJhdKvWYYMYYV5MPS8/if4Wp+sKtL0W
         /cp+DvaMu44Khxt5fqDPJsAmhZPTYDECTnYuGoJ8lsSUNJwugbqPUSqhU5zkwl6GPw4H
         vwKVNGP6SfOaJAUl57DS9M/ydgNsyN2xIRZL4wkcgXAqHyWz29JWPRi4ar35ybp3jP84
         ZlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746091477; x=1746696277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rft9qxUjGEZBCn4fL+LNYKU7HZTue+kbIiXWNOABubc=;
        b=cs6Hh9FAYbzneopgy47KGduRYvMy8vv2vUfdJLrYF/i2p2bGPWesk/U4fVCKlNjRz7
         9Ulpmt9pcIPbLEcBYFT1G71h57/cGyg2Q9xBl2DYBBKi7FYCryaR4RzeTmXN0BVzhO3p
         eeYAy+IuW8Z29Nef0KdX0afeRkE61wCsRIIZZKm25valAprAA6QWVuvkNpJDjWG3H77e
         F4+7R4rNUlgdf6swZJAR0owCkd2elP7J4lGIMeA2h7r45p+OOnJADgELAK00u36EB4Ur
         5qIvbRVXFzaQyPsU3AyXs7p/0w70gZQtDmAEWi2af7/CyqC2kRSXNDXKxlMSr2VE5i3G
         sCNg==
X-Forwarded-Encrypted: i=1; AJvYcCUWs3nJ8x71h+43Js4obs8zxJPDVM34BrpB6yLZWTRd4IGtKyBOtPNbNnXC0ZCvCMDQR0MU7O0LLTzr+DA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz5b8lysKXRtXDtUsb1KmIiGX3aT1AJStlCjjxlltX16ETpbpA
	3mdFQ6H4Fl1Z9XprkVTj349KF+0XHu3jsuFZay8XPDNNQoi6Tj/98xFMA5Qf/XQMwVw/1srjKUk
	5qC0o0WGUoTmx6s0xuJruCsQafg8=
X-Gm-Gg: ASbGncvoFpUlPwTklNHa64tyQa4DDOYBOkdhusVuxj744tHfjh+TloEyocLU20eNfI+
	/g0O3rQCN80nUv053qYe2/BzvHcMZIhQF5HT8zH+YE2JYcTYRLxcoUc3SPZ4+EsYqjWRYYg0orq
	WgoiI4XZNy4kQj6I5Icwx2/w==
X-Google-Smtp-Source: AGHT+IF9F6CeeeM197f/LyAyLiqbSNA7NLe3H/55Mms8xhtYqBd0hThbJziNS2hpWqOiIlTOlUhPV7Zrl6RYf5ORV4Q=
X-Received: by 2002:a17:90b:1644:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30a348d59f6mr3240858a91.0.1746091476627; Thu, 01 May 2025
 02:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501015818.226376-1-fujita.tomonori@gmail.com> <20250501.114534.1953073574103349822.fujita.tomonori@gmail.com>
In-Reply-To: <20250501.114534.1953073574103349822.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 11:24:24 +0200
X-Gm-Features: ATxdqUFcsNxCoX0uT5HR_VGsTscoS2_3xEzFxWuT20f7w5BFt4oPvLX23A1s0jc
Message-ID: <CANiq72kiTwpcH6S0XaTEBnLxqyJ6EDVLoZPi9X+MWkanK5wq=w@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	a.hindborg@samsung.com, boqun.feng@gmail.com, frederic@kernel.org, 
	lyude@redhat.com, tglx@linutronix.de, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com, 
	arnd@arndb.de, linux@armlinux.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 4:45=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Oops, they should call ktime_to_us() and ktime_to_ms() respectively.
>
> I'll send v2 later.

What about adding a couple examples to their docs so that they are
also tested and this would be caught?

(In another patch, possibly in another series or not. We could also
open a good first issue)

Thanks!

Cheers,
Miguel
