Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271BE14A8B;
	Tue, 13 May 2025 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152509; cv=none; b=puJVGvhKYNFz6U/0EoC37VsfqnEOo88r7zVyc4XWOGNJqwaO8FaK4/PgdcrzCLen3dYSFDJ9RlFyWWu8lg4srtZEVGZEVeL04oi4BMQxvv2QoXK81l02T3zGsVX9cbk++LoVZ3bUSjn1qGpLTgMkxFRRTgnhcNCeI6feoXeGkL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152509; c=relaxed/simple;
	bh=lXLXq0c3RiyAPCrSXiaOWb3qdU+9+Mzs8QTTwctlBuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k/+gvrYDV6y/H6EnPHc7AYHofezG2vGhKKa4zIdfSghB3ldW65+i+1RpgyDB07KeDNsTMTllQ708W47wfvVAmKjtw/oOiU/L4rUKoAm9bLzKcxpngbE+CmTiXlgsrHaM2N0hwJ3p4nUOIm8rjOI8UrAHs0xTtHU/mgCMvM/qD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSmSKq7G; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSmSKq7G"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47686580529so68622331cf.2;
        Tue, 13 May 2025 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747152507; x=1747757307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AN4mliRZzMBrbopGFJvTRuuBl/xk9aFHZyNZB0Spr1g=;
        b=aSmSKq7Gn5T+G/axlq6j46rHRBgnUqAzxCuEsD5n0U/Uz6iH/cRQLL6ff5qBuKSs5X
         5oDKbhIfREaSqOeVE7R8wOUKlc5f0UVX3YbZNV0qRrdGC0OMIUOLaqS5/UibBBGXxdwp
         fWirI3akyBzblvAa6Ylgsu/rMv4nj/R3m42NsuqHy+MnkZ9jtdX97F0Vo1oGGTO+dVqk
         ktSgniWvhePwnhP3Lr8NKcqqFNRTSUzquchncvS2SVU7iJCN8dkrq1I+2eP3HOr1584Q
         sc8FTjIbj78pDyVNYe1WktQi4mJRRtS0IqB8M9J/Yyw1017loFkfO4z2VaVOjNYE27Zl
         M5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152507; x=1747757307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AN4mliRZzMBrbopGFJvTRuuBl/xk9aFHZyNZB0Spr1g=;
        b=s+uXS+EFU8eUAwKPvXXng722WEiGt33CALllXNqH+vYa73ackKuvyDLcpsdFxCHXTt
         h8EfjhlJC3OCFyv2Mw1h+comHXKKC85hct1KWihBA5PS3z6cPulpYY4GM6DyEW+OtcTk
         gJ8EqwuAXNnmvieQc8zj9M9g0tl4x/HxyCqvE/jKNoZfnvIb7ZoYaktjf+WiTLV9dEjT
         LfGo4N6rlqv5c8Sl3fIwfRsF1hZl93avR2kW8C8qdVW9sI4DACF/s+eQpdcH85MZekm6
         z2rs9hBAe8Po7DYUZ4vBJ/ndEV+rQ42MCPoNMtPEg5LH6snkJuspUrt+j6iTXEIDjkyk
         9f6w==
X-Forwarded-Encrypted: i=1; AJvYcCXQmO2bPJ0Wta+27rP9r8gQUJ5Mb93Db+fNCtO8HJWL+pthpa8m0q9vjIoxeyzEf5xnwRGlfOLddVZP@vger.kernel.org, AJvYcCXx80WUrHKLP0wQ77WgCKATtF5b8a5F6Jq0oc/PaSLRHHFzl+FLVvLCJwhJ50CNMWqu/7+NVVqn2Gwyc36r@vger.kernel.org
X-Gm-Message-State: AOJu0YwjPodIsL/k/ZXi62v9tNgLi3pY1yXXVz2dTGyXyTXk6R1BFNAL
	tTy2mb8vX0YU2myHlWFbjIT948gzMRtZWi4aDk0j5jRTSANqL2W6NRwsPHjTmnw7PhDmiq/AtDD
	smVK1CU7oI/sVWTan8lTYfzE79I4=
X-Gm-Gg: ASbGnctCB4rNNhPLQ7LT+//FHxLle/41emZGJGOuYTQhVf5QBtgf+zq5goT+wYffPml
	6Qor/60DT+lvD3WLHICm3O4QkEEWXyUBA85ikc/GrvbHFuWJnHti9dDeV6MBhUrg6CJ4PXsUOsO
	xUQ8jK73u9FYGNNvqa+PjdW2xVDiIJWwpQfdmmzm2qUnOTnIzHZrK4yjB9qHzf+PY9
X-Google-Smtp-Source: AGHT+IE26qRcDzjLWk2tHG/kJHrPsKiSz2MOY61Ty7j3aEFGcynoA5b6w5pOfe5KgAmrxejxGAraPScNp/dww8vXp4w=
X-Received: by 2002:a05:622a:2587:b0:476:98d6:141c with SMTP id
 d75a77b69052e-49495c8eb2emr572421cf.18.1747152503726; Tue, 13 May 2025
 09:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com> <aCNqCrBqGSxRGMKd@mai.linaro.org>
In-Reply-To: <aCNqCrBqGSxRGMKd@mai.linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 13 May 2025 20:08:12 +0400
X-Gm-Features: AX0GCFvMOIyMn5-4bO-1Iaea5F4lOX7lux6P---Bu9eSzNlomYJ5PbHB5oe4jbM
Message-ID: <CABjd4YyQ1wg4Esd0ZGO-2+WGXkzrqfbhxLMWJ9N8eXTDr4BBgg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: timer: via,vt8500-timer: Convert to YAML
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 7:49=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On Tue, May 06, 2025 at 04:16:32PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the VIA/WonderMedia timer
> > as YAML schema.
> >
> > The IP can generate up to four interrupts from four respective match
> > registers, so reflect that in the schema.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> > Changes in v3:
> > - Added Rob's review tag (thanks Rob)
> > - Rebased on top of next-20250506 to pull in MAINTAINERS updates
> > - Link to v2: https://lore.kernel.org/r/20250418-via_vt8500_timer_bindi=
ng-v2-1-3c125568f028@gmail.com
> >
> > Changes in v2:
> > - split out this binding change from the big series affecting multiple
> >   subsystems unnecessarily (thanks Rob)
> > - added description for the four possible interrupts (thanks Rob)
> > - added overall description of the IC block
> >
> > Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-6-f9af6=
89cdfc2@gmail.com/
> > ---
>
> The patch does not apply.
>
> --- MAINTAINERS
> +++ MAINTAINERS
> @@ -3467,6 +3467,7 @@ F:        Documentation/devicetree/bindings/hwinfo/=
via,vt8500-scc-id.yaml
>  F:     Documentation/devicetree/bindings/i2c/i2c-wmt.txt
>  F:     Documentation/devicetree/bindings/interrupt-controller/via,vt8500=
-intc.yaml
>  F:     Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
>
>         ^^^^^^ those bindings are not in my tree

This series is based on next-20250506. Happy to rebase onto 6.15-rc1,
but these will result in a (trivial) conflict when merging the
different trees into -next and to master. Please let me know if that's
better.

Best regards,
Alexey
