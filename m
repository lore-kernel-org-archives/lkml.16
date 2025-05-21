Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA18A17A2F3
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835819; cv=none; b=n99WN1zqfSh1c2r63rs0gx72A7QMnx3JYz9ogrsoHxJX8XJHAbfMI+O+ff0LQlQmvW/oNCWY9y95Ntx+Rq6sTIXqSR11f2wtTVdHciwP/6CSmDHleSsaTjVa8Wez9uKo8nLt8U3ClnbUFpfAhNNwi7hubHTMRamPQ5g9XGi6YJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835819; c=relaxed/simple;
	bh=6Gw73Lgaz9OAHOOVAKLS6nU+39Z+c9UoRWndBf+5zP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlydngD5nKvNJ//lCha/Agv0l2SmB5bvyjmq6/84ZsjZ+hWVPW0RO26V5T4MO2jXH8K2YsXZiWtF5fqdWQMq8aRzRljy6A4oXVlpKCD0bd/TwC2U1wM3KXjSsvVPCVov4OEQtUbQrsCjiLfZYS5w1ZeQrReP+X9SzSIzYbQO8bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T048csCJ; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T048csCJ"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso67515ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747835817; x=1748440617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTW2r6S8DjlZU8WpYcmM8CbKwPqqn2VMl2eVatTldJo=;
        b=T048csCJH9CiCSJlkwWC/zK+WwfN362xaVufjR3Zwd+cpU580u6gwWBI4UQ4UEVA5J
         rII9UZEWj9qxnA87/t1zarOjoe8bbMODmmZ03WQY1mrmnIyl/S5IXyUrtFHWpnjFgIou
         as54ZYtda0rhY9Fvhvu6m9CbPhUgRhhuxp8CTBEupr/8ELQ681YJLq2TkLRtPX59+bL+
         lFgf5fo7vbNy1Z/SdTgC4HM2djChauu968clF990jn6dGDPjyXX7LzjFooqZNbBws7Nz
         Srl1tjOsburUZFtKBkhV7jU3rXsgt2nM793qNv4ohCr+LXoN4rE5NQDHFZwJJToKku/P
         nEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835817; x=1748440617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTW2r6S8DjlZU8WpYcmM8CbKwPqqn2VMl2eVatTldJo=;
        b=gdCCHZ/mdEh+enVWasEwkLhEtfXnzuA+kxuJmHunw4QTVBrdsJVGIMQBJCYqq9lzvN
         Mk4UOFkWX6dxa+hZbB0DC4xom8E536w7dSTByM4sRAxQkQhrPlohu1TiDqTIpfM8YR6l
         PYxteVUk3N7csyxqtm9cKgU+zDcLy9yxg8pjXCj+PLcuPW1EUjVMd/ewb/JInN6el+xZ
         rJ379kG46kkXsAvFvaRjmzERDK+ovKIF2L6ncLNDuY4D2OSP/S9BEyIDqaQykffRI5v1
         6wiQkPDv6wA3MAhPZg3Tt714tNHH2cv12EeswZ2+5NJz/6oykjnacILPDTaj/eSSu86r
         D8BA==
X-Forwarded-Encrypted: i=1; AJvYcCUFuSpHpwKVg3Y/W1o76dgmH5Vo6Ymzl7F1a9sjtI/fqDTU4CqPUmB/FtjZMh2+V3Tqv9XXUJwHSTSfL1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFIFQm196iaBSEcXiGzVhjLIpqow3vIL0rHnmT8yEWYDBpNuJa
	FOo+CxZid6NYhGmrSqio+m3x1NdVNQY6nnL/zvF/RQj6it+J6NzhLAwEW8Rt90tFypCYWSZOjfb
	xpAfQxaZAlJGoXFVCxJZ+wK/fMemQ7BOQPBSKnIPake3TnEtNUmA0jPFZ
