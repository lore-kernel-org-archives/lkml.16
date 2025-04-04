Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C9199E94
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743761954; cv=none; b=YrnbQRVUDmI+gU3xJjq1tQo1R8Uzo56SjLniNF2O7HdcQDwP3jlksVPnjOOrP3ydUEbi5Mus4L5YlB7gGnFeFhgtc6j0x0dWZID+RyuC4kdpEsYch24pvoUs0OPqjQFvdz4DWnAb0MMKtGaSsPJGm9ELwR758j25xEbGnVXnHcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743761954; c=relaxed/simple;
	bh=DjanWa9dOaDgsh8G7LbaIX5NtQ8DUhKP5nXFfr/Smmo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uQVknPxZP1i3eRRuSRntpSmIBNOS2Q9TicWQw6IN2jnO/lTvqUCEyncDXvNqD7kOLE0IF/kmwElLDnKKr1WRhFqOZr876/i6YwjAXQU23pgzdkqF1XHMaEId64l+xNZJN1EtT2JdhNwln9yDcLBcqEkyecf4DyYLOFHk+OBCWfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P5cvcmdk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P5cvcmdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743761951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1h31gPbZBLLsuTR5n1snPscX7w6OFOorG4D3qCNodmc=;
	b=P5cvcmdkz4jgPkuwUTFh1/BA8RoJAgM0mug3v2OdzwCr/yTpa7OVi+LUgnXrD0iUaUypyw
	Ty1CFL/VOwKU/otTsxDmLgzQ6MHAmGAkh0KycLejQr7X/JxhguDNPRTAhWPeuRLsqOpiNS
	h2+korWSiLhVu2zWYjoJGQeiM/bXNlE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-ZV_c9iIJPKeSpAwTs2YO2g-1; Fri, 04 Apr 2025 06:19:10 -0400
X-MC-Unique: ZV_c9iIJPKeSpAwTs2YO2g-1
X-Mimecast-MFC-AGG-ID: ZV_c9iIJPKeSpAwTs2YO2g_1743761949
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5bde483cdso1739419a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743761948; x=1744366748;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1h31gPbZBLLsuTR5n1snPscX7w6OFOorG4D3qCNodmc=;
        b=w50xlh1LkmjRPqb0qqetYqmw1VvUMhPd7rD/TDfRsvcdzGt31SLZeDRiBwVUWd509W
         TetQ6UEOMwXwvb6Nh/32qmyjtQPz/P/1KWDDMf0sfJWwKuGLP5YyuZl+sunyU3O6/uqt
         gaKFR8MO4AbWWuj2z2wYzLJrwLMl8LQ+sIsRa8ncN2QYfIAdKYsRuaNhjFFs6YzoxKXU
         q3vpGd/YvPuQ1hRN5Xkqe07z3jxCJnUkwvGylq3loIYSIDuXi6tf0dM/p8XiP3xXL16t
         ZcOCCVrMVTwIbXPZpKTvtkOy2yvnM4U3g75/NFCvAdz4k7MBMvCPXHLHM4VS86AWxcu4
         3eww==
X-Gm-Message-State: AOJu0YyPu/3CMvqBo1gMkXU5ln5xAPMeOO36YqqCboHQMl5I0om7gGp3
	zK6YOVBuzB5E8HkpS1BOHdhi1IJC27F75+xVQz0kFuqNxPqkRxU2PEsmQy4vTb9i7y2X0P9s+XY
	HMi/AdYPTT3LxbD9QlwMzjHPeOdAhBxKJaV8Cw/OT+UC9xb/hmZqae47K3wWqiYMjw5Ted6pqD0
	7988Ny4s/YOvUzB9s58VeWFrbh52cQa9TnHkh7i8+KZXJzpg==
X-Gm-Gg: ASbGncvYA2AMqlDoHJZKdzO3kP0JcQEz/t/HYfQRFfKvfHAy4L6aU0Ok9EDIH0B8qTH
	uvkZZ+6kP6wW/LFpB/Od0J45SOmQjHgXIXviE6wC+ob+4Y9wmOwgLtySoKm1y4is39/I4sptQ5s
	7BOPPsvrFP7FKh3UZgoEHweHC7QNL2iRzfnj+U0Cj9y/7n00fn2T43aQEyUlpV61l8DaI2fqdt6
	qvFU33/iFVOtsVf5iPw/8bzjIAB8nDWhYN2ZumsuchQzPXSe4aQ0k1/ITvGnffoQYX8RpRhfLTR
	f17C2g+t1DzUN6wzjzcD
