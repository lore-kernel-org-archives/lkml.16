Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84E1A2872
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482594; cv=none; b=IVqMieIx17fN6rgDskbg2Aq5mWkjpi7/MHSq8tMgQcOz3ylaXr+Zak+uwGohoMBFwwzahrid4Zd7IHmYiz4P+WN1JJ3VvlS30yjulWpnepLn2Y60fd+ULENTP0VxI3SiDJJFIy2587L4TzTq6P6QGcfksWYKifTx5rsXXXBKP90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482594; c=relaxed/simple;
	bh=y4AY4K62fedPencGjJKnWwfhgTpyhRQDI5r8TTyeqzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuFXJbFOnOGONhUfA71AEt19zxMqwmaZkUwRPANZr/Io3poSxndoNd1Fh28EEhraJtwFNT0rdyPAAvUMKU9GOZvT29XzmFHlNsiexC08dgTd3zb3FkROOFcOhM+rJensVg8ENoueQPtSacK1bc0gx/ZAXnP7InXN2rO71csFyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XgXgzR5A; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XgXgzR5A"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c3c689d20so2709750a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749482592; x=1750087392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+Mg6PW+/K0QnsP+hIHi7hEEWjzJrekcG6Ta5Fzf3T0=;
        b=XgXgzR5ANHitIHH0VJjxs3FyAjGiHv+rBlOwj1v8iFspna7K0lqlMO+uaD/t6uJy0t
         rNuUeoeiSJvpbIapxpWmkDan5gda5AAWG1Ek+LDI1hw00stscPSd1e90s9VKZJFgbx0a
         wjQxkyUb3gB9xq5L6/C6jchjBFtbqcb8pWT/D+EInouXBpnWQgQNsZMAUVvJbaQ/nV4e
         JQ/4/GwEokHpWlNxRUuSTvcf1TMaZ6kYq+wNzCBVjyQJrEjqVazUU0Iu9mwJdLjuvTvx
         QEM/LTa+zUbeMwzQDf7IX0ke11Yfrs+LVeI05iOjN+OEKMJZ+Ods8omu/NMGB+qsXmUV
         mlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749482592; x=1750087392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+Mg6PW+/K0QnsP+hIHi7hEEWjzJrekcG6Ta5Fzf3T0=;
        b=mfReynM1MbxPWY2kbrW3FAC3MJUBSgRTo+HcdvLXRnvoznW/up9zOZ3x75TmYqdkAs
         LU6thQ7D5HBX0j1DehVHd9wjURjUEL2duUpEEE/q5eOyHxPm7xvG0NMZFebelbHUQ0/w
         gcQUYAzSwg+/7gfEpGKJ47wqfI4bmSpQiACx8bkytp8EDPUALx1g63OevaALJ+2AgQ3b
         wBbxd66Hdg5qcExucWjeM+gzTqeEFPnle7TaLKgC2tOpxSJQjtBSYtp+5JsJiaFrxJ85
         BPmJsm34Go5Vuqwn56DIkjTbmSMMakrLffwPDSC5GELOqpVCS5LXilGa7m0Y/mk1LYMB
         rW7A==
X-Forwarded-Encrypted: i=1; AJvYcCUxWfZ+koMdVGIWNEJ4CGLdtt7XXKcH04MPPgiwHveIP35UQJ5V0q+zAI8cul+qMbozOci2c+Re4bz3Qoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjLRKQX1EOJUMDUB26BKOWZfJChfeXruaRO2sVx+md3qGx0m3Q
	oL2fhJ3pnucgMrzMXiN/as6oBvqwF/KGFRWe6MNVHmUgJD1cFe/dj7VOw1Q75CQLU3k=
X-Gm-Gg: ASbGnctYpEvXpysqozaI9RsIJoTKZkBoueJwiqk+927cKbtN/BPeHlBXdH/IU7/GuZH
	pLYwgkXltgnq3Rvys7m/ZEPjgDba9ZqTr0wsNgD4740U/wP84sqS274vdwo/6+kLl9EZVqvmm9F
	rSpeW1AxsRQtTFnLMP37RUSXnIvASCyiBaCTLLKJljIsLqbGeA9ONesj8lyMWb7mCuQ5Rw2gGCs
	GZDXGHn4m8uQKuA/L9i5iSlWwt3ZRzhMjaDY1Y5qe8vhjcAgtb6XKFcKFwbTATFZJDQx8BZbjPk
	9CfHpXOPJfKEaTVJeu1BZpq9bzsdnFqKblH3OoYTcCYqkQ19+6CB+kDQYjdE+4aeudyIQnJ1GTC
	m
