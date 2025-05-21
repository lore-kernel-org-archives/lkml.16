Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5221A2A1BF;
	Wed, 21 May 2025 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836102; cv=none; b=bSxaojxKhkF4JKZbo9+dtLsqM8wZ14oHOp0cR9ZyrK/aEG8M26CxA/xFd7mIC+VINa/RXb+YDumSq4hRhYc6witEYSHWmdLSRA4Mt53c5sY3Zt9QYFJevhWafijdznW6k9Xm4hi1T6zf+z2O8EuKbQK4znYcbb5uTafgeTS869w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836102; c=relaxed/simple;
	bh=8aUOwg7cfjAHrLpnuG3R+zcViomLhaw8dORoW3xOm94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3Gy9nlFmguP1hIswUSNvX1cISZy1GXw160F48SS/d8bhf0rsEUxpxeOB8OugScChx8kKZCOcRllDe/eWRK53DEZypN4WLQVxuw6Dyax44F4/83flWx2KgfMSfACE/Q4fQn8jPJ1NZ6KqSqVx56sqI8w3KcKXWheVjyl5qD95ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UeV1lkIA; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UeV1lkIA"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231b7b21535so5048185ad.1;
        Wed, 21 May 2025 07:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747836100; x=1748440900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMGXupCFm/jDQdH3BwXg85XBgNeRBVeHk/IerHW/LbE=;
        b=UeV1lkIAt805uhIVM5cPTl8QhTFN4UQHqvrYxOR+whjyUN4Z60VdCIaqpsM8LoQUbc
         UH/vG7IDyu+k8fKOGSYfXK83alrM6u+1sK2BUcpMni6jGuDm2jrpXCuq0cn3csDGNvEZ
         t8RmtWiplNJhXrOxzqirYFPY6fMu/UdTb80L4p4VU64nAlarSmiT2fahPrfvtwYl5cGj
         wFQLOYolLjJUS1XzWCEH0QO6J0+Xl8Dfhjv//rgxVlNkDnE4mQFoL+TSBMa616l84Wxs
         cLWlI/+V1sMzH8IUtg6bGtxfoF2HShgiXHdbY2qXRVEXKmdUW/pWswVWCmMZ/7Qc5wPI
         fHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836100; x=1748440900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMGXupCFm/jDQdH3BwXg85XBgNeRBVeHk/IerHW/LbE=;
        b=uhr8y+yx5LHwGZiJIo+ztXK9NqQJ2Z13VSn7jSFc7HraUV95CI5H6dLqk15fcc0O7P
         eGRBsimtUOLMn5Z/l8KeQ9WPK7bT8X3padCKMziSaGrIeG87JeC5QfK7DMSZp7RkY+4g
         EWW85F2oW4AudAZZf7pVPs3EpWLHJelSsNqNafmMvptrSR5dWITOhRtmW8Eo60qxq0os
         D+GtdkXo2Hk/NZ67BoIsI0MOFCH5MIhoJ4d4driqo5s4HqX1BEncGEfgIz+Pi1Fs/2tx
         d/ggF+IwNGMfXgHbpEYP8eSBbRfYimUrTZGgs+rluD2/T7Nj8KuI29RqleYPuvTk7XNC
         mTEw==
X-Forwarded-Encrypted: i=1; AJvYcCUy7OB3PNzlDGwmOG4RvA8Vlut8OTNl4j1UXFyc0VK2ICPfloy3LWBhdyIoIGAsQLtVzNGs9O1vE8LFYbI=@vger.kernel.org, AJvYcCVuQppHYxI3utx/gpRTxe5LY8/uv3gGDYIjyakKN28BOpi15H1fU48NWohGgDQN8LXrMIkah9Qx1mEqQY4bAe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXO4+x1zb8PzG+uzAuw1jlIZcOCww1rmY5/hucm1d1//9sRnfZ
	jqY5iaxz6Oj/LnFycd06Udw1ylXa/zh56NxOxqlL/rJEfDw5QZUyFstHy87WS6wkOyeqRPdPuIB
	65GXntK+Idc9uzxO/+dwCvVA3o+l1elU=
X-Gm-Gg: ASbGnct7ILb9kySLhMbiXzzq4pFIidONrEmHYnHFlKCZm/QaiKmCEwWlkAr9gN1JtBn
	VSnevycLor4cHBNpOL4guDy0Iyv7WiuGA+bFSgAOGGkIZY8+gi9860i+O6epSdK9mWXSYnxvCfd
	o/CMkoiENahGmX1dzUoqo0d8ZffUgTeZDd
X-Google-Smtp-Source: AGHT+IEf9pI5auX2gp9RvC6XVZIT3qjdAUHxHeINEyS1iniHrOrcET60vaOXe6WxV+Ndo4dwUNM7er6CEi5Ut3dwZOE=
X-Received: by 2002:a17:903:41d0:b0:216:30f9:93c5 with SMTP id
 d9443c01a7336-231d43b7cb6mr111674645ad.6.1747836100471; Wed, 21 May 2025
 07:01:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324210359.1199574-1-ojeda@kernel.org>
In-Reply-To: <20250324210359.1199574-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 16:01:28 +0200
X-Gm-Features: AX0GCFu9hbn7oACBtc1sC-LprsFwQEelpoqzdJdMS9n5B6L5nTBBjtDwqqKl-gg
Message-ID: <CANiq72mBHcsCpn1ZJRJ9Qa-Ass1MsoKdKcFpiFF7hNwyOXjAOA@mail.gmail.com>
Subject: Re: [PATCH 00/10] rust: clean and enable Clippy `doc_markdown` lint
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 10:04=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
>   rust: alloc: add missing Markdown code spans
>   rust: alloc: add missing Markdown code span
>   rust: dma: add missing Markdown code span
>   rust: of: add missing Markdown code span
>   rust: pci: fix docs related to missing Markdown code spans
>   rust: platform: fix docs related to missing Markdown code spans
>   rust: task: add missing Markdown code spans and intra-doc links

Abdiel, Danilo, Rob, Saravana, Greg, Rafael: anything against me
picking these ones up?

If you would like to pick them up through your respective trees, then
that is great too.

Thanks!

Cheers,
Miguel
