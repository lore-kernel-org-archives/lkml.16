Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33994202C43;
	Wed,  4 Jun 2025 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040625; cv=none; b=IwKj5eg2jG0eTHv1oIKIlrG33GOVC8gRrFEs0wJWKdfsch79ko5ETfOHgUYLqltaYsdMt0y5+zpSvLFRq5nnCE8cEparBBku2w2vI2qlH0f65oewmYkJRu58WjS8ma3eXwM3XEaYw9QRlm260tKF8tvBseFgEkAQYB4qYscNv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040625; c=relaxed/simple;
	bh=TGmacJKp81+zfiDnoff8USezbd7Awguz0mg5GPA6mJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5seHTOFYnRwW3b6KNhuv3mWiQ10set0Ns8+yFYoNF6eO+CJTYPJVWnfjUiOLNLQ6g7Wt8JhhzpbR4XU8P9PF0ZQmPdq0lxkPIxPBJ5Ija5E0UlAwjZqxgwaHjpAVLnq1P9AT9la3y8v04VECOK1O9ln4hTX68oaG4h5VEhznpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgV3DI+/; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgV3DI+/"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b1276984386so502098a12.0;
        Wed, 04 Jun 2025 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749040623; x=1749645423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGmacJKp81+zfiDnoff8USezbd7Awguz0mg5GPA6mJs=;
        b=lgV3DI+/uc1B708/Br5LAzOuXqNY7CfMI+PYe/QkGBjuix0JdWUIEtJB67wrRrizpF
         FfP6UhAdMj2wskzHh5RpDHJdHKLcYQXVx0qVfTNalBmMnYumLmQ7gUtsCrIcrzbwxeqt
         URAg/f5ML3WcgHyVkdmlswxrBDB72A2DKTIFnTCQTTlzFiZ+L6tcyByJ4+gNoIKHH6h1
         p+j8KAVcC61ZnCVuNOIePyvZuSC65uCroxVwumnFGf2kdk9v5oV9dzbObeP0H/miFwmf
         BTesKAmpP/2mhVQ61/Ua1d/+ISuJeplh3a1SZfeUzUZfTfVkV2HjghsXJHLeg819FA4o
         nzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040623; x=1749645423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGmacJKp81+zfiDnoff8USezbd7Awguz0mg5GPA6mJs=;
        b=GP+Dmo3PRkUKrlHjrkwA5/MDJFX/p9gxgzz9KOyH2UZNsfEaQaiajM11JB/Y3/l5ON
         2EmGRpQ7moVSUm0P73kiZrtFk6jqeri2Pbf/KApUgGOKZSDNN6oaG2OK78aooAQxydjo
         8Jo0+UxtqCVZYrACGKMtKnN+o7w4GV67lAvN6PfBZ3J+q1ONpRjp5XU4MoX8EVvpOjz5
         QgBYI4VxMbpxujOWzZUQSZMlNIL0S+fyGh85CCVsvj5KsD9tb0h75y8Q1hfTxQcb97Wi
         lTXsnzupICLF9p/Rouf4W14Z7hMgAHOpPp61jzFItVGrp6oLT2C1pfYFgv0h6OO8UthN
         2yfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgEbd5m4F4x/Lyi2ypCvC/Hq0vSYT3P8VwLN/OeuPgK7EbzJu8VCNOzOeE+rxZt2JvMUEEf3940A+cJy+dnm0=@vger.kernel.org, AJvYcCVMtprOXMeTIdfub+vOdNob4IrhiO6al7yOnchY3Vj77iifHcRNd7pm7TDXGmw1nd1yPEVIfsw3anCjGRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqcq7zcinWHafY+ELrA26qBIq2U+dOGTwVjYTEPe13u1q/QGLZ
	qg9l+8j43+66qNN2w22C5EVTVN8fmCnBdlo76MsFZI1uAHQtBZdfmYFCuI/D1/Q+VjwRO5XhwqL
	UivabRARK06EN9ko51TvyzPLjfxUyIUE=
X-Gm-Gg: ASbGncvCf1gvejDY8l9Vpeqyh+PUyJS09LLXj4Gyvz9tMtzfjfpVhwMysJybOVifjSL
	3pO0EGTQmmciTHe2nmmX9KRO+F24P4tFWzBOd1OwjCu3QSOLmWmZExBnDmX8ionRYYmnCYUxR2u
	xHR10EylAnQa48EylIxmpF5Wbh7P+KtBSe
X-Google-Smtp-Source: AGHT+IHHF+VR96AMO4wKfH2HPUEELwexGsqIepbUHKs7SdVl2eou39ao3VcOuVg/aXiqNHhy6dMSCpdf/4YSsTPPOr8=
X-Received: by 2002:a17:90b:2ec3:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-3130cda9d5dmr1503790a91.3.1749040623285; Wed, 04 Jun 2025
 05:37:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603205416.49281-1-dakr@kernel.org>
In-Reply-To: <20250603205416.49281-1-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 14:36:51 +0200
X-Gm-Features: AX0GCFvPlShaBPnN8nC2tMhvUVT9ssC4YUWURCehQJwrzE-EudYdYaOGvbMEbj8
Message-ID: <CANiq72nfOcOGJuktzSpNAUWwekaZ98JL7c1FhMKCjPSG80JMPA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix race condition in Devres
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 10:54=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> None of the upstream users of Devres is prone to this race, hence we do n=
ot
> necessarily have to backport this -- yet, it must be fixed.

We generally backport even soundness fixes when they do not affect
actual upstream code, so we should probably try.

On the other hand, v6.14.y may go out of support soon (a few weeks I
assume) and this does not affect LTSs.

Cheers,
Miguel
