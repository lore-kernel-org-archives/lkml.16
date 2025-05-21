Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F2327C14E;
	Wed, 21 May 2025 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834127; cv=none; b=Bu+B3o0MdtJbc0sNqZcEtjgTm4pqUET5F3gu3a39PfdhazPRk5V+1zPe/r8u4JtHvjYDltuHymt27/DLXpBoAju4LmL0Urocb768lR2ZJqRsSkKgf6fNku6OVQa8LpcOFZJLWdJdH3GkfXVJeMZnng0N18hUE4Jx1tf7ECHAE9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834127; c=relaxed/simple;
	bh=9jjkqdyYw49qjSuk0tVdxsGTONi8xGs2N9wC5Gwi2KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5TVt9JQIOJSdhvpKKqO1hhGLCRyb1opBtpAGZBu3ktyUWIEuZA0Lh+/PUWgpq6awUchZIs4m8tPDYCtkAU5eSh01ur0haG6I7wyyIIjiAShg6/8tgjvBgmkn1/PadcfcBAx6+1XSb+UUJoG79XXPYjVJRP4yYJfQvUu67HGZk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkXfhZnS; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkXfhZnS"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6049acb776bso3557958eaf.3;
        Wed, 21 May 2025 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747834123; x=1748438923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vp47jDk9EdbNa/22Vb4r2YNTMUCPmM+xIbcDxwo1z94=;
        b=TkXfhZnSB6WGjC50wA6J7SvbztNX5WKbrsxIV0LcAgMobwThAyQYyycc5zEG6zNUAy
         1O+G+3eyFmAYOP0ZGiHJh/fcRQvWuS1croqZtNpFBUTt7367AdTz5I+ULlzF3mTHqyeG
         nIOLY/hJVW1mKIdLQODUf5nC63BvZ01yQA2KcVtd38ROmzPoM3v9Xcfti11lVX70fgSD
         D8UmwCsnYqvyt1+TPGX1j8HbH/N0QSOR7eCtEGZRmYSlg6oMZk+nmvMpqmysA1iJMEe5
         x/aaOIIteTcx1nHC8lfs4xrm/m/9IRf+lyY55rw56l+DcI72tfMMryxyxMPAcBDwjmLu
         NBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834123; x=1748438923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vp47jDk9EdbNa/22Vb4r2YNTMUCPmM+xIbcDxwo1z94=;
        b=T2E3KrGzbpNwV4iYqtWwWGIGQ5GppZM5wSZBDwEUOvvqpizsYd8oEAbzcQ68iOEUgm
         AB23oIaBM/S7Df8QudOas52YpjpMTkb1+N9v9aO9LLzccmQN+Eh+DwFP1syv68YwzMG7
         +yUfcrka1jXP4F4OEn4oheP15NBg65+sHZp4fS08XNzwwhchoJMGz3X2p9C/fvMZUynD
         tob/UodbjuZkvVenfYdp/OY7ioJrCh08DDUkst7hW7OOZnD72zVh16glqzfxlUWJb8Sn
         3ZR1lRZrDjuKUar//PPqS5zy/hxtUMGe0wDKqhpNDJd/knMD4cjix/OUn3jOBBrwh5H1
         b6sA==
X-Forwarded-Encrypted: i=1; AJvYcCX76MB3qZK3n4Wtr2GbXf/i7b5epCm8WuocTOrR+D7hXqino8zxbTSmnrPR1TZF1vx4e0QucljhpICP@vger.kernel.org, AJvYcCXIPwvKXkoMqyk3b1BbByzw+qrxX9Y3r9ccMHksOd/PLaLV/QhCj91p83jf+9MaTSghHlLAuMz/0ZqaXKC1@vger.kernel.org
X-Gm-Message-State: AOJu0YxXw41xedYcTvs3b2amKNHJgiI1EnVCS+4AKfczvP+jPNUZaNrK
	w52Vf/27Hl+MCAo5VC6BtvrDoOw+VV0+o/q7EAMF5ToELrfAOxMWgIJxxsPW6rGhCg8FcS2eKJd
	Ais2Mw/+KrsfmtnpK33vVSEgw/syWjYp/2WW8qwg=
X-Gm-Gg: ASbGncsgaIeB/8+EjwiGUbv0YnMwDzn9cjgKpf5g7b8WhL911ULg37KXBBq7ScOVACx
	Vkiy8e3YOpm/o9MaDD6fMR7UIkEIYb00BT5NOiN14ygYIRZlS5jV7A2oPS8YCEjrUO2tVLJ3smw
	frLfhOodfd4re+iNdljFrWoh5aV9bIaykLFGwfVTelgwUTuGPLYJAsc0caI4aoEUgYqQ==
X-Google-Smtp-Source: AGHT+IHOaVukk0EM+lTVkJgI5fCyJJvCmSaqJ4uFqjPApedUD3Wu7UNEtmyfEUE/FiwATDeJm2wxlMine+dMoW6oFSY=
X-Received: by 2002:a05:622a:1c10:b0:494:a4b4:a21f with SMTP id
 d75a77b69052e-494ae366aacmr379074121cf.1.1747834111964; Wed, 21 May 2025
 06:28:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 17:28:29 +0400
X-Gm-Features: AX0GCFs4gqRQCEacR_P5jWt1HkYYVLmoLMkcLsui-cKWWqCoZfVHFoasVDeMjPM
Message-ID: <CABjd4YwoVRpJEMss8UN6xT9x4hf6GSjm34GtTHmmnHi8Q42DAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: vt8500: Minor fixups and L2 cache on WM8850
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 11:39=E2=80=AFPM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> Small fixups for VT8500 related device trees to improve correctness in
> light of current guidelines.
>
> While at that, also include a DT node for the PL310 cache controller
> present in WM8850/WM8950.
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Alexey Charkov (5):
>       ARM: dts: vt8500: Add node address and reg in CPU nodes
>       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
>       ARM: dts: vt8500: Use generic node name for the SD/MMC controller
>       ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
>       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950

Krzysztof, could you please pick these up for 6.16?

No big deal here, but W=3D1 builds and DTBS_CHECK become somewhat happier.

Thanks a lot,
Alexey
