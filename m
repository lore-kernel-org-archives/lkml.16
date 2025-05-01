Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF32144CF
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746124455; cv=none; b=W7mv/9TJuz9T0f1D5SoDbAO8KMMceKsVVoGZg+pvYuNAxVRG5g7+rM7Yk+6pEFPRUEbZrrp/ei8sKyC39IeAD3tbO8kd4nHjgsBInQimbaHQwgXz9lWdPtOZuQDUz1dHFYvO7nxVlhvcvLIPdKB10xcE4Lw86aVmwk8n8UCzPL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746124455; c=relaxed/simple;
	bh=+DAZETPgGKlVNaxrjII/8WTA3PntLOU1NMdtZAGUhfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uH5AueksKp4/XdSOzOZzQMwXFfkbmtfqfr9c/tihcoSxBCqfkUY921FuPw4BngYNUicovBzWn9j1mfAsOH3ttbQ6oaMKClztW2T6F54frhf4YPR1A/JHK6eaGVX1itmd2DQxSLlXCZmq6U9XoN3+lLVIJoCotbEJPNYXB1CXji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g/DQatTt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g/DQatTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746124451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0qKIEW/lhMjwEMGxy/raOMlbK5hykaujRDE/weD2Tms=;
	b=g/DQatTtN+vBNTuQaMKc7EzIeicYNSSyR+oQ3L+4X9EcyTNg9YyzEHKA0q3eayI8/zgnkG
	2wiu1jl21E88IdSup3E/7YDcta3Z2ggHeVMeenLSQaTz4hkjs4nCOf1mtDHU/dbfnUyp6+
	DCqmLTyQSKcKU4ECoMerZfsxcBBydFA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-pul7Smg6Mo6BD0dO5PU0fg-1; Thu, 01 May 2025 14:34:10 -0400
X-MC-Unique: pul7Smg6Mo6BD0dO5PU0fg-1
X-Mimecast-MFC-AGG-ID: pul7Smg6Mo6BD0dO5PU0fg_1746124449
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a07a7b4298so518268f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 11:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746124449; x=1746729249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qKIEW/lhMjwEMGxy/raOMlbK5hykaujRDE/weD2Tms=;
        b=djfQn2sww1uwBxQb0J3HGvF1D4faVl/V6M/qi0aPzRBgssHUfoDU2KLuesxcYuIZwp
         qzObihSzo/Mgy54g+kg/x+5jXaMkZ4KNIZXd7rKa2Fg6lYxKdBC/VYGGFA2YkCtjelZy
         W5uBKvNGvfhibfV29ATFWwNFBSrv6Q8+27N6l/yu0+CiZiiDRfTid7a+bGV1c3HNUZRv
         t2JndOX8GMk68DXYD017HSBC/3biyAwfLvfnuLLw5cANgTqawAhR0JgaTslyGWePvAZR
         IbeuPOINt+j1QPN4RXeoSaWhQPE5YwKd9lc58kYUKPVBFQXhEpEe4s8EZu7qHtpjX//h
         3Isg==
X-Forwarded-Encrypted: i=1; AJvYcCUSAAH0EehiqmHaFJ95+d2p2xKc9eYKDP5TKu2OcHANbUgL3PDWQhHm0XBBlsvbK+/eK4gdRPt0wu2BZUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9XoUTnFC3E8RX45ZMxU8fyoHZzFR1brOY515hAUYYN901f3/0
	9WzNbzztsRYf7Y+u4B6Se64fYfMGRvkSS9D8BaYheGlmMJ3kp3CzRolcDKBjKaPHRmoZr+TRCDJ
	HcxIgsug1Zeca2F8CBQk77bQUXU59Uh9OJOMM6IsJKtI/NtlzzA1EXCIxDR+RsjOc2aF1aW8rG4
	4u3F6WPHcGW4mTNHZM/5pDGWtyitiQ9FX5bQ1o
X-Gm-Gg: ASbGncsRty7edFPNPKSrOGlf+D/jUi57kL9XqUjQ9eD/U2bBGopdchh2QsxnZJ1/gL4
	qhhJapZJL8WhTnCpzCMPRT9hXzxemtGnDNgZ4tT23l2w7q761PrsEDJd7iLQOmZ2EFcO0
X-Received: by 2002:a05:6000:2cb:b0:38f:28dc:ec23 with SMTP id ffacd0b85a97d-3a08f761e95mr6926090f8f.19.1746124449427;
        Thu, 01 May 2025 11:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8pyZZxNLsDKgK+s6EiT/5Z0RvhAJbHB3j6sE0QEEuK4GrGOmkb5NB8jNyV3jUBy2M6Ty7WMK3PucatHbyoBs=
X-Received: by 2002:a05:6000:2cb:b0:38f:28dc:ec23 with SMTP id
 ffacd0b85a97d-3a08f761e95mr6926061f8f.19.1746124449084; Thu, 01 May 2025
 11:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430110734.392235199@infradead.org>
In-Reply-To: <20250430110734.392235199@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 1 May 2025 20:33:57 +0200
X-Gm-Features: ATxdqUGj_DEOILwA7gJmdwUbmKq2o1Nt9LtM9RStnzYMraMRgnH01086KHJWMt8
Message-ID: <CABgObfZQ2n6PB0i4Uc6k4Rm9bVESt0aafOcdLzW4hwX3sN-ExA@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] objtool: Detect and warn about indirect calls in
 __nocfi functions
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, kys@microsoft.com, haiyangz@microsoft.com, 
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, seanjc@google.com, 
	ardb@kernel.org, kees@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	gregkh@linuxfoundation.org, jpoimboe@kernel.org, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	samitolvanen@google.com, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 1:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> Notably the KVM fastop emulation stuff -- which I've completely rewritten=
 for
> this version -- the generated code doesn't look horrific, but is slightly=
 more
> verbose. I'm running on the assumption that instruction emulation is not =
super
> performance critical these days of zero VM-exit VMs etc.

It's definitely going to be slower, but I guess it's okay these days.
It's really only somewhat hot with really old processors
(pre-Westmere) and only when running big real mode code.

Paolo

> KVM has another; the VMX interrupt injection stuff calls the IDT handler
> directly.  Is there an alternative? Can we keep a table of Linux function=
s
> slighly higher up the call stack (asm_\cfunc ?) and add CFI to those?
>
> HyperV hypercall page stuff, which I've previously suggested use direct c=
alls,
> and which I've now converted (after getting properly annoyed with that co=
de).
>
> Also available at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
>
> Changes since v1:
>
>  - complete rewrite of the fastop stuff
>  - HyperV tweaks (Michael)
>  - objtool changes (Josh)
>
>
> [1] https://lkml.kernel.org/r/20250410154556.GB9003@noisy.programming.kic=
ks-ass.net
> [2] https://lkml.kernel.org/r/20250410194334.GA3248459@google.com
>

