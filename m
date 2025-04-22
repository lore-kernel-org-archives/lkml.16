Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0F297A5F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745342547; cv=none; b=YHHTxl+gqJUB0GN/j1KYcNuloha1Sa+sklnnSdVtJML7QNIUE1UmQPJv09g2y2udGprZTv6YIARSg9h+uKJXzsMtT0ie6IRk9aicWRXl4c4QxS7lNgv8WcrLgOB7C+RrKGZ4Dri2rbU0FdQatuhubewMPMAxIzHwCYvdagLjYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745342547; c=relaxed/simple;
	bh=IVKmtnl0CuSeKzy2LoPtM1CzEBbUr6f+uIDvOhT0w6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sTkPDuJo1ytbgXkQCCBc20Sw4TwWROV+pIlBFR73mEMeHbp9tsCx+1t25XF+BWxQWukWGoQuKBNxbVfGA5TECjLSsiJ0Ck9hlmlB7vOtXOU9C4aFR397GnixqvAwVwCtNmHYHGQj1ZYONeDKdl5wrzd8rDA/lBnHxDgMA83dnRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Mjar0eqv; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Mjar0eqv"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d57143ee39so43677115ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745342544; x=1745947344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkAUgf7o9174Xt7OJxnzGn8DVp99mUV+yeckC0IzEpI=;
        b=Mjar0eqvUIZy6+HdRLXyaUH5XAHgjgKrx3m3tsQNPXhne+5NfN1osL9IS2DJs6Kkbc
         cxzdGqW3zpY8Ef0k3pcBF+mLOfh/a8MbkapduGrRG1AfVBf9/Q5t+31w+503OCYA3ZR7
         x1VjEAv0B7NnFwN4L2NToYm6sMFotl3Ifz9KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745342544; x=1745947344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkAUgf7o9174Xt7OJxnzGn8DVp99mUV+yeckC0IzEpI=;
        b=bwiIapm/isL0GimRdU19L0JONAjzP9/nkEarnf8h5dRbEEAPYI4VIV9kX8Dox3gtZ3
         YqEA2/tyu2qpgNzqNJOluBIODKlMtWrJOWq2i9F1qze2dOhJDp2redHwhd0OF69YmmI5
         ejQ6E74P9RpwmhJMdKro0ueGvKRKXMVBV6dE5wxHPA84kt6DBmivXSOiXcflWRcJLOdZ
         PqqQwuqBxmEibgG/rVuaA5gRMAC5vKTPIh3sL+Gz4o7025mmhQ9nyjHnNRfKBsIuKhdO
         xEFBAYJYKUtttElYwvlRv1yfnezFBXcz1ZTe/Q9JZoZ/AyJSEj4Y2/V2UHpeGxbiLqv0
         BTSQ==
X-Gm-Message-State: AOJu0YwSbs/aCLKUQsi3J/NA+p6VAYPXH04qeayFkL0d9JH5/9A7Cy2W
	CCdaRFJV9leafmWP6t4BBtl2EIeLTWSXR+jvbex/qLdiirUTungQuobWdf7JqDI=
X-Gm-Gg: ASbGncu3lcuSR0BD98fVsOClRdPidaJWMdf3P1RlWo336p4kyrcXkndsEB7y6925TjY
	TxE5tCCdnfS6aGJBb2sDMq7d/IZcTO7njYMGi98rOvoK2Iari62aKXfsOdFrG5emg9q90R36csO
	UCfwwCXoAgamySu3BuALnfp25PwrpSa7HtSpZW9mwKGFG4CziRU07qgHs4CPeZmCgwZb11zZ5zO
	mZjd1RrXaNf1d2saPt1nlEBxp6QpBxfjshh+ZG++8TJSkjW19ceHukFotAuH8RB3G0YRgWaUAYO
	VQFwYdmzFiSIYCKZMeSsmRV7CJMRI+7KTNYh9B7i4DfZs8r6Htc=
X-Google-Smtp-Source: AGHT+IE71zm3tSH11gi9dlOtDjUjFPo0zzmKI8+I+3NL1G/VlFknKvZ87QsjPqIzLuitgX80ZXmglg==
X-Received: by 2002:a92:ca45:0:b0:3d8:2023:d057 with SMTP id e9e14a558f8ab-3d88edbfb8dmr124783085ab.11.1745342543932;
        Tue, 22 Apr 2025 10:22:23 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d821ec1e98sm23429555ab.54.2025.04.22.10.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 10:22:21 -0700 (PDT)
Message-ID: <577ea8a9-dada-49dc-9c4f-6f82c94c0a1c@linuxfoundation.org>
Date: Tue, 22 Apr 2025 11:22:20 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch] Documentation:fixed a small typo in
 Documentation/hid/hiddev.rst:11
To: Tinu Kuriakose <tinuk11c@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CAC=vsvAv88P7Z_as3k0ceRNCy5Jq-1Y8ge=XPaRXcT4uzi1XBA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAC=vsvAv88P7Z_as3k0ceRNCy5Jq-1Y8ge=XPaRXcT4uzi1XBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/19/25 08:51, Tinu Kuriakose wrote:
>  From 4264e1e8a827998708e532f4a843a20115e92c5f Mon Sep 17 00:00:00 2001
> From: tinukcheriya <tinuk11c@gmail.com <mailto:tinuk11c@gmail.com>>
> Date: Sat, 19 Apr 2025 20:12:37 +0530
> Subject: [PATCH] docs : hid : fix spell error at line 12 in hid-alps.rst
> 
> Signed-off-by: tinukcheriya <tinuk11c@gmail.com <mailto:tinuk11c@gmail.com>>

Run get_maintainers script for full list of people to send the patches to.
Added Documentation maintainer and linux-doc list.

You might have to send the RESEND the patch with cc and to the right
set of people.

> ---
>   Documentation/hid/hid-alps.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hid/hid-alps.rst b/Documentation/hid/hid-alps.rst
> index 767c96bcbb7c..94382bb0ada4 100644
> --- a/Documentation/hid/hid-alps.rst
> +++ b/Documentation/hid/hid-alps.rst
> @@ -9,7 +9,7 @@ Currently ALPS HID driver supports U1 Touchpad device.
>   U1 device basic information.
> 
>   ========== ======
> -Vender ID 0x044E
> +Vendor ID 0x044E
>   Product ID 0x120B
>   Version ID 0x0121
>   ========== ======
> -- 
> 2.25.1

thanks,
-- Shuah
