Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0641CEEBE
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749318688; cv=none; b=Aqg4exDx/4Y1mSuHLEL4tMvqkJ84/A4nE5gh0eSH5j2y9xjrIoDZgM2Vkj2FfH6R55giQ3woYrvnuztm6Xs9EAPNdSwh+H4pfUpT2skjMvrioKOML5AlCqSLQqDJbXEk45iLtTwjjB70fGCRO5wyzAjcDNSiZsKdPwAevhTReTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749318688; c=relaxed/simple;
	bh=raNXHsePfyHpIXPLiU9dmg5kvTx8ukod16UtTmcMCYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DN+gFRPLJ7kyJsZWagER3l+i8NUoAZXXYvYdMtzNlifbZnMHQBaWY6o0j5mLTtxRrWfp/itBykgInqYqvlgWc6aG2dyWSXCustNHElJEoiIRqcItvOsO0yabgQrhRtWAsHxa5HhzX7z7+LkURTXv3Tp3s75YpC6sBwtw42VY6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=tSgRdf79; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="tSgRdf79"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5903bceffso38063441cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 10:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749318684; x=1749923484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5x7tqpY7FFQTqwJyBba7fEUnGOPyC2xMtgUC5Nr2hd8=;
        b=tSgRdf79hMFqkZvfjRJKW21el8YKnVD/QCdzm++TpLxuStOuD2kJCL4X6ADCoghxVL
         p6kztvCO40j/35WpXOvKlliYgEFhWAF2YKwTXNQkgyGHzjZiqTag4BkZVTKwoDItcLZV
         cdG6rJRPaqYJhLoFOoR/ah6+OLE9V+aqOyy78zB3W+EnJU7sCqc5QTB2tr6knSsjsLz/
         9ZiuNPtxO0eTLg987S8TJwhgPgIdUExWM1itSPXACgxjATiNHuy6jMric8xZQa4trFDx
         X2lneAAxjInGIKcJYAww6YZglOid+u/nG4OWy2JIAvkuEmyFOq96gkAlZ0go9CuP+ai9
         S+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749318684; x=1749923484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5x7tqpY7FFQTqwJyBba7fEUnGOPyC2xMtgUC5Nr2hd8=;
        b=xUSpXMZmMIiheHfM9A6sGlGSJby8Pt8lazk8q4HoqReJQFmy5AzqGt1fvu7LbVDDFh
         xAhFPjEnpUkwpXCUjkwR/WkMZXK48M0Von6wfsIlNSNgUHR82mtUf/3YMKJo2wQDLVER
         25SS42zm5HErdHma5Re3YV1WCDZol4rB4v1ruziscfBP35kHVaU/W60gJGll+w/Pwgri
         hFkwjVDs+8PQf5/l3muzEGEOo8vCyBm6Iv5dVlMEnBfXl8MoQ5P0V4qPBX3IbHXJR/dV
         pDtA5rda7H8Lw2w3f/QkCKUSoppz9yVZUiUAjTjQP/pDv65CBMD65udk8QkQ6p+L1K0D
         jGJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOeeKfH0WHWcnbiq2IXSeMigTB9ZCEeKXuiBbYdfHjQm7WpbYDnNCd+uAUefOnMiXSWd+eR0e7GWFBLeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTD0OKJcs6Nd9rOpGmbDXJd2mJUyXU23P7oV3SEM8mBx4Kxv/U
	CD6tXrKbTNJQQOLe0E06wL9qIvyrs+/lK0aVlt+183U6RQJA+j0C0m0lR1TDfInQBEOrYVdDUS9
	cMGTu7IKoS5Dpr1MLqQNCoW/DbGUdy7S3/0rujlsITQ==
X-Gm-Gg: ASbGncvmzoBbCzjg3X47bADs4wQLlZ46niObA4EAwkAHrZnkKtErXzURb2PVsqSkE36
	14M0M1hINd9HRcIbgahNn0H/C9W4L9xXtoWLT/iA7MPmUpftNroqUOq29qkhZMP2LgfWBi4fBvU
	An3bBsX894KoHD0fG/8f/ODeB+1N+1SQ==
