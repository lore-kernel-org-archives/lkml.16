Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B25686329;
	Fri,  4 Jul 2025 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614748; cv=none; b=Vm16DnJK3F88bS9iOMrGq7uWuHkOA8qh/sTCMqNaaYe4adcdklZGqF+UjsIK/N3k/nH1kl0abEEcAAQRJHToGrjlLAt1pn4IuugLATrnoHj9jlM8j9Orrxc3tMJ+lNR1dFISB0H32DdBSLLvGzL/lKitPY+HK9+KWr7QJrREk+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614748; c=relaxed/simple;
	bh=rjNdr3P82CPN8ne5290kjZpL5EbhmgLvDuFTgnRaVys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJv1WwbFQpkHQ0xGsyAnp2d2akLExmBG2lsO0S8K1zyIbgycruwXUea1HdbouSrWx+rY6vvDMhzTkSrJU1d1ogiLZUHzz2/HG272oNXZvA+dsuBs/oKitwuAuS3KZ3LvmFnJ+6AL6ZcwQsO0HgBOSmQOsjRS/+aM9fZHYoQ+wco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtcZW6Sx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtcZW6Sx"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234a45e69c8so982905ad.2;
        Fri, 04 Jul 2025 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751614747; x=1752219547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjNdr3P82CPN8ne5290kjZpL5EbhmgLvDuFTgnRaVys=;
        b=PtcZW6SxljYO0Hhvh2tMjdMMSsI7px0qUImc1naRgeFtDFJygt+5Y4c8DKR9TsJRBE
         0qOwNSRRq0qqUAwY9ThMYZVwCR4HxXUGoETZWWWvMpsZnOr12sfcjlVnqzjl7tstiFhE
         tt/y4mXkSV4422MpoQrpLdaO1s9iv190FswGYdJyT/3As/EI1srAcibgXrk99LBfW+sl
         qaEPcvhyk1yfYBaumeYKrGQAd9WYWSICAoP7r7OVTRevKGxi4Ooa/T3FIYw3RDqXNdep
         M27JOmOrFs/OXp08I8+rMmoYhR1MFszSWAGpvt/yMFVziYnIEHAlZ9n1/2/wSjA2uAHk
         YnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751614747; x=1752219547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjNdr3P82CPN8ne5290kjZpL5EbhmgLvDuFTgnRaVys=;
        b=veXJdxvmsfZU2y1LIxr4H5WkLTuwIhoqaZ015trXq1ovLNnIEpW6PZi5YZ9QVawXM2
         MmL2+n9SEgiWiRkhqDNRro+oTUt0lyH/ZVb48q7GhS9VFllBY1+DARCH+sQYYCRERuKa
         AiwWzrUS93zQkiWFiOlPMYvX/IB6iO70xzj24rdtAbGNY+c1hIUygGRdNGRCCAF6iWyG
         xZhysGJt0V9rKzNO9pc12usD+5DfmcBBK6HnBYsSvfIstusqk8H+pmKQ0i1t8D8WIGcS
         UyygPfE8DkmAPG/jPUdAktQ2iq16w4p0HOgCxKQpFCybC5MYNw306rg6DR3gJk+jU4XS
         P3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVhJtgPE0lflsQL48smoQuNaLPhnT0xEjaTMK8r6h1bWrw466KOX1V2cWasCWUW9YE933xLNtsSJ8jNYlCRxEs=@vger.kernel.org, AJvYcCWonJKSKzCsEf9eSqXvYpTD+EFeo0NMcukB/Pku6kZVhJY2XSG7rU+goNXHPG1fnji9/G20SR26Vhg1yvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrxykaJUpTF6kNtUDce+sNDW4MS9htJnF01GiqvKCwZFTqeL4u
	nKyHBNlJhnhJYGFzZvmpZBndGP21Yq/B4YwrJClCP8ZqetZfLaMzAjkA5cMm5+eRRXx6aQ6kWBe
	O/9Hd1VxKtSdCUZ8ekpJDgRekvbdNv3M=
X-Gm-Gg: ASbGnctpWvK32EQDI3ilNiDhUr7+AUBXtsKE2dcQRc71cA7qyXjVuWDK08WAfBnTsoY
	w8Hk6Cp8xK7t1rAdDMk/PBi+IWD05HdPeU3SBlNpYvmaTudASx4IBz28xu5th6BOywzM5rGP5cw
	xMkMNU2NkZgDU+RJvZSBWm0mPOQ8fIGZ/criNUzYgugFs=
X-Google-Smtp-Source: AGHT+IEYtdvgCskwIxk7k9/Nc9r2ocf2FKCL5tXK0bkZCo0iC/FUdHPb1rFwJij/q4aqpHqQAc1JhdfBiWi112ayytw=
X-Received: by 2002:a17:90b:2d50:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-31aac31a67cmr993171a91.0.1751614746707; Fri, 04 Jul 2025
 00:39:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701001809.496389-1-fujita.tomonori@gmail.com>
 <874ivvvvjw.fsf@kernel.org> <CANiq72ntFkvN983N3x=AKMd6fW2yXb8d0LB1LT3c20oYmPCiGg@mail.gmail.com>
 <RnAWsCMnf4ZwlMnwtZY9XC95vcJ6S0QUiRGwx_H7juiXpbSze8NUfbrPDSkLdd_CZxXuxs2jykc_ZDes95SV5A==@protonmail.internalid>
 <20250704.093618.1554080777023438310.fujita.tomonori@gmail.com> <87bjq0tnxr.fsf@kernel.org>
In-Reply-To: <87bjq0tnxr.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Jul 2025 09:38:54 +0200
X-Gm-Features: Ac12FXwkZ-NjfnulTXkjFGiBhXgxvNOPsIxWxUVDaG8eiZNusZKljER-bM3-CaI
Message-ID: <CANiq72m2hTwLzMd7HtSMSfRgCG=LAH=wpzo0AG2vkg7UQi6cOA@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Add examples with doctest for Delta
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, alex.gaynor@gmail.com, ojeda@kernel.org, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:28=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> I don't know what the very large constants are

They come from `i64::MAX / 1000`.

> Maybe if the constants had a name, or were expressed relative to another =
constant?

Yes, we should do that.

Cheers,
Miguel
