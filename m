Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3870BA45
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768365; cv=none; b=IEI6DHkZwBGlWBIrytzv8o92IjZ5NnMXJ3eFGn1A4hW8/YC2xhndaU4KoVL2ce4EoO/LeiN1ssDVLLgzczFYgBo+37mihos972fknTmxZ+s07w/9gpa1OGvneYfOCTFilKFczCEbBi6AV/omFRB2OR8O76ctXbPKgAkZy6uNgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768365; c=relaxed/simple;
	bh=82P0t2yO1i5cBFlVquv3GCTGcdd8SMKT8Mrys7Rl5vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHH0UkdiIwykAW3DZSWz8RuQ87zR0yZHMGQMRNnrDt6YIKPOoHk/wRqng4/Imx1Pb5DuEadIbN1oNzfom+QTOTrXdWUiIwsc/26MFT3MU2GY0FXm24LMgk9T7UwEYk6F8/GT+Ju4g1My405WMwgprZ7FVe827ITXZ+FNi1T2U9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dNQrtfE5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dNQrtfE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747768362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2HyJTD3mME1yfu6pisM5LB773OGEDQNPNYsSNdYA/II=;
	b=dNQrtfE5U8fQY0zwH042xPOSUzBf1uxdhDAbdQvemJKvWbyc3U+XcNPhtnIuxUeSHadjyg
	FaRujfH0CGlwE6nFmLQHXKIO8MADJtgEm6NfU2R1mOg/81r3lhEqIP8pnlBX/gsNwfYJHe
	TIioPYIk/1wh8ZUZjrO2PyivDgyciig=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-Hmq2uDIGPHaluTpCVOhYVg-1; Tue, 20 May 2025 15:12:41 -0400
X-MC-Unique: Hmq2uDIGPHaluTpCVOhYVg-1
X-Mimecast-MFC-AGG-ID: Hmq2uDIGPHaluTpCVOhYVg_1747768361
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5750ca8b2so888996885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747768360; x=1748373160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HyJTD3mME1yfu6pisM5LB773OGEDQNPNYsSNdYA/II=;
        b=c0QLoqN29bqqE3It9i211sZpaK+N7m0YsmWGVbz5GxvfPpt8rlYPU+tDoiTHDMLtoe
         ezOk405krqDgR+GvRK70ZPMjcgO/c/AWI0k1nHkazDGCz4rrEJrqIGPYRya+T+ugaAU4
         Y3W1o+EJr7SUQNatafwSkzFf34qVhwV7bcTQxjjZmFNGUoWlyaYQLLVABGRwaY2sOiBe
         oTDLvZrWnCmyf9GVxqf5J1FMQadRg3J+QXogM+U/XxdCt4KvDfqaF/V/8PZMoURUzhV3
         KuFLRtK02gmZn9pAZGeYVPOl/tm8D2bYcgER+2//pFItme7nDtgw1weOzeO9aVxtznzh
         z3pw==
X-Forwarded-Encrypted: i=1; AJvYcCWdLJRaiauTl6CnNi8L0xfPMgz6Rz0DGkcCDldOF2Xgnf34TiTIeke3RSaeBpdhHAc5JG7gV+pwimy6NSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/STsn8HchEt3TtU54jffH3ukpWiEqbpYouUbe+u5F9LAJewO
	mgiy9jhSRDQi+aXk21S3IQFBPo+tys9lHC4lotoYmbANiMntSD+lq1v6xJss74oY1fzKEC6HzRZ
	z7fhECCfUdSFwU/azbceo+9rTq9EziLD6tQo2k5U2nWBdbuBaUhr8yrJcE8HIwDVw3Q==
X-Gm-Gg: ASbGncsiSHJRTeEzcJtl2O41vVKD7eyaX/HY9twAIdCHb9TYx36PRomjJ7VQyfDOAlA
	WfW/vWu9BkTZJZjEJr7JiLFGHNcG/YplIc4pSqA8w1vvQ2geCbAXsma9GX3sZ0Tz65jK/mEPIFG
	UNBeG/wB2hXe6RgpKyIFDhLmqy/FDyB7svS7s9OA4R0UMqf19yILhLpstoqYkfIcHpRoFtyyOdO
	JxRnmS/qA42iZoFaRSilUY6REzy5MWRxkg87f+7kqFEdtGvJT+oQ9KW8dZtkwBA3Mxfwt8ZXV3b
	s2I=
X-Received: by 2002:a05:620a:319d:b0:7c5:3b52:517d with SMTP id af79cd13be357-7cd467b0d86mr3038257985a.54.1747768360578;
        Tue, 20 May 2025 12:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWz4FNevXJR1OnAQxheNRs92oMXIa8Lbsy1YjYg0d6xnbO2XUQP0QG/i0To2I5eS4AQiANwQ==
X-Received: by 2002:a05:620a:319d:b0:7c5:3b52:517d with SMTP id af79cd13be357-7cd467b0d86mr3038253785a.54.1747768360219;
        Tue, 20 May 2025 12:12:40 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467dae90sm774378185a.46.2025.05.20.12.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:12:39 -0700 (PDT)
Date: Tue, 20 May 2025 15:12:34 -0400
From: Peter Xu <peterx@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	James Houghton <jthoughton@google.com>,
	Pankaj Gupta <pankaj.gupta@amd.com>
Subject: Re: [PATCH v3 0/6]  KVM: Dirty ring fixes and cleanups
Message-ID: <aCzUIsn1ZF2lEOJ-@x1.local>
References: <20250516213540.2546077-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516213540.2546077-1-seanjc@google.com>

On Fri, May 16, 2025 at 02:35:34PM -0700, Sean Christopherson wrote:
> Sean Christopherson (6):
>   KVM: Bound the number of dirty ring entries in a single reset at
>     INT_MAX
>   KVM: Bail from the dirty ring reset flow if a signal is pending
>   KVM: Conditionally reschedule when resetting the dirty ring
>   KVM: Check for empty mask of harvested dirty ring entries in caller
>   KVM: Use mask of harvested dirty ring entries to coalesce dirty ring
>     resets
>   KVM: Assert that slots_lock is held when resetting per-vCPU dirty
>     rings

For the last one, I'd think it's majorly because of the memslot accesses
(or CONFIG_LOCKDEP=y should yell already on resets?).  The "serialization
of concurrent RESETs" part could be a good side effect.  After all, the
dirty rings rely a lot on the userspace to do right things.. for example,
the userspace better also remember to reset before any slot changes, or
it's possible to collect a dirty pfn with a slot index that was already
removed and reused with a new one..

Maybe we could switch the sentences there in the comment of last patch, but
not a huge deal.

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks!

-- 
Peter Xu

