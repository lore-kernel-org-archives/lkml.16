Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0CA156F20
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808942; cv=none; b=LFa2Ko8m9Lyplm/dsZg41DVrFLYDcn9qWk68T2kNw2AZmPbud4r5E0fwU4tSDEEei0nVYj6HWrfYVJAfrAdkrM9lEucraVqdFQVVZY7cy99TLhl1Guf/Nx0OTfma7NeQpCo33ioo8sTBqmMZ4Ss3SDVTyDdhY7HN7iFM7zdG2aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808942; c=relaxed/simple;
	bh=p/iyWC6HvCPY2TgwnlCPzsZ6CCy+XnmL1Lk+5LmCGhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5vBu1EadjvaWXQxU9qUvYN3PJbEcvuWFDk6+U3t/bBxeQhdS3XCodkb1sAFevbm92Tb84XIXpP0BjzHqZi8X2dtc64Tme/S7wKPtn8xxf06+HNUaxIafUh25e9uap65R2IuXxOkKRhDfZnK1qlYAp6YCAzcRCPRRllj2/IT28k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C1mJ+ovf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C1mJ+ovf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso6365944f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744808938; x=1745413738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Q94yOoOApKItt1hLRlRluZyloOVNtuhZPjQvabIyLY=;
        b=C1mJ+ovfwyUxOkxUy1ZTdUzVTdLc0RTLKxkJc8+vB2fqvW4KW1R/A6d70EaWq8dAms
         vGioGUTBt716F9p8sEqqoaGcb0DtqmksNlpiVqKZwPtjaytNly6ntmO2kBojQTn/6z4/
         xPgmTmUFp7r11MVZKuS2D5DS5PoIFQIzADzxHN1IfFT/sRqEr675OUX23QRIE4VBz1Ft
         foTbQGc1OgS3PZe3oJkEZwECeFzN719qLs2Q8UNg6/4pbQj4Z1g6osxMRBWMHxHe7MRL
         PWmDqP6/xmBGNwtvMKYDkaFp1XSvhFx3/9m6FZXYkkVRgeScd8GLSPYcuPZB7CFu6u9L
         wM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808938; x=1745413738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Q94yOoOApKItt1hLRlRluZyloOVNtuhZPjQvabIyLY=;
        b=sCTIDdo4NUyH27rJPwyW88fUgAWSH96pE7oAvChOfZRZud3lV2QRCBcczWtiPPKBLF
         mRlMU0+Aogf6zaR9ngwiRWQOs6jeiXDvx9VvSmeblWvi2TqbyJROT4N7QEcv2e0oF/uh
         NNMs3DyM2fHc19ArCvXIjfzvCOVHuXEAa/jtOEN/uuNYZAy9NtTXzYND6ePQ8vZXcfOB
         WHRwtb8hTgxLBdgbfbNZRFqFbaZ/XD4nBScta4WJxlG/0hdl8ZiH0McCC4zUoKp3u98R
         zFdbfBlyjkcz3kw1Rw9fNe2gnogjl6yU1v+51zsd6ew59t8ZUbprjgs3mZKzLvO1vfqR
         KsLg==
X-Forwarded-Encrypted: i=1; AJvYcCVVDhetXJ+/bhyxOd6UkQms+M08YMBQlhSfE4MD4cwQcsfVimnWYFbANtjNhPTgxJKJNA/kyyhhPStCygc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwkxVnoTaAu+yEJEXCFwEX1JGsBZmCKrbJ/O+tmxybTV96tIAY
	kb20Yxe8IoZiq4YHm6m0xVfViRNj+E1O5R1ek1GHtx2PagMH2adcOBTSs2v/Ze0=
X-Gm-Gg: ASbGncsZVwin7yT9M4GhNl0z9S04ijeOTmBYk9ETTfQf5v4secdzDl85o3/Ljleaet1
	VadR187dnXkkZY3NPcmNHPMnTOvDCpQu8Z/4F6TtzTxvKsgqaMEyMjpJw46JVdl4rbSukf8xLLk
	MI5dhD2w3akeCLJ2t16UFgxPWf6zsFu0RP0lsEAgvHPBHAx4bym5WDOXxbbtJlBiXBnvjlYoA83
	wnbEg/YnN3TBqQU0bX0bd9mNOR/kg0C2POuwWVy/WUHWsKyYdLXBRXmo8mTyZpYg6DG5N2PZBQz
	E3MVdyUH/wxlYoY7SgpU9CsBAJM2PPGRcvLohhFrPA2AxA3npXftob40X3/nmpgDwfERQUBSko3
	FC8dDwoE=
X-Google-Smtp-Source: AGHT+IHOsJk1QtB5kEoSZrYAYpRPaEigS+0jlbTDIIkpc2LnRk68oJlodSN8FXDP3R34O6sthrpyNg==
X-Received: by 2002:a05:6000:4021:b0:39c:223f:2770 with SMTP id ffacd0b85a97d-39ee5b18646mr1809040f8f.15.1744808937399;
        Wed, 16 Apr 2025 06:08:57 -0700 (PDT)
Received: from ?IPV6:2001:a61:1350:fd01:ac0d:cf4f:2906:b446? ([2001:a61:1350:fd01:ac0d:cf4f:2906:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cd17sm17165723f8f.78.2025.04.16.06.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:08:56 -0700 (PDT)
Message-ID: <65bd42ee-ecbc-4a23-9036-42358aa086df@suse.com>
Date: Wed, 16 Apr 2025 15:08:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
To: Petr Tesarik <ptesarik@suse.com>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320154733.392410-1-ptesarik@suse.com>
 <20250325134000.575794-1-ptesarik@suse.com>
 <2025041110-starch-abroad-5311@gregkh> <20250414090216.596ebd11@mordecai>
 <522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
 <20250416094807.2545efd8@mordecai>
 <e23e72d7-e50b-4a16-b47d-5dcd7cf49641@suse.com>
 <20250416124736.3ac2bd55@mordecai>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250416124736.3ac2bd55@mordecai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 12:47, Petr Tesarik wrote:
  
> If I stay with the USB buffer allocations, AFAICS the mem_flags
> parameter should be used only for non-zone flags. If you specify,
> GFP_DMA here, it will have no impact whatsoever on allocating DMA
> buffers. It may unnecessarily allocate from the DMA zone for doing PIO.

Yes. But we should not limit enforcement of such a _new_ policy
to one method in order to fix a hypothetical issue.
There is just no need for action.

> Now I think I should really write an article for LWN to debunk some
> myths about GFP_DMA.

Well, if you go to that trouble an explanation of why memflags
are passed in USB at all and how DMA works in general would be
productive.

	Regards
		Oliver

