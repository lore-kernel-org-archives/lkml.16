Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A534F190692;
	Thu,  5 Jun 2025 05:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749100768; cv=none; b=m9N09JughBsS/ZqYDZOJOGKqwx78n6sR9CqiHtQ4PQwi5ptbBEt8JvJo7ZwMQBfrdZbpwA6mS1MB3HDYcqASftBJFr+s5RihyQi1CKLCmMMsMYT6zsdq57uZhkgJs9Po1qpTLCHDWpnZYCOaHzzWq4EdwP2cYoTX3hLY7hezpeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749100768; c=relaxed/simple;
	bh=rWj0e4hXHsJSd0NvqjK3rfd8q6tQ/dA/E69CzmOYr9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mo3ET5cIFkldvE2cGeSES+ilsKBJwy6m+7krD6rl4B4v+rRoqMIsUsQTce5nuAptxdQj+gUiiblLYP8rBBxHpDnQII7NRMqV3iDDz1S8X33oJ32B0z48bqbDAQgAnV2tFVygOw7bNJAbc9e6AIFNbLUjrrFyvF858RlIgoHw2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biUxbbne; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biUxbbne"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-312efc384fcso79544a91.3;
        Wed, 04 Jun 2025 22:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749100766; x=1749705566; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWj0e4hXHsJSd0NvqjK3rfd8q6tQ/dA/E69CzmOYr9c=;
        b=biUxbbnes6BFxA6ldkG3cN3h1efoa6p6arfBL/iebfzwyYpAnW0EV/yilM+/kU5re4
         44z5CZoHd00oiDRQ94/JA6stgYggRmMSeCzBujjWUUForq0pRZxJGJtbH9yvn88IF6Rq
         dWbN6krBVQpj8gCeuhDQuxUhKaPzo9TioVbog6DjTivmMIzawOxjj4V7XzWv0gmlgbU4
         aHItVF367WMilRSFehqNEBemoRp+u+QZUvyM87Ae/KVMKfr5ifW5FTmobPdEEL+q0nJ5
         YyOhMUqw61st29YZrCvBp8Kk+4hh1bJRWidMDVkBubv7U8wwsdaszWry0O66SpDOYYOv
         zxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749100766; x=1749705566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWj0e4hXHsJSd0NvqjK3rfd8q6tQ/dA/E69CzmOYr9c=;
        b=dExLdktH53GqI/DjufMxRLn7WdKqAyEMNPtxs24hREfvyy9J4qcpKLp4Z/VAuYKqJJ
         /KKOt8zw2LrPRXYdraN6C4xDm6DzujjA93QAuyyVTy2CqXlTipRVm34QQDR5peH3KpbG
         hGp4bcakVKj4c7mapa6jc8Dvz+olPbQMhM+OCmfed6zskev/J1+wkZmETuQLRHNaBl2J
         4br52LHU4sz5VWCZVA+y7KX+Qsy/WWs0R0TfCx0y8R9c1lbSud7zp3q0aCE1uG6ImD+C
         jCO61xlI3m1Y/TP0G3pDrUtVnxf4HfpenubyUDlVDY33pwLLrUAg/dkrfMS7BqglapOY
         cwDA==
X-Forwarded-Encrypted: i=1; AJvYcCVg5Fcj+SLoccDt/drnd4XU+q3cEKTlTtAv2q9F0zdFxB0q6oxPk9BUtLHvi037rwsnjnCfp5tzhfLmJlw=@vger.kernel.org, AJvYcCWKaOH45t5lt+onQe/Z99ppHLmBUicdXc6/OpDzxAbPpzR8UBGfIFazsgSAYi0z8o/U7WfGrgUK4XN9BNftHqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4wYCOSiD5jtIsuZHqbHxfKUtrR/FexeDyYiY5kqak+0AyQNg
	+PPEHvWhHS+rsAJStk3GmgSf3rvvFOrLF8TWrpri0WE5ck2hSEgd0CRDp9VOmcZSROxCCuc1B6x
	FGL9kmXBlBuql0QAShYaR4ZvBPC0HgoY=
X-Gm-Gg: ASbGncu2Gu920soVAcLXRTLfTlqnGVfCOalCVINUmMFp0gLjYjeLB6+sRu2wsPy0sT8
	8HrPwgL+9zKy/RjTEaMa0PgVKO2a/cl2wJAr1sApqKA/xpHWtXJPwfurmI9mUh+0CdSfk7hAAuu
	+OJDXcIsLbuiO8tjjLhoU3LduAEnsHYnMN
X-Google-Smtp-Source: AGHT+IEMYgNGyMEb0Cnvb4VFOz+JWQnYIqFqMgKdfavgqJP/8dhXF8qju2PLnB3UTSKA9P4ZoeM08h5gIP4UjkcKMXI=
X-Received: by 2002:a17:90b:4f8d:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-3130cd6d852mr3084850a91.6.1749100765642; Wed, 04 Jun 2025
 22:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605025400.244965-1-ojeda@kernel.org> <CAHk-=wik7gvxt-CEak_4HsGziRwo6-7q9LGeW37Pj9182dJ=ow@mail.gmail.com>
In-Reply-To: <CAHk-=wik7gvxt-CEak_4HsGziRwo6-7q9LGeW37Pj9182dJ=ow@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 07:19:13 +0200
X-Gm-Features: AX0GCFsv2Eke0_r9RB3lVoa6WoLQfqZCh6ECqZeLRRd1MzFohqUpTdj3YhjkNtk
Message-ID: <CANiq72nNp3UNRybVt8yzUuBR+gBxk0ooe=-iBTdokP2LC8XzKw@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.16
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 6:18=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But in the name of safety, and because I didn't understand that
> change, I modified my merge to do what you did.

Thanks -- yeah, it is most likely because you are doing an
`allmodconfig` but that code (for the time being) needs `DRM=3Dy`. Same
thing happened to Stephen (and when I did my pure `allmodconfig`
builds to check).

Cheers,
Miguel
