Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC72116ED
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820909; cv=none; b=ReWoBCr+v30c0jfW3GvFNkXEB33xdjcysVru6Ra8AxxgykX+1zFiGFQDkvESjG6Fb4LEkJ0SZsq1wXHD7pQ8plTQjaZzU5ConLcq83ZhUoexfneNDemGtwBu/jq8/l7YCg0TGn9Vg1sJt0tSlQsQjFuR5FxPFqSOCEtfiWN33ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820909; c=relaxed/simple;
	bh=V5EjEqLAI6VF4m0ym14G0zP2Lk1AAeOTupEjRA2/fhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QACrgutKr4BjAv8djXAQQ4/CKHkCVzHVAB/WhgRkv+m2b6KHGUtAOkHHLa49McZkiLFj92wKmVgNzWIKbKyOFV+V8DphEfolQWEWKavjyQUJTKZMR/xZutzlbT3jWA3g16ufi+AzhFywVb2LqySIbGyA/4uV3Kw6EBdFK22kQdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DMt5At1z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DMt5At1z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso62935e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744820905; x=1745425705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcKONrIAwY+Efjpusl4unIszUT6B68ir1oyM8EH1UJY=;
        b=DMt5At1zuEraXQDFdfoUFyvRo93WxwpM9AIaXjydcUOd8acdr4WnZ6Od9BCDBrfZoS
         IpXaXURIRkBaAdzsoDppwKFlPtFA597blEBXLIQ1jzW7DAp13/CExsblaURmFHAXV8QS
         DrO+HYC4JjqVac0hoL4iQ3zlCoSC7/pMpMWwN7GEIIxd3vjAg19/VB4ZS7cQoqOAnw0c
         MdgvX2MYGIRzNlqFIrtG70316UJiEz5U0phJ7y7ft2ylDXQiMkb6xKPnzp7nbG6cuUbZ
         1cNgss8+3qC8TmXwbbCnlq9Hi+8kYLMWCI8qfmxw+aLQrm8d020+hs9ra7i1jJ65Vi0x
         S4dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744820905; x=1745425705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcKONrIAwY+Efjpusl4unIszUT6B68ir1oyM8EH1UJY=;
        b=IXuC5BQgqPr2+iflKUqCMwnG7DkV14Uo74Y61dF6JScnJlXkesAnSwugyg/ownpexA
         iV2zvpLQZ3vbAvB5W0GQmLG2K72BDDaDdmJKX66ULD7ZlFq/NSxcVfo4STmQkPvUyoWx
         i0RO6TPwbMJvY6f/aJ3JPf8rWhzK3/1qM9dLt5PqxchtYe2dFaZeJQO7pde9nP8jbknr
         zGkkLW6ILFSvLSSQULa2tm/RgmF1MZn7WTF+twk7whF4WyU0SXmMRxjbPoaWH3t37KWd
         qrSo3uX97K1OwRknqaC0VQK8kt8YCd4uBW+Rxws5LgYBJL1u6g/HUJySl8/oZxinybe+
         8XcA==
X-Forwarded-Encrypted: i=1; AJvYcCVe7mInFgR+2s5wnqeNkIPd/nVVRFNyfiFCvJ+fzqPUHtt60KqJeAtneU5Omxl6X+J92ni5Cqi6AtlHFAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYA4vUrFpPAGG48POUbg2Qll9u8jWk7q6N63l+uaR1Ldac4xer
	G/pwkExFECWEAVNfEuikACZWpOgEbhUix806TpjXgwPVcsNrd4tBdA4VFef0qZYQyQn7YjPr0uF
	estSpmyDFufx+Su/ZJbbO5ZqS8fffsoIldLma
X-Gm-Gg: ASbGnct5yciRFnKv9fWcLdbW/vOyz1/uV0P98i/7S81wnN3iQe+nS+s//G0rucwrvk7
	7nq8A44fHgwYZ/SC0YyJoMLTv8mY+BUDcmiEDEbMItJ4Qvsdg6hka9kB9qHmGMKxi2UP8jV3Hye
	laMDejDyyAOM8si5Lw/hX+qvb9Y/tegv+SEw6Va5dGHeWgDqJo/qm8
X-Google-Smtp-Source: AGHT+IECcvlnv6xPe9UB0/XJHO7q92sQEEqdeeGFlPVCn4BZ/toc+Qo3v9Dc1e4mY/RgIEckbUeu3UbXyA3ppO6oN3o=
X-Received: by 2002:a05:600c:6a87:b0:439:4a76:c246 with SMTP id
 5b1f17b1804b1-4405d26eadcmr1009515e9.6.1744820905359; Wed, 16 Apr 2025
 09:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414225227.3642618-3-tjmercier@google.com> <202504161015.x2XLaha2-lkp@intel.com>
In-Reply-To: <202504161015.x2XLaha2-lkp@intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 09:28:13 -0700
X-Gm-Features: ATxdqUFoAbnFhGEzvGofJporgvqMuSJROlNX-nlFC0ORBP_b5Axo3RH1otfUvlU
Message-ID: <CABdmKX16QttfxRYHaq1B92U8nw+S6Gte+mFVhOTnCy4H3cLFcA@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: kernel test robot <lkp@intel.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, jolsa@kernel.org, mykolal@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 9:43=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Mercier,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/net]
> [also build test ERROR on bpf-next/master bpf/master linus/master v6.15-r=
c2 next-20250415]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/dma-bu=
f-Rename-and-expose-debugfs-symbols/20250415-065354
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
net
> patch link:    https://lore.kernel.org/r/20250414225227.3642618-3-tjmerci=
er%40google.com
> patch subject: [PATCH 2/4] bpf: Add dmabuf iterator
> config: i386-buildonly-randconfig-005-20250416
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df=
0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=3D1 build):
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504161015.x2XLaha2-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: dmabuf_debugfs_list_mutex
>    >>> referenced by dmabuf_iter.c:44 (kernel/bpf/dmabuf_iter.c:44)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:53 (kernel/bpf/dmabuf_iter.c:53)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:26 (kernel/bpf/dmabuf_iter.c:26)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>    >>> referenced 1 more times
> --
> >> ld.lld: error: undefined symbol: dma_buf_put
>    >>> referenced by dmabuf_iter.c:45 (kernel/bpf/dmabuf_iter.c:45)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:90 (kernel/bpf/dmabuf_iter.c:90)
>    >>>               vmlinux.o:(dmabuf_iter_seq_stop)
> --
> >> ld.lld: error: undefined symbol: dmabuf_debugfs_list
>    >>> referenced by list.h:354 (include/linux/list.h:354)
>    >>>               vmlinux.o:(dmabuf_iter_seq_next)
>    >>> referenced by dmabuf_iter.c:0 (kernel/bpf/dmabuf_iter.c:0)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>    >>> referenced by list.h:364 (include/linux/list.h:364)
>    >>>               vmlinux.o:(dmabuf_iter_seq_start)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is due to no CONFIG_DMA_SHARED_BUFFER. Fixed by:

--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -53,7 +53,7 @@ obj-$(CONFIG_BPF_SYSCALL) +=3D relo_core.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D btf_iter.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D btf_relocate.o
 obj-$(CONFIG_BPF_SYSCALL) +=3D kmem_cache_iter.o
-ifeq ($(CONFIG_DEBUG_FS),y)
+ifeq ($(CONFIG_DMA_SHARED_BUFFER)$(CONFIG_DEBUG_FS),yy)
 obj-$(CONFIG_BPF_SYSCALL) +=3D dmabuf_iter.o
 endif
