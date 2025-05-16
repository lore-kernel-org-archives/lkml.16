Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D2F323D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747412017; cv=none; b=I4vhQ1bkcseiI5m5hcxStu7INoxs7HS5/Z4Pb5AaLsNJGyrY2e36ZgHbqihAy0+W+dqtRvN4P/QTKHrh/HA+HPJ3iWMeHNlVT+6ZZucYP6BvuQRLzpypqyMtEqdj9RKaMMDly9KA6XlEzIi0JYgouc5qDTFsPlQsOJ+WbOgIFcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747412017; c=relaxed/simple;
	bh=9P1+jTbwVXosxLyIAH8N3hBYwS2bNN24xtek80rU0xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XveEwNlnObk5FfACaYh91T1W1K+QkxCspmtl+buVDYoV9uZO4cj/Z+S6L6IFPHEzcKGRh7u6XgnZB42iv6IHUOzP/g12vPWtvXQG7n2y1QHQfR5Bt99m7PCuKWOVorUbdlvSMyQ1ROeGxQ2FhNFl34bu25nk5pMOZF5lwIS6Rzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OWrQ/E9y; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OWrQ/E9y"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acacb8743a7so377588466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747412013; x=1748016813; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GUHk+mLN9wCUmOIy98ic92M1EtSWfUZlafBbykfM/JM=;
        b=OWrQ/E9y7IH7qjGeyT7eNPV5xD3LjKpARztKm/4zMh04iF3/m1hKW5NNfNjKVkgscV
         L8/6U0WGyFZvW8tKyhRAimn3m7T6scTRlvHLa1g66Lck2DXl4pgAzJnrOihj9oNBtTVd
         lCATgjfACA28hIbZ3dL5LsoGccN/wIB+hQnzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747412013; x=1748016813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUHk+mLN9wCUmOIy98ic92M1EtSWfUZlafBbykfM/JM=;
        b=HJdM+dnQwhD9MAC4erqX8ZCxn9CxHCwUSyU4zAkYS7XDfAe6abpwNCg9GRxnq9Y7W8
         EMZLUokzhXBa1r68ipK9RKXhFsRUJ0oYtMNpYg9pUf9fLGYwsYT/QhZSMAYoVoB9a9BJ
         00Wr4t8ANJ9M2G4wHXQsy6mOv59AtOzRPOk69KkWuw1GQVrrnLGuelQ0cRAeQY0rHREc
         mIQZMpTObktpwB4P+46hPrUg02yqbQDcNJ2e7ZKsQwTurPDQs4Yz58vPsjg5AqEOEwTg
         X+Y1ek5LweMMlwGqDjxGJEuJTpclm8zE2GAw8WIObdiebOfEsmKIEUxJ4wavBTLWk9LG
         eVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWD+519hpAPT0X0ELiR+Qbs3qlUi31YWcq8pV44OjAD5QeNqKGaMRhWaDIohpvE5dc2L6pmOQ3w/DSe78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr1RtLC+5m/wSzvAeDSVpM4/DeTl2xaH5PYZ2n756iYe1KUFyS
	akt681ab6x4GeqfEARdTMrq1BK/kdNBswfDHLFitKadnondmJr+FQ4uy/9PRWQyFhVzn33oPztM
	PgjNqmeQ=
X-Gm-Gg: ASbGncte9gGGTQYP+/QR6MAP1gYK8clIBw+oUpSVfVylha3INB599HquZMc/0I24IM6
	6ggZfQ8ODAFfkEoUAHpI5GB8/unyJgS4tdB0ZrxHF2vU8KPlxYyrZQu1YUmLYJu0WLxvBOCWNsi
	1fzmbANNSCQjkmpMPg/2xe4A1ySveHJDYncRzyqoJugEgC+2xckxrz1h0NpiywipoiGDriOqOjr
	Mk67vj5vfzMGfpIhbc9Ubia1nC2t5tC3ONMOH3e9f0MraMIeROKb93TkM+FnJq5cpIeCUX2b9cy
	bD2SwU73Dzi4upJAbWYs0W2q3sQIv27AtLrv/r0z9ZbXHkfOilmsBdFD5OWGAmxYkH3L0trFJLU
	GQyejAu0bPlDd4gk3m453IppbHw==
X-Google-Smtp-Source: AGHT+IFTGunhkRP0W87ga/JD8v982IgvO5K6O7/l4ytFym8Foo0MX9PCrfFmVgKuIshAl3wV8P35lw==
X-Received: by 2002:a17:907:960a:b0:ad3:e742:69ea with SMTP id a640c23a62f3a-ad52f86c635mr331428066b.14.1747412013468;
        Fri, 16 May 2025 09:13:33 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047bd6sm177171066b.29.2025.05.16.09.13.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 09:13:32 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso515947a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:13:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaaGre508Xw+7ixsJb9XHQHWvRHL7ujUxvlyXBE4pTb54tK4TSsmb1lafb6CCMOuDwnhfEx4Av1d6JHHw=@vger.kernel.org
X-Received: by 2002:a05:6402:210b:b0:601:9586:8fe3 with SMTP id
 4fb4d7f45d1cf-6019586930emr978668a12.16.1747412012273; Fri, 16 May 2025
 09:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <871psp56yb.fsf@kernel.org>
In-Reply-To: <871psp56yb.fsf@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 16 May 2025 09:13:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=whXcQu-TcP8q7xpYsADyXSN8GSX8sV3-chjQOo-SK59Ng@mail.gmail.com>
X-Gm-Features: AX0GCFtELJDcm4uocIJ51dUy47z0Fuppeouo-29gMxYswtmtUoCWpz6c6Jgr0Ns
Message-ID: <CAHk-=whXcQu-TcP8q7xpYsADyXSN8GSX8sV3-chjQOo-SK59Ng@mail.gmail.com>
Subject: Re: [GIT PULL] configfs for v6.16
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 May 2025 at 00:51, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
> This is my first pull request after picking up configfs [1], and my
> first pull request to you. I hope I got everything right!

From a quick look everything looks fine. Proper signed tag that
verifies ok, and the pull request looks good.

I've obviously not actually merged it, but it's in my queue for when
the merge window opens.

Thanks,
               Linus
