Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078B970823
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227888; cv=none; b=sLFHlhISj4hbR7rqmKTbL+UlGFxCFqk6JqyplgvLRc7wA/MrXmOIhhSCA7FkTw0IZny/54/KwJJBxmte+V2h8JzODeLd4hmNlxxg5PdnWabgKkSIwEflKKB/XR262bah4Vc4ZoDiiuaJsAGzerwNauf1rD31OfLZ00S1Lypz0ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227888; c=relaxed/simple;
	bh=QrbtuDMMlfo+hBepFmzEgOKu5bVEHlmY04wQwSs1g6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcgY1abs9AY52f+XdzGfl/AQyjp9cV+zp3cD8eJGyz9Wnugnvx5XtTGJY6ciG9+ohnKTJqjIImoVj4ppjkl6iXsft0Tl2LJ/hSs7BRtYRrg2koxYcl9DLHrZv+qyjXQyWtESqwR12SpFD0GBSEPa6wLZ8iEF/eY2nj3THqCLhP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNWxfO22; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNWxfO22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749227886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Dl57DhiFOMo8GkH+ogQuHIs3xd9CNb2ax4ce20G2fls=;
	b=UNWxfO22A2m0p6o4n8J+0T5MhXpI2tJFFkWqF7wCTQ9oKVWztUPUTG17AamO+zBxDGYazB
	reBQutbFKKZaXzsLIDKNFVK/y0zhWdpyDbiXRhASXLz6WWweOIgPaXXv0EOSgIj/mQr59O
	4hVZHg9i/zB4mZfTIeMJIRf6JMHCJHs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-i74rOOAWPfi5L83VIpXkwg-1; Fri, 06 Jun 2025 12:38:04 -0400
X-MC-Unique: i74rOOAWPfi5L83VIpXkwg-1
X-Mimecast-MFC-AGG-ID: i74rOOAWPfi5L83VIpXkwg_1749227884
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f3796779so1661368f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 09:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749227884; x=1749832684;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dl57DhiFOMo8GkH+ogQuHIs3xd9CNb2ax4ce20G2fls=;
        b=QVSkE7GJE3Daytn8LC1NgXox9BcITNj7/nrASOrTOzgiXvRmz2JKXFRQ+WlqTNthLi
         VprUuuO+VabATUJmNty/tRZA1kMJnt4NISmsbIdX/Ua+b+Gz3DA3NQGNDGBJYWR4Q1jT
         22fKrAzM6TJYmOc2MSpyXQg2ctZC9ItQpoQTEYe7LfgvvELRsnQf0FHaJSwk9wq3RTn9
         Q1H8BQdDdMAB1PpkPsTmnyMD3hO2gdqnxUv4xQb561P0pgaaNv9x8ZGhQ66nVrkQyv4H
         dDzIt1Z0eNCM8cXhb/NlzaiSrLFrxgTyRWr/Z6wTUcOeQzgwt+GnaMsnvEpEpqj8b3RH
         xo6Q==
X-Gm-Message-State: AOJu0YxTm2cD/kvdL0FQcI1K/Jxx0Fs4lesxs+x/M07IcOLnfV0e9fvp
	yFa2jqzlyium072s/H9s716byyJ9yyPog5eCnQFMS3lbOAApqAEQmNNFM3VYG53GWtfcStC0Bf0
	f19QzcMB7tJBigp3pE34Xg/xhcsE7b+NZ8oxvA2zcSYMRKHKbFSqXecUR0Yw39z07bA==
X-Gm-Gg: ASbGncskdz7NB+ap+iM9Fno6FjD4OssYZeVLGvBopzeSwQ8tUgIUKOM7nrCspn1grp6
	jWUVKHRxbeB8t57wV2WijIM/XjkMJ6EnaVik6m7jhcVliendeam2ymkeGjgqPa3E7LrF5XqbKQb
	9ayWX9QqnsGYi4B2X5ITpktMWfDQNiI4s2flqRZzU0YDNUscG78CGy9xmkuxnHQOuiWkQig+l21
	0/xJKrSq/atvS08YDO86X+ZgthuwabhkEI6FwDBvgyGZEF7PRfBZBU9l2zYDb9PSUaln2qM+1+4
	sSR0a9e0+k/PbdsT++m+KhN0
X-Received: by 2002:a05:6000:1a8f:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a53189ef17mr3476964f8f.16.1749227883682;
        Fri, 06 Jun 2025 09:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNKzC3mqWUAPIgFlamw5SfU5I0d4hNXj2UIm4VZTEITVURrNiwn6xofps9u77e0T4I4TQ3vw==
X-Received: by 2002:a05:6000:1a8f:b0:3a1:fe77:9e1d with SMTP id ffacd0b85a97d-3a53189ef17mr3476940f8f.16.1749227883282;
        Fri, 06 Jun 2025 09:38:03 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm2410666f8f.51.2025.06.06.09.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 09:38:02 -0700 (PDT)
Message-ID: <a0e2c1a2-23a1-4527-b638-b06df3fc5fc6@redhat.com>
Date: Fri, 6 Jun 2025 18:38:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/29] KVM: x86: add planes support for interrupt delivery
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, roy.hopkins@suse.com,
 thomas.lendacky@amd.com, ashish.kalra@amd.com, michael.roth@amd.com,
 jroedel@suse.de, nsaenz@amazon.com, anelkz@amazon.de,
 James.Bottomley@hansenpartnership.com
References: <20250401161106.790710-1-pbonzini@redhat.com>
 <20250401161106.790710-21-pbonzini@redhat.com> <aEMXrbWBRkfeJPi7@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aEMXrbWBRkfeJPi7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/25 18:30, Sean Christopherson wrote:
> On Tue, Apr 01, 2025, Paolo Bonzini wrote:
>> Plumb the destination plane into struct kvm_lapic_irq and propagate it
>> everywhere.  The in-kernel IOAPIC only targets plane 0.
> 
> Can we get more aggressive and make KVM_CREATE_IRQCHIP mutually exclusive with
> planes?  AIUI, literally every use case for planes is for folks that run split
> IRQ chips.

Maybe, but is there any added complexity other than the "= {0}" to 
initialize the new field.  Ready to be proven wrong but I do think 
that's one thing that just works.

> And we should require an in-kernel local APIC to create a plane.

I don't think it's needed either; if anything the complexity of patch 25 
isn't needed with userspace local APIC.

Paolo

