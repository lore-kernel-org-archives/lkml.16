Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC92283C98
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292797; cv=none; b=D6kPd67ZQSXa8qEGxPhbvGflAMDRiy9W3dgtEQJ36s8RMEvay51DzpLoBhXc7GZ8JhQZ5nrpV/uxLI+I7Q5lXNbGBOC1rIslNJAiGjLjpHqoWhYjubNNmGDXNZJ2Rp71nqLrv/Zq8iaCNOuTDoE+a3orRExyJw0jf8KBTTF97Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292797; c=relaxed/simple;
	bh=HdLFcexM6+DbkK0ftxP2gkcuJbYxhvAwlG3Qm09g5PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGqDv+zPoM7lGJc4cwfw5kne9bJXK4Nj3ExXlaeZwTNjA4B03bQNWPUgn8XD4dOVxtEnypqnbLo2h/L0W8x/sUjP67aJyVra4iIelhW4tHy/8VSv0Tl2TUxegLtG1rxFaiY198wYNLjzB2vLG2EQ5DlESPVdbNgfgDwtotMqV68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khGkSeOE; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khGkSeOE"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1561168a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292793; x=1744897593; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s3Tv77bW0aU9RBMscUYQTaZLK3cWTZ2jDWR8IUulQ9A=;
        b=khGkSeOEYRaUpOhwSoKLpkv0pffQVPHJD+AMQhFTDcLlTbD4fH43Fh54jo5fq4qSRF
         G+QE9rLnWDdsfVu4PzU6A1ROouG/3eioU0AlM0M9la/mYn+tRlWbeP/Q+QcfyDOOpr+D
         qorptV/SPcDlTP4u03oyMUZaA2nIMwxNe7W4iE1m8MAr/+h8+NxRYyqMMYj5OsEXi/SV
         6a7k84IR1gBAlOshj5b/0RTgeYnNMEpoVJ9R/YStEpbB9LUnXDUDtswXFXtjy4VlZSmK
         fNkolaTmUzVe2cgQb+svYd4RR8DgbrycH/aUAX+8jjJ3fgs5QwvsB5P2Jo5/7zqkG2X4
         Mz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292793; x=1744897593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3Tv77bW0aU9RBMscUYQTaZLK3cWTZ2jDWR8IUulQ9A=;
        b=Jqsl7gSAiLmeB5eBlXy1Nue0K7bhFa3hEzj8Db/biHkLKYEc0PhXH/ziEjNaWIFRAP
         4t99p4ynyaHi9WDwUDVd59+BSID4tKW1NY5Ss0m7ZoVWYLQpVtbr6kb58f2l0vLr50Bh
         Nt3AxEwqufSNOiUx81cWdeFe6efIGgVZFBnI/EFWGYxaxWDFWnHe5oU6sl+h5yN91tF0
         eyhcyEi4B5t6UsteaWPGScyn64fFmsRwMbMBeHPQ4o0mhSIR88B4OrdpsDQaaMXiygbJ
         KKR4IIl8TcJF7zPBLf1BHtrEPC1vHl/JYUaIWW81mxJ7pSTx+xqoY+OywVJwNEN6qe7n
         OghA==
X-Forwarded-Encrypted: i=1; AJvYcCUamfFM6IM29Oqqo3yWjH0vgFEVIX2DssmHmch/XiOkWEH4J162G2WAt9Z+1aas6GRFYVsxN7itDPBb2VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWX//uyBI1bnUD0sTjtRRCfXLd0giP2ynQSHdH4pmTk8QSbzBr
	NIK+3zWhN1ZN1e6j3UCPtVsz8hzt+WhErZrMUaqyOiXHhNoXzHFqEnlmH0wEzpuDYw5Ss0JvjqB
	vA9+Eg8ff9EgzWlMUj0CmzgmFNtk=
X-Gm-Gg: ASbGncsjz9FMZJMH/EoBUXKfbIFCmkUq0bwU58Sn9EmUoqfpbx5u2ZabeSWEhGBImQq
	5UOOdhOEL6O7pEhqck8cR/cEY91NSMvxAsGuIRC18yU3WatRFltb2zy/gJ4UjRw6qwyNdaPxggW
	JZHxwrG0KEP52/059ZWpv3uw==
