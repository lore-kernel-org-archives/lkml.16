Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC9205AB9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181704; cv=none; b=EKVulkc72xsVkVGaktx7TAkaVsMcgmvg9x5/cvIN1noyKZBb//8Ly1yESIhK2S/Ev3wUM1MyvN40gfgEyU66qzr0thFoWARFNHsLx7NKRFlLewm7cXY3D8gWhpM8TNevI6r/1kvBapTt4qYh99tJ7GmeZ8+BYwbOW3RBBRkwaEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181704; c=relaxed/simple;
	bh=SEU8CqxPdXWm5kBs+itfyCdnnlLFQ0gV+s9EvH0h3a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cca699BrTE+1x2Jw1FEDiWFNFNg8azaI5irhJAm1SIlTJYMIqYUoPXrnwX5NiicYF8jFMmL0/PnifzWludqWjD4XuE/wkocDYzg6x88xDTiHaHPOOc1Arb7XnM77KPQkPwV8PuxU7u0z1D9F09ICnsaXzYcu+C/uJthu5Wd/jWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H64ScWfx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H64ScWfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746181702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QSbhw2lx3uIU9bt71Ke9bjoVhiyqLGEvU1SMMBHqrLU=;
	b=H64ScWfxSM7cF+QCqeuldvCfQnV5iv/rxuLuU2M06TyvrdBDVdfvLjxJbiE9I6wZAdZ3Gm
	mNU2SEC7sst43cb1pSzqdwLWtk5rsocUrVnFYUu6K3GEF6vxlKE76/QLbP29u+y/1+MLZy
	tlolETy7gRGUeShMloRFcNgvZtlGDko=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-JutgP70VMkSzllabD_Zd5A-1; Fri, 02 May 2025 06:28:21 -0400
X-MC-Unique: JutgP70VMkSzllabD_Zd5A-1
X-Mimecast-MFC-AGG-ID: JutgP70VMkSzllabD_Zd5A_1746181700
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso1160194f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746181700; x=1746786500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSbhw2lx3uIU9bt71Ke9bjoVhiyqLGEvU1SMMBHqrLU=;
        b=dcvsk+WvwBTFCWXijq8O5WUKqdBW9KH+Jyvf7PK02i+dW81ubtBHtPOU608DCTXYG3
         rRRlNgdWvw6sCcBk3LjJrsDVWglkyxzztuzJrh8uAJ2eEI57sFN9vqw8mW/VqWUvCZmT
         HM2IGRx2LhRSiN2DMpG3zELRmzhKPp4Hwe7veobYIhWsULXY9pl9Lc4zxHJMY9+mSYPW
         OW5tzAve7SssZLwxAJKMyCqEXjvRHoM2XGPEbuWc4rYeGJ5OIef4Fe9cNQv9AYKBbJH+
         +9F8RB15e3NHWXbT35WYqvoykH8vDrpfus5ybsznwycVrtOxZAxXag8hpQfpKiVU/MBg
         GyOw==
X-Forwarded-Encrypted: i=1; AJvYcCX0VyQWCo8M1ZzYWde0/3VCUlhSwUjXTD6XoATFLJ1aLHD69bLx7eSKkT/AlcyahrnmTOiHK7eA/uUhFzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyyLDEQvP9h4Py6XAWllFjkla+baNt85dl3PbUBhEebRyEwhE
	e3Lp9tTPkWdupUXq7XWZgEko4PkFi4TGnTuO2F49esznCyvAsKwBRRh8lTQ/7EaVlzvXvhRyVt6
	dkfR/7L/Ge9mYz0O/c7kKywUxzqKxCcCNOtD3PeNjLvLo2Sz9IbYbVlN8w3RK8A==
X-Gm-Gg: ASbGncu8RBl+diFN2N+CKXdx8tykiGoOaCLAKN/7OM3ztWUGUhxk6tnBZF7FE/jHOf+
	+8ntnG5oCp6S4MP2nf6h2yyZQ9Rd8atjhE1niZqo6LJj8oYk+nAyEfQhaWDTvrBmZCh1fQQb9X7
	nWJswFX/QCce7gWfYA/wNCa1b4OepWGaVBzkB02YN2wH6pdRJDvyaOBmHdcUGaSe8h9hNLT8inx
	sAat1M0RlGBhhjeB6j+x6rO/TBoqNG9avfq/Hmkwcy7TDteAIKOoLvmuwA/lMQYTkVSpwOsNY70
	Qmm4uNMpA8ATkGPX6SM=
