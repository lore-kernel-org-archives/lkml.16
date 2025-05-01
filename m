Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC48AD4B
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 02:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746068258; cv=none; b=EmFeiPCrbanXZjf5dyKhM12rzElzilkqbIGhORUzHuqkVHPM+j2qgxzvBTZ3a4tcKiFaEmAt5z+GTaP0Rovc3KZ6GEm3+2f0ZO0xHQj+9ErX5GIX/lsSI68sVF/b1u6NtJrzXvHNmeYrDDPuazovvZe3gEc2gPQESaUHVm9Vy7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746068258; c=relaxed/simple;
	bh=pxth/1xDNWc+yIhoqkRG3JLP0W+Nj7wVL5JFRfk8L2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlJnnTL/QDVpj5IuV5Nchhr/tGVnftytJGKnMTM+t0VGGCO/D+A1gxWMjMl92ngh0pSxJnAgCPUocql+/nyB8fjOe52v0tVY1myQYjr0+UwdWrUefcvky6cpcB/VhX/FBvuCcHuGmEuNVMQJDXWHClJPqKOvtFTNAnd4r9YqnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P3TlGLMI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P3TlGLMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746068255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=adT5sphxyEt5TU22Dqx/wn9ELnNmdh1UTMCrVtoQyks=;
	b=P3TlGLMIAJmcvR/1JXZmmq1+CG2k0dS41Hqr2MFkJhrHZeh7JsyNGl5tIh/hgVDzYJ1oLx
	GaqBe4HzBUtioptdaQ8kgQCS+cO0gIibTIXVMHLdE4IHUBHW+whozW7FibHZ3H85qDUkBf
	V/lXBXrNipgO2tGj5tKzF1EdhMGsmAw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-OOZIo7xpM_-i27vjHuZibQ-1; Wed, 30 Apr 2025 22:57:34 -0400
X-MC-Unique: OOZIo7xpM_-i27vjHuZibQ-1
X-Mimecast-MFC-AGG-ID: OOZIo7xpM_-i27vjHuZibQ_1746068253
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso391947a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:57:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746068253; x=1746673053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adT5sphxyEt5TU22Dqx/wn9ELnNmdh1UTMCrVtoQyks=;
        b=ir63RudGI5ZHpNASbW6o5P2AVQ7GKuukU9JDFCa5/49qG/0ZjzsGANKTc0aSYnrKB/
         hB7OwVeslrD2jfKmalJjuNkfTDSok0UZtN+7OoQKImcY4rMCNTBy8efRf4Ids53e+CFr
         Wz75l8tQI9OcZljhcAE/GMqczhCxE5E4116INd7IDbjqmZtiobB8BZhy7coBvFPWApat
         LGNzRFyGzNiOrudu513rqxOOARqLPkYmsmot+O0LeaqpGoi7sffWikmMtHKn7zTcB6QO
         NqALbc/5T2Koc9v+x8Osw9YSM0HpL4oSft4wo2HKKMOQ+UaIFDIMH0uYgrP44EOqSd6L
         wgiw==
X-Forwarded-Encrypted: i=1; AJvYcCX5UCpGjczE42BfHi84qk77OaiYoHuQSHOu1AlPy1RBRvTGRsbZa74dIF+zXUtFiF8v1pNkLftWvfnf/1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYgOr9x2qvsKi3W32vcoqnyEPeToQBHfqB6OMWWOcximV2G6i
	wLEfmx0rtO2YJuGtJOGgK1EpmlHlF1CaYVtXAZ55fzt25XnOUP2wbqn/XJxGYHKlhhDmofjs49l
	XEF1jbt7R1soMjr2wO8OYxNVTYpePg5kHizppSRyzhC/bCafFbxTeg8GQuSucvQ==
X-Gm-Gg: ASbGnctGWaQx4m/h1Go1XoQ8FzBe1B4PHWovlxMa7S2NRxCHd+aDCC7aHd7+6XsC8Kz
	hNBebHJnopyzqp5bC/08EZV15uQzADsuiR2eWzxEyuATMw9RXN/RYX8CgWElJ6I50V9TgvTBHQc
	ZlxYB0cd++zsK6YuXdu/XMISGHuREcXcFbKS+CCSnEXz3D12lexroKpsCAFhSyHeYlHFquTgCjS
	Jax8I2AIxCVoha8+CoBXDzNOJblpevmQ6EVLysAGZEJwbhsqr3T9xhX4qzXBr3sdr8+T7EvUXQ2
	KBmFaCBXpcyF
X-Received: by 2002:a05:6a21:9982:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-20bdcd9a950mr1117796637.15.1746068253313;
        Wed, 30 Apr 2025 19:57:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbH4/Gw3xjrMySuSbtOSRK/2O61f3IZwIB6ICzlmAJxo3vX/hkeDxt9OR3pskpgqpIhEiucg==
X-Received: by 2002:a05:6a21:9982:b0:1fe:8f7c:c8e with SMTP id adf61e73a8af0-20bdcd9a950mr1117766637.15.1746068253021;
        Wed, 30 Apr 2025 19:57:33 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740398f9786sm2578662b3a.15.2025.04.30.19.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 19:57:32 -0700 (PDT)
Message-ID: <afe9167c-8867-4e5f-8c0b-eb8d6b2813e1@redhat.com>
Date: Thu, 1 May 2025 12:57:24 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 27/43] arm64: RME: support RSI_HOST_CALL
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-28-steven.price@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-28-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 11:41 PM, Steven Price wrote:
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Forward RSI_HOST_CALLS to KVM's HVC handler.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v7:
>   * Avoid turning a negative return from kvm_smccc_call_handler() into a
>     error response to the guest. Instead propogate the error back to user
>     space.
> Changes since v4:
>   * Setting GPRS is now done by kvm_rec_enter() rather than
>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>     enter/exit). This fixes a bug where the registers set by user space
>     were being ignored.
> ---
>   arch/arm64/kvm/rme-exit.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

