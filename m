Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BC4286D61
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748438893; cv=none; b=dtyZq5d0Qj0dojRgnrA7rDW8DZyVmPdnmW8O6L7w3k24HJ8go/vhba17QhLgBuCjaNYXWNV3aubeQ3Y+JGi3QWtwynJ2lRtweiQNPWdGhr408qLvHnkb0zHau12ovAza78WBRfztuEHKcv9kgFk6NjCex4KXvTAsw8Mhw7WeRbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748438893; c=relaxed/simple;
	bh=U8qomunlThM/3D2+2iMrsHuOsKr3NIw4n9pmpjV816I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgRKvWhpEYa6BOwUOjA0zl+PAJzWYCrXkCirVQ1l3ZHAOjjsOA1kQGCp/u5udQdqnIfCbSFK0wLxoVWE8aEaLDHp9tdfcWAfoxLzG81lQtywznduv5oTlgyvwhDEyMTIAB01sidvEtifd+tRhuo3LQVEAMawggH8dV8hJDDQtTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WqKNbQGq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WqKNbQGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748438891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQ9g5LYyLjb8/iVLB1DcVfsrw8TL+AlPQukLnrUz7KA=;
	b=WqKNbQGqXHMPojkzFZzexUioP1T1hLWNGueHBZ39Y5EKlXQfutHKiRBDgYf6ZLZ1yHjHKk
	O4qiWI96m6jaS4EsMY7kkpOfFeS34UtD9WjX2tZu0dcNHYuQy2MYFQxz16DC8udILZ7ZKM
	4g2aqO7CmMUwMZvjOSUDlN66rbdk7dI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-NEXDybS5MAugasUiXeF77Q-1; Wed, 28 May 2025 09:28:09 -0400
X-MC-Unique: NEXDybS5MAugasUiXeF77Q-1
X-Mimecast-MFC-AGG-ID: NEXDybS5MAugasUiXeF77Q_1748438889
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4ee113461so32142f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748438888; x=1749043688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ9g5LYyLjb8/iVLB1DcVfsrw8TL+AlPQukLnrUz7KA=;
        b=pIrcqQROPKvM8DO2dETgMEklIoAOj+S+cU35P44f+wzskIhH3wzXfk8n9hHFPUBDlY
         uhbDzXxx8ufnAyX1vrDFEABVdgRulEpVkVV4ayi5mFHifiVN6I1fMz5TVAa++IN1JqVK
         YTTq4CY0wuSNEtgxFK0mPqz9Sy89xyRIdx0/fehD2fuffMwlcX9C1alqi0BcI4tEIXKF
         4WdsHnpBiYIWvnrV8B7BWpDRgOGdwlozrJj26jq1FDs9r97rfVvWB0RTRFJynevQ9vws
         FgRUnGEffgRkBvVRZr/CRdhBbMokAKp7oVa5n6cezuxaQrDnOoaZ61auq8No90Slct6H
         +7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuvfWKJDfBr8e6lEvG3m+KS2I83WU9YWQI9BRGW8uk0l3zOxVNVtQSvlAZdxewjERuJnVTI4fI6FDBUcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOgMue9QQcZ/l/JMYCUh4B/ji5j2NyIVJy2Lt/lXCjFn9w0WC8
	IHPiCCx8d6UcVWGPL2Yea/q5IdSXTAoDmqz3gSvpXqShG5DqoY0OAQRetAW1pZGb3LkXqeJXsuA
	jAjrtTQgNLHfEON0BqE7lV1ql4iS5h+HJb0iIkD4zTrg9yJKuwJfKPswWsuebUwhwGA==
X-Gm-Gg: ASbGncv+wBnGZUQAuBv2BilAJ4bmT6k7Mz1CuZUN6KQNZICxaZnSCD5MsyPToimoBCu
	STpKIpMn2Wvk0Tk5VXqcxeD5WWPp9WYRRanrsXE3DEuWpixBpLXEePxAdhuDxoqXtjpkxLePmgi
	HF5g30r2ZHD4EYdLPvR2NHELEjUfc/R36SwEiOqpsnNSphhSebZOCG89NgTgr3EAzoeeN6lUgDQ
	gv7B2lTHnmGCkUt8Yk3t60zVjk/9nArIOLrIhVNhhyzr1rmL+1TtyneFf6MSSCZWmylAAuRG+rv
	IDYwYEKJLWlXN0bNGrG/lE7ZdoiOwnpR0h8+N9Fs+Gsxk5FHN5m/fg==