X-Google-Smtp-Source: AGHT+IEFn03IT5C9pJFdS9tKXW+5B//fadk0OraiYcKgA8zAKYeMYRVrgrdQO/iYtEedwVrjla+0YNmycwBcp+tbU+w=
X-Received: by 2002:a05:622a:59c6:b0:494:aa40:b0c3 with SMTP id
 d75a77b69052e-4a5b9a0546bmr105143941cf.10.1749318684345; Sat, 07 Jun 2025
 10:51:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com> <aDQV1bAt0i8d95MQ@kernel.org>
In-Reply-To: <aDQV1bAt0i8d95MQ@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 13:50:47 -0400
X-Gm-Features: AX0GCFucvwsWUVtQaH9FvUCH6_T_TwPU1EcsbQ3OjZROJgpiTAuxkweKotJ6ncQ
Message-ID: <CA+CK2bAn5Y71FgZvfY0oJ+-65TT19O4=h5DXguRbEQdRvhurFg@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 3:19=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 15, 2025 at 06:23:09PM +0000, Pasha Tatashin wrote:
> > Integrate the LUO with the KHO framework to enable passing LUO state
> > across a kexec reboot.
> >
> > This patch introduces the following changes:
> > - During the KHO finalization phase allocate FDT blob.
> > - Populate this FDT with a LUO compatibility string ("luo-v1") and the
> >   current LUO state (`luo_state`).
> > - Implement a KHO notifier
>
> Would be nice to have more details about how LUO interacts with KHO, like
> how LUO states correspond to the state of KHO, what may trigger
> corresponding state transitions etc.

Updated.

>
> > LUO now depends on `CONFIG_KEXEC_HANDOVER`. The core state transition
> > logic (`luo_do_*_calls`) remains unimplemented in this patch.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  drivers/misc/liveupdate/luo_core.c | 222 ++++++++++++++++++++++++++++-
> >  1 file changed, 219 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupda=
te/luo_core.c
> > index 919c37b0b4d1..a76e886bc3b1 100644
> > --- a/drivers/misc/liveupdate/luo_core.c
> > +++ b/drivers/misc/liveupdate/luo_core.c
> > @@ -36,9 +36,12 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> >  #include <linux/err.h>
> > +#include <linux/kexec_handover.h>
> >  #include <linux/kobject.h>
> > +#include <linux/libfdt.h>
> >  #include <linux/liveupdate.h>
> >  #include <linux/rwsem.h>
> > +#include <linux/sizes.h>
> >  #include <linux/string.h>
> >  #include "luo_internal.h"
> >
> > @@ -55,6 +58,12 @@ const char *const luo_state_str[] =3D {
> >
> >  bool luo_enabled;
> >
> > +static void *luo_fdt_out;
> > +static void *luo_fdt_in;
> > +#define LUO_FDT_SIZE         SZ_1M
>
> Does LUO really need that much?

Not, really, but I am keeping it simple in this patch. I added the
following comment:

/*
 * The LUO FDT size depends on the number of participating subsystems,
 * preserved file descriptors, and devices. While the total size could be
 * calculated precisely during the "prepare" phase, it would require
 * iterating through all participants twice: once to calculate the required
 * size, and a second time to actually preserve the data and populate the F=
DT.
 *
 * Given that each participant stores only a small amount of metadata
 * (e.g., an 8-byte payload or pointer) directly in the LUO FDT, and that
 * this FDT is used only during the relatively short kexec transition
 * period (including the blackout window and early boot of the next kernel)=
,
 * a fixed size is used for simplicity.
 *
 * The current fixed size (1M) is large enough to handle reasonable number =
of
 * preserved entities. If this size ever becomes insufficient, it can eithe=
r be
 * increased, or a dynamic size calculation mechanism could be implemented =
in
 * the future.
 */

Pasha