X-Received: by 2002:a05:6000:1a85:b0:3a0:8524:b480 with SMTP id ffacd0b85a97d-3a09402cacbmr5066376f8f.2.1746181699723;
        Fri, 02 May 2025 03:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWyOVTRRGEVNWXO/iDfooNor6IST3SO4x3a3xxs7csOvOKwxwfMPv7xS3Tnv2MrR9Li9kpkg==
X-Received: by 2002:a05:6000:1a85:b0:3a0:8524:b480 with SMTP id ffacd0b85a97d-3a09402cacbmr5066344f8f.2.1746181699348;
        Fri, 02 May 2025 03:28:19 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:246d:aa10::f39? ([2a0d:3344:246d:aa10::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad784asm85337125e9.7.2025.05.02.03.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 03:28:18 -0700 (PDT)
Message-ID: <74e11512-934b-446c-94cf-93bf97eff9fb@redhat.com>
Date: Fri, 2 May 2025 12:28:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] selftests/vsock: add initial vmtest.sh for
 vsock
To: Stefano Garzarella <sgarzare@redhat.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Shuah Khan <shuah@kernel.org>,
 kvm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20250428-vsock-vmtest-v3-1-181af6163f3e@gmail.com>
 <a57wg5kmprrpk2dm3zlzvegb3gzj73ubs5lxeukyinc4edlcsw@itkgfcm44qu2>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <a57wg5kmprrpk2dm3zlzvegb3gzj73ubs5lxeukyinc4edlcsw@itkgfcm44qu2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/25 3:06 PM, Stefano Garzarella wrote:
> On Mon, Apr 28, 2025 at 04:48:11PM -0700, Bobby Eshleman wrote:
>> This commit introduces a new vmtest.sh runner for vsock.
>>
>> It uses virtme-ng/qemu to run tests in a VM. The tests validate G2H,
>> H2G, and loopback. The testing tools from tools/testing/vsock/ are
>> reused. Currently, only vsock_test is used.
>>
>> VMCI and hyperv support is automatically built, though not used.
>>
>> Only tested on x86.
>>
>> To run:
>>
>>  $ tools/testing/selftests/vsock/vmtest.sh
> 
> I tried and it's working, but I have a lot of these messages in the
> output:
>      dmesg: read kernel buffer failed: Operation not permitted
> 
> I'm on Fedora 41:
> 
> $ uname -r
> 6.14.4-200.fc41.x86_64

This sounds like the test tripping on selinux. I think this problem
should not be handled by the script itself.

[...]
> ERROR: trailing whitespace
> #174: FILE: tools/testing/selftests/vsock/vmtest.sh:47:
> +^Ivm_server_host_client^IRun vsock_test in server mode on the VM and in client mode on the host.^I$
> 
> WARNING: line length of 104 exceeds 100 columns
> #174: FILE: tools/testing/selftests/vsock/vmtest.sh:47:
> +	vm_server_host_client	Run vsock_test in server mode on the VM and in client mode on the host.	
> 
> ERROR: trailing whitespace
> #175: FILE: tools/testing/selftests/vsock/vmtest.sh:48:
> +^Ivm_client_host_server^IRun vsock_test in client mode on the VM and in server mode on the host.^I$
> 
> WARNING: line length of 104 exceeds 100 columns
> #175: FILE: tools/testing/selftests/vsock/vmtest.sh:48:
> +	vm_client_host_server	Run vsock_test in client mode on the VM and in server mode on the host.	
> 
> ERROR: trailing whitespace
> #176: FILE: tools/testing/selftests/vsock/vmtest.sh:49:
> +^Ivm_loopback^I^IRun vsock_test using the loopback transport in the VM.^I$
> 
> ERROR: trailing whitespace
> #443: FILE: tools/testing/selftests/vsock/vmtest.sh:316:
> +IFS="^I$
> 
> total: 4 errors, 4 warnings, 0 checks, 382 lines checked
> 
I almost forgot: I think it's better to avoid the special formatting and
replies on review for proper updating of the script's help.

Thanks,

Paolo

