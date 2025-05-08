Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6934128688B
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716807; cv=none; b=YIcRXyT5VqXoBxPU4o87BvuUJjLBfAowRPcCf/iUXk5NxqjMEdcq1QkoS8Dkz73XmRwpK5/IEEE24Y30PdlEbWmkWqiUiBpCY/s0WCTbkW6bErfMeEGqXNxqj7CxxFx8ClFvIi4scZs/jxgp6PBP6HkI6JTwS2YH3gxxbXthymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716807; c=relaxed/simple;
	bh=0SRez/e73G2FWCDWOJtPCRgCBM6jPJuo3QCvOOny7xY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Spqf51rlnt8AUmxs9ln4f4nluvkQ2f7h9krhhYkrkkM0opOe1MQuEugfu31qrBvVtW1y4or9vqnHvnCVYd4MnBhcBN6lRG/L/5aWbHOWji6/w6C2KWd9K/5mCR4ZYlZYQAnwKD1L84B4wTWVjJ4mGlLt2RR0G1pcwwDhxnK7PYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qq5FMn76; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qq5FMn76"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d8020ba858so11606165ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746716804; x=1747321604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6/7ueoYgZ3OR3TB39uAN4klcPC2fDyaTwTbVZ+ISQok=;
        b=Qq5FMn76UWOpSv2KpN9Y5VyqG5duqr7VItW2NSDU3FbF6vKsYHaPPN2s5M1xqyDYg2
         gRLJFcvZoEFB8tYMb0N9MBk18PXvKrPu7reZNKyNKwZfu+usb9Q5fQ+suQcC6c4jh3dB
         QAABcrvMIKqMp4EoHiyDXLozzCydIpDvjjiZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716804; x=1747321604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6/7ueoYgZ3OR3TB39uAN4klcPC2fDyaTwTbVZ+ISQok=;
        b=rmp8lvN9QjYU/7Ew4hbl5iENlI1q+VoO73cw2hHMBEJAiKNRHVdvQ142uN5Rc6ps1V
         m148zYs/W+GGVCvcRj5drx9ypV6m8Zd4aQ1ZLPI0Llh7wjT3GqaZj7op+zEx8q/LFW+b
         q3mmpKhlhMi389UD8eSfQOsGPkZ9n8n98FiDsg61YMecG8TMNzek85rFKyP7DXWuy9v+
         ppd9vrA1xB2JA7Isw4NUTjQ8fCgj8gkeYU3AhLACL21MKZVAcCEdYYj7WlT1gYTJyorv
         EaKjUsngmXhtSUk3FzY1W030LS3cDeu/U2D6M/qV6S624nKq6HMxaGh1v4ziBf5C7XwL
         8wCA==
X-Forwarded-Encrypted: i=1; AJvYcCXUq6tlLGYHF6l+zNo2d87veM1cIAlSuI2zduZmlzr3VirBdd6qTzWxxk5L+NAG5r3Sh4KCTr0MEgKYqRo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7kbiWO3x64oQTtBxIGd6a3CGqrJ/IVVeDx0sl7ZEihNnx5vqw
	s7zMk6LDTTj6aqhecBQwSyKK5JF0B3vUaJVADW2aat6lRJPkiuA9uGQIn9y6LGg=
X-Gm-Gg: ASbGncv4AfKufpsnfQxfnI/hgfk6v+MDcP0NU8VsiUKA7205iUNJN4EKv2EbH8u47ao
	XLHlbbhNzU07Emqu8Hzygx3KSNQqxTfnyPjmuBafypBMbnZtNDgyafBGS8houXBIoeytCvjyAQJ
	nP+BDs1iqtd50UWJ4ZbpoX6cKBoM2cwoFa+t6xuAVckX7b0ZQ9lpbDwP62xpQc/i+aLZ86Helm+
	QkuhLyNbUGRoe0dMp3M4ynliG+GvahE0RGCzPABsM+so5ZzCJxB7Ak79SK5EDooP1u/Qi6igFYe
	9xiQ3hMAjKIzJMRK9kdDzn5faJRuvZnka53xPbCz3t19qj9mt2o=
X-Google-Smtp-Source: AGHT+IEmzmvQ4SB42hghmafdzG3t4YyXDL1hlYw77sgyCL2ktMv/2tM0lwmDTfO/AIM4bcI7oMIiEw==
X-Received: by 2002:a05:6e02:3cca:b0:3d8:1bd0:9a79 with SMTP id e9e14a558f8ab-3da785ae55fmr54026135ab.21.1746716802693;
        Thu, 08 May 2025 08:06:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975e7d0c6sm38491925ab.27.2025.05.08.08.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:06:42 -0700 (PDT)
Message-ID: <b547d83f-6e9d-4b11-9207-aca8fd575794@linuxfoundation.org>
Date: Thu, 8 May 2025 09:06:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: The "make headers" requirement, revisited: [PATCH v3 3/3]
 selftests: pidfd: add tests for PIDFD_SELF_*
To: Sean Christopherson <seanjc@google.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Peter Zijlstra
 <peterz@infradead.org>, Shuah Khan <shuah@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 pedro.falcato@gmail.com, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver Sang <oliver.sang@intel.com>, Christian Brauner
 <christian@brauner.io>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1729073310.git.lorenzo.stoakes@oracle.com>
 <c083817403f98ae45a70e01f3f1873ec1ba6c215.1729073310.git.lorenzo.stoakes@oracle.com>
 <a3778bea-0a1e-41b7-b41c-15b116bcbb32@linuxfoundation.org>
 <6dd57f0e-34b4-4456-854b-a8abdba9163b@nvidia.com>
 <e0b9d4ad-0d47-499a-9ec8-7307b67cae5c@linuxfoundation.org>
 <3687348f-7ee0-4fe1-a953-d5a2edd02ce8@nvidia.com>
 <e87bbc68-0403-4d67-ae2d-64065e36a011@linuxfoundation.org>
 <aBy5503w_GuNTu9B@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aBy5503w_GuNTu9B@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 08:04, Sean Christopherson wrote:
> On Wed, May 07, 2025, Shuah Khan wrote:
>> The issues Peter is seeing regarding KHDR_INCLUDES in the following
>> tests can be easily fixed by simply changing the test Makefile. These
>> aren't framework related.
>>
>> kvm/Makefile.kvm:    -I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)
> 
> ...
> 
>> You can make the change to remove the reference to KHDR_INCLUDES.
>> If don't have the time/bandwidth to do it, I will take care of it.
> 
> Please don't remove the KHDR_INCLUDES usage in KVM's selftests, KVM routinely
> adds tests for new uAPI.  Having to manually install headers is annoying, but
> IMO it's the least awful solution we have.

Thank you for confirming that KHDR_INCLUDES customization is necessary
for some tests such as kvm.

thanks,
-- Shuah
