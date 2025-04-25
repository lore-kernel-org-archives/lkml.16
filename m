Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D22973CB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745623410; cv=none; b=crIc+UTfD9doPLFtJbS1gF3V3HzbCpRn/IX43Q/HNz+yfTWYh/TxLchQsrfk0eXebPvDfCzoFKV6RjFyg1ovb0yv9oPLvKqnwZdz+vazfWa8YsAmH+3DxTUsbY+i9/I60F0eckJOhTv5JgwW4GdGPGitUZk4UVYy7+e2eCbSYBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745623410; c=relaxed/simple;
	bh=xRQfMP1XFOx9qITimYkGXWDvRrdKrkeHm+DJCoV+Prk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=feGT8oduWrP/ibANfYeWICeZN41WGufzUhjo7JzdNpgcFWTJ1N0W6znNQ5q7LG6J4hvq24t1l/QDcTdRiZkfFywO9wyAY13Nwtc3ydUvOvULQzNcwk4FO+SpqF5kriFZ1+2+/+p+Dwf8593uj7mVoQMNWkDi9h0OPsGYp5AZPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Poums8hn; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Poums8hn"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2241e7e3addso24483465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745623408; x=1746228208; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ywngk5EyrH43CSmFrX2G8BVOihut64iaWtRXLrbOWSE=;
        b=Poums8hnsmcZsMIzFoYFHduhssn2oN/W2959doE6GOJ2ODHHIbeGgyOSuXdVOjGHIV
         lU0/KyA0kvl6YbdfVFwW9FmXg0JtgBQxo5Byo4UIzfTnPkJ2i7Amj+t7DpeYo99AtG+p
         bmuDz+hHdqEBEJl+Gt4kYdA2OBcXdcCK0dMc+AC9H0yy2ImcKTBAQykJszPyLujJWMDq
         s0K0xp9mHSYeULUQ8fXRupAakQtZydXEB3FzmDExMAU9MdZ9SuSuT6VmqaxgmTCG3bJ9
         /HC7EGhQpnKTGc2WIY8fGGQjlOYDTW/rVRps6UHgpIz5VwxTnpMXbs8wxglvxLiNHwcC
         R4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745623408; x=1746228208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ywngk5EyrH43CSmFrX2G8BVOihut64iaWtRXLrbOWSE=;
        b=tufNWSuW5mb1Ic6zbMJmSqhxGcc6Vkd2qJH3cr+9v3wjUiHCk0TmrBXsph5Vguo5mg
         /tKOR1XOSTENnt3tfuLqnbHDpg6rmq4k+xGFlScmEzhVVKUajJj0C8FFtDJibTGB6jfN
         O2YKhAqxVRFsXO7L/oteqMla/IpJN7EzntYqvDmayJM15eIM8VXtQemLCKbKL7D4aqvr
         8a08y66zUjNA06dXQJaP0ullBqrf3EXAhMPmtxqv/bATnTowSgA9iHLEbVpWrsvt5jw/
         UJHfEHXnq9tSy81cOWoOxO4A6ZZ9mZGDpkC8JjEPzXR6lWfEX8O27gZOhhhCu4diKHw5
         ARLw==
X-Forwarded-Encrypted: i=1; AJvYcCUKbmPLnOoEiKL5QghbJSe7MHHK0l3dnXM3UpqLl1PMGw2mHft7ZGbrbk8HLMp+D++Yd8qKprYVL6KWIXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCCtKSv5L+Cfv5WZo/itt+uzU4HBQw9o6b+BraIhSZEtyPLXC3
	UBwiH1zxtBqi0NmPSITtt5zumj36KudvglSs34Y303RNWUQIrYnJO3MK1yv5ogeiymeqRAtHMx+
	Cug==
X-Google-Smtp-Source: AGHT+IHVxXK3XxZbeGt/u4CyqKrgiBasZXhRdDliozQ4/a+jP1h/kb8v1M5XZMgqEeCFii+UcH9HIfN932k=
X-Received: from plblf7.prod.google.com ([2002:a17:902:fb47:b0:220:ddee:5ee])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ec7:b0:223:5945:ffd5
 with SMTP id d9443c01a7336-22dbf6409femr57525515ad.32.1745623408006; Fri, 25
 Apr 2025 16:23:28 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:23:14 -0700
In-Reply-To: <ee1c08fc400bb574a2b8f2c6a0bd9def10a29d35.1744130533.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ee1c08fc400bb574a2b8f2c6a0bd9def10a29d35.1744130533.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174562166515.1002335.4837189500291274188.b4-ty@google.com>
Subject: Re: [PATCH] x86/cpufeatures: Define X86_FEATURE_PREFETCHI (AMD)
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, pbonzini@redhat.com, 
	Babu Moger <babu.moger@amd.com>
Cc: x86@kernel.org, hpa@zytor.com, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, pawan.kumar.gupta@linux.intel.com, 
	thomas.lendacky@amd.com, perry.yuan@amd.com, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 08 Apr 2025 17:57:09 -0500, Babu Moger wrote:
> The latest AMD platform has introduced a new instruction called PREFETCHI.
> This instruction loads a cache line from a specified memory address into
> the indicated data or instruction cache level, based on locality reference
> hints.
> 
> Feature bit definition:
> CPUID_Fn80000021_EAX [bit 20] - Indicates support for IC prefetch.
> 
> [...]

Applied to kvm-x86 misc, with a rewritten shortlog and changelog to make it super
clear this is KVM enabling.

[1/1] KVM: x86: Advertise support for AMD's PREFETCHI
      https://github.com/kvm-x86/linux/commit/d88bb2ded2ef

--
https://github.com/kvm-x86/linux/tree/next
