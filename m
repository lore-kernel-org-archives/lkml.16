Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA754764;
	Sun, 13 Apr 2025 20:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744576273; cv=none; b=BoAUPSpMvoqbVzay2UoT3ZrB68bY1xylWGara8+UEU1WmfzTlxwZY1YjypbBeFbOAeAesIpb1up9eJUAJvCk3jSldeUJI7KYjNx5h98FCTFupdMeOBeeXDZzXOVrh+dcvH8jnqWZP9u5KjQt1yIYIMGI3gQbZaacrFYziEwhbtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744576273; c=relaxed/simple;
	bh=YT2Jb+AAFkRdGd/FrferoBT3XKbn0EcNCPTzC3UwvUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhitJlJNRq2/Q7uXRUduAk+CovyJnF6byAae1H6xqHZMla+mre57JlFoGUJXJplzOGIxGMsENDEDmOz1GmQEnGsIbcjKqs94GzKf06C/vSNOa0QjsiOrV4bVZZ8y7bieVMBuWFRtnkRSC78+xB7tB4H2uBpSg61pnok2QVT7gVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nD8N1BTB; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nD8N1BTB"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so674933a91.0;
        Sun, 13 Apr 2025 13:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744576271; x=1745181071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YT2Jb+AAFkRdGd/FrferoBT3XKbn0EcNCPTzC3UwvUU=;
        b=nD8N1BTBsphsBlcQkILhqOsUcQia0/b8UgM4f3x375HEGt46HYVQPdNF8fAYp49XF+
         iZ9aC1JjCqi1bIXMwUdOQPoQsPBBGtVSo7jxuI0gs6psxnOSOf6lvzCR8eHgVg1K5+rl
         2FkboKFBu7oHP3if26TsvRObRDxx1AZuys9Ut9AOJwwvOiEMFJ7i0Usn/oRho8M/HSoa
         Wt42f1a9huQsYZKaCW3brDluDMoBpNh2C8TS3IKo8wrFlFMZsGgDex+HHj/+kzgNnm62
         UY+HqgEvBO3vg0G+iDTXmV5NH3UbBgw4zvoHuiL87R9MW9MvSN1AFD8PzI/8bCnyowNl
         wEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744576271; x=1745181071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YT2Jb+AAFkRdGd/FrferoBT3XKbn0EcNCPTzC3UwvUU=;
        b=VuEsRQrz6yQRQe9xUqzqgHDIpBFycpVVWejQXMzJ8M5WREMqgSD7AApoLe8Y/l2mdr
         vED1ZFtiPwb+ULP/plYhC2jIcHgvQdFjTm/UOX2IGFBHTxFIZcpUnF429+JM2G6nrr7a
         uifU5MssHsSoxrka9VHFiWI8+OMq+uf5BG+IPL0AceJ7fNlLNCsMnKti3g+TatniQ399
         2zNWQE1CdsmttwAG3dyCpT6VrTwtGfpG8SfLiBSDXB72dQkbiaD/4XaDiGvb+5Uzvlvr
         Gwz8EkCr9PfiqOo4EehIn0kqnntuCIoPaSzIkHjjt/hw4WzjoYmWMcyU2ohQu/L0rcXm
         gLQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZHO7I/8VHUOFyIUi8gYWMbY9cqacZIpSLsWsu576wnDXra3GSNUr6JL3wWBszJ7XMBhqOzYBJAQzbvAw=@vger.kernel.org, AJvYcCWz296mdYlcUUowLtanVlmKuW7LqHxmtqkeo3me0tqVCCBmnOuXe+/8WfUCW1jSl1nn6iNTBny/xO+RBiCSzh4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx18HQ1t6P9xvLNWbrDbbuoAUhz1hNInKx8NKjp9UH5rX0Lr6BY
	BhRoX1BMpQOVkXVHNk7LwgL7nzGAvTCFGTHEOdvq8n7z9NLQgLrQKgIoZPlVhM3shLbbANseUzm
	Y/m1bbmCh87fKgqg30XWJ8g4WD2s=
X-Gm-Gg: ASbGncsAsgy0oHzaJGAvt2lmFwIcXeiLtV/rQzEeF4vGhg7twafunsGS/vfx3sv069K
	PldpwEyU22MXanq32gsKvViavPUfZUyi8NQ9Z1LB9OTD24Qc0zmM2Ovy10OLOEyRKOnrHB7o23z
	wgUAr0zKucI1K41Yci0C2sfQ==
X-Google-Smtp-Source: AGHT+IF/F6cOktmDCDF8TObfqU9ewu/SWARhJ60H2L0Hf/8/j2n5eUpU92+PD5aEuvktlLwjgqKPdxwRh4ggyhNdosw=
X-Received: by 2002:a17:90b:1e51:b0:2ff:7970:d2bd with SMTP id
 98e67ed59e1d1-30823681347mr5848130a91.5.1744576270985; Sun, 13 Apr 2025
 13:31:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
In-Reply-To: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Apr 2025 22:30:58 +0200
X-Gm-Features: ATxdqUGvaQIDRki065Ejr6gu0CMzwc_X90fh-wsW_PiCfEUxa5-r3icChbEWcQ4
Message-ID: <CANiq72kAYp0Z3VNS=JgApceCXx1OVXMNJJYcm8OnZdToz0zufQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2025 at 8:16=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> ; diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs

I am curious, what is the reason for the `;` notation? If is it to
avoid issues with the `diff` marker, then I think indenting with 4
spaces as usual would work.

Thanks!

Cheers,
Miguel