X-Google-Smtp-Source: AGHT+IEHQs24xS7vzskFJPPr8eh6p9W8ZrujNawhU2iz0AreagkiHluW65S1z22AdhoPCthNzNJd4g==
X-Received: by 2002:a17:90b:3891:b0:312:26d9:d5b4 with SMTP id 98e67ed59e1d1-3134740b55cmr21132387a91.17.1749482592330;
        Mon, 09 Jun 2025 08:23:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1329:68ff:ffeb:cd9c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc374asm5791390a91.29.2025.06.09.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:23:11 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:23:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v16 0/6] Introduction of a remoteproc tee to load
 signed firmware
Message-ID: <aEb8XbhY5dR__GM-@p14s>
References: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603100808.1074812-1-arnaud.pouliquen@foss.st.com>

On Tue, Jun 03, 2025 at 12:08:02PM +0200, Arnaud Pouliquen wrote:
> Hello Bjorn and Mathieu,
> 
> I am resending this series after waiting for over two months for Bjorn's
> feedback, despite a prior reminder.
> 
> Please could you coordinate between yourselves to determine who will continue
> reviewing this series? It would be greatly appreciated if the review could
> proceed within a more reasonable timeframe.
> 
> Thanks in advance and best regards,
> Arnaud
> 
> 
> Main updates from version V15[1]:
> - Removed the rproc_ops:load_fw() operation introduced in the previous version.
> - Returned to managing the remoteproc firmware loading in rproc_tee_parse_fw to
>   load and authenticate the firmware before getting the resource table.
> - Added spinlock and dev_link mechanisms in remoteproc TEE to better manage
>   bind/unbind.
>

Have all pending issues been resolved or is there still questions about some
aspects of the design?
 
> More details are available in each patch commit message.
> 
> [1] https://lore.kernel.org/linux-remoteproc/20241128084219.2159197-7-arnaud.pouliquen@foss.st.com/T/
> 
> Tested-on: commit 0ff41df1cb26 ("Linux 6.15")
> 
> Description of the feature:
> --------------------------
> This series proposes the implementation of a remoteproc tee driver to
> communicate with a TEE trusted application responsible for authenticating
> and loading the remoteproc firmware image in an Arm secure context.
> 
> 1) Principle:
> 
> The remoteproc tee driver provides services to communicate with the OP-TEE
> trusted application running on the Trusted Execution Context (TEE).
> The trusted application in TEE manages the remote processor lifecycle:
> 
> - authenticating and loading firmware images,
> - isolating and securing the remote processor memories,
> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> - managing the start and stop of the firmware by the TEE.
> 
> 2) Format of the signed image:
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
> 
> 3) OP-TEE trusted application API:
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
> 
> 4) OP-TEE signature script
> 
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
> 
> Example of usage:
> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
> 
> 
> 5) Impact on User space Application
> 
> No sysfs impact. The user only needs to provide the signed firmware image
> instead of the ELF image.
> 
> 
> For more information about the implementation, a presentation is available here
> (note that the format of the signed image has evolved between the presentation
> and the integration in OP-TEE).
> 
> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
> 
> Arnaud Pouliquen (6):
>   remoteproc: core: Introduce rproc_pa_to_va helper
>   remoteproc: Add TEE support
>   remoteproc: Introduce release_fw optional operation
>   dt-bindings: remoteproc: Add compatibility for TEE support
>   remoteproc: stm32: Create sub-functions to request shutdown and
>     release
>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
> 
>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
>  drivers/remoteproc/Kconfig                    |  10 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/remoteproc_core.c          |  52 ++
>  drivers/remoteproc/remoteproc_internal.h      |   6 +
>  drivers/remoteproc/remoteproc_tee.c           | 619 ++++++++++++++++++
>  drivers/remoteproc/stm32_rproc.c              | 139 +++-
>  include/linux/remoteproc.h                    |   4 +
>  include/linux/remoteproc_tee.h                |  90 +++
>  9 files changed, 935 insertions(+), 44 deletions(-)
>  create mode 100644 drivers/remoteproc/remoteproc_tee.c
>  create mode 100644 include/linux/remoteproc_tee.h
> 
> 
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> -- 
> 2.25.1
> 
