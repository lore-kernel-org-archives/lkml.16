Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D89800
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745981884; cv=none; b=h1dHIdfnkKlvfeyi7hms6/E7TwBVDk8nGjdfXEvFcYGYsqwSBjYJobGEGQQMO84/QeEbOFFedtRYTcCEKYu1ceyPfq3PE1g6ZsSXmcSZ6Ys8Q37giLmq6UC+JfQ/xJf/PyaCCntfJlBLf6IgacKtcUJ304zTAG6Nz7DBM7KYVEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745981884; c=relaxed/simple;
	bh=vSVqtBuB+jDZR9oAppVW3n9jSJJUZ7Ihd2hGUqwZ6Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/gc8oycgvZZT0rKpyEBZtcdJ7JnDB3nmUW89splDXePOi+a5/IIJNaDlbufOBB1vtV7eDahrrXkSUiQcm1PEF0RZ7QBNaNQaUknv+C1NFTw1HMuD3OfCsdw9j+wD+XKYU/1B8bzrGHL/T+I1SZxyocu4cUvH6dTcRIjvxXmzIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TPDmKOFD; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TPDmKOFD"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1342423766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745981881; x=1746586681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=orERZRi+X77AnHhL2gqMTjYmeyPepMy3FKT+ifyIpL4=;
        b=TPDmKOFD4z3G5hXT9Hreo9sBEgUK3ihddmLiVySX4KRXy+HCGUdZJdi9gsO4OGbR0c
         f1c/oDxgfuNojW4qgdV4nZHLcgJwarXrLZCmonX8iuZxlhsm6SZydZz9S/8FTYensJLz
         b546ZTYW9zdYWMk97aOgAK3jdOmPh9Y45I70rrIon/mtzU8NPUkdziIQfGKKNmWTPFlM
         k5lE//7LPQeDSswoVw/zJ0EzCCcWn641jE+u++PUMSmUR6IC+D3h0NZnGRaXAbsvMQKY
         88g7BApMFl5ve4DzhHj66Azfb1wxAdsED7vzAfpArJXpWSNThKcxiCQAWney/vgmpGQh
         qa3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981881; x=1746586681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orERZRi+X77AnHhL2gqMTjYmeyPepMy3FKT+ifyIpL4=;
        b=mfcH7KYi/6+X9r8GyLiIUbU3HtHPEpJoRQVsqEGC1WXzYHjtEa6oS6T3d6cmxrjeUT
         NWnlVQiP+EosiE/m1gefhmb1fd3DnDb5gWpSo68Sl0dI4IDk23W4giPRlxtlZ5gu1ECl
         gFVKNVv6YJ3XiY5/wXZDyjAjcSTJp25lP4n65BnfGAw3NjgNO6Tg8kruqvlANmA5sjBq
         dyWwoEL4RPWs4s1EyZBDBDbTnLwz93qkpIX9vXg1LXlfXCXnqLB9CGC5EQVS58qejOOx
         Gw5pqjIQpV3VVfyPCERZkfsU2ug8SzDLEr9sOKrYCdfzF4TH/v5R2/gdaXWihemZ31n9
         Nlvw==
X-Forwarded-Encrypted: i=1; AJvYcCWNOU1HjUE0Porfisz/cJlEBNbWLCCwpDOhF5XffbJ8htBLzMbENzlfBUIkYeUbfxxqof25DT6SAb7QB64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqEt8lmifjc78/k3Pbe5W9mTyYGSvmhyjWuZ+zk+WUzucMUzKW
	ae3EfdZr1qrCYVpO8HAuWn/Fjj9B2CXUL9fsDWwRoCcTxOnqTn49A49wUSP64/k=
X-Gm-Gg: ASbGncu2EweITpgqVoR6wZ0k7JTIEltePKHE/HIFvB4PRSFWAKi08/xqupSDFNIWvC7
	49Ung7zJYP2BCxt2BM4086tScApF7mme69UNqAcbXKDviPFQFm6jhlockAM/xKGqr1s9lEleeoY
	Noqk2uphjukUzFXmPEEBbz6541pmzh5CCX1bj4ET/Ky82wff4rA6b+tKMvOlCrRv3I5uNLQ4kAk
	yKJkOSgxdcMCNSnZkT8R23hoeGTiX/JOzOhFaSC4cuN6m+aU9nuNFy4nTiOKNazEk8+uWLC7be+
	da/3jljVDF53XJqAtbDIcc3NaUOxjrA9HN74b+t8gNfHzPXHTiR+6WUVz3oQD4uCft/hQ1yi4jJ
	F
X-Google-Smtp-Source: AGHT+IEWjFrMLBqOV/1rb7M+m2k06D+kpRwrzKt1j1RkJYk/ipaKYAiZsHrqN38WPJ7aRNgfa7eHCg==
X-Received: by 2002:a17:907:6d15:b0:acb:4cd7:2963 with SMTP id a640c23a62f3a-acee241c417mr87778166b.33.1745981880926;
        Tue, 29 Apr 2025 19:58:00 -0700 (PDT)
Received: from u94a (27-240-163-208.adsl.fetnet.net. [27.240.163.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec2e5ad9fsm246073666b.23.2025.04.29.19.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:58:00 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:57:48 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, 
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, 
	hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 6.14 000/311] 6.14.5-rc1 review
Message-ID: <4vosggktdpxcddwlbopxxfzs5nscgllrqrhyxfibzd74wur65c@qo26jck7ok3q>
References: <20250429161121.011111832@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429161121.011111832@linuxfoundation.org>

On Tue, Apr 29, 2025 at 06:37:17PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.14.5 release.
> There are 311 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

test_progs, test_progs-no_alu32, test_progs-cpuv4, test_maps,
test_verifier in BPF selftests all passes (with 82303a059aab
cherry-picked from bpf tree to deal with sockmap_ktls failure, it will
be sent to stable once it made its way to Linus' tree).

Link: https://github.com/shunghsiyu/libbpf/actions/runs/14738691393/job/41371100920
Tested-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>

...
