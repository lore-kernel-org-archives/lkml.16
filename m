Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6A17F7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678189; cv=none; b=Cm71QntvapFnbwnvOTZDY3GBjsh84ZqHu2NvFWrF/QGSjldIAb9MVHkAFtBcpm4DRY+y/Z40cP4deoFGs7ea48BbH9IITkM3ypILM+o54Vxl2ZadMlrdy+am0P+3OJKVk6Jd8WO7N9bwEzIbgVsLaF26kYAgIiWeoMvq8Hfil9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678189; c=relaxed/simple;
	bh=EuF8lurL6p/iA8TKALhZ4lhyb4SopomSm3LRQYZ/X1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVXKMG1hGeeP3X1XunBeCDIBVYK6lsSdu4sY+kRXAJ0M8RNCWVB98IckULBRy1sLGxF9sd8OeuoJ+XDfBMxDhLK69zTFkF8hzYcejv5p6ePJtV68t173vr5GdwYL/+mebhYlpOGvMnXe4MGfWjyrCJBZy3+aHo8qWa4kUPL8P7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=fwmfs+fX; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="fwmfs+fX"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58e0b26c4so74961491cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750678186; x=1751282986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CId97r6bxGhOkOsNTRpZGo7/FNNKpNsqY9QIA/bl+4Y=;
        b=fwmfs+fXrDT5GeTfHuVXKHOlb7KfByS6ViIPpsw/93lUsjU3zRFO7hy7fNOCO6xT3L
         U0kESQ2zpTSShEZTZslLLpKz3PL2NwVZ3kt8jRxaWbJHB9YIlNyp/D/ZCAB04vFp6f9s
         tgG3c3GgkoJfCxeO/V93m8J2/PUWK3raCIWkt7BGiovvDQneGPE4BvSHT+ZZCD3Fibaf
         mE3DgfNXk/pt/88r+RBjJ6oFiU1lna/UyXSKeWNhJCs2OGz1kUNTCQrx1sW0hfzN4JdU
         G1uTsUtMQN30D9sUGfI5ynqLlMHKawWUJ70DBsUqL6bMlbM8ES0/6yoCfGUenJOsI3N8
         VPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678186; x=1751282986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CId97r6bxGhOkOsNTRpZGo7/FNNKpNsqY9QIA/bl+4Y=;
        b=NJYCjOFe3tsvP4q7OwUytixY/N5tGUWKL1BJlLMgZZkbtyaBysYJ3eHxNgkWpFlHYD
         q+75cgsNpJ8kqK7IXfcUXxmZhjK4lVuiDRRyAICVm9mCrEuxwaaA+m7Xo0oblXHGRPxQ
         fDZHa5DjH4AW45ziFSsHWwgFfxx1P+Nm4ortDpEmVPHNyNw+555Sq2zRWBV1uTTh3P/1
         wcjSom41g4MtEkYuTukO98xSPVSON32sixAd83oGliD05s370LTK75Isj8V6HNSPOrGo
         AGiFbOzfvdkv0csUId17yczObhiaB9hTYgoMdoPFCiimiR1ecRxShasAuwgbK9wBtcxt
         E5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW0OlGFysFFQAm03eKy/U14InjY4vcWjtWB9HAu56IjgqgA2zzo+v5BHfB3DYB58kH7Ms1a4mb10LOdJJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+OWTung+HCd/kj6L9p8oc6js6HuyYKCP7P/Kpjas6mbt0V/6
	0Zg2vBGD7Oa1TEHe6d4YUf7ahAI6ZocKm6U5gmQ0qCylTcQLpBU0ENz/dOzQuksx4mAH3kuQ5o6
	NIINdWiIqzZcfl0zu4e1+ZM1RlRfqKEZOOjjv4pyVCw==
X-Gm-Gg: ASbGncupekjrdSrsqK4uk/fo8UeYGMpN24RfkPE75zIZ0Meh9PH3vYlvB3ruYzmHYHK
	6d1V3R9NyUNMVXTDo+vYCgaAW0Hyid1oVhhJE6c6wRkuUWsZ20kM57K65t4sRvYLNE7xjZ1hno3
	TVd2WTZy12GShTq7SSicjHbAoGCLwQgJzif9qRD8ye
