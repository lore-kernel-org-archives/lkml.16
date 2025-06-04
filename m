Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F171E47AD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749060014; cv=none; b=QORpw/ziG1oUjerI7Leb+BfdAb7nKwVT/nGGTNbcAlf2IfkAbqTDP3JAIw8vYQ3ujEyxEsCbO1c1j8WlymLlNQ9iHM47Y257qI8XRe5FmB3kmwFqKcd9kEDEyGYVhlTVvZlrj7VaKEdlyjhmCpKrX153Y6lmsYRTxDXbS+JN9sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749060014; c=relaxed/simple;
	bh=mQdiMLwpr/D/RPPJncE98Kj7r844XBV8j5bb0XC5diU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msPMk0K8y+qL7pgx3zYXHBw3dYyxaxkI9kLpBbLiYNNKdBlIEGiZ+m9us0PgdWv+JB0pktckULTtS+0tN57OxzDZV4uUi71Mh4s0ZQspWC6K3DtligMQZFlXKyXYSkGFVmsOS/zDQeeGdUbJYl3hfxI/MCLwN5WU+kNN2aEhAIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G3Bdgbe8; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G3Bdgbe8"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3dd89a85414so350415ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 11:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749060012; x=1749664812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeYxgzkU7+N1oJQSpf8JCDFCeNTG/MQ78IVMo3IFmU4=;
        b=G3Bdgbe8FjVIG6PG7d+iKg6pGWfGStDtZ7mOZehvv7gASpy+q8E6MqVlqoDklJOg54
         wvA2844DfjNZ1O7yL2bo5ZS0eVuLT9NhGGVc3ND/4y0zrcCeJvsSPYNbnv7firv3y9sa
         IA2Lv5BFxkoOzHR/Zg1f8Ekah4ieRoaS0iAucwCgayP4nLSI5KZwkh2LVJ5f46YT7DR7
         Dj0+YBZwmq0WSiQlpeUY5L/cKVf5xb123fy/RR+secEN7AyAtnjh9D1GdxzScBHCRPPj
         nDyQpiHXCCu1kGVI/kZvEH9egB0jqNMA7BGxut58nKcruuUxo/rulruSXe0Veu/7NIOe
         FkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749060012; x=1749664812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeYxgzkU7+N1oJQSpf8JCDFCeNTG/MQ78IVMo3IFmU4=;
        b=LGTCOXNRxIzZt91Ln58tc1tGeeW/ccYD1oYgjG1Ovv4A8g+HmZPoWYjgJCCPaARW3X
         ji3Z2b8qhXrF1Og9AXWPNcftzb615CWsIVKgUsk4FUskLRd6hvL+JzNCBiMBennMAAiu
         wqPS1TUzsQAyiMWjOL1X26YidaOg8HwJLjLGDxJV1phIjnHK9z7B/ns2mkvLE12i6HPv
         jETJlI9ZhgRXgUc8uJ72BfSb2ljCGRSwbwgqm5+zOwsMtycsU65eg6BkaEfC8LMq11GI
         ABZDnDBZRIRgeCam413FERiztbbx2VTx3Lw4huOzoRb2tmXTTsEEzRy9DLTVz65UJpsb
         GeXg==
X-Forwarded-Encrypted: i=1; AJvYcCXc5yV74UU4xKM+HRj5PyGRgZOARbmAriT0JFN52aqjPi+8g5na1txmxD+6pRYPfCvbcXGiE43BH96ujOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHno+96jCEO9qR9SJw+hKrVfhG5HLDH+OvKD4UZqGjlDY0/7N
	8Gll4LeD3w9gKpL3YIBy1hXJmRACo4PWxNEaLkKdEZoaukzoLMXyE1a3LnUb7zKsRNYfi+Ww5Qs
	yELHBxnBy7NDgfYTDiBHC08vNXnHmaWSsTK1x8GED
