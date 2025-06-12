Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619817AE1D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749747554; cv=none; b=l+jUfc1uuuesEzco+o+GSrTdKy7nOiy2CCTps62UFQMBIgoTxf4Rso1ep0At0xbSnIy86bIBAZhcqx20ddhJUV6LEjRCF8ufwtd5oUI8R4HErA7JpXm/TBRpwPPc5AUEzo+OeknnHyMGXwXTGsqBdgddGMKxsgNX3DGM9dSl+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749747554; c=relaxed/simple;
	bh=dbVKdEV5WlLUUCPiexOQtym0rY2vJhQPkYeTFPj1OfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYWFZG9jqNjH0rOIGNLovCyvw6OFAZ7jDlebzIYJX44LN537whUD5T1u1Z/gEQtWcw2Ad03WO6UPSsxLFp7geYuH8birVz6cgmzb3mgqcJBfRF1a7B4bzGB3/SBLqBtddRCW3siquTHJsuEMvgS8r96SbOeiuhYBVPHAGPYuwIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZC6X173E; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZC6X173E"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad8a8da2376so211187066b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749747549; x=1750352349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ex80jzwlOgVUFTxMNEXOHAt7n4bVeajkNSeWUvn3+ms=;
        b=ZC6X173EcRnErKMjyRZDrd8AwDqTcsAYW4Ofy6giEWblVfVYJus+W3dHIzDqNNZ8xz
         rlPiGw5tlWPY5IBOY3mWn0lttbal4RbaOEigxS0UXlxxRXhf8k/6vkYMogsU94gv50BE
         /u6Uq1xqLDq0wTg+VGaUDiBpMpuzkY6qlItKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749747549; x=1750352349;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ex80jzwlOgVUFTxMNEXOHAt7n4bVeajkNSeWUvn3+ms=;
        b=KUFxHpvqJBqGDjXQ76K+q6kreTqYuvrcu9da5dH9VzJ9Xu3Uq64SZzHomif33NFNUN
         GjTEsdXsdmSLRvl7IkUk7S8v2rJD1/TcMKzzT52Clc6UPfzGy5fxWkQTCPaZ/o9JaMct
         GuMrgJnGnBzTWJS8ViYnoYCUW41K8F/NRqNh+rQsTb5DishJSDyWyZK7RG+uy49Y4SuK
         X+e4vooPtcTsZXZF0Cou7LCVacm+7eGcEP4JV6TRjTCka/XNN6vt+JP3Pge/bZknzZp9
         qFq5rtPYTeOm/wn5RnWEs4/y0WvWDa6bRsMH5wGdh2JpYGI/t+Krtgh93UK8Z6Sdppwv
         mVgg==
X-Forwarded-Encrypted: i=1; AJvYcCWcXbHR/nWw0WIrTxQ7gARKgMmaOKOitUKc+NuL99vJi4HzeSnY0w/OmaQDRvbzGzK567LwVvZptg0z48s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+My660cmCI81a1uqpUHPR6SYD5uqiilfm7EEZxF9bV9pjyB8
	OtwYhODWb0FSRj5eCHyqQ0OdUaVXVFaYEa1Q+L2sLiDo99DKKxYxUgugO8fBJwrpTkJiBw2e1AP
	5SKIuLbo=
X-Gm-Gg: ASbGncvHEahCRwWvZcQtxX/b/5XIscJ8jCaBUDXP3QcEE+IatRfrRPcleHWnyGaQuKO
	fpYj3Y1mpRaqKcX8blHs7rRWbsndRTcVPY//xt8Kqwaw+yS+MUfigEueChcxMQn68EqIfJgtBPc
	R9xXP0YG13VgsERyBgCFDpPUFpus0YBuD9KrMtJkPGHeToQuBp6TmDDITXRw5HzRIHgnarsmxvn
	Ph/6aEWthtRYnFQ1V8L9uST0tNbGyT1Q811EiH+f7uQWykeD7pb1C9llkabLvNmUDNDMKALLDbj
	tjc+XHnrhni20kc/HipwccG5U/WH/qY1zWhBpdwwXwLaNHmvo8mMXqQaiQIvCz+l810HKLmcwKC
	/usd5Uhffm6prevIOcfCg/fNFqCPMkR7+9X8r
X-Google-Smtp-Source: AGHT+IE7l+mmf85rESR6l0sDMbXRD7Gi6jf0x81gBm8UZrU+OrVi09Y0btlNtAGHSMl4tmpry7sm8g==
X-Received: by 2002:a17:907:a909:b0:add:fe17:e970 with SMTP id a640c23a62f3a-adec5597659mr3210466b.14.1749747549513;
        Thu, 12 Jun 2025 09:59:09 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adeadb236e9sm159342466b.74.2025.06.12.09.59.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:59:08 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso2321338a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:59:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3PnB3uDNSRrAChzIQAaGhlCW1M5VLMiN+WR5KAiuWMtetG3gLOv5/HPnhhS+OeHBYT4zBvTDf0EFbBbo=@vger.kernel.org
X-Received: by 2002:a05:6402:13c7:b0:607:1c09:b0d6 with SMTP id
 4fb4d7f45d1cf-608af5421bemr484999a12.8.1749747547800; Thu, 12 Jun 2025
 09:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
 <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com> <755cf90e-acf5-46d1-9ac4-2ea06c93e873@linux.dev>
In-Reply-To: <755cf90e-acf5-46d1-9ac4-2ea06c93e873@linux.dev>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 12 Jun 2025 09:58:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8J_33JR6oT+7to=k=vryrseuojs0rz5iEW4nVCi=KYA@mail.gmail.com>
X-Gm-Features: AX0GCFuvQ-iioC4hLv32QSaXlIXEQYIhlNNev6EWMYdlFyV35ap_BHw2PN-I5XY
Message-ID: <CAHk-=wg8J_33JR6oT+7to=k=vryrseuojs0rz5iEW4nVCi=KYA@mail.gmail.com>
Subject: Re: [GIT PULL] ARC updates for 6.16
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Vineet Gupta <vgupta@kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, 
	lkml <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 09:12, Vineet Gupta <vineet.gupta@linux.dev> wrote:
>
> Back when ii had happened I did extend the date on the key and AFAIKR did
> --send-keys to pgp.mit.edu

I don't think pgp.mit.edu even works any more ...

The pgp keyserver situation seems to be better than it was a couple of
years ago, but it's still bad.

             Linus
