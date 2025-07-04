Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDD21F03D8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 04:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751605111; cv=none; b=F8K8B0YUTEwUMsq4KSVUfmhFabgCEs+kIjFZGvwXiBdZ9DdxCxbXNaJtRud2B5VvrD6n2h3/WC0g7U2jkG1Yd1RLdDL0UMdeqYYfogy77LJDZfVr0xG2WWmAYZHzpx8QTYlpq8fafSLXn/6OiqCbdKj+TO746l27xMc6X8olbL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751605111; c=relaxed/simple;
	bh=SR78OUN999y80a2xAo+6NpCQXfueXEeGFkK75F8f5CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCKHBxKbaOWVCW6OQs5OEO837F63xOzKP1yAmfgKjFpj58IzwfqRzmhyb+6Y1OQrkKK5QenXRgeG+XXdTZdtaaQ5mkCEYPjU5/99hBT8CDvQ8UP1fn52iYYbcwkx71PCzOdBLOjGwvoadaciY0ninrhXYVbeMf6kRYzZrVmWjA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fnEWtObe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fnEWtObe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751605109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWA9x7qhxNW2l1p6ltGUfCp8OmCZaJaVxhg1nTkJ0sU=;
	b=fnEWtObehH10RwroaE+OuBGkZulvKz70hNdLpaMCc60qCerd1fGUrXmuVeVUCl+nm5DEc2
	4PLZCJhbAeznXWoAKfm+cY82ikzbaxfj0wcXpp+PLybOa4vaobCzRr8MkRrAD0+Fafx6kX
	cuyadECvL9xC5iI9HfJ3mlQler8OqB4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-Yiqb6NWaPZ2rRphIdOzB9Q-1; Fri, 04 Jul 2025 00:58:26 -0400
X-MC-Unique: Yiqb6NWaPZ2rRphIdOzB9Q-1
X-Mimecast-MFC-AGG-ID: Yiqb6NWaPZ2rRphIdOzB9Q_1751605104
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7425efba1a3so675615b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 21:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751605104; x=1752209904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWA9x7qhxNW2l1p6ltGUfCp8OmCZaJaVxhg1nTkJ0sU=;
        b=wTMC6oxQUvVmQCMNLFVFfIgDM6knZorWHJmHaHo42Yt/ud+uf8XNK9zxo0KmRmToqD
         61yoiuG9oQkL8ArVXwKUr01XRMAZG9+cc7XN9yqp7+kbedA4xJW9SkKPZGRvFT2KVYj7
         h68A/VKWUVrx+Up/MfYzK2VjjexspVvEbDGqHvGlLSFO0NJqz6KmDmrTlI5pG95IBpRo
         etybX652OBjDIUYnx/Vfj3BV0O7DBBXE0n9BxIRmaaZdwSS8JNivirllhJ0ndmq/rSke
         4wxopZKubaa9OqIRFP+NDc+6YYp3JUfhOAm/nFrtmL9BjKxhXuRj996jjxV36ErI/fqp
         265A==
X-Forwarded-Encrypted: i=1; AJvYcCVK5n73FDzmoBpqA8MvhrxHXwD2MTZR107OgeDVIbeh9vmS9k9ps8J0ZXV1zz0cGH4zPcJqSno1KtZsci8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfrn0m7i++V2wfor7YwzoYGqGJic1a9oWILCUgVV+3mv9JblSM
	8EQ6a/M5ejVO0UlbMcY1ENHin/sQwWy67f9pvNFlKYspRSoOzyk//ARVWBKyg9Rv/gQBf5RWxbi
	D4wVSGeXCXmwmfWBcHmVQpf3MyCklNXigE59bI0Ip32qlcYvIrvv+Mcixy6AYiHjTGw==
X-Gm-Gg: ASbGnctMQ+ecSpcec8FRG8srq2WH/VBoM/1XTJxEHdTY7p9HZtQ0QzLmtSTAB1OyjuS
	b/m379HN/m0vWIc23Qd3IE63U4xqIOh7W3MmY1jdKq+c1AHalCEVWWWc7YP5KAfZuNnO7HLSd7d
	qIA3EOzWW2fba7wQOzRfrhpVh5U63ZyJBsanvKzUJq+W6AOiV+DMg+Y9gTS7NmyEOk6ZDmMjnMC
	eWWdYVGx0R54I30ahGh9GrZX5hHNFs48KaKQ8rXCeo0O7HPqehnNotUtcVab062HZjz3CQflTro
	4Mog8QGc1ebX/b+mjCSdo05Hx1x13basmgmLpToNkBlsoCAfkNOjR3lfq+f+gQ==
