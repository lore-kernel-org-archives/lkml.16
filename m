Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B6E3C17
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 01:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743556981; cv=none; b=Ont1CSYt2Q8oDUDyYbAnn4yNS+ctGgxMnd3J90xV34urORsvoILFCCRM3OlbS851sbsf8F/0V78DOJ2a8s/hnEvPXGORRu1fo2OBkN4MyK7ViKr4bVCtSOYrfXk3jnhdusXT+dPj2EBlmYy5iwv5E/tXCeNsDFQhmWvxXD1rQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743556981; c=relaxed/simple;
	bh=vtlq7838gV44Jo6PSRiHSverGO0XuSTI4L2Pf0KIPdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVL99E3wQi+vHw79p6XvZc6bzgUsOFacO8mZsJAFRUFa6vgBLvP2yRONXtOnPlh5znPyW39g+UBEixOqyj1+9cuTvlrWV3L+klsq/csuNCfHXdszpRUZPL+CEq2G5q/b95fH2YMfz1RCTEFk3fnOFu/QoO5yl3uT+Jk03F0VdRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y9isDYkG; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y9isDYkG"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e8fce04655so59140926d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 18:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556979; x=1744161779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApdxesjkOfai71A/PiCUygzYWV7+z0dnwski1nvbrAw=;
        b=y9isDYkGivCTgZWvDsBhJrjy5BdqYAHdz3DX1F0W5cVGcwLtqLOS3/aTFGsZlfgvFh
         SZ8XKZQ4mMZ5o41472TmmxoUnpL2w4+WNRaGBG1/BY+WN6Bs4S3Otcsigv96qF2BOxoP
         IqyovpI1nnfYiowpZMAeEsPvom/6L8rFygLOC/o8cXFgAQhytuKBE8FaZGYOVKC21sRu
         gmB0OEWmmfUKPRzMRSOz6mkwSgfzce3NkA6ClRFuF4YPcU3DaQezMPHMnJlvlCkdMxZt
         W7cAZhIXvBZ4UEJa+wvssR+x7RWF9Ohdrw73f3d3i0sC8kr4+2wyHyx/QikXXDIVO5Gm
         pjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556979; x=1744161779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApdxesjkOfai71A/PiCUygzYWV7+z0dnwski1nvbrAw=;
        b=ivox9sdsRIjoVEWYv1JhaNSM1Lu+Npd8s73fdCQTDWusLI2chb2o4J198jDcJXd2IL
         6vgl7fWr405lTYjD1CtEgv+lJdMwg/u3ZSBWdZTRO9AieSTpBX39zD5uBj2iWTavnQca
         ++AR3YHrWRH2G4zXd3VdXzinvJctfGfNxOK16oA3cdxIETwefXH002xiDVmOFyXVEO4z
         /FOxenenMBxlsE8LOOfJjoYhOR3MShKW4tytzomlPhSoGZZYOhVbMydBih2TBnNC+qXv
         GYK7DVeh6QIGsVdi33guXOlmAcNPwZaF2aNpkW8uZK25lNYDUUjpuu0LvXH0HGvEW1eP
         TajA==
X-Forwarded-Encrypted: i=1; AJvYcCW87zF0T64tcu9JBPeD7IBybuB3Olj1An/4A5FQ3lFmlW3SzQAesdVt/IEmnJh5qdeGaiz5B5rKndUkkXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLIWwy8X6OOE+2ZoLXO6HEpPnUqlEm9o3fNf+qnrmvuu3ScZnV
	1JDHJ4zrFJhCcsp6H4a2Tdj3f93hQDl0s8fBX6kbhvCsmZPF6rGqcopYrrU6huPCgY0HEjMaVAL
	BVAfRCQSU5qVnxTeSt4hKZOSeReoCS+waCAc=
X-Gm-Gg: ASbGncsfbtof8N6Vr3S2PteXUkN2xR5kfHynTGLNDe9ARxS9aGbww5Vf8pW4KvoW9Je
	xWm40eqylg+fXR25m/SAZnwD7kK0A/8XLdig0wZtLpWM7hlpZombSCtXXnOverQe2AxxN8ppK1E
	nbe5K9t/jXLbO6b3ixdsUP5WMRKmYXg1m+iOZO
X-Google-Smtp-Source: AGHT+IFT2xaIBFRCTkFePtUG6vwD+8dVcugwyHEGGsvMia3jYcIBJs9VJtiUlqGpwnEiLP2y6qg1U/uTR8BQ8/FRyqA=
X-Received: by 2002:ad4:5eca:0:b0:6d8:f0ba:ea92 with SMTP id
 6a1803df08f44-6ef02c7b3aemr14857656d6.21.1743556978473; Tue, 01 Apr 2025
 18:22:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com> <20250402011832.2970072-4-yabinc@google.com>
In-Reply-To: <20250402011832.2970072-4-yabinc@google.com>
From: Yabin Cui <yabinc@google.com>
Date: Tue, 1 Apr 2025 18:22:46 -0700
X-Gm-Features: AQ5f1JpEFpn6nSaI8DHriRP1kpO4k9vT001Uil8c_V8-xsDrMAnB4qPjqh6SggA
Message-ID: <CALJ9ZPOvcxswvfbpWkXgJ=WL+HLa33nm0ZzHogYNZ9keXfi1MA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] coresight: core: Disable helpers for devices that
 fail to enable
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leo.yan@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 6:19=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote:
>
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
>
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtra=
cing/coresight/coresight-core.c
> index fb43ef6a3b1f..e3270d9b46c9 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path=
, enum cs_mode mode,
>                 /* Enable all helpers adjacent to the path first */
>                 ret =3D coresight_enable_helpers(csdev, mode, path);
>                 if (ret)
> -                       goto err;
> +                       goto err_helper;
>                 /*
>                  * ETF devices are tricky... They can be a link or a sink=
,
>                  * depending on how they are configured.  If an ETF has b=
een
> @@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *pat=
h, enum cs_mode mode,
>                 switch (type) {
>                 case CORESIGHT_DEV_TYPE_SINK:
>                         ret =3D coresight_enable_sink(csdev, mode, sink_d=
ata);
> -                       /*
> -                        * Sink is the first component turned on. If we
> -                        * failed to enable the sink, there are no compon=
ents
> -                        * that need disabling. Disabling the path here
> -                        * would mean we could disrupt an existing sessio=
n.
> -                        */
>                         if (ret)
> -                               goto out;
> +                               goto err;
>                         break;
>                 case CORESIGHT_DEV_TYPE_SOURCE:
>                         /* sources are enabled from either sysFS or Perf =
*/
> @@ -507,6 +501,8 @@ int coresight_enable_path(struct coresight_path *path=
, enum cs_mode mode,
>  out:
>         return ret;
>  err:
> +       coresight_disable_helpers(csdev);
> +err_helper:
>         coresight_disable_path_from(path, nd);
>         goto out;
>  }
> --
> 2.49.0.472.ge94155a9ec-goog
>
