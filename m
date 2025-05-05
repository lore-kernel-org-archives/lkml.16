Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921A34C85
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461117; cv=none; b=GIFb3yJAxPg5iZ6LwQPFE98WBp9sVUWn4y74grU6DtnBWCdlwvmPZGg0DlAdADy6d/HPBblp+QhbJ0CaHQyUpQLUsTgIdJEysTBOSvVSuDMRhh8nlRlsfr/bHFX3dfRTJhOTYJ+1UAAmcc9HRSdEUxQVESLzPdszJKn+wVCW2Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461117; c=relaxed/simple;
	bh=iBc34nW32DsGbg1aE4Fh/HhP86gdrvKGrvUD3HhCb2Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=irAqe6tvvkufNvqrYF2tE8VpZosvC2yrVRYgeWt8jUAYI5r1OjKf8nEeim3B7vPpGZcM5iuiZ+RCuwJ8QWwf29B7iuvqrY9y6bRlC/Vd78dnHr/4PfvXy3YKfNl8QhYO35RyZjHL3M6iC9hcP8Yi5IHWlpfpZlIXZgmh+2bVktY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iZU5WpM1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iZU5WpM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746461113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xbmQKqHbaixk79j7TKKru6hbZh7kM54PuiKw9+W744U=;
	b=iZU5WpM1W5aLLlh3+p3JYIirHe6HcZpXOToc0m5GYUU6FlWCl38U4IwcdiO70Dbkcm93NF
	al6tz6nkL6jrndUCndxaJPERhuRdtuIsvGngUNwNl0ppMYXDUWFfLvu1lESBBPwMHYG920
	NDD/toW2EP0QT2jgq9ipNbVJEJGGy/E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-MewKNN-jOrS9kq7icS79LQ-1; Mon, 05 May 2025 12:05:12 -0400
X-MC-Unique: MewKNN-jOrS9kq7icS79LQ-1
X-Mimecast-MFC-AGG-ID: MewKNN-jOrS9kq7icS79LQ_1746461111
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso2139195f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461111; x=1747065911;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbmQKqHbaixk79j7TKKru6hbZh7kM54PuiKw9+W744U=;
        b=vAbbejPBOclRjtybIMH+OmdXj9SxcTv0xx3vd4E9UmODNIuOgpSN4lblJ4oGVxVNS3
         WefhDrwpSodZETz/ttKSbfunS+QoSyauWoX5jexmyQ2Bhjcvi5ubFM8HWeAHNOl2pDDG
         coMZqXmJSj96OvCPm0hIOwAOfPjFGIGGzMDZBj8y4dQlzmxwU1VvnXCgbj1lPeHCxVxF
         tB8hIsbmBhKc4FhftzggXGdVCngfDkNxwLFY6XTb45kYdH9qbL7MYv9JMCAgWyexCS1J
         G20jr8+T1P79yuyYRjltq9WReIeYxZoF+Za99jccmMJx2KOWFnnGDk/uTo0irqv1nOPu
         Xdqw==
X-Forwarded-Encrypted: i=1; AJvYcCX0lXjarcS2+1aBmC6pL6+9CkvRwP5CrkuudTnXoz1/75yxkjSzMGrZPmCeu8YYtIAp7LDZQpVdZn5hF7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzANS3MPBAgd9jR9d4jFPbXPv1Cn+PqnRQyIkvFrb+EaYKQtpMu
	M62sLhMbtiJNtDOA4vP0eK5OhbdlZeY3ElAeZub/cvqa9Y2zE+WCYkvqcMdVr/aOsPky7p7hWqO
	GFtp1OrhNOvq6J4FTATvx//aIOfNoEElNq09Q32pR44I3ox6b8W0dyi+OtIr/0g==
X-Gm-Gg: ASbGncsTM+Tk4UXGeVW/bXeEtpy1BXCEVJdAfRvlon1jGvXAJMV1SIT4os87gcC3ip1
	nYVht6noJPzBgRpPtbl8vhCq907alI4HoYzv2ZLID9UPWdFnfOhB/Eyq8umbsJ+zsSUHgbevK6g
	0HUlR3pCtMS3zkg93qgDwqkQJVCzCmSL8HbfdmnCPSPZhlLXm1dBKrfREMcj+CzK0dyGoYA/ydR
	/sdNVXDzVnzQYY/hwOHj3ktCfvcRWK+yD6jI+i09G4A4GT/0pqT5Pfv3iFS7/BLpuSTMzVLfXYs
	/GIQITQl/J+cK3sVpj6zKgeKzG9rDWL4C3snYikrnh1x0VGMblRt4kFJkMLz
X-Received: by 2002:a5d:5847:0:b0:3a0:92d9:da4 with SMTP id ffacd0b85a97d-3a0ab5570d7mr42058f8f.6.1746461111040;
        Mon, 05 May 2025 09:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrTCOZOA7pAPkGMgb4M/yK3jl2JFA1fizSH2/7N2z92v4GSBR5vAiFYanEje4sscTa08V1CA==
X-Received: by 2002:a5d:5847:0:b0:3a0:92d9:da4 with SMTP id ffacd0b85a97d-3a0ab5570d7mr41959f8f.6.1746461110131;
        Mon, 05 May 2025 09:05:10 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm139635145e9.6.2025.05.05.09.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:05:09 -0700 (PDT)
Date: Mon, 5 May 2025 18:05:08 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: Oliver Upton <oliver.upton@linux.dev>, Quentin Perret <qperret@google.com>, 
    Fuad Tabba <tabba@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
    kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: LM regression: fce886a60207 KVM: arm64: Plumb the pKVM MMU in
 KVM