X-Google-Smtp-Source: AGHT+IGPqAUH/RPykVSVaglFJdihJdozlPbvSoTGsXcR0nXvouD9V9X1wSLeh0iQLT+SzQ72tUMBq5c1jJy1W6hZsnA=
X-Received: by 2002:ac8:7f92:0:b0:4a4:2c46:26a2 with SMTP id
 d75a77b69052e-4a77a23acd8mr156063601cf.10.1750678186510; Mon, 23 Jun 2025
 04:29:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mafs0sekfts2i.fsf@kernel.org> <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org> <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org> <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org> <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
 <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com> <aFkDBNpzcCNdqjm8@kernel.org>
In-Reply-To: <aFkDBNpzcCNdqjm8@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 23 Jun 2025 07:29:09 -0400
X-Gm-Features: AX0GCFsAwZj53l7luv9N2S4aDs-8Fu10IYCHZ0Vuqd0BsrZgbB9cxOtR2gLz2-Y
Message-ID: <CA+CK2bCWqiQ1375oCZ9DCkjAHccWfhYxx4zHHBkY4tgh8G3arw@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 3:32=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Wed, Jun 18, 2025 at 01:43:18PM -0400, Pasha Tatashin wrote:
> > On Wed, Jun 18, 2025 at 1:00=E2=80=AFPM Pasha Tatashin
> >
> > So currently, KHO provides the following two types of  internal API:
> >
> > Preserve memory and metadata
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > kho_preserve_folio() / kho_preserve_phys()
> > kho_unpreserve_folio() / kho_unpreserve_phys()
> > kho_restore_folio()
> >
> > kho_add_subtree() kho_retrieve_subtree()
> >
> > State machine
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > register_kho_notifier() / unregister_kho_notifier()
> >
> > kho_finalize() / kho_abort()
> >
> > We should remove the "State machine", and only keep the "Preserve
> > Memory" API functions. At the time these functions are called, KHO
> > should do the magic of making sure that the memory gets preserved
> > across the reboot.
> >
> > This way, reserve_mem_init() would call: kho_preserve_folio() and
> > kho_add_subtree() during boot, and be done with it.
>
> I agree that there's no need in notifiers.
>
> I even have a half cooked patch for this on top of "kho: allow to drive k=
ho
> from within kernel"
>
> From 02716e4731480bde997a9c1676b7246aa8e358de Mon Sep 17 00:00:00 2001
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> Date: Sun, 22 Jun 2025 14:37:17 +0300
> Subject: [PATCH] kho: drop notifiers
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  include/linux/kexec_handover.h   |  27 +-------
>  kernel/kexec_handover.c          | 114 ++++++++++++++-----------------
>  kernel/kexec_handover_debug.c    |   3 +-
>  kernel/kexec_handover_internal.h |   3 +-
>  mm/memblock.c                    |  56 +++------------
>  5 files changed, 65 insertions(+), 138 deletions(-)
>
> diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handove=
r.h
> index f98565def593..ac9cb6eae71f 100644
> --- a/include/linux/kexec_handover.h
> +++ b/include/linux/kexec_handover.h
> @@ -10,14 +10,7 @@ struct kho_scratch {
>         phys_addr_t size;
>  };
>
> -/* KHO Notifier index */
> -enum kho_event {
> -       KEXEC_KHO_FINALIZE =3D 0,
> -       KEXEC_KHO_ABORT =3D 1,
> -};
> -
>  struct folio;
> -struct notifier_block;
>
>  #define DECLARE_KHOSER_PTR(name, type) \
>         union {                        \
> @@ -36,20 +29,15 @@ struct notifier_block;
>                 (typeof((s).ptr))((s).phys ? phys_to_virt((s).phys) : NUL=
L); \
>         })
>
> -struct kho_serialization;
> -
>  #ifdef CONFIG_KEXEC_HANDOVER
>  bool kho_is_enabled(void);
>
>  int kho_preserve_folio(struct folio *folio);
>  int kho_preserve_phys(phys_addr_t phys, size_t size);
>  struct folio *kho_restore_folio(phys_addr_t phys);
> -int kho_add_subtree(struct kho_serialization *ser, const char *name, voi=
d *fdt);
> +int kho_add_subtree(const char *name, void *fdt);

For completeness, we also need `void kho_remove_substree(const char
*name);`, currently, all trees are removed during kho_abort(). Let's
rebase and include this patch on top of the next version of LUO, that
we are exchanging off list, and send it together later this week.

Thanks,
Pasha
