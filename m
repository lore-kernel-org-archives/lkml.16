Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA5F29B77A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311122; cv=none; b=cb/kpCx03oV7FozwfAms/zJJ1zDyUta/78PWJJJcfB0SKReExOc0oxbHGvAJM8QADJ954UjIn7AEVqTVxCz0dC9UKHTlhK/RlPHddqHd7/dsaWzDZbDa+kSKrQNrUuVPtjA8JIT3sql7bvDb8ijAzcFab9S7WyqFrcJxpBfDgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311122; c=relaxed/simple;
	bh=Yi075DnB0ddrASsSnNHyXEnUvGN34RERyEPTP/kj8pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sz+Fd/kD5sS0vb458vzR9JO1EKIzfnJdsy5x3OUxTYP3YcRo3xLn4uYR//gIvPOqtscXBVAefLxehDjek/C17YwWFSU8oa9exQrYAWDzSLcUfqCLq390N3Cwjb0Vs9PbG8iXl1JPJotpyriPAVwCldOzP9IAS8NS0ZElPq5TIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nBtQRvb0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nBtQRvb0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso7900825e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747311119; x=1747915919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhgWYiKAZKVlkO6qOFi+ufzO8bDM2t8jbmNg+EGBmK0=;
        b=nBtQRvb0ywAdzBWIVmwoiOwLMHxuH3WmTVl/N9cff1QJdpMcPwGBX9pcYvJSroy12m
         QSvz/VkMQvvW/J5pBANrXZjVM6zkmYB4Ht2YZkC3cdQaKc/B3dAZwpYvjJWsZ4lAWk5I
         01aMcvBBGVWJhEU6gnLYKzjvbfeE16NlBP32ziT90RSdyutOnqCxijh37lBbPOt3qc2s
         wasMBDoRr1m9X9CVMVwXvXLyORNhg+5BDmPH9Np3v2ckVhknMQCPKslenH5oCKRtAPkM
         K65XoqkxZ9YrJeSVxV4/11ARxhQ/RjBd086/HLG2ujNrJ1/D2AHUPEJ7UO/rGyezk8XP
         odSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747311119; x=1747915919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yhgWYiKAZKVlkO6qOFi+ufzO8bDM2t8jbmNg+EGBmK0=;
        b=xLpyGKitrlHKI2MHgWFuCQE3DJJktY4S7H/zAFFlXZNa5ZHotiKDZFbKWoF75eLnsc
         Ke4kL4gnwI4likaPKPMY8tyHv23CdP55qpj1R+tOein5h1slSSiozpC2paiHLSwE+3O3
         M23UQrdLYGrpJxxmkgOPjZqQkF63triJL4bVjznuzId48zR11oxYPWBS9AKTE39M4gZP
         RcQRRcFKez5e9X9vlXhusPrLBQHKhaKUItt1Ywzxgi+/cm0YXLcGNqH1suG9Rihr3XPh
         mBfpLdduXus4tc/pLyZXylU5LasvLE0xmKOuGr81NtXY9ICO7Wh51Rx1rqATUJTWzXkU
         ExNg==
X-Gm-Message-State: AOJu0YzUKBAVnitiOLtm6GvDfI6QTYsQmILmTTr0NnEkKRCAtEuDEkDL
	bVtlCOj6naHWZCnjq/mcb+IB32uuIisAX5wzZ2ld3c++GOrTBxEeUZyZbMUwowe+/NwWqu54oTD
	tTFT3Qw==
X-Gm-Gg: ASbGnctoQZx/+WyrRsm2c2Ol/h9R8QDESynDiNzKx2BkR8r5raNKHoqzMsORBfeP9eN
	MBNurleVSTU8bkaCJovmE+BB1mOrH6FWc7Ijmf9tbkpYzhGcyEIv9K57xTALRyBm6JUPPfuEbAz
	HDzA61R4OWCRwtu2+Cjtov1NEDG2Tr4RDn4qytyEr2/lFAkekkogmxXzuWFtpNWBLcUcIrsleaq
	MdF6nr21cvNskEYxC+qMgi76xCqK2JV3/yKfQ45BpqR8iSgVVF987pgcCyZAjJo6igdE/POdNBa
	H+bYtkTlI8Nk4mT9zL3Gt0/HE+uKiCFpohip6nGxnStMK8+YzkPpBUMylyxU1Q+Ie9SSWIWGs5N
	iskpkyrsMpFcJlv74G88XfXo=
X-Google-Smtp-Source: AGHT+IEjSwS5fnNmgBDe/niubQoDsW5LEae3lQuFFF01eXcj/RzozsMURi3EVcCH1WcDlMMiLfmUTA==
X-Received: by 2002:a05:6000:1889:b0:3a0:8ae7:e2ad with SMTP id ffacd0b85a97d-3a3537a0d4amr2100266f8f.37.1747311118802;
        Thu, 15 May 2025 05:11:58 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f3368d1csm70739075e9.8.2025.05.15.05.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 05:11:58 -0700 (PDT)
Message-ID: <2ffb83f2-a7e5-48f3-b96a-447d330aa895@linaro.org>
Date: Thu, 15 May 2025 14:11:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: error trying to fetch the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250429082047.4af75695@canb.auug.org.au>
 <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
 <ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
 <20250515221042.7471ffc9@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250515221042.7471ffc9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/25 14:10, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Thu, 15 May 2025 11:20:01 +0200 Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> I had no time yet to migrate the git tree to kernel.org but the
>> servers seem to work correctly now.
>>
>> Is it possible to enable back the tree so its content gets some round
>> in linux-next before the PR ?
> 
> Restored from tomorrow.
> 
> Just to make sure - this is still
> 
> https://git.linaro.org/people/daniel.lezcano/linux.git#timers/drivers/next


Yes, correct

Thanks!


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