In-Reply-To: <86ldrbgl2x.wl-maz@kernel.org>
Message-ID: <7863e387-0b91-fac5-9925-e461ae7b30cd@redhat.com>
References: <3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com> <86msbrguka.wl-maz@kernel.org> <e1117e68-ef05-9de2-d018-685bb7d86bb5@redhat.com> <86ldrbgl2x.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 5 May 2025, Marc Zyngier wrote:
> On Mon, 05 May 2025 15:01:24 +0100,
> Sebastian Ott <sebott@redhat.com> wrote:
>>
>> On Mon, 5 May 2025, Marc Zyngier wrote:
>>> On Mon, 05 May 2025 11:52:00 +0100,
>>> Sebastian Ott <sebott@redhat.com> wrote:
>>>> Doing back and forth migrations currently fails on arm after a couple iterations.
>>>> During the failing migration KVM_RUN exits via guest_abort and returns -ENOMEM.
>>>> I can reliably reproduce this by migrating between 2 qemu instances on an ampere
>>>> altra machine. This fails after < 5 iterations. In this case qemu would spit out
>>>> smth like this (other than that - nothing in the logs):
>>>>
>>>> error: kvm run failed Cannot allocate memory
>>>>  PC=0000aaaae7d48590 X00=0000aaaae80a2e00 X01=0000aaaae7ea2fc0
>>>> X02=0000000001d3a5d0 X03=0000aaaae7eace8c X04=000000003b9aca00
>>>> X05=000000000000004a X06=000000000000004a X07=0000000028000000
>>>> X08=0000000000001d70 X09=0000000000000018 X10=000144b7d0000000
>>>> X11=00ffffffffffffff X12=000000008378f367 X13=0000aaab1a202d70
>>>> X14=0000000000000000 X15=0000000000000000 X16=0000ffffa2e2f7a8
>>>> X17=0000ffffa2541f20 X18=000000000000a000 X19=84bfda6288cf2dd6
>>>> X20=0000aaab1a1f1ce0 X21=000000007fffffff X22=0000ffffc5431788
>>>> X23=0000aaab1a17db60 X24=0000ffffc5431770 X25=0000000100000000
>>>> X26=0000004100000000 X27=0000000000000001 X28=0000aaab1a1f1c20
>>>> X29=0000ffffc54316d0 X30=0000aaaae7f8cd24  SP=0000ffffc5431650
>>>> PSTATE=20001000 --C- EL0t
>>>>
>>>> Guest and host are otherwise idle, kvm is in normal VHE mode.
>>>>
>>>> Git bisect points to (fce886a60207 "KVM: arm64: Plumb the pKVM MMU in KVM")
>>>> I also double checked that by reverting this commit on top of 6.14.
>>>
>>> Thanks for find the triggering commit. Can you further identify *what*
>>> causes the -ENOMEM? The only new -ENOMEM in that patch is the one
>>> added to topup_hyp_memcache(), which shouldn't be called.
>>
>> The kvm_pgtable_stage2_map() call in user_mem_abort() returns -ENOMEM
>> because the memcache pointer was not initialized!
>>
>> It looks like smth like this without other conditions could do the trick:
>>
>> if (!is_protected_kvm_enabled())
>> 	memcache = &vcpu->arch.mmu_page_cache;
>> else
>> 	memcache = &vcpu->arch.pkvm_memcache;
>>
>> (I'll try this now)
>
> Right, we end-up with an uninitialised memcache variable. Why isn't
> the compiler screaming?

Yea. Also I was under the impression that these kind of warnings tend to
over indicate..

> I think you can indeed simply hoist the init of memcache very early
> on, which should solve hopefully solve the issue.

It solves the issue for me. Please note that in this case topup cache is
not called - I hope that this is not an issue (but it was also the case
before commit fce886a60207).

>>
>>> Also, a failure to allocate would leave some nastygram in the kernel
>>> log, so it is unlikely to be an actual failure to allocate.
>>>
>>> Is it the first KVM_RUN that fails after migration?
>>
>> Nope, it happens on the side that triggers the migration.
>
> Probably because splitting pages requires allocating some memory, and
> all of a sudden you trigger the allocation from the memcache. Boo.
>
> Thanks for spotting this, I'm looking forward to the fix!

------->8
From c594bbf9c3c4186594b798734ea9b1779be3b584 Mon Sep 17 00:00:00 2001
From: Sebastian Ott <sebott@redhat.com>
Date: Mon, 5 May 2025 11:09:58 -0400
Subject: [PATCH] KVM: arm64: Fix uninitialized memcache pointer in user_mem_abort()

Commit fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM") made the
initialization of the local memcache variable in user_mem_abort()
conditional, leaving a codepath where it is used uninitialized via
kvm_pgtable_stage2_map().

This can lead to migration failures where KVM_RUN exits with -ENOMEM.
Fix this by making sure that memcache is always valid.

Fixes: fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM")
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
  arch/arm64/kvm/mmu.c | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..6c3c658c5f29 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1501,6 +1501,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  		return -EFAULT;
  	}

+	if (!is_protected_kvm_enabled())
+		memcache = &vcpu->arch.mmu_page_cache;
+	else
+		memcache = &vcpu->arch.pkvm_memcache;
+
  	/*
  	 * Permission faults just need to update the existing leaf entry,
  	 * and so normally don't require allocations from the memcache. The
@@ -1511,10 +1516,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);

  		if (!is_protected_kvm_enabled()) {
-			memcache = &vcpu->arch.mmu_page_cache;
  			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
  		} else {
-			memcache = &vcpu->arch.pkvm_memcache;
  			ret = topup_hyp_memcache(memcache, min_pages);
  		}
  		if (ret)

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.49.0

