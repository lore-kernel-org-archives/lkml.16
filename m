Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBED23817C;
	Wed,  2 Apr 2025 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743592414; cv=none; b=dpyoXAEjc1wM97EE+Iol4cxENVo00Y8wxInDR0Uqd4NI27LlkNDUNY5NuuAp+rpBV0uVkrWfoK7p7B+NAzVMOMmOOm86yMuAhS61tO4eDad7Wj0W9/zg3+QV4VXKWd68VErHdmQLo1+Cqj/xraCWtqFutSYpr104LO2xLA+tfrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743592414; c=relaxed/simple;
	bh=Va3/UmUACgg9LWpe5gv41c299SYu6ixHTt7HBmtP6Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+Hf/78YDQ0PXrDgxXW6U8gk07f1NVczWZqmonfZrIp0iCGkVX1C/xkMO7TCLEmcs/FMAQ9UBmktMkxL4z9uAHmheQQJqJSXAArqYoa0yCcE41/VxHI1zW8OHfuR6fYBl+2YGLsWuJ8+NkmbnYVDLQZOUY4fpmqbWtrNot/QNkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C468fsY8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C468fsY8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff53b26af2so1439161a91.0;
        Wed, 02 Apr 2025 04:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743592413; x=1744197213; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va3/UmUACgg9LWpe5gv41c299SYu6ixHTt7HBmtP6Xc=;
        b=C468fsY8g5SnX3bWoQh+kV8m5rnXRtQwRrYJhU/etwVewQBLQwTqDcuM9xAcqzEqID
         i5HRz30vTBZFuDA8v16/alRJQbdFFmaM9NvxI+b4N3GEp6yweGyNk0ChidsBVqjWV3y3
         T3iYsPvVdhJwaUVYzHCVpEMwx2K2gLmQkq2yZlb/ReQ+HL3VpTmHtmuZ/UGaDxzGQcjP
         6Hk/n79qtx68mNGlPI9RMfG5lJDC87di5g9pN/YZkap/iY+2HtU3jC76c8btFxs18EAT
         dr1MAsdZTHwhpoMNCok8yLuWXoyPaThyrF+MxmcHJXBFJT4IlDvwtLTqQLpgSqsg+ppN
         rFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743592413; x=1744197213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Va3/UmUACgg9LWpe5gv41c299SYu6ixHTt7HBmtP6Xc=;
        b=ma3G6SoLaRVrbKxo9eeLcLFkeWXRnV5W5vR/HpWxcXMuEFgjynpgsVclNqcSFTyxs1
         RION+/BOJ9GNQlp4nIDCVqj7IFD3JjoMfh44e3UuwqGswDRfsObST7Znd/jlz9FuqUNE
         tNeCKyA6JoF7oWbF/EgX3I6sBiHdGwKHY8gm/DbEjPDTHcrolw0MHOSPmBA5w7Mfu/Ps
         WO46+MH7gAZkOSCJT8IlUxET/Y7kfDn9vFCUwM4z7Y6iLE4YG/MbLnTF3md5G6pUkSQy
         Xxtr6qrscJk58jwZ1JItNrrfH6FVaqRTT1haBOqPLHk8WIMKt0arkb8RsXujralkSmPu
         /xjg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Rm1xzaYnVo13rRkjTRnhRxHVKuJf6gak9DUZt0pf3vOqQzS6/Z/sXR/Uzp4usGpCqyci0fUgTyy7QTw=@vger.kernel.org, AJvYcCVEMy70EgIhlV92Cvkzab0yfHd9uUBnMOXPva1lY21MokKm6XXIxgGHIQ4M3VlTpaR7utsOhHXWaH1ve0xxDOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmrx8G8jSHKPBnPcEFtoXgvb+blUNG5N16H0SFBqP2GlXYVgbO
	uYHxFmIhfjYxHsbzQ8rbMf6U/gh9yKBOX3JnTpNJJZDlSQQaQp9Rh5fEzfuSTIrMw2OKD9/Dfr+
	fagN3Ss/lIFcJ32Yg3PvoCy7WODQ=
X-Gm-Gg: ASbGnctzbkoHNgtM4xLA0pkQIoTHFUlyDy/HLHHNAP+/Vst+iYU4Ro6x7tu8j7iYSxl
	2RKrCpvBw1Hh+fTeSsu/GoBE4DC4AT0R645PzCavSHgJv7geYqXsUIMjzTzyMFQZroid49WkMcB
	1kUF9Dc83zfVHbcxeBtnbGAsFpozkQUhyGVyMh
X-Google-Smtp-Source: AGHT+IEBkCp90LmZJMzNSuCw1qE0a9pZT4uHJuwEA4vfFgxDMgFpQvGkHWwdLKVCzAdFlWhEtA0WoxxQ02iDMVwiUrw=
X-Received: by 2002:a17:90b:3e8c:b0:2ff:6666:529d with SMTP id
 98e67ed59e1d1-30562e93988mr3236432a91.6.1743592412698; Wed, 02 Apr 2025
 04:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401221205.52381-1-ojeda@kernel.org> <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
In-Reply-To: <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 13:13:20 +0200
X-Gm-Features: AQ5f1JppUI-5RQRrcETk_cSydGCYdkJ4HjopUtEovoKCf5jbtrY8bK8XDJmnna4
Message-ID: <CANiq72mdvnHvWbVNQbiXSRxd1xrF+A=v0RdJO74xeY3HyhRmcg@mail.gmail.com>
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 1:53=E2=80=AFAM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> I'm not too sure about this change, if the loop is longer than one
> screen, it makes a lot of sense to have a `continue` instead of `()`,
> since one might not see that there is nothing after the `match`.
>
> I also think that an explicit `continue` is nicer from a expressability
> standpoint. So I think we should keep them.

Yeah, I feel similarly. It is sad because the lint did find other
cases in the past that were useful.

If nobody else cares about keeping this one enabled, then I will send
the alternative patch. Hopefully we can re-enable it at some point in
the future.

Cheers,
Miguel