X-Received: by 2002:a05:6000:250f:b0:3a4:eac6:e320 with SMTP id ffacd0b85a97d-3a4eac6e4cfmr2302679f8f.3.1748438888527;
        Wed, 28 May 2025 06:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbyayzrF6O0WPxMeyUA9UrtC3EPJ8bgX9wDZpJ1+cDqAh15SKbYxky+R1yioFLQpmt8Yx37g==
X-Received: by 2002:a05:6000:250f:b0:3a4:eac6:e320 with SMTP id ffacd0b85a97d-3a4eac6e4cfmr2302654f8f.3.1748438888177;
        Wed, 28 May 2025 06:28:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45072555885sm17994055e9.17.2025.05.28.06.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 06:28:07 -0700 (PDT)
Message-ID: <92c7e99c-5574-422c-92f1-62d5cde58fec@redhat.com>
Date: Wed, 28 May 2025 15:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/9] KVM: Enable Nested Virt selftests
Content-Language: en-US
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, seanjc@google.com,
 darren@os.amperecomputing.com
References: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ganapatrao,

On 5/12/25 12:52 PM, Ganapatrao Kulkarni wrote:
> This patch series makes the selftest work with NV enabled. The guest code
> is run in vEL2 instead of EL1. We add a command line option to enable
> testing of NV. The NV tests are disabled by default.

For commodity, I would add in the coverletter that for all tests
enhanced with vEL2 testing "-g 1" option shall be added to force that mode.

I don't really get how you chose tests capable to run at vEL2 and
excluded others? Wouldn't it make sense to have a way to run all tests
in either mode?

Thanks

Eric

> 
> Modified around 12 selftests in this series.
> 
> Changes since v1:
> 	- Updated NV helper functions as per comments [1].
> 	- Modified existing testscases to run guest code in vEL2.
> 
> [1] https://lkml.iu.edu/hypermail/linux/kernel/2502.0/07001.html 
> 
> Ganapatrao Kulkarni (9):
>   KVM: arm64: nv: selftests: Add support to run guest code in vEL2.
>   KVM: arm64: nv: selftests: Add simple test to run guest code in vEL2
>   KVM: arm64: nv: selftests: Enable hypervisor timer tests to run in
>     vEL2
>   KVM: arm64: nv: selftests: enable aarch32_id_regs test to run in vEL2
>   KVM: arm64: nv: selftests: Enable vgic tests to run in vEL2
>   KVM: arm64: nv: selftests: Enable set_id_regs test to run in vEL2
>   KVM: arm64: nv: selftests: Enable test to run in vEL2
>   KVM: selftests: arm64: Extend kvm_page_table_test to run guest code in
>     vEL2
>   KVM: arm64: nv: selftests: Enable page_fault_test test to run in vEL2
> 
>  tools/testing/selftests/kvm/Makefile.kvm      |   2 +
>  tools/testing/selftests/kvm/arch_timer.c      |   8 +-
>  .../selftests/kvm/arm64/aarch32_id_regs.c     |  34 ++++-
>  .../testing/selftests/kvm/arm64/arch_timer.c  | 118 +++++++++++++++---
>  .../selftests/kvm/arm64/nv_guest_hypervisor.c |  68 ++++++++++
>  .../selftests/kvm/arm64/page_fault_test.c     |  35 +++++-
>  .../testing/selftests/kvm/arm64/set_id_regs.c |  57 ++++++++-
>  tools/testing/selftests/kvm/arm64/vgic_init.c |  54 +++++++-
>  tools/testing/selftests/kvm/arm64/vgic_irq.c  |  27 ++--
>  .../selftests/kvm/arm64/vgic_lpi_stress.c     |  19 ++-
>  .../testing/selftests/kvm/guest_print_test.c  |  32 +++++
>  .../selftests/kvm/include/arm64/arch_timer.h  |  16 +++
>  .../kvm/include/arm64/kvm_util_arch.h         |   3 +
>  .../selftests/kvm/include/arm64/nv_util.h     |  45 +++++++
>  .../selftests/kvm/include/arm64/vgic.h        |   1 +
>  .../testing/selftests/kvm/include/kvm_util.h  |   3 +
>  .../selftests/kvm/include/timer_test.h        |   1 +
>  .../selftests/kvm/kvm_page_table_test.c       |  30 ++++-
>  tools/testing/selftests/kvm/lib/arm64/nv.c    |  46 +++++++
>  .../selftests/kvm/lib/arm64/processor.c       |  61 ++++++---
>  tools/testing/selftests/kvm/lib/arm64/vgic.c  |   8 ++
>  21 files changed, 604 insertions(+), 64 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c
>  create mode 100644 tools/testing/selftests/kvm/include/arm64/nv_util.h
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/nv.c
> 

