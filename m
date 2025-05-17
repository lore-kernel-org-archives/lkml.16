Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97D41F1905
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747485821; cv=none; b=hZXlGqd3lOqI7Bes1Xj01UHwx3bKY7EziuwjbYPZ9jJIgigCFdehVYGyYyuFe7G07pKjPnP2rDLdTFMS51KdBHE3QUVN0/4KZHH446ImGYj/tVduSfOoBdRKQdIYyhTvQcuqrCSF1HddsEalz5JmKTcEoz6WlPyErIzW2k4FKTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747485821; c=relaxed/simple;
	bh=blwOvS2w6YzWihvg3dqqgvzv4+0UY579zeAvYaIRPdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htwOHEclsl7IJm/e9j99CG7TRHxu5XnhzmtMM5yPTJkr/nAyW9fC648IlhFG3OOELbv0N3EAYMBaMtwtLUhgWJa4Gq9YSxjR5Q3ucCShft5zdeTfLyL1Ysi1QOyFTAcbRLfvNqp5j/HD11vvC9wZfkD3mI/ANctzxdAbyV6U/lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G8BFA1Dq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G8BFA1Dq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747485818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=cTnV1z0rjTvUAak1W98nsAi7ubw9WZ/kdmhmvEXkfzU=;
	b=G8BFA1DquJ16VrdC9D6NwS5/uzlWfuglSlWStaOzm2JgDF7Fni3YRCKHSukymdb6Vmt3RF
	Mg5rEvfJTsUUGaoUf6ZH8FfnO/CvQxbngOS1nY4rG6QnbDo8cu9rriGM3/1Oiz6H4wbrN6
	bCIEvgd+1ZqS76qvp8mpnofHuA6pTbs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-SvCH7reHPgOHXbDlAfwtQA-1; Sat, 17 May 2025 08:43:35 -0400
X-MC-Unique: SvCH7reHPgOHXbDlAfwtQA-1
X-Mimecast-MFC-AGG-ID: SvCH7reHPgOHXbDlAfwtQA_1747485814
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so574229485a.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 05:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747485813; x=1748090613;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTnV1z0rjTvUAak1W98nsAi7ubw9WZ/kdmhmvEXkfzU=;
        b=TP0jaidynZepvebo79S8nN5PJVzB5G5ccaSFPJ8V9SGMJr5mtHPe109bHfhXWajmqm
         dUZDqUN9WrxwBfnTGmrzEjSpLQBAXrwMJOTT6B7w5yIn1oiHnJ9a3x+OWdrnTXlvKJ+K
         Z2Kckb4TFsRJugocLoXR7dNU1lsCONAaSyqps1PBN2ZCPYfcrwnoCTJ/76zR3SGOiAtb
         9bag6o6WYSlcW8qVyq1YbDRprRJbJkzH/Q0Mc/eyfBqi1v/cy0yl9mDUyYeqpi9KGymZ
         HgzZAfe8Lj3zDlbl3Hg7hD6AwI51OqCSaT6NskzYuaONpvDcnNYOFvVN+nOaeMk1KZL5
         CFwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs16QG1L67S4sYuhHoHdnFE8mbDKgJkjKekvxzoAPhryiIG0vD2g8V1WUiJM0YZMxdZ9/0TmTyY1IC5S0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9NQgXxDvLCuAnN4WKGQ+HsXu89LP2tbfnyXm+fuxSCmMpZwPk
	q3/sX7nuPuwdACRFWKf/Iqog92wB6j7k+hKuPajHhBAKIbICWh/h3sfwLvI14zS2C0OfUXnELQa
	5noup7nA1do/AxbkW1CPgwt3ncjXDGfRqXnsAoEOW9T1uHxDZDQG5xKcav5IRvagtu5DUwl3FEA
	==
X-Gm-Gg: ASbGncuy0h73xk3zbj81nnjw5owNKqVojLw8v0L+vmGlI0HBJOPiAvNc+GaW0prajwH
	c7D3Gam7MX8Tg0S3sNi8+kJCOAOlK/NzmsiQUh7qFHwoFssHV7vLm2ppAuB2Ux2TkTEUG/l0+0d
	e2MsT/YYMHqTiaMuOrrV5goUpRYpeeeDbwTdx9ZlowTWO1T0ezbEPSyfGaxz/Oz9GllpVUPfkqt
	fKxgLes2pLYRnx+n0WTEHke7C7OxebiFuG/k8BD0qNKgDGkKdJIpRvRstliIcQnP08hYw3EClJH
	WZWYnSGvs0yGOnzhJQ==
X-Received: by 2002:a05:620a:17a2:b0:7c5:49d6:733a with SMTP id af79cd13be357-7cd46724717mr1000277585a.21.1747485813115;
        Sat, 17 May 2025 05:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQKOl/NHbzJvrLVa4YJt0v+b+jH91WXus2AJ87GhwZJg1NQMX5sFrwvNWH0ueHHWVOecAHSg==
X-Received: by 2002:a05:620a:17a2:b0:7c5:49d6:733a with SMTP id af79cd13be357-7cd46724717mr1000259885a.21.1747485809714;
        Sat, 17 May 2025 05:43:29 -0700 (PDT)
