Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E116D2F362B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890378; cv=none; b=OYPh1sSt92DWjgUBAceU2hOF6+BN9FHRuGH7xZHmB6t2jm8hiNvH3OnjIfarvMYmnWpt2kOXnGfHK7CzlAu77izVyG2stXHnwaJ4YwR9ICNSy9skyG1ajhwKdzOQyl2R5tdiariFC+O4FoqAlnVCOxhRsZqqOJMEQ2Q7Lb0+UsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890378; c=relaxed/simple;
	bh=+E8EpWppY5+z5Zzf48g8XA+vg9TjHKzBWwqNlo6Zjq0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JXivTSFHJqCRD9lfJkdVx86SO6DpoCmPAAuokKDWIeqP9C2SYIj9SbXuc0VYvhh4Y7M7r+khAL16l3EvPdY+FfRNShq0r92F4XIEdVNUSxO3Uk8R5tWIXXfu0JztmZvUgTFXu7mHA77N3EfNwg1MFHsSiGdzecK/59MPsjTP7pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zcL/OVtw; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zcL/OVtw"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313c3915345so393452a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750890375; x=1751495175; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5P0C0ay1sg6VzBmBVHnNwzZiHo9BP6seWcPK5go4PNI=;
        b=zcL/OVtw27M3cM+KpQ9SDGGPI1shnJz8YMXM9D4vdcKSjFyiJhdqR+bkg42y3g1uPa
         7oq8VBnXyrBR+3hjdeS0U+YfG+KCvoZJiNnmLwAvG97jfaYw44jpQOf+gE9PDZDsFDnD
         AbHkRNn/Zip+5KZhhkupaTdT9YDMVxMe9ghWNyfTsy+ED9f9ttEqV/iQ0Hba90d4JNt3
         j3UBYwjCUg6wczoaHmKwJLmpIwie5P5mT3Z6EZhzBz7bR+dRxtOsuALXZibVs2MWTt82
         59Ss2jwt1RS+bGG8w67QQCwQjyqj1RtBmIpFTfqsBX4it+hWo2zZEA9jXLCHkf8oEdYZ
         zKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750890375; x=1751495175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5P0C0ay1sg6VzBmBVHnNwzZiHo9BP6seWcPK5go4PNI=;
        b=PSEFsswfrXDLfPMOkHeEdAYdqV+MDa93o2Xcxbwo3N7XVNyBEenBc2+PRJjXeOWBlK
         8R7YxpErUB1X10djfpDd4PKLAucI8r4lRtxibdMU3+oel7p5qdCx9wccixzGXIXqdrkT
         JzUksTGx7pxmQrOY3SPjYCupw6zw28a/815vL3P1Hbaz7gmJdJwfGJAHY6235YB+bAJq
         zj62TeZwh39T3+oaCUXuPYL7OOvtoOE/Pn+ACHL3TALg6NWWOSA0Xw/rDIkuFH6k+HH6
         Rj4cmHMnWDMmZ3OrQ6apV3iiDOyIQGclAa7hwVRTzC5TvIK17RrRhuHvhJwY1/Np2x1E
         LTTw==
X-Forwarded-Encrypted: i=1; AJvYcCVFKU20HYRbePf0yosJQCWzVyxLSOYVtTrAgUjoMkvKb8UGoB+sUa45nw75+AjttWpeukOs/kkfIRXA0+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0oeiKNwVmHpqhDWPeuqw97YLUbwHjCm9tBA93UDgme2nJULMV
	7Wh3N14WyR/krN2YS6sr1T6iXuhe7iqj7DzMrVVSjFUeqSpqOS47C4GcUZ8myqXFhwRqA3Kc6rN
	d1NJ88w==
X-Google-Smtp-Source: AGHT+IH1teFPxnZYyI+Zl9dnd3n0vbjMm6JT635LpkcUQ5aBNQq4BJwtfTJcGPRDPWWcdL2cdyw4AEW8xkI=
X-Received: from pjbta14.prod.google.com ([2002:a17:90b:4ece:b0:311:ea2a:3919])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:574e:b0:311:e8cc:4253
 with SMTP id 98e67ed59e1d1-315f25ce932mr6982074a91.2.1750890375324; Wed, 25
 Jun 2025 15:26:15 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:25:29 -0700
In-Reply-To: <c090efb3-ef82-499f-a5e0-360fc8420fb7@tum.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <c090efb3-ef82-499f-a5e0-360fc8420fb7@tum.de>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <175088956523.720749.10160134537876951534.b4-ty@google.com>
Subject: Re: [PATCH] x86/hyper-v: Filter non-canonical addresses passed via HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST(_EX)
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Manuel Andreas <manuel.andreas@tum.de>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, pbonzini@redhat.com
Content-Type: text/plain; charset="utf-8"

On Wed, 25 Jun 2025 15:53:19 +0200, Manuel Andreas wrote:
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
> [...]

Applied to kvm-x86 fixes, with a massaged changelog, e.g. to call out that
"real" Hyper-V behaves this way.  Thanks!

[1/1] x86/hyper-v: Filter non-canonical addresses passed via HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST(_EX)
      https://github.com/kvm-x86/linux/commit/fa787ac07b3c

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
