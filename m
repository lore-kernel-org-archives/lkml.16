Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287D213A41F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867257; cv=none; b=Y2CBQYFXxWaS0Bq89k2XugSbSr7ve0M0QWriu7r5wDqtLWieHpPrJfxv3P8tyhrZdFaQ53/GoxmLUWUri+P4D5IT3E6KclYNUnpGNaGao7yqc+SjSRPkUKKRdDz/N4WKxVLfI89s5q9EQgdsTWZ/Fdi2m8sgZnqxxFFhIbWydkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867257; c=relaxed/simple;
	bh=FQFAU8J92YBJOIwviIOuWy+syYqT13CticcqgFA8fNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pd4WDaYCEESHgdvguJ02HnKs2DGVubzmkEWMtGk93/f3dRgC7SQQRQsmit15ESywqYn6NdbJSjOamB0Ni6uBGbB117e0qEdtRNvm4WcjmLbulKu0iysgPjMjZyqLoLvmSuQ8hgWwNnuHiXeCPGPL1eMB+EXi8aAGetTbpkHMYfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a7B3pRNo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a7B3pRNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750867254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fVPSomnM/XHJegYDF8a486UxXjZV1B4u2XNVJqXqkPE=;
	b=a7B3pRNojcHM5XoOdE8P3HySAH5o6sqaC++BP18mt2N6n2Khw9orKHmyIQ89UyyINKy1UZ
	MN3YTHpi5kPfk6AiriaKhoFl8dGIWcP9tR4QBa9MMJVLCQxU4BC323HHkg7Yl18Nomy7Ua
	O0ZPW06dtEAWCWE5AOQKzAFc4XS0jV0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-H3qHQWxOOQWP5X8_nEJlKQ-1; Wed, 25 Jun 2025 12:00:51 -0400
X-MC-Unique: H3qHQWxOOQWP5X8_nEJlKQ-1
X-Mimecast-MFC-AGG-ID: H3qHQWxOOQWP5X8_nEJlKQ_1750867250
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so875366f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867250; x=1751472050;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVPSomnM/XHJegYDF8a486UxXjZV1B4u2XNVJqXqkPE=;
        b=ILOBRRQq+FuLeDoR6J2wYgJZXdYYT21zmM3pY1oMlrJn7tdw8Yujxg1kjREat64h2S
         yHgTgAwTXocTaC8F8otfw+O0xtHCOpqHuAkeZ/BaWTJ3zILeiqCdliJEy1pmZ/OoWm9m
         ++JgXlGB++V6ZDo2rY7G6D6LcFBvf5jQWVSk9Kq95mpDAU+Lrqlagg/3L7GvVGkBouFP
         hgtVR+SbijHPprhUUQC7JE5A9poM2lYuaXFZkLgW81E3iF+dAWnHgecjOT+lbnR8iK4v
         91f7GoSJcJd8FbaKjCrZiuzuI0PN2GLKz1a+xE8/00tf1qybkBVV85r6jTedXDwn+bpw
         G+Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUq0xPQPfmVkdmtxhioIGzrUaRYk2jSzqJk5u/QsshBMVObhKaZ3upVtpHBzVMzhcUko5LWbmhzWQ5++RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN2WG9D3NWRenPbMlgprZzTagtCXo2JO9NowRkV5ysQmqFxGsV
	YU44ZBO+UPHrhhl/zIlA7N9NCCceZu1NhxNKcnPlEzFyNUkhARNqN4kjpsAxdMUqpNFOC7IYQn+
	QmhZhOxSDjVc2Xry8IwQ58yyZ1Jpk9I8p5GrJZ4ypri6Wp8PK8IHKLcKifPpvj5Ur8A==
X-Gm-Gg: ASbGnctfbbiY7mg/+x/wGVnAmrqg+xdwlS2F8kCUDIXfhe7CQJyfNTlNfnbE8va5KbZ
	YE1A9nOnOhSo7B9z51i+ceSdB/KJRbe3EKJ0SZR4OH98vauuGiCdCmLpFsKuHUc1S5NOSMxT/37
	t6+Cn9aOn2jrKfSDHndgsIOCgqvsIBgmHr81z4O9gov/nSEjeux+wwFB7C3E69VH2t1ymHQBDsr
	jsJqUbO7gNBD8yRsQZqzSweRrkSaakMjty27YPxgtt7uUxAd0l7Gxot7DEmSJ84D9gNEifvZPI5
	JtrhIG4Iy0RVWcysYQ==
X-Received: by 2002:a05:6000:200d:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3a6ed66464dmr3440595f8f.35.1750867249888;
        Wed, 25 Jun 2025 09:00:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx8ud9+gtyW7duD6Uk77aUjb1DTQPtQAWhhJNwbC5QYNwTl1QD0WHHRtck+a2LtJywDfOJBg==
X-Received: by 2002:a05:6000:200d:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3a6ed66464dmr3440529f8f.35.1750867249336;
        Wed, 25 Jun 2025 09:00:49 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805dc00sm5135456f8f.31.2025.06.25.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:00:48 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Manuel Andreas <manuel.andreas@tum.de>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com
Subject: Re: [PATCH] x86/hyper-v: Filter non-canonical addresses passed via
 HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST(_EX)
