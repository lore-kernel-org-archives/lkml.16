Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0688F219A67
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698182; cv=none; b=BKFsWB9q+1jG5m/x1N+KrKTOS0DQOKJg3cy2hheRm5h4OedsthpK+V4E+dPaBU/deekb65bJpjWZ5zGUnaUcAVH77dgfuCodABMFFysppdAn0QBEpI9WYHjd8zw3X1Rr5JpPd2W7NLEDb+lXr8b0vPAHxHU0qPiyKCqsXzuySmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698182; c=relaxed/simple;
	bh=evhtNLT7qrEB/f0LsSGunk0SU0xDbeT6mUcieT4SQzs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K0X/je2Y/8jHuo1AJDeZCyL4+Kf9FGgtVhFGDtXgDVgNTPmYlJxbYJ3BDvLNDvmToPnlmcjXmaPqkIYYiTUItnHynUhjPttjk8j7IfMyf8KgcS6yg0PcmSoP5Y54NSr91aTvQ9lLWbR7EULGOGlHFfq8UeQ3L67koS/RTz/SGDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQsUDI1U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQsUDI1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738698179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lm77+J+FSsd7jyuwQ676pRUYyyJaAZq7OUEXpDi3H4w=;
	b=bQsUDI1UBA/Ooq1hOxkRYLam641/pLAaqz7Y7F3XVhyVq9RUDOYJLP72S/3d/UuvdvhDha
	oIxjKQZSx65QgIJrPH3jg5miYcySFOhAZcY3ndGGJic6NlMDAXIIDACjUZl0QsHv3UOgcw
	BM/J3LMq8zMC5xKFyWSE0/qAjDSWS/A=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-hgaf_haSNEysvQ-q_4k4FA-1; Tue, 04 Feb 2025 14:42:58 -0500
X-MC-Unique: hgaf_haSNEysvQ-q_4k4FA-1
X-Mimecast-MFC-AGG-ID: hgaf_haSNEysvQ-q_4k4FA
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6f3b93f5cso27069385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698178; x=1739302978;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lm77+J+FSsd7jyuwQ676pRUYyyJaAZq7OUEXpDi3H4w=;
        b=Q/t83GWU20TGAu7UVqm0ZP0u60eF4u5M9n0Wp9yQ8+eMF0V6VFCyif7bqiVUf26yH8
         9alr4CLDtV+T7w78JVNNVbEumXMuhW1sLveBeRrc6EpKrcJkuy8yEzkjq1mD/GZBMHSx
         CY++8nExhipz7q4gKopEe4wX8iF0xzNGS87ylFYYvm5udWhDeavPnCdDcQm4AWmTixPy
         TaEnT9dWh9XuUsKSp/xJNibiHOg2mAfzrDdlaiTmf1t2klQFHNleBACACNDsHiSaMI5m
         6ehk7W0CAUPheresiZS7WK1zTPQQ9Uw7WQGKUwgYSOLSIxBQzlXUfzP0NNCvzy+Qij7e
         8QyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkC4D2uauPqvlQroxylkumcYkyYg6GntsUKZD7v5lrMShRcp5CTlCh38Ga6tm3mhNa9FryN6330BgJoh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBnA5kPtjvXHiwTvYIqCcbdxbxZU92jqnHxAHv5/kHb/AqCSf+
	+L5LY/kT95RQ3JOd1p3fg6vad9Dks9O7QrEK7qCbcRiW9XtJfupCC90U+aIdKTzhaG8LmuR2HUU
	GhAIRPmON7AFc+jUIeRs6DS6OmWfj0OIGNZ0HwYIXpXSUSrc1XbbkEwet8b1VEQ==
X-Gm-Gg: ASbGncuFHgcZHyH9bzCs0lJlIIZDX1+Qnj4h6WzY19hfiDwpP9TnmlB/aqhpWvIj0yQ
	kJ0X+rGeQmwuWcotz+OFx09eriGtSVBMLCROW2+3BmLhdCW90OaNX0IlcCEeCKqg+x0cXR/116O
	YIQqDooSWYyoc256CTMeEqzRLdw9zOHo2cpPyaKoxV3JXwiksNm7ZZ7uKic9ahOfdWIGbOlUAbI
	7Zo5o6c7FoxhjNwV9SX4K5Jv5lNO3yJRAr7UjXmLq2DOerIPeoH9GcKuKZDXUU3ypQicehdelIo
	K6+O
