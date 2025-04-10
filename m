Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B6207DF3;
	Thu, 10 Apr 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744293018; cv=none; b=UPAU9zw1dxTOFMkGVl1lLJD5U2EJ2/RrzlCEIAOLpuuQ/m99WDwWlNTvrsTR+lQoxtKH0q7ivU5TuI0//EF54UvGbzN0oouVzlk4JvIYrKRjDdVmvNXErvWgDMDUHl10KuFLK5VTmfd/xRHzK8EMKpaUae5lRC3AsjeWxHp2T5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744293018; c=relaxed/simple;
	bh=zwV2qQXJjHxkJFIhnMLFQeBBY4moAoK+kSI5WmrSHaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mWWIOva/K42af2cuJ3wQZ9Sd6/LVA9XOC7dqxNuFCKR7Uw2hc+vknK2RrRanep1kroDamJyreenUPEWH+bwbi9PLGYM1Maw7DZUZ4MdEdKLKYlHpsEYCv+1f0liLeLQ7xou+CI3pEu+80OraHLaqyE+ASryP4h/OBZuvQ94IHGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGmyx2wj; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGmyx2wj"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso126012a91.1;
        Thu, 10 Apr 2025 06:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744293014; x=1744897814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwV2qQXJjHxkJFIhnMLFQeBBY4moAoK+kSI5WmrSHaE=;
        b=LGmyx2wjzLqdQt5jVItW8FKwKK3o1ka/ftam0Ai4DfLFS06JEDPYSjmsAlBartd/cT
         8tk9x3Pv/TxETrBRI45oUL3oHe4vra1rwBm3IQMIjP/YrAX5BtSuUF6XWRlTtO3vJuQC
         Q65V02yCqZm2xkTjlxA1Q+41wKOjSv6CtCVdDIkR+R5OEoqVooM6G580Gra9z6RjulFU
         rWmE5HrIyPnBG9AabE1VGQj3YACWcafaKzyfznkfQPUaEPNvO/ET8hr9xIsoWBrF09k+
         41CMEU0rpPQy7X+YZIoGeTRys1F5BBS8g511UQ11RhOlrOyXwyBZEoiDphKCIzsLHS66
         GZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293014; x=1744897814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwV2qQXJjHxkJFIhnMLFQeBBY4moAoK+kSI5WmrSHaE=;
        b=mSZCkMBDrdnja6Y40UkxwOlg07G8StLiZi6/UkWZmYwcbhxgCsvTMAdppnLRsgVz7v
         KiFnbDhqQmLLRsdYQahuAwk6BdqVfJc8206XcNM8Ho87e/k+GrZthJJhB0i+eEpI7gzI
         r4h/2w8P5cxaVLtgIBspob9m5roh3+fGSEiucjXGdOrkp7eseA3QUqbbluNLE1eDDoV8
         6uDhkxKBs96S2w3z0xQ02yZ3lpTVK6wW/mbDVu1Xs3Yd8j/MLWDsuIcClwlFXn5PVV1P
         qDNjaob4HVU1xSf3MN9E+FMY5tMt3Ziima3ZF4+fRdKYTBT3mph+AmZtaZrEpnkOWory
         ZW6A==
X-Forwarded-Encrypted: i=1; AJvYcCUzFmBfRE65UhdNv+zltDkYC5gA9TmGw75kHYZ7UnY33+CT4z4p4uVXcqYZtoXBffHO/6Kq+fDqTaZptzc=@vger.kernel.org, AJvYcCX7Ul/NmL3Yzr+bfYfMCKkk/kHWRQZT+jIZK0UWziMlGgITEipSEGnhuMfjrkYJaUym2ghuoF3gc5NFmu9oydY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4gqpxxyxs307stJvF/8436ZLunco0kmlHSBMQoPaFJOmdi5k
	TuTbOhaPSSClbNmG6EyMTBH9L0hqkWoVTSsxo4YGhd56tQlGU2o0QIveKXeXUqu1FIcU5rY6X2m
	wXb8RVEMWoZMWiXupBDsFO7vfA2Ry0CY0whQ=
X-Gm-Gg: ASbGncvWTwS2LcyA/zT90gu+9pgjNRMTcEWtMYZM76VTCwp792G90TNTjrVenWA1N9B
	KxtNXRkR2zssaNDggy54XMELaLkq3Q71xLMUd1CPVbqBthba+ygJXYE3hmpgBtVnND5zWQeT+ZZ
	ranDF66RtaqMnrZmU9EiT3T4foshn1h96l
X-Google-Smtp-Source: AGHT+IE2Lpid90g7ZXP2Zho49ZJ3xbPPS6yWp+z2f1GT4PRub4JUfwtl77dhekYw/8xPpHLYaVQiZPfy1TV0RTy4iPM=
X-Received: by 2002:a17:90b:180d:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-306dd172cd6mr3248581a91.0.1744293014074; Thu, 10 Apr 2025
 06:50:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410115420.366349-1-panikiel@google.com> <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net> <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
In-Reply-To: <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 10 Apr 2025 15:50:01 +0200
X-Gm-Features: ATxdqUGFFHWZoOnydaIXJ6c9x3IP_fjbQ2ieyxYuYfnxvzP5drgKjBqP4mBmyNo
Message-ID: <CANiq72=3=bQJXvSDEUJYyEjn_qYMxFSc5N+zvpvrdx7Toi3KTQ@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 3:13=E2=80=AFPM Pawe=C5=82 Anikiel <panikiel@google=
.com> wrote:
>
> I'll let the rust maintainers answer this one.
>
> This is a known issue, but it doesn't seem to have high priority:
> https://github.com/rust-lang/rust/issues/115199

Cc'ing Ramon who opened the issue -- do you know if there has been any
recent movement on it?

Cheers,
Miguel
