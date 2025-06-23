Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9761167DB7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750653460; cv=none; b=ZB33DH0PQtb5Z+RiTpsE9EFaA8UvdsNQ26+gA8Tq/gvvP7aQ4vxqV6CPzTrH5Mwa6y54p0vLTnGSEeZOCEhtQu6jG00gSXHsx8vSK4+uUnatILRNvI7CU1NWEqrkYr/V05M5ErcB29HJVnS0RS0qdMuUnELFITnDlLXQ5SqE9gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750653460; c=relaxed/simple;
	bh=cOgznIXCgLqysLpet9MFHyoHFN7Avabq0Wy0lJFm8mA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CWiyYJWW8owdnIRNXAKKpp6rMP7CGBGuaYUDY6KWvnFrh3dz8YdcL+zMT6+MXPXwpP+f1RZYmgAW5H2Qkk4nMzVwJ0lWjaYgBq+eLNbU8y5BOaVv18oi21KOWYKSXH7wbas5usdzN4yqQvy+wcjVQg+YPj7PW6Iv4s7t7L0TweA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sa27DMsR; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sa27DMsR"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b31befde0a0so2257465a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750653458; x=1751258258; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KP8Igk+q7fY8VDRXUq4VehJo2gUDi58j+pU+41ri3k=;
        b=Sa27DMsRPM+MEYt6f6XAGRf4jHJsa2u9ZSsXVswfw0P50mYDPXmvdQuRYX8ip73fLj
         AbleuZhXTFBmYU4VajRU3viAw5uDoXqEcmoe1Fir3xjkALSWsCSI0S0ByDPxcE5MKrlN
         M28sOY5aSPpNmgAQaE9dkjKuIJHFwwMdsF/uvHKW0fRmxOYPRJurPxMTWuWaASRmYMwl
         I9EX6TyplcRETzopWM4RLwVNtFEvxTw4xTBdMoBC8vxA9ZpayBeAxmqy1TQM70MKfuZY
         0HjPZeeMxMJjQHDrFY8ZfqXVj/NHxkuSzWRAKi9V0KLuOXvnEBdNxyOFb1QakDmcwT6g
         ULqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750653458; x=1751258258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KP8Igk+q7fY8VDRXUq4VehJo2gUDi58j+pU+41ri3k=;
        b=NX8TaootdpUX4d6DJdtSNU3rNFbnAiXJQyZFmvCcV5ySCw2+YhCanF+eTzTuIz+UY5
         42ve3Z1I1OyefqK84U9DZDrKBoSmsZPL2WG5e5w2M2oqQfHCIqYtnnE2nY0Cu4AK29Om
         YN68tTaeAJWlR/cS9ne4c2eF5JQrg47FNZ5JWWvEI9glnVMq1Fp+FOvn7hkpwTSqSxfP
         Zq3RczWGCkvXBoler+b21EEwwyX922tpWddlePaf8yR7vsknNxdTHltViSanW9ynjcoK
         7ggJf7/7oDsrElGnBZDIU2RufkrPG070vidts4GgZcwwaDh2o86xjEHhSAQSN3GrmX0X
         Q7IA==
X-Forwarded-Encrypted: i=1; AJvYcCX8CbP7o0SfGBuEbN27i2VfO2VuXkMDgJl5se8xFIR9mTDGRVGUE8WGWwlkt29Nub7Hnl9OnlidWwVs87k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vs8ll6v5Pg53REzEfdHdM4zYyLxJo6OahoPzIK88bgIERWCK
	/jgp9uaiXRDJyIeT+Cm6cYEQGXLBPkECtK5iHMA05TKYdE6M5VOozoJ0/S/hoK8sjB9i9vi0mX1
	w9COi18NxTrmYID5VKOki8Gd7TBBvkvmiFLU3oEZ3
X-Gm-Gg: ASbGncv9XK/9NJjb7fqW0++7OjWmrsjMOvkyOT7t+kqk0ybgfa6nPd6z9PwHyElrov0
	vPTJbmr1oHCwV6NFjL+vXM8GDkukXxZI6LmBvwcVWFLBB77sPh7Hl/Fy13hR6ivepdXaa6QnZgy
	4QOXX4TFlTw2l+0iRyxFfwFHvluIFVLUzpx7XMD5i3B8ci9QVrludpWzxHZDh03VtwC0NJAHIPj
	Q==
X-Google-Smtp-Source: AGHT+IG7ZR4RTzfI4eW8Wk5suo+PlmHanj0uoAne2qj/e1iSLFamgW/9NahlQ2mX74j1k5jk+ZtdqMODh/hZ0db4g8M=
X-Received: by 2002:a17:90b:278a:b0:311:e4ff:1810 with SMTP id
 98e67ed59e1d1-3159d6260b8mr17347635a91.3.1750653457880; Sun, 22 Jun 2025
 21:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620054757.1006729-1-naoyatezuka@chromium.org> <aFjD-D45LkBH_gnA@google.com>
In-Reply-To: <aFjD-D45LkBH_gnA@google.com>
From: Naoya Tezuka <naoyatezuka@google.com>
Date: Mon, 23 Jun 2025 13:37:26 +0900
X-Gm-Features: AX0GCFuUkLtpz_jSkZCwgozBAPpiL6gVnuxlDzYa0ZunBfSYveHWg_ajz6zzwro
Message-ID: <CAHYWnBHLhOU+CJC9ViYCntSkercz4hHVnzaeEBeqchKLz7XFNA@mail.gmail.com>
Subject: Re: [PATCH] pstore/ram: Validate ECC parameters against Reed-Solomon constraint
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Naoya Tezuka <naoyatezuka@chromium.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi and others,

I truly appreciate your time and feedback on my patch.

On Mon, Jun 23, 2025 at 12:03=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Fri, Jun 20, 2025 at 02:47:57PM +0900, Naoya Tezuka wrote:
> > The Reed-Solomon library enforces the constraint `n <=3D 2^m - 1` via a
> > BUG_ON(), where `n` is `block_size + ecc_size` and `m` is `symsize` for
>   ^^^^^^^^
> Better to provide a link, e.g. [1].
>
> [1]: https://elixir.bootlin.com/linux/v6.15/source/lib/reed_solomon/decod=
e_rs.c#L43

You're right, I'll add that link to this `BUG_ON()` in the v2 patch.

>
> > the pstore RAM backend. A driver providing invalid parameters can trigg=
er
> > this, leading to a kernel panic. For more details on the theory behind:
> > https://www.cs.cmu.edu/~guyb/realworld/reedsolomon/reed_solomon_codes.h=
tml
> >
> > This issue was discovered during develop chromeos_pstore driver:
>
> s/develop/developing/.

Thank you for pointing this out. I'll fix the typo in the v2 patch.

Best regards,
Naoya Tezuka
