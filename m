Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05429994A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528636; cv=none; b=nV4OfmxBAIac6pymmhJpLaUzpT/T5KPlRLv7lOfNG7Knef2k4Rb0r4NupptZTn4qooadOQMSziH01OqjwOUA83V54qGdyvDib6NI+fPB9OX4MbQ/TrlG+cCkQp/A7bLj7YUyrBsk+UnZcgGks//NobeFtumc8veodwdxA0QqGio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528636; c=relaxed/simple;
	bh=R12TjoQqtaP+OHOg5vELHjQDxeyg7kZReIjNyGXwKnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egziQNNbgLFoicu8fO3G5HoDOQjM1DyK9Kaj9rV7b7t9oTQ42Gm3bAH5DaiK63caF3rbX8/H9RLZ++lF/jPT48JT0WuaVc3E4EcF8NrBPMIV8f91iALLmCaFXEc4icWjFi+q4OPHr9OC+9Vun2imBdFIxVV6WqeZcDkbPTyfhxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VV34MMpI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VV34MMpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751528633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6EpDYxyy2mrZVYzfWYPjxHIrTItJ7JlFF1ncAGLURGQ=;
	b=VV34MMpIwCl9ySjqsSrlzDCAQ+W7NcR57R7m+2K2cJQ4MTDXKJKq/pzN3hz01XrNeGFXQ5
	SCXvaLQDNiCMB/4ObjyiqpoDW5kYqQZp8qNe4COp1fdfA4pjCrfn/m2dQwYcZ+cExgjY8O
	upksn0C7o3IXsL1/xHlzuPHXusjZuaM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-zldk0ROUP8eEckdMnHAeqw-1; Thu, 03 Jul 2025 03:43:49 -0400
X-MC-Unique: zldk0ROUP8eEckdMnHAeqw-1
X-Mimecast-MFC-AGG-ID: zldk0ROUP8eEckdMnHAeqw_1751528629
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so3235344f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 00:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528628; x=1752133428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EpDYxyy2mrZVYzfWYPjxHIrTItJ7JlFF1ncAGLURGQ=;
        b=bMejchkiXxhZWkjjJDL8loADB+PCqRm+KHUf6A0pISo7MX+CJINznne/oAHlVztTz6
         BY8xxubhyjhko6tvLoECN6CUEMTyAzTZT5XITveYB1aSRpt8+m17geA3IH6Lt5PNAhpj
         TXwaW7RTN+7r9rKxMIWPNf8uhFrl9tTOh93Rave6yo46318aTNp6ZznlUjnIjHgtg8vz
         U4jwa/F+ULmrVgOfncRFDju6hVSV61bakmLPBWmFBlKTvNOXYm6BO45Puh2/sh6QEme8
         iUQ/LD3JFhcUbRwQYZoMCE9PB/Tl8nXlFhOtFm/PzFE2wBpXmMdTNB/V11fp5BkGoSLc
         zoHA==
X-Forwarded-Encrypted: i=1; AJvYcCXC/CwUT01xKtuTHAvZpIPRbsy8cFHTVEaMHbDbp0BmIBEjwOZ+36MTJMKv0QuD0cJwlGSTuZcalSeaBbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFdKkYoGK9tj7vmtMrMEzd2GjrWhsL0vB4WVWLK7Y5mgg2VJIe
	HDsPLxzg4rQYc/4RTOjyfSA7/v9sWwV2kyzLIGgmpMBFDDomxJ4473p92ZBH74kqj+myGHuQH5E
	c3nFU9GzIGZwnDengf57F8J23mQvq87LHiPc6oyPF/t5nZXOFSXYQ7dixFVnK3gR6/xuD6+0i/Q
	==
X-Gm-Gg: ASbGncu4FS9z126zcxpIlTZ9apEFqWepKAkY14trYKfnvIChKseCycid8tlyfqW1VaN
	/JjZz0LXR0n6hKLnxJ6/vfnIHvSZ5ZmwnSO/G58JPylcISs4/q/254ga3/ZixM33OKIk6yUF6NI
	yadM4rnLucRC9QPEwBqNAFBpcXJ4dB/0Dwl0wCYX8wrZNzk1lmQkU93L984gylJQlQcfQZdcrsW
	7M4aCeQgfA2/Qj+jw94dn/DmGMJ7UTWefcpQinSMo7ORQXVpV4RaYbdeoK2jWGo3/GrOWhdWGwX
	XjSdd5I6zzsfVNXPZNZi6yGSu9K4UNeVFIIW0ghGXJ28bC0K3EzFR0ruaGLtow==
X-Received: by 2002:a05:6000:1a88:b0:3a5:8905:2df9 with SMTP id ffacd0b85a97d-3b32ebd79f0mr1569343f8f.37.1751528628426;
        Thu, 03 Jul 2025 00:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvFrMwfp7e/fgq6XK2cDp/19q243cAhOekmS354fLqpt9h5aal0IYzzF1RmWfR/wO3yuF5tw==
X-Received: by 2002:a05:6000:1a88:b0:3a5:8905:2df9 with SMTP id ffacd0b85a97d-3b32ebd79f0mr1569317f8f.37.1751528628045;
        Thu, 03 Jul 2025 00:43:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c? ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f918sm17831437f8f.100.2025.07.03.00.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 00:43:47 -0700 (PDT)
Message-ID: <770fc206-70e4-4c63-b438-153b57144f23@redhat.com>
Date: Thu, 3 Jul 2025 09:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error
 reporting
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org
References: <20250521092236.661410-1-lvivier@redhat.com>
 <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>
 <20250528031540-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <20250528031540-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2025 09:20, Michael S. Tsirkin wrote:
> On Wed, May 28, 2025 at 08:24:32AM +0200, Paolo Abeni wrote:
>> On 5/21/25 11:22 AM, Laurent Vivier wrote:
>>> This patch series contains two fixes and a cleanup for the virtio subsystem.
>>>
>>> The first patch fixes an error reporting bug in virtio_ring's
>>> virtqueue_resize() function. Previously, errors from internal resize
>>> helpers could be masked if the subsequent re-enabling of the virtqueue
>>> succeeded. This patch restores the correct error propagation, ensuring that
>>> callers of virtqueue_resize() are properly informed of underlying resize
>>> failures.
>>>
>>> The second patch does a cleanup of the use of '2+MAX_SKB_FRAGS'
>>>
>>> The third patch addresses a reliability issue in virtio_net where the TX
>>> ring size could be configured too small, potentially leading to
>>> persistently stopped queues and degraded performance. It enforces a
>>> minimum TX ring size to ensure there's always enough space for at least one
>>> maximally-fragmented packet plus an additional slot.
>>
>> @Michael: it's not clear to me if you prefer take this series via your
>> tree or if it should go via net. Please LMK, thanks!
>>
>> Paolo
> 
> Given 1/3 is in virtio I was going to take it. Just after rc1,
> though.
> 

Michael, if you don't have time to merge this series, perhaps Paolo can?

Thanks,
Laurent

