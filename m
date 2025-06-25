Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEFA8634A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750875368; cv=none; b=DL9Om9zW80tjqzt2lRlySKeUx11btMPbATmLlZVLNpDx6Bv70IN8g90sv2ONo1rZ2fRDV4VLS7IqOiFmqiKSp8abVBLHMHzJa4nTh+mxzYV2Wtih/HzHf/OjePgP1nCMj5rWBGT+EktSYFu9xoLrORP1TSKaYNs8+6qYSAtdhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750875368; c=relaxed/simple;
	bh=ZSQflvI+dx87BWX5Pgy2pUuHWdmrEEUEEodE17ummQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfNiaFlTd3ep9o2jff2vB/X0ttmXjWrBNOyqvxlfT723dt599Y40bgvSnIJmR66OPiWLKU6lV2NpL/xmJZW3DLAEqnXKjvrzpsoKsv72tgSxyML45uK+si5KOf15ljBiVcR7xdswPtyWguZvL5kne6SjfTBrmcK19rMcbzkBOOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPPcSper; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPPcSper"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60f24b478e3so108385eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750875364; x=1751480164; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ds43cq5VKAjGEF+paeGIlgb/AFk3oLXyjpiFzhP73Y=;
        b=DPPcSpercp4r/aOl5y9k16f8NU5xJO+DSdNQ851mDfEMcEQ6Xqx0Bs9F3eA3iOAefa
         62Kjm054hOuQO3WGNEU3ycgIVylV494sv/Nm/vL5M42dqzEnqEyHpmFSir/krBI2GzyN
         0huQ1IPtIPvzcg68p1uYRZRGPkhuH7aeX29vm9xvwl4htyAGs8GWdnnUHJGyxo9NtQ6D
         uCJo9rDUq39KwZ7uUbmX3MQ+ARbBIgjrFXSUzaK5aOhKRmY1rLAwPSYucRqz9J7c8dcq
         dEMNDHV+Iwd9YKkfu7RVRDtfb6dKG3KxYsEmnpWrFUqqODfzh2EsE+OwBZLG/Q9i4LFw
         F1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750875364; x=1751480164;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ds43cq5VKAjGEF+paeGIlgb/AFk3oLXyjpiFzhP73Y=;
        b=mE1iK0cLxpf2WwKLlcSrPp64wbsbm3nsihZFeHncxWhT2KlOclpxkg9cnQyz+myxMe
         KckW/htaxDXCyiWqms08QfhNzGSa4IGxKcoZ/NNzRXGk+evX8DsUVviZHO46gDGresoZ
         Sp33PG1Dw0Y/Mw7horPRhjav2fiHptrEKX597/JZg5QfuynI3k+t0fxNq6qVpNAzeeqx
         0Ro2x/+how9reI9Wk3km1FlQKoaVkNFfV1y9iBnbe+SJgTSiSmOTuoAiUOYnFlKna9XO
         Gjkw7uBvFUw2CpwD0+gMe2r53lI76l4UlKkd57JiSspFI2xtj2aN5P+Cr9mqAajtL4uR
         LiHA==
X-Forwarded-Encrypted: i=1; AJvYcCV2D56omIUwbcuPr43x9xW26r5eG781NjFosRxkV0GPxjZJ+dlJOUTg1QMbtxDkwrK+uHBC4TZ0rnVJlKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRRTlH4bYTbVBwmly3XrN5MKN6OWOJyzW0vm3EZ/DcQZSidEvE
	4e6gt79HhJJDQuAWPWa2HBMFRmWx1Wiwbz+ZWxPg/4lJ+4C1Tdyc+FlgDL+z+1p/Sx8=
X-Gm-Gg: ASbGncs7tUXGv9m3i4E+RwcqdSKaEF/BjPRkIO0Ve4J8E8ewYwq2JpkBsmMpMIz1ZxQ
	ZWurmmGTvg+39LkRDAguJPlRH3gKvbBwppeESNO4PmjW0Ep0bVFMemv6C+kxmUq5PmgS/EllMUx
	mDWnyogMuToSCcDTRG1EjCcGkpnlxGn5HnCXIQc5OnXLGBKevqrLwbUfmZwu/OugE1ImDf7YZ+y
	ETJ7qrHPz0oj60ax58S0rIGA2TJ07FWab6IeUiM7kPjMC9A8H1UcSxY0AgJtHMjfG6dIXRaunzS
	rjO1of+9IPhqSeHEfgb2hi8dAvqflqgfPe1HJ8Dn7ufVg1Cmh2E/vl2P5cId9xsoK8U=
X-Google-Smtp-Source: AGHT+IGF3ONiUBg2GiFgTNyAb79DvhkSUQXKM5ohgb+SGOD3VQHjY/8ghJi/h7Q6a9PKmKmPwyOewg==
X-Received: by 2002:a05:6820:1527:b0:611:a527:226a with SMTP id 006d021491bc7-611a5272cf5mr1890255eaf.5.1750875364473;
        Wed, 25 Jun 2025 11:16:04 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b6c80adsm1637262eaf.12.2025.06.25.11.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:16:04 -0700 (PDT)
Date: Wed, 25 Jun 2025 21:16:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "yanjun.zhu" <yanjun.zhu@linux.dev>
Cc: Zhu Yanjun <zyjzyj2000@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Daisuke Matsuda <dskmtsd@gmail.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] RDMA/rxe: Fix a couple IS_ERR() vs NULL bugs
Message-ID: <d4adeb54-e218-430e-b156-e0220005404f@suswa.mountain>
References: <685c1430.050a0220.18b0ef.da83@mx.google.com>
 <d72af2c1-2faf-46db-b212-0b800040c311@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d72af2c1-2faf-46db-b212-0b800040c311@linux.dev>

On Wed, Jun 25, 2025 at 11:03:49AM -0700, yanjun.zhu wrote:
> On 6/25/25 8:22 AM, Dan Carpenter wrote:
> > The lookup_mr() function returns NULL on error.  It never returns error
> > pointers.
> 
> Yes, I agree with you. However, this commit is intended to fix an issue in
> the rdma-next tree. The corresponding repository is:
> https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git.
> 
> Therefore, the subject should be: [PATCH rdma-next]
> 

Yeah...  I moved to a different machine and copied an older version
of my patching scripts.  Normally, my scripts would put [PATCH next] in
the subject.

regards,
dan carpenter

