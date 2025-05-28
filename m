Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61B879FE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402157; cv=none; b=et187gERxpwKn4N5l0aq1PBT+irPmlnCf41X8gh0lwS/ZfyMLWDrXK7sbiSNZlF0d8OXc8AseIKUx/P0jJ0CKJIAbbuse5ApdHHEInEqIXN6deb9f/sXazWNPBEkfZ6GZxN/vINVyiw4t91gVBF+y6VE03m4d/CUZHqDFEXBF1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402157; c=relaxed/simple;
	bh=OHF1IDv7vLAladrHs4Dqx5rp5IUDxhWK0LuOT2tA6Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9veSdHUk5QdCf+WgJEJa0Cnd7AqIuCL6rFHFDQ++ioKsOUCc7VJ0IQT0VGjaAsmIHxXm8mcUzIM7CEqfqmUzOS/rTOn9yd9KeM1bu/hegNxu8mwJViyEn0S8Dgxc8k9O0a1FOhlegEoDNTmSa62fQcmJHnMmNH9iBnVQXXNWYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=XXiITiHR; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XXiITiHR"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70dd2d35449so29010327b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748402154; x=1749006954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6oO2HlPDXmXr8ML8UMtQX0ZnJHbbpXTwh/3FffHh2s=;
        b=XXiITiHRNW9aL+UOrzKLyrKlLZ3p0RtvLtgASMINrQM/wI7Ern7gajPIHW1j6io+w/
         moL2HqskIw+rrTy6c6OekDsv6MuDMQIyA6/ZQBe4kMDZmg96y/RoDSI5+uhN43MNtlQO
         ZdRRji2jHVVWDiT8DnNMt9c+o8I9w/ftCpYcMt+wE8YlKSwUCrDpP+nbd/Xd8uxkYPDR
         xw+ZkWYati7I8I68x8MT+DKG2WO0RJ5L4xIj47L7C8JmA9mV06aCZdLAwaDDvlmXaz1q
         Js+ssd+ZNyGaSgpm6wwn6O9POR0xKfQm1njCCC2QDFdeAwTcnLgxWB9vgysYrh/ke1tn
         va2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402154; x=1749006954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6oO2HlPDXmXr8ML8UMtQX0ZnJHbbpXTwh/3FffHh2s=;
        b=R7u6aFsWFpxKhTv7sdZlB5Gkzaanv6MwN7yQ27CQb0uIkF7CLipUJ/hBL8lcn8h4+1
         rUud1vgPmSBC58Gjq0AuzctuByhFhLmmCTiRl5kNjcxNwmWL9E5ullbyshYZLcGzyxyw
         ymM5+uaWq6Gow2RzrDPV3bRjWlaHDQMvDjZH8cUk7TVUTucO1J4uBX4MjXRd1KzwtrrG
         r9LhUluxYUK2jRP83AU5wqNzYfjKafQDRhiUf0u4TpxlsGfbJlSTFEcaku9y677zYPzE
         xZ1opbHPRUBfvThXYzWfq4aT/nwUlQvN97N4ERJUb2AbAKVtQFsmlIubwQtdtxzxKKd2
         UUfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEQ8MlBR1wV+V6kHaLTw7nDC25zMQeCb+Cc/MlPTmY+cyQN4yKfO82asPsJGEnlpAFSwsKCu6yTuG5l+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2jg3z6b/HK6ovQ9n+AzoSowEMI/PZJcQdeFT4b0mHoYB5U07c
	wduB++s2ATTgJ+LuU+e9c6wBM8dCXafW++h+qxULXC9yw3xp5Dbk4BHniI4klxG1nwJU8EeW51T
	6NYsy3Gk684bSrbIH+s4WNZ7TiFNCpGZvyWHb6/1oIA==
X-Gm-Gg: ASbGnctP5fN7/btNmzNCEFkEuulmmDgNrc9Hf8J6XAryMkKyw23TlUuLULJW8lwLx93
	T/Eo9kz7AX/lGDfqdIxEuEdZUo/5/cLX/GIdEc083vOhcoXUYkFKC7i/FJa9wfioFKPlTSoCu8Y
	lKWsvqWorOJmeWQnqFERDFmIJiUkg5OyVX+8MGM34EDidWsA==
X-Google-Smtp-Source: AGHT+IFuyugK9QJlLjW19pbjFEAGU5G3W6GwoKeE6Fk2k3mBSLoCZhHE8LEA9fZnO2iQ+kzn6bG8RK5UQkVYfmd+6D4=
X-Received: by 2002:a05:6902:2b85:b0:e7d:c415:6fd1 with SMTP id
 3f1490d57ef6-e7dc41570d7mr8183492276.44.1748402153834; Tue, 27 May 2025
 20:15:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509021605.26764-1-nick.hu@sifive.com> <20250509-small-graceful-limpet-d0ea41@kuoka>
 <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com> <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
In-Reply-To: <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 28 May 2025 11:15:42 +0800
X-Gm-Features: AX0GCFtDGZ1aQRQahvIacjtswXBcdyUBwr2GTfHhybVIimW2KBTO9ISCN2ikdw0
Message-ID: <CAKddAkD_h6Qh-fSMbV6d-QK369pkZcVsQo0Kf9SQkzO64wMqfA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cyan Yang <cyan.yang@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 6:39=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 12/05/2025 05:20, Nick Hu wrote:
> > On Fri, May 9, 2025 at 2:40=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Fri, May 09, 2025 at 10:16:04AM GMT, Nick Hu wrote:
> >>> SiFive Domain Management controller includes the following components
> >>> - SiFive Tile Management Controller
> >>> - SiFive Cluster Management Controller
> >>> - SiFive Core Complex Management Controller
> >>>
> >>> These controllers control the clock and power domain of the
> >>> corresponding domain.
> >>>
> >>> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> >>> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> >>> ---
> >>>  .../devicetree/bindings/power/sifive,tmc.yaml | 89 +++++++++++++++++=
++
> >>
> >> Where is a patch with the driver (user of the binding)?
> >>
> > We are hoping the driver can be submitted at a later stage.
> > The driver that handles the MMIO is implemented in OpenSBI and depends
> > on some prerequisite patches [1], so it will follow afterward.
>
> This patch alone makes little sense and brings little benefit. Post this
> with user.
>
Thanks. Will update it with the user.

> ...
>
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +  sifive,feature-level:
> >>> +    description: |
> >>> +      Supported power features. This property is absent if the full =
set of features
> >>> +      is supported
> >>
> >> Compatible defines this. Drop.
> >>
> > The property depends on how the IP is hooked up to the rest of the SoC.
> > Having this property simplifies the SW and allows us to use a single
> > fallback compatible string, so we prefer to keep it.
>
> And we prefer you to follow standard DT rules, see writing bindings or
> talks on conferences.
>
The CPU also exposes its D-cache size, which could technically be
inferred from the compatible string. However, it chose to specify it
explicitly using the `d-cache-size` property to allow reuse of a
common initialization function across different CPUs.
Similarly, while the `sifive,feature-level` could be inferred from the
compatible string, defining it as a property would enable all
`sifive,tmcX` users to share the same operation code, improving code
reuse and maintainability.

If you still disagree with this approach, we=E2=80=99ll drop the
`sifive,feature-level` property in the next revision.
Looking forward to hearing your input.

Best Regards,
Nick
