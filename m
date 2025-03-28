Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E8322B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743191391; cv=none; b=HMDwMlZxe0Eu8xuyNfpGJCOPwb1f0+F5LmyPMCt/iJfAUYGPhxMEIQ+xdHNxUsnfUyz9RmdvpUztOSj8k7iWZm3h3Sb/cb7GsaHgQS7W1+6i5M/IXtwCdhl1k7O4PT5DQA1pgfibivpEelNIPrmjAQYuNX4iriiO/yQv9pT95sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743191391; c=relaxed/simple;
	bh=8dHn2vvTwifSSI2W3cjMtPdTKZLCh8oLOwo2gOjhy+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tkf0XyJaxDPF5quXXQHfcXlEJkpuayqKa9EcJKh6nDLhpB2VvV5xeDlpcZWzJrNF0kcns5141b/iQ6LuSsOb/2dwNNsYZ/rx+qO2b6x9oDoKRowVriuBJzH8az99JNWa1ZUrsqlbdfw3Q1gK4YPL1pPbE1h5xg/oaL9NHuijSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fDz+lVZp; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fDz+lVZp"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso653527a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743191388; x=1743796188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVDLjf96+CIUoJN5Qi13tgNS9/4rLlwNZkSbNFjDtK8=;
        b=fDz+lVZpPGv8veNN08MXSq/c6LbAAHNVetXLIQBxYsN1AW5qLNCwTYscluPYgvsniX
         sKvHTJHljsma/ncVXSrUCYSGvE6bWBRT+VG5VtiRuVPK7Gr9/OHBUeascztc8WgyQX6o
         n+UzR1xQN2zJIbhMYFBtVn64HIcVPLBKPzoaDkuXfQgXVHiTgrt3EFXnPddrOJijfslH
         YOEVuiAvv+ce1i7tFZ5PxOy+MuI9b3v3q/HxBd3Ugh9Mape195q9iCvgPgZmoFiWC6aA
         cGgdJbu3TuctdpQw1V8b9wqyh3mN2RNn5Pkay4rwwH1t6mFFuAkft0+244j4z/dWLuvP
         TCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743191388; x=1743796188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVDLjf96+CIUoJN5Qi13tgNS9/4rLlwNZkSbNFjDtK8=;
        b=u4LTa/lvOo0tGhZzQP1twGFQo/RgNGU2vFORLXzfPCe68xPge85b5YsWOaLBSSYYq3
         ensscpoAZFF1dlpDs3L7PouCb9r9wBzThSA/gsPeY5af/g/Li1yahKmBUZIf1GzSXBcm
         cMYEzP7yL3zPYgO0QCZFOhYlUxkR7sBi3y1VdOU17WeAVnp4+MwifQQfD63tCqVeZPbS
         vCDRpNgacq61vPizyzx22S4+Rej7bDM9Npap9cgR292QBwXIHDwagbzPX/uNhDiPK9nC
         yv1Lkpe/L4ZGYU9idlsPmTTdirCCxxYJc6zvlK++pGeFE6XOWIYbnLo+30MKq7zqSD4S
         3Muw==
X-Forwarded-Encrypted: i=1; AJvYcCXZSpT33CafwXqLpJGLYM7x5Ln/JPAvfc334+sHbTM9izgMWikS0dGO84MDJa51mR6bFKBvvRHzVrx+JFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIXywnUE7s1/6eMgjBAWAl9FOLyjkbhhhyKM2QoDA1PHmy9uN
	ROQXtm7yAC8w2Hn9WXrtWiINOby2w/rLAfkUnm5HP2yxfzT0KI423EFJS7BxYqp7XDz4NnHlOdy
	CyaKswXjhnblcBhzVPiF2NTK1m8jkOY9dR3wh5Q==
X-Gm-Gg: ASbGncsJnfx11DBrNFSTYsE6GH7ih6lg/XMg7GGtOCcofAPW3tzdJqMqSRlTaPq+90C
	tScUz84yr96fKV7LVun5N+Z7JwXNybjBaqXexdEMm2/HDOFDy6HvoXi/E1WTfJYesy6QAiWSjFl
	lMAwtxmGv03q1PlUfCs5qr1DGd/IPgCEdhmNk=
