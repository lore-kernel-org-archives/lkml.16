Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FCE17BD3;
	Sat, 21 Jun 2025 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522551; cv=none; b=DR2t3FEU/tVItq8rJ6Ap0WL3Ge0ktt0eAE+AkZntWqW/sTYuC2gqUTb0z3NPUT95Jp8wKTu1PhHEjVxAwW9xKo+NnncI2q813Wx9FlE4zQrH1OvJ+zJalWSo4MdveoggxhmzJVNXB5hZT6gq5t7p+zlBEzUhiLew/pwDDY9DJwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522551; c=relaxed/simple;
	bh=n357qJFQBqLi+JsoIcjMnt0bY0ZFXO5WwFENlJWZb1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cl9YHuMSMtxXEO9MaDB8Dd5W5RCqLizR3nZZNsi9slK+k1eYF3k/yTcg3VG5ItF5kPu2kfXRWCjVxua0MmClpn0xmySpU9EFF7gefE0XwNTxDAz0QoVE/6G4/1IAqGG1+DL/kAcyOgN/H7gmj+qjAF22bOY124q3kbRDEcCNqmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a19wLU22; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a19wLU22"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313bcf6e565so423922a91.0;
        Sat, 21 Jun 2025 09:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750522549; x=1751127349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTphWV5KXEfki4j6Qlyh+v0dvGQtMnU3uiVUzb7r5TQ=;
        b=a19wLU22pMZf2iQCoohsr1+qFiz4Qk7/zcCfdoj27uUvJYhJuhCQV9uoCYv2/MCQtY
         8OKuNyBokohMg6KDe8+HGkFVQ1+bucR4c5hLneYCDAeRhkEgl6V/z5Xb9WqiXw2jHqDh
         zE/xnVccdzN/0tqjfbUfZHeuOILZqk5udURDP6z6phRL4jcMSx9QbXoQnx37Sd+wwaT4
         DxM/vyFHip4Oc4cCJ9RFf0yxhTPSujBk4rtpgGaJOCboqehjyZUjbuzcYSj5zh4BCZy4
         LAZW9PuA43QjZUr+FPUm2LSSgMEQVYN1CbUFY71UT2dTbMTxhYXdEWx/KN7rsID+saAC
         bR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522549; x=1751127349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTphWV5KXEfki4j6Qlyh+v0dvGQtMnU3uiVUzb7r5TQ=;
        b=dhHsB7UAUIoYF3OXNe6xHEG5T7B+nDdmAhXnmSXIezEIT8fNCR0jtdMJXRkA/YvBuN
         5Chirsx4XcbXooDi0+5hxk1SiKGhHshz2qOCFJr6bld1LGRPf0B/HBT7+zAbYHAY1pRk
         QFcf/L3ZE42c2KKHIC4y0MxE223HI9Pio+G8fBYwy/S57Po1ZopBr5QmzbtdlSxq1Chb
         H3qXHvW/X5EMFvA9JSFvk9kwv43FTOBK9C7YyXoxRCheT15rVgcsxd68Lk0BnwbB+s5Q
         kAckug38hJA7NXT0ZBkgh6mQr5+rFKRdoiH2wgT6R8/TARm8/WDp8PK39M6tes+65T/Y
         P+jw==
X-Forwarded-Encrypted: i=1; AJvYcCW6WMSQKJI73rKtceFs2XUt/svDeveVI4IfWulvq5WxqOSwjXrja6jTof1K+swdDEPfaFiXDG6aok+Qc61gNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTWCGR/hfbAKmQLU8gZjFx9DEpNF0TsoHZZnKb4TnEPzPZpfUB
	hRTsUzDSEcGhE783vhWTL9ezjbV6xG3sCqi3Vq05f5Y9Uc/USPHsjJCInhk6SUQibQLPMnObH6i
	+vDCeLVTNzxYQAwed1VhCbOsjJjrAGZw=
X-Gm-Gg: ASbGnctYiadhw2K7CWmFpr50TsGcMb22JRPVpGFZ/Lg5fVuoV+OjkI4WncQkckeI8GW
	exzsYuzn0K7yX6R85fpQGSfz08668OyYO4S7F65rhXqgabIsbXhZoTYbT/9O+yX1Yuh32rRVFJ6
	SiHGKuoKt4IgzsEolK73v4hBwqrNw6I3uE8Idt7Zr2SZE=
X-Google-Smtp-Source: AGHT+IEDloU8q5oGNsKYZ8D7kAMCez97xUQY1+c3Vr0VqxbolK7l+Hrx9uqQSoOhzSUPG7SKRu6pJ7EfbgLRigTe3IU=
X-Received: by 2002:a17:90b:5603:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-3159d63225bmr4471975a91.1.1750522549541; Sat, 21 Jun 2025
 09:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621152142.25167-1-work@onurozkan.dev> <20250621152142.25167-3-work@onurozkan.dev>
In-Reply-To: <20250621152142.25167-3-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 21 Jun 2025 18:15:36 +0200
X-Gm-Features: Ac12FXzulo0t4CrkhybO-x92FQwOFFZvP7gwbGxQjSlAko2tomskIgyhfZR67RE
Message-ID: <CANiq72=H9vH=eeWHeP-xnGVcu8Ds_p8UriFiPAkefdiKg7doRA@mail.gmail.com>
Subject: Re: [PATCH 3/3 v4] add KUnit coverage on Rust `ww_mutex` implementation
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com, 
	felipe_life@live.com, daniel@sedlak.dev, bjorn3_gh@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 5:22=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> +        let guard =3D mutex.lock(None).unwrap();

Like in examples in docs, please try to avoid panicking if possible.
`assert*!s` are fine, though -- they are mapped especially and do not
panic.

KUnit tests now support `-> Result` too, so you can use that too,
which is also handy to write code more kernel like, e.g. to replace
things that the test is not really concerned about but that should
generally not fail like the memory allocation `unwrap()` that you have
below.

Thanks!

Cheers,
Miguel
