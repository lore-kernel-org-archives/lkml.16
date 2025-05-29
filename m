Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF2719D8BE
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748547133; cv=none; b=YcE/BGKAx1Fz7g031Tes18dwxCcbMd0DPQpgdXImLS0gSqmnUNaPJH562eWq9fg6rSG1db1fvxUV6BziuNAgiKKA/rPO7X/GS94e3u0pylo/6OkH7Aq36xglGQfdjrku61SdC1QQ7we5PajBbb5u7iIzOLHTKB0NNxiuahRPRAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748547133; c=relaxed/simple;
	bh=suM0mpQZuZDS7U6qEAaXfPk2BgJKHIMN0K7aaC2BNg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXLMVCtFSFP+ejxjy5No//+oNq3A6UMkkz9DAx8WKofx+4VgFSkr/iKVjPuWem49e1zUu5z0VkRGxIc0YTLEVh4RKnX/CMGhtbj7FgIyrVb8Njp4frCiZwv1yVLwvAHQzioiQeYjJF6JasguRraHtpp10+FRpNIp6SOFAh+kvtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m45fz7MA; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m45fz7MA"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so1585ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748547131; x=1749151931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUjgQ4y3US2h0NEsYkvYyqgrSdwAy2IN0hLNscKaed4=;
        b=m45fz7MAJm+X+o8+ltUGl1pHU7lkrTm+X1fXZ1t5ll3BELkQXab/0ddIgf92PC+Z7k
         zHzlqvb8KIsGcz5J11CyMtZMyW6aF37W9zwWf9By+aC9SQZAnlJ+c1FC1opVmBek31Pp
         /Plcwpcmh6BNvBiTienpYIMw+8pzev29bvJPJ8Vzz7H+Sj9301e46txnp2VYIkKFVwz/
         P58fNH93pp3h6T+Y3HH8wgD8kR79VK9nM5Y71x5BKvTDj+G3yBy9lvS7JKoy8NgyBQa6
         az/fUQXedPWvK2W8dapH7ldErmcNg/5H7DN9rdnwp03qriPPYUz5Dkex5Waqc1VfFlvT
         vnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748547131; x=1749151931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUjgQ4y3US2h0NEsYkvYyqgrSdwAy2IN0hLNscKaed4=;
        b=iMOHq7vDtBzyzue71pQrxkqUSUmDrvwUWYS2TNfCyNw1Hr3OGeVM4nJb4oq7aWFPgb
         C7Bw0QDBGEyKkCdeb6k42eCarEXY/b5IrK96E6Hd4X/3FjUlZojjQUtS3MAQXcQmH9Tk
         Aw+lxR7v30U6lapoq6+GlQV3BnPs29c/Qg2F1OX8GBTP5+SRK7ACXk8BrLLClykCKTWu
         B6HXLa3FDk736I5624KSoR4C+xS6J5b0SUr8yeS001Ci3/4PdeisdGoeprxInWiJLVpb
         dIpLRsjzlAscxCp0R5kzWbBwJGBELhzQ/ZVyXk7ki+s5azhs3rllR+IKW2umty4CnkcH
         ZwiA==
X-Forwarded-Encrypted: i=1; AJvYcCVNKPGI3g603pYGNcfmqRxqBGQOC/xQCztr5yhFPS5FVfApAKpJv9M3mD5y5kD9zdR6xtKLKSd1RfIMrCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd1Ey81SmLraYtkc2DMUvVUcpv3OXklyvv6E9PPW4wNe81sJuh
	wFfX1tZ7cfXMAlepqziY2O3LzMNmC0TGaokI6L0b4PXfdSmg5sqvCRVXyjC9Gccpig5+hSdLhXC
	tBCEnSZ0gF/KeGSCqgSJFUdc0ATjFkvYlx5sQrqlT
