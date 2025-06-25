Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AC31BD9C9
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750820827; cv=none; b=I2saLZneYFglYKKRkX3OjLHlDapTi+3SAKVvY9VW3Q3X0ePjHdE3HjGyyM7I1YJt0atHk2zKS64Ued2wzW4oWMgxycejFnqOIWJLhynIVL7xANktinxtsZtkgQ+WCoZ2IfUOFYUcwEhv8CumDT5FPa1NFL3/fWT/b/oBsnPj0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750820827; c=relaxed/simple;
	bh=HWjPwDZj4AYrI5s2xWuY005Yyfpvd9YxGA/yaqQFMX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7UDIc8aSrU1dDuMbzqXMWnN3I8dBqodyUPNyIZHF57SxG2o2OMpZb3N1jhmv+MtCsSlCWGD8/h/dkPX2mkxf/7JcZ7emnI/e/46SCadtyp5BfhK6A8goGufV/Bpe/BHpENGO8e/XJeHlN1OTSioziXmb3GFM+zeW2/REAoJDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZKi+07/N; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZKi+07/N"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so115985ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 20:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750820825; x=1751425625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sJ6iw27x1bdiGskY6DXK6RNFhJMqPKwnq1c8q+p4kI=;
        b=ZKi+07/NymtRmHJ7egoNkVMnNk2ZlzXkfLBXBw31NEL0FEWjYTapU5RbORHGXdvDTe
         R4q9uq2JGe+55zjtm0dFKXvos/u9heEk2yoJPIpLgm5bWPXqDSRxGyHBBDdpjuBE9VOi
         x0rpmPCRiXpiwcfiuzJvWZoyFHyTuWVMVXZkRNB/bj4Q+NjczpfwGY3hTZSgVtAkKPWX
         puvaAmSJPvUa54kg5vbip31LWxGdYvjtc944g6Qn39j4VvvwziXjb0Ekkr5UVW5qJNds
         4No1+H2UnpEjluFlLIC/0WhpobQMHOfSL0dVXRhcADjke6MqGlc2oNZZLms+OQDSBwBB
         DtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750820825; x=1751425625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sJ6iw27x1bdiGskY6DXK6RNFhJMqPKwnq1c8q+p4kI=;
        b=qIfbW/+taOgX0V5vLgPfNBnj362IMOC6CDwwt37OZSARwhe+4vNsOpCecXi/1o0aD4
         2Uo++0JZdbllclRRVcHZZ/e5XO8Na+SxrYN5fswy+UPxKmhOEgTbV7WKCwfpg16UYLhp
         VORGhXv6V3z+kc2XxYW/rbXvzszq+SaS/UeE5eRLkTiPmFRUeqxsXknMFazCY3zQSmdV
         Sqf5pw610K2nFEbzNLRYbcvMRZcgSVd5E+ZuQgMAqXpDf1l96TZtgsmQl3iM802BafTd
         8/yG9tBwIvmb7HH71fKMoZrUusLQhapuksuj4f0vM7I7S9cq7JxZVaUJFxWMm46b+QGA
         +C3g==
X-Gm-Message-State: AOJu0Yw5mc59id23FoJb3MMQWFriX0F9qqm+WvFkl8pdQdMa3Oq0HUVF
	Rn3wBKqMYUd+vqACLUVmXqjt7qmAjoZB91ecXl1e+E0amtq+0OHAkQTSpA1juRcCBgYrcxm97qp
	HRKG0JQIrRnwzQzSE8ZBSklpJOAsHKCRCelI7PUrl
X-Gm-Gg: ASbGnctBQEOnZUFtQc6k8Y/weXuqNAsNdlvZgP+AMtCtXiJWLuLO0oCPBDgCwdwbwLr
	QGm9MNoPkayrnkOsdw5pzU4zIn6OFciX3s9qSaPG8AQZNFkyDWqSolTbV8jtTFAHpX0KEbXiBDh
	r+v3of0kBWbKQd5S8/Te0yCWYcIW6d8gHmJVl9gTwVx8Zh
