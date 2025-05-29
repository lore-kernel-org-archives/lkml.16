Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AA63B9
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748561033; cv=none; b=Pm0M0ar+fX5xFSNjYc9CZskILkbXhfwSC0qtRk7aNCOEyUzOXAbKHu6Re1oAZrEyNrktsiJyAhO545YIgFrFjZf3IfxWG5B5lO7Ab8a35i4Tpp9DyLG8pzMNrco6wsaDS57wxnmGC0xAx/umsMgLy4i+dFjBEUtPqzyO1vcc99g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748561033; c=relaxed/simple;
	bh=XvV6zNzkY3H/nvlVBlP9hFkGbYKAp35T2i6AHXqMpFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgdGvQnVqEj34YBxPzXKn1oJW60Emr3oO4ZlaF/U6/QwxhdxUvrf/lf4o3S4mCUCL+qRCMAJYueiVI+mZSmvH6apCrPrsD8wydaHHZRaSuYwrnopB/QgT/lrUJS2F5yx2g7yAU645nnbmZeCs1bEr5ogmWe00sWcN1X1+VTd6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X0e5JU+s; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X0e5JU+s"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dd745f8839so54935ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748561031; x=1749165831; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7FRHyrtfwwOR66San3igARDueiKdjOJeY4c43hR4VHs=;
        b=X0e5JU+sVsOX0fpb9DJews7u7IeVoKaIUoewirtoaP141XoazT4OXXXLPJ9WjN3JBz
         yHneoxT+J2/pqw7Wd+w1Koc0tO2NHhg/BNH3p3GS1Rkhy7tKe8G7jJCGx3rJGmCrS2LX
         nFcgb750+Fgzohrz8oVFEwjhdqBoJY9FbAVJzjFFtR2pWs12X/3jE1zMIFaUb0TiLx/H
         QpOq2BBwhIVA5rk5xo5sA+vTyhVoaRhDjA/9lZ3Sag/j7QpcIcbXZNnn/aVXFMAkX9Au
         EwpmCRdK3okhfr6fOfum2hokSu18T+hfzG+La0XT4dznYlskamCWRtxR5Gwufzqn8yiS
         UZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748561031; x=1749165831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FRHyrtfwwOR66San3igARDueiKdjOJeY4c43hR4VHs=;
        b=CGxMER9nL/L5h6+FhSli6ThWkMARfSdMiWA1XZ91aj3g5ZcDSsu/voVLAvrkoPUk6g
         RYK4mdELYXxZmpK/8HPy8Dc8mc2IOprUjwNt0jKkq4P3S1RKZguWE5MY7cjLqZTpaw3+
         /J0tXUXBeILVDWoP0gPIvOSFQtEAv6k/y+Pk39j4MCTfItegzd1pI3XypGSUMc1EOwgM
         9S9Jc7oRMyBEzg+sSvkk3fLLzzu97Vn+e7KxDvloONoPpfjP4ZhriTwCkc1w5RphQbY5
         MTlm42Np4AheGaPES418qWdvDKBVR++j3Xu12YUQYm1VltWDs3OGS2i+seI26q4QRrja
         U0JA==
X-Forwarded-Encrypted: i=1; AJvYcCUkVMV08g1kTHC0yl30FBxVxS3EL12Aey9T0yjqsv4bL4pQ4zgVqDX1dsvCkrfz1wdadW6hXCWEtGlgg7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIdJPsb9bAUKvxdBk4zqulqwdToNmGC7kC1oOqvg7q9TUugTj2
	MGQpgNhiBsztbImlH3VHJYS68SSC7wf3Xg25EsJwbua7mzH9M4AGtJ+0HR0rxckfyJDggNsrsa+
	XSFaP7V1tFhFqFDnDQb1e4meWZsfsaZXuWZjscuIP
X-Gm-Gg: ASbGnctl1bNvrGVCynOdYpu5WzPq+sD6YW8RNliInf7qAPHFg7cjttjnZE7t8Ryh1zC
	cSiKrudRvD9T8ILJ5RvhDK8cuNfuhlxR0Lio5n9oL6LMZ/vKqG/8x+R+zUlmXUeVVUPCgMf5YaC
	/MYYAUntMOGSw2FYLQ6yFlfXHnsJz7o+bP5Pk8j8M8fEYF
