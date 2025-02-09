Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94BC1684AC;
	Sun,  9 Feb 2025 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739121711; cv=none; b=SclyY5mdH+WQc5tezqSgS6hFaOyOWNjWNoDkpssbFs7qHSkB3M6GIZivy8xg9+oyzPzNcarbET1+PYNMptBHNYIeP6ybwbNHj4VQEfnqkTs/3hrLe4v3yV/02GJixL6ARnwV/kAar1ueH81O55GDA32vda6SzRNRFE4Rtnsdmho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739121711; c=relaxed/simple;
	bh=IA/dnIHcn3b6eGSzI2/CTp4TdE2Sy5vSODDaNNUYlBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bf/PA/pfbPfsT/9ScrRsXQqDGQI3W7jJVaeuNlKhLbHeQOZrBG+EBVLFzRswOVlcOTTrQvmBycBejs5jWJ5kOQFk/qQVuJtKGVvVypEk/Q8VCKlwG85NwkKlDmmSfLEKOJ8y1OGFX0nzQAJoz1lqhM1UdfYTIHr54sItlc5bqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdN1nUsB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdN1nUsB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f5ccd9742so3741055ad.1;
        Sun, 09 Feb 2025 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739121709; x=1739726509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IA/dnIHcn3b6eGSzI2/CTp4TdE2Sy5vSODDaNNUYlBU=;
        b=jdN1nUsBRKJQ7dOYgqioGfXzKxoxzEJPm+xZuucSnhrnAm8FVp4WTYXZtVD6ohYHdI
         sYV6XCovKrqizrjMI9dAQMomeg0FJzjIKrrINbCeupLsEyza+u+9MrrzbCvyZtunNtHd
         4tYii9xYLCV9trSgxC9/sekJV7mhdkb5EDueGQHlnatw21CMPtO8zOv3rB239FamIGOk
         QOI+se8sMg009WuKHwOp3aIQFBSIQBy+/Oe6p4Q48d2+yWauTogk5okm1wRi/PQUSAbq
         Bwp2bN/Uhwd14rE46hKh7cmKaZwY+k6lT4ZoiP/PGkCjVPEAXDrj9U7D//Glvh88jnJd
         XeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739121709; x=1739726509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IA/dnIHcn3b6eGSzI2/CTp4TdE2Sy5vSODDaNNUYlBU=;
        b=GAv9X+1SKmi9GfwShVt7JSwuLPyhQ13CrTXAPXJmWrY8iSjdNh1I5Oxg/vVog0ODj8
         R5wZgDROou+Gb2kaWCBAjjpaU+QnFnnRNYwRbbeLbc1lNFTctSmsW0SvVF5X4kLfIDB1
         P2ErwBN4ExuLunwSdLr/gMBzjWk5gRL2XiyGv7MqEsKmhD6ey99XpMQi8In9e40sdh0X
         02867+hQfdLfeCRoWS4Su0tE0AaA+kpZGvYTId+acL2kyk7hXmfI5uA2HJXp8SolZDzt
         JzWovgxRHNd1/6pT93QBufdcoKhuaQQZDrqhXg2m98QiSaxGTXt7+kMdSJzIcKNof2mq
         SKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD2byYvmkeSxgPTgNz8CyGIrUXTDZVRQwPVmHmOFCkJP0iEeR2vrMKLZQY2IUUVp0qAVR0OkHSwbNxMjk=@vger.kernel.org, AJvYcCW8nYhR2kpi/O1Kne9TD/BBRKfMfU/EKQPJrj+W/P+3asJR1dpPCa92/w9TTx2yVdSUXQMJyg5yDGgjMpqE2nQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBp0qWwp771O4OokjKv0/QuVkwi3ksd4IDyzz57SVMwUKnXtZF
	a6+XyLhdlJFG0qKntgMpF0lxJOZxrDbPMas7ojxsoSZdTX0x47EuoarY4B7OQ+MS6Ud1G+bcCTm
	0HtuY61D6RRCF5xi4JwyIVdOs/4g=
X-Gm-Gg: ASbGncvoxyAMoiCNqPZmOrKCryyaonTqpvdm/pWd3jtTZCES6toNaMR5LQkerfEke/F
	mNFZWr4OfPRkNSxpmRnkRvG1LdbGgjdNHfPmYkcfrleGumXGqYacEMLwEkhxMWD1rGU7JkRfq
X-Google-Smtp-Source: AGHT+IEE2k9G48valsmFJmhev5biFYD4XTshkK0mL7FJhaD3BvZf7/ikD3IRE78o3FY5K1npiihFf1w7cueGlw6+zbI=
X-Received: by 2002:a17:902:b110:b0:21f:207:bd88 with SMTP id
 d9443c01a7336-21f4e6cfeeamr64152885ad.3.1739121708976; Sun, 09 Feb 2025
 09:21:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com>
 <CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC2pmBESsQew+w@mail.gmail.com>
 <CAJ-ks9nMjPnyY_J1xH93MEepcekYWQ=Ve+Kq_TaM=MvA4B0Phw@mail.gmail.com>
 <CANiq72n2WTAp28PeNVw1hOsxw5Bo1HMxtpTb7N-f7z_aGMppBg@mail.gmail.com>
 <CAJ-ks9k1+n7GS8mMYg1BzrBwsEJK3P9xPnj6xGO7Prx0qWSs2w@mail.gmail.com>
 <CANiq72=sCeT0xwmszLZ-sOyH5YdOvvbzSgMsz5SgzF_wRJTbxA@mail.gmail.com> <CAJ-ks9kBuw=sEFWDZPMKiPD_hU=NPtseXBLyPeSrR6eEtJE4bQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9kBuw=sEFWDZPMKiPD_hU=NPtseXBLyPeSrR6eEtJE4bQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 9 Feb 2025 18:21:36 +0100
X-Gm-Features: AWEUYZkSD7EeD8IQT4OJePMwE90A_TiQ8Qb32DQZZwawRGv4TnYoU-kDAikw1So
Message-ID: <CANiq72n+w9exRE=HHDsiOtf_O-nB1LOxiWnfoVoinmaWgGFQbg@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: add missing macros ->
 core dep
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Fiona Behrens <me@kloenk.dev>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chayim Refael Friedman <chayimfr@gmail.com>, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2025 at 6:09=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> The detailed reason why splitting host and target crates requires
> refactoring is that we currently we use `display_name` as a crate's
> unique identifier (i.e. both as a way of naming it as another crate's
> dependency, and as its name in the dependent crate). If we wanted to
> have separate target and host `core` crates we'd need a slightly more
> sophisticated way of describing dependencies. I'll work on this in a
> separate series.

Yeah, that is why I was wondering if it would be worth it or not, and
why I asked Lukas et al. (who leads rust-analyzer) if rust-analyzer is
OK with that to begin with (or what is the expected way to do this),
i.e. it may be that rust-analyzer does not "like" several crates with
the same `display_name`.

In any case, I would like to keep the complexity of the script low if
possible unless it really makes rust-analyzer understand the code
better etc.

Thanks!

Cheers,
Miguel
