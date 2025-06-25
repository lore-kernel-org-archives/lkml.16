Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A827727D779;
	Wed, 25 Jun 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845495; cv=none; b=KfYOT6qxn+H65F3dUUFVqHI+arzqgpkbVmMuoxnyyXXmvbiDqmozHB29XZunwVxpvB4zBqwnEQl6F3Ej3SaxJRkpaGZzy4Ke2XZTRaMPMW6nggsITIG1GZqz3mTL2/2CJMxpT4kfk66wLpxVoDATEA2GcJZrJdrq+Mc5cTKby2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845495; c=relaxed/simple;
	bh=LqQaz1aLQc4wMRAonUNs5eh+8yt7zMsEonHNPi/MygA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDMS94XHWQJHxF6QRiJUnqsE31gWdA4igiM0pQB2lpLX2iE6PXCRiR1pawGCB71juusEmvZvyCxBwSjqGObKxDlGBpiUWGBk8ZM5PYdh2tZyRV4U83XxdHTYiPqjyROOQT9PDWnbx8O7Dg4z2Bt5EH7zTa+mXjYN3Ky+p7UCngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqI1xX4P; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqI1xX4P"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-237311f5a54so63150635ad.2;
        Wed, 25 Jun 2025 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845493; x=1751450293; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqqMHeIZqkGTFka26jeN4Fe3wSBdOokYJPax+qyQ4/o=;
        b=bqI1xX4P4AOKKjdLktvMrXWb+rFegDv9h/dG5nrP33iD4c1dwglRhWn2LTKYvVSLib
         7GcrvgFWr5/Ej33rmOqpkXjPsNMrroyU28NbIOP6Mz/VBkkaTUzivW5rS7S1hXCg6ktj
         MDRvQXZu6sNVulusJB00uto8HUYk63n+WLYNE1Y4dc7fpKkvg9Y46UcYiGJWE8UTHLas
         ayG2hpFzaHnD8+jKYx8+iR7RWXRVsp5zELe2isaBdRA3QN0iyo5o1Q2QbhnkF9VskQGl
         tBwc7FH89zHFaD8oMbPQWnZ/K8Erhjvf2nG0IhwgbVyQP7CqEIbPgMn5LGOHRATYJhjv
         akxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845493; x=1751450293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqqMHeIZqkGTFka26jeN4Fe3wSBdOokYJPax+qyQ4/o=;
        b=ns1GFcGJN+90p8k4yv53t5D7OaBmoyxkk6FjNFf7ey1HZ47woQubmTfuQgSNnHxKlo
         5VSCTV0JAvRIkbEAN8Ko0UAzXRrwz170bvAQr+MvgEzqHXsrBBH7VOCXLH+a3JufBNhD
         4SWIrey7/GA9fBO+BpqK5kQkdIdYnFDK7jSN+sfmMUb5osxKiv+N+he6/vxKInCkxGLU
         5s6s2Acs1T7LHp09zZ20Aj3WqRYtOtjG1y/qgzK1LFGa79bpnx3P9mIHZ+6HnfZEJhu2
         t2eHZKb+VBwJwWuG0fWBiDyGTPgAFuiFS6n+gRVp6nVtxPI5VS/1N92ZrQ1Ha8Zsd2rx
         Iq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPVbYeybyW2jPeJxG0vWMmgl0QTSsv8YQuHn3sSmUVgw78t6CAAJ2FboO9TranXZSObJX36huoRBC8mA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYPEaClPQc3UKlypsAHWg/L7xJp3S7kMfSHXVmWu+REocizBPI
	WrxxBsKPMMiiD5lB7MLVp8xR8wZBM6JvHGgG2fNSWpFFqcLq3FTRmhBH
X-Gm-Gg: ASbGncsI2MJyR0uCzVLoByfIB1FaLxhpvxHu9fPwKACDYhCES3WVyFhs4N75fYi6ZpV
	xiLtRbEfo6pcY4qbOPvCl/mFMAQm7M5IM+VQrxiFR6n3N/rcdQD0qiaaRZyGv40yTMa8XVufwql
	OnUYfIF4J43cL5QxIaAfH+lbjpACIq6L/rZT8vGffj8oC++tdX/qgZOV0imfw2uO8+ocQli4p0V
	1iAqnT1BpEXDzUKqZt2oUCXDIMVRv6/NY1UzcEP9WyY0ACFi/BqUWvRtlUnm4WynOa2FZ6muO3i
	Zf6udeTnCYek2+k2gUbX3T7V0VIzfM1samSPIVQPp5opXxzufvpUUDYi9ECk/Hm7aQRTVFKIKg=
	=
