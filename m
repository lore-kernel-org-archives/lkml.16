Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520F31C84B9;
	Sat, 12 Apr 2025 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744459202; cv=none; b=LogGluwwN3fTX+V413rDqLS1A4sBMaawPR06Qlv/lVNusWPqgrCzIEF+veoL+4cDzpPSCFwm/BP8aB4mD8jWy26r1cOh74cpnt8FnxNz68trf4tOSPOZCriHNw6ocKn0qF68MaQtM9Zak24GJ4XZBmsi+JAFLt7yE04lJRwyg7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744459202; c=relaxed/simple;
	bh=pMuXdAkU6Kp3lKGe6c2gEDSZVlu1N0bgRawGH3cghYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCqTX6uJ55byVN10mQpOAhfVUMZKauxqGAEF8YlXBU/5ezBw8ZoEA2Uq3da1OWnVZGvoitI6lnmjAzmOnEAtj9JCNPSBz508PeSM91+R7rBToCbNl1FalmyPWWSq4cVWCVcA8JwP83y5yqM+LAg+/213tAYd9trkyzOykVxN2Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWxbGhzY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWxbGhzY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7390294782bso467067b3a.0;
        Sat, 12 Apr 2025 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744459200; x=1745064000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMuXdAkU6Kp3lKGe6c2gEDSZVlu1N0bgRawGH3cghYQ=;
        b=lWxbGhzYh8HlGOk/koauS7gXHm42OFyGxz4HDTy0h4+kJi68KQEPs6Sq5kXXkuFilb
         hpCFoW1jmJ6np2sc0fnDCqiif4EPyYQm3kCXwyUrWPFyPNQ3ljHNnThx/9lNPG5WtNny
         sTGJZAdg9lvg8YIjGJeFTAhGiCJa+zMbszvGtQMQND79t1bYtD3IcvTltzH9tvP9EJx/
         QXO24RehdEm+4+dKc3SCb/N01UOcfvT4vIBd4P12bSyevp6IVMG/D178F95A1u6Tcs+1
         lRhYhHSwwohcF2Diumty8nLUo8I/DGzVkyK2C4GKi7lJDyOSF7oleHEY5M5vhEEyydGD
         ET9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744459200; x=1745064000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMuXdAkU6Kp3lKGe6c2gEDSZVlu1N0bgRawGH3cghYQ=;
        b=xIZ434oWWivx+jwyHOLMQln+Iv2sMxu5sdSnfKPcwHOV+Yvu5xOX7IfLzVFCpuwUAn
         gr21/vPsA0m/J68yRpSKujS6PfDs6D1uYDdKNvZPZ7wDRnG/R/yGy8h6KNX4K7KbA6ht
         9y5iykNx4djSbSeFFvV15KHIDZJzwyra7TnCqJnxWP0w3eSIpgAXIvNTD7XpHeVIde23
         LlSw5hZigI6vmkkT2gf1UlxicYuIlEodJYQ4xPDeSi39G+2f6nlT76XMn9sjxt8XXBe2
         HKID9luZ8OqnvQ9WWBWGetnd2wz6gzwyCCoSKu6iN3qTkv173BeB0u7pYD5d0J9Hcxbf
         +KLA==
X-Forwarded-Encrypted: i=1; AJvYcCU3rqZOFfcvIk5D0A+5XNjBr/Y/fQBDBwaHEMV14BcCBGW6IE5pKH98nPWnpjVfX7HqS6cH7eYKsowGQd0XmQo=@vger.kernel.org, AJvYcCWJmqBumB1H+XF2KEeuq8TxUZb1+e6JdzOTb4mGSZ27QDH/EQETuGQvJS8+BsBk10gQavlHO/gLT7n6skI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwbH6F6cYYDr2fzypyWdS3QVA+yEbHGepHwiYy5FapV48Y9kYu
	Wtgs6kWxnnmL6aUGC5KlGHSim8WTwJsmEI5F1YKwF7tDdzVEtql7mMTwUOHw8JOeXB2UHACsdbc
	HdK59Cxx/YKV0Cl4/X/GFBt2BUOo=
X-Gm-Gg: ASbGncsIKwCYUdh3XMs8VTDdKUFA3G1Byjcu4uO4Ualsi9miqBhhGaRZ+wx+7UIHWPi
	VyqUUOlhIaEjuookZhfYIUDZHlI6RNGzgiIPpcsBKouWW0svfDdH0XcA702zfQuOCVoWFqJoAyY
	ITYs6rGNSBXSgkz5PjKOXA6Q==
X-Google-Smtp-Source: AGHT+IHZx70CQkZBtr/cfgllY1HN69gNd5XcltMc9hXoimdXsDzofuZVqU2l1IcVRiKYkWR8ex0aBAEU+nCCZB83FFQ=
X-Received: by 2002:a17:90b:4ac9:b0:305:5f2c:c580 with SMTP id
 98e67ed59e1d1-308272536dcmr2924889a91.2.1744459200365; Sat, 12 Apr 2025
 05:00:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
In-Reply-To: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Apr 2025 13:59:48 +0200
X-Gm-Features: ATxdqUFfLtsDR_KVnMsg3CwfY1QHdnTv_pgFnr8_5TZSfo39KzUqT-nyZpyckY8
Message-ID: <CANiq72=BoURMmkwqBzZ9Bzf5oXkZbUia-gZKJcNmVt7Qg8bKzg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction `FwFunc`
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 12:30=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> "propper" type for this, so use a `*const kernel::ffi::c_char` pointer
> instad.

A couple typos -- I usually suggest using e.g. `scripts/checkpatch.pl
--codespell`.

> This should probably be backported to stable, for people/distros
> using Arm 32 patches on stable.

Up to the stable team -- I will add Cc: stable when I pick it up since
it shouldn't hurt, but it does not change anything there for the
supported arches, so they may or may not want to pick it.

Thanks!

Cheers,
Miguel