X-Google-Smtp-Source: AGHT+IH06Elzhljc6r0rEnP+oAsUR62GwWx9BYjFqHyAa0fPoR3zdMrqkIqynbxZ7Sn2SSVeE0aWnE23ZR3WefnPD9c=
X-Received: by 2002:a05:6e02:2585:b0:3dc:7ffe:33e4 with SMTP id
 e9e14a558f8ab-3dd9b55d1b7mr765275ab.5.1748561030786; Thu, 29 May 2025
 16:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521222725.3895192-1-blakejones@google.com>
 <20250521222725.3895192-3-blakejones@google.com> <CAP-5=fVn++LYR6PcRMf9wcBooALVHX2y=i_C6cLsDipN2EDsOg@mail.gmail.com>
 <CAP_z_CguNu7KGL+-=WD-8LfZiKaLEe=R=Z6jgtXTr21AzKQNtw@mail.gmail.com>
In-Reply-To: <CAP_z_CguNu7KGL+-=WD-8LfZiKaLEe=R=Z6jgtXTr21AzKQNtw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 May 2025 16:23:38 -0700
X-Gm-Features: AX0GCFs9Xemu6SShBmjAFO6ptN1rqQ30Y4tH3g00ZwINtyi-WS8uUJi273Cj5UE
Message-ID: <CAP-5=fVGb-HJQuF5hTsWzF_Ox3yG55pptmaQO_=PLJUYuNTEog@mail.gmail.com>
Subject: Re: [PATCH 2/3] perf: collect BPF metadata from existing BPF programs
To: Blake Jones <blakejones@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Chun-Tse Shao <ctshao@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 4:21=E2=80=AFPM Blake Jones <blakejones@google.com>=
 wrote:
>
> Hi Ian,
>
> On Thu, May 29, 2025 at 10:47=E2=80=AFAM Ian Rogers <irogers@google.com> =
wrote:
> > > +               bpf_metadata_event =3D &metadata->event->bpf_metadata=
;
> > > +               *bpf_metadata_event =3D (struct perf_record_bpf_metad=
ata) {
> > > +                       .header =3D {
> > > +                               .type =3D PERF_RECORD_BPF_METADATA,
> > > +                               .size =3D metadata->event_size,
> >
> > nit: Could we set the header.size in bpf_metadata_alloc to remove
> > metadata->event_size. The code generally doesn't pass a pair of
> > perf_event + size around as the size should be in the header.
>
> I can do this initialization of metadata->event->bpf_metadata in
> bpf_metadata_alloc(). I'll need to do a bit more work in
> synthesize_perf_record_bpf_metadata() before I can get rid of
> metadata->event_size, because it needs to allocate an additional
> machine->id_hdr_size bytes (see below); I'd just have it get the
> value out of metadata->event->header.size instead. Sound good?

Sounds good. Thanks,
Ian

> Blake
>
> > > +static int synthesize_perf_record_bpf_metadata(const struct bpf_meta=
data *metadata,
> > > +                                              const struct perf_tool=
 *tool,
> > > +                                              perf_event__handler_t =
process,
> > > +                                              struct machine *machin=
e)
> > > +{
> > > +       union perf_event *event;
> > > +       int err =3D 0;
> > > +
> > > +       event =3D calloc(1, metadata->event_size + machine->id_hdr_si=
ze);
> > > +       if (!event)
> > > +               return -1;
> > > +       memcpy(event, metadata->event, metadata->event_size);
> > > +       memset((void *)event + event->header.size, 0, machine->id_hdr=
_size);
> > > +       event->header.size +=3D machine->id_hdr_size;
> > > +       for (__u32 index =3D 0; index < metadata->nr_prog_names; inde=
x++) {
> > > +               memcpy(event->bpf_metadata.prog_name,
> > > +                      metadata->prog_names[index], BPF_PROG_NAME_LEN=
);
> > > +               err =3D perf_tool__process_synth_event(tool, event, m=
achine,
> > > +                                                    process);
> > > +               if (err !=3D 0)
> > > +                       break;
> > > +       }
> > > +
> > > +       free(event);
> > > +       return err;
> > > +}
