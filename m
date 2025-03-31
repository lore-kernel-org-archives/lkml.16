Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E686347
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448425; cv=none; b=B1GvBhCopZMDd0w7OIsQfVbzoIBpfboNc5EqNPikKtcawK/Rp5WXw/0r1tkwwCBsciP02iH8wNzrK+LZCaq/rRJ6r1/RnQn7NfO8QTeEsrMdiUWP3YR0YWuERu2kdduzkxAzhN8BCPfjob6BlTYmJ8leVzRTKkIS4mUHJMEnf3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448425; c=relaxed/simple;
	bh=H1pBKeGcFfUIcLE6in0nxsYY2pGGTIqkJaytlFG9ZEo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KVZ+yFhlla0BoUP29cTFZQHe7XxOu/uLhdDNECvF8lPSnd0DUJanWOjBpYdVBj8izR+R+odauF0I4+HHIZEnzQFMpqogbxgH5eOiqajYIRji24Tlj+LKdXabC67p+cKhS1UxHML9Ow/tHIDw0twF9rLpxbkNemeqPaZRH/Qkd34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=udFMNznE; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="udFMNznE"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22410053005so143619485ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743448423; x=1744053223; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGGn/eQFNGZLwRHOGYqD/gZzYnjYZzds7x7w4w6AYJ8=;
        b=udFMNznEcEE7+mMn/V+OzbnsLHIeXoxIBVVp8ygY1jVDTvHlT9/xF6JbvAcozwYPU2
         xCsRftSlVnS4e5SfA1XOF/p1l0urVQidrA9QTN3PL4NiO1I58hgeiuQFz3mu5tbWQkhq
         Gnk1+xJcjZEjme3Rgjf/tRO04pvZvCLbCuSJcnfTjoyVtLe3utG3MI2r1c/ur62QR+Us
         iMXdgByXqWRvg7gD8s6EM1VZ50eYW3dL98H8k01Kgfd/ZlhBi/X74wytUSe4ncCJH7J/
         4uZzw4vBvkSqd6zq1u2SwjLd5EzL8blkGlZLTULUq/vaRvvTQ5DcBiwqSKneY9vGWc3u
         QJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743448423; x=1744053223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGGn/eQFNGZLwRHOGYqD/gZzYnjYZzds7x7w4w6AYJ8=;
        b=qSSI2swCR7ljP+3qnkKdjUapr2IWI7oK/K/XaYDUEWKLex0V3wPUyEyKGhnqquWwVC
         fERtOjTQ7nTqZHQCTZefR3nkYnIfeq+yvuH3ZPZvxQNBV4mLyMYyio//S3IbibMeq/mj
         0J14k9nQYYMdeVhU7elCgX1JGh5R2NPl3lC3aRlBb90/CAg1AwLuqDo115vfyvi0/2p4
         p/9tLxThniNWqCAEYEiQg0sC7P/OKLHMjBWnl0hZukHED95/jNdxfCkQMkKPfQijHdGi
         DTEK8SQHZIKd/oe0+24UPZHrkseee2u2yrsowHTQBhMEoEE93B9F7L1/N1sYvtuy9P1H
         Lr/w==
X-Gm-Message-State: AOJu0YwZYlM/2lwn7h+5UnLVm7EbIzjOX3iomQm3HlRtQ1kHNTSTy3iH
	8v1L2NeQ4BlZ4JWIHJYiMYk2e+vQ7Ac76jdJHqeKZADvkNXsUiQvdHf8OGY+lMYaekQSS3LdYpL
	VUQ==
X-Google-Smtp-Source: AGHT+IF5W5caoNriEPc6owk4GkivXFoxbecxV7lIpr1115XZdkOUJ7ceeu4lNFAVC6q4seFwSY2eWrvOmI8=
X-Received: from plhj12.prod.google.com ([2002:a17:903:24c:b0:220:d79f:a9bd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f85:b0:224:76f:9e45
 with SMTP id d9443c01a7336-2292f963a1dmr125423275ad.21.1743448423618; Mon, 31
 Mar 2025 12:13:43 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:13:42 -0700
In-Reply-To: <20250331150550.510320-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331150550.510320-1-pbonzini@redhat.com>
Message-ID: <Z-rpZtswCzFJ2ZwK@google.com>
Subject: Re: [PATCH] Documentation: KVM: KVM_GET_SUPPORTED_CPUID now exposes TSC_DEADLINE
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 31, 2025, Paolo Bonzini wrote:
> TSC_DEADLINE is now advertised unconditionally by KVM_GET_SUPPORTED_CPUID,
> since commit 9be4ec35d668 ("KVM: x86: Advertise TSC_DEADLINE_TIMER in
> KVM_GET_SUPPORTED_CPUID", 2024-12-18).  Adjust the documentation to
> reflect the new behavior.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Sorry, at one point I even had this on my todo list for that series.

Reviewed-by: Sean Christopherson <seanjc@google.com>
