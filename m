Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E29212B3D;
	Wed,  5 Feb 2025 02:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738723290; cv=none; b=fqY43a+4ClEFPlXisi/4BcpELrokOK1sqTSaMJMLbDFuOmd4l9zpm1cXtXx/Iw8Bg3Vhkh/22FsbgAxGtI8UCHBUGJmAHTcvCbX9qp5uPHfg9Iii17m1cCSraHgUVwZnPJOtOGYXmXH/mSaCHNSUnCG6WoDrOeMAyTUcsA7ChF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738723290; c=relaxed/simple;
	bh=QwQn3prrCd9nf+gWzBIeH8P3iezKUf5V2n1S7gTfQSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elpvCU9BQ8/ka0FMFlG4NR2l9oyv197EPhWLWIULVUcsrCVK6FaIQb7WfLiSO9YwIwyPeG3NUvAuU91ZSSsjPcq36VmlGH7rOICfUFyCe9DA4tnEjloERmiRWo1kY/OcH05LZnOA0ZyUGp5QqwVhZQmrJpwAgSjqJg5yQzQfwms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIBdsi58; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIBdsi58"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-721d213e2aeso1713374a34.3;
        Tue, 04 Feb 2025 18:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738723287; x=1739328087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwQn3prrCd9nf+gWzBIeH8P3iezKUf5V2n1S7gTfQSo=;
        b=NIBdsi58IV4FlappQPZk+g6zaq+GdCm2+Gzq7SSZOYhPioNTcbIRtP1oif6F3qCmgV
         eueY5xv8DnTTZP1bTcBdlX8KwO9XrkIFPnT6+vt5387LGBpJljxzOk8jNxq8YnFz/1hB
         4Du+LATndSz5+Zhy1wwwuhjWTE5jzJHaeeAMpaQruPWo21lagCt8Bg9VCtYqbFsqDiSf
         fYEuGQRLU8/icrbJ2Sl775limcZG2w/sj3pnym1+HJCmr/Hboes9JZv0a9Gb9K3XozoQ
         hUIBEq3u8pRQIa9weP8zguQFMsn4JkX+s5enN1YPO2okzO5BznQQNV1ATv6WxdQVJ5gO
         c4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738723287; x=1739328087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwQn3prrCd9nf+gWzBIeH8P3iezKUf5V2n1S7gTfQSo=;
        b=bMzRhDvDHT8V7hGCortQ7L55zSU5IaOO51P750YQx3WfGXc2x9VSjKDHL8RFL8BT2A
         pfZ7nrdgq3hscO1dCoSkhUwdzel+OWHrwwMHK+fEg4yRoB/JqxUTUdfnqghMlweeNtKN
         wz3VYXFNGCVC7G1t6LwJLxD9V8HhtJ22Tx+tRIW4vRe0mkrOVq90Z+wajGIY0MOActdW
         kerrpd8E8wenHqDFTMXUVXucE2ntKnDBi/NTEP8uEHo+BKQCC2EAAK+E4F6fMf2fGJQV
         Gu2bOsqpQayWt2uev6uzraQdw8YxF+U552U1dYyqjLQiM80RHqTpFdk24i/+2JiN/dSY
         FBsA==
X-Forwarded-Encrypted: i=1; AJvYcCULKxXNZT/dXryADPir4rbZbbu35X+O3S2YuOZUHDU1U3DvpZrt4H8SYc/9Q4O83yk5frWvCXxrSgBZ8dDMDdM=@vger.kernel.org, AJvYcCVVFfqYv1K7rjWLEDVmV03qzAWtd8vjQz9ncBhOFziBp0bVGrA3HsS9i8Tc21qGJ0H6+w5SlHSrniCx9lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPPEBdk800JtRZN9VHj6nOL/lU+/uNZp5dcx3gW84RE7z5dqCc
	pK8eReY77hKQeC7OHReSqy0rjM6gChye9zLEVWgkrUp2QWTr4SW3zzW1ir25oKP9+PWG67ZZUCq
	sJ27u4PjYmNh+//GlALGx+mbxz6I=
X-Gm-Gg: ASbGncvZXjKqZhCjXRum9WuPs0vXRXueAu4hYkdmFuP9mXsi+tcfOTv2Um7OAhvoU50
	nodmubxjOCNeMRnSQwaNyRjhFoOWY/CQdXWwzi7m3yjki1Pq8y3J9bcq+GHAW0BEVQziLWxNPIQ
	==
X-Google-Smtp-Source: AGHT+IETE5RM6ytR4I0MAoaOcUYN/nT4zaRWwsSaMUFzY7MuCNXhcUa43uNFxmzefRwg1gzObIY0smWMYi3lZSbjz34=
X-Received: by 2002:a05:6830:390f:b0:71f:c1df:187e with SMTP id
 46e09a7af769-726a428f697mr1007784a34.27.1738723287529; Tue, 04 Feb 2025
 18:41:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com> <CAEmX-ZUbPqNUBj2-xAf=5uGE_GWAQQ79akADZCDxNsmx7Lf9VQ@mail.gmail.com>
In-Reply-To: <CAEmX-ZUbPqNUBj2-xAf=5uGE_GWAQQ79akADZCDxNsmx7Lf9VQ@mail.gmail.com>
From: Thomas Hampton <thomas.j.hampton@gmail.com>
Date: Tue, 4 Feb 2025 20:41:16 -0600
X-Gm-Features: AWEUYZnrN-ey9XldwNfEx9_sBu9MokwgLKnIwcLv6TBhp-pMZofzcBpx-zH6lCs
Message-ID: <CAEmX-ZXg0w3RHN7hYe4bFOcg9srNapQU18JjTAWbBjwWurNC4g@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Valentin Obst <kernel@valentinobst.de>, open list <linux-kernel@vger.kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 10:54=E2=80=AFAM Thomas Hampton
<thomas.j.hampton@gmail.com> wrote:
>
On second thought, this wouldn't prevent the construction of a closure
that simply extracts the pointer itself, nevermind.
