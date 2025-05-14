Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA919924E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212491; cv=none; b=kIXkoYbPenu4COij7FCJjA7AqipAAvnReEWeRwj7gPaYUodsg9+IHgTcRtspALZ1PBa0ORQK8VHRHxdGGkbZvTl6vQWN6gxxiy5KdlXmrzT08XgO4pDjjtCKAFHBBaUBxGOdY2LqT0orRCGrUEfeteRBZki0Hg4DST9Uf//RB2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212491; c=relaxed/simple;
	bh=Ccun/NTDw+CoIytlHzHrLFFVWreSfKk2Ou4w0xRSMe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JwKRvRXUZNnCvKSmHZiE4B+1uQSK9580NQBfyTa8zDgInPf7a7+Fs69zuG3tCNYyduStrgxSjyLjWxsRE8ea6jIOJSXnHMx/C94uw0mJ/42cqNl2Fn+RN24sLrVkJ3hwLMbzkkkN22x1YDDSr3ec7MJWXeGWvOC8AENGL4oZz6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=W9tfoLf2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="W9tfoLf2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a1d8c09683so3812803f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747212488; x=1747817288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J11Tm9IxpteDcvYogIFayM49cQbKfAspMtr3deGbdkA=;
        b=W9tfoLf2xYNRKWZP1aNpy6x1Ak0IIVXZNp8OdSkUPnUAQ9cu3tBIIyXt6ZRbHQ4wCP
         guEKGSImsK0Ije+ViSzRdSrmNsATpQQNqXoPxs3beWfTn81F0vtNu1fapVT7ONLmVeXv
         Ux3064Ec4kccPCjNS6q4/YEgNHY0eGb8pL/A4qVm9MA99dLHaXbZ3GNSPZoxRuizOc7H
         CyM6uFPfQ68y9glgOo7d2dtBjbfZwGV5xwYAFPyihO5rdqeE0C8SRGzfV67LtjpFD8C4
         ZLGF7ZPhmeR2pVej5briPiQwV9/H8ayyiw2QMNqzQycQfVvvBtwNfZnDO/FW8gytQzSW
         um7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747212488; x=1747817288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J11Tm9IxpteDcvYogIFayM49cQbKfAspMtr3deGbdkA=;
        b=EsfEhmBdT4KpIQF3DQ4WTD8gLOKIhwh07hNGqeiR/ZMLa5mr4pAXyx2rsWUstZPj4l
         NRrNsMUOCepb6FzDw7BUKXz0EPwFv+nEDzz/84hGfhurUYcsAgcnxOMvJcnYJcw04Uxp
         /GZlQn2GiYQsuMDXVBu/yf7ne6Nz1iGhDIav4g8Wmz1K6gCPniopNQtqObm8T+OvMvZ/
         xKySv9qW9jyU8U29Ert6sPeNS9Z6z9lrwDPWLEHqBAzWdNaEqRu6WMox/2e85fve8O4Z
         NU1it1ST12EF4c1RDiiRJjJP1DDASSpjt072benIO9d5V2v5QgQ8ux7VpiDI8nsBEEZD
         i5+w==
X-Forwarded-Encrypted: i=1; AJvYcCURKUn0ZaCM3q5WKpE7h/6ES6EUBO6fG85jjp7sguRNsA5Ip+Wg+JcA/PH7qxz1xkMB/tnpv2xt26kxQi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbiUjOdC80G7UfxPzAJqi/rgVI5c/vXb4z8/IsbcViSpMmJ1HX
	PLXJyNyN7PWj0HFgJ7mWAO27rtw9Mi7TBChZKVwuoG2CQhp9gutUrnlFpf0dJiw=
X-Gm-Gg: ASbGnctxU2CnaxnB3Vlq2UbyRugDxBtGHVV6mr7VU4ytclpNxYeeEBc+cVgjM5uSNVM
	ezjiFr5cw+6CdqCWc38QDx3Otr5Yg7gFVZtBZa5GXa15SH00+Kx4xG+8Dn/w0iF7hwkMU0ACgAD
	5c/e3Iri56U8Cm70VnDTSX41p60D40Jq8YiQuzjcqcdI5oe6wbdY9S0L3jC8V1U9lEyPQ4xX0fL
	DUjSVZbugjc0IqoGx5XjNuRC3i20D276xEQsOw5QfYCuSuJ6AyDFt2rxfk2hl18fQ28CoID40YC
	9DCWYc4uXGRHvGUxEWm2hn0U7+tX+FdOiMpPwnORlRjKVVXJwu3cHA==
X-Google-Smtp-Source: AGHT+IG6Ygt895dWK6xd2go5hH299uW3ziCrAKGblKyG0md7su1tSRFeV1oXO46fD6Q1GE1oUd21Ng==
X-Received: by 2002:a05:6000:2583:b0:3a0:b977:b6da with SMTP id ffacd0b85a97d-3a3496c36bfmr1777692f8f.24.1747212488190;
        Wed, 14 May 2025 01:48:08 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c63b717c5sm7334835e0c.9.2025.05.14.01.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:48:07 -0700 (PDT)
Message-ID: <49b63a7c-d323-4b13-8a1d-11ec8f0a3152@suse.com>
Date: Wed, 14 May 2025 10:47:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] module: Strict per-modname namespaces
To: masahiroy@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org,
 hpa@zytor.com, samitolvanen@google.com, da.gomez@samsung.com,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250502141204.500293812@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 16:12, Peter Zijlstra wrote:
> Hi!
> 
> Implement means for exports to be available to an explicit list of named
> modules. By explicitly limiting the usage of certain exports, the abuse
> potential/risk is greatly reduced.
> 
> Changes since v2:
> 
>  - switch to "module:" prefix (Masahiro)
>  - removed some patch noise (Masahiro)
>  - strstarts() and strlen() usage for prefixes (Masahiro)
>  - simpler ___EXPORT_SYMBOL() changes (Masahiro)
> 
> Not making using of glob_match() / fnmatch(); this would result in more
> complicated code for very little gain.

@Masahiro, please let me know if you're still reviewing the modpost or
other changes, or the series now looks good to you. I'd like to take it
for v6.16-rc1.

-- 
Thanks,
Petr
