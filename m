Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B19155C87
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750707201; cv=none; b=dT2EiQs5TZDU+0JHFMvjEYW4e/aU/x5+HmMTTkMXzBklf1uYogBBS420mbIJSMcgGLyeEuAo5T009lgmp6jbFd/dGLp95dTfFq6N9HaviB7e6ETwvRvy3HZyIIayV0ZG4/bg588HCtkxBF8mclt0O9KQd6Ae3U/EBWOKMUkRVSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750707201; c=relaxed/simple;
	bh=9lI7R1yfwUd2UlvrSSL+OT1wwUYl6AKg0CDx6r/ek9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQkx4jNjjx3X+M41UnJqgmsw2Vt+ghLnh6Ly87suqz/E3JiecgMkGfRCFoxSPuqOzGPHluMUmESU60NT88qik4YRdaaLdd3fstHwY6gLM2KJvpXT8lJt9hH8RQDENTwvK4B82YaDgv2b2nrPUuXxQNvM/HIdee5uC8jRZD4kVtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YIPLhfDC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YIPLhfDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750707199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K0/+8NFujf4JTzwsWWkGjCoD10GFomMmDwt15P0EBbo=;
	b=YIPLhfDCq9rK9VkoV6LbjROTMA+g7EVq8Uf435x/wA8/WDlUL3NSwWkSwK/rUFjfiOV/F9
	xxzUdx1ST5BJjfpi90WVdGEh7yWixQvDCL9mVBqXYT7yydoe5QMjqF6GmyDrz6ijCaxZNp
	Q+bN7U6gtm/e0ZB0al9lkCSFDVc2iy8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-derhAhf6PA-D3MyNvTACmA-1; Mon, 23 Jun 2025 15:33:17 -0400
X-MC-Unique: derhAhf6PA-D3MyNvTACmA-1
X-Mimecast-MFC-AGG-ID: derhAhf6PA-D3MyNvTACmA_1750707197
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f3796779so2227049f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750707196; x=1751311996;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K0/+8NFujf4JTzwsWWkGjCoD10GFomMmDwt15P0EBbo=;
        b=sqzUCRahb/FvDO0xAnfyyNFMkkCoA381JTekcRP+seOBfx7XOfUT/US5gMUJUeRJFa
         bAAD/BZK3A/UQW8zD4tNgrF/UTatMrL8G4orfBzAcUAk1I+2LokbBSWfuRAHgUFS92MC
         sNevWA/jQDOpdvSsvz90gGsBmY2X7toZAWEyE0yDY4TR3uO4QmSUEUM+RDZBvVF1R7bW
         jkbVD4wT5fQm6nnT2WWUa1Idg2GVK4mz5qxb8weJBCpY0t6ENxC+vUZQskIlS9hNnbOi
         RVCWT9aDg1cEE6K32gS+qFeb7QZvjd41lC+w+Z6MG8YKY4uBYUh3bkxvESP0HMGnj/RV
         CPSw==
X-Forwarded-Encrypted: i=1; AJvYcCVOBIoYPylvUT79smDLPO7bQK5Csij6JHMG7HvtyyWoz86WOHe6Yq3dYs3JseDrrefUGnXJ0EELznFFyMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDD1NjgRGEfd9QB0lsa0xRz+ptUBU9dF2m+aDG2q4PXDMvX2W2
	ipBWS8vNUVQzw8mxYjfSB2Yt+s6osEgiMx6dWHXvdxwHiSUOWIPDK5KaZukJw7Ex/4jdpa4gYa7
	7uYL2lpDLDY3gNec7lAJvp8wmo6uMp+1WmBpa9xJw+knzlbnokKPG7PST/bmrbobwBdmuLpzQRb
	ci
X-Gm-Gg: ASbGncts1GxeOyyAz8RRr7NTlSu1g17srNnpYYFfQtzU53pB1O3TT+Lk48lPXJhCZfH
	E7IHN2bEt6UzoruyRGXKgSOEsvVcvuvnKJ9zWnoZUQKhsJYDSdF1qevb7RpMG/XTCLz6FjDJ6eU
	jP2Wm5XQ6AEZCNjP+6R+NFqkJdno9EXp5bfDVL65/BhLZ9v10iOUpZmlOt0UD+Ol3TD4moEULJB
	ZKO+gjt0BmdjgmL/StKlgL9Y/Qly60VF9HIyjqpsWKka1pMNH3yd/TlikwDwe8CAyeC22bapH43
	giEPGqhvpKXeiLJtLAHRseeZDIUQYPFNBWuTXuScx4/fWdl1W2q62yZvoO0KrgkQtty+MqslM7S
	UWxEHZz4UXFJRFS2ciFwKuzVUU/1XKYppAEKjpnPHCvALSAMr7A==
X-Received: by 2002:a05:6000:23c2:b0:3a5:2ef8:34f9 with SMTP id ffacd0b85a97d-3a6d12fc23bmr8367469f8f.27.1750707196522;
        Mon, 23 Jun 2025 12:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwjq0vsrWg8eKGsSx4TLrqrpk9YypvFu3BPs38tM7cfCERusESM5p0aomG/RrEUVRCb5Wepw==
X-Received: by 2002:a05:6000:23c2:b0:3a5:2ef8:34f9 with SMTP id ffacd0b85a97d-3a6d12fc23bmr8367453f8f.27.1750707196086;
        Mon, 23 Jun 2025 12:33:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8edbsm153409965e9.24.2025.06.23.12.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:33:15 -0700 (PDT)
Message-ID: <04013158-841d-48cc-9687-6c6e75fe65d1@redhat.com>
Date: Mon, 23 Jun 2025 21:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/zswap: export zswap API to modules
To: Matthew Wilcox <willy@infradead.org>,
 Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Igor Belousov <igor.b@beldev.am>
References: <20250620193552.2772125-1-vitaly.wool@konsulko.se>
 <aFW6xI4m15JepI8Y@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFW6xI4m15JepI8Y@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 21:47, Matthew Wilcox wrote:
> On Fri, Jun 20, 2025 at 09:35:52PM +0200, Vitaly Wool wrote:
>> There is no reason to not let modules use zswap capabilies to
>> densely store unused pages in RAM. This will allow to remove some
>> homebrew solutions for e.g. GPU drivers in favor of plainly using
>> zswap pool.
> 
> I really think these should be _GPL exports.  And I'm not sure why the
> GPU drivers are using "homebrew solutions" instead of using the shmem
> APIs which work whether zswap is configured in or not.

In particular, because zswap is tightly glued to actual swap code (e.g., 
swap_writeout()), and we should review first if any such GPU user should 
really be talking to zswap directly.

-- 
Cheers,

David / dhildenb

