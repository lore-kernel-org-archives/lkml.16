Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F903C6BA;
	Wed, 30 Apr 2025 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996083; cv=none; b=cVCw4QN0Iuxv6YPlGddr8vermm6wAVchDL8EE4Kfh8eB4lzLof7O5QnL1Rlyuaq+MasPVnKtvSIfK7RDBmKM2gQjsxLyi8jAxB9XkMt6jdd89mr+o7hH8HXgtKHzBdgy0R9cVfH3fO8g35ckoamZ8VoRakX6owlzQSu8pa0Egfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996083; c=relaxed/simple;
	bh=FWsVKMBpJoSvjzMtNQ11+FVVEGiAvbP5ltH1178r0LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXSdfjfk1cOBYrnSbIkQq+OVz8c4A/83NJpX8yZDn3td1OYC4QfOmTsEE0uVGloBVyz4ITjuOql3McP6hQ5MvoOhMCV5ATOiRJLNpBzi4mCRze2yBwz+BbOSujCzCATq6hYPeCCoALQkhmv6yGFod4QyifKAW02ch/XBrq85z0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpZdiy00; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpZdiy00"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8f254b875so77530486d6.1;
        Tue, 29 Apr 2025 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996080; x=1746600880; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IHPC6ouTLZh9rZq6+aZMT/nynJpeCvxeKEaQao7uCfI=;
        b=LpZdiy009ijRMVcAA1Wob3bGfgLWoZtQo6v5WCI1wKuEMNgHJQkZzcClug8cbVjEvw
         xKdCs0bmTmTsDVsk73vUmc0Whr0v8PDtuyrrUS+RHa9cxI1PY/T0RujiocGmDiYL+z3I
         XbrCMh68IxsQG3Gh/iqlbJU649OlDWUhzc3FyzldlUyrPa5wgKjsSQREJ7lUHHZMEFBO
         4XERpXt+Gj2t6Y6m4r5zF4m/GadFpMiOeGI0xilw7YD+KtJOaciiaapyr8V48hnY9agD
         c6z0ytY3PEICvfhyQZMCvpNtq/zHDTr+rd7FmcT8gBg/aCcU1QsDcmQ4U0vAPMQLLXoX
         F7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996080; x=1746600880;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHPC6ouTLZh9rZq6+aZMT/nynJpeCvxeKEaQao7uCfI=;
        b=nOnrl3lXYGDbRn01OClymSRQXVN/GpRQGkOqqn3NsK9YUhrd/G2nq393/mT/JyoX/w
         MwXacBJlER/spauaFKNMv6sqSTK1D+doYPiD8bWttvHWgw+cOBrxtlc62L0sfJRG2Ohi
         kMU7EuOIzdvstgorC1S4mFmbNz+3OW/y+wMN3dSmclmHXvTlWifJU+iBiFhNopOcuBLY
         U8XSmqJYQQbro9c2g9tkdzdylOAz+Gh+gbOzvrW8ZmmLd9w9hJo4b0KxOxxW0dHc+4ls
         p3tkrx3JNcIufUw/Mi/jhTDM3JnwJBdgXoEApN0TshXRt7EJAPXqF/ytTefzPFGuIn53
         vWHg==
X-Forwarded-Encrypted: i=1; AJvYcCWnByNuayRW8k3X3xghA22MlGWDW6tZUPG3qMcE7Nhnjvx8wPjU2wBxQ/l15oK8IofwngPsqiAS4i7nnyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuOIQjUbmjIveBer+7vTmWRDqJoexUZBsMDOZx54Fhujgkpubg
	P/Rx+rOkmnK+lhJHPx2tGYnHt4xgF+jrME7pXW3BCBN1lcsk4and
X-Gm-Gg: ASbGncsK6/jbYTVikULVK247BRLney5Zl9AbeOfKz/FF5FDbV9+Hmk7VPu6sz9r4GdD
	oko5CPrgg6IzgizTGqUcqF61LmNhXTwjwnIXKtG4/LQvXrj6U9P+XTyiFgD704ISjgRsUGE3LuA
	bSZvAa2MA63BYUlmlzxQ6HzID5rkyxa+/108kiwef/MBJirKpJqTyi4V9ZTcp1Aqe/YW7oIyg6+
	CwXu9R8eFbojEhkP9gioyZ6DsdmcErJSSdUI7w0zzCfB83ifY53X9doNTNK7IlqHPanWzdT28qW
	g56qDibFjwK3mJw1
X-Google-Smtp-Source: AGHT+IFizVCYxmFryP83K8Efv63dHaODZi9WbULtELwp3gzA1WDs1vRsKFV4wOSDStjITe1CP6hCgw==
X-Received: by 2002:a05:6214:1d0b:b0:6e8:fe16:4d45 with SMTP id 6a1803df08f44-6f4fcfcb78fmr31461436d6.41.1745996080261;
        Tue, 29 Apr 2025 23:54:40 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe8358dcsm5091866d6.86.2025.04.29.23.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:54:39 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:54:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Ze Huang <huangze@whut.edu.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yu Yuan <yu.yuan@sjtu.edu.cn>, 
	Ze Huang <huange@whut.edu.cn>
Subject: Re: [PATCH] riscv: dts: sophgo: fix DMA data-width configuration for
 CV18xx
Message-ID: <uo7nea7hxw7qrzw7yhtoulusejbynw6qlotwozpboxtm6vyotv@rdkuc4d776so>
References: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428-duo-dma-config-v1-1-eb6ad836ca42@whut.edu.cn>

On Mon, Apr 28, 2025 at 05:24:36PM +0800, Ze Huang wrote:
> The "snps,data-width" property[1] defines the AXI data width of the DMA
> controller as:
> 
>     width = 8 × (2^n) bits
> 
> (0 = 8 bits, 1 = 16 bits, 2 = 32 bits, ..., 6 = 512 bits)
> where "n" is the value of "snps,data-width".
> 
> For the CV18xx DMA controller, the correct AXI data width is 32 bits,
> corresponding to "snps,data-width = 2".
> 
> Test results on Milkv Duo S can be found here [2].
> 
> Link: https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/dma/snps%2Cdw-axi-dmac.yaml#L74 [1]
> Link: https://gist.github.com/Sutter099/4fa99bb2d89e5af975983124704b3861 [2]
> 
> Co-developed-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
> Signed-off-by: Yu Yuan <yu.yuan@sjtu.edu.cn>
> Signed-off-by: Ze Huang <huange@whut.edu.cn>
> ---
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>

I think there is a wrong sob here, also, please add a fixes tag if
you fix something. I will take care of this when merging.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
