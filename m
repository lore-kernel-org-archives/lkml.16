Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3CA142E7C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118941; cv=none; b=Y2cfWxYTzMhMeMou84npuGGt/aR+5LCfh+cKJxUsCpxSuxpxOWF1jBgdiArPafMS7z/Pih0VP/RYxKJ6k0CRJEWPknq8Ez49BgemtPDhWNtPunuxQsgBtHdMkwBZFGTsbLuaa1L+gvzOqNsPkbE5ZXHOeIRbKDxGn/x3tQdckFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118941; c=relaxed/simple;
	bh=lp92M4ZMRL0XIN792/96i5Ero8lxj7Titagx5rgLawY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKKliKWRFuk9KZJpKILdKWEG8NBIEReMyF+smX6V6Gl1VCkvA0iNhs3Uwmh89gHqvCG535UGmsp8DruTOSgRUnFDRhU6p5DMFvy9tNJbU6lKBT8aYQ6VhKBmLqZb2/jsRFFI2nL4b1syiFTBhA5ZLTmChS+/KKzQrJawK6Ym/ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bK+eg/M/; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bK+eg/M/"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2b8e2606a58so2986648fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118938; x=1744723738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=;
        b=bK+eg/M//2OefqF4Sm/Io6JS3dLOYlxDk9KkAQn6bcpWAJlV8udYjNdDQ+8MqPEInz
         ZmbChxujKdleE2gN8nq2geIBkF6JDs5cR4+nnhCX6JldEkKNXXcd6qSSLAUViKLhbci9
         vjZs5F4LGcXsL3uT4rWleQUc3jqf4VCS+/3qBgtm7fXJqk4S8Li6Hi5mfXmT94NwulOO
         pxOCcDT/a4pcY6gGc/IQ6jjBSCML+b90+/7sLE3qUSqdPAJbcgTPjc0+pbsBv7P98IQE
         Zvy3vQkptRIYdNkX0/sGC9FgRbaKYHbp8VmPKixPhWAtx5PgafdAx4umhOYcY1WBmIHM
         JSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118938; x=1744723738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8oL4Wx/LFCNYSj8OeE9r8nBxp3KNb2RWFN4L2fcM5k=;
        b=O6kK18KDGGI29Xf5kgEvRVXVi+UZUhquQ79kkDxCYmgxmjK0dTToA3+p3IeXWOMVLS
         UCahMyMTUhtmfaq27dXGBptJTv2f7iFKMsaRstAyH2CEw1+AloKl9RpqFicYsKvE2V3i
         cG4rgIaadz8ktV1ZeyG6LlfBqhphNNibYdJg+n7KVX9rUJ0AtAlDsuD75khougO4sS2G
         5ZUaQxYgk4Or5tLe6Dk2XT0m5iZJjN9cR18Txsw/7r4Q3C7cXqhp08CzuPG9yNWsCbrS
         /b1ogn8wjew3fSnOKYdVALlNxO2Wkaa13yFWPjbGQh6lv1CrtBaIa7wKOfxwJj9OYBcM
         S8iQ==
X-Gm-Message-State: AOJu0YyamxXyohrpjzWvLlt6GfRARyucwYfOAzZ1oIhXZW0tAVEk+yRk
	XW72wv3WRNdCU1+WBhI9TEXpKodhr0/h6jDMmUz1uaQYNIn8I6+hc33u40PtOH4NZ0E53kXWqnD
	jkDo6cw6wbbnPDyC444eM2vaWKVJzOb1wW9HXKQ==
X-Gm-Gg: ASbGncuJ28wodBsTMtAKPmZZJOomoORGDAvEMIPENbk+D9PTi8xyBTSmDEFRGFIwQYh
	jiCZ0Gg6aRIphA/VTBlV78Nw13trAHOFkjbsj7R7iBhJtJYVxfYhNWcrBxTMWO6xgmgyg0cjgGE
	eVqBxhPN+EAbABntdR1uSWi+d8lyE=