X-Google-Smtp-Source: AGHT+IHv+z9MFdIr1ZGRYEzPcm9jXMuyQx2bg4HPY+rhyIzGqqUNcddj1xUbBQ48kT6wejEapeDxAA==
X-Received: by 2002:a17:903:4b27:b0:234:bca7:2920 with SMTP id d9443c01a7336-2382403d734mr56735185ad.24.1750845492879;
        Wed, 25 Jun 2025 02:58:12 -0700 (PDT)
Received: from localhost ([203.123.65.120])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8393741sm126922485ad.15.2025.06.25.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:58:12 -0700 (PDT)
Date: Wed, 25 Jun 2025 19:58:08 +1000
From: Xiang Shen <turyshen@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, acelan.kao@canonical.com
Cc: platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Fix code style issues
Message-ID: <rzzqmdogpedswwzdjutskz2ik5duik7c2u433csogl5g4rptdr@nrzck7xdvdcg>
References: <20250620003849.54442-1-turyshen@gmail.com>
 <fdb9c21f-aada-498a-92ec-bc48aceeb76e@kernel.org>
 <hlsev7jydwejtdlyay6e6f53yorf2aguhxykscuukqfxugg7ff@hmmpcg7s4sx6>
 <83b27cc9-3544-4fd5-4ece-a46f422ec6fe@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83b27cc9-3544-4fd5-4ece-a46f422ec6fe@linux.intel.com>

On Tue, Jun 24, 2025 at 01:35:57PM +1000, Ilpo Järvinen wrote:
>On Sun, 22 Jun 2025, Xiang Shen wrote:
>> On Fri, Jun 20, 2025 at 12:00:03PM +1000, Hans de Goede wrote:
>> > On 20-Jun-25 2:38 AM, Xiang Shen wrote:
>> > > Fix checkpatch code style errors:
>> > >
>> > > ERROR: do not use assignment in if condition
>> > > +	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
>> > >
>> > > ERROR: do not use assignment in if condition
>> > > +	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
>> > >
>> > > Signed-off-by: Xiang Shen <turyshen@gmail.com>
>> >
>> > Thank you for your patch, but this change really does not make
>> > the code more readable.
>> >
>> > The contrary the suggested changes are making the code harder
>> > to read, so NACK.
>> >
>> > Note checkpatch is just a tool, sometimes there are good reasons
>> > to deviate from the style checks done by checkpatch.
>> >
>> > Next time when submitting a patch to fix checkpatch issues please
>> > take a look at the resulting code after the patch and only submit
>> > the patch upstream if it actually is an improvement.
>> >
>> > Regards,
>> >
>> > Hans
>> >
>> Hi Hans,
>>
>> Thanks for the feedback.
>>
>> That's fine if breaking the "rule" is the only way to keep the file readable.
>>
>> However, there are only three files (x86/sony-laptop.c and
>> x86/dell/dell_rbu.c) out of 273 files in the whole drivers/platform
>> folder that have such an error.
>
>Hi,
>
>Please don't call correct code "error" even if checkpatch may label it as
>such. The goal is NOT and will never be to have zero checkpatch warnings.
>
>The fact that the checkpatch "rule" is broken only a few times does not
>mean those 3 places have a problem, it just tells it's good rule for the
>general case. So I won't accept using such numbers as a leverage against
>the few places just for the sake of silencing checkpatch.
>

Hi,

I just thought there must be a reason that the checkpatch categories 
findings as "ERROR", "WARNING" and "CHECK".

Sometimes the number does make sense and means the vast majority
follow the widely accepted "rule".

Curiously, isn't it the contributor's due diligence to pass checkpatch
in the first place before sending? 
Should any objection, submit a patch to checkpatch itself,
instead of sneaking into the upstream quietly for the sake of "readability".

>> Perhaps there are other approaches to make them more readable without
>> breaking the rule.
>
>Perhaps, but I'm not sure the effort spent to find one is worthwhile
>investment.
>

Indeed, that's precisely why it might be worth sacrificing a bit of "readability".