X-Google-Smtp-Source: AGHT+IHiZFDgujiOG3UnHGeTx0KUPl+GHBXPb9fdrtmfKTuXg91n647EErsdZP3zN0Q/Y37TV62Z4t7VfBh5GpvARCI=
X-Received: by 2002:a05:6402:268b:b0:5e5:334e:86d9 with SMTP id
 4fb4d7f45d1cf-5f32a138efdmr2440544a12.13.1744292793246; Thu, 10 Apr 2025
 06:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 10 Apr 2025 19:16:16 +0530
X-Gm-Features: ATxdqUEdXHiyPPzlQQzx8sGDVrj8q4dzBzZE7dD5ZZvqIMWxRPwWGuOzBSchz3Y
Message-ID: <CANAwSgTp26r-xeiSDkdX21Sp3RQtfh42JV4fCgirLkHZYuGD-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, 
	Furkan Kardame <f.kardame@manjaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Martin,

On Thu, 10 Apr 2025 at 03:30, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> meson_drv_bind_master() does not free resources in the order they are
> allocated. This can lead to crashes such as:
>     Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c8
>     [...]
>     Hardware name: Beelink GT-King Pro (DT)
>     pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
>     lr : component_unbind+0x38/0x60
>     [...]
>     Call trace:
>      meson_dw_hdmi_unbind+0x10/0x24 [meson_dw_hdmi]
>      component_unbind+0x38/0x60
>      component_unbind_all+0xb8/0xc4
>      meson_drv_bind_master+0x1ec/0x514 [meson_drm]
>      meson_drv_bind+0x14/0x20 [meson_drm]
>      try_to_bring_up_aggregate_device+0xa8/0x160
>      __component_add+0xb8/0x1a8
>      component_add+0x14/0x20
>      meson_dw_hdmi_probe+0x1c/0x28 [meson_dw_hdmi]
>      platform_probe+0x68/0xdc
>      really_probe+0xc0/0x39c
>      __driver_probe_device+0x7c/0x14c
>      driver_probe_device+0x3c/0x120
>      __driver_attach+0xc4/0x200
>      bus_for_each_dev+0x78/0xd8
>      driver_attach+0x24/0x30
>      bus_add_driver+0x110/0x240
>      driver_register+0x68/0x124
>      __platform_driver_register+0x24/0x30
>      meson_dw_hdmi_platform_driver_init+0x20/0x1000 [meson_dw_hdmi]
>      do_one_initcall+0x50/0x1bc
>      do_init_module+0x54/0x1fc
>      load_module+0x788/0x884
>      init_module_from_file+0x88/0xd4
>      __arm64_sys_finit_module+0x248/0x340
>      invoke_syscall+0x48/0x104
>      el0_svc_common.constprop.0+0x40/0xe0
>      do_el0_svc+0x1c/0x28
>      el0_svc+0x30/0xcc
>      el0t_64_sync_handler+0x120/0x12c
>      el0t_64_sync+0x190/0x194
>
> Clean up resources in the error path in the same order and under the
> same conditions as they were allocated to fix this.
>
> Reported-by: Furkan Kardame <f.kardame@manjaro.org>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This issue was reported off-list so I'm unable to provide a link to the
> report.
>
> I'm not sure which Fixes tag fits best. My preference so far is
> Fixes: 6a044642988b ("drm/meson: fix unbind path if HDMI fails to bind")
> but I'll happily take other suggestions as well.
>
Thanks for this Fix.

Reviewed-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>

I have tested with the following script on AML-S905X-CC
---------
#! /bin/bash
set +x

cd /sys/bus/platform/drivers/meson-drm/
for i in $(seq 1 10); do
        echo "========================" $i
        echo d0100000.vpu > unbind
        /usr/bin/sleep 1
        echo d0100000.vpu > bind
        /usr/bin/sleep 1
done

Thanks
-Anand