X-Google-Smtp-Source: AGHT+IHAG/ejTbg5vA3Vos54fD/tOWqlevkuF4IcqFNjsV/ID7Wtar2qRZ5cZm99uR1FeZB4/PY/aA5SmWOjkV3d+8Q=
X-Received: by 2002:a05:6870:8185:b0:2c2:4eb0:41f3 with SMTP id
 586e51a60fabf-2cc9e50b24emr9010028fac.3.1744118938200; Tue, 08 Apr 2025
 06:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-6-jens.wiklander@linaro.org> <Z-JOPgcWlpTlskgd@sumit-X1>
 <CAHUa44GjpHT5Nqo+Ar5jNYNPV-YJQYpLTCf=7oJ1o0VjP-t0nA@mail.gmail.com>
 <Z-ucuPzwz4IqVTgb@sumit-X1> <CAHUa44FpsCVrbwj1=nsJVJFVJSF1kzKdWAkAMXRu6EdLrLvh8g@mail.gmail.com>
 <Z_To9V-JOKZ7ChhE@sumit-X1>
In-Reply-To: <Z_To9V-JOKZ7ChhE@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 8 Apr 2025 15:28:45 +0200
X-Gm-Features: ATxdqUHzionenqJkD4YMHdkp7sUKPz9WrHUIS_ghqCFpfmFZzX0EbynUuoPZUrs
Message-ID: <CAHUa44EGWuVPjoxpG-S66he=6dkvkwzxNewaGKVKXUxrO41ztg@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] tee: implement restricted DMA-heap
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, azarrabi@qti.qualcomm.com, 
	Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:14=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, Apr 01, 2025 at 10:33:04AM +0200, Jens Wiklander wrote:
> > On Tue, Apr 1, 2025 at 9:58=E2=80=AFAM Sumit Garg <sumit.garg@kernel.or=
g> wrote:
> > >
> > > On Tue, Mar 25, 2025 at 11:55:46AM +0100, Jens Wiklander wrote:
> > > > Hi Sumit,
> > > >
> > >
> > > <snip>
> > >
> > > >
> > > > >
> > > > > > +
> > > > > > +#include "tee_private.h"
> > > > > > +
> > > > > > +struct tee_dma_heap {
> > > > > > +     struct dma_heap *heap;
> > > > > > +     enum tee_dma_heap_id id;
> > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > +     struct tee_device *teedev;
> > > > > > +     /* Protects pool and teedev above */
> > > > > > +     struct mutex mu;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_heap_buffer {
> > > > > > +     struct tee_rstmem_pool *pool;
> > > > > > +     struct tee_device *teedev;
> > > > > > +     size_t size;
> > > > > > +     size_t offs;
> > > > > > +     struct sg_table table;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_heap_attachment {
> > > > > > +     struct sg_table table;
> > > > > > +     struct device *dev;
> > > > > > +};
> > > > > > +
> > > > > > +struct tee_rstmem_static_pool {
> > > > > > +     struct tee_rstmem_pool pool;
> > > > > > +     struct gen_pool *gen_pool;
> > > > > > +     phys_addr_t pa_base;
> > > > > > +};
> > > > > > +
> > > > > > +#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_DMABUF_HEAPS)
> > > > >
> > > > > Can this dependency rather be better managed via Kconfig?
> > > >
> > > > This was the easiest yet somewhat flexible solution I could find. I=
f
> > > > you have something better, let's use that instead.
> > > >
> > >
> > > --- a/drivers/tee/optee/Kconfig
> > > +++ b/drivers/tee/optee/Kconfig
> > > @@ -5,6 +5,7 @@ config OPTEE
> > >         depends on HAVE_ARM_SMCCC
> > >         depends on MMU
> > >         depends on RPMB || !RPMB
> > > +       select DMABUF_HEAPS
> > >         help
> > >           This implements the OP-TEE Trusted Execution Environment (T=
EE)
> > >           driver.
> >
> > I wanted to avoid that since there are plenty of use cases where
> > DMABUF_HEAPS aren't needed.
>
> Yeah, but how the users will figure out the dependency to enable DMA
> heaps with TEE subsystem.

I hope, without too much difficulty. They are after all looking for a
way to allocate memory from a DMA heap.

> So it's better we provide a generic kernel
> Kconfig which enables all the default features.

I disagree, it should be possible to configure without DMABUF_HEAPS if desi=
red.

>
> > This seems to do the job:
> > +config TEE_DMABUF_HEAP
> > + bool
> > + depends on TEE =3D y && DMABUF_HEAPS
> >
> > We can only use DMABUF_HEAPS if the TEE subsystem is compiled into the =
kernel.
>
> Ah, I see. So we aren't exporting the DMA heaps APIs for TEE subsystem
> to use. We should do that such that there isn't a hard dependency to
> compile them into the kernel.

I was saving that for a later patch set as a later problem. We may
save some time by not doing it now.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