Received: from [192.168.21.214] ([69.164.134.123])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7cd468b6d30sm253925285a.76.2025.05.17.05.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 05:43:29 -0700 (PDT)
Message-ID: <fb0580d9-103f-4aa1-94ae-c67938460d71@redhat.com>
Date: Sat, 17 May 2025 14:43:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] KVM: x86/mmu: Defer allocation of shadow MMU's
 hashed page list
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vipin Sharma <vipinsh@google.com>
References: <20250516215422.2550669-1-seanjc@google.com>
 <20250516215422.2550669-4-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
 CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
 hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
 DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
 P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
 Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
 UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
 tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
 wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0j
 UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT7CwU0EEwECACMFAlRCcBICGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRB+FRAMzTZpsbceDp9IIN6BIA0Ol7MoB15E
 11kRz/ewzryFY54tQlMnd4xxfH8MTQ/mm9I482YoSwPMdcWFAKnUX6Yo30tbLiNB8hzaHeRj
 jx12K+ptqYbg+cevgOtbLAlL9kNgLLcsGqC2829jBCUTVeMSZDrzS97ole/YEez2qFpPnTV0
 VrRWClWVfYh+JfzpXmgyhbkuwUxNFk421s4Ajp3d8nPPFUGgBG5HOxzkAm7xb1cjAuJ+oi/K
 CHfkuN+fLZl/u3E/fw7vvOESApLU5o0icVXeakfSz0LsygEnekDbxPnE5af/9FEkXJD5EoYG
 SEahaEtgNrR4qsyxyAGYgZlS70vkSSYJ+iT2rrwEiDlo31MzRo6Ba2FfHBSJ7lcYdPT7bbk9
 AO3hlNMhNdUhoQv7M5HsnqZ6unvSHOKmReNaS9egAGdRN0/GPDWr9wroyJ65ZNQsHl9nXBqE
 AukZNr5oJO5vxrYiAuuTSd6UI/xFkjtkzltG3mw5ao2bBpk/V/YuePrJsnPFHG7NhizrxttB
 nTuOSCMo45pfHQ+XYd5K1+Cv/NzZFNWscm5htJ0HznY+oOsZvHTyGz3v91pn51dkRYN0otqr
 bQ4tlFFuVjArBZcapSIe6NV8C4cEiSTOwE0EVEJx7gEIAMeHcVzuv2bp9HlWDp6+RkZe+vtl
 KwAHplb/WH59j2wyG8V6i33+6MlSSJMOFnYUCCL77bucx9uImI5nX24PIlqT+zasVEEVGSRF
 m8dgkcJDB7Tps0IkNrUi4yof3B3shR+vMY3i3Ip0e41zKx0CvlAhMOo6otaHmcxr35sWq1Jk
 tLkbn3wG+fPQCVudJJECvVQ//UAthSSEklA50QtD2sBkmQ14ZryEyTHQ+E42K3j2IUmOLriF
 dNr9NvE1QGmGyIcbw2NIVEBOK/GWxkS5+dmxM2iD4Jdaf2nSn3jlHjEXoPwpMs0KZsgdU0pP
 JQzMUMwmB1wM8JxovFlPYrhNT9MAEQEAAcLBMwQYAQIACQUCVEJx7gIbDAAKCRB+FRAMzTZp
 sadRDqCctLmYICZu4GSnie4lKXl+HqlLanpVMOoFNnWs9oRP47MbE2wv8OaYh5pNR9VVgyhD
 OG0AU7oidG36OeUlrFDTfnPYYSF/mPCxHttosyt8O5kabxnIPv2URuAxDByz+iVbL+RjKaGM
 GDph56ZTswlx75nZVtIukqzLAQ5fa8OALSGum0cFi4ptZUOhDNz1onz61klD6z3MODi0sBZN
 Aj6guB2L/+2ZwElZEeRBERRd/uommlYuToAXfNRdUwrwl9gRMiA0WSyTb190zneRRDfpSK5d
 usXnM/O+kr3Dm+Ui+UioPf6wgbn3T0o6I5BhVhs4h4hWmIW7iNhPjX1iybXfmb1gAFfjtHfL
 xRUr64svXpyfJMScIQtBAm0ihWPltXkyITA92ngCmPdHa6M1hMh4RDX+Jf1fiWubzp1voAg0
 JBrdmNZSQDz0iKmSrx8xkoXYfA3bgtFN8WJH2xgFL28XnqY4M6dLhJwV3z08tPSRqYFm4NMP
 dRsn0/7oymhneL8RthIvjDDQ5ktUjMe8LtHr70OZE/TT88qvEdhiIVUogHdo4qBrk41+gGQh
 b906Dudw5YhTJFU3nC6bbF2nrLlB4C/XSiH76ZvqzV0Z/cAMBo5NF/w=
