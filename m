Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DCD1519B4;
	Wed,  5 Feb 2025 23:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738796716; cv=none; b=IHxyAezIYIZypJO8Cf4GPcVhbwnYxhk06hstj30TT4tRjkJ0bL5JCft7l7aDfvNVHqIXv+gDyfdiC7+7qVePGXSIuYsee5SYXPp6uw6xid+Al3/yKVwiWYt2M+7XTQhNuGYm/IfeCkrQoDXAwRjHBrKpePfypfhRIshsCMBhhjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738796716; c=relaxed/simple;
	bh=VuNnUCNMGMxnYEe4tmIx7sCYp+4mZpJJQQwlDI5HWfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WreKKkwEwupxUPMBN76wMu2ZKN1ivIEhMIkGwwPbLBJVYnRxK9ZCMedIO3ah3TOejWuhD0VCOXUuNia4SyR5HElpfQ5R3drOPDDprYrdJuN27vSSEsjUfEmsm2bbi60Cx7loYe31FUVXCmy9nasu/vCNMmoXXb2m5IhQpATm/fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOfuPA6h; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOfuPA6h"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9c3ff9219so54885a91.1;
        Wed, 05 Feb 2025 15:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738796714; x=1739401514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuNnUCNMGMxnYEe4tmIx7sCYp+4mZpJJQQwlDI5HWfI=;
        b=OOfuPA6h78AIUmrsP2s/bnCUMhMu3IiI86bDU8HzV9VBRkj9rwHM3L9uZ0ByZpn86x
         1IXeaGtRWE4T+BJzOmPTgWzpY0otwr4cQT3TBVRE3YIfhzL225Xs31Mt3TA635XNjyiB
         KBSfsvACJVjToHLmtkgsK+Pq3BG0axfvyCBWr4pG5HBwFv6++1prdyqENIDWLm3C8iNx
         9rtyb629VxAP70NGCQbAL7k5BS2chX9xinyjGAQcWAW7kVfzBDeVubHrFyRfm84GLPnu
         AvCYSNWJKw/+xJL/YGSv7WOyHZLgkAdoRgCkqd62jpdj1yzSAJXVV/OQoRFq5oR+gLCZ
         qsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738796714; x=1739401514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuNnUCNMGMxnYEe4tmIx7sCYp+4mZpJJQQwlDI5HWfI=;
        b=wBxXqkNqOvl75sDG/yno+n7oZpg+/vB9SLTiCMB2oQKAXQIez8iXhciVEPEWiPauPZ
         KJDvVqsQJOCFCvgvPw8bVAcA9HXy6EEC2xyMpdXbUIc4pQolsNIrtu/g1fPGyxrjfWLC
         kJiHjS3TDfPeZy0mq5aGpUAYKCdJX6++9X3cLNUfHygkM4IIeezj5diRMaCtIAOFVCjw
         SoAHy38+XMtBkX5gcFcNMEj6xsmwl9yVYW5O3ZDlthXawGeIMq4me95mc00G9Epixgac
         kQ35H6R81p8UFDz468HETAZzZkQiOxxi/KHs3quqQDYBHibGxPaH91dwG+BE4BgAlCJd
         GzEg==
X-Forwarded-Encrypted: i=1; AJvYcCVIBLGpJSa2Y7wD7sKVuRGqA0Q03bNMgd76vElrs0njeQIqsc7UQkPWVUYLnRWNtcYKmgn1zDQrTrV0wxQ=@vger.kernel.org, AJvYcCVzLO71/5cp3rjf1jQ6DL6O0dkfFZZySLVJwan5Hi7z2vYoU9ziXr9NCcfjHSdfVBIHl6peyVqUxDnvQBdYEV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3Gn6KnLyhvwjzHSQjHE6+Qpc+Kn9jQdb9RiRYetSBgBgSFI3
	gHkMdTR8O+gE8dXHTQuTkXPCWVS8P0oZN22L04mIEb+2L08e+xNhVOIURQMCuvtonPjNvxDQuNm
	t81osk/92mjcoIyPUjC+HLhI8SBo=
X-Gm-Gg: ASbGncsGJ06zFctYBbMvNZd8Dfgw+gAx8MPTfVMHHKR9vI04ic8Z/DhcEahSR9RWvO4
	BLQWZwFrHa9so4SLLSJsNz1v+T/A7fhK9FTFekC3G1ctbX9H3ehZgg1TAZrMLS7vEOD/W4Rmv
X-Google-Smtp-Source: AGHT+IHEkdQuZ1xqXx5TR3RkT0RQ5tRkVPdi8J7oEfoodpxut2oDCBf/YRZYXgpJ3Jqdbdpb1SlcepxFfU7b/SmCZ9s=
X-Received: by 2002:a17:90b:4b08:b0:2f2:f6e5:d28e with SMTP id
 98e67ed59e1d1-2f9e080017dmr2799782a91.3.1738796714404; Wed, 05 Feb 2025
 15:05:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-fix-mac-build-again-v1-1-ca665f5d7de7@gmail.com>
In-Reply-To: <20250201-fix-mac-build-again-v1-1-ca665f5d7de7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 00:05:02 +0100
X-Gm-Features: AWEUYZn1oyg916x3vUhZdy48weoxz1NOh8dzVbRIYcaTvkuDvvMXx0QxXNSMkys
Message-ID: <CANiq72kDzfDhzE4ZiZ2YEtOmFwh5u9pwy-_76xRURd9WabPEdA@mail.gmail.com>
Subject: Re: [PATCH] rust: use host dylib naming in rusttestlib-kernel
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 6:40=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Fixes: 0730422bced5 ("rust: use host dylib naming convention to support m=
acOS")
> ---
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Spurious `---`, but I have fixed it on my side.

I also noticed another recent message from you with an empty line
between tags too. Something strange is going on with the tags you add.

Cheers,
Miguel