X-Google-Smtp-Source: AGHT+IGrl/mKQfFw/+XjS8bzX76MdoEk88bqdDe6coxyEavvPIofC41z6Z7UbgR1Z4PlFwBz7py/lYatV3/VrQbVZ04=
X-Received: by 2002:a17:90b:3e8d:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-305321512bdmr289975a91.3.1743191388477; Fri, 28 Mar 2025
 12:49:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328193826.356257-1-jmeneghi@redhat.com> <20250328193826.356257-4-jmeneghi@redhat.com>
In-Reply-To: <20250328193826.356257-4-jmeneghi@redhat.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 28 Mar 2025 12:49:37 -0700
X-Gm-Features: AQ5f1Jo3KdNQ8qCtKv_TRQl0FksSqMC2EEdES0mrQoJ0kwJ1SERO0qy9kiXvybo
Message-ID: <CADUfDZoXg39h-5gi+aVj2u1H6HC4Beyp2XPTrjJ_PMDPf11dQg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] nvme: add the NVME_ENABLE_MULTIPATH_PARAM config option
To: John Meneghini <jmeneghi@redhat.com>
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, loberman@redhat.com, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	emilne@redhat.com, bgurney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 12:42=E2=80=AFPM John Meneghini <jmeneghi@redhat.co=
m> wrote:
>
> The CONFIG_NVME_ENABLE_MULTIPATH_PARAM option controls the
> core_nvme.multipath parameter. When CONFIG_NVME_ENABLE_MULTIPATH_PARAM=3D=
n
> the multipath parameter is removed from the kernel and nvme multipathing
> is permanently enabled.  When CONFIG_NVME_ENABLE_MULTIPATH_PARAM=3Dy the
> nvme multipath parameter is added to the kernel and nvme multipath
> support is controlled by the core_nvme.multipath parameter.
>
> By default CONFIG_NVME_ENABLE_MULTIPATH_PARAM=3Dy
>
> Signed-off-by: John Meneghini <jmeneghi@redhat.com>
> Tested-by: John Meneghini <jmeneghi@redhat.com>
> Reviewed-by: Bryan Gurney <bgurney@redhat.com>
> ---
>  drivers/nvme/host/Kconfig     | 11 +++++++++++
>  drivers/nvme/host/multipath.c |  2 ++
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/nvme/host/Kconfig b/drivers/nvme/host/Kconfig
> index d47dfa80fb95..8c04b6b93982 100644
> --- a/drivers/nvme/host/Kconfig
> +++ b/drivers/nvme/host/Kconfig
> @@ -28,6 +28,17 @@ config NVME_MULTIPATH
>
>           If unsure, say Y.
>
> +config NVME_ENABLE_MULTIPATH_PARAM
> +       bool "NVMe enable multipath param"
> +       depends on NVME_CORE && NVME_MULTIPATH
> +       default y
> +       help
> +         This option enables the core_nvme.multipath parameter.
> +         If this option is disabled the core_nvme.multipath parameter
> +         is excluded from the kernel.
> +
> +         If unsure, say Y.
> +
>  config NVME_VERBOSE_ERRORS
>         bool "NVMe verbose error reporting"
>         depends on NVME_CORE
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.=
c
> index 6b12ca80aa27..83084093e8db 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -10,9 +10,11 @@
>  #include "nvme.h"
>
>  bool multipath =3D true;
> +#ifdef CONFIG_NVME_ENABLE_MULTIPATH_PARAM
>  module_param(multipath, bool, 0444);
>  MODULE_PARM_DESC(multipath,
>         "turn on native support for multiple controllers per subsystem");
> +#endif

If CONFIG_NVME_ENABLE_MULTIPATH_PARAM is disabled, could you #define
multipath false in place of the global variable? That would allow the
compiler to optimize out the multipath checks and the resulting dead
code.

Best,
Caleb
