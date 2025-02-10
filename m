Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86452580D6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205030; cv=none; b=H6QOplxeWaJrzaIBxe1+x/K+9Pxt5t/UNl+gdCj0EK8hz/YdBfWNFu9zJ+PI/6XoI54Sv4CLTHfAWpUD7CKoaY0p/fxOfNaXD7nyYDengliIQ/sdGOzHXcjamgS1L/39PoqLGGiYUIKXkqetfa7ExA0whZApu59T+tuf9Wpdbko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205030; c=relaxed/simple;
	bh=FZK2RdN1Jl4Sm3VXjk6M+lzSSnDzvxADPxzKKhy+bag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYQL4mOfVXE7KnOChksEWH+upy+d1wnSjGcAAMhoi+8vL9wklF48Fg1r18TPM/R8jiT8R7JW703cyJaUe9xYwKUWCfkR9GWCJ9udtE4VmcZtnvo2zs654pm+dDO7snmygrMzofGVWIN7iUUlUByRgUxMooG5Lhu1F26HhxOMqUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bkg2oSue; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bkg2oSue"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-308edbc368cso12105711fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739205027; x=1739809827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdUVu0dcxly4vbZP3Qlon6lZSX6w+e5X22dhkvb+tew=;
        b=Bkg2oSueEubmHAp2h/iGzhCrYp2M+dAyyHYk77CuoxpxOs5TQpX3yRbEvBPWdtCg/f
         VQ2iXq81G3LfPNFv3QAT9lEJIx257fL4s7sxnxwpsimIdu+l3S9ek1C6pqkFkPhdZwpm
         kxKl09VwXa8eHm/+4CdGN0HZD4ku8jB5plFxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205027; x=1739809827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdUVu0dcxly4vbZP3Qlon6lZSX6w+e5X22dhkvb+tew=;
        b=JBo+aYIZsRoK9ygaqRpm0g0wQHwEB+Dj40L4SXat4lAJ8V2JoMQFINKIHdTjWt9xvP
         PIYE+X4ujG1Yx34t/cRYOvJ7vqOC8/jnmmFv3BZvGp6RYL4L2R1ynWPxk7n9vh6S1Xx8
         sh94eNvdKoeiANJgMYRNEWY/nUFi/U92bybzFlbkIQwTm8aG4fFFKPYm8dupa/YOqJ0z
         lfMi6aQReVMjYjoPMtRhZQMZIKSXxlHy9JEzYeBwzuLB7zEj7bqoWCm8bKOoATV1rAZ0
         VaylKfKPZwzlVxaheEULdVyyEZFKDMotovh3Xie6KF14DJkF8MF5f0Aj1bHPNiuf9BRj
         rSpw==
X-Forwarded-Encrypted: i=1; AJvYcCVwvSu4Qk85JTlqubyrD23DaCnIOelRpQH6bUQ2SD2frXKhq+ENFfg/MxVbzuPcZo9txItogGE7ZGE2mxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3CEVj5vFhssLkFS7u/FF3dJp6fHwjMY2w4zhPmCQby+5Umz3N
	cTkM6A/xWeNgtc72dLR8hH0jfRqy5IKsakGhCfvrlOC7KVYoA17NXWD/1/RmhD1q4ZvZfU+x/Nu
	3XQ==
X-Gm-Gg: ASbGncvtHbxMvzgGgGEFV2hG4TcuEld8u7Db0x7HbwVz9POFft/qml8WM4Wjh7/tpcY
	bbzYlPxDR7GK7MWUyiXBkGPSvEXzkiG5/UZm3NztS/o6WX9ko4qS9i91Hr+sRb7xLkSFUvfSn1G
	XRVCG4S2k7szqSsW+OHWrzAykiCr2MOoMMAv1G9wBEcj4inSaYAIXQT+F1ZLgwier61nZxw2LN5
	FDCFh7EGs13BAHbqegaXCDDNPKyjHDbmXrMuEQNuesPlhrTQ3tccCbQjc9Efissr/drjqLSWtrZ
	02AjyTqG2aNMjbnOk1KU9N2QFmWfbxqUedPBIty6ZHeSym0OmGdQld8=
X-Google-Smtp-Source: AGHT+IHM8yzpd1vcWcCpIUhRc9WpwRiH3qKgXk7FpW8KK2Mmah7z0avBpn1fk1Spz91QS2lkUxU/FQ==
X-Received: by 2002:a2e:a9a0:0:b0:2ff:c3a2:f408 with SMTP id 38308e7fff4ca-308f835967amr2260611fa.12.1739205026686;
        Mon, 10 Feb 2025 08:30:26 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308f6d148f4sm993551fa.97.2025.02.10.08.30.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:30:26 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-545097ff67cso1516378e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:30:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULyLxRoKtF+fVtjQqUQ6HEKvALoQ+f19wL9YNCnqYmlkvNj4oxIPnKvJAFgqdWfaBmuJVKY2LO9BWk32Q=@vger.kernel.org
X-Received: by 2002:a05:6512:3190:b0:545:c5f:8551 with SMTP id
 2adb3069b0e04-5451186f17amr138772e87.35.1739205024931; Mon, 10 Feb 2025
 08:30:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204054741.GB1219827@lichtman.org>
In-Reply-To: <20250204054741.GB1219827@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 08:30:13 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UCiGuwuVatoviUvYPeBFkfiWm+oWaiQRG_1U-j6LGGGA@mail.gmail.com>
X-Gm-Features: AWEUYZn85rAuQRw1g6-QmTQkE-eAMlrK1NxFvsPsHDW32v7yV2tRQrsa76Sqsy0
Message-ID: <CAD=FV=UCiGuwuVatoviUvYPeBFkfiWm+oWaiQRG_1U-j6LGGGA@mail.gmail.com>
Subject: Re: [PATCH v2] kdb: remove usage of static environment buffer
To: Nir Lichtman <nir@lichtman.org>
Cc: jason.wessel@windriver.com, danielt@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 3, 2025 at 9:47=E2=80=AFPM Nir Lichtman <nir@lichtman.org> wrot=
e:
>
> Problem: The set environment variable logic uses a static "heap" like
> buffer to store the values of the variables, and they are never freed,
> on top of that this is redundant since the kernel supplies allocation
> facilities which are even used also in this file.
>
> Solution: Remove the weird static buffer logic and use kmalloc instead,
> call kfree when overriding an existing variable.
>
> Signed-off-by: Nir Lichtman <nir@lichtman.org>
> ---
>
> v2: Fixes following Doug's CR - use kmalloc_const instead of kmalloc &
> rm redundant print in case of allocation error
>
>  include/linux/kdb.h         |  2 +-
>  kernel/debug/kdb/kdb_main.c | 48 +++++++------------------------------
>  2 files changed, 9 insertions(+), 41 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