X-Received: by 2002:a17:907:7290:b0:ac7:81b5:7724 with SMTP id a640c23a62f3a-ac7d1776fdfmr271651966b.19.1743761948133;
        Fri, 04 Apr 2025 03:19:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrTRWP+6K5kxfZ4+YFYFIue1ZMYy6QaIsh1VgjubCYm9AMB6wPqUXbqRLuGZE+MJfrmIwlZQ==
X-Received: by 2002:a17:907:7290:b0:ac7:81b5:7724 with SMTP id a640c23a62f3a-ac7d1776fdfmr271650066b.19.1743761947643;
        Fri, 04 Apr 2025 03:19:07 -0700 (PDT)
Received: from [192.168.10.48] ([151.49.230.224])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7bfe9be51sm232805666b.50.2025.04.04.03.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 03:19:06 -0700 (PDT)
Message-ID: <c8573ad2-2865-4e67-afd2-3c4d272ac548@redhat.com>
Date: Fri, 4 Apr 2025 12:19:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kvm: revamp MONITOR/MWAIT tests
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: seanjc@google.com
References: <20250320165224.144373-1-pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250320165224.144373-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/25 17:52, Paolo Bonzini wrote:
> Run each testcase in a separate VMs to cover more possibilities;
> move WRMSR close to MONITOR/MWAIT to test updating CPUID bits
> while in the VM.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Queued now.

Paolo

