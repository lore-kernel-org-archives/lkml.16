Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EDD6ADD;
	Mon,  2 Jun 2025 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748884300; cv=none; b=jGJA6a8HCt3kDMNDODDTB1VZ+Hz0Ua9BSI7eY5yrpIUAl0RPHPVQWOqnzeDzq/zYMu84gYyJNReqbtTuzNCKTJw7inOQmhhQI+qOdajN6VORBZlZhz3vJI4Jrp1DC4EVCs6NXXWPn9Tn/aF3jfSxovyf7wW1bmiVNGtUeIUP3ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748884300; c=relaxed/simple;
	bh=wqA3gAOIJ90h6rmokvpadlXr026asFXBgCdCuLK4RZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFGhH0OH2Yn+mzbBBx4HEiBx2F0tWbTb48BzEa/0zkYBwqjAoL4V5WfhxIHz0zjhNUpX/geVnmgtK5EL7Okg5NuawrI8JcpVffCv6BC4ijMdGYkGe896aqTEQ1zwFddh2jJpOivM1AsflKhxDXFLduN3+Cf/iOnOy/z8Z3ZCJBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWEWms8Z; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWEWms8Z"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-312c8e85aa9so162378a91.1;
        Mon, 02 Jun 2025 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748884299; x=1749489099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqA3gAOIJ90h6rmokvpadlXr026asFXBgCdCuLK4RZc=;
        b=eWEWms8ZWWscHCoSvwNcsAnvCMtGWDHnQUGVPFHZjMQerVpk/0UqmIONXXcdtt4MWF
         MMYwgDXHviJUC7b4uCgImTtnwUc2Tjdy00l7mWMNIcSYrdmms3WicAkowK/KHt+68jtx
         Nkn7lMRwqPXwT+oP0HPGOuhNPe/RtY361HR0J4lqASP5GcTnezASvJK6RF7LEX/fMq76
         3nH0j0kRryUkZF00LIrcV8Rsm242O9mUCi0vcNQbHKUSm8iOhI0WrTR1LNDY5CPDuBiC
         fx0el9InIKUhmv+HlmxMn/Y/ilSwmeb9qQ14rSjsdKXMMjvId5iExGaYB/m4hjUTiWQT
         7mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748884299; x=1749489099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqA3gAOIJ90h6rmokvpadlXr026asFXBgCdCuLK4RZc=;
        b=BNxhR0nW1TAKmvIv/iN+eHWa7lfnUsKkXtE/NQ2hzlW0MnWLyKDqiyluia+gnoYv4x
         zsD905StQhEfBYl9dN7BeXgi6rTyTP+o9J1ugf3hL8cLGijtINqskLTogtcqr1Wu2frg
         T2nspitMGIa/3HCayDlnFIeYvNyEZ3XkaaAixveicws5cfGlTjAh/M+2N10n0tS/jRLA
         Bbdak/N92jdZMIiWqMYuaRa24V/H7wUJE0BC/kFCtJCjmkbB8JbBXPOl2A/RWcFbpvCv
         CpJ2qhhjnizipWMzjz0FJPgR6zLbSrddyU7u+Dz4mzyzlG606hgQ/AWab+fn0e47V9QK
         XuYw==
X-Forwarded-Encrypted: i=1; AJvYcCVZQmwSaf48ujC+9E2jm2nYQdkAf8PPA5GfsMptF5QiMDXASD/eMekanWaJPU6UpSzjEy/xSE+YT0GbRhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFGRWWUenw3DLE8IYP02gXeQnypEgDeinn0ZN4gQQZ4HvwvLI
	sreQcxjtNIolwxVxbmVknV3cUpie/7+XlvqA30pDMWm6gexzK6gueJnC412iSjSegS7nDyWDJq8
	1iOnu3J/kbuaRKeMkZKYO/oZu6MolapM=
X-Gm-Gg: ASbGnctv85iaEMuTxWdG7zXpwsvKep3kuJgrx2VZUDs55pvxrXwwHibsLLKp466PaKS
	XHUE7Cs0Jo3yVeSAOdjvWx0A3HR/BOvquQhgagaZaZZC3+U+GkxTKEJBfpivhVzqG8IUonU6EW3
	IDRImczEuWkPJQq3jPeo1oW5QnIhfA+I1e
X-Google-Smtp-Source: AGHT+IEfrSPsxf1XX3lHo0JjSM1GkHbWkjMed/BNHzjQq1AJqrR9ru0QrCwyFbkK3Pe4yAwGRoKab9CVSKbrOkD+mLE=
X-Received: by 2002:a17:90b:1f81:b0:311:e8cc:4250 with SMTP id
 98e67ed59e1d1-3124daf3e85mr7626902a91.3.1748884298579; Mon, 02 Jun 2025
 10:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602164923.48893-2-saivishnu725@gmail.com>
In-Reply-To: <20250602164923.48893-2-saivishnu725@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Jun 2025 19:11:25 +0200
X-Gm-Features: AX0GCFvJ-nZPYNYx6wd1Q6mENot3z6AGWlF1PmGUXgDgZrwDbaVAs820xsVzAUc
Message-ID: <CANiq72=scAG0bOJuj6VJ+cemtXMc0QKQZKfUoSg2rzwF94UVvw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: doc: Clean up formatting in io.rs
To: Sai Vishnu M <saivishnu725@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, gregkh@linuxfoundation.org, daniel.almeida@collabora.com, 
	me@kloenk.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 6:51=E2=80=AFPM Sai Vishnu M <saivishnu725@gmail.com=
> wrote:
>
> From: Sai Vishnu M <saivishnu725@gmail.com>

I think this line should not have been generated by Git, but it should not =
hurt.

Apart from that, looks good, thanks!

I can pick it up, but if someone else does:

Acked-by: Miguel Ojeda <ojeda@kerrnel.org>

Cheers,
Miguel
