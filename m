Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63323BCE7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815371; cv=none; b=BSKaGg86yfueInaz0opy2xFaL+V/h9JY90UFdp/xlhAGVjhI0ccYfJdTvF5X8Hi7SWeHlEia/tZpTg+0ny7q+d2eCDK87Tqmznjq2eDqoPa5Ag1WQ7IwCvXXJnLVZntbZUR4UTJO3bq4eu1frI666twv8uV1QgQ5Wg4wtlqB+nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815371; c=relaxed/simple;
	bh=TZ/CioQKPmReLVBRaY4JcPT8DKNM7VLtQX0w+Wrv/+I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=etmEuL1vbaYRXOUa3bCYLT34RosFxkpUYHL4bm0tu8/6LPo+0ZUBz929k9MPquHWsKsxTx8/FKrzN72bacC+VkE+bWOOM421R5g89Z12PrYAIJ7tO2xjRDi6My8UHWwDVKxyIDWCIuRsemnpy6vtdtSvefcf9Ml7eyFIcixrwWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WITzpjs6; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WITzpjs6"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e540fa2d0so19308795ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746815369; x=1747420169; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OmUdZ7NWf24NGQucaka4MppQGDe1r3WG/B9nuhCN99s=;
        b=WITzpjs6JY4Ll1aVaTo3Pc8LltuVb5DqJxFwTJvf9FdYUhXfhkm9Q2huSqhQnM3txo
         aekxlXVx9YrHkOhy41JWljkE+ONcQfkGdOEKeePoJ0KJLe8EPkes8BrNBWBLGi+hp0ly
         QJYOQX+m5idx0bFHOuNjYdNxJDy2hY5hezUATrgAE1ujjm6veYJmD/x/N5yXLyJcWLss
         XzJYtGtoadFpb1ATZYFGdSwgnGQZddNmKZKX3E0TEqibntfdmYMjCqE3RYUG9VFS5/fX
         hcBMANDF/Dsv41g/IGaTbHNoLQVsSvPXU/7GQ+Ntqy7xx80HASDXViu/cnjWvLZbuwjM
         Lhdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815369; x=1747420169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmUdZ7NWf24NGQucaka4MppQGDe1r3WG/B9nuhCN99s=;
        b=OnMfJYI74AT6PxRGqjaV+5As1ahlPg94CvrxuONE2JNbDPLFwhRMu4mfspvY8Lb4cI
         OiOa0E1OqeFqeyjI2Snk4h1y8rWb3zH5lZdGyPjsdn53rvQcSTcTAxpn4++u0VTahkWM
         +S3+eTxC91KmojtTxSoL51OI1yt0m1C4koP31uafc5/ErRrozfvs3zg6l2K6IgKFrpSx
         WhV03Wf73SIojvnRaoyWJuAQ/+wNNAF1EtyXg620tLQIV357hUpjvAsFT3KCMngEpj1G
         viBjiPgP5/ugHsSLKdyWRomdBrqGIEeWaWYvcdY1gvEYdBNYA+rsZvreuBN+NBP8db5y
         /3/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXzO5RSFAy0XyHhMNrYvkk8cvAes/KioUXlpWGnwXP1afaqIc68TCEhrwpMDDR3z8VuIVL2IVDrGYvOFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9HdyKp/gtxv7DHCjjgzXd+SKcK3VNILA4AHRKauau9TMyy9s0
	aW/kWq14y3jeUOkuXrziICA5m8Ilv66+6DLhkTmmszUNt6THU3ENTFyayzgs1vSi822ragAF2qg
	sew==
X-Google-Smtp-Source: AGHT+IFrOu+Urvz0vnEY64t3GWYiH2n9+rMd9iGS1EvnXRCr73zi7B72X8HzZk53Hxmd3/d9MS5cFDIYAAg=
X-Received: from pjbrr8.prod.google.com ([2002:a17:90b:2b48:b0:2fc:13d6:b4cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e841:b0:223:60ce:2451
 with SMTP id d9443c01a7336-22fc8b33427mr57550815ad.15.1746815369640; Fri, 09
 May 2025 11:29:29 -0700 (PDT)
Date: Fri, 9 May 2025 11:29:28 -0700
In-Reply-To: <20250509081615.248896-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506093740.2864458-6-chao.gao@intel.com> <20250509081615.248896-1-chao.gao@intel.com>
Message-ID: <aB5JiE6LupZhmqJ7@google.com>
Subject: Re: [PATCH v6a 6/8] x86/fpu: Remove xfd argument from __fpstate_reset()
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: bp@alien8.de, chang.seok.bae@intel.com, dave.hansen@intel.com, 
	dave.hansen@linux.intel.com, ebiggers@google.com, hpa@zytor.com, 
	john.allen@amd.com, kees@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, oleg@redhat.com, 
	pbonzini@redhat.com, peterz@infradead.org, rick.p.edgecombe@intel.com, 
	stanspas@amazon.de, tglx@linutronix.de, weijiang.yang@intel.com, 
	x86@kernel.org, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, May 09, 2025, Chao Gao wrote:
> The initial values for fpstate::xfd differ between guest and host fpstates.
> Currently, the initial values are passed as an argument to
> __fpstate_reset(). But, __fpstate_reset() already assigns different default
> features and sizes based on the type of fpstates (i.e., guest or host). So,
> handle fpstate::xfd in a similar way to highlight the differences in the
> initial xfd value between guest and host fpstates
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Link: https://lore.kernel.org/all/aBuf7wiiDT0Wflhk@google.com/
> ---
> v6a: new.
> 
> Note: this quick revision is just intended to ensure that the feedback
> has been properly addressed.

Both patches LGTM.