X-Gm-Gg: ASbGnctLPxmE/nQ2yrHjFNQb4/LkZ91Tqy0qTsR+ZuU2p8VGOchK7a9cpjAoXZbVgWR
	Rn3iPHX/Mak78suS0dK+Cdsti02TFkYdfbI6ngyZGEwNKaLa6rRfLTJmyWUiQ4JRVjCq0k6bA/g
	ZDzCenuSH9B982q37fWAmnqJ2H7orb4hfeJjjpjXs2pqwa
X-Google-Smtp-Source: AGHT+IEFL9AbHhzTmmkovuXEuvJ6CMwhfcQSQ/LXW7x7TniHWBab0jtm+JRpISECaVTnp+EHvp7JXznP1L3zQUMODWY=
X-Received: by 2002:a05:6e02:1526:b0:3dc:6fb2:dac7 with SMTP id
 e9e14a558f8ab-3dc6fb2dddbmr12276855ab.10.1747835816536; Wed, 21 May 2025
 06:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519195148.1708988-1-irogers@google.com> <20250519195148.1708988-5-irogers@google.com>
 <aC3TMl2MJL1_BASE@x1>
In-Reply-To: <aC3TMl2MJL1_BASE@x1>
From: Ian Rogers <irogers@google.com>
Date: Wed, 21 May 2025 06:56:44 -0700
X-Gm-Features: AX0GCFsNLCb8k5XZOuFkn1_lBa8OUS9cmqWEbKB0DM5VgFrYYRiCewTJFnUq57M
Message-ID: <CAP-5=fXXbpqQcFj-SUVWAQrmzWhnLNVU=3MiChdCqv4YpiGYGg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] perf python: Add support for perf_counts_values to
 return counter data
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Gautam Menghani <gautam@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, maddy@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 6:20=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Mon, May 19, 2025 at 12:51:41PM -0700, Ian Rogers wrote:
> > From: Gautam Menghani <gautam@linux.ibm.com>
> >
> > Add support for perf_counts_values struct to enable the python
> > bindings to read and return the counter data.
>
> This (and another one in this series) are coming from Ian, that didn't
> modify them, so we need a Signed-off-by: Ian, as per:
>
> Documentation/process/submitting-patches.rst
>
> ---
> Any further SoBs (Signed-off-by:'s) following the author's SoB are from
> people handling and transporting the patch, but were not involved in its
> development. SoB chains should reflect the **real** route a patch took
> as it was propagated to the maintainers and ultimately to Linus, with
> the first SoB entry signalling primary authorship of a single author.
> ---
>
> I'm adding them to my local branch, please ack this,

Ack. Thanks and sorry for the work, will try to do better next time.

Ian

> Thanks,
>
> - Arnaldo
>
> > Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> > ---
> >  tools/perf/util/python.c | 92 +++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 91 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
> > index ead3afd2d996..1cbddfe77c7c 100644
> > --- a/tools/perf/util/python.c
> > +++ b/tools/perf/util/python.c
> > @@ -626,6 +626,92 @@ static int pyrf_thread_map__setup_types(void)
> >       return PyType_Ready(&pyrf_thread_map__type);
> >  }
> >
> > +struct pyrf_counts_values {
> > +     PyObject_HEAD
> > +
> > +     struct perf_counts_values values;
> > +};
> > +
> > +static const char pyrf_counts_values__doc[] =3D PyDoc_STR("perf counts=
 values object.");
> > +
> > +static void pyrf_counts_values__delete(struct pyrf_counts_values *pcou=
nts_values)
> > +{
> > +     Py_TYPE(pcounts_values)->tp_free((PyObject *)pcounts_values);
> > +}
> > +
> > +#define counts_values_member_def(member, ptype, help) \
> > +     { #member, ptype, \
> > +       offsetof(struct pyrf_counts_values, values.member), \
> > +       0, help }
> > +
> > +static PyMemberDef pyrf_counts_values_members[] =3D {
> > +     counts_values_member_def(val, Py_T_ULONG, "Value of event"),
> > +     counts_values_member_def(ena, Py_T_ULONG, "Time for which enabled=
"),
> > +     counts_values_member_def(run, Py_T_ULONG, "Time for which running=
"),
> > +     counts_values_member_def(id, Py_T_ULONG, "Unique ID for an event"=
),
> > +     counts_values_member_def(lost, Py_T_ULONG, "Num of lost samples")=
,
> > +     {NULL}
> > +};
> > +
> > +static PyObject *pyrf_counts_values_get_values(struct pyrf_counts_valu=
es *self, void *closure)
> > +{
> > +     PyObject *vals =3D PyList_New(5);
> > +
> > +     if (!vals)
> > +             return NULL;
> > +     for (int i =3D 0; i < 5; i++)
> > +             PyList_SetItem(vals, i, PyLong_FromLong(self->values.valu=
es[i]));
> > +
> > +     return vals;
> > +}
> > +
> > +static int pyrf_counts_values_set_values(struct pyrf_counts_values *se=
lf, PyObject *list,
> > +                                      void *closure)
> > +{
> > +     Py_ssize_t size;
> > +     PyObject *item =3D NULL;
> > +
> > +     if (!PyList_Check(list)) {
> > +             PyErr_SetString(PyExc_TypeError, "Value assigned must be =
a list");
> > +             return -1;
> > +     }
> > +
> > +     size =3D PyList_Size(list);
> > +     for (Py_ssize_t i =3D 0; i < size; i++) {
> > +             item =3D PyList_GetItem(list, i);
> > +             if (!PyLong_Check(item)) {
> > +                     PyErr_SetString(PyExc_TypeError, "List members sh=
ould be numbers");
> > +                     return -1;
> > +             }
> > +             self->values.values[i] =3D PyLong_AsLong(item);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static PyGetSetDef pyrf_counts_values_getset[] =3D {
> > +     {"values", (getter)pyrf_counts_values_get_values, (setter)pyrf_co=
unts_values_set_values,
> > +             "Name field", NULL},
> > +     {NULL}
> > +};
> > +
> > +static PyTypeObject pyrf_counts_values__type =3D {
> > +     PyVarObject_HEAD_INIT(NULL, 0)
> > +     .tp_name        =3D "perf.counts_values",
> > +     .tp_basicsize   =3D sizeof(struct pyrf_counts_values),
> > +     .tp_dealloc     =3D (destructor)pyrf_counts_values__delete,
> > +     .tp_flags       =3D Py_TPFLAGS_DEFAULT|Py_TPFLAGS_BASETYPE,
> > +     .tp_doc         =3D pyrf_counts_values__doc,
> > +     .tp_members     =3D pyrf_counts_values_members,
> > +     .tp_getset      =3D pyrf_counts_values_getset,
> > +};
> > +
> > +static int pyrf_counts_values__setup_types(void)
> > +{
> > +     pyrf_counts_values__type.tp_new =3D PyType_GenericNew;
> > +     return PyType_Ready(&pyrf_counts_values__type);
> > +}
> > +
> >  struct pyrf_evsel {
> >       PyObject_HEAD
> >
> > @@ -1475,7 +1561,8 @@ PyMODINIT_FUNC PyInit_perf(void)
> >           pyrf_evlist__setup_types() < 0 ||
> >           pyrf_evsel__setup_types() < 0 ||
> >           pyrf_thread_map__setup_types() < 0 ||
> > -         pyrf_cpu_map__setup_types() < 0)
> > +         pyrf_cpu_map__setup_types() < 0 ||
> > +         pyrf_counts_values__setup_types() < 0)
> >               return module;
> >
> >       /* The page_size is placed in util object. */
> > @@ -1520,6 +1607,9 @@ PyMODINIT_FUNC PyInit_perf(void)
> >       Py_INCREF(&pyrf_cpu_map__type);
> >       PyModule_AddObject(module, "cpu_map", (PyObject*)&pyrf_cpu_map__t=
ype);
> >
> > +     Py_INCREF(&pyrf_counts_values__type);
> > +     PyModule_AddObject(module, "counts_values", (PyObject *)&pyrf_cou=
nts_values__type);
> > +
> >       dict =3D PyModule_GetDict(module);
> >       if (dict =3D=3D NULL)
> >               goto error;
> > --
> > 2.49.0.1101.gccaa498523-goog
