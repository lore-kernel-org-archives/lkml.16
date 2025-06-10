Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACC123183E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584561; cv=none; b=of/LBH5NCNGM37puvi209IdwVgyfKJU6at4RPUnxgNI6N7bm4K46fXZDb/7PYemVK29mKMCsQ84by3iN/EvxL8jh2giUOyxMqa4hR7ssLe68KksnQJpZmLSCeKzZN2nzzuZ/Ssyi6wf7r88F/rABfty4xPsHexv2P9wby7iiVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584561; c=relaxed/simple;
	bh=BNhw0XBfXHMOeaPgTMY/f9mkfBnPLyvADW3B1BmbS2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hfjGUO5d5FSFfdne82rkwvb6jsoukoGKbL6ViSDA0uoKsQoPCF97kXcXcXZTK9JneL5qCGmvn0YVjFrAVcA96n/dbfQHdecCBTV1TocXL7iqy3kIReGqGLkLMVzJbFwIZRyFWAR7TYHCFUzkuel1uEHSYB4YYvGPuWehXRxZplY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dtdgQTeR; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dtdgQTeR"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2fb347b3e4so1183208a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749584559; x=1750189359; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yKLltdt/WLKHq128Ze0+XQKxN6okQr6D2NCcuRhNDJo=;
        b=dtdgQTeRpOkeqnNZxz9YfX/UBVwMGybwHCsds6BD/CrRfbg3FPd3iJeCaqgiOWI9Qn
         wK7VGv2BPcdKeCjznQsOl54JETp6OM7XVsVSgFuC2ntxm6aC+VAZkw1aJT3yhuvWH1kG
         njAikuu5GyaSHSxdwUT/GKD5aPuDt1pvA6NQAGHz1jTRqT6VPE6F397q9v84NWEnh3GE
         2sUIptXQ79IzUFbmRCyOsw5C932BfzKi+lrW4KF5ktgYjuszgIpbJlwSju2Fw4PLjCH2
         ViumX2pudRvAxBWk2IC/eokLXO8by36xH+HUK67rtFDwxrTxGdfSPerX0/nDQzwF7xGo
         kpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584559; x=1750189359;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKLltdt/WLKHq128Ze0+XQKxN6okQr6D2NCcuRhNDJo=;
        b=krh/FHwQZqmPmwtpVMd/DixGHSEk36myC6c7eSvAx/jrOpED8hrj6S+mmFqS8DDTpr
         XINl5Qch6FgD17SNmMSPN4H3XSDiZEN4IfRwcwhDPfBaLAxo8dOoc8TNa76jCZ/vqiTp
         qUEu6PMxl/3On9ZCYY8tAmttmQ6rzqbNvcVDZm8eIsHG0cXeSK1brO+ISEr0MrnTs+rO
         VlXq7W/QS1SSDfXOiwUpKkpSjAgVaBca9T3M3c7NMEkpSsx38AOOa0hgaHJbBKGHSBMD
         1G1Ml89ALfzN+QuODZa7qiCZqFCOhcW3qvzBr4JTP+zDyhsSE3pWYe1Cyd3Y0TwpXmMx
         9abw==
X-Forwarded-Encrypted: i=1; AJvYcCWArW/6OrAV44QgHa+fkvT2oa8LbRP0Bz5WQucn40vaJHcWynocrkcvS5OK/I8/xjM3MTXRWOaeuaHYZBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGSQvxyszGoxv4fD95p3qXQycPTLvcBoUdAV9r/7vAFb70iTzq
	kfO2w5aoX8K2dbeHc8eCXZQ7VqwyXSqV79V9mNpi2uahnowvczy4kVw/SJdLvyoX7/S5oP1HkAS
	/M0efvg==
X-Google-Smtp-Source: AGHT+IF3lN1xqZpfLKDStwxaRuGouawxqx2dgLEoer8Pvy8mBY//DiSnV53VrdVqUjSCJXEwMfILIQyL95s=
X-Received: from pjbpx1.prod.google.com ([2002:a17:90b:2701:b0:311:a879:981f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5291:b0:311:c5d9:2c79
 with SMTP id 98e67ed59e1d1-313af23dc38mr871005a91.21.1749584559644; Tue, 10
 Jun 2025 12:42:39 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:42:15 -0700
In-Reply-To: <20250424052201.7194-1-dapeng1.mi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250424052201.7194-1-dapeng1.mi@linux.intel.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <174958165124.102860.1466726781633621770.b4-ty@google.com>
Subject: Re: [PATCH] x86/pmu_pebs: Initalize and enable PMU interrupt (PMI_VECTOR)
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Zide Chen <zide.chen@intel.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@intel.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 24 Apr 2025 05:22:01 +0000, Dapeng Mi wrote:
> PMU interrupt is not correctly initialized and enabled in pmu_pebs test.
> It leads to the APIC_LVTPC mask bit is never cleared after first PMI and
> all subsequential PEBS PMIs are suppressed.
> 
> Although it doesn't impact pmu_pebs test results since current pmu_pebs
> test checks PEBS records by polling instead of PMI driving, it's still an
> incorrect behavior and could cause some unexpected false positives.
> 
> [...]

Applied to kvm-x86 next, thanks!

[1/1] x86/pmu_pebs: Initalize and enable PMU interrupt (PMI_VECTOR)
      https://github.com/kvm-x86/kvm-unit-tests/commit/389dfda487f9

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
