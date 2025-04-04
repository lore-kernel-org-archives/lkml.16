Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14F1199E94
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762177; cv=none; b=Z0brUIm0MSpX5CgqvclazjhYmIwDm7vX1N9mV46JaQEq5zn8TkwfmD9MYMiXw7RiXvwCEPRmh50sacKM5LEcO8gPDnBv/c/bg4OWGuwD5DsPvErQbWLSBkYOhC1YT50bOnA1veuJe/KECaLXyQ7gugWZC5p9okwbDyBNgn4TvBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762177; c=relaxed/simple;
	bh=JtreWaK1HxThyWsdFhRvKmWImSDOAWofMIBdnx78l+o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=rPi8sqJHd8mAUlLW6L1omn1IK1TEB0WF2RuywQV+4eY1KSIgGoKYV09zVVv7XM4bj2vT3n4ypFYoKDszXpwEMobhQBhU2+j2c5xoYYlVHex1J0bpRYD5zTqDB1Y/iAqDzwMSe7Ng+8P74IK4WyW8+71rQuU4oD8GZurgFscZWMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGCXKKJC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGCXKKJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743762173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DNVoYJhFq7cXruMh9BbCFB9GyK713s6YFzIH0vw/1ok=;
	b=EGCXKKJCmFT+puB0IXuwKa61ttfk9u2a+ZCbR0H4vTKWxwlrdOHqBv6xYZ5Z2erUrgGvsE
	FFhVyTNcFDhTKDJkIuJ4Lp2QO/Me6NHVCKqg7o9jw4ic4Ty2ptA6k+gUtXYj88ei2k1wWS
	CACs89epl6S/7L398Eb1bpho8eLSU9s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-rG8YWHmhOSa1cDqFJcG8fQ-1; Fri, 04 Apr 2025 06:22:52 -0400
X-MC-Unique: rG8YWHmhOSa1cDqFJcG8fQ-1
X-Mimecast-MFC-AGG-ID: rG8YWHmhOSa1cDqFJcG8fQ_1743762172
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e5c1bb6a23so3090768a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762171; x=1744366971;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DNVoYJhFq7cXruMh9BbCFB9GyK713s6YFzIH0vw/1ok=;
        b=OM/SJP4RaNXwi2VrwSE/5QQZImyYWOkcbjuWQBMg9RAyY2mUepfjs4ZLf5nbDyMwzj
         SPBsa2uk2izAi0vQHyR5EUjf1YyUlp3fz3K0hotHvGFbtLQCSQ7yuC0hcpPzDvrMGFqU
         cWkb3w5SGujaWfcosaJ95XVm8diftcMNirKyV2zmLQcdh+BgPNYNPnhLgfNM+52J95W9
         bLSNtrEOpMbz9NDxyLsZ2FFmVMerIFSc8bM5WSmiS2y6BouPuyKoQf80f9E7DvtqH4O+
         MnyTKmF9ukvi4msi2v845MxKlzd1m/NYlOeGoAqZamFdLvvDCGag+Zhp40w5A/Xwuu3N
         UHqQ==
X-Gm-Message-State: AOJu0YySW76xDRrJ6oexD6B+9i0fj/+0y/dL0OBPuhMSxFhSj3jp03Iv
	1VedI/CVXAnwJfmHiH1IhrAgnEdUWMBxALJeaA2bJfOM6S/WzUhgOsC83fHikafAxHNLpS79sZY
	xLkbh6pv6DBmdX+IacqvriHQz/VHnoxYbfJvz6exxr9yocQAh64M1nB9dGH64tUobatgYmcyo7d
	00D5dNHCqx92kjsZEh1XBCSrl845bH4akF5n0Fneu+0H95rg==
X-Gm-Gg: ASbGnctxLs82B9pOxjdrhlt2VP1/6MLWqOnT3UZ0RDIH6zPlrDadAlHplpNS3Skr7D2
	0bQY9ISu/XRl2JrUVpEWJG+fE51AtWpSAdQWVlT01pCqSoxntxl3CqM0DPPOIi+odJGnjppqTrL
	k1pu1miiMukZTun3XrbA2gX3AnFBzPwbTs0fgoQuWho3cUXI4ElKv5y582tege64QZZcl7Rfxqq
	SRnJMoWOFwcFe446cFCOXUWv4bVjhimSMuP+vR7oU/78V//oou5khusmGOlKf9hDmNC7QuB9hQZ
	KpAEv4Q/2EYxt8o1q4LH
X-Received: by 2002:a05:6402:2714:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5f0b28821dbmr2250726a12.8.1743762170868;
        Fri, 04 Apr 2025 03:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHM+zZOy5sRewTG5wad0dtUfjY+Jh0Y6kbMGiejkGMj5j7Z6poTz19CfMKHeKcGq5Wo1d3wQ==
X-Received: by 2002:a05:6402:2714:b0:5e7:87cd:2479 with SMTP id 4fb4d7f45d1cf-5f0b28821dbmr2250708a12.8.1743762170453;
        Fri, 04 Apr 2025 03:22:50 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.230.224])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0d6bbsm2224445a12.46.2025.04.04.03.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 03:22:49 -0700 (PDT)
Message-ID: <68d3aed1-2afc-43ba-9b84-c28e01637d45@redhat.com>
Date: Fri, 4 Apr 2025 12:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kvm: bring list of exit reasons up to date
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20250331221851.614582-1-pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250331221851.614582-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 00:18, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tools/testing/selftests/kvm/lib/kvm_util.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Applied now.

Paolo

> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 279ad8946040..815bc45dd8dc 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2019,9 +2019,8 @@ static struct exit_reason {
>   	KVM_EXIT_STRING(RISCV_SBI),
>   	KVM_EXIT_STRING(RISCV_CSR),
>   	KVM_EXIT_STRING(NOTIFY),
> -#ifdef KVM_EXIT_MEMORY_NOT_PRESENT
> -	KVM_EXIT_STRING(MEMORY_NOT_PRESENT),
> -#endif
> +	KVM_EXIT_STRING(LOONGARCH_IOCSR),
> +	KVM_EXIT_STRING(MEMORY_FAULT),
>   };
>   
>   /*

