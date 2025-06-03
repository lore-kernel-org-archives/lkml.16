Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16F421FF35
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748982440; cv=none; b=Zzps0lV6ICbCgLzXEy7Cp5x+UuPHmy+om80bv+cslsmdWvzJhyFk+Q5kNtvcMSu8h64NdpRZV3qzpX/dDpd5/J4X5EX4AqGVfavNosFkJorVamUTp5qIeAZ+auiS6tJ9q9gx57FYUJH1PvEfNMrcWRuB2F8nas0d2wcvtXnUqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748982440; c=relaxed/simple;
	bh=FkyXOZFJS2JTs2yvyJibGlBLckskxePeubP27I+ZqKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWvGYd5Qs1tZa5SMueOEYn9okfjJ+CGWWTJPrnzaJqYwfE+3+mlKCuh4VyecOKlRIEo0skTbXek3lwyeLcC0WVQReoYm2GVd93NLhGqdbazVDX6YUJI+jU3lANhSHl7zgnXjSq0/OTKn1yWeVoFvOOTrRZO98T3UlrtGWy1gQ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pzIr5FP0; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pzIr5FP0"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-552206ac67aso6773563e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748982437; x=1749587237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+IyIfkIPOra+AocHu+9QAm2JwpYmUQiCUktZpdyAo0=;
        b=pzIr5FP0y+LAGAeiFLCW2qeJIr36wbZfSA+M411vWFufTscHXuDgoaNpVoMPmEf98g
         42yY5DDZQh4zPFZ/MP5pVfmb/WSlO4l4QAB1kYKBIBbUrtgsm5q/I0WsmspFiadKscxH
         C0uL6lVYzlUClOBrnuSvARjGSLRVzPUBp+3Dp09XvAtrN/j8+zE5tqGNbvx6pa96g0z/
         YcALG7xmN+ClYNaokmehDCce2qEfD1FsjzBpFlWNmaSp1BFeCuZat1t16idz3NVNVZS5
         /mJZpvlyh1UYWWn/AWpZ0HHlCLo9Y+QFJlSLfHvnFHgUVBH16wSMBxhYxruL2nmDORGK
         oR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748982437; x=1749587237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+IyIfkIPOra+AocHu+9QAm2JwpYmUQiCUktZpdyAo0=;
        b=h9v9R4+4T/lCgoH7qC+bUNUi9FTAfrSf0toJSO7WZhR6j68lbO4yVZ4E3rnE84MkqF
         YXhxxWdhWBCGcuLr0QOgOAaFNvOnj/wh5S7lsHK2W4EHIEyllry0SZRaBb3l6elHLNmx
         hb3C6dWbXdEYm1+oviICQ6YUIml3ONK5OQIwr49LzDcYyVoHRezqHHojDWA/vgh1utaV
         HEmrMozlhLrDjHOPIZj6aE+cF9NmfCGvRLohLEZH4PXa2Qa6CU/TIq8GaIjDCO19T5vX
         JyajDYmpa7fQbu8j/MW1Z2DaeSg45aYiGqu/HiR2qBWfBBXp1jpuLKODujR8qbk8Rk78
         mKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPFS+QX1jOHo+EsPU73UZRK565H1XP23OUGZJPN8ahlLDiDx864XwGC5vt1y7hgBw+MDW8X8MM8vv1gg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhYryqvQiXfMVSEs/1HtmSlKJMc3eDz+/tO6MiurpmU7hg8F76
	Em0JcdwwmoRBRWiY5ws3Qi+DspU/x9ASDRPDh11aNZAG6h/9r4dsNPw1OY5lIqUWAeLp7D8TWhN
	6PdRV8i5zoZv5CWleDZDrb4d2TAiC4s/Qe8P3EEY6ByVu2npXLAuFudkf66Lm
X-Gm-Gg: ASbGncvk6fuy8dOElvzp2a0NJo6Sr3g+0qOcZM67Fg96W87d0cmFXsp+cDGebKPIFcK
	7NcO6T5Unwpbu873cGPg99Wz5FXQU22gLn2EMSSSP/yGEruzLVr4igfUE9/qbJJbVWDnNSBy+vj
	sn9F8JPeFUv5oMrvKQH747Etmg/s87rmPDSBBS/thMK3/ZscIs8vH3UhHCLOPGlBa56aGOZlAu
