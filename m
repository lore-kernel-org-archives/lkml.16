Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055923FF1
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 00:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749341082; cv=none; b=ikQWPrjKHtm83jHe/OR63dCO86BeSo7EVl1XY3aJlaBsEnBhtNJuQ1qkSWUcYqBXzYypqnHc3sle0+WqnjjFxwj/exJRpoaSkZIrnN/W7T2oxX//THJ+xl21TO6Zemi/EoImAz3k1N5T3tG/GPcL4Z2dKkGht/LKVOUpLvRC01E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749341082; c=relaxed/simple;
	bh=3nrXo6s/BNr8vei07z9IKKe/5qIGj4qXfxgKcrALLnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Br+vpAJuYDt8+pmuk28R0yrHd5FbYlT3hGYQZA/fdjT1pcODaIHcPY+STx70YDtwJIw7NQ0fLQ9vjlO8LKyh8St/SVjDR1OxtRG5N4qdVrKz9/lE5RvEpWyy+cSeAvfTNPfSlQd0VGXS82zeuOY4kRdRS7cFt0QcNuEanYOyRbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=sXPSIOqc; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="sXPSIOqc"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a58ba6c945so52809001cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 17:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749341079; x=1749945879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zp/D6Nx8BfMiScISjeIblyGMtACHkzJtCPjT0UaHWyY=;
        b=sXPSIOqcR+uRUP1M3yJgrgvtormDP1CUe3U+Wj+dWQGTexfgekJpOnPM3anFwgCR3B
         I78T6ydDpf+21so0ENVzw6PuN3DAHV5oKATGruzPBB5o4MIqnT7XEQ122X0L7BcFu2kI
         X/+G7yQoe5OO4jJTGTDQ1NlRolKjuXwGLx5xDzj66uqZmImHhzlCAA7gqDGzgbUS6ewS
         89mvyjD0GI0nrie4ndUWTciMfl8rtD/biOPXns5UILg5IvNpfaeHM4IpdakEkja6zJs/
         q2WhAnGAjJbBcJNcIGgmDxmQEeyvhu14xSVDPFFn5OWDd+qcpw8cqq3h5l7EEk4pZ/dr
         WwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749341079; x=1749945879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zp/D6Nx8BfMiScISjeIblyGMtACHkzJtCPjT0UaHWyY=;
        b=pDSxXk9/mITJoGT4Qk10FmHOICL7wMyr1DOjmqRbzdmBpFjk5Lr/ndVTpdyWVBKSm0
         nPTRzGeTTeZL5rdEEMZEkVxWjkSKrgrq2B3xmnvIJpKVBcevDRQK1TPPJcb9Lm/7BNmW
         ad74vKDQDvn2sxR4/ZiDh7SkauT3UkucF7IsOXYaT2bhS+7P1eSM1V74Pc70Yr4jZ1Iu
         Mbi8dHS0KbDL/cVD7x8nB7Q7Uv1G2lZvlhYvJJT6G8fMIcXgUnlQ1xB1YbM5ZIn794mL
         px1ulCP9+N05znPAt+4F/qMjo61ANnBALVkkmEtyLH2VIMYFtbmIssMYXx11HZx1cnDO
         QBpw==
X-Forwarded-Encrypted: i=1; AJvYcCX7lTgCNP8rvWSuf53gAleML3yznSgMoZgX0kMX8W4oFCwdAnn24Lax6VDSDrC8KOUiIrWoeKXgeiSi2lI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDT96zc71LmOJKvhi58prN3MxseheRZdQwWV98V9A30faY5wBn
	IGX9o3Ul8Fsm9sKzCXjTfthTHytGVlClqgL84L4h2+rZec52kyZOMWvIiUGRaMu3tmabo2jeHnt
	7Yeeus2za5RgzA3wS8XYUWb6P+wOtySOzuCMXQADNuw==
X-Gm-Gg: ASbGncuGadKyucd8dogs38sDw7vEbVhjDAIEmy/WaPsmZS9xbuD+q+B3bNgAj812EL/
	phWfOa6oeERP049eARhbuS0x0r/uwfZIgZWlSxVe0xcUQQrHwZ1I6dR89h5rYW37XkAJICezQ6v
	9U1mXq3k8WlJ9bv7s08J8euye8R2W+Q/yhqmG9+xx/
X-Google-Smtp-Source: AGHT+IEHyFkt2x/bEAiQ5dSYS8a+nTEZ4nXGxUXv1xBh/B/nln1ArBefBSOd6jxdD7aTJ5evdbG2kp9u/gDYdQ8Odpo=
X-Received: by 2002:a05:622a:1b0b:b0:4a3:800d:2a9a with SMTP id
 d75a77b69052e-4a5b9a0498fmr129085641cf.6.1749341078791; Sat, 07 Jun 2025
 17:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-7-pasha.tatashin@soleen.com> <mafs0iklbtqpc.fsf@kernel.org>
