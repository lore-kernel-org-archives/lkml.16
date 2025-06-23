Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D74C7F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686901; cv=none; b=ear7Zyy0l53IYMMwm7Zk7JaUPcfS23zFKH6nRskan85GQJJy3YO+Mk2HyyGEYRpAWotPCpwts55W8kqAd5V92v+loicHRwVl242lCVCRTCYeKT91XgVPlDI+KhRcVWiAVPowsQr5TE7yOut5axZjsgh4Lh1kcIfCCMSx3VgusR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686901; c=relaxed/simple;
	bh=w/IOpV1Yd/wUyQO225VZUmOavBn5JyyZf5kpYHBE2lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYJPXosxSycVBWMj97G6f/mVnSuUx2Zi2OFre8EBc+k3Ghh3Y+rRAv6ZimcFQQ4PwOt7KdDFlhGonNmCScvEjTWNmQqgdgG+VhKyNRpD57AQ1kWATk+6s5po6OaUb5s2Va/VqkvUmsOclZ9fGEBnsydL9P2iJGzNARDKKzZE04M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ECzXMHK5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ECzXMHK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750686899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=70+J/gMbz8ZCZvAl7Ey9hO5guUgLriRi75o2bOYatgc=;
	b=ECzXMHK5SGYzcFBc1oIJf6TjLrr10kbGKqPzWsvLkrnMh0qSXwqka4oeo5gjcxoHw4zHIP
	hf5TG53jjJBbiyDf8waIrJXyr0UQ48lS4JKDrQW5ufMRnAFsrX5HKBrvMwRDfO4qWiteLY
	JpAzV8oJ5t6nZ70vp/Y3/fMW8lcxcZQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-kvHCrNUiMRm4WwJRHYIuew-1; Mon, 23 Jun 2025 09:54:57 -0400
X-MC-Unique: kvHCrNUiMRm4WwJRHYIuew-1
X-Mimecast-MFC-AGG-ID: kvHCrNUiMRm4WwJRHYIuew_1750686896
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4532514dee8so32414525e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686896; x=1751291696;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=70+J/gMbz8ZCZvAl7Ey9hO5guUgLriRi75o2bOYatgc=;
        b=hftCymHdzJBanoJrCcVrZ8uY+u4H1eC2xWHEca2RMHtO7C0ZjWls+YJKGT3UYQpG4p
         czqzoOVlfAr+fzHx/tMSpxUjhWhksyw2fmVYkfEx6r9fkZOzVoAHZ2gbzoqdbtD9yqlX
         aq++/I7R+Wiputcq4q6sBADKVme6k7hdys2kceZu9+G+9P8vtQy3LTteglkkMnSR+Ogo
         VJvSxhqprHZ/ISZp/bnD1XEmLI20iwhJ4LPlcrOaMqkjLu5av/ktR00cZ5zi53bTwDnO
         Asj64LTKs2a8k4D8GkEI7upFmoCJcD4AYF/cEwBhnCbjB6rh7C61rN9JPSom25M5Ifjf
         IQWw==
X-Forwarded-Encrypted: i=1; AJvYcCUY8xj3pIvbMYonD8tOcmc6NoMpvuRrHu/bJaY4MXbAXhdEXaACOH7Wnb0WlX4lSqpho819KRIhpEAmehY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1BDO6ubfIlGxOH6ts7sGWC2axWN0vvVySleZI1/ZbL20MTgGG
	+q9uAyqB4bPmlheh3rMxPeaz1WmrXJG5D7ych4x+ahKiVJECL612KXtBY1GrqBJaY5r5sV3gWAV
	seaByY9QHZ9vDEYfb6savHLM0mHYEnIJwu++3R0/m/THYxzT+b9qZvL+Ix5dF5eQ0lA==
X-Gm-Gg: ASbGncuggfZX7j3iwkzBupmRK7bYlMZIMmBd56vXHcxIUlrOPdZbd+V2+kph5mmUZHA
	x80FxwlkQy2+Sz71lRXBHDW3wL6cZlz0Q3Uiy1Rqtf3zbgvIrk6z58avc+artHb7MYcicXZ/gHp
	FpsPhV2kYrKcvBgvyA8vF5ZQtr9gKpeWeEWx6rZ1TLILjtjYOr2WZhQnlZNc6mM8BLydeT3QGXv
	X5NKMMl9vns3AatkBwMkxSRhI4TVjFROc4DE9Ej8TfL9EB7AZp3PMzyRg9646ccqpz5m+rFabXw
	our8ptQtiKBFs37n8Nn3JfjcSrWOzeEXF39MfBX2qsasrNW84HBp0gqwsT+YnX5k11nrAXxoHyx
	QN836flr8dTA+4DtPYe2rTiBX48qm6NLh35v2efzOuv6SZEKbdw==
X-Received: by 2002:a05:600c:5026:b0:450:b240:aaab with SMTP id 5b1f17b1804b1-453654cb3d9mr113371655e9.8.1750686896488;
        Mon, 23 Jun 2025 06:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoDrVvSmhOk8zkB/mwB+LCVJOjk4JiZvBSsPfG/6DKJqAC923crnrLYg1vUkWqpKe0DiLBHQ==
X-Received: by 2002:a05:600c:5026:b0:450:b240:aaab with SMTP id 5b1f17b1804b1-453654cb3d9mr113371395e9.8.1750686896142;
        Mon, 23 Jun 2025 06:54:56 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebcecb5sm146348905e9.37.2025.06.23.06.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:54:55 -0700 (PDT)
Message-ID: <a9f77007-78c1-4980-bd31-af5dff741f27@redhat.com>
Date: Mon, 23 Jun 2025 15:54:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 4341ce6b3b38..85bfff53dba6 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -501,11 +501,7 @@ static void __madvise_collapse(const char *msg, char *p, int nr_hpages,
>   
>   	printf("%s...", msg);
>   
> -	/*
> -	 * Prevent khugepaged interference and tests that MADV_COLLAPSE
> -	 * ignores /sys/kernel/mm/transparent_hugepage/enabled
> -	 */
> -	settings.thp_enabled = THP_NEVER;
> +	settings.thp_enabled = THP_ALWAYS;


Would MADVISE mode also work here? If we don't set MADV_HUGEPAGE, then 
khugepaged should be excluded, correct?


-- 
Cheers,

David / dhildenb

