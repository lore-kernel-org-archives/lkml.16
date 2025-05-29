Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66B1DC997;
	Thu, 29 May 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525108; cv=none; b=rnmPekVLUx7y/9e+rIA4VK84xJqsSCRDQPKH2s+c7TYGpAZHj5++LBE+9mJ23i1Roly+8GQxfKUr+EFvq68AGFBxEFe0ywydqYcSHlWK+3WbUJZ0fxHRRO3tKhd/ZI3Af6xSXXAqLZ+0OOMk3gujHMnIXXP6hHHbZKT6p96332I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525108; c=relaxed/simple;
	bh=SNBC/CW4BqGwUJUus9i0AbgvfWAY+4prT9ZBY6kNPMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsIimc4UzX3Wgl571sWMV+xC7JzeaKoqYVld4MG80Z3AxZZlQRYKIgnk/u7br2ekP+u0nr81P6x4A1v0xW9UmphmUbYOLBiWfFB0+yMcryaf/cUNxN8oyBwE5tPT85zzM1GppUzq1YiK4ZQCNlg+bQWNrwBGpHqubsf1cRw9gDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAGODEn4; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAGODEn4"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31232d5b1deso26705a91.3;
        Thu, 29 May 2025 06:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748525107; x=1749129907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNBC/CW4BqGwUJUus9i0AbgvfWAY+4prT9ZBY6kNPMQ=;
        b=WAGODEn4m9qryT2P/9cdGD5VBE+Mx+8sT67NDqRsTLGxIu6GZSIK62fC/sg6T4F+9w
         uXb3BuKGkWHIS3LqOvBEvF+Hi5/H54MZ0qjdNsdOqLRSKN1XF9QHXK8iMaBX2OSOZ3uS
         lS4Zka3e3GKMaQqi5XfsSRDr71p4BaQlpgxXtD0t/Ib7M3lHfzmdVG+YukeQ9BMm3cO8
         RgtDHvlCmWewyFmNaBuQ4tmLalnysPhze9jTcmHJGdkxIKCXBFeqB8wxgVtzegQ64d6T
         88/tLH6XIKQNO6nx4UG8bWBCn0C26Vjp3/Ge9LV9CHpQ734HXju0LhpnZmPn3ygGKWOv
         bKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525107; x=1749129907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNBC/CW4BqGwUJUus9i0AbgvfWAY+4prT9ZBY6kNPMQ=;
        b=biTVkA+9w0aJB7cogmqjp+k0kQmfE6XEKb8aeUG57pnd9PP5tCULusZVLOcrrRV8fp
         MvO0PBA4cf3aupFhFWC4dVn6lMQdYNNpk9rX4xX59/M0m5Myp4SbRoKDj3IG2VXQRBFq
         8tZLP4e5UIrwxgMfc/fEYvuoQpw5MIrteFYBX1AZ8ZCnTyy4XUHJfRF1ASR1HUw1nx6q
         FFOf2rrUGDb5JUYY04le39+dVcche1jbYpAuj+2yQTa+gchV+M04rkhDX8ubOeU4P0rm
         UMU5lVua4HCOEdc91SiW9nSufL6T0gMk4Kb6YV6m5OWfD9tszR1uv99Kdo2DPbojRRGE
         NYcg==
X-Forwarded-Encrypted: i=1; AJvYcCXOEQfHHHXTYB/UROvPY5DNSoak1qAz7bYvowSHC+ncffvi+5oX7Dv3w8sZYMbuoguRKPsEs3ki1JEMC+YRKKY=@vger.kernel.org, AJvYcCXUi0UUM11b0fawqluyEEUK0E1CXRyl8dbpigL3/GYsee1i2SYr7QEKqgjqFu5dUZTGSW2gxvKoQpwLsug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Zw4y/vnRk+yVIAEks4/jFgR5rlIsc+AuZOCR6tMagtK2meYs
	h3Iwf/KwJMI3uOe0qbP2otdmvWK7Jma0100T3lBmZgEUzwlMJUkiwbMWvhgwGhLtcPund3r9T0H
	SnC4P+BVUaHtPgcAASv97dcyLiUCBdHE=
X-Gm-Gg: ASbGnctZm0waDprIssVcLQg5yU234wCRevucg19x+ZaBNlitPDhj+AiVkOyjiTJNTtn
	WEqMaegZhNdj/fPM6o7MWOScQrE1ek/fwNJiFX6za7H5Xea+WGdK+5ZkoiIkOKy0N0jLHUmPsQk
	4V6ubZWsvtn+kiGB19hjFVEeTWrF8XWMCW
X-Google-Smtp-Source: AGHT+IFUGeQX+wqDeFHIerYJF6j/noSc3Hz+tFljHNob4fC+SSfoannFSCVYB5WFfpAYw5HdpNcbfQdLk2aM98wRGLE=
X-Received: by 2002:a17:90a:e7cd:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-311c5d93147mr5290976a91.5.1748525106633; Thu, 29 May 2025
 06:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
In-Reply-To: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 May 2025 15:24:52 +0200
X-Gm-Features: AX0GCFtlCPwO-6oVfk4_3NAdN4BXBfT--uFREchAbAOR3pNMYgJR7LRJIKFes4Q
Message-ID: <CANiq72mKAt0W_L2L8DX_xpTqxX9CVR_ZJA62C0VM40zF2qwCAg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: check type of `$ptr` in `container_of!`
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 3:11=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.
> Rename those placeholders for clarity.

I had a variation of v1 already applied locally, let me push and you
can take a look.

> +/// Helper for `container_of!`.
> +#[doc(hidden)]
> +pub fn assert_same_type<T>(_: T, _: T) {}

I meant to have a proper function, possibly "public" (not hidden I
mean). We can do that later, no worries.

Cheers,
Miguel
