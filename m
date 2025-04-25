Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA9207DFF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571553; cv=none; b=lGmonA7GEvIyNUVkyYi95sCMxxlUzV2mqCTXYD6nrxUo0/MvZkZ28jdz1FGyCw4DhtbIPg3chTdxuIdxzRHtQ8Q8hxfvnQz7FvhbUJxwkN5I7pinUxHUt2U3u0dZNAEdqWmfGSpD8szsTJcoQk5hCzern4ipLkCfr7vI2yOnV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571553; c=relaxed/simple;
	bh=IOqzftBT1fhDk9Pfp86NcMZ7N7yHJML7+rwuNQl2mhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+7qBnByhD0WR26WJzQ/WB2yi4Zz1GV5wci9xqWPAwUd5jf6a1YKgH/SZSjoEy2OX+JuBzQfM0jNs9lB9HMRBJ1n+iaQo8N605E7dBILAu54JbZXVeqlK7FivIJgNIEMF0X2h2AnsIpnjIebfRwgj7hwEVlsY6IU4kxU26BwOa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fCMxucKu; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fCMxucKu"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-604ad0347f5so511293eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745571550; x=1746176350; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOqzftBT1fhDk9Pfp86NcMZ7N7yHJML7+rwuNQl2mhU=;
        b=fCMxucKuTwhSH89t7bQ3zQZc9aLykaT1SZ9AmgoVJNe7alamgxlQZteoj3TUfFJyBo
         TT/iMmZGsNd4Z+KZTNzwkdPyGW4ALYsvgHAb78WnEsuxZVHLT44af71PcSkB7Gb2BE5H
         pAadpPO8U72FXjLB1OpechqkySMJuKxh6b9RuN3P9dylMp4IlfZbKxi6QDda8xfcrNuK
         I9b9O0XL/JV+siPaxK4uafB1I3F7Bt4Q8mN4glvQehvbWmmomYqUuTAXmtM4RBgNnjwd
         fFYaOR0Z2h88Znzdp64mFciEYqkoxUaTFA4GEYtgNQZ2YjpKrOgbX0IYuiONrfNNQpWG
         NvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571550; x=1746176350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOqzftBT1fhDk9Pfp86NcMZ7N7yHJML7+rwuNQl2mhU=;
        b=xNtCOQE/DwM26N4rmESv+4bZA6iarD4085JWNSGannGpWkFKW29CSsKhnluI/ARUu7
         P/JCSxGn9TlzJWd46gHV89o+qepFFH0KvsyXghm0IvQ+jzkTXV+5Y187UzuUBp+Hz6O7
         Zfx2osCxeIZ7befVGKNx8SK2Ozy+UjFWsLOFZPOY7hk7k0OLHLVH2BB0piRL42IEmLbT
         du3WbDKnXXieJZe+uJzFWk7n+AAPLpY6b0BgxI1Jg+XfzrH37sPq4e1MsmPvegvnDRTS
         4sGBasqCFKDyC13LJOIXBT13VXyXlJnfGDijZxhw+QRwD5ZMY9d4atysyZbv6TSEfyG3
         DV0g==
X-Gm-Message-State: AOJu0YzNpIwT7317XTTk+Gl5GInfTPpXPeVql3Bd5Nl7wtDxt5TJfWpe
	T9pHzYFhgxWK9JzgZk0BsGEugvRxWIsbTFl/dF47rbwHI+4uOxbeDGhIMy2TdhYnyV3O+plcwH1
	sjOndiMvmwOw7rrtcyBCrelsc3jzAGcw2IP/WRA==
X-Gm-Gg: ASbGncuq7YgMqaTjtMfPI+1Ptotrml+GoVnwaMR0C+yWp9Ph30eAYLkb67XqH5FN9jN
	KHRSNp0V957s0mMWB4RYlFZ0Kwi75IpC3YGH9KqRuaelE3S7til1FwnT0xiTBARry8sC5vqbIIt
	rQ1jDd+hX/Xb57Zd+6IBzWsSs=
X-Google-Smtp-Source: AGHT+IE2hTmDaLIEWoWHjzAzKcQZSSk0iqd5qSc1OBIVqIyuuWw7yE2s/ohjAh4xTMRsDhhphEOH96pCM/ubE++EDUs=
X-Received: by 2002:a05:6870:fba7:b0:2b8:2f9c:d513 with SMTP id
 586e51a60fabf-2d99d8773d4mr950114fac.19.1745571550041; Fri, 25 Apr 2025
 01:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417090436.1c58cd18@canb.auug.org.au>
In-Reply-To: <20250417090436.1c58cd18@canb.auug.org.au>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 25 Apr 2025 10:58:58 +0200
X-Gm-Features: ATxdqUFB_IRMdNfH5punfBtnlp_3nHfUoeE_i4d3Trz5M8-dIsbmfZhtdJA9ZD8
Message-ID: <CAHUa44GxOGGO_CQp=HGGT-gbX76aDNbzfvU2ZWgg5fRbdzP2aQ@mail.gmail.com>
Subject: Re: linux-next: error fetching the tee tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Thu, Apr 17, 2025 at 1:04=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Fetching the tee tree
> (https://git.linaro.org/people/jens.wiklander/linux-tee.git/) fails
> like this:
>
> fatal: unable to access 'https://git.linaro.org/people/jens.wiklander/lin=
ux-tee.git/': The requested URL returned error: 503

Thanks for the nudge. I've meant to move my tree to kernel.org for
some time. My new tree is now at
git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git,
please pull the "next" branch into linux-next and retire my old tree
https://git.linaro.org/people/jens.wiklander/linux-tee.git.

Cheers,
Jens