> ---
>   .../selftests/kvm/x86/monitor_mwait_test.c    | 108 +++++++++---------
>   1 file changed, 57 insertions(+), 51 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/x86/monitor_mwait_test.c b/tools/testing/selftests/kvm/x86/monitor_mwait_test.c
> index 2b550eff35f1..390ae2d87493 100644
> --- a/tools/testing/selftests/kvm/x86/monitor_mwait_test.c
> +++ b/tools/testing/selftests/kvm/x86/monitor_mwait_test.c
> @@ -7,6 +7,7 @@
>   
>   #include "kvm_util.h"
>   #include "processor.h"
> +#include "kselftest.h"
>   
>   #define CPUID_MWAIT (1u << 3)
>   
> @@ -14,6 +15,8 @@ enum monitor_mwait_testcases {
>   	MWAIT_QUIRK_DISABLED = BIT(0),
>   	MISC_ENABLES_QUIRK_DISABLED = BIT(1),
>   	MWAIT_DISABLED = BIT(2),
> +	CPUID_DISABLED = BIT(3),
> +	TEST_MAX = CPUID_DISABLED * 2 - 1,
>   };
>   
>   /*
> @@ -35,11 +38,19 @@ do {									\
>   			       testcase, vector);			\
>   } while (0)
>   
> -static void guest_monitor_wait(int testcase)
> +static void guest_monitor_wait(void *arg)
>   {
> +	int testcase = (int) (long) arg;
>   	u8 vector;
>   
> -	GUEST_SYNC(testcase);
> +	u64 val = rdmsr(MSR_IA32_MISC_ENABLE) & ~MSR_IA32_MISC_ENABLE_MWAIT;
> +	if (!(testcase & MWAIT_DISABLED))
> +		val |= MSR_IA32_MISC_ENABLE_MWAIT;
> +	wrmsr(MSR_IA32_MISC_ENABLE, val);
> +
> +	__GUEST_ASSERT(this_cpu_has(X86_FEATURE_MWAIT) == !(testcase & MWAIT_DISABLED),
> +		       "Expected CPUID.MWAIT %s\n",
> +		       (testcase & MWAIT_DISABLED) ? "cleared" : "set");
>   
>   	/*
>   	 * Arbitrarily MONITOR this function, SVM performs fault checks before
> @@ -50,19 +61,6 @@ static void guest_monitor_wait(int testcase)
>   
>   	vector = kvm_asm_safe("mwait", "a"(guest_monitor_wait), "c"(0), "d"(0));
>   	GUEST_ASSERT_MONITOR_MWAIT("MWAIT", testcase, vector);
> -}
> -
> -static void guest_code(void)
> -{
> -	guest_monitor_wait(MWAIT_DISABLED);
> -
> -	guest_monitor_wait(MWAIT_QUIRK_DISABLED | MWAIT_DISABLED);
> -
> -	guest_monitor_wait(MISC_ENABLES_QUIRK_DISABLED | MWAIT_DISABLED);
> -	guest_monitor_wait(MISC_ENABLES_QUIRK_DISABLED);
> -
> -	guest_monitor_wait(MISC_ENABLES_QUIRK_DISABLED | MWAIT_QUIRK_DISABLED | MWAIT_DISABLED);
> -	guest_monitor_wait(MISC_ENABLES_QUIRK_DISABLED | MWAIT_QUIRK_DISABLED);
>   
>   	GUEST_DONE();
>   }
> @@ -74,56 +72,64 @@ int main(int argc, char *argv[])
>   	struct kvm_vm *vm;
>   	struct ucall uc;
>   	int testcase;
> +	char test[80];
>   
> -	TEST_REQUIRE(this_cpu_has(X86_FEATURE_MWAIT));
>   	TEST_REQUIRE(kvm_has_cap(KVM_CAP_DISABLE_QUIRKS2));
>   
> -	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> -	vcpu_clear_cpuid_feature(vcpu, X86_FEATURE_MWAIT);
> +	ksft_print_header();
> +	ksft_set_plan(12);
> +	for (testcase = 0; testcase <= TEST_MAX; testcase++) {
> +		vm = vm_create_with_one_vcpu(&vcpu, guest_monitor_wait);
> +		vcpu_args_set(vcpu, 1, (void *)(long)testcase);
> +
> +		disabled_quirks = 0;
> +		if (testcase & MWAIT_QUIRK_DISABLED) {
> +			disabled_quirks |= KVM_X86_QUIRK_MWAIT_NEVER_UD_FAULTS;
> +			strcpy(test, "MWAIT can fault");
> +		} else {
> +			strcpy(test, "MWAIT never faults");
> +		}
> +		if (testcase & MISC_ENABLES_QUIRK_DISABLED) {
> +			disabled_quirks |= KVM_X86_QUIRK_MISC_ENABLE_NO_MWAIT;
> +			strcat(test, ", MISC_ENABLE updates CPUID");
> +		} else {
> +			strcat(test, ", no CPUID updates");
> +		}
> +
> +		vm_enable_cap(vm, KVM_CAP_DISABLE_QUIRKS2, disabled_quirks);
> +
> +		if (!(testcase & MISC_ENABLES_QUIRK_DISABLED) &&
> +		    (!!(testcase & CPUID_DISABLED) ^ !!(testcase & MWAIT_DISABLED)))
> +			continue;
> +
> +		if (testcase & CPUID_DISABLED) {
> +			strcat(test, ", CPUID clear");
> +			vcpu_clear_cpuid_feature(vcpu, X86_FEATURE_MWAIT);
> +		} else {
> +			strcat(test, ", CPUID set");
> +			vcpu_set_cpuid_feature(vcpu, X86_FEATURE_MWAIT);
> +		}
> +
> +		if (testcase & MWAIT_DISABLED)
> +			strcat(test, ", MWAIT disabled");
>   
> -	while (1) {
>   		vcpu_run(vcpu);
>   		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
>   
>   		switch (get_ucall(vcpu, &uc)) {
> -		case UCALL_SYNC:
> -			testcase = uc.args[1];
> -			break;
>   		case UCALL_ABORT:
> -			REPORT_GUEST_ASSERT(uc);
> -			goto done;
> +			/* Detected in vcpu_run */
> +			break;
>   		case UCALL_DONE:
> -			goto done;
> +			ksft_test_result_pass("%s\n", test);
> +			break;
>   		default:
>   			TEST_FAIL("Unknown ucall %lu", uc.cmd);
> -			goto done;
> +			break;
>   		}
> -
> -		disabled_quirks = 0;
> -		if (testcase & MWAIT_QUIRK_DISABLED)
> -			disabled_quirks |= KVM_X86_QUIRK_MWAIT_NEVER_UD_FAULTS;
> -		if (testcase & MISC_ENABLES_QUIRK_DISABLED)
> -			disabled_quirks |= KVM_X86_QUIRK_MISC_ENABLE_NO_MWAIT;
> -		vm_enable_cap(vm, KVM_CAP_DISABLE_QUIRKS2, disabled_quirks);
> -
> -		/*
> -		 * If the MISC_ENABLES quirk (KVM neglects to update CPUID to
> -		 * enable/disable MWAIT) is disabled, toggle the ENABLE_MWAIT
> -		 * bit in MISC_ENABLES accordingly.  If the quirk is enabled,
> -		 * the only valid configuration is MWAIT disabled, as CPUID
> -		 * can't be manually changed after running the vCPU.
> -		 */
> -		if (!(testcase & MISC_ENABLES_QUIRK_DISABLED)) {
> -			TEST_ASSERT(testcase & MWAIT_DISABLED,
> -				    "Can't toggle CPUID features after running vCPU");
> -			continue;
> -		}
> -
> -		vcpu_set_msr(vcpu, MSR_IA32_MISC_ENABLE,
> -			     (testcase & MWAIT_DISABLED) ? 0 : MSR_IA32_MISC_ENABLE_MWAIT);
> +		kvm_vm_free(vm);
>   	}
> +	ksft_finished();
>   
> -done:
> -	kvm_vm_free(vm);
>   	return 0;
>   }