X-Received: by 2002:a05:6a00:18a1:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-74ce5f38772mr2112080b3a.2.1751605104454;
        Thu, 03 Jul 2025 21:58:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF5wv+DE6Xrth2Z9dMtx7SbYzBfl2e7NF0on99f9M31vN5qmwp6uCO7D9ntAdPIgA97WcR6g==
X-Received: by 2002:a05:6a00:18a1:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-74ce5f38772mr2112052b3a.2.1751605103850;
        Thu, 03 Jul 2025 21:58:23 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cc32fsm1076594b3a.52.2025.07.03.21.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 21:58:22 -0700 (PDT)
Message-ID: <0ef9c9bf-70df-47fb-976b-acf6bff4ca3a@redhat.com>
Date: Fri, 4 Jul 2025 14:58:13 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/43] arm64: Support for Arm CCA in KVM
To: "Emi Kisanuki (Fujitsu)" <fj0570is@fujitsu.com>,
 'Steven Price' <steven.price@arm.com>,
 "'kvm@vger.kernel.org'" <kvm@vger.kernel.org>,
 "'kvmarm@lists.linux.dev'" <kvmarm@lists.linux.dev>
Cc: 'Catalin Marinas' <catalin.marinas@arm.com>,
 'Marc Zyngier' <maz@kernel.org>, 'Will Deacon' <will@kernel.org>,
 'James Morse' <james.morse@arm.com>, 'Oliver Upton'
 <oliver.upton@linux.dev>, 'Suzuki K Poulose' <suzuki.poulose@arm.com>,
 'Zenghui Yu' <yuzenghui@huawei.com>,
 "'linux-arm-kernel@lists.infradead.org'"
 <linux-arm-kernel@lists.infradead.org>,
 "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
 'Joey Gouly' <joey.gouly@arm.com>,
 'Alexandru Elisei' <alexandru.elisei@arm.com>,
 'Christoffer Dall' <christoffer.dall@arm.com>,
 'Fuad Tabba' <tabba@google.com>,
 "'linux-coco@lists.linux.dev'" <linux-coco@lists.linux.dev>,
 'Ganapatrao Kulkarni' <gankulkarni@os.amperecomputing.com>,
 'Shanker Donthineni' <sdonthineni@nvidia.com>,
 'Alper Gun' <alpergun@google.com>,
 "'Aneesh Kumar K . V'" <aneesh.kumar@kernel.org>
References: <20250611104844.245235-1-steven.price@arm.com>
 <TYXPR01MB1886280D98B07E971424D62BC37BA@TYXPR01MB1886.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <TYXPR01MB1886280D98B07E971424D62BC37BA@TYXPR01MB1886.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 11:51 AM, Emi Kisanuki (Fujitsu) wrote:
> We tested this patch in our internal simulator which is a hardware simulator for Fujitsu's next generation CPU known as Monaka. and it produced the expected results.
> 
> I have verified the following
> 1. Launching the realm VM using Internal simulator -> Successfully launched by disabling MPAM support in the ID register.
> 2. Running kvm-unit-tests (with lkvm) -> All tests passed except for PMU (as expected, since PMU is not supported by the Internal simulator).[1]
> 
> Tested-by: Emi Kisanuki <fj0570is@fujitsu.com> [1] https://gitlab.arm.com/linux-arm/kvm-unit-tests-cca cca/latest
> 

The series looks good to me in my test where the host runs in the environment
emulated by QEMU. With below components, the VM can be started, destroyed and
simple workloads can be running in the REALM guest.

Tested-by: Gavin Shan <gshan@redhat.com>

   host.tf-rmm    https://git.codelinaro.org/linaro/dcap/rmm.git
                  (cca/v8)
   host.edk2      git@github.com:tianocore/edk2.git
                  (edk2-stable202411)
   host.tf-a      https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a.git
                  (cca/v4)
   host.qemu      https://git.qemu.org/git/qemu.git
                  (stable-9.2)
   host.linux     https://git.gitlab.arm.com/linux-arm/linux-cca.git
                  (cca-host/v9)
   guest.qemu     https://git.codelinaro.org/linaro/dcap/qemu.git
                  (cca/latest)
   guest.kvmtool  https://gitlab.arm.com/linux-arm/kvmtool-cca
                  (cca/latest)
   guest.linux    upstream (v6.16.rc2)

Thanks,
Gavin

