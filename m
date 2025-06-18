Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5092165E9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254176; cv=none; b=HU6mq5IplYLOjGimQIEgtHn6jbMaIBgsN1n8fs2Bd87q71yDWY0CVoiGc5xFLGOzAWL1p4LUWYq32o7j1wZBPjkePBsFjQ+ANETb2J2+fTVMjZlG2oIG8/lyx0z4TkrV+6rw8DWo1fnwQXySmrZ5bAFustmPXMRyz1404Q+SxKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254176; c=relaxed/simple;
	bh=tz0a9+M5C7nElDvvHd2ysFpCEWklRNzZpChi88lTTGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJh0JkqnV1JR+YKLaBFuqjpM5gHk1PkVb0GTvNI8A5yAD+jBjMJVj90gKsH3JhzjHVhiki2oHiCXNebsGfaUymSz+nj/QiwucoEkW7d3gTlsg7/IW9Jo6UNlaazNNOWs9scbUgD2+EZ6tRzljgzPMqPBpir4bfno+vNr+39X7F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Mw3JERWu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Mw3JERWu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234bfe37cccso89770985ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254174; x=1750858974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz0a9+M5C7nElDvvHd2ysFpCEWklRNzZpChi88lTTGs=;
        b=Mw3JERWuIGJ5V5wrNWkTEkUYjZ2E9KOnEGxrQc3b84q0QNLUUrNZqdFwrGvSCuLQhA
         z2JYfsOBqgnWAJq8ao7Dg9P5xH4zcJ8Ti7zIfd5muHFBp1f2sEJQrF71UcInDMTDbvrO
         tBfNdHjHE9yXuA0s/ATWvoYrjnxYnEJJ2rI2kK54nBsXZhsRjQMBL+44Bad+aO5aOp/1
         HwZyj3cOJYoMVIWwzBZdXds0wknG/WJ5PYCpdITBgTCtrSK2HGBB5fhUtj+SaxvLUTpB
         Tuuhzpv0UDnJ9YGbPJBpSROKm01hcmkMCZN1zAClHmIgtAFzeiWMohR4bfrTGFOeAR0A
         pXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254174; x=1750858974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tz0a9+M5C7nElDvvHd2ysFpCEWklRNzZpChi88lTTGs=;
        b=AB7BdTkXYAs33t5BIVRcFPSaeRecvLDjpivlekUCwI1b6OkpB5g1d1e61w77pTrK8V
         o4Zrgt1RXmWC2HiKkD84V+YVH8Q+gcTVfasnOeiou6ki4wVh5XyyROyGbKa5+qnlKtcV
         lgGJox31VUSLaGantPl/6dkZohaTpp3n0zCmFS/2/WiGP3ksSb2nnFZ8piyGqX3Mml2+
         8RUg0ckc4Aq1G3jE1ioPifXGiQ4shHF6S7Kojc7qF0nOyaqAiVfoqVC/NZvH9qtlrFU9
         Wh0/8wKrC0nUFm6JTPnBK2h2Cw+OkKxyBEBSRWFnC3j6Vjhd5oBUbNTVKD/JtSAwriE4
         Ps0g==
X-Forwarded-Encrypted: i=1; AJvYcCWjvX+ELm5Yrql6mAHwhRVR2yNfdRyzcefLhqDRdeBMUMLe9huycOIh4NWd2hkmcRL9imJxdP2YUTAfCxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzVnGs9hl3J6pnvmCHxG3nSAUKxq51RyScHPZ2zroWhUEjVyk9
	nDK0rhUuoJH6iaguJpUHHYIJdZwrB2pbsns7qSQj3LRi8zF9qKNDde4ShEditLLf6NiS4psVCEM
	eBatrJ5fikOd2CIJtY+5GJnNdb0xMTJz8yCd/oWrEKg==
X-Gm-Gg: ASbGncvi7J9OSuS09IZYGLkZ9YLvkRQon7MEp7uNQQv+ILMBFvrkSjpegIkK1CrJgO4
	uUkkXQRdn5bsBZctbAVceqkIbQzDLsdK+rDbFT1MMeH9rMdKiR/+r+uPC4tjH8dg+z46E+32O8c
	dfU3T9j0Xjtxu/MgFBZLGfawGi3IxgSaIQmKYNwDqU+gB/ePZWKYtX3Up67WzEJymFGUP7eQeIr
	g==
X-Google-Smtp-Source: AGHT+IElrVhMfyL96c9QVT6DbL+Lc21boXjlquqgqsoD4fhNOqUmdIoDw1JXTFKsvyhQJ4W4uPfVUPd6XCcj78sx+6c=
X-Received: by 2002:a17:903:46c8:b0:234:c22:c612 with SMTP id
 d9443c01a7336-2366b17b6d8mr272722965ad.43.1750254174423; Wed, 18 Jun 2025
 06:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250618102230eucas1p2573610db9d4a9f3543d0048c30b2df9e@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-5-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-5-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:42:40 +0200
X-Gm-Features: AX0GCFuzTphnup-dhM3gVd1jGswJjfqrqmNVH_fP0A_YpAvwshbZGGJ4zdPhw5k
Message-ID: <CAMRc=MfKx+S-8yYpab1YO0XsGN6a9-ybJpyRoyN6wCrKcm=j2w@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 12:22=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
> specific GPU compatible string.
>
> The thead,th1520-gpu compatible, along with its full chain
> img,img-bxm-4-64, and img,img-rogue, is added to the
> list of recognized GPU types.
>
> The power-domains property requirement for img,img-bxm-4-64 is also
> ensured by adding it to the relevant allOf condition.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
