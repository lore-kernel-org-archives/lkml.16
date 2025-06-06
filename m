Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB6728BA91
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231731; cv=none; b=P+LhR2z0vsbapbCq+pi1FA/pIBApZWwISN+rU1HQuBGx417IA3PZzMdEBQSrjQnU6T7OQcyp84HJPfnSOyYTKsE//MefaaIvd2Xwgo91M8KWreBX0GaMBznEbDs9LmbYcRhs9kSGiSmIosGIrVfSpymJryKBGBqE8sI1vCq4SkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231731; c=relaxed/simple;
	bh=IY099Uhb1zX/RB33FhT1UpmqkmN2CKjhfyfZMLkCXhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NHu2mkq6D5kqf+vcNWvGuaUYUSu5vm7qE7yOsQIMW5reDN5F1KK7YasjD6yvPMXq81aXmHRieGxJ1Mr2dn65IEyZm1hgrkECAaFxtrw9r8YKl1txzv2bSmZ/YwUpQHt/F/P1EcXQLn91RL0YpSnsg0pLI8Feu43KRCn8vLBOfl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zxm5RVH3; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zxm5RVH3"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ddc10f09easo16235ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749231729; x=1749836529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQl5xXzidYCajSXaZTPWFkCXGQM4eKdlGCBdNyt/Kpw=;
        b=zxm5RVH3d8b2QCG6cqHfmFjeWBOKfqh0E4ezxfnFwTGUk6nYdK/d+jFjTY2hG7y+c6
         qoeeqF3v/Zp6oF9oWfzXjS6Um/VLtfHnHo3NPOcdvakS23HEFdxSoJ7qkKmdecwksnDO
         09+bxOprPHyuupu99bYAokuDNPLpXL4YyIhIckTHac7emstkFQHcoteHWAkBZEqCWMgw
         qAdoUL8QnBlBAcaXNCraHGmXI2G0lQtWl8PEaBl73ufeT1Zqr7/X8rZUoCiSxvk/y/wU
         ngTyIjMlGIimHfxOXT5o4nES1eOA6cyoZDvKwSDYpByPNoxzrevzYhGyls+2dk1Qt0yl
         vFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749231729; x=1749836529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQl5xXzidYCajSXaZTPWFkCXGQM4eKdlGCBdNyt/Kpw=;
        b=HJFlc+xpJQemd1dyx7mRudzh1HeQMWcPpK2mszUxhc0echijidn735WIrf2P6AJfxx
         47UbBLk69TEzWH1dhV8ATBDGzpfd0q9wDPTwZW8mvcyrsBga/PFYmJb/ZPQgQ2Dgxu5r
         4HyBqLDl3JvwJoWTBJ6Qdm51ZCqRdBTnRx/MfXLOfCE4mleS2j5qyG+VIns2Bc8DXMUz
         yykPEJtM/QA31dkQRMiM+YVskRx2dUUz98v8nqVonF7kulP/rs2daMI5CTZQIQSgCM9q
         Bkm/pCYSAiex+dn7OR4l+EEMJgPSxoo4wMnfd3l5tnFxl/gPUVQPycmHHSGG7+0nsWk9
         oLYA==
X-Forwarded-Encrypted: i=1; AJvYcCUn4vrjdlVKBh5iR2q1zMojNdhjICm99qr4no0wrvxsoNuxJ/gkrEsoqjExej72hH17mdUSZ3qz2JiZfpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhpyKdYVoxSy2Vnz471mgkkbtQlmzrHDH0bbYp+YLyDJJfIuEi
	+H4rydGlAiQcgI4Un6nf6i/Ru0UO49UtHCl6lP2dBkPzuCu2lGaUbMU8jIKSKW2aDsPisnDixPq
	LW9Bc7aR2lD2xRylKnXp6XmVSkExKHTCynjpCmKhO
X-Gm-Gg: ASbGnctIGeXsNmeyULr0U+bEx2T80GQKyUnt28s77eMCN5hViT9uUqLTD0Dc2NtkB6y
	l3JnYaVuJ6ciDTrW1uGN9uMAzgTVqCDWdOgFn10pA/gp1Mqd7wWIwU8XOc7JUh3JovlRFQStzpT
	BJn2Nboi/bH+drCy3iFcC7xNs5KH05BLNzr9l+zya/f3l8
X-Google-Smtp-Source: AGHT+IEaErEvILJie5Tmz89Tuc+xBqtQ7zBkH1qVfOJ+VRiiLqP/QHRYIFHfTIDoR0abJbgO7FVm6GHUfB9tlyHI0pM=
X-Received: by 2002:a05:6e02:1a64:b0:3d8:18f8:fb02 with SMTP id
 e9e14a558f8ab-3ddcf7ea5e4mr3434155ab.17.1749231728819; Fri, 06 Jun 2025
 10:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604173632.2362759-1-yuzhuo@google.com>
In-Reply-To: <20250604173632.2362759-1-yuzhuo@google.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 6 Jun 2025 10:41:57 -0700
X-Gm-Features: AX0GCFsX-VpS06G-xJ802yPwn-9wk6wzreUGSmx1m9rom3fxFg49sUrQl_WjOSU
Message-ID: <CAP-5=fWKUa3uz+wwwN4P7-bftRMFe5W1WYgVDV0kOhGJGLpU2A@mail.gmail.com>
Subject: Re: [PATCH v1] perf: Fix libjvmti.c sign compare error
To: Yuzhuo Jing <yuzhuo@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:36=E2=80=AFAM Yuzhuo Jing <yuzhuo@google.com> wro=
te:
>
> Fix the compile errors when compiling with -Werror=3Dsign-compare.
>
> This is a follow-up patch to a previous patch series for a separate
> issue.  Link: https://lore.kernel.org/lkml/aC9lXhPFcs5fkHWH@x1/
>
> Signed-off-by: Yuzhuo Jing <yuzhuo@google.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian
> ---
>  tools/perf/jvmti/libjvmti.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/perf/jvmti/libjvmti.c b/tools/perf/jvmti/libjvmti.c
> index fcca275e5bf9..82514e6532b8 100644
> --- a/tools/perf/jvmti/libjvmti.c
> +++ b/tools/perf/jvmti/libjvmti.c
> @@ -141,11 +141,11 @@ copy_class_filename(const char * class_sign, const =
char * file_name, char * resu
>         * Assume path name is class hierarchy, this is a common practice =
with Java programs
>         */
>         if (*class_sign =3D=3D 'L') {
> -               int j, i =3D 0;
> +               size_t j, i =3D 0;
>                 char *p =3D strrchr(class_sign, '/');
>                 if (p) {
>                         /* drop the 'L' prefix and copy up to the final '=
/' */
> -                       for (i =3D 0; i < (p - class_sign); i++)
> +                       for (i =3D 0; i < (size_t)(p - class_sign); i++)
>                                 result[i] =3D class_sign[i+1];
>                 }
>                 /*
> --
> 2.50.0.rc1.591.g9c95f17f64-goog
>
