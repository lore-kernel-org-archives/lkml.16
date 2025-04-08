Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5D1D5144
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 05:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744089612; cv=none; b=BkqiRzj0Jj8ynrkkeeXDMEIr9t2OB9xIwPUeS8f3p//F849LN4nU+gRjCOROY5XTswNQPKsmXyegLsvn2liTbiqUwDKgYq/pjiJAUFfCzS7Ge7h7DmWgG/7pB9yfMVPaha8V5Wk4Yi/Xqla0Bk1FbExgbx2aX69NctfkQ3Obsgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744089612; c=relaxed/simple;
	bh=cPWwWnJ7ViDkLl5MW+qHSwW3GfvvX0QdfidKESl6o9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmUPIk90p/bB3cDFaSkBqqDJxTOkTq16EAK6YYkivGpWc4Op9LThSqaMdUlOXrWTPphdvYu9PZCA2u4UhMUwmXRC6tWEWYVkwQ00bk1qoA6S9EPWmCz1rUC2VApm3OYbHVljnn3M6gIpA3ZcRb8oFG7GqVOqD0XZLJCi1puipIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ycp8js6V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ycp8js6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744089609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cPWwWnJ7ViDkLl5MW+qHSwW3GfvvX0QdfidKESl6o9Y=;
	b=Ycp8js6VGyZT5BefndTNG8mFNiRC/GRFYarA5FTXwJq2A2bHQbRpuPHPRlzP2Ro8gxGR8P
	ajX/97ZaXNM74o5/0gf5/Woeo5G5CvkkOtkdy45Z2C0oKoVUS6bCuyQWR9vmTX2oF90JL4
	MB9+teaFTfJvxqFkAi2JwRIrzYMq3ws=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-wdKTzu8dMA2ns-gLc6SSrA-1; Tue, 08 Apr 2025 01:20:08 -0400
X-MC-Unique: wdKTzu8dMA2ns-gLc6SSrA-1
X-Mimecast-MFC-AGG-ID: wdKTzu8dMA2ns-gLc6SSrA_1744089607
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-601b042d301so638026eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 22:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744089607; x=1744694407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPWwWnJ7ViDkLl5MW+qHSwW3GfvvX0QdfidKESl6o9Y=;
        b=H8HEVot0eufWVixWC9MXGfRr4/aT2t/VMW/gN6XbsfQE5XF+G1SDXwJhaly88aU47a
         iI2FwkR2BOLQBnZUaSXX+A11JK8LaVMHn+NDl5UgE1rp1VwjR/zMvOoalGUBzLIIIwWf
         yscM8EnTbu3kBTD7eOQ9wcIB74DOFdb88sk38A1ReVPc2bjmOVePcg7FgsakhU4W91jk
         W2qwntR5niEDdumCRnSIESBW9R6VWJmc4o7lpY3ncb7C6330VdxX5xOJeyC8hxSQBPmf
         7CI50UKxQ9dvDNXxEgjZ9/1F0l6pP5XeConT3FKhxq9IAWEsIyxy6giRwrcL3SQJn6CR
         srbA==
X-Forwarded-Encrypted: i=1; AJvYcCXEyo0Eg5E2UHmaw21PqnygKuj0cpWDnVDF/8MaytOOLS9+hOQxHTHymdQaPJrJMrWtL0DCEPJglZcDO7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPUPPurMxlUUrO8rrrFwvEX/a0OMPBCgvsppgw4WgafSKPCE7h
	vWBi7kVSEWu4cAWIhBDRDG/qMxxNfkC3x2TYd/MMftrqltTAbSBF4AcEObfHGgJPAu7XOksgpWK
	U5z1Siivw4HWN6jWVu4kLsMTcLAYIbM2b8mvsE2tlbOh2DXLTr79ujZlZIqNRLNxUgelqnfMEeG
	LLBqQX7ZpLLIrB46M5C0wtTraSJd9r80xZdNAE
X-Gm-Gg: ASbGncsoCJrKO2lIV5Cjy+7gC1wYgrach6rn49tVfKfAlpRuqFGzJru/EShx/NQ8FDU
	hJLXzkKEUZflyJrMPpnG1Q/FNsRNHn3t12nYDZsBjB7fCL2ta1ZVxiK5T1xJ/nzfDOAE01fc=
X-Received: by 2002:a05:6808:158d:b0:3f6:6dea:55ac with SMTP id 5614622812f47-400456a460fmr3391079b6e.9.1744089607265;
        Mon, 07 Apr 2025 22:20:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFndQwFQTxqQbhh7/1XO26yh+0Bql7sVDUgvChNzviW902Do9tUiMP8jbpkd2ikbG9OPRvnppdBsFKJDjF8szQ=
X-Received: by 2002:a05:6808:158d:b0:3f6:6dea:55ac with SMTP id
 5614622812f47-400456a460fmr3391067b6e.9.1744089606990; Mon, 07 Apr 2025
 22:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407172836.1009461-1-ivecera@redhat.com> <20250407173149.1010216-6-ivecera@redhat.com>
 <74172acd-e649-4613-a408-d1f61ceeba8b@kernel.org>
In-Reply-To: <74172acd-e649-4613-a408-d1f61ceeba8b@kernel.org>
From: Michal Schmidt <mschmidt@redhat.com>
Date: Tue, 8 Apr 2025 07:19:55 +0200
X-Gm-Features: ATxdqUE8CZctw0bSKyYLZFAm9WOiGKPiK7Kqb-GLiHvQfp2TsbW9P7zTG2qlt-E
Message-ID: <CADEbmW3Byn8a4otcHqHr_=p4s5kKFq2D9N9xouWVr_0VX3ZikQ@mail.gmail.com>
Subject: Re: [PATCH 15/28] dt-bindings: dpll: Add device tree bindings for
 DPLL device and pin
To: Krzysztof Kozlowski <krzk@kernel.org>, Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Lee Jones <lee@kernel.org>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
> On 07/04/2025 19:31, Ivan Vecera wrote:
> > This adds DT bindings schema for DPLL (device phase-locked loop)
> > Reviewed-by: Michal Schmidt <mschmidt@redhat.com>
>
> Did this really happen?

We have been through several iterations of the patchset internally. I
pointed out numerous bugs in the driver code and suggested cleanups.
However, I know very little about DT, so in v2 we should omit my
Reviewed-by on the DT patches.
Michal

