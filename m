Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F012F2236F4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 21:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745615941; cv=none; b=HZRLd0xYmOS8aC8OYGVVWuwBMDYrVhVZPLgaRrPIk3JoWEITv+5CwwzAZv5EHN+HId7/YE1cuug+njZur5mAQfgTweQXSXGI0YrbiM8aYLGxOXosuAL6v6BiywFW7z4mn9HppQ1uM1thQWkTiu6b0qULlYMXAIxLXZVtrsw4jUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745615941; c=relaxed/simple;
	bh=WW0GWD5uj9x5p0tP4n0sOArwVvQMv2F/U8r6AcrskO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KUqHbGPRB7t+ORjlEWTenzRjboVcni7tTWRXLusV+W+gtd3ayEMsRws+QbyS57d/5QbPAP6brKa64pLc/kZzlsFXonp4x+r4kIUVVkkd5iJCG5DuwkcZNdbJ7uY8fhMaNljgXCqq5JmdiGOcQwfSdjNASjh34cjEoOYIDOiHzdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=t3ySosra; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="t3ySosra"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso2830121b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1745615939; x=1746220739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lATh3MzWZf790DjubzFS9bFKySh0fZR6epsOaU8Hl1s=;
        b=t3ySosraZKuIdXxeoi2btN0M2i7ypY9U/sLKnJ+vmiwxIl0LYUnv0x9azzuvWSn+uf
         E35Z/q9uWbsriSkY79B/jGGLhsZdEbG972lwStENBrSPZBaxPoMl/pqDKWg/GTmVzBNT
         i3kk3QMoxwtuFby5KFM7wzKdRD0XM5A8QCAW9RUhSApfmOhdcKe/xhlMwBVlKq7PtnnI
         C/ZBhL5s2QdnXDN/HcLOJNb8SPMJ6awkYv1tgCgi+TCvRB4hWoIXEGj1+nm12WnjLAoo
         CCaB8cxItMo8g5NE/bDo+30j4ejStgeWryhFxVnaCShXklnWKH1qMGtd+8X8+0SEnRvT
         oYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615939; x=1746220739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lATh3MzWZf790DjubzFS9bFKySh0fZR6epsOaU8Hl1s=;
        b=U4+CgXkqmtHMR2Za6N/3WOSeCjQQnE34712E9hYaM3d/Bnj8w3MXKPzg9ftvNWOiqM
         dQq+wEypeVF7Djaa9UzTNEbF+Q2Mun4YbqgDfo4W7XN7Qj1WDWpItUEYypOkBZoRpPEw
         psDC2GFlinaT2WTlR/O0J6YB5NvRhgtVj9zBt0v7W7lB3teYoMsZSXScXIv9bHEDSmku
         cy5Qp6OsL+XrvqbPqmGpgnvqIwzPIwefahMBuIbtI7/YD4Z+PNEFaqd3I+CA1jiPm8Y4
         fcLnofWWqGlghUTIWQfmYgsfH44/dcP6i/+8Od5SjC+68VlsDD4bBP0Zh5LCMGxmip9a
         7cGg==
X-Forwarded-Encrypted: i=1; AJvYcCUHdioeYNasEHZkClXgHm8a8i9fufyPrlS2e6TSWueNybzRURQpe66CPTyvhEcQidF1HWILVOaiqUCYHmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwRWrwFcj4O+LuY14PufaHDMs7VgU8nNTo+DA+ngrBGx+AjaMS
	Y1sQC0ONqDBLZkt9B2ZFJ84xC+HvTKQp0MC4uaS6Z0GFXbf9BuizfGYks/Z2BDo5nmmutxpC9/g
	bOYw9IjlMjTXGnX9G29rQ8EnoPmeAaDj0pqo7Iw==
X-Gm-Gg: ASbGncvo45kUUkiqFOYyOeLFPDjPTsEf05TVGpArqq7EFFh/QOpNnMKBgdhDp5PJwl5
	UDQLRLzrT0hEclN7zBUpCaQ0nIpblyeZVu/o9IEFRMnvIIGL4gHMgosU+BADtypTG+3uxnI6IXZ
	BSKpF0hHzMvSgqmZieC4PpPa9CsoUPW4gt0RE5IP0TkuZF/0Eb16ZgJq/b
X-Google-Smtp-Source: AGHT+IGw80kl4ZXc9yR6ePSrRktKcGbiCTZafn6ezncHtVQMleospHvav/bCV/gWizv9s55n/3wlzQ+F9qTLlIn8Vpw=
X-Received: by 2002:a05:6a00:1305:b0:737:9b:582a with SMTP id
 d2e1a72fcca58-73fd9051555mr5917894b3a.24.1745615939152; Fri, 25 Apr 2025
 14:18:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416001818.2067486-1-william@wkennington.com> <2d3d4240-65ab-4fd1-a86a-503bb40f34a6@kernel.org>
In-Reply-To: <2d3d4240-65ab-4fd1-a86a-503bb40f34a6@kernel.org>
From: William Kennington <william@wkennington.com>
Date: Fri, 25 Apr 2025 14:18:47 -0700
X-Gm-Features: ATxdqUHn5xbT-hR3gBoWGv61BKKLQ9iPSFwEWRthVuTJRHfVClR_7BcDCNCHOtA
Message-ID: <CAD_4BXgO3F0JVKQTAZxLXjPXHv4Rgf2Cz+Cm0PMzLDTx5C56tg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add USB Hosts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:52=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 16/04/2025 02:18, William A. Kennington III wrote:
> > The npcm 8xx chip has 2 EHCI and 2 OHCI hosts with driver support
> > already existing in the kernel.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 28 +++++++++++++++++++
>
> Please do not send 10 separate patches, but one patchset for given
> subsystem.

When I send a patchset should I add the reply-to tags for all of these
previous reviews? Or just resend as a new review?

>
> >  1 file changed, 28 insertions(+)
>
>
>
> Best regards,
> Krzysztof