In-Reply-To: <20250516215422.2550669-4-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 23:54, Sean Christopherson wrote:
> When the TDP MMU is enabled, i.e. when the shadow MMU isn't used until a
> nested TDP VM is run, defer allocation of the array of hashed lists used
> to track shadow MMU pages until the first shadow root is allocated.
> 
> Setting the list outside of mmu_lock is safe, as concurrent readers must
> hold mmu_lock in some capacity, shadow pages can only be added (or removed)
> from the list when mmu_lock is held for write, and tasks that are creating
> a shadow root are serialized by slots_arch_lock.  I.e. it's impossible for
> the list to become non-empty until all readers go away, and so readers are
> guaranteed to see an empty list even if they make multiple calls to
> kvm_get_mmu_page_hash() in a single mmu_lock critical section.
> 
> Use {WRITE/READ}_ONCE to set/get the list when mmu_lock isn't held for
> write, out of an abundance of paranoia; no sane compiler should tear the
> store or load, but it's technically possible.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c | 60 +++++++++++++++++++++++++++++++++++-------
>   1 file changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 41da2cb1e3f1..edb4ecff9917 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -1983,14 +1983,33 @@ static bool sp_has_gptes(struct kvm_mmu_page *sp)
>   	return true;
>   }
>   
> +static __ro_after_init HLIST_HEAD(empty_page_hash);
> +
> +static struct hlist_head *kvm_get_mmu_page_hash(struct kvm *kvm, gfn_t gfn)
> +{
> +	/*
> +	 * Load mmu_page_hash from memory exactly once, as it's set at runtime
> +	 * outside of mmu_lock when the TDP MMU is enabled, i.e. when the hash
> +	 * table of shadow pages isn't needed unless KVM needs to shadow L1's
> +	 * TDP for an L2 guest.

Avoid double negations, for example "i.e. when shadow paging and the 
mmu_page_hash is only needed for a L1 hypervisor's TDP".

> +	 */
> +	struct hlist_head *page_hash = READ_ONCE(kvm->arch.mmu_page_hash);

This READ_ONCE is more for the (now implicit) smp_read_barrier_depends() 
than for "loading exactly once".  Might as well use smp_load_acquire() 
since it's free on x86.

> +	lockdep_assert_held(&kvm->mmu_lock);

Move this comment here from kvm_mmu_alloc_page_hash():

	/* mmu_lock must be held for write to add (or remove) shadow
	 * pages, and so readers are guaranteed to see an empty list for
	 * their current mmu_lock critical section.
	 */
> +	if (!page_hash)
> +		return &empty_page_hash;
> +
> +	return &page_hash[kvm_page_table_hashfn(gfn)];
> +}
> +
>   #define for_each_valid_sp(_kvm, _sp, _list)				\
>   	hlist_for_each_entry(_sp, _list, hash_link)			\
>   		if (is_obsolete_sp((_kvm), (_sp))) {			\
>   		} else
>   
>   #define for_each_gfn_valid_sp_with_gptes(_kvm, _sp, _gfn)		\
> -	for_each_valid_sp(_kvm, _sp,					\
> -	  &(_kvm)->arch.mmu_page_hash[kvm_page_table_hashfn(_gfn)])	\
> +	for_each_valid_sp(_kvm, _sp, kvm_get_mmu_page_hash(_kvm, _gfn))	\
>   		if ((_sp)->gfn != (_gfn) || !sp_has_gptes(_sp)) {} else
>   
>   static bool kvm_sync_page_check(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
> @@ -2358,6 +2377,12 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
>   	struct kvm_mmu_page *sp;
>   	bool created = false;
>   
> +	/*
> +	 * No need for READ_ONCE(), unlike in kvm_get_mmu_page_hash(), because
> +	 * mmu_page_hash must be set prior to creating the first shadow root,
> +	 * i.e. reaching this point is fully serialized by slots_arch_lock.
> +	 */
> +	BUG_ON(!kvm->arch.mmu_page_hash);
>   	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
>   
>   	sp = kvm_mmu_find_shadow_page(kvm, vcpu, gfn, sp_list, role);
> @@ -3886,11 +3911,21 @@ static int kvm_mmu_alloc_page_hash(struct kvm *kvm)
>   {
>   	typeof(kvm->arch.mmu_page_hash) h;
>   
> +	if (kvm->arch.mmu_page_hash)
> +		return 0;
> +
>   	h = kvcalloc(KVM_NUM_MMU_PAGES, sizeof(*h), GFP_KERNEL_ACCOUNT);
>   	if (!h)
>   		return -ENOMEM;
>   
> -	kvm->arch.mmu_page_hash = h;
> +	/*
> +	 * Write mmu_page_hash exactly once as there may be concurrent readers,
> +	 * e.g. to check for shadowed PTEs in mmu_try_to_unsync_pages().  Note,
> +	 * mmu_lock must be held for write to add (or remove) shadow pages, and
> +	 * so readers are guaranteed to see an empty list for their current
> +	 * mmu_lock critical section.
> +	 */
> +	WRITE_ONCE(kvm->arch.mmu_page_hash, h);

Use smp_store_release here (unlike READ_ONCE(), it's technically 
incorrect to use WRITE_ONCE() here!), with a remark that it pairs with 
kvm_get_mmu_page_hash().  That's both more accurate and leads to a 
better comment than "write exactly once".

Paolo

