Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2792524503F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297413; cv=none; b=FQND/vpSwTonMq2gYeMI1OJ2PWyPRB5P98au0ogFpCsOGoD+oAd3YyDOa9YgTXDQUVR5d31UHhX7MtWm0p6fzBjltZC7hG/3cyx9xRJ9WtqJCixTwkf3FmSZVrro5Lmtomkvi4HSWjI593ZHqtCCPrjt5WvQCZxLU4x5WQHOntY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297413; c=relaxed/simple;
	bh=BllDOR4O1NYlxxDEccGjhAe0ikj+1xUpBu6bzDAPMFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gTeVax3Ef7Y8f5TLxn2QgnUe02gskKYdbqJY8+v4FC/O1tmxYJ9L+M40FVvrhJX6BYHY7/4oD21Q6q/sq99SGRvis9EHZPJmyv9Px7c7/8w3iUoGGvgmqKxW7lGFrfyV6U6AXCSgdbc5U9EEA40Q+zbfqTUrgYFWf0uC+EKENWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qhW26vG/; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qhW26vG/"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so528865ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297410; x=1751902210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6opsNc2co1b9mTJ74/l+IUJLN4M52h5MNn2ClhbIZEs=;
        b=qhW26vG/Mr7tzUf/NC4FY+VqQ4ywMFyFt0L9pd3tpIz+Wyvw8wh7MyBxFsFVFXslZ5
         Qv8rrnrBMC1B6dwdOnhmJ9Pc9FcuZcCBqzj3mdWwtvSFy6WD5E/v9j0/xLQMT3FFIPMh
         kA6G51xet84pjsUU13J/+Vi1kgHgevaiKpj7WB/+7T6vFYnmSxbywV+nNMOFrM81K+7O
         P/EycJVficsau8uHoDc/dXUXaF02wDdElZS8aUP0/hdg9K4mAL1qe0iu3Lkiwzf68xQM
         67EctCmIE0NBobjSr0kP02GZNe6sxMUGubDygdAL9YKgL4uXo3Umm7Hf0CGSlfpxsydE
         ig/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297410; x=1751902210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6opsNc2co1b9mTJ74/l+IUJLN4M52h5MNn2ClhbIZEs=;
        b=WsXZkP5PQ5oQmYZTBCDV5VaBmEPsnzL14x5NsiN/6Y8n1/jNZ3LKfIfDOHSBksv9eJ
         yQQ4GLeCTQCkn5vkCodZfd1lwRlF8sRE1eGzmTi0r6Q59jE1Sdd1OUii0QhdZiWU3RGn
         guFeZXQU8OyBbTuw2hrxV39glUNNAUMxe6u88rMOqoBQtCgZlqJyfmIJC1RSRh8zNOoG
         XvjtW7j790wrOQpLAJHwTnsmPF5wy8jLaSST2FVn0gONnmeXdihiaHNNCNOfK058zMF4
         HlMzidy/cUSXEp6uXAxR9EVNUsJOuJAOMcK9R+RMasFjAkjd7Mnp9Bqjy79I7qoZeGb6
         w7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPC243WtWWR3SHraCRfvlHZZIe8mhQw58X2xWS3MC+fBFsR7Kk/TH9JK+ru6cxHNUIurQbMwnDH+EB9rI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznsRLwiZ6tjA5YIw0ftf+GK/IkRla4R/S8dHSZBUMh07hQbFtj
	j+ADQqRhvmhTjXzaGmVh27ikVb4tdazSopcaMlRKq1I4/9b9q3svws9+HLbWh0u9E2z6ZEXgXWo
	uCRzJnCFmaiCk7kLeReFNdefpXK0Z0DDxLOAKgF/Q
X-Gm-Gg: ASbGncuDT96FSamvAraGq+q0p7wmZRDGu0hLuNtsOe6rptc/obqmPeW4Edb5AYoOHZA
	bn3G2RDQaGT1MA4rJpq6GeuLvgS1Pk8yQuQGtdy0Ga6GH0DxiOkqeUwCvmtDtsRJxuMj+LoNSsc
	L7aQ1+gE14s0y+H1G/5PH2QoEVZ/OimmsSsgZfBxw+/IRwnkDP5815nkGQQH/izzHd2PlC2k4=
X-Google-Smtp-Source: AGHT+IGQGjMzPYqvHrrPwqf1QhnlH7tNKERMIu8sSHe9FrHU+qXbliarAAJ+DGV9IkdSguiOBWpYvS4klFTzpBc++hg=
X-Received: by 2002:a05:6e02:11:b0:3dd:b59b:8da5 with SMTP id
 e9e14a558f8ab-3df55381c7amr8194555ab.0.1751297410001; Mon, 30 Jun 2025
 08:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630125128.562895-1-colin.i.king@gmail.com>
In-Reply-To: <20250630125128.562895-1-colin.i.king@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:29:57 -0700
X-Gm-Features: Ac12FXwzUlNEDX7sNWl994RL2RjvyOQSm7Gp0RQD_NgRL6DsWH9nOxgzUZLtCTU
Message-ID: <CAP-5=fXUjBE318VhCkS8qrTTuho33T6kLP_SGXNt13QQZLzuiw@mail.gmail.com>
Subject: Re: [PATCH][next] perf drm_pmu: Fix spelling mistake "bufers" -> "buffers"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 5:51=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There are spelling mistakes in some literal strings. Fix these.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks Colin!

Fixes: 28917cb17f9d ("perf drm_pmu: Add a tool like PMU to expose DRM
information")

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/drm_pmu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/util/drm_pmu.c b/tools/perf/util/drm_pmu.c
> index 17385a10005b..988890f37ba7 100644
> --- a/tools/perf/util/drm_pmu.c
> +++ b/tools/perf/util/drm_pmu.c
> @@ -210,17 +210,17 @@ static int read_drm_pmus_cb(void *args, int fdinfo_=
dir_fd, const char *fd_name)
>                 }
>                 if (starts_with(line, "drm-purgeable-")) {
>                         add_event(&events, &num_events, line, DRM_PMU_UNI=
T_BYTES,
> -                                 "Size of resident and purgeable memory =
bufers");
> +                                 "Size of resident and purgeable memory =
buffers");
>                         continue;
>                 }
>                 if (starts_with(line, "drm-resident-")) {
>                         add_event(&events, &num_events, line, DRM_PMU_UNI=
T_BYTES,
> -                                 "Size of resident memory bufers");
> +                                 "Size of resident memory buffers");
>                         continue;
>                 }
>                 if (starts_with(line, "drm-shared-")) {
>                         add_event(&events, &num_events, line, DRM_PMU_UNI=
T_BYTES,
> -                                 "Size of shared memory bufers");
> +                                 "Size of shared memory buffers");
>                         continue;
>                 }
>                 if (starts_with(line, "drm-total-cycles-")) {
> --
> 2.50.0
>
