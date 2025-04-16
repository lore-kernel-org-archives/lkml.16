Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C68322423F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744830397; cv=none; b=io8u7kykdmUMxiphjm3/rK4YKtsaN9ALjVbDGwLxrK4biRr/m1iSj1pUvsTB5fC8kNIex7yH4TLz6I2Jq89Ql4w67BzTzyu5cRa9loj1bjiER8stzH6MQJPxn6MES4bh46A+57JakPNA4trUiliOYVsDB+bvhSx0LATwXgEHftI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744830397; c=relaxed/simple;
	bh=8z47v0y/RBpvELhTNkc41DID8InWw4fwZBbvVfaGcgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCm2ZCU2NG7Z5wwk9VjLZMaLMXAwX+SBsCXrROGn2ymvcwLkDIu9odkUIJaAKfnsGsKUN/TDd0dUO+mzEIs48ULOiqgcGxdD/WE+UJVTZXsV2usSS6izbWUPM/MMvb65yZ07NmuiVmRW6sycs9gaPCCLdTAcLq3X6qm7c0kF2Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vvDC6X4C; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vvDC6X4C"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2264c9d0295so34635ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744830395; x=1745435195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kWuAzoWjXRQKcdL3H3i479C55svElbJ5pMQd8TVZ4Ts=;
        b=vvDC6X4CppuiMiOVfBry7XxFH6TTNFzYCDH+VkUJ/I6kv3YZecU8RFUplfXdUZkUBS
         aENIWc4LGOxr9hW9qxjpQnu3ToKCf+IirJ2cITCyRYxuXWNbnLlPAadMwL/b+d1zGfW3
         3iDPhsjaIwVJe5G0Jxg+hDmckXeUFQB2zFu2Tj1paF3Ij+3nuNH0HfQU16tpMdEURYO7
         g1aBYfv/MnNtcREhcRac51iVZfD7FQ+EacEx9GM1FBhs7jfhNxGUvaxhako1MjTeJ0Z7
         QplF7gG3JJJg48Cz6FIPmBTkmqDHG25fXHGmTtVsSxl9coRD7I143V+S/W7TAtI3zlLm
         gJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744830395; x=1745435195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWuAzoWjXRQKcdL3H3i479C55svElbJ5pMQd8TVZ4Ts=;
        b=vcXM9UqFrx98XClfupsLcaOqP61BsT88VzaJp2qCgSVcorWQKIjMW0UnGYUmEoU2cW
         NN6S2bl7s1QiZXz5FA8u211dMLv4iEYGp9kwXUq+pAz6ldyv6UoeIHL6YmRNZ7LDMrIh
         afHqTEKBcXNsN+a4Q0mNgcOK+gwOCnANw6D2NLGAt6Fmocn5dBqFccQPKzLi9ApHoqo1
         62qd7hlW1gh4WSa36RobNIJEO3ULOVmqm46LUPWZWTf+Y/6je18yyFFdn49pATMMEg+8
         Uf0AuqIgFrKNbzIk9yO1lJowSsGlcWB+5OXAx1xmr9TWCGqZYBv3P+ntJo/9pUsHgRdd
         MOsA==
X-Forwarded-Encrypted: i=1; AJvYcCWAY4d98sN02Tyuqgua5wPux1nIR/1yuF0wsnrHbxFLV+zBZEeWw12SaGX5IDZZaQEaVBFCKz8giKHLnTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPau4pxYk/7G7jDHjGPosVswK902FQwPwHVBJaF52XOpSVN2J
	+MiJwmZ+mZYZJSST8zGFrTEORpYBbDU/ak06b3EOMtEd+NSSZAe/GsF3I2zBLIyu7/Pa3IkT45Q
	uCw==
X-Gm-Gg: ASbGnctpkaInyswuKwpDR85GZvFat17sdlsL/HQjHYiQB7uvxu9bl7TVinWQweOrNt2
	UyrDGKzy1GnKHT3x+KCsr5HVO1IS5b2lX08sI2bq5JAJxErUIjJA0Hvb2mEqgLv3ZDSskR3Ox0x
	aw4tH1bUrqzdQlje48Edk8zwYCbu/a1J7ArbgGKus2QEWzqAGPoAH3FnHZStu6g2+l8LkCCcoWc
	4kRrTtpC9z5FFTtoixasjuCyhTSAycVhbwkyH6PCGU+iX9fc04PEHvYziuxrh8sS1ZKd+TKuIdE
	/zbqlB9lUSGEdUyezd2+/vlAvLcx9MuOP07Aac1PT8C+hNK3yKRTqWYBsu8lyR3sb5Iy/mvGzz8
	s+g==
X-Google-Smtp-Source: AGHT+IGi66f8+mN6aN8KhzRjjcF3CHZ0D2PJue18obrWmtFxD66ZzfNgY2fZUJNbR+nxkfakJTeGhw==
X-Received: by 2002:a17:903:240d:b0:21f:3f5c:d24c with SMTP id d9443c01a7336-22c40e7ff19mr616215ad.0.1744830395119;
        Wed, 16 Apr 2025 12:06:35 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c65c9sm11192998b3a.61.2025.04.16.12.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 12:06:34 -0700 (PDT)
Date: Wed, 16 Apr 2025 12:06:30 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] KVM: x86: Allocate kvm_vmx/kvm_svm structures
 using kzalloc()
Message-ID: <20250416190630.GA1037529.vipinsh@google.com>
References: <20250401155714.838398-1-seanjc@google.com>
 <20250401155714.838398-3-seanjc@google.com>
 <20250416182437.GA963080.vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416182437.GA963080.vipinsh@google.com>

On 2025-04-16 11:24:37, Vipin Sharma wrote:
> On 2025-04-01 08:57:13, Sean Christopherson wrote:
> >  
> > +	BUILD_BUG_ON(get_order(sizeof(struct kvm_svm) != 0));
> 
> There is a typo here. It is checking sizeof(struct kvm_svm) != 0, instead
> of checking get_order(...) != 0.
> 
> >  	return 0;
> >  
> >  err_kvm_init:
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index b70ed72c1783..01264842bf45 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -8755,6 +8755,7 @@ static int __init vmx_init(void)
> >  	if (r)
> >  		goto err_kvm_init;
> >  
> > +	BUILD_BUG_ON(get_order(sizeof(struct kvm_vmx) != 0));
> 
> Same as above.
> 

After fixing the typo build is failing.

Checked via pahole, sizes of struct have reduced but still not under 4k.
After applying the patch:

struct kvm{} - 4104
struct kvm_svm{} - 4320
struct kvm_vmx{} - 4128

Also, this BUILD_BUG_ON() might not be reliable unless all of the ifdefs
under kvm_[vmx|svm] and its children are enabled. Won't that be an
issue?
