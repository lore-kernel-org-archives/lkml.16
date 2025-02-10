Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922941BEF7E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739222490; cv=none; b=pDJTxXrI2MCEk83SMKHafK1gqJIm85QKdbXGqx68Pfmqo5R0gX0Zi276TJIV5l/qggix3vANHwgOj8xnIAVvO0PnC00mY0G94c6IIHTokV5+muQGbclNBILeCyg6w0NvvURcCHUuO5tHfjZRIqT1qw8ftN8xfgRyDzZlIkOGlwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739222490; c=relaxed/simple;
	bh=1U69GIN6qnAoPSfvFkd/r7IF5OHmunVBW3inc4Y3Rc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSNxwgkqCYzHrOfPVcPjkhrHZa5u1WX+4VlH0+NlsyzreODLuFKRUtQXV13CTCDOnjnTZODCDQ8n34W54oUhxCrjYm2Quti6GlpIfICGR916XTh1wo6uI1M82jlyzFwJk5tM3mGwFWWGLoOWAIgH1QKqqQrOKZOQ6n2Mgboa7M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=geqD8E5B; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="geqD8E5B"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso9469155a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739222487; x=1739827287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ur8Y2RDidgzv399ZYRl0rKwDdGp/KVHGpz7jgUvSQY=;
        b=geqD8E5BW6Urd7H5Ym+cZ7AnWygkVmleAPUUCLf5VZ+MB8KdSY+Uyhm/Ykw3Lf44LF
         mKz5JeEZwJmAiCcOl0XsA75EvsbHYRZ8sgHsKR62GmYcFxYuFvwf0zjJxP0lMYH3+1WA
         S2jdwwKDSfEAzkwR5rrDkYC5D4SlTJlJH6h8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739222487; x=1739827287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ur8Y2RDidgzv399ZYRl0rKwDdGp/KVHGpz7jgUvSQY=;
        b=Z6bZZOVRqfDYhlFKWJVAUKlruwjG7gCg3BlNSxJbSB0MQQQReeTbL8UhWAT5Ew+ifh
         e0HpJSKjvQ95N1j09iriQk2V69Ipf1VycSYAULLvqm8WqKSjUqDU48BjJ3t6KM3e9lMH
         +JceykkwAIo4PjczuA2FX9H6+WEMjSOyZ7DtJwBn+O1BI611FhrImPHl/RupXqlQ/79n
         +jgxlhLycI45rHoBAmvmIYij3Zx700uNelrZhTVxiw9zzjMQxbr1JeObYIogzcLarc17
         C3wm/frpUjPcBvieHNjGL3Sl1wIiEXUiX1OQI90XBgvQaOaw1VaEKuF7JVjAEVNhU02T
         yO5A==
X-Forwarded-Encrypted: i=1; AJvYcCXmG+2OYbIdWFnZE97ok9Q5pT6N5toUmVPWuUwMstiVuXHxn8tOSO8Y+KIMVCH/Hxtnapqqeocq2m/HBEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YywOvwNyOoOb68QfKl8urykkJ97dSfQCUaNVejg0g75GK9VgqZW
	+BTSASWOErLfPjNONlsZ+8Jwt3NXcpBmfbMjsoY/eJNOzlVcNr59Kj9Kdj5Wiz1KftW/ZfhSaax
	/128=
X-Gm-Gg: ASbGnctajtTH0kq0PAPBMEmCIL9x12C00M2QvCT2328hC+nXVwHWpepimWZrMUqeleu
	J5p9uBY+xMsSj4FPTLtB0IBtxdD8hKuu/yHd78KAe9XuVyP0cga0bU50/XfkJ6UvcjY20lTa26W
	RVabV+ayHj62GhCJxKldeQM7oYZ3o26yw83ZUo55fqwLnnBsHQx4LmkKqPmwSV+eYmuA3aixE/z
	OxIHcQY7/OizVjKoAGHWV16PjHu4rs7Bpr/vscNiLw5EMOaFPEXxxIO5TOWP3tuxp9BFj8+g9W0
	fbqu0O4kGSehYeEzK0lQOVyRZuzmw1NaOkRGBlc1IOJMX8pl4zhDgppclR5Gs7G4Rw==
X-Google-Smtp-Source: AGHT+IHqZITm5By85HDleJYFz/u62u+Au3U33SpfhqwMcU/Oqdhqfh6eoGLXY5G5bYkgXN4E77Bhbg==
X-Received: by 2002:a17:907:868e:b0:ab7:9d30:3fea with SMTP id a640c23a62f3a-ab79d304cbdmr1270188166b.29.1739222486641;
        Mon, 10 Feb 2025 13:21:26 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78da1f953sm771152866b.59.2025.02.10.13.21.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 13:21:26 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab7a6758b7fso416243666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:21:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8NhxFBdavLduw+j7tiidDYAkH4P9a574O3rZVchhxekyng3dw1xINBscS9ouPG3ZBwGAB3LzaxdaRkvs=@vger.kernel.org
X-Received: by 2002:a17:907:7f08:b0:aae:fd36:f511 with SMTP id
 a640c23a62f3a-ab789d3431bmr1642178866b.47.1739222485565; Mon, 10 Feb 2025
 13:21:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210185905.116290-1-cel@kernel.org>
In-Reply-To: <20250210185905.116290-1-cel@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Feb 2025 13:21:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wimOy=E0bKyH99cL6H0+C-k4q_iZB45t56eSdQ+UM2umA@mail.gmail.com>
X-Gm-Features: AWEUYZnk7bMSa0BmCnMJslUX6eX3rst_B5BqTSQJA2g7L8qK79o-q0e4-ikc0H0
Message-ID: <CAHk-=wimOy=E0bKyH99cL6H0+C-k4q_iZB45t56eSdQ+UM2umA@mail.gmail.com>
Subject: Re: [GIT PULL] NFSD fixes for v6.14
To: cel@kernel.org
Cc: Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 10:59, <cel@kernel.org> wrote:
>
> Note that my GPG key expired a few days ago. I renewed it with no
> expiry and pushed it to pgp.mit.edu earlier today.

Thanks for the note. Can you send the update to kernel.org too, so
that the key repo there gets updated too? That tends to be my primary
way to get key updates, because the pgp keyservers are inevitably
flaky and unreliable as all heck, ie

  gpg: refreshing 1 key from hkp://pgp.mit.edu
  gpg: keyserver refresh failed: No keyserver available

and the pgp.mit.edu web interface seems to be broken too.

Anyway, I've done the pull, but this is just one reason I hate people
putting expiration dates on their keys: the key server infrastructure
has been so broken for years that it's just a pain.

              Linus