X-Gm-Gg: ASbGncsowD3hnfH7c1tDQXIiJ5fQ0zm4lbbVdS/eUYg+qQP7tezLvjjjZL4hAZydRlY
	Al153sk0oX0athJGsl02sSe2C9cbwE+y1jwm1j53/4pDgeY0T7ap04aqkcgOBcwIUDfpWXC2OxQ
	K3r96mkHe/vAU4tr2lzIcbbgQPbtN+D2/fngKRTB1wHUsCWUPBTOwJbffet2JsgBssLxNCxhw6y
	Bx1IR+JbqU=
X-Google-Smtp-Source: AGHT+IHuIlvzAfaUZ+xk0wfbMoT5HjP4Fti+GvjUYo8urDejem60iRe8E+38zbjvpQcsccg2Q0gW6DcrObbSjSXcSM0=
X-Received: by 2002:a05:6e02:1486:b0:3dc:7bb8:9f08 with SMTP id
 e9e14a558f8ab-3dd9a6bfcf5mr577735ab.14.1748547130836; Thu, 29 May 2025
 12:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521225307.743726-1-yuzhuo@google.com>
In-Reply-To: <20250521225307.743726-1-yuzhuo@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 May 2025 12:31:59 -0700
X-Gm-Features: AX0GCFuGCembv2mpvjm70qwKFTqfL7Uq8kN6sHwd3VIVLcCpIWuoZMUO7YL4Ymc
Message-ID: <CAP-5=fX-Hy-YLD_P_73Z2+7PfPnSU=0e5yaDgoeZ3gw_getaYw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] perf: Remove libcrypto dependency
To: Yuzhuo Jing <yuzhuo@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, James Clark <james.clark@linaro.org>, 
	Tomas Glozar <tglozar@redhat.com>, Leo Yan <leo.yan@arm.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 3:54=E2=80=AFPM Yuzhuo Jing <yuzhuo@google.com> wro=
te:
>
> Currently, genelf.c is the only file in the perf tool that depends on
> libcrypto (e.g. openssl), which only uses it to calculate a SHA1/MD5
> Build ID.  This patch series pulls in the SHA1 implementation from the
> kernel tree, and removes the libcrypto dependency from perf.  This also
> switches the default Build ID calculation method from MD5 to the more
> commonly used SHA1.
>
> Yuzhuo Jing (4):
>   perf utils: Add support functions for sha1 utils
>   perf tools: Add sha1 utils
>   perf genelf: Remove libcrypto dependency and use sha1 utils
>   tools: Remove libcrypto dependency

Tested-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

>  tools/build/Makefile.feature            |   2 -
>  tools/build/feature/Makefile            |   4 -
>  tools/build/feature/test-all.c          |   5 -
>  tools/build/feature/test-libcrypto.c    |  25 -----
>  tools/include/linux/bitops.h            |  10 ++
>  tools/include/linux/compiler.h          |  17 ++++
>  tools/include/linux/string.h            |  22 +++++
>  tools/perf/Documentation/perf-check.txt |   1 -
>  tools/perf/Makefile.config              |  13 ---
>  tools/perf/Makefile.perf                |   3 -
>  tools/perf/builtin-check.c              |   1 -
>  tools/perf/tests/make                   |   4 +-
>  tools/perf/util/Build                   |   2 +
>  tools/perf/util/genelf.c                |  72 ++------------
>  tools/perf/util/sha1.c                  | 122 ++++++++++++++++++++++++
>  tools/perf/util/sha1.h                  |  41 ++++++++
>  tools/perf/util/sha1_base.h             | 103 ++++++++++++++++++++
>  tools/perf/util/sha1_generic.c          |  49 ++++++++++
>  18 files changed, 373 insertions(+), 123 deletions(-)
>  delete mode 100644 tools/build/feature/test-libcrypto.c
>  create mode 100644 tools/perf/util/sha1.c
>  create mode 100644 tools/perf/util/sha1.h
>  create mode 100644 tools/perf/util/sha1_base.h
>  create mode 100644 tools/perf/util/sha1_generic.c
>
> --
> 2.49.0.1164.gab81da1b16-goog
>
