Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B019DF4D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750632043; cv=none; b=mqCBXYR2Q409hM36mF6urToJuG0HyuiX5mRkR7xbfaobMIjjevUEYq0D7f4XSau/CTKwwhYPeWWlgK8hM3evW875HFWCnpQZB/JCEROrbioUUxvt7byKpJ7yyGdn/XkOfBcyQJLQ6t+UvWZWxzjgJW7KigI7LyEmSVrTvnIm2iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750632043; c=relaxed/simple;
	bh=dUR7hyQwheUBWNHY4rNwjcMtYPvmh/QenZMXaal3W2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EMYiTTcr0bvdOYlD/thASUsEC82udDFBLqAj5z4dOdSGyAEGgStNrA67gDoob9xq5GyhnyLTpz3micgG4OoC6MVa5x1pJ4uNnXnhNIyvui4Oz1lwbinBq3SeD7MKRD2+gK0oP31lQA7V/cbmNbGpaZ1vC3Kg4OCkOfYJuiIKDaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W6gyhmF2; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W6gyhmF2"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a58ef58a38so256061cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 15:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750632041; x=1751236841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByKFnzhwxRKZs2K5naolZtHtX13ocHKu0HolQhra1WM=;
        b=W6gyhmF29whtB8EqUQE7HnkDlc5jxwXqOOpFt7Ow2ooxMHHvMDY2K/Zky2vLsS5Kr6
         /cwtvJiBX4eD8VjEzQdXdMX2l0c+ruvyoIFQKAGg8sHQIRJgL1cT/iTppXNWIZa5hXvI
         rS9zF9Xv5oS/pYLB+vpMZzMZXpFq5kDebxaNa5lduzuBXwNpw4pirxl858D6Ib0M8ksq
         W4MwiN6itqU+XiuX6rp/NJZE4U7dGrzdF/lw0OgJouy+2kDOrpoAEIlACgLGSgM5Kw7H
         w5uAmYtwvulD948U3c2+b6wayrAioK+xuhN88vjIRk4NFubbi2gsVg9jvRYRHFK6rctG
         AGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750632041; x=1751236841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByKFnzhwxRKZs2K5naolZtHtX13ocHKu0HolQhra1WM=;
        b=l8iQ1VDC4N3ekoyBYOYISpJErRUxzbs1SEXVR8KHAURYb2k4y8bSXvjPI46Rsx+i5+
         /0tl6TYOOtU5fNmOWgYps0EIow5BuCn/L3fH1ioi8I/hUeRCe0YL9qOLlAbL989nZPr+
         qzaGXlTTq9n95gLCpbwoFtUBFQLEYvBCYTGsl2/0lStaqyHzgIcbd7/lvyk5RDVsZ/qB
         pqLHj6CJNEUluRKiHLvjog3eFrlmA3KEmL9JkQ60L4AvkC9sJnh9J4KKIkmh18WkVc2l
         NqvZ88XMfFxXSjlYKBipTB3iD/ktiUnOmqj10FNbgiVQHH0gbIg82tijpwqcDxZfREk1
         aQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVE0uhBqVwhgg/GtytCuy3fXBXTOJwWesNB4LyXlTLr/znQHXCO7Qnrdg532F/81Oq/qAXv+/jfNYq0dLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuN79GCkcTVtyN1+daQyBCmKDcPjq+6MUrfGfGDJGeydlBzk7B
	2aOg2Q/99uRqOARDKPNFVuQ89r3SXwaHC8ruwx3X7DMzoHmXY2sLm3B0VatF+LouGDJVsvEWiTv
	P9paniIcXuN0UoY6/NbSaSC7qx1DWO5UIJ9oSh1e9
X-Gm-Gg: ASbGncvVhT5vVx/zzABcz8fAYk8UD3OenwNF8ZtcAF/5fdJPPxCfmKBpwze/CzT4Rch
	DBcaAfeipSUDq+zIPvfzJLR96GSiAitJw7SkvnlcYrEBj9bF4gEpVXteU16OLvSS1fJaWqnTMop
	szEYSm0tqcJ2OTQONJdz8ANT4pRyuFAgXO67XwLZUh8A==
X-Google-Smtp-Source: AGHT+IE5tQt4/6FQY068Z1ESwzF+FC2nnkGkiztgAHajhv0/xdX+Nl4gX51C+4BpqQLa4eiGBPAjj2LMCvfE8u61t4s=
X-Received: by 2002:a05:622a:2cf:b0:494:763e:d971 with SMTP id
 d75a77b69052e-4a786d943ebmr4256801cf.23.1750632040553; Sun, 22 Jun 2025
 15:40:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620093102.2416767-1-hao.ge@linux.dev> <aFU7f5fcD9RJ3Mpa@arm.com>
In-Reply-To: <aFU7f5fcD9RJ3Mpa@arm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 22 Jun 2025 15:40:29 -0700
X-Gm-Features: Ac12FXxuYKdmyFuraLrFI24DrexQbVSu7tvYSsKFqmip14JtfwI2W93zOOFLmWI
Message-ID: <CAJuCfpELs1Y_YaT3-f8-dnsPqkwgGShEVU9tqJe=3RJU3BK_6w@mail.gmail.com>
Subject: Re: [PATCH v3] mm/alloc_tag: Fix the kmemleak false positive issue in
 the allocation of the percpu variable tag->counters
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Hao Ge <hao.ge@linux.dev>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Hao Ge <gehao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:44=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Fri, Jun 20, 2025 at 05:31:02PM +0800, Hao Ge wrote:
> > From: Hao Ge <gehao@kylinos.cn>
> >
> > When loading a module, as long as the module has memory
> > allocation operations, kmemleak produces a false positive
> > report that resembles the following:
> >
> > unreferenced object (percpu) 0x7dfd232a1650 (size 16):
> >   comm "modprobe", pid 1301, jiffies 4294940249
> >   hex dump (first 16 bytes on cpu 2):
> >     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> >   backtrace (crc 0):
> >     kmemleak_alloc_percpu+0xb4/0xd0
> >     pcpu_alloc_noprof+0x700/0x1098
> >     load_module+0xd4/0x348
> >     codetag_module_init+0x20c/0x450
> >     codetag_load_module+0x70/0xb8
> >     load_module+0xef8/0x1608
> >     init_module_from_file+0xec/0x158
> >     idempotent_init_module+0x354/0x608
> >     __arm64_sys_finit_module+0xbc/0x150
> >     invoke_syscall+0xd4/0x258
> >     el0_svc_common.constprop.0+0xb4/0x240
> >     do_el0_svc+0x48/0x68
> >     el0_svc+0x40/0xf8
> >     el0t_64_sync_handler+0x10c/0x138
> >     el0t_64_sync+0x1ac/0x1b0
> >
> > This is because the module can only indirectly reference alloc_tag_coun=
ters
> > through the alloc_tag section, which misleads kmemleak.
> >
> > However, we don't have a kmemleak ignore interface for percpu
> > allocations yet. So let's create one and invoke it for tag->counters.
> >
> > Fixes: 12ca42c23775 ("alloc_tag: allocate percpu counters for module ta=
gs dynamically")
> > Signed-off-by: Hao Ge <gehao@kylinos.cn>
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks!
For lib/alloc_tag.c:

Acked-by: Suren Baghdasaryan <surenb@google.com>
