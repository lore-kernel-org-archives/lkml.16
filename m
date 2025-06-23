Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D6D28EA;
	Mon, 23 Jun 2025 23:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720360; cv=none; b=tdO/Yx13ncR7dLtmgR2zouI0mtS7mWR7OSEb3D8W9AAkNOGPv58oIqKyEDHXoQvLCXjX5kxYLQbeVuXcRM32jKvLaXwbwKiKS1hEtiMp3ZsKFuqjCppfV9H9qSmaLfK6Int1ZZf9b+07hsHMppg2PA5A74OBs5hsx5QY18LZ/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720360; c=relaxed/simple;
	bh=aNWoeu1zB834q2KFOYZTpR+KMaUmmcdLYRD2637zLH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4+kEWyVtdRAhVBj6z25pa1NDBKxfVRb54os27OK5w7azAwbnKdvzNFHVAYu6lKsI25FZ8NuDDpUPoNt8MM1SfpuWR49xKBEovNAvDc6u3NZs6bZq5i5BIlvaNgrZADpaQp6ImcKnbXI84FrXNmAp9gp8XEpxt2mgAR6MzamzxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/PMzKKF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/PMzKKF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so526603a91.1;
        Mon, 23 Jun 2025 16:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750720356; x=1751325156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOalBEVqKnqh9F7ZdZFY1FWrGvR5UPymEPRKwXHEnPQ=;
        b=E/PMzKKFay8qPRU9P3HUbu74Kob9ahTyorY8wr3ioQKvnSBYSKCMfL+/o/5Vlv7JOf
         KV53un/iKwk97aPWNl9y7chugkZgnBC5Wzs/UfddZlMVSRijZB1xU6gIDnXlqUQci1xO
         qSumxFg0r4ttCUU+Y4RtL+qo3KkQFHnwvWFwnflSHC16BJ0K53nVHY7bAaJvtsKa8L6m
         hGbBo8clYqsR/bB75rVIqoiJh4FF9XmVuwBlU/MYgwa3ZOwkvk8dkFsHhsSvIezVgqjl
         Hf7DuG1jw4gyhgaLBM5oF3NkYFm495VXvJwsFHmwHECiYEucolVbn9AJtmREFMnH9NFH
         45lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750720356; x=1751325156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOalBEVqKnqh9F7ZdZFY1FWrGvR5UPymEPRKwXHEnPQ=;
        b=CYfQQ3L0M91fJk98lQn2VcpGQHeFAF+PNBqy0zSCSlix6BACA+F0roKCkbMOpjFoZX
         sW7Bzl8x8s5rDv018QyjrEum0qO+nxp187R5Q6wVj87LYw/MFXhk2fepRFOijNxk1r3N
         cHHG2ruIMw+3ZLqrkRHFZB+hJruRgjXZyHdYp00aCocRBSRPHdYPZW8aLfyPh/5EfWXC
         SWJncsSW3DmCSe+dmdQiBRd/+PxHy3jUwW5I5ni9As6iQswW6OhLb+IjRfMPC/60vVKk
         /gKMaANEx2GZM7OFu4hY2SfwjHgHb09GfqrbxbEicZAqhXww/+fldD+Tc7Waxd+cVRtB
         3ARg==
X-Forwarded-Encrypted: i=1; AJvYcCWsOvTsXbm+gHsnN/VFDk7UmPMOyfQDiMgV/2pPDbbh/egYNc3ADRFB49qKEslO9EpHNPIXkGMFe8IIX8Xuccs=@vger.kernel.org, AJvYcCXDjruQwWSaZSEM7+P5aVrHpkfUjyni7Vk3KPunRCt/BrOQ0zetYkWsQ4AWC+xHvtMTvvfqtdCd/B1mbxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxeYisDBHMlbUNPkb0lFO2146bpQSBmgZweX0Pqo56TUJSceMT
	Kp35mQ/sYNakIzxwuo6UePNsxdLTUBfd/kZNhK4jrREuGmRY58161f8/ldVxxeodc0MQQaii1p4
	Kx7nYRIjOKv8a0ZQ2nzcE/b4mlJkh8pA=
X-Gm-Gg: ASbGnctFsi0e+Jqj9BBmxNKc0rEgHs91YOwMscEZFWdhiGEgRqaf/S9iKRUL+6E99t4
	HbbPgx01220caehMB15LnopV+NFR8Pe2XRdF4+XSn0iTohcX59K2t28N8k6Xqv+weBHBw25TDbA
	R6H+KxXdfoiR5eA3IHTo55G05JYspZHNKYlT4L9Yc78u0=
X-Google-Smtp-Source: AGHT+IGyBQ7PcADwbU/9C2eABH7KUWf08Zjan02P6GjXDmg6hM0oV60TrjaV4ox9XGBwdmd2xgcZjIcYajKGT9gh+sg=
X-Received: by 2002:a17:90b:5828:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-3159d8dfcfemr7401096a91.6.1750720355726; Mon, 23 Jun 2025
 16:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>
In-Reply-To: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Jun 2025 01:12:23 +0200
X-Gm-Features: Ac12FXwqGfb43JWuAmXDBOkKcH5MjYNIA6-Mh-xsVFrnR6i4Pz6p9gDlBfvtZR0
Message-ID: <CANiq72mhz9iXGTPbVmKdD1Lpf7wq5abpB0KkiAL-2zUAa24s_w@mail.gmail.com>
Subject: Re: [PATCH v2] rust/list: replace unwrap() with ? in doctest examples
To: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 10:52=E2=80=AFPM Albin Babu Varghese
<albinbabuvarghese20@gmail.com> wrote:
>
> Using `unwrap()` in kernel doctests can cause panics on error and may
> give newcomers the mistaken impression that panicking is acceptable
> in kernel code.
>
> Replace all `.unwrap()` calls in `kernel::list`
> examples with `.ok_or(EINVAL)?` so that errors are properly propagated.
>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1164
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1164
> Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>

Applied to `rust-next` -- thanks everyone!

    [ Reworded slightly. - Miguel ]

Cheers,
Miguel