In-Reply-To: <mafs0iklbtqpc.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 20:04:00 -0400
X-Gm-Features: AX0GCFuiagbyWhs5WKRlcCrzhjgoTlRaZx67U0f0XBer66fayKl3tu7mrARjDcI
Message-ID: <CA+CK2bDrvd1dgZSbN08aDuNYD9hOxTawR-RL2jTFLmT7B608ow@mail.gmail.com>
Subject: Re: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 12:30=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Thu, May 15 2025, Pasha Tatashin wrote:
>
> > Introduce the framework for kernel subsystems (e.g., KVM, IOMMU, device
> > drivers) to register with LUO and participate in the live update proces=
s
> > via callbacks.
> >
> > Subsystem Registration:
> > - Defines struct liveupdate_subsystem in linux/liveupdate.h,
> >   which subsystems use to provide their name and optional callbacks
> >   (prepare, freeze, cancel, finish). The callbacks accept
> >   a u64 *data intended for passing state/handles.
> > - Exports liveupdate_register_subsystem() and
> >   liveupdate_unregister_subsystem() API functions.
> > - Adds drivers/misc/liveupdate/luo_subsystems.c to manage a list
> >   of registered subsystems.
> >   Registration/unregistration is restricted to
> >   specific LUO states (NORMAL/UPDATED).
> >
> > Callback Framework:
> > - The main luo_core.c state transition functions
> >   now delegate to new luo_do_subsystems_*_calls() functions
> >   defined in luo_subsystems.c.
> > - These new functions are intended to iterate through the registered
> >   subsystems and invoke their corresponding callbacks.
> >
> > FDT Integration:
> > - Adds a /subsystems subnode within the main LUO FDT created in
> >   luo_core.c. This node has its own compatibility string
> >   (subsystems-v1).
> > - luo_subsystems_fdt_setup() populates this node by adding a
> >   property for each registered subsystem, using the subsystem's
> >   name.
> >   Currently, these properties are initialized with a placeholder
> >   u64 value (0).
> > - luo_subsystems_startup() is called from luo_core.c on boot to
> >   find and validate the /subsystems node in the FDT received via
> >   KHO. It panics if the node is missing or incompatible.
> > - Adds a stub API function liveupdate_get_subsystem_data() intended
> >   for subsystems to retrieve their persisted u64 data from the FDT
> >       in the new kernel.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> [...]
> > +/**
> > + * liveupdate_unregister_subsystem - Unregister a kernel subsystem han=
dler from
> > + * LUO
> > + * @h: Pointer to the same liveupdate_subsystem structure that was use=
d during
> > + * registration.
> > + *
> > + * Unregisters a previously registered subsystem handler. Typically ca=
lled
> > + * during module exit or subsystem teardown. LUO removes the structure=
 from its
> > + * internal list; the caller is responsible for any necessary memory c=
leanup
> > + * of the structure itself.
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + * -EINVAL if h is NULL.
> > + * -ENOENT if the specified handler @h is not found in the registratio=
n list.
> > + * -EBUSY if LUO is not in the NORMAL state.
> > + */
> > +int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h)
> > +{
> > +     struct liveupdate_subsystem *iter;
> > +     bool found =3D false;
> > +     int ret =3D 0;
> > +
> > +     luo_state_read_enter();
> > +     if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
> > +             luo_state_read_exit();
> > +             return -EBUSY;
> > +     }
> > +
> > +     mutex_lock(&luo_subsystem_list_mutex);
> > +     list_for_each_entry(iter, &luo_subsystems_list, list) {
> > +             if (iter =3D=3D h) {
> > +                     found =3D true;
>
> Nit: you don't actually need the found variable. You can do the same
> check that list_for_each_entry() uses, which is to call
> list_entry_is_head().

True, but for readability, 'found' makes more sense here. I do not
like using iterator outside of the loop, and also if
(list_entry_is_head(iter, &luo_subsystems_list, list) {} harder to
understand, and would require a  comment, instead of simple:  if
(found) {}

>
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (found) {
> > +             list_del_init(&h->list);
> > +     } else {
> > +             pr_warn("Subsystem handler '%s' not found for unregistrat=
ion.\n",
> > +                     h->name);
> > +             ret =3D -ENOENT;
> > +     }
> > +
> > +     mutex_unlock(&luo_subsystem_list_mutex);
> > +     luo_state_read_exit();
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(liveupdate_unregister_subsystem);
> [...]
>
> --
> Regards,
> Pratyush Yadav
