Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A451C28E;
	Mon, 26 May 2025 16:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276814; cv=none; b=jIrWD9aaL3EyFCrrO9Pfrqw17X9CLGkhuAq/XEqLAuaZTPSwsM8WrUHexUEDdYEztFjE+/fusuks/FA5ZWKhsTOGDFDQQJC14XbBvmH8i6qGTl6gm8sNVYhXvscWB4fXF3UtDU9cxBSFRUwliEug0OsneyHAotAZmWioT3Z8y7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276814; c=relaxed/simple;
	bh=hFaWO1V0viwCaw8Ns+3kw9xrqwrKvjvEvwkIlOSKQrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zzp/DYgY434gYhOeEsjyAYcuCpAflHOn1Ug+rOSbrvcmCi9TlVIBHsde1PGpaQZYW/U1SH3k4j2GQ0qRWCLcSTmAd/pl/98ztY6Nc0/Hbj4y75Cb8aO6+iPEP4SD8UCwkr5YIiUpLWcA5NdbbFJBy/PXrjUbFgcITZ2t0EFodgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kj0bebA0; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kj0bebA0"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742a018da9cso231703b3a.1;
        Mon, 26 May 2025 09:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748276812; x=1748881612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFaWO1V0viwCaw8Ns+3kw9xrqwrKvjvEvwkIlOSKQrc=;
        b=Kj0bebA0AP+daaT3A5MiyUCQncCoDEAa40J6gW7DtheFG1L7t5g0/DAdxZsg+ura1e
         ZkySRaDB+0nLEdt9Pwfm9rk91o3UT0nZuqjXDNJg466LUj7nKwagfrt1dbJQt6rs55Tp
         Yf1sUSjgQ+BMVZWKC4Y+Woc5EVpJ/nSB9mK3SUwWF9Ohg6GWHYKUNqSxaOmuUNrR3Dpj
         yyYfVRO0XULhwVwW2EB2oYREKAUy8VjE4WPD9Zz4qQV/HflHgD6CGkut2nTvpanKphV6
         2gu14wHNw6/Hzb6xgGj3W+AsBVkRMUOehWyn424xW9TqtLXCbzdqmLnPfZ8pQEDQYlLb
         lp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748276812; x=1748881612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFaWO1V0viwCaw8Ns+3kw9xrqwrKvjvEvwkIlOSKQrc=;
        b=dfFSS6xIh54EWt3i9cYSBZSTgLCbnzdIfUl19HRg4FunmxT/iNNEHxKjvupi+E6+r8
         zyu21s+eVVwbQkISTD3hRa162qXPX2ZxNdUvB1ofOPLyjf0jOaZgi74HL3TeHbhFRr6v
         lFNDLcllIIuvxapqo9Kv+PTsdjcOym/ZofcO8VAuXLpIlAmwTl1DPqA/FaWrfiTxaojk
         hKbkFnB31kmjJcfO/hQKOF0WtlSfKBqeSutfdMzhU2QxHMhv3rh8s7Z2pv96R/qItHUp
         /bh0wCOGwkVJ9ezgK8xvM/lr7sk8lHW9+JSH6h6oZGqlosBZdXVQprsDTXwrYfB4uYQZ
         /a/w==
X-Forwarded-Encrypted: i=1; AJvYcCW2o5SkHHvoqQ2iBf5jZKBPo9O/ICTFWrfW7uLl/UJPNqz5o0em/HEUDG7/SXDE96YxYoh/+X5zOjfbr9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl84rqDHhg+7owBVhrqaI/yEe/MIugsA3m/gMTvy8mzlGskXV2
	dQ2PQfx3B5vILjY6aeaRq1XJPfrFV1vuR25pH/thc1d+F8UBE4pEyIzgVMJRypPcvqhseGSNVTW
	Okjvl1WcV1k5GUNcQygF7MNUpxc/W2EgxZ1d5pVp/Ww==
X-Gm-Gg: ASbGnct5HrU8Vqku8eO/FFNpRGsPnQIJmoSW/2dzT7Zjaf8QxRhLQrQhJN9M7oYdjFT
	BAUvwOOiTVGd13n2n7NPbuytsIZ0cPAbMsV5gYGgrbNAUyxALzFy1oO9Iwxanmx3uxTu84ZELEs
	G/DykMDw9Q7L4Fc8EmAiPyzons0G80vtvPEzqHpxPxLNM=
X-Google-Smtp-Source: AGHT+IGI2U3B2DPkCaWxul9oLSOwlvNeRO1ugJRo3NawxC4B0GRJsCUsp0cPHyMuWk00lqKz8FoVwu1sUwVq7QH0sHs=
X-Received: by 2002:a17:90b:4b06:b0:2ff:7b67:2358 with SMTP id
 98e67ed59e1d1-3110f0be892mr5708540a91.2.1748276812091; Mon, 26 May 2025
 09:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728818976.git.hridesh699@gmail.com> <5f42e19fe52adc07d44d1fde225e8d933fde54f8.1728818976.git.hridesh699@gmail.com>
In-Reply-To: <5f42e19fe52adc07d44d1fde225e8d933fde54f8.1728818976.git.hridesh699@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 26 May 2025 18:26:38 +0200
X-Gm-Features: AX0GCFtolGqeR5oCBTsnixiaNpfcnCBdpIfYfA4ccGOLkthNj7Zy7-_xnpEOdgw
Message-ID: <CANiq72=0a2x7jLDuYtzDf5NxAvVpCDuCYMsiysoJ+GK3pF-kPg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] rust: kernel: clean up empty `///` lines
To: Hridesh MG <hridesh699@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jens Axboe <axboe@kernel.dk>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	Valentin Obst <kernel@valentinobst.de>, Patrick Miller <paddymills@proton.me>, 
	Alex Mantel <alexmantel93@mailbox.org>, Matt Gilbride <mattgilbride@google.com>, 
	Aswin Unnikrishnan <aswinunni01@gmail.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 5:52=E2=80=AFPM Hridesh MG <hridesh699@gmail.com> w=
rote:
>
> Remove unnecessary empty `///` lines in the rust docs.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1109
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>

Andreas: this is trivial and perhaps you prefer that I pick this sort
of thing automatically, but just in case, could you please Acked-by
the block part? Then I will pick it and hopefully the authors can
restart the discussion on the `checkpatch.pl` side of this series.
Thanks!

Cheers,
Miguel