X-Google-Smtp-Source: AGHT+IEc4CQOOjtZnqCthbDqnGK69m2zD1CF+DKlSAeJif0KVdv1+iaNrFkuW9AL+by8fn8MUa8ZEK/6Be63sK7CUuM=
X-Received: by 2002:a05:6e02:2166:b0:3dd:c9c2:820e with SMTP id
 e9e14a558f8ab-3df35f9327fmr298055ab.23.1750820824534; Tue, 24 Jun 2025
 20:07:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603181634.1362626-1-ctshao@google.com>
In-Reply-To: <20250603181634.1362626-1-ctshao@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 24 Jun 2025 20:06:53 -0700
X-Gm-Features: AX0GCFuiPLOp0zul7Thf_2kwqjBV1z3YTlPXa-DLUQjOd3Owwdrg_D-hgcraP4o
Message-ID: <CAP-5=fVjA9630Com3xNWvgDHbwmsswQ8GEbqvnZ5QCtARQJuvQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] perf: Reveal PMU type in fdinfo
To: peterz@infradead.org, mingo@redhat.com
Cc: linux-kernel@vger.kernel.org, Chun-Tse Shao <ctshao@google.com>, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	james.clark@linaro.org, howardchu95@gmail.com, weilin.wang@intel.com, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:16=E2=80=AFAM Chun-Tse Shao <ctshao@google.com> w=
rote:
>
> It gives useful info on knowing which PMUs are reserved by this process.
> Also add config which would be useful.
> Testing cycles:
>
>   $ ./perf stat -e cycles &
>   $ cat /proc/`pidof perf`/fdinfo/3
>   pos:    0
>   flags:  02000002
>   mnt_id: 16
>   ino:    3081
>   perf_event_attr.type:   0
>   perf_event_attr.config: 0
>
> Testing L1-dcache-load-misses:
>
>   $ ./perf stat -e L1-dcache-load-misses &
>   $ cat /proc/`pidof perf`/fdinfo/3
>   pos:    0
>   flags:  02000002
>   mnt_id: 16
>   ino:    1072
>   perf_event_attr.type:   3
>   perf_event_attr.config: 65536
>
> Reviewed-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>

Ping.

Thanks,
Ian

> ---
> v4:
>   Removed the first patch in v3 since it is merged.
>   Retested to make sure the patch still work.
>
> v3: lore.kernel.org/20241106003007.2112584-2-ctshao@google.com
>
>  kernel/events/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 95e703891b24..bad563692d63 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -56,6 +56,7 @@
>  #include <linux/buildid.h>
>  #include <linux/task_work.h>
>  #include <linux/percpu-rwsem.h>
> +#include <linux/seq_file.h>
>
>  #include "internal.h"
>
> @@ -7077,6 +7078,14 @@ static int perf_fasync(int fd, struct file *filp, =
int on)
>         return 0;
>  }
>
> +static void perf_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +       struct perf_event *event =3D f->private_data;
> +
> +       seq_printf(m, "perf_event_attr.type:\t%u\n", event->orig_type);
> +       seq_printf(m, "perf_event_attr.config:\t%llu\n", (unsigned long l=
ong)event->attr.config);
> +}
> +
>  static const struct file_operations perf_fops =3D {
>         .release                =3D perf_release,
>         .read                   =3D perf_read,
> @@ -7085,6 +7094,7 @@ static const struct file_operations perf_fops =3D {
>         .compat_ioctl           =3D perf_compat_ioctl,
>         .mmap                   =3D perf_mmap,
>         .fasync                 =3D perf_fasync,
> +       .show_fdinfo            =3D perf_show_fdinfo,
>  };
>
>  /*
> --
> 2.49.0.1204.g71687c7c1d-goog
>
