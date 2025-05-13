Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628BC1C8632
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148335; cv=none; b=JMhExdd53erC//1THB9KZpUatBW6MAdjNm3HYhUcDZz5yZwpY35Ez2Kg4biLu9eMrfzCoplv/L/k2i7AR40LG3Tu6tODY1AWD4kh6/ZnHZNImOvBzAFNt8fFu/R+rAnjEKC1A41gjgCWGM1WSOQCTnR5Fx06LCeC08zY/nQBXS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148335; c=relaxed/simple;
	bh=tfepnkRSYfeOewnGVp44vpTV71/1+cb85Xv4c75tmN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLt/quFXED7lcvUPeCXxCQ7sBTq94gt8sae69CnD0SJ8Ya5WhvHx/v+F1nX4cElDB8GxCZYhtbk5U0bcJfsC8D87CddiZCPImr93T0xRemzmhmn1I34JFd0Xk74ZojVUl1olc2EKBOHXHUBqshK4le7uXNjpvH/3Kqx7Www8G/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hpUnQCmQ; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hpUnQCmQ"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so174795ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747148333; x=1747753133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMLtJEXEa+JxCThnWA+Qw3y9/cF6frKLdP3FzJRv8bo=;
        b=hpUnQCmQc6WAq4jhE4G+z/POP5R5TUNXIEKfFob62ME8/rgaPn4GSzuWD+Bq8TyhI2
         VvBILR2l26B7tBrWRoIzeEUhmmCTlQ1yN+kL4OzIVvhXm0Zkm9sw++SaKZ0zZh0qFw5/
         IkSwbUhnWES18HWgA2aCsUd9hbJCIlbk9ISbvrOHJM1/xXP59ECvExZlEO5g1EsRBJ/6
         5g37TC2ApqkviFiRdbdyuI3xNoWjKABZPbxFO6URVVhDBDkkfGvX4dTIO1FLlipmbr5g
         RUFbSYYJ/+Jdy9ebADYxZlgne37pKMbIHI4tgypTr2iitCEtwS5WCKx4IXkJvBmq5lBj
         TXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148333; x=1747753133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMLtJEXEa+JxCThnWA+Qw3y9/cF6frKLdP3FzJRv8bo=;
        b=GuQpjkkPFrfv4dRM4076vb5o7Yc3Z9YYxUi9/HerAYSK3PH8L37zTP0xf1hE6UGFsX
         nd3izTbkoe3pzRS3URMpeilU5oId2FqhoHGJ6IgwB6X+ylo5ZpKaVHvgTdQR31asFGaF
         xGFl5yFD78XHUxg5tKPEjuePp9jMswCRNQaE1r7KKdaNJoaXPdZx1Gs74XMjyLfp8/Z9
         Hd/OrfcugZprdFdY0W0te+qmWjKURXAgUoa93Kdjg4IqO4DzqdgSDrLqv1osX4o1N/Xa
         GlLN1135Y3r9IZiilY79fMFyeMekw2+KTFWnvbZw/7/3K1HCsEwbaw9oJUYhsIoL98Ub
         xkew==
X-Forwarded-Encrypted: i=1; AJvYcCU8KUrFn2bRbby4yGGgk66KB48wB8kfTABF7QKyhEXU0a4EQIw/UewPxnHtT8q0X9qqYyVyQjFMdi9XiJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKD7/ShjR3/nvRsaCZCfJzUWLuO22O4DtZYIWM/8TB1wsTi4vg
	KWZyRnxsUf9/gYp51Z4oYPe3OHf/MTE4ZboC2NGpkOcE7qCiXmjs7YKIKzUHunjd8Upt4TAw22z
	ZUhc4TmM/vkM6Q1JzYtM+Qx/C4XFxxn+6zau8FEOn
X-Gm-Gg: ASbGnctCIP8PWqe9yBUmrSIp8sT5Eln7Fw8DQKpuEMYEeXJpUm0Fbnl8l5Noxi73DyK
	L/0dtHQJ9EDYhpEuyec3ETqvtWychpzHumVb/JWUFrZqiPa1zM6qDf3mHdkpIEuDttY2aMMYmCE
	bA9OBHzAUjdA4/m8b8VXGf9tkaIM5kePq1BnQZK8/WDB6FTQnz5/deACG8HUZc2w==
X-Google-Smtp-Source: AGHT+IF74IIY/0jhS+2GSY32PBNkpCfrOlZIg/ea9M+72KHGLhsaJJmebZ73DSz+cTM5+JyRQ3K5fraofDc5uDz6iPY=
X-Received: by 2002:a05:6e02:3186:b0:3d4:2362:9fbc with SMTP id
 e9e14a558f8ab-3db67ad1566mr3694005ab.27.1747148333236; Tue, 13 May 2025
 07:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509213017.204343-1-namhyung@kernel.org> <20250509213017.204343-2-namhyung@kernel.org>
In-Reply-To: <20250509213017.204343-2-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 May 2025 07:58:40 -0700
X-Gm-Features: AX0GCFuqb0zKWHc2TH-_5OUvDAwdKGfVGYEWts_ndNEqqEGXb2ZoCtS2NYX3crA
Message-ID: <CAP-5=fWNtD5KfMCd5Fy7oKfVgXrgO=1jkhP2cxw204sKjyUxAg@mail.gmail.com>
Subject: Re: [PATCH 2/2] perf test: Update sysfs path for core PMU caps
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 2:30=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> While cpu is a system device, it'd be better to use a path for
> event_source devices when it checks PMU capability.
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/record_lbr.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/shell/record_lbr.sh b/tools/perf/tests/shel=
l/record_lbr.sh
> index afad02d0180e023c..6fcb5e52b9b4fcf6 100755
> --- a/tools/perf/tests/shell/record_lbr.sh
> +++ b/tools/perf/tests/shell/record_lbr.sh
> @@ -4,7 +4,8 @@
>
>  set -e
>
> -if [ ! -f /sys/devices/cpu/caps/branches ] && [ ! -f /sys/devices/cpu_co=
re/caps/branches ]
> +if [ ! -f /sys/bus/event_source/devices/cpu/caps/branches ] &&
> +   [ ! -f /sys/bus/event_source/devices/cpu_core/caps/branches ]
>  then
>    echo "Skip: only x86 CPUs support LBR"
>    exit 2
> --
> 2.49.0.1015.ga840276032-goog
>
