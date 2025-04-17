Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256C1A2642
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874126; cv=none; b=rzPZzu/1osozehBt0wu4JA5BPapowJyH5mxe5fQFbZ37vzWzxx2g/AEEir3I0o8k+37wraRrTBCiIaF56H7QK06l06+jra+bWY0I1q0WXZ3QD1mmRONBnunvpn54tY/600q/T+xuDw1nWiKXKIEFPlEAD3/5vm4zF/LINExop/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874126; c=relaxed/simple;
	bh=VYfVmy7X/WssySlGcNy6ceZ6Q8XEOmeTMWxQTP9Qcq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVIPcQ+m/jDNS3S3HC02J3HX0xfti04wECBXkF7ROj5tiL/szZpL3etUKlcXS7OUMh72ky8AxYVqfNwp6WqWa0isph0eTyVnSFLIhEQTLAHLWJvkqdoCF9qBw26wBwEInVpP1/mRRy2jlqc6lncICpKR4wMXIISNE/5uleTqHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=jMLO852d; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="jMLO852d"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e6df4507690so432102276.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874124; x=1745478924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkmZIBCSiq/3tP7fuImNAJD2QkaV7orTUQqgfA3kRdo=;
        b=jMLO852dlHBTF/eY7S8susI66r8lPw2Mtxs3gQ8pGJuQbH8XvHRTjvGAJ5aswiu59I
         yeLtJly+v1JhPPOxn+WSRFHBztzVpRy3r33zZnghTNlQc5E4+Il7f6TVDjqV2L0n1ary
         r5512nLQzL07nBD6wZTacNKAGBFk71VRYYx6hVUJF5vILZED3uOI01isk00UnjyiNGmh
         ncE/RlyRhzr2FIlMZyWKWLbnJgYBsnsu+0xkXPyrR85n4GW950aF6Axpp7dAbUmrVwXC
         3iBUuetwtUkUW10BLafPctftbGdeN3AqtoK+YrVsdSMBewSabxsw2FLXhQY9qwRniqIJ
         o3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874124; x=1745478924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkmZIBCSiq/3tP7fuImNAJD2QkaV7orTUQqgfA3kRdo=;
        b=qWn0truG7IRyNH3VOOYTRGHaINc/DouxTl5QEAtLeBBslu10VCOSUj5nRHYLHtBEbZ
         BGmfZvPLp3vkez7OXNdEZNql3Diu5kUd05oW+YoAMeA2v0Hrz6ztOviNkSSl/AQmFDhe
         IJAZquZkEGtI0ns443AvbDZNtYLCmW+6rPJ6GICKMIPaAymYLBn8JHPqemr4y7u9ldmN
         rhR0GoJYh1JIQo7nnnSAtgdMFCGeKRkvMdEg9nwiTJFZXCLIw9h21Z6d2/ccv1xf5X6e
         G24DuTBD+tltMjXhiAXP3DXPfcpTROVtJpzUOurbwPWCxLvcXxHiqeCw9k6lRkz4K22n
         P/UA==
X-Forwarded-Encrypted: i=1; AJvYcCUmiQQQqA1BTpa6aBGsGHaSzR7n9s8Okk3Kd0YFtfZzIoyIYnWTTRtDWYlvQNfepVdySsu3+HkAfHF8YVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqc7zgcIEY8ALCOmigp+JHXFQUPOMAbiB2ERrtxCX3xoxVkXRw
	RTtbOM1AumV1XJyUXjbtgKpZjnCLk6Vjhc9jNFey95nIdm1kO7v3ScsIm27Q9Sies6J/cPhpond
	1szMLu5gbWb0tQtv0K8oRQymzBKk6axVUgxQ5rA==
X-Gm-Gg: ASbGncugfKJhoac/gvzubkeLUUtuIdcmoXxssetf7PhfZMq7rf0w8QgtFpGM7y4L2ua
	lAXIbX49icyUyPvtngc14rgU3q3wP2Li/CJto4t3rYEiLP9LE1XdCva2+Y3YazrALlAH/4MIsqd
	YblIhgn9uPtI5QvS+XiQaOAQ==
X-Google-Smtp-Source: AGHT+IHa34X9uZg27Vbrd90PmSZC7ztvDf7wJ3joxnRx7QyRa6KXBoTyYAnsoQMCjk1tPkCNQ+hkrfRpf0U5lhlDFNs=
X-Received: by 2002:a05:6902:1a4a:b0:e70:a83d:da74 with SMTP id
 3f1490d57ef6-e7282c5de71mr2037459276.9.1744874123987; Thu, 17 Apr 2025
 00:15:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-8-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-8-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:15:12 -0500
X-Gm-Features: ATxdqUF6T0mjxQ8n7sHeVZP_NkSnb8-dYbGj_0aQ89N-76hbxs8n3wEm2pYKYzw
Message-ID: <CALNs47vN8gMzSdm_g7uLa1uks8oC3UJXfkwH6RAJGS=Skv0vBA@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] scripts: generate_rust_analyzer.py: use str(pathlib.Path)
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Use the `/` operator on `pathlib.Path` rather than directly crafting a
> string. This is consistent with all other path manipulation in this
> script.
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
