Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3927263C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612925; cv=none; b=oc5UeoeO11TESA9F15fC5yVTAdSgnWWCWlSFY53p3LanUCZWFQ1ZDweBnm5lM1ypp2zx8XywO7axSoyTvRXKDQBbcwPC93hTDy9FQJabP+v+qsuo4vh2eZEoH+Ur5mUPeD29dKKs23ZqaZtZbjIF2CwLyzWAFn6+xBbbjHenkvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612925; c=relaxed/simple;
	bh=2kKyy8TPxu6MBP3b/ij0sX+z00C9OeGG/fZ7S8SZYZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1qGF4ezL7fgTPS65geGPQBftUr9yaLVpHo76pVDaH0vKnvQ/3805ftXTwB3M6LFldBZGLAjWULtADcvANEuZXjp5HgbkKNmd7Qj1zECRVAugpSJWnJgFofjFB4+WCT9U5b/KYJDLaryZO7Nn4IboOUTQcw/kcLUC5Xjkq2zkp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hRRgM2MV; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hRRgM2MV"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e75bb8f5417so727676276.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 03:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746612923; x=1747217723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2kKyy8TPxu6MBP3b/ij0sX+z00C9OeGG/fZ7S8SZYZM=;
        b=hRRgM2MV/iQBwhiuQYzkAPHVZRoyEWZUUVimEu63aEilVu1uR46cjSkLhir+G1uddi
         F4SljYjHhMhJ7tDQc+4IDGNg/XNtD+0EezwfqXkJ6/sF7fdCJ6HMV3fuKvRpnyONAwa3
         TdCMHDVQg8cCMtUvfEM3cPnSeYwc+N9ATfI6Id1UZCQghhmC770k9OA9wUQuTLbi0Qo3
         dhFIfPCqm6E9e2aGhTQu/SexqNJe/yhOOClj3pfffnrtyYD7jptXgm5n4ENya5exBTm1
         lvQEK5h3HQdVH12ov0zNJnmjjzlwpS9VsLXbab3mNClKzkyQdDjTb5v0V7h/ZeGfCGpj
         O0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746612923; x=1747217723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kKyy8TPxu6MBP3b/ij0sX+z00C9OeGG/fZ7S8SZYZM=;
        b=lC5Q4vZklIckScNdffk4nTQk3oh+IMKq9EKzLAZMYYM6KR0ggKhrjbhBVT0iYLKZ+U
         qExZo6W1G2fSh6ZQvttwrYDRp86G30CsFWgG7Xbjj54gW1XXyw/uPUsa8ICpKZYGX1Xb
         te3Vefwdp6i4+QfSRTW8/sYt56p49KI3JmaewAnxblhbk/N8ZBS1MPRp9ZhbTBZ9Jvn/
         AVxdWHLZmBYE4ue58rT8sMZvPNcSV9nxUbRUbadq2G3qLW2Abt/WxL4Q8v44Mk1+124e
         +dEtsgJjAgqxu7POKvxijaNcpPPh+WtV3IyHf97pz4H+rFvfngQ8hcuW0XmvgdoWL4Wl
         Jnew==
X-Forwarded-Encrypted: i=1; AJvYcCWNXQnr5nQqTqa4UBeFmgbCdLx/b4reg/GReRrm7eXxmnqL5TCp1jVobYs3DWwbWtTlaJsX7nAHSWGvgso=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZhHypS2Rnc426Lq46Fo+PuwNi37M8yuyjgAnPztncZWbIk746
	Y7LK2q0sR7DC3DPfhRiRTh+JhK+ZjG6Fyayl56QM8f5NOILrrJmN+ed/KYXKaxrn2wWmSuFlDP0
	4z6Hver0Ve1EvOG0Nf9ui2mb01zvbuPpT0lP/mg==
X-Gm-Gg: ASbGnctR/Uo8ZdtoJ2MSpg/lQBrhWIlgRY1DU/viCF+dzqiOv7hn8mIL551y7He2++T
	1b4iY19LrD/dEUxcimOfVjA+eEKwntCmd25/LEveFI3TQedoUnTNZubTSsZf1OFeLcVDodF3hzB
	byohZ3dncXLKxILHVtQj+eLsE=
X-Google-Smtp-Source: AGHT+IHn1ks68akd/coDPAZmpIe7HBhUWeUxWUjOEFaKQwyjN7TisAzrwAQkABAtcJbUHO6Ilz6E9OB4Vk7BnH+3K28=
X-Received: by 2002:a05:6902:2085:b0:e73:1749:ed9c with SMTP id
 3f1490d57ef6-e788df80016mr3214287276.24.1746612922947; Wed, 07 May 2025
 03:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424180036.1541568-1-jm@ti.com> <849a5e47-5b37-40e4-8b76-a58adb7e9b90@ti.com>
In-Reply-To: <849a5e47-5b37-40e4-8b76-a58adb7e9b90@ti.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 7 May 2025 12:14:47 +0200
X-Gm-Features: ATxdqUEux_B3oamDrHorDmmQFHbu6nx5l7WSCGenWjG9wHyx8Pn_JFsTs1UaTDY
Message-ID: <CAPDyKFpMo3a_MZuD1q+JFEa4VqHeoJ-SegviJfd322jkV29+Pw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add SDHCI_QUIRK2_SUPPRESS_V1P8_ENA
To: "Mendez, Judith" <jm@ti.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Josua Mayer <josua@solid-run.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Francesco Dolcini <francesco@dolcini.it>, 
	Hiago De Franco <hiagofranco@gmail.com>, Moteen Shah <m-shah@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 23:24, Mendez, Judith <jm@ti.com> wrote:
>
> Hi all,
>
> On 4/24/2025 1:00 PM, Judith Mendez wrote:
> > There are MMC boot failures seen with V1P8_SIGNAL_ENA on Kingston eMMC and
> > Microcenter/Patriot SD cards on am62* Sitara K3 boards due to the HS200
> > initialization sequence involving V1P8_SIGNAL_ENA. Since V1P8_SIGNAL_ENA
> > is optional for eMMC and only affects timing for host controllers using
> > ti,am62-sdhci compatible so far, add a new platform data structure for am62
> > compatible and append the new SDHCI_QUIRK2_SUPPRESS_V1P8_ENA quirk.
> >
> > This fix was previously merged in the kernel, but was reverted due
> > to the "heuristics for enabling the quirk"[0]. This issue is adressed
> > in this patch series by adding the quirk based on compatible string,
> > ensuring the quirk is never applied to devices with internal LDOs, then
> > V1P8_SIGNAL_ENA also has a voltage component tied to it.
>
> Gentle ping on this, are there any comments or any issues with this
> type of implementation?

It looks reasonable to me. Although, in general I think we are trying
to avoid adding new sdhci quirks, perhaps there are good reasons to do
it in this case.

I am deferring to Adrian to make the decision.

Kind regards
Uffe
