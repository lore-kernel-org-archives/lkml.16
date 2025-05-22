Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2412882DF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907577; cv=none; b=tvwUc18gkDCNbBVIrIceIJdf/5qOV+NYzbG1mlikP00GyJ2aMTtRSNg0R5t/xTr4O9mzVYfhNBqgYL1zj3athqDFz/Xm3y3D4R5E2MNnfSxzDYUAR+sRVsQvQWAnUbq3z8TJ9WFSM69PS2ujSIcGDZd+uedes90emFHBTZcSbDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907577; c=relaxed/simple;
	bh=z5KtpzIv6jOM7qUOUrWsiDPaeO1Lwkl62DDxALggKj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4D4lDQyqEVvK+JAaN4i0wPxjC0FHa0TLAeW0fgl3Jpa9ftiw9v2Qh7c/dMe61nLMNCPw6poea+5929bpCTbG2Qnftq99Yd9tqnTbJev75Ax6NmQfL+G5QCeP4lCjvxu37YWMdax8lik2VAZd73D87hM/VBX+v2l0N2lsbC4TDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=er4PasDV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="er4PasDV"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so515182866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747907573; x=1748512373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SjCMolMiZ/hmSofNqgfdpx6PO1MX37NoHhHmqkjLk/M=;
        b=er4PasDV11oHCzOpk/16/8T3ZT0xYHlQmJkpjtHjTs8yr7dmKUXdKO6yTPAzmCGTDo
         F06Ih7P83qrVzGaL6553IsEDUAoOh+3/541fn5zNk31XzjHijqiA/Pll5eY+p520IsLQ
         zbx1/z1PCgZHGXNdV8C3CgxDxXpVpPH5hjGfX+Psd3NosAxf6iUkJ0B3SURBqmoWomPT
         nqwgYjCOxys4gBuNeLShS9V6JlFV9v6RCjVG9tNamW5QTVQwG3mfIFCPPKDJdMeaHusk
         iibQKmikXG2Gzm6R/TGU3eV0ghxaLV2ACFVNgvaM4M59Yh49zqrJVD6r7so4joAHeSbg
         fdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747907573; x=1748512373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjCMolMiZ/hmSofNqgfdpx6PO1MX37NoHhHmqkjLk/M=;
        b=FtRSyfhPySn3iiZ/RVbKcGcuHHk2HomcTR4gRHLDa02Iun9oAZZpUp+4q6z8osfaY/
         HIAmvXloenaRwa116IJs0eb2TrD/TnwAXQwswRVEdYI003WROM/01Bh63j5RAUveONyT
         ruV6Q3OsJYqGeyke9Y/cC/hh+2HT4X+p7bXuQDw2pLrUsZgs/1HB9dnwNT7/aCg1l2P8
         /hUHQQWxTMtn+N9wUF9qmHuNa6GbAxh2lNvsVaH0+rVzJY63Bxpxp2g9kRMtCIDO0JTx
         NaboCBQ5gXpEyt8tkeo7R7qAYO5ifdorMxGndwCC8OrvDQHQs/ZfK52p2UjAym8xbveE
         Qwgg==
X-Forwarded-Encrypted: i=1; AJvYcCWipucoNxH8KuYetLm/RM2c3Q4WEYV3JvP8KKdG0DUu0SdeJiu6BgGfGBTBmEc5BImRAn0yum5FpdOWB/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YznTTIIcG90A7C3LVobTXpglkkOdH8FGlpbcvShZgNKD8Sqn0EU
	3PPVJws1kwFaX8B49d2GHrc7Gb6yDKx1tAB+YK+gI2VdpBY5cGW2YK2I28pDX8TOz8A=
X-Gm-Gg: ASbGnctdj+tPI57mWchO4CH3j1V5o4cZESHIuDHgVcy+7SemSyl3q4pXoJojDwW0s1e
	16MMa22JLgYlHqCysyqXrwaI4AegrpHlh0SA/JQyO79MI5rMWZ+S+dAAhbv8D80lq+VtTcX2KZ6
	XjgV3r/bBIa03Mf1n3wGqfObhiOMRqzhvzggf0AzMGGdhDpgnONIJ+Re3U3Fj7vtI/ciNwMVR9D
	bkH40aFZIdJYjrlgTLlnynA0n95vvNZb+ztIpdMFxUYlE53B6HCYFxsD3UslQ2qmUZnP8nrLqUb
	jsZnZ31loFTSb2g1dwgTdQMXkWWl0A4pF1392W6MweEf6VxzdCT1plEy
X-Google-Smtp-Source: AGHT+IF28mZzbkVVqnJxxGpyArU976cjAW614jZZv/AIIqyJpJ83phh2SkHY8bTgDmI/yvM/KZA3lg==
X-Received: by 2002:a17:907:72c9:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad536f27ba5mr2250569166b.48.1747907573452;
        Thu, 22 May 2025 02:52:53 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4395d0sm1046432866b.114.2025.05.22.02.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:52:53 -0700 (PDT)
Message-ID: <47009413-dc52-4e47-8034-e6a2531c49ad@suse.com>
Date: Thu, 22 May 2025 12:52:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86/retbleed: Check for AUTO in all cases
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>
References: <20250521-eibrs-fix-v2-0-70e2598e932c@linux.intel.com>
 <20250521-eibrs-fix-v2-1-70e2598e932c@linux.intel.com>
Content-Language: en-US
From: Nikolay Borisov <nik.borisov@suse.com>
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250521-eibrs-fix-v2-1-70e2598e932c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/22/25 05:44, Pawan Gupta wrote:
> When none of mitigation option is selected, AUTO gets converted to NONE.
> This is currently only being done for Intel. The check is useful in
> general, make it common.
> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
