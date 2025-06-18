Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F29F1B0437;
	Wed, 18 Jun 2025 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227594; cv=none; b=MUHFo3AaT9x2ySgqusb+LnvduOlFkN434KepqpCyOh30vx5KQP2WIOuTouBZ1Y6156zfOROSyiDGjvQMN3Wy451Gl+r6YX+pVtGkWYtNUUdIYgEC1G/yIFSIeRZC5xDQq27e9qyJCPm3kGT+JZV5IQpuUfY00wCAst6ImxSjOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227594; c=relaxed/simple;
	bh=ptnwGTzj6YMKatvrZaLaa4y9ij+xS18u0yM5DI6DxQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eF7SupjfD6JJ51zfnZT24nL0lHwGKJtDfjvPkJiTNETmrTasvi4VXTtXfkmgktZpm6ikk/W1O0H3mT6XATDX+QM8onZYku+BACWgMcVmn36qoGvxdcYolo9cpVGF9q/qbzx0JH645oszqKAs2nzyKBHpPAdwAA14Bdtm9DA/avM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAI+v5uI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAI+v5uI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2355360ea88so8361345ad.2;
        Tue, 17 Jun 2025 23:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750227592; x=1750832392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptnwGTzj6YMKatvrZaLaa4y9ij+xS18u0yM5DI6DxQY=;
        b=EAI+v5uI7Gc0leeysixCbGtzLB51TjG5weGbK8DgkJv/jzOSIooM4sj/LJJn7gLFQx
         v6/WekQRqwQ6cxLys98UnfzQKi3g/ji3BM0DPFkZJ2iQBjR0d1+hhg87l5aGpZq3aL/7
         47OQEiyS4+sUPPvJFI6xWkktkIFZqsWtuTNZIVYtea5nWn8waivLPN+0vxxEHkuTfu7b
         RJbtZy3+UsTmvicZbFu5HvE1wh2q8RjoUQFUxwvjDdKWORKUnuC+BWcinck0WDIasF34
         tfRTG75RuHqdM8JDLhvIQA1stin0mdPc3X4CQ6n9F/EpK6XRkqAEqQ4XT9sMYTcbHqCf
         /EnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750227592; x=1750832392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptnwGTzj6YMKatvrZaLaa4y9ij+xS18u0yM5DI6DxQY=;
        b=jqzx4idd8sANWLzmqU3w3yRYuOA/NmoGhvj7UHhCzYfDoulUvsBFKyivmi0ok4cMHb
         ryczP8hqL0busj+tyaJontFuCRNXZEFzjNXtrURSHpZf4SlXO5Mk0lg7B/nwHPCfW3cn
         JRpCEUZ/5arIo0Va+enV3sP0Y2kHCENGau+60k+EhoT/rjNVRRQJySLXNUVEx0cBDMK3
         ueb58aWL1pSbbvnA159ZrTwqB5e8ePhHA9ffnjiNKUwabzwZ+nK3soqjJ1zu4LIQqy3t
         dxSufLsEdJNyNsPwxAwo3d/CaxHA0K62O5LgK1uaUk5vjPmIpyIvnKvyp6wDbtM9Vl2d
         qzYA==
X-Forwarded-Encrypted: i=1; AJvYcCUXYregCExWBO3ph0MNtkRC4L3wbP9M6Ir2P2ay/5lSZYA+K6FlKpqlF0YWaUsBUJgLc8hP9y31R4n+mmbKxGU=@vger.kernel.org, AJvYcCXEKO7UpRXeDFbflk52Yprc9yzgsQLII9Pk4N6A/9coqYuppEEFw9YMtq7XwI2SFfnfZ373UsdJRFehBI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2PZXX0YPjh95uYf7YdKSpis+QvxqjkECz+xA8lsDT2nilVmei
	RyFxvz1INVffNR2UvIu1cbqLIT9nLqWMSwLVtAOzra5OtgXrqNhgZcORnWuXm2nzOoAAKQIQwpU
	Z8qP+SgtnRD9yDBVbn7AYTkbCdbQYruI=
X-Gm-Gg: ASbGncufvYgrHMbOKzDZM4ibTQ6Rmwd+ipY38nJmqpraoM91crtMTAL7xLtlUyI2482
	rwIBzZJOtp7WklgNms62Vy34N0WMjBfVCMmBpVeZ3rR+uQac9J01xX3pDkjYZa8NXnGWtb6jxob
	0r1OEGCxjPIsY/aN9Bb2cR80mz1Uo6JgIPAMwOsRGOmgc=
X-Google-Smtp-Source: AGHT+IFtnzX76bEKEbc2BXmLJccO2YsNEFGrLZRb7gLGYgWEKWunrctKo3sA+VxN8wWlXqDc4/YJ4oKSqaG76xV8EU4=
X-Received: by 2002:a17:902:c404:b0:234:f4a3:f73e with SMTP id
 d9443c01a7336-2366b1489fbmr84870505ad.9.1750227592465; Tue, 17 Jun 2025
 23:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617140032.1133337-2-guillaume1.gomez@gmail.com> <202506181334.f0STx6ta-lkp@intel.com>
In-Reply-To: <202506181334.f0STx6ta-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 08:19:40 +0200
X-Gm-Features: Ac12FXzEAYg6BwKSfXUGSw7sGa50QSsZn7SaLIMHw1acT4CRUVbCTxzzVjN85hc
Message-ID: <CANiq72ksZwH7GZKAjk=7FN2npWou+T-0pkbOF+fm6hVHdQtNZA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Use new `--output-format=doctest` rustdoc command
 line flag to improve doctest handling
To: kernel test robot <lkp@intel.com>
Cc: Guillaume Gomez <guillaume1.gomez@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 7:51=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> kernel test robot noticed the following build errors:

It is just `rustfmt`, so no need to send a new version just for this.

By the way, from a quick look, it indeed looks like with this now we
can finally avoid relying on implementation details on the kernel
side, so this is great, thanks!

Cheers,
Miguel
