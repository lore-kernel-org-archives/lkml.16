Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E803285C8C;
	Mon, 16 Jun 2025 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750076093; cv=none; b=uFIjWlQ5O0DoMigrTCqOtBHldMbWoNrR4relEpHWx4au3j3l7Dkvv1LoLeBexw40gON1LbdBsCFIMvz1fVY0Cg73eq3PrmepEHP/GVyzokEtiA6UiaqOU6ydqE0Zpqd/RG6FwIKzySt1U52hhZ2QUC2m64mxdXUqcs0oXKTW5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750076093; c=relaxed/simple;
	bh=h/e1knSiHKFIk1h84Fz+rVdu5Nqwv0O17h1RPlaDe1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRxS0DNyzrjOREKXlyx+2ggA4m65LfiSR5C0XTX2XfBaW8SLaGpeCatqNCajqY/bIeHJavWfPpsrHQrgPdGiy81hXFVYYP/FqNKa2LWKHWeRmG+mIEUHJtGqOrHuNs2oyP7sZtg3qeTT8dsFN1Ge4Q6jokV8+A80eE6owcS3Js0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3J7rHa+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3J7rHa+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso3496774a91.1;
        Mon, 16 Jun 2025 05:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750076091; x=1750680891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UfCAylnXFQe3xzqsK+4ySN+RPsMR4Uj88ouvwmaRLd0=;
        b=W3J7rHa+UshiVU43qUikLdMzqHWC0cPZkvdYymZXtZpo2ywCv5Vb38rzJrL/7p27iQ
         UhXQnhfTrKc7dERt9mcM9DgSmrnlRHPRGY4JHj9RK4TfZWNIScKKx5pg+ldT5ebGWnJE
         AB6YuNFt+mpEqtHQk3uczuUG/RNo9w/p0kgoay5HTzAtSIb1yqhZKTBY6iOaOgXwLdt0
         0xVhUm5WUCHNL5MoXPG3IM4vruHarjRLyXtfYX8PUUwxK96UMw41H1eBQinVyBfnfKxV
         SJpmL5AXoX2zs2oY8TSuaAJaiK/OnG+uMVXHhXDTvu/kSoPrbzyBeUa39k9lx2ntQijN
         JVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750076091; x=1750680891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfCAylnXFQe3xzqsK+4ySN+RPsMR4Uj88ouvwmaRLd0=;
        b=un1wrUAIhaAeulhBF+UIQW0fFJVCy3/Crixd9vqEDeSv5oMz1Lw/DlO9ZwgSEJeKZz
         yXGnd7CqBPFx2+T0wklr8CIj74VtMuDwD69fyiX2z/4y9DAMoGLbb83EU82qG8JwCGIV
         95AF8/k9TVTdbG37ep1Cqp8ou9DHNZDPKypjbEaoid4Fz3YBKyJJs+KckO7FBoIuHL3h
         rheqJ8Pu5uYO3Cb09KpBmehTOLcYMpaeiotRMLeG+l98iTz+Pau6y24UwGRcNdS+LVTf
         jMcrTBROi/ACui2Nm4hD7vgGhXv7f3K5k6nS3ixSqVUhOvH05QRMaQ2cxuh/PD5rzUwd
         jzgw==
X-Forwarded-Encrypted: i=1; AJvYcCWbB1qeSl0JAVTMtTqO3f/WfsEmpA6xn00Dw8bEICHGH7eJ1ZEMB3riS94lInH2lSv3ulDJEtamVkY7gw==@vger.kernel.org, AJvYcCXxm0SGpaYEHDdxzRxk9m+PfkpjvilWNmemrDlqM6aDcmfCHNttdrHFUy05WmWU8vWsu9aziU/MnmPdw7hM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy6n7+/m99SGWyPtH0NvQTK8irIBidPFarurJPEAK3no/laNkx
	DNZn8w/XSA9Cd1R5NuhUcTrrr3Egaq8/L/YAfpYvUiWX7bm87I3Bh7bJ
X-Gm-Gg: ASbGncv0QJWSxh0T17V1VTaIcNaJI/N4sDMMns5LzOif/1e/i04+rn0xaAjan0qAA9z
	KC1GuevCNGWNwZWyJ+ZQFqvCCW8rXC4vpfTcI0uKJM2Pz37Qihi7oHe+NgaPsvtaZv2GHlYocGi
	fa0UskkA7ucotUY1tgNt5+TiQdGSV0VLCs/m6xGdjLCkGcy3//B3XbhXQ5OtoThQAPoFmkLokUJ
	5GMpOu8V9l1dSspmqDqVaz1VGAVGI60EBlRCU2GqffnRv5sCrM7aAAw34vg55cpLwDZOvHBn2fu
	OxMxp+XSdhKK3G1RU0KlJ+DVdjZKZlyw8F6Y0IisjknxzoLxfBCaQJPvc49fCBM/qJ5o5VOi1uM
	i2apKY2ST2NzLrcgAUxKOb88MAc93maiQUGM=
X-Google-Smtp-Source: AGHT+IFFhPU2sKtcR1Our1wz5vNN0+qX2LR7c4Kmk5G1V6+9kR7ISkslRtVHqUAwggahZknkFOr5Fg==
X-Received: by 2002:a17:90a:c107:b0:311:ad7f:3281 with SMTP id 98e67ed59e1d1-313f1ca70acmr17813102a91.12.1750076090840;
        Mon, 16 Jun 2025 05:14:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de7826fsm59433215ad.120.2025.06.16.05.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:14:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <074a2561-1c9b-4138-9ade-bdd1b34825f2@roeck-us.net>
Date: Mon, 16 Jun 2025 05:14:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about nct6775 regarding MFD
To: "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>,
 "jdelvare@suse.com" <jdelvare@suse.com>
Cc: "Lopes Ivo, Diogo Miguel" <diogo.ivo@siemens.com>,
 "Kiszka, Jan" <jan.kiszka@siemens.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <a0164db0-e234-44ac-8584-a14f0b625181@siemens.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <a0164db0-e234-44ac-8584-a14f0b625181@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/16/25 03:34, Niedermayr, BENEDIKT wrote:
> Hi folks,
> 
> we are currently refactoring some parts of the
> "drivers/platform/x86/siemens/*" which has references to some
> 
> Nuvoton Super-I/O chips. One of them is the nct6775.
> 
> The driver in question is not implemented as MFD, even though MFD would
> have fit perfectly for it (or am I wrong?).
> 
> 
> My question now:
> 
> Why wasn't the driver implemented as an MFD? Was MFD discussed during
> your upstreaming-related conversations?
> 

Super-IO chips have historically not been implemented as MFD since the functionality
is well separated except for configuration register access, and that is well handled
with the various superio_enter() functions which use a multiplexed memory region
to (temporarily) request chip access. Implementing those drivers as MFD would only
add complexity with no gain or benefit.

Guenter