X-Google-Smtp-Source: AGHT+IFh1B+A+fdjQ0CvAxPbjMYP1A9rdTXQW/HM/GhCzzE5FNCpc4tMd+qHVqr75+gws1rXT4Ypm9ihHODwnJj5SLo=
X-Received: by 2002:a05:6512:124b:b0:553:399d:58e6 with SMTP id
 2adb3069b0e04-55356df9977mr125129e87.31.1748982436553; Tue, 03 Jun 2025
 13:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603201036.44504-1-terry.tritton@linaro.org>
In-Reply-To: <20250603201036.44504-1-terry.tritton@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 3 Jun 2025 13:27:04 -0700
X-Gm-Features: AX0GCFuuX4lVBQbzNpicNH90nbJZyqUiFq9bOfP2TAZziYhan0ThpfFSgl5qplE
Message-ID: <CANDhNCoiKjPOyGwiu5Apg2y4LduPTRQvEjG7snmbzrenZojAKg@mail.gmail.com>
Subject: Re: [PATCH] selftests/timers: Fix integer overlow errors on 32 bit systems
To: Terry Tritton <terry.tritton@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	ttritton@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 1:10=E2=80=AFPM Terry Tritton <terry.tritton@linaro.=
org> wrote:
>
> The use of NSEC_PER_SEC (1000000000L) as defined in include/vdso/time64.h
> causes several integer overflow warnings and test errors on 32 bit
> architectures.
>
> Use a long long instead of long to prevent integer overflow when
> converting seconds to nanoseconds.
>
> Signed-off-by: Terry Tritton <terry.tritton@linaro.org>

Needs a Fixes: tag?

> ---
>  tools/testing/selftests/timers/adjtick.c             | 5 ++++-
>  tools/testing/selftests/timers/alarmtimer-suspend.c  | 4 +++-
>  tools/testing/selftests/timers/inconsistency-check.c | 4 +++-
>  tools/testing/selftests/timers/leap-a-day.c          | 4 +++-
>  tools/testing/selftests/timers/mqueue-lat.c          | 3 ++-
>  tools/testing/selftests/timers/nanosleep.c           | 4 +++-
>  tools/testing/selftests/timers/nsleep-lat.c          | 4 +++-
>  tools/testing/selftests/timers/posix_timers.c        | 5 ++++-
>  tools/testing/selftests/timers/raw_skew.c            | 4 +++-
>  tools/testing/selftests/timers/set-2038.c            | 4 +++-
>  tools/testing/selftests/timers/set-timer-lat.c       | 4 +++-
>  tools/testing/selftests/timers/valid-adjtimex.c      | 5 ++++-
>  12 files changed, 38 insertions(+), 12 deletions(-)
>
> diff --git a/tools/testing/selftests/timers/adjtick.c b/tools/testing/sel=
ftests/timers/adjtick.c
> index 777d9494b683..b5929c33b632 100644
> --- a/tools/testing/selftests/timers/adjtick.c
> +++ b/tools/testing/selftests/timers/adjtick.c
> @@ -22,10 +22,13 @@
>  #include <sys/time.h>
>  #include <sys/timex.h>
>  #include <time.h>
> -#include <include/vdso/time64.h>
>
>  #include "../kselftest.h"
>
> +/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architec=
tures*/
> +#define NSEC_PER_SEC   1000000000LL
> +#define USEC_PER_SEC   1000000LL
> +
>  #define MILLION                        1000000
>
>  long systick;
> diff --git a/tools/testing/selftests/timers/alarmtimer-suspend.c b/tools/=
testing/selftests/timers/alarmtimer-suspend.c
> index a9ef76ea6051..b5799df271ae 100644
> --- a/tools/testing/selftests/timers/alarmtimer-suspend.c
> +++ b/tools/testing/selftests/timers/alarmtimer-suspend.c
> @@ -28,10 +28,12 @@
>  #include <signal.h>
>  #include <stdlib.h>
>  #include <pthread.h>
> -#include <include/vdso/time64.h>
>  #include <errno.h>
>  #include "../kselftest.h"
>
> +/* define NSEC_PER_SEC as long long to avoid overflow on 32 bit architec=
tures*/
> +#define NSEC_PER_SEC   1000000000LL
> +
>  #define UNREASONABLE_LAT (NSEC_PER_SEC * 5) /* hopefully we resume in 5 =
secs */

So this seems to be undoing commit 80fa614e2fbc ("selftests: timers:
Remove local NSEC_PER_SEC and USEC_PER_SEC defines")

Would it make more sense to fix the NSEC_PER_SEC definition in time64.h to =
a LL?

thanks
-john
