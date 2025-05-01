Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1041BF37
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114562; cv=none; b=GtlI/Bfj6QX6WrRAA3h30o1ChUUa6ck0LHQNwKObBCBf9d0rfeIry8qQuNMoVvk8qKwS1X1suIF96C/uAeXIwWqR+erq8b9CuiAKoALwN6Dr/ChWQWjPKbJcD4dEgczofg5LNq943gQzxAknd2TgzAZpl7KxOi6tFLyvnboIP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114562; c=relaxed/simple;
	bh=3HKIVnPDQ9OEKCweD1mvGi7LavbypPCv6RQLPe4WJn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=osnBgCc1kshwNCZ8b1763xFw/lXjiCbMX/CnYED+sklzAbFVilCGAu1hNkuqQaczj719JQ9pfslxNARBomo/5i1V77WJoI1dAAHZxQOFxWg9QDTtzMNrHLwQlg5uLZyIrkrzEIjagvj8YDw3l25B7TpqlKh3OsufSh0RoIcuqS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L0bnZDrP; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L0bnZDrP"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d8c4222fc9so209265ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746114560; x=1746719360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B61it6scwYY34x7zwdbk+FyL53fYrJ6lieiu0DvGpsE=;
        b=L0bnZDrPYTrKA2oaHa9R8ZGDxMM6O8GQ5cXIRoTd9ZpbqzFaUk4Y54YCG90ezPbfCG
         TO1PNoBi2Ym5SGhfppSbYkmNmXGvk4nkuhwouyXjC8AWaCASCZA57F5UNz/MC1yvYrOv
         51ZtqNmBl4fh8VliNe79+FdYbnC85Xjy/xTrTU0n6jS8Jp9C2B+DscKQ7wHx1SV9wKQJ
         8ZuIJtmzI3CGiQocqR7FTeLjEeF/WVzMoQrRfkyi8YQXwRyYc7xOu8gmhkJd6ge1bY37
         nE4j4Wy00m4TOLDam0VLdSameFHs9xW/chqoAxtEeKG+D0gQOV76lf561Y6EQ2+L1k4x
         NYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746114560; x=1746719360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B61it6scwYY34x7zwdbk+FyL53fYrJ6lieiu0DvGpsE=;
        b=F2CqUXMlenRzwD7vaDzgfYs/bquqXHdyh+ZRP9BMI4glnJwFPXmZibAgi1GETNAvJI
         FEGwN2JVbK+hcxIf6A8G8FP0AGr2hhc2t8LhVm7nBwQi0nz+cMl75UGuPEC6Hj3nsuW4
         j9NEviIaO4dk/QmiSsZwHCvuT/tMqSQc7jUCCI1fh97H6Ye98rtMehbIMpi+TNDPQy3R
         loG7L24jICv5C6qkd/CwuLn421itpAR2Fyw/FhEoZ3L+nIp8rM+sYbH1pamPylZ096hB
         HPD00sFv610ZVpvC7QBjmW0y4sm0ipAbWFrKsKTxin12zqE+nQT1hnlkt0WFJRAQtE1O
         U0VA==
X-Forwarded-Encrypted: i=1; AJvYcCXv3QsW5zALgK+GToZb7TC+Bdm8llcAVm5ZoIHeBfpyf8KpXwH0o4ori1T6i56rFp6p9JH5HyONv57yCgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJzY/cwo/tHBJXYagvm2U8IJkMu5T30D/kQjX9AAeUr9VduCeE
	paM3WMC91GGebFvTFhLCekBrGkHycJJxCIVFInjFd2EDUpgeKO3dUBLQpKI9rY1BFCHUoN2IK9/
	mXPCjmAVltlcAfsDCaQCzucrm8A0Zc0Q73jce
X-Gm-Gg: ASbGncvbYcD1/xIqpBNU4XV0RBB4nhSHSzkzxITT0h4gRSrrLtMzi67DYNukb41e2AW
	hZdQbDhDJO26bJ4MLPLxlMrN8RuR5Cg06QWTkF5xfzHi87kAah4Dgv+Gx0qTN4Z+OlKYa0oOvAW
	8ruadisLElyJGcAg1/aln44y/lVZW+XBO92q6LjUY1BvpfiXQI0Iw=
X-Google-Smtp-Source: AGHT+IE7pBElH8T1s8JI1VwtyernK2V6bzN/KH8RUTWDX7XmmiYtthCh5W/qK19YYDCmOQTsLLavP7Kt7KPUitaxRdk=
X-Received: by 2002:a92:ca47:0:b0:3d9:66ba:1ab7 with SMTP id
 e9e14a558f8ab-3d96f21344amr3585695ab.10.1746114559459; Thu, 01 May 2025
 08:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501093633.578010-1-gautam@linux.ibm.com> <20250501093633.578010-4-gautam@linux.ibm.com>
