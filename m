Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9372C2E92A7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794128; cv=none; b=peGuZTp04+4h2ARMES/K3Oh7d/lqp8S9eClgZO6ceupnI+TMybc9SAelVtO4jl3GDHZeTWva1bImkgO7LMlkmyafF34pQOjVsIRE8pYX2sGDyH9Ih3/dSwACUWHKnrhdAWkr+dFltev0JdBf2VXHeMzQwsp838Lso1GF5h7roxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794128; c=relaxed/simple;
	bh=J4vR7SZtbxRakpQGlJHSsT8TJNks6Led0n3EAyUc0K8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eDfnw0iow5lwcrWo5V44gmdJzvCs3J/cOoBAoCPiVE5EfrK9KvLXPdC3DMLte9RlRO/3k9V1MMu81IH74rlx1BNG7x6LXpCONGytLgkf4CiWwyU0ZYUC9OqWqZ850fRspCmUfAQabxFfdUrOWCV/MafJVqVGhVN/+xhOyflfCSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vJViIy5k; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vJViIy5k"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-234fedd3e51so55966475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794127; x=1751398927; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FcIVsm6SwCmai4pYGu1I3g9ltmCQWixFuWfg9AQgveQ=;
        b=vJViIy5kyg957PemRHKQ2O33/m1WVggkuuoQ5APMaaqW7tO01B8jANDl5lbPpQ17QB
         o+/GPh+BnwGHin90FU85P/N6VM+jqoZm30xyuTfn5ZNBqblZTcjwQlqVhopwp0I5Snr8
         xMY9pIJgfkuCVR/s4x8mkPP+LDFNxIwe75CT9cSvfG7jmFHQpitwOW2y7xaWQJXtCCKr
         t3p4bADYCB8Y8KS6n5eaKCogGZyPW4/RiZ9K5rTyg0yNupichuflQ10NRXz25KDkb0K2
         bW6MydUt2ROnwK9Y7d9kSt7rf8X7bkd5CmH4L4IUPk+kh+cpFKqxVv1Y2BcRXqs7Cujv
         Lseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794127; x=1751398927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcIVsm6SwCmai4pYGu1I3g9ltmCQWixFuWfg9AQgveQ=;
        b=gaTWFZ+80K6iyiG4ki1AshkJHb13sJjL+NPp7YC/7Snd95dsDUsxqRJb4f5n8KI/Qc
         qKan0VuS+lBkCJDK0uB/xwJ5Z/6RedaSfDofVL7RwwqtozFMtkcsGRw0tDLc0U+TBeGR
         eOlGPiqKsS3QwKB+A50MH50rFMLUCkA/zlDIyfImHAUFYGiVHnqzQlhAeTPvE3JmpeQx
         74BtepVv3TMTxdSHrIGXGp6USb/q29IcOHwOw9iZ4QR0oSRnHPsXzzSvYvI29rH6Hx1p
         obgJddfLgKZNbEFSL+Ym4oomhsEDW1qZy6+ZUwvMJIYUvCufHTO3CTJ5qJN6BjAKfpfB
         C00w==
X-Forwarded-Encrypted: i=1; AJvYcCXd46aKT0NprYEGSupjRrSPmvJgacegRO+va6hSXWd+dZle3V5IdTpvmpv1ydZRIRVdBldBc+73HmHK+PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxxoXF0AsMwQeyTNf1mk5XTKhbHzP9BbvSuFxYu2gXYkJ4Kvxz
	i1B4SgjrZkOyhB6tn4EHLpKwVsXKqIAHuOzjdLEwtphWyPzOiyWjGHOIl8X22GBQO0hWd4npwsX
	+n25OxQ==
X-Google-Smtp-Source: AGHT+IEq6KgpAt5TZlBf/a/lvKLpoi3UG5KRbpv+ZxHvaNEAIVgbzmKUN7CslVZPXksufY8n8U0SLN5z8sY=
X-Received: from plbmv13.prod.google.com ([2002:a17:903:b8d:b0:235:54f:4f12])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4b30:b0:235:129e:f649
 with SMTP id d9443c01a7336-23823f99aa7mr9831915ad.12.1750794127166; Tue, 24
 Jun 2025 12:42:07 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:38 -0700
In-Reply-To: <20250523001138.3182794-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523001138.3182794-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079268655.517596.11530108670607154610.b4-ty@google.com>
Subject: Re: [PATCH v4 0/4] KVM: x86: Dynamically allocate hashed page list
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 May 2025 17:11:34 -0700, Sean Christopherson wrote:
> Allocate the hashed list of shadow pages dynamically (separate from
> struct kvm), and on-demand.  The hashed list is 32KiB, i.e. absolutely
> belongs in a separate allocation, and is worth skipping if KVM isn't
> shadowing guest PTEs for the VM.
> 
> I double checked that padding kvm_arch with a 4KiB array trips the assert,
> but padding with 2KiB does not.  So knock on wood, I finally got the assert
> right.  Maybe.
> 
> [...]

Applied to kvm-x86 mmu, thanks!

[1/4] KVM: TDX: Move TDX hardware setup from main.c to tdx.c
      https://github.com/kvm-x86/linux/commit/1f287a4e7b90
[2/4] KVM: x86/mmu: Dynamically allocate shadow MMU's hashed page list
      https://github.com/kvm-x86/linux/commit/02c6bea57d0d
[3/4] KVM: x86: Use kvzalloc() to allocate VM struct
      https://github.com/kvm-x86/linux/commit/97ad7dd0e53d
[4/4] KVM: x86/mmu: Defer allocation of shadow MMU's hashed page list
      https://github.com/kvm-x86/linux/commit/59ce4bd2996b

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