X-Gm-Gg: ASbGncuYVf3RetAG5ry2k9vC1KvDVhWNNPduzmlom49YfdDjCvuJwgoLM/d/G53UBb2
	NU8w6OlKc1+IQnfSZqo9SvS9wMUrEeeQJ8ySqvXSrT1i7PgOgvSaj3D3rl7YNeKMxvlQAfLSK/9
	CGAssmGWcVdEBh/tTYzDSfFH7IqMHSIt/7OEJoQ1mhZvcrGdHSnjLCi7TlK/mef+TjncYWiWZ1e
	KxZo/OXhQ==
X-Google-Smtp-Source: AGHT+IEGn3VhIfD4mAYNEfZ2xYER9px3sByFf20vfnRXqAcQWgWdAHxhv3CB1nPOxAYy1IIkeODTEC51HzYp/FlFI64=
X-Received: by 2002:a05:6e02:1a4b:b0:3dd:c526:434f with SMTP id
 e9e14a558f8ab-3ddc6af8682mr1805ab.9.1749060010927; Wed, 04 Jun 2025 11:00:10
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604174835.1852481-1-namhyung@kernel.org>
In-Reply-To: <20250604174835.1852481-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Jun 2025 10:59:57 -0700
X-Gm-Features: AX0GCFv9ejXA-mo2bEchLXhzhQCtWd1_-nEiRTzMrsm4OHcJFIYtAPHkL-IUT5k
Message-ID: <CAP-5=fWap82Wjx2EBTESFsTxSikkJ3TW7B_jSjhUkgfheQu_xw@mail.gmail.com>
Subject: Re: [PATCH v2] perf bpf-filter: Improve error messages
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 10:48=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> The BPF filter needs libbpf/BPF-skeleton support and root privilege.
> Add error messages to help users understand the problem easily.
>
> When it's not build with BPF support (make BUILD_BPF_SKEL=3D0).
>
>   $ sudo perf record -e cycles --filter "pid !=3D 0" true
>   Error: BPF filter is requested but perf is not built with BPF.
>         Please make sure to build with libbpf and BPF skeleton.
>
>    Usage: perf record [<options>] [<command>]
>       or: perf record [<options>] -- <command> [<options>]
>
>           --filter <filter>
>                             event filter
>
> When it supports BPF but runs without root or CAP_BPF.  Note that it
> also checks pinned BPF filters.
>
>   $ perf record -e cycles --filter "pid !=3D 0" -o /dev/null true
>   Error: BPF filter only works for users with the CAP_BPF capability!
>         Please run 'perf record --setup-filter pin' as root first.
>
>    Usage: perf record [<options>] [<command>]
>       or: perf record [<options>] -- <command> [<options>]
>
>           --filter <filter>
>                             event filter
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

