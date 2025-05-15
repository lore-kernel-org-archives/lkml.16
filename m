Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD921D3CD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747346657; cv=none; b=Wy9uvhTGf17OD4E9cx3n4875mRv0+3NxKBWORwZfK6P6VJtxqcDbJXseDXZEeT5SEKjaBTlHxcialbkhoBrX0kPvYG2vouN73Lsb2GefAJflzeQB8pcYMrPgsqgR4fzdpiip+x/2GVxgzBTUer4f69yjfhbpQZmw5DyaHv8Srz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747346657; c=relaxed/simple;
	bh=fwldXoroq5XBUEJ0quH7C1UmH9HOLo1mqXHCCdRb9cc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c3Y9ZmFoNPlj6O2RveMKW91k5+FIoev/gnq2LYHYgKCuR3fV+Ojv2OyKUUX7WkZmTy4I0Dx+9GDbieY+UpGnMLe8GW2lWAifTVCJ+YK3blo8Do0Pd6vhcqBAoTdKGSMPyZjBU0EGCZrdZK08noJCG8LMZb9vOPoMEbCLo8nfzC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g8K60zFO; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dionnaglaze.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g8K60zFO"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22e3abea7e8so16452585ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747346655; x=1747951455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NL+bcQz8U5Llwby9qZ/g3HOxD9xJ00J+/SoiAzJaZ80=;
        b=g8K60zFOexZNXR22KtdHYdHVegUROSBdwft1g7p5S6WzLJKl60FVJXdzJ3Y3E4rQqC
         2i82QFEkIoM519kCRy6ydJUQ/SPupDmoxHSvxAtgrt7ez9arLpmh0Oyjr2RTxLAQvCNn
         PMxxIkTxzg3xT/tnq9F0S5kJHey60vyDz3k5Nl0ECsG60gB8JVftx87doClsiEz2cEmD
         6j07ncdLra29EIwPTWgmfa9L9231+tan1fbmioWxIg9I24KtQma2rfkCLd8aAlEIybT7
         MR68/yAKe34CoQZQJ3OJkEcY8PoMxcehgtFGm7ike2j6BrAUJ0DkHwy7IyBtuNnrZoxO
         grZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346655; x=1747951455;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NL+bcQz8U5Llwby9qZ/g3HOxD9xJ00J+/SoiAzJaZ80=;
        b=a8J1MiY978KmtIBjYqbSGTqMfpsRPPVYdY1iQaw+IfUZlfa7/emo6fyq/O17vHjkgm
         Qtt473GvPAppHATd+wQP8R2LyW3NtHErQCxISTTzO9+zIbOlERAkj1NsHScbLskxbRZh
         q0AesXk0cwJcTw1TjnHgJJvcGaheLGzG8yongMZxSh6B5AAcJprLvUykJKGaFuFRa/Ho
         w4oYlPCUh4OyQ0B17hIpSdyrnNXplDbG9sQ1ABR739f/TTICAvXSN027TE3ZJCDM1uFA
         /YYsQa85UaJxCIAl/K1IWIh3kqlJmyIIeg0CW9338Q1N9MHo3HuQUqjMYTD8z6WoXNgs
         Vq7g==
X-Gm-Message-State: AOJu0YwSBuTmGM3rXbmE5Q7m1yM24W8PZ5tvCpl/5DtKnalFLx/0aKC4
	vayXX+54n5f1xH+aqntpYz4/8dJc+vxZBe/ocuPOHUdQGRuxMxZ13QK2xpjt0UZAW8NkKuVkdkR
	SawUYKsFBRNEtnXHu2VVXWVf1Bg==
X-Google-Smtp-Source: AGHT+IG/Mw7qmj3Mxbl76BVdTruv+BrUfU87J4WKFPJAAHk/FfhcnDpLwk4Q9Zzdf5/4KmQMj3JGw2Mx0UiqJxmNNg==
X-Received: from plgi15.prod.google.com ([2002:a17:902:cf0f:b0:223:294f:455a])
 (user=dionnaglaze job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5ca:b0:223:f9a4:3f9c with SMTP id d9443c01a7336-231d43d5526mr11709575ad.9.1747346655484;
 Thu, 15 May 2025 15:04:15 -0700 (PDT)
Date: Thu, 15 May 2025 22:03:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250515220400.1096945-1-dionnaglaze@google.com>
Subject: [PATCH v5 0/2] kvm: sev: Add SNP guest request throttling
From: Dionna Glaze <dionnaglaze@google.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	Dionna Glaze <dionnaglaze@google.com>
Content-Type: text/plain; charset="UTF-8"

The GHCB specification recommends that SNP guest requests should be
rate limited. Add a command to permit the VMM to set the rate limit
on a per-VM scale.

The AMD-SP is a global resource that must be shared across VMs, so
its time should be multiplexed across VMs fairly. It is the
responsibility of the VMM to ensure all SEV-SNP VMs have a rate limit
set such that the collective set of VMs on the machine have a rate of
access that does not exceed the device's capacity.

The sev-guest device already respects the SNP_GUEST_VMM_ERR_BUSY
result code, so utilize that result to cause the guest to retry after
waiting momentarily.

Changes since v4:
  * Fixed build failure caused by rebase.
  * Added ratelimit.h include.
  * Added rate bounds checking to stay within ratelimit types.
Changes since v3:
  * Rebased on master, changed module parameter to mem_enc_ioctl
    command. Changed commit descriptions. Much time has passed.
Changes since v2:
  * Rebased on v7, changed "we" wording to passive voice.
Changes since v1:
  * Added missing Ccs to patches.

Dionna Glaze (2):
  kvm: sev: Add SEV-SNP guest request throttling
  kvm: sev: If ccp is busy, report busy to guest

 .../virt/kvm/x86/amd-memory-encryption.rst    | 23 +++++++++++
 arch/x86/include/uapi/asm/kvm.h               |  7 ++++
 arch/x86/kvm/svm/sev.c                        | 38 +++++++++++++++++++
 arch/x86/kvm/svm/svm.h                        |  3 ++
 4 files changed, 71 insertions(+)

-- 
2.49.0.1101.gccaa498523-goog