In-Reply-To: <c090efb3-ef82-499f-a5e0-360fc8420fb7@tum.de>
References: <c090efb3-ef82-499f-a5e0-360fc8420fb7@tum.de>
Date: Wed, 25 Jun 2025 18:00:47 +0200
Message-ID: <87plerolow.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Andreas <manuel.andreas@tum.de> writes:

> In KVM guests with Hyper-V hypercalls enabled, the hypercalls 
> HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST and HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX 
> allow a guest to request invalidation of portions of a virtual TLB.
> For this, the hypercall parameter includes a list of GVAs that are supposed 
> to be invalidated.
>
> However, when non-canonical GVAs are passed, there is currently no 
> filtering in place and they are eventually passed to checked invocations of 
> INVVPID on Intel / INVLPGA on AMD.
> While the AMD variant (INVLPGA) will silently ignore the non-canonical 
> address and perform a no-op, the Intel variant (INVVPID) will fail and end 
> up in invvpid_error, where a WARN_ONCE is triggered:
>
> invvpid failed: ext=0x0 vpid=1 gva=0xaaaaaaaaaaaaa000
> WARNING: CPU: 6 PID: 326 at arch/x86/kvm/vmx/vmx.c:482 
> invvpid_error+0x91/0xa0 [kvm_intel]
> Modules linked in: kvm_intel kvm 9pnet_virtio irqbypass fuse
> CPU: 6 UID: 0 PID: 326 Comm: kvm-vm Not tainted 6.15.0 #14 PREEMPT(voluntary)
> RIP: 0010:invvpid_error+0x91/0xa0 [kvm_intel]
> Call Trace:
>   <TASK>
>   vmx_flush_tlb_gva+0x320/0x490 [kvm_intel]
>   ? __pfx_vmx_flush_tlb_gva+0x10/0x10 [kvm_intel]
>   ? kfifo_copy_out+0xcf/0x120
>   kvm_hv_vcpu_flush_tlb+0x24f/0x4f0 [kvm]
>   ? __pfx_kvm_hv_vcpu_flush_tlb+0x10/0x10 [kvm]
>   ? kvm_pmu_is_valid_msr+0x6e/0x80 [kvm]
>   ? kvm_get_msr_common+0x219/0x20f0 [kvm]
>   kvm_arch_vcpu_ioctl_run+0x3013/0x5810 [kvm]
>   /* ... */
>
> Hyper-V documents that invalid GVAs (those that are beyond a partition's 
> GVA space) are to be ignored. While not completely clear whether this 
> ruling also applies to non-canonical GVAs, it is likely fine to make that 
> assumption.

I wrote a simple test and ran it on Azure. Unless I screwed up, the
result confirms this assumption. The test was:

#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */

struct hv_tlb_flush {    /* HV_INPUT_FLUSH_VIRTUAL_ADDRESS_LIST */
        u64 address_space;
        u64 flags;
        u64 processor_mask;
        u64 gva_list[];
} __packed;

static inline u64 __hyperv_hypercall(u64 control, u64 input_address,
                                     u64 output_address)
{
	u64 res;

        asm volatile("mov %[output_address], %%r8\n\t"
                     "vmcall"
                     : "=a" (res),
                       "+c" (control), "+d" (input_address)
                     : [output_address] "r"(output_address)
                     : "cc", "memory", "r8", "r9", "r10", "r11");

	return res;
}

int init_module(void)
{
	u64 rcx = 0x0003UL | 1UL << 32; /* 1 rep */
	u64 status;
	struct hv_tlb_flush *flush = (struct hv_tlb_flush *)kzalloc(4096, GFP_KERNEL);
	void *out = kzalloc(4096, GFP_KERNEL);

	flush->flags = 0x3; /* all CPUS all address spaces */
	flush->processor_mask = 0x1;
	flush->gva_list[0] = 0xaaaaaaaaaaaaa000;

	status = __hyperv_hypercall(rcx, __pa(flush), __pa(out));

	printk("Flush result: %llx\n", status);

	kfree(flush);
	kfree(out);

	return -1;
}

void cleanup_module(void)
{
}

MODULE_LICENSE("GPL");

And the result of loading this module is:

[ 4228.888451] Flush result: 100000000

(1 in bit 32 means 1 rep completed, lower 16 bits == 0 indicate
HV_STATUS_SUCCESS).

>
> The following patch addresses the issue by skipping non-canonical GVAs 
> before calling the architecture-specific invalidation primitive.
> I've validated it against a PoC and the issue seems to be fixed.
>
> Signed-off-by: Manuel Andreas <manuel.andreas@tum.de>
> Suggested-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>   arch/x86/kvm/hyperv.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index 24f0318c50d7..644a7aae6dab 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -1979,6 +1979,9 @@ int kvm_hv_vcpu_flush_tlb(struct kvm_vcpu *vcpu)
>   		if (entries[i] == KVM_HV_TLB_FLUSHALL_ENTRY)
>   			goto out_flush_all;
>
> +                if (is_noncanonical_invlpg_address(entries[i], vcpu))
> +                        continue;
> +
>   		/*
>   		 * Lower 12 bits of 'address' encode the number of additional
>   		 * pages to flush.

-- 
Vitaly