X-Received: by 2002:a05:620a:8395:b0:7b6:dd89:d86f with SMTP id af79cd13be357-7c039b65ff2mr28089085a.24.1738698178065;
        Tue, 04 Feb 2025 11:42:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1kXnH0DVm+wAP+GkN7ZGmKIwC+BKKALxPN58aJSVkKJ6kQ+N7rq8ui6rYX6/trXwNmJyP4g==
X-Received: by 2002:a05:620a:8395:b0:7b6:dd89:d86f with SMTP id af79cd13be357-7c039b65ff2mr28085685a.24.1738698177744;
        Tue, 04 Feb 2025 11:42:57 -0800 (PST)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8c8fafsm669811385a.26.2025.02.04.11.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:42:56 -0800 (PST)
Message-ID: <da91fc38126227c227a4fe6b85cd630ca1ca8853.camel@redhat.com>
Subject: Re: [PATCH 2/3] KVM: x86: Remove use of apicv_update_lock when
 toggling guest debug state
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>,  Naveen N Rao <naveen@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Vasant Hegde <vasant.hegde@amd.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Tue, 04 Feb 2025 14:42:55 -0500
In-Reply-To: <2d86cce9-88c2-4b2f-a8a6-ee33d0e1c98d@redhat.com>
References: <cover.1738595289.git.naveen@kernel.org>
	 <dc6cf3403e29c0296926e3bd8f0d4e87b67f4600.1738595289.git.naveen@kernel.org>
	 <30fc469b5b2ec5e2d6703979a0d09ad0a9df29e1.camel@redhat.com>
	 <a7eb34n6gkwg6kafh7r76tkwtweuflyfoczgxya2k63al2qdoe@phmszu6ilk4w>
	 <Z6JTmvrkrLpaJ1nw@google.com>
	 <2d86cce9-88c2-4b2f-a8a6-ee33d0e1c98d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2025-02-04 at 18:58 +0100, Paolo Bonzini wrote:
> On 2/4/25 18:51, Sean Christopherson wrote:
> > On Tue, Feb 04, 2025, Naveen N Rao wrote:
> > > On Mon, Feb 03, 2025 at 09:00:05PM -0500, Maxim Levitsky wrote:
> > > > On Mon, 2025-02-03 at 22:33 +0530, Naveen N Rao (AMD) wrote:
> > > > > apicv_update_lock is not required when querying the state of guest
> > > > > debug in all the vcpus. Remove usage of the same, and switch to
> > > > > kvm_set_or_clear_apicv_inhibit() helper to simplify the code.
> > > > 
> > > > It might be worth to mention that the reason why the lock is not needed,
> > > > is because kvm_vcpu_ioctl from which this function is called takes 'vcpu->mutex'
> > > > and thus concurrent execution of this function is not really possible.
> > > 
> > > Looking at this again, that looks to be a vcpu-specific lock, so I guess
> > > it is possible for multiple vcpus to run this concurrently?
> > 
> > Correct.
> 
> And this patch is incorrect. Because there is a store and many loads, 
> you have the typical race when two vCPUs set blockirq at the same time
> 
> 	vcpu 0				vcpu 1
> 	---------------			--------------
> 	set vcpu0->guest_debug
> 					clear vcpu1->guest_debug
> 	read vcpu0->guest_debug
> 	read vcpu1->guest_debug	
> 	set inhibit
> 					read stale vcpu0->guest_debug
> 					read vcpu1->guest_debug
> 					clear inhibit
> 
> But since this is really a slow path, why even bother optimizing it?
> 
> Paolo
> 


Paolo, you are absolutely right! the vcpu mutex only prevents concurrent ioctl
on a same vcpu, but not on different vcpus, and without locking of course
this patch isn't going to work. The per-vcpu mutex is not something I know well,
and I only recently made aware of it, so I mixed this thing up.

So yes, some kind of lock is needed here.

Best regards,
     Maxim Levitsky

