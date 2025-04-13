Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9522D052;
	Sun, 13 Apr 2025 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744556870; cv=none; b=eoEemwFT7KoEySG2Nm4BsncA626qDuE9TvwI/nwsG75utklv4dGFL3mJH4JiG2XrQqRElsw1SigM/+fCPbc9i0rVAg+VwG+sp4HkMDIRQ/Q40lUb94iwe8Mv741YPhL8/flrDQIApy7gDXxpSTf96sJRh2SUEzbCLQHE0la7BjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744556870; c=relaxed/simple;
	bh=kcHnuyDZ0SyzSvpSJp9bpucEZ0o5m5La5CJ13nbbOZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVY3rEAye/IqqMKj5ZRuXNNCqsyhHFPGHTsM2un0/5KSElv9ZgCMRlysvr+0M3uI/OdUZYiYqyrjOs1lvdGqXarpd3R+CaWEEJX1RMQh40Yh/1tiqAmKlAOr4vPtTWKE2nkC1PfZWZybur0dNoEDvz58/IJRXqMjvXFed6u9U8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVM/WVAU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVM/WVAU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301317939a0so605087a91.2;
        Sun, 13 Apr 2025 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744556868; x=1745161668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcHnuyDZ0SyzSvpSJp9bpucEZ0o5m5La5CJ13nbbOZc=;
        b=KVM/WVAUfrnKgd6kEcTZo5kqpywKE5iYCRxxucCzwxQ7Vj29lWKNmCmTbcDhy6qZT+
         t3MlQnV4IQvhYWsGxnhf78azO6JwwlcDurxJ2zQZd+vnIpsx7n9pS7/T0uaZ7NUYFn9P
         ludkpRZjZ+X24LwlROWQUqYLQcrhD/R3tELjaeyjDS057EbiG27iVkbrWWfm0l4wrZdc
         xWQH//NEOWBZMDinkjDWAkHCBTgeOOhO8gqIjkSjwR4DO94iDlK934/Bl+HWAT4c/P7j
         DW71lSmJPs2DEdbXtlf/G+t6eAqv0gjPFo02KvL8SCgHAs4AwRp1K+mO2K34Y3pyWWhq
         RS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744556868; x=1745161668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcHnuyDZ0SyzSvpSJp9bpucEZ0o5m5La5CJ13nbbOZc=;
        b=XzVBWZA/vibtGc7GE87qWgE/0MU/mtmDYC5jj7LSQeDfv2ISzlsJXM9sjrxoF1y+1p
         wwuotgaTj28uearPI09xAjceFXD6uvzW/oGn0m0K/m4tOaUmJeZPMFc2gVCFRNrbWHwi
         F1Wspgps3dhE8zQxWsJLLGnEBHbeLvBaHsBhNmacMW6e45jvsMnJqXylIoBkaXT7l+wb
         6bKZ7c3yEPFfN1l4hmJiRxb9Nx4bBYBiktxQ3ss43NisUyvPeMisn8gJA3CsGMBcYIYS
         CyhEIDVcgjqpcqzXLPa0iKRnSv0xJkJOMzgptmDhRIEwIr5/hrWjklAJGsobTrMLrx2Y
         WzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5wZWl0+H1rt4NyK0v+HOxtFgeCKV9l8NL9YBlGzosZ4S9FkCB1f7HEpnYDJBmyuQ69TrDvMIztdPP2Uvh8xU=@vger.kernel.org, AJvYcCUfUs4NZea+PSUQhp0S/66eGRkJbqJkTomwgFQIFIk/3UXnElhy11jv4JrKWljcJyV5UbJQoLIS7HgmNqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAiV0bC8U+UIwayAAlILr+y8WEkT+YfknqS9x28NlTsuPGTCnz
	0ygAhvdnhGZV8l/5HPw6WDfCixPGHtK7mBHyHyoimzCW7P1y9yoU/S7HyrqqFDJ/Arz+2EruVTT
	QtwBcrFkIOKroB7hmrPsUGd1aZKw=
X-Gm-Gg: ASbGncsAaRwKefUDLUhyWA0Qsf/5XmRTMh9DSdhFK1aDJLwfrUHb55/bUJZXj8TT35/
	Jef5qIRAnxf9BvSceKOeagEMf6UuOnn33uv1ayIgnUl38b/QRmfyafAOmREpKNB1uAiKwfvJJLb
	p03OAc1i0CVNVPWsPLxfoQGDd9WvAv5hN1
X-Google-Smtp-Source: AGHT+IFGjPKKXA1pvaRAs63I4bv8rtnW5ecPAb5J2PSypj6uDoaBm6RMMYr18fPRJt2f3B0CiZg8y/eZNCLCc9McUnI=
X-Received: by 2002:a17:90b:4d04:b0:305:5f20:b28c with SMTP id
 98e67ed59e1d1-308237c95b7mr5121752a91.5.1744556868210; Sun, 13 Apr 2025
 08:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <Z_p-UoycGk3BceXm@pollux> <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>
In-Reply-To: <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Apr 2025 17:07:35 +0200
X-Gm-Features: ATxdqUHDiImcjYnYm8BxwPatlklmO-luMXFpm7x1Qlk9W75xcWsiNNmq58GUzfU
Message-ID: <CANiq72mpKQM8v1=qhACWGYo1c0jtOymnACDxXiRgjEs2-+X2=g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction `FwFunc`
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 10:55=E2=80=AFAM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> This causes problems on v6.13 when building for 32 bit arm (with my
> patches), since back then `*const u8` was used in the function argument

In v6.13, the function argument used `i8` -- if it were `u8`, you
wouldn't have had an issue, no?

Nowadays, in 6.13.y, everything is `u8`, so you shouldn't have a build
error with your patches.

Cheers,
Miguel