In-Reply-To: <20250501093633.578010-4-gautam@linux.ibm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 May 2025 08:49:08 -0700
X-Gm-Features: ATxdqUHBwK_l4-FbEaeqBNUJ7dPx7nAhGNUc9NCG8l8rw9-A97bRM4npOofxd7s
Message-ID: <CAP-5=fX1qodprWrwK7yq2WYZNnLtiEe_rjvw0aJ7gXY2ma+Hzw@mail.gmail.com>
Subject: Re: [PATCH 3/4] perf python: Add evlist close and next methods
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maddy@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 2:37=E2=80=AFAM Gautam Menghani <gautam@linux.ibm.co=
m> wrote:
>
> Add support for the evlist close and next methods. The next method
> enables iterating over the evsels in an evlist.
>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  tools/perf/util/python.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> index 5a4d2c9aaabd..599cb37600f1 100644
> --- a/tools/perf/util/python.c
> +++ b/tools/perf/util/python.c
> @@ -1163,6 +1163,16 @@ static PyObject *pyrf_evlist__open(struct pyrf_evl=
ist *pevlist,
>         return Py_None;
>  }
>
> +static PyObject *pyrf_evlist__close(struct pyrf_evlist *pevlist)
> +{
> +       struct evlist *evlist =3D &pevlist->evlist;
> +
> +       evlist__close(evlist);
> +
> +       Py_INCREF(Py_None);
> +       return Py_None;
> +}
> +
>  static PyObject *pyrf_evlist__config(struct pyrf_evlist *pevlist)
>  {
>         struct record_opts opts =3D {
> @@ -1202,6 +1212,31 @@ static PyObject *pyrf_evlist__enable(struct pyrf_e=
vlist *pevlist)
>         return Py_None;
>  }
>
> +static PyObject *pyrf_evlist__next(struct pyrf_evlist *pevlist,
> +                                  PyObject *args, PyObject *kwargs)
> +{
> +       struct evlist *evlist =3D &pevlist->evlist;
> +       PyObject *py_evsel;
> +       struct perf_evsel *pevsel;
> +       struct evsel *evsel;
> +       struct pyrf_evsel *next_evsel =3D PyObject_New(struct pyrf_evsel,=
 &pyrf_evsel__type);
> +       static char *kwlist[] =3D { "evsel", NULL };
> +
> +       if (!PyArg_ParseTupleAndKeywords(args, kwargs, "O", kwlist,
> +                                        &py_evsel))
> +               return NULL;
> +
> +       pevsel =3D (py_evsel =3D=3D Py_None) ? NULL : &(((struct pyrf_evs=
el *)py_evsel)->evsel.core);
> +       pevsel =3D perf_evlist__next(&(evlist->core), pevsel);
> +       if (pevsel !=3D NULL) {
> +               evsel =3D container_of(pevsel, struct evsel, core);
> +               next_evsel =3D container_of(evsel, struct pyrf_evsel, evs=
el);
> +               return (PyObject *) next_evsel;
> +       }
> +
> +       return Py_None;
> +}
> +

Thanks for this! Have you looked at the existing iteration support?
There's an example here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/python/tracepoint.py?h=3Dperf-tools-next#n26
```
    for ev in evlist:
        ev.sample_type =3D ev.sample_type & ~perf.SAMPLE_IP
        ev.read_format =3D 0
```
In the next patch you have:
```
        evsel =3D evlist.next(None)
        while evsel !=3D None:
            counts =3D evsel.read(0, 0)
            print(counts.val, counts.ena, counts.run)
            evsel =3D evlist.next(evsel)
```
I believe the former looks better. It also isn't clear to me if next
belongs on evlist or evsel.

Thanks,
Ian


>  static PyMethodDef pyrf_evlist__methods[] =3D {
>         {
>                 .ml_name  =3D "all_cpus",
> @@ -1221,6 +1256,12 @@ static PyMethodDef pyrf_evlist__methods[] =3D {
>                 .ml_flags =3D METH_VARARGS | METH_KEYWORDS,
>                 .ml_doc   =3D PyDoc_STR("open the file descriptors.")
>         },
> +       {
> +               .ml_name  =3D "close",
> +               .ml_meth  =3D (PyCFunction)pyrf_evlist__close,
> +               .ml_flags =3D METH_NOARGS,
> +               .ml_doc   =3D PyDoc_STR("close the file descriptors.")
> +       },
>         {
>                 .ml_name  =3D "poll",
>                 .ml_meth  =3D (PyCFunction)pyrf_evlist__poll,
> @@ -1263,6 +1304,12 @@ static PyMethodDef pyrf_evlist__methods[] =3D {
>                 .ml_flags =3D METH_NOARGS,
>                 .ml_doc   =3D PyDoc_STR("Enable the evsels in the evlist.=
")
>         },
> +       {
> +               .ml_name  =3D "next",
> +               .ml_meth  =3D (PyCFunction)pyrf_evlist__next,
> +               .ml_flags =3D METH_VARARGS | METH_KEYWORDS,
> +               .ml_doc   =3D PyDoc_STR("Return next evsel")
> +       },
>         { .ml_name =3D NULL, }
>  };
>
> --
> 2.49.0
>
