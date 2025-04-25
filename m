Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641028FFF9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619548; cv=none; b=jSBg0dtnkP7Y+dx/5NUPp4gx/1WAPPXip4on0xiX3FLza0ZA/FOq5kGi+4PRte3MWNWPI/rdObyz6PJk5fS2VgbjmV+9+2hZ5DxOipqdJG3eiIGsuLA6Jw+OA70F9xdG7BxlEQyiLCHp68g0KqIBg04vHSygJGFzbfVIYPr29NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619548; c=relaxed/simple;
	bh=0gPwRJoETyKpWWZRYXz++1oSJIwiR7UbDHh4Yy958H0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=blkizht5HWGf4WU91ESkt0eNPjdsAVEcu4VSDJCIgKxdDSaZcDciMKJ4YtCl4P3khesRCyD8KzfTVBX6gAEhoHltqphZ0zFLkNyMIqzIBkSZpJpWyhMET7a0KSXNUf/DKes117PxFafcHnzPEf8M/zPyF0ObJ0Rbm+mje4qaP5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3GYbmYdI; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3GYbmYdI"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af5310c1ac1so1579203a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745619546; x=1746224346; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVIkhW8fkFuUniqBPXDyVR4LXTr/9REpR/pQzgTViRw=;
        b=3GYbmYdI0whtxeR22Prro+Q9U0CFpdDiYZv4CsAeoeWSWr1Dfn0/G9HcsGKTsJpCtN
         XwppHEJ5t0D0uLYKM6nu4VQFzs2FBALTvucUKNNUJwfuvafq1NVcOz96CsBofLlHgbAV
         HEFl24bh7L/mMuWdYeBvCfJ7U5ycl2YLgv8UpsX80vcVBGF852jSrdCGl1m2HMFwqRD6
         ufuccP/P/b3dIsJnpmWxosw6JMbcPKWZ8wdR877ZHXD1N99Q4fpPTOLMFqvps9B6ipJw
         S8AvdhJ50KPXxpNB8yM2Z1e35klJ6VHTpUhsCOykqJVBe2DdhyyoOoYTl+G8UT4xjUNz
         WlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619546; x=1746224346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVIkhW8fkFuUniqBPXDyVR4LXTr/9REpR/pQzgTViRw=;
        b=p7N4xPr5yHsghaVMnk8Q6y3pOH2ShGIQLFZZJGUwo/OcE16eySZ1ySh6AhbxD9my8Z
         wF7za6SPYUUkwD2jQVS3S1B83reAE3T0wB/lKj3TsDyC3IoIOls/+s9J96m0C547tZuK
         jYgdKoN6qce2Xm+m+bdIG9o1d637i3/Px8Tv6bWNjyizg5w8hvGQzNawr/NseKXeQrk2
         zIcpHHuo9oz+3Elb3Bzy1S7Fu/ZkwJEs32Xpby6k2lir0KL531dReuIolH2ubcqYBjGO
         fsqEQ0JTYVb42PuW8GsbyBMuYxZB+7DEqxNTnqn4OcUDODAjfpdmEUnFeeU/uKKJ+xH3
         QjWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOum1MlcP23qXX2V+5//yS20i9MRzuCGfj3PdC8bOHGGxtJoJWKMOv0cukeE/VUs/P/I1JUmJ6QEwXkJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYpHBS0bV6xo6FqbHqQpdKwqNo8btzzH4QCPNj7IyqI+rMcXOu
	b8fBHMK9+v74g7ZYUhJLoTRpKSwZuHfl+RGnYqgMBe+cdwhL/6VJxxql5pxYMucaR+DBJTi3xoo
	xMg==
X-Google-Smtp-Source: AGHT+IHJf4yQqQzqWM7THJ68j5gILk91+zedv5dhDdPsRPkP5XfTqKbEGooI+9DnFLMMiyrID7rTafsT6dg=
X-Received: from pjbsn3.prod.google.com ([2002:a17:90b:2e83:b0:2fc:2f33:e07d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74b:b0:21f:136a:a374
 with SMTP id d9443c01a7336-22dbf742daamr64519875ad.43.1745619546165; Fri, 25
 Apr 2025 15:19:06 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:09:06 -0700
In-Reply-To: <20250227010111.3222742-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250227010111.3222742-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174559680533.892279.18189232483657101534.b4-ty@google.com>
Subject: Re: [PATCH 0/2] KVM: x86: Advertise support for WRMSRNS
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Xin Li <xin@zytor.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 26 Feb 2025 17:01:09 -0800, Sean Christopherson wrote:
> Advertise support for WRMSRNS, which should be trivial, but is mildly
> annoying due to a token pasting collision between the instruction macro
> and KVM's CPUID feature bit shenanigans.
> 
> Sean Christopherson (2):
>   x86/msr: Rename the WRMSRNS opcode macro to ASM_WRMSRNS (for KVM)
>   KVM: x86: Advertise support for WRMSRNS
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/2] x86/msr: Rename the WRMSRNS opcode macro to ASM_WRMSRNS (for KVM)
      commit: 3fa0fc95db6df904dc812fa806a55ea6bafa65c1
[2/2] KVM: x86: Advertise support for WRMSRNS
      commit: ead4dac16de22081956f7af1c795bfbebd2d5866

--
https://github.com/kvm-x86/linux/tree/next
