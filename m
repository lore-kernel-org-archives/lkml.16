Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3331E04AE;
	Fri,  7 Feb 2025 12:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930760; cv=none; b=fa3T0YVzhVbZornjQ7TfyTCBlPFY8v8tLdp4UgM5239nu41c/5H0QhbLAgWzumS+D0vSvjW2qpy+peNPq26sjLP6IE30R2LSr7rjbnitX8gPktDhxysCRYiSE1ZT8uBB4J6J5ZqEvEKumsKJdNltFLuy4RKqY/fro6hk6sKcslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930760; c=relaxed/simple;
	bh=oDwmjypt8/G6DWzsb+Ic2fOcU6ddc9XqAgb0jGDaN50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hPghhj+/zqbXy1kQ00CHHIh3znqpi0W5feq14c5zkykRQxTHHeMOj+1P+zWqeT/d8gi5io4acwT8/j10+k6sCLcP9bBJISLNysGfEZzBz3ex2YACnBB4aBEQHsWNWpYL314cGqHw5WFad7gRc2AcPpIwbqMXLoL8tBMDoKw4OdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOfuzZ5d; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOfuzZ5d"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa122f62b5so340376a91.3;
        Fri, 07 Feb 2025 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738930758; x=1739535558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDwmjypt8/G6DWzsb+Ic2fOcU6ddc9XqAgb0jGDaN50=;
        b=GOfuzZ5d7mEUcWOx6bm2Y/YoZhPDsfVTwjS+pkEieitNzmFhuVuqch991NFrUIHHte
         PXUBC4j1r78WliRIZHf0LfhRkaP0hmaRVIciWd+UIJymvXjpGGs6YvaYiODvebyeQFa0
         rvyS/Hk9RHPVuCwSQO8VWAklwEJyfmE2b3u0KzIQzHlVcVozzy0d9NMVIqcbO0/kRUvR
         onLiU8iupNezZhIU6zIF2cJK0GJRndWZ4KtAXJZOg9YpzUpvUH5a+RYhMZkS9wS3n+AH
         l/2NE1Jn6P5siSVS9rVc//sCvOuSeEXEReaCY+5S0JaDgHoEsTKubBRcf/GM3ZT3GCmM
         sv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738930758; x=1739535558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDwmjypt8/G6DWzsb+Ic2fOcU6ddc9XqAgb0jGDaN50=;
        b=XjjEYjkWFYRb53xJVcRd+gMjwgPJE9tjPj5wj97sjKeri2Lu7yxE+KSnlYf3RChHvE
         It9zNH5Ji28nrRnoVSXlXCMPji6xb20HUoeLIq9SG6vWyO0txz3TXR3D6Rheb0eGR8ux
         vA8RDPc0Ddu1zX+Er6FAhJPKzFDy4G0yYUTDSgLog5TwIBdgrKIsIvJBr8a3ziEtVdZy
         zNU/iUjNNxi4QDzdaYHQh+LQLdc0GuZ5G6gOHX5pqBG+9wGJgh+scbsVEaWkkFrwUTXM
         6l0crVVBz11hKTX9ey7L5jOvv44EFKCPSoxa50o2QlSYV7v8OqsqeFxja+Xg5nj6O/M/
         hejw==
X-Forwarded-Encrypted: i=1; AJvYcCV4efwJpauv0B7VFQazmvailql7Yl6VLyxzdC1LkTER2W/IcJNrlLcWEYavl2S7MOpuW2tIKzLnZDsgjPIpNY4=@vger.kernel.org, AJvYcCVpdVBDC9z9njofsUvrNdx+5CzWT5DIIqmvEAyCtMpYUSfY6y+24SdBK26hotRcZOvwGstoLsnMDjiVGlk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwo/LNyYeckjejnPQJlrYSzUpw6HO3VFui1MqqI9BfXUo7NlGn
	JsldnyotlwzbI+Bwg4EfuWA8nH8kfYKwsRshYoBgDVwUN8ylfRjev2mE5Ow9d0Zjq63qlVzZ4Vc
	kD3JNYSE+pURIQD/lJxoPuhy3v6k=
X-Gm-Gg: ASbGncuMbvSipKmzWuUUOVeVMKf/G6Hd3aHOLeCgLtFx47e4b7jTAMZJXVOL921oQtJ
	wD2OEAMpS4y5jPEuEe1pTuOLwVAD+5OF9XRQbB0+Xb4ok4fKbw7vyMTP0ezkbFxHZN0VqXiAn
X-Google-Smtp-Source: AGHT+IFkNnQhokYL4R1tAFkCPTJBGfOs+kfO+CfhEhcWR3WujUHlCLaheoFzIor7FdQwpA8Wy95zSOkgf3PXLHL+4tA=
X-Received: by 2002:a17:90b:3844:b0:2ee:6d73:7ae6 with SMTP id
 98e67ed59e1d1-2fa2455914cmr1706312a91.7.1738930758009; Fri, 07 Feb 2025
 04:19:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-aligned-alloc-v3-1-0cbc0ab0306d@gmail.com>
 <Z6UwCtaO-qVYEN2Z@cassiopeiae> <CAJ-ks9kvrBBLTnEmRPbrkoHYgg6wrXoTVXh8ecqYBSPTfpjx2g@mail.gmail.com>
In-Reply-To: <CAJ-ks9kvrBBLTnEmRPbrkoHYgg6wrXoTVXh8ecqYBSPTfpjx2g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Feb 2025 13:19:04 +0100
X-Gm-Features: AWEUYZlJUi-5tupzy-7IWx-TvdGH6k6ZORV0lBRzfg6ZrCg-hLR9RW2vOKIIxzw
Message-ID: <CANiq72=P3O5Q=S4JBVGY0B0t5xSfMYGu3YbhT6SQmbVcAkEA8A@mail.gmail.com>
Subject: Re: [PATCH v3] rust: allocator_test: use `posix_memalign`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alejandro Colomar <alx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 12:43=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> I'm happy to wait for clarification, I'm just not sure whose court the
> ball is in.

Ideally Alejandro would clarify, who I Cc'd in the previous thread (he
was not Cc'd here, by the way).

Anyway, I agree with Danilo that we shouldn't overcomplicate just for
this. Using the previous patch, but being clear about that we are
using stricter requirements so that it works on macOS too, should be
fine I think. But I trust Danilo to decide which approach is best for
maintaining this.

Cheers,
Miguel
