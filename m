Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71B24EA90
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689993; cv=none; b=HYTKjD3SeDJlE9jqu+szVUtXdKN7QDIykTDC1Tg3rhT3uKkRPzqrPRof18uuCzqdKZ5ngtqbw257sJIY8bdH9FYwwVT3PSZTV6n1eAyTqU+gK+SBQY6YgPzx5mpPqrCuxXZui45yFoxVvM5I0pczfAGlZzcVoQXWg3GiczCCl3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689993; c=relaxed/simple;
	bh=l32nJhWlvQpJaXMheQIHq7EaHrAGjn3ePH6vgGK3ZrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDUWEeahgyzqrIyuPS/zf3FItEQ5FsiasWqMMggIq0FTaY78XGiLnkKbKcErS/58K37Gh1geJjmJZUoudwkOUdSRVXvotcLMIxONaz5qy8lqhZkH2qi6NLS8ouxwV0XPmtKkaCQh1wd9C9zKajmPUI5SbFwAX2qyxYCBXJQ5nF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GBCVS14u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GBCVS14u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743689991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HRj4duMKWuLhK3/1HC13xNiJuwQlUGnDJUVVcga109M=;
	b=GBCVS14uVsZbkK27B8a3WRQuSa9JjcQa4Tzaa1NKasPHBGFprqBS0YhWVXn9yLAj80WOwr
	jL6aGSZ17XIrRCdWDQHYHl8v2kHur49Hu6ajILaGsrPNnb61sZT3ZAgpEZ4p9+YD4BFfDj
	Zi4taa8fyuVDvnfK33B8l3ZajKsOIIo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-dGbjhJ80Pv23Y0cBETwT0g-1; Thu, 03 Apr 2025 10:19:49 -0400
X-MC-Unique: dGbjhJ80Pv23Y0cBETwT0g-1
X-Mimecast-MFC-AGG-ID: dGbjhJ80Pv23Y0cBETwT0g_1743689989
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3d175fe71so67766466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:19:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689988; x=1744294788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRj4duMKWuLhK3/1HC13xNiJuwQlUGnDJUVVcga109M=;
        b=NteAO2wKBtpKOvhoJ1cyFYvhke0Hrk1NDUsXHivIn4itz2TXk+1QVqcZb4XgKLrS46
         IyV9Vz6MZ7U8PChKtagyhsLCh4jCPww2QFjBLwN0uvX9S/ynuCvZGDHeZmQy0tUgvoIC
         1FoDz19VCL+Cuy+KC5Lq7/dNqDqUi+gWV15i5xV5hvOU7t8stE46XDaepCPgW3kyrB7p
         pnzodSh82CVEhYfVYehAZ/XbWuU/1ED6UU55/NTIv2sAByN9wWpUgGoi5gR7iL9LtygD
         aIWxymyr6g/v1yXFmE+ES58H+DuO0ndb21CbWcdZFucWSp9b7ZQMOWctL0HwED4zk2hu
         RGDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOOtWf1SQaLEtjP4w5J5LW8yoCApjMp1GrNvk/3A5taiKEZvmkl9NAsvA5l+29VWuhivL97btzEG8YZqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOLGaWSQEKxmbGuvgPK1aVoxiAKs2cznpcnzOBrRnsxYWXP8vo
	WC1jPngcEFI4BFEdMOc4Y7YOVxoIU7sMRLtX62dy7hlAbhXzq/UiEthbciNFycke6MOMrOtCNfS
	uUi5tEwbHpKGg1tCR88X1pabMeIi2Gar6JIhKLbMZzXWjbVShKFBjtwTaUN4Kyg==
X-Gm-Gg: ASbGncuMV9RDjA8zzE0FXOshJrg5Sz239MOi66XOwC9Cvt8hYq3RT6ejDDEg5vE7fzZ
	JuuvbmrGVeVNR++WoJGA8hsBsZ996ZDNyBy/A40jiI1jI5CP4Ka6QMUlK93Yp/Mx6c5hn05VOM1
	h40Y4AYo069BCy0EzCAwSJTD7l2ct1lXmNdyXb/W6Wk4slfSidYhRi1Q+8NdWl+fqa0QuUK6+KN
	bBc9zaNv7UF9X254OLz9VjgOM5ePOHgTw11eU4SkWie1ISmYKik+8Dcvk3nkzAx7l3/l2GIGyS1
	bqxwhWEACq6ihOElWExN/Ra2RWy2QFxBXLjMqc0lT2TyKSeJ3ZNm0E2NYpoEdR8xaQw9kS6mSQ+
	WJDAXOLMuqUHWWlZHQWCV9XocL/+UQ9aFgkUkfG1q/WTXslwf4+bGGSNWA6/wjRr+xQ==
X-Received: by 2002:a17:907:72d1:b0:ac2:b9c8:b7ba with SMTP id a640c23a62f3a-ac73895fbbemr1917788766b.10.1743689988668;
        Thu, 03 Apr 2025 07:19:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE389JF5t/NVOtZsuHT6ZzEofdOeTC/k4+UGMGsxdz2+Ni5DDJM4CsvuVwaY3ElTZolYu+ZhQ==
X-Received: by 2002:a17:907:72d1:b0:ac2:b9c8:b7ba with SMTP id a640c23a62f3a-ac73895fbbemr1917786166b.10.1743689988309;
        Thu, 03 Apr 2025 07:19:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d44dsm102241066b.13.2025.04.03.07.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 07:19:47 -0700 (PDT)
Message-ID: <3beaf600-1670-44de-a782-6e34010061e3@redhat.com>
Date: Thu, 3 Apr 2025 16:19:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a
 value in pci
To: Greg KH <gregkh@linuxfoundation.org>,
 Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 andy@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
 <2025040320-fraction-bagel-ea64@gregkh>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2025040320-fraction-bagel-ea64@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Apr-25 3:54 PM, Greg KH wrote:
> On Thu, Apr 03, 2025 at 02:26:41PM +0100, Abraham Samuel Adekunle wrote:
>> When a value has been tested for NULL in an expression, a
>> second NULL test on the same value in another expression
>> is unnecessary when the value has not been assigned NULL.
>>
>> Remove unnecessary duplicate NULL tests on the same value that
>> has previously been NULL tested.
>>
>> Found by Coccinelle
>>
>> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
>> ---
>>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
> 
> I can't take any drivers/staging/media/ changes for outreachy
> applications, sorry.  That should have been in the instructions
> somewhere.

I don't know if this helps wrt outreachy but I can pick
up this atomisp (and I plan to do so).

Regards,

Hans


