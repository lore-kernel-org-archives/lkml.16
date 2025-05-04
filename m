Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DC97DA7F;
	Sun,  4 May 2025 19:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746388135; cv=none; b=vEPWwFpem0DnqMdRVRVTlgPIItdx2o3CYT1UWuAU+iIdf/JMrk+dSPFssTfs0zzMIhoWrUoFTXBIbOWn+b+M8yPKjn6v9cTT/YZF6Etpq7sHDCvtTa46+eYWZj1GRN7+N/Gy50VXmyoysnTK8X4KdXtR/JvMcyOXIRk5mUBJgPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746388135; c=relaxed/simple;
	bh=FvPgRUMczzLAAaBk5XQh+XedHjTT+Lr+OE7EJYY9KWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzcbnP9LCplo23y7kgacPyxaetwnDJAASAJERMcL/+nztW///XaA8BtOLg1Ijf7rDSLeZB7ctsDJGBUpxXIcIkC8QaLx9ijHYciY3fbwf0goS/ePGFajMTNy69IYTioyxnH4Tmy5NS/g2FWZf6FxY4+jRNNWJB8K5EWvCDJ9E4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqYOvSoX; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqYOvSoX"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso260265a91.3;
        Sun, 04 May 2025 12:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746388133; x=1746992933; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+cY7XQg3tDKPiMDvoOhswXp7ViUq/mptPjLxPqNDPA=;
        b=RqYOvSoXfr8U44B5u5PECcyaS1iscTCCSDm924ywQyGNexXBemDnLr0BjsyQStnny+
         2r5o3TinJEAzBwp8t+4sSrI+0rBwDhNw2OwR6F8wm5tnkLT8X5qQrBRXfzT5cLUJmnR0
         6L8y+Ob5UAfeJKqZDUYraGmV1QmQeoULBfn18O0mSeKA1lf848Pj4e5L8NoQe/Xaa0OR
         y1DGtWFQ9jm9o5gTzAclLk/Y6KFo8k67DJnpezipepPeqZiNYQZS3gMEExPkHrWGZWxZ
         aQJwL187/mtlgmbz7kIR95xM4V4F49uEV4Y6zOS2rl606ahDq2hyVpLn08WkhUJrCiaR
         V6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746388133; x=1746992933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+cY7XQg3tDKPiMDvoOhswXp7ViUq/mptPjLxPqNDPA=;
        b=JGqnxVH5RSd86laasl0LTyICeg7O8aTDT8Z4G79A6/VXYpL8dM4zH4t1oMLozbHRmv
         YKFyxMUVtZhaxuw+LY8yaVeJ3UUyHKOKbGPP5oMRQcs1fCG4RDtoeXoO8ovm4NJGdqVJ
         ms/su6QGgngy446vLPvm439al/RxDNnMsZM9hC62zW0G7g4EYgLrSj9Yex0oqEv/TDnK
         giXKWjXuYOk0jnRK1YzhbAYQ7rY4UwxxmvNFeorD4qYNor0josEzZOZxJyKUrWHYUW41
         l97Y8YOHozmgezpTjrSBD0RCalbXaP6jeYT7z8ZMwnGVvaIwgJQUIzEnaKhAUuZMeXQ9
         krMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVRUUjCED0SZ9u0xT1Yff/ikmUTtizhIMlJqnN0ySSfN5oKBtyC+iTFpiHZooINtnpiNpXEYbafIrWRL0V3eQ=@vger.kernel.org, AJvYcCUdtIcWCRhGgUj58tfSBw27p1O2d49OpilHzYuhmlzc36ZJbp8JyDeD+/oqI9DuPbxeWvhy/gCwcvgFIn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ulR23wGkM8/SSebliHwmva3phXw5rRvxYm7fE7sbcQIxXZ5r
	EIUmDaIEybPzAy2wahVp65bnLXorwtquvgaPfIPSLQM6h+Qo8nZqnUXUPv4k4TdScylPffSWMyo
	5FZu9yokEbK74RsndC/dau1KlPmU=
X-Gm-Gg: ASbGncv9ma4AFCbzTGm+UD5vjDTFFge9ow8wXYeiFbW1m8QZxd7yN4WrsK8ROJSCcsl
	qqe9NXZiSWtrdg0uTlIt+wI+lPPTWyE06WM2Q/yuYsLFbkNgjI+cMHO7t/pfe0y/d1T0vKdhNlC
	Hchaqivkv45ve76Z8xeFxUuA==
X-Google-Smtp-Source: AGHT+IE1j6/ezLvfedDCCne0gp2YqmZMNQu3kqwhw14dn4ROaKg5nt/x2AT0EwtApo83s3dt06lmDYSZuIw+sNjg6L0=
X-Received: by 2002:a17:90b:350e:b0:306:b593:4551 with SMTP id
 98e67ed59e1d1-30a4e689b33mr5851896a91.6.1746388133336; Sun, 04 May 2025
 12:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250504-pr_info-newline-fix-v4-0-53467c401eb6@invicto.ai> <20250504-pr_info-newline-fix-v4-1-53467c401eb6@invicto.ai>
In-Reply-To: <20250504-pr_info-newline-fix-v4-1-53467c401eb6@invicto.ai>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 May 2025 21:48:40 +0200
X-Gm-Features: ATxdqUFOSgMJXohzmzeEQvROLK9NhXAwRAQgvrkMoye_kkagaKnd3gofNSqT9lc
Message-ID: <CANiq72kAbB3vg60yfffviDRWgEkQsFWoLdjF2mSQszV3q-__tw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: samples: add missing newline to pr_info!
 calls in rust_print_main
To: kurti@invicto.ai
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 5:41=E2=80=AFPM Alban Kurti via B4 Relay
<devnull+kurti.invicto.ai@kernel.org> wrote:
>
> From: Alban Kurti <kurti@invicto.ai>
>
> Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc print=
ing")
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Alban Kurti <kurti@invicto.ai>

Commit messages cannot be empty, even if they may be apparently
trivial -- could you please describe the changes a bit? (i.e. "what"
and "why").

Also, I think you sent two patches with the exact same title -- I
think you did it because the Fixes tag is different, which is good.
However, you could mention the difference in the title and message?
For instance:

    rust: samples: rust_print_main: add missing newline in basic pr_info! c=
alls
    rust: samples: rust_print_main: add missing newline in Arc<dyn>
pr_info! call

Thanks for sending these fixes!

Cheers,
Miguel