> ---
> v2) change fprintf() -> pr_err()  (Ian)
>
>  tools/perf/util/bpf-filter.c | 28 ++++++++++++++++++++++++++++
>  tools/perf/util/bpf-filter.h |  3 +++
>  tools/perf/util/cap.c        |  1 -
>  tools/perf/util/cap.h        |  5 +++++
>  4 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/bpf-filter.c b/tools/perf/util/bpf-filter.c
> index a4fdf6911ec1c32e..92e2f054b45e91dd 100644
> --- a/tools/perf/util/bpf-filter.c
> +++ b/tools/perf/util/bpf-filter.c
> @@ -52,6 +52,7 @@
>  #include <internal/xyarray.h>
>  #include <perf/threadmap.h>
>
> +#include "util/cap.h"
>  #include "util/debug.h"
>  #include "util/evsel.h"
>  #include "util/target.h"
> @@ -618,11 +619,38 @@ struct perf_bpf_filter_expr *perf_bpf_filter_expr__=
new(enum perf_bpf_filter_term
>         return expr;
>  }
>
> +static bool check_bpf_filter_capable(void)
> +{
> +       bool used_root;
> +
> +       if (perf_cap__capable(CAP_BPF, &used_root))
> +               return true;
> +
> +       if (!used_root) {
> +               /* Check if root already pinned the filter programs and m=
aps */
> +               int fd =3D get_pinned_fd("filters");
> +
> +               if (fd >=3D 0) {
> +                       close(fd);
> +                       return true;
> +               }
> +       }
> +
> +       pr_err("Error: BPF filter only works for %s!\n"
> +              "\tPlease run 'perf record --setup-filter pin' as root fir=
st.\n",
> +              used_root ? "root" : "users with the CAP_BPF capability");
> +
> +       return false;
> +}
> +
>  int perf_bpf_filter__parse(struct list_head *expr_head, const char *str)
>  {
>         YY_BUFFER_STATE buffer;
>         int ret;
>
> +       if (!check_bpf_filter_capable())
> +               return -EPERM;
> +
>         buffer =3D perf_bpf_filter__scan_string(str);
>
>         ret =3D perf_bpf_filter_parse(expr_head);
> diff --git a/tools/perf/util/bpf-filter.h b/tools/perf/util/bpf-filter.h
> index 916ed7770b734f15..122477f2de44bb60 100644
> --- a/tools/perf/util/bpf-filter.h
> +++ b/tools/perf/util/bpf-filter.h
> @@ -5,6 +5,7 @@
>  #include <linux/list.h>
>
>  #include "bpf_skel/sample-filter.h"
> +#include "util/debug.h"

nit: I'd generally avoid the util/ prefix here as bpf-filter.h and
debug.h are in the same directory. The compiler first looks in the
same directory before using include paths:
https://gcc.gnu.org/onlinedocs/cpp/Search-Path.html
So including this way is saying please search using the include paths
which is weird when the files are in the same directory. I know the
style in the code base is inconsistent with this, but I wish it
wasn't.

Thanks,
Ian

>
>  struct perf_bpf_filter_expr {
>         struct list_head list;
> @@ -38,6 +39,8 @@ int perf_bpf_filter__unpin(void);
>  static inline int perf_bpf_filter__parse(struct list_head *expr_head __m=
aybe_unused,
>                                          const char *str __maybe_unused)
>  {
> +       pr_err("Error: BPF filter is requested but perf is not built with=
 BPF.\n"
> +               "\tPlease make sure to build with libbpf and BPF skeleton=
.\n");
>         return -EOPNOTSUPP;
>  }
>  static inline int perf_bpf_filter__prepare(struct evsel *evsel __maybe_u=
nused,
> diff --git a/tools/perf/util/cap.c b/tools/perf/util/cap.c
> index 69d9a2bcd40bfdd1..24a0ea7e6d97749b 100644
> --- a/tools/perf/util/cap.c
> +++ b/tools/perf/util/cap.c
> @@ -7,7 +7,6 @@
>  #include "debug.h"
>  #include <errno.h>
>  #include <string.h>
> -#include <linux/capability.h>
>  #include <sys/syscall.h>
>  #include <unistd.h>
>
> diff --git a/tools/perf/util/cap.h b/tools/perf/util/cap.h
> index 0c6a1ff55f07340a..c1b8ac033ccc5826 100644
> --- a/tools/perf/util/cap.h
> +++ b/tools/perf/util/cap.h
> @@ -3,6 +3,7 @@
>  #define __PERF_CAP_H
>
>  #include <stdbool.h>
> +#include <linux/capability.h>
>
>  /* For older systems */
>  #ifndef CAP_SYSLOG
> @@ -13,6 +14,10 @@
>  #define CAP_PERFMON    38
>  #endif
>
> +#ifndef CAP_BPF
> +#define CAP_BPF                39
> +#endif
> +
>  /* Query if a capability is supported, used_root is set if the fallback =
root check was used. */
>  bool perf_cap__capable(int cap, bool *used_root);
>
> --
> 2.49.0.1266.g31b7d2e469-goog
>
