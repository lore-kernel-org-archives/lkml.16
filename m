Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4182949E6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745620208; cv=none; b=Fxi1a3ceCSNjzw2cH9QsZELvFLUTEm8KOo8jsDgeJToVsb6TcgPljIVJtZN0h/QdGIsuQ0Sq5FI22q6MCi/jw4oRkptBu8C5F4a8CickDqFdmdoD1XMEoLE6iq5Wp5VGNIMMXS8HcWtHwfzED2ldY1PtSk1MzPByIFr3Z/QqzYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745620208; c=relaxed/simple;
	bh=No2WdcR85nQLhD9Rcq+fHij7hSPtf+sRVRTw6HaupAw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eUUVOdj/9PJakSyhKo1SgAnuNaDbcr47FlEW6f4/pWtDPgVgf7GY0z+/kV0l0CYTL6jmOy+7xdmKfFzdkILGActM4hTla9ql8OmcLvCVE0EyAV3LEB6MjXh2N1+JBMGorNdQ0bVTeWb39kKIJryq26Q0tj4SaitZR6nt3pGiOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bmxKFfCR; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bmxKFfCR"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af5310c1ac1so1582278a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745620206; x=1746225006; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2vrxKS37XFkzYSXdYDYazU7IYtsM4nDy6zkgVBtQZ0=;
        b=bmxKFfCRt/CTKpXMYCTfKyUR7H9F6DC9IWmJDeCrfWHVaVtsjQd5R8o7dMVpOgpWyA
         cfilJVUEssrtOPNzIrXUzfB//ObYHqyXBvvo6/hfKZiMYxWvNp/zXpgz6sH4oU3GZPvg
         cu1wVp+jQjNraQEWwhgD9V7ebhuuMWrmvpZdrkfRkPd+k/i+eHm5i1WYxbNe14Lg7BnT
         QVy8vTVTfGNXXAwDlvxKHwcz4mkwzl6OWt0OQ9w5G+2+TRrZTwHjRhNk5tMSWCxvS2Iy
         KgxF5DrqctP9sZEyleKaUehZfdM8IBFE/2pSwSKnthijNdtJZrZA811iAtodrcFrXdC6
         783A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745620206; x=1746225006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2vrxKS37XFkzYSXdYDYazU7IYtsM4nDy6zkgVBtQZ0=;
        b=X3fN+juy0KIFHU78sIMM0UZg+QVpYOL5fGQ6Q+FeTwm+4z5pXKdFQxqLWdcy2/4Cll
         9CbHuutDwTtgOAsfvc6c3WBd59VYKceCrwxjef617GYCLlISMo1hMdg2+8rpx69PVzza
         AiE9O3ab+CTnUFp/C9+qLYQswoA458TFSh862yL5ZQGRruVo2qzec5EK3kmbqSMXrzgX
         Y6OhhNWgPzyGDPCPyS1VkbHS+OT4+WWalBNhAKjSxcVXnC4CF5WS7tKBsTKzZa9onmfH
         YGI/VSTzyglZQc7Yz11DTC2Fq+tDjhG+oQbsnhzHW8SnlF/iiqTt8dUwyrGwQC68BHQm
         imfw==
X-Forwarded-Encrypted: i=1; AJvYcCUjnocA2W8Rq+wZSIMr48OtA7OD1ROi7wvmjW8y37E9YcZ9OOYfmNoIRglsy4fYWzwWMUMNfHIoKhG75/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi24uUq6ITv/R7clmRRdI8RnHCrKqSt+k1F70htcAENpjUQOBh
	Yw0c96OAcOo61EiZXmrxWkI1krxz+cQVzykDAeHwnaifJzVJvhutuXXy4AoGdIfN+ixIdW118M/
	KxQ==
X-Google-Smtp-Source: AGHT+IFyEmW/h75Y0a4u5zU8k/xtyBAAGO36YOhCBdvDLlZHji33XZ6TelcG/U3Ix6o3kynmbJjWiJBqCfA=
X-Received: from pgah14.prod.google.com ([2002:a05:6a02:4e8e:b0:b14:df7a:ff1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9203:b0:1f5:6a1a:329b
 with SMTP id adf61e73a8af0-2045b99e11dmr6794527637.32.1745620206560; Fri, 25
 Apr 2025 15:30:06 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:09:10 -0700
In-Reply-To: <20250304013335.4155703-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250304013335.4155703-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174559673791.891425.18442555338696362642.b4-ty@google.com>
Subject: Re: [PATCH v5 0/3] KVM: x86: Optimize "stale" EOI bitmap exiting
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>, xuyun <xuyun_xy.xy@linux.alibaba.com>, 
	weizijie <zijie.wei@linux.alibaba.com>
Content-Type: text/plain; charset="utf-8"

On Mon, 03 Mar 2025 17:33:32 -0800, Sean Christopherson wrote:
> Slightly modified version of the patch (now mini-series) to optimize EOI
> bitmap exiting for "stale" routes, i.e. for the case where a vCPU has an
> in-flight IRQ when the routing changes, and needs one final EOI exit to
> deassert the IRQ.
> 
> Kai, I dropped your Reviewed-by as the change was non-trivial.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/3] KVM: x86: Isolate edge vs. level check in userspace I/O APIC route scanning
      commit: b1f7723a5a5b018f4bc3fb8e234510be7c44ad00
[2/3] KVM: x86: Add a helper to deduplicate I/O APIC EOI interception logic
      commit: c2207bbc0c0f4b6ae8dbb73ec26e17aa0c45a3ca
[3/3] KVM: x86: Rescan I/O APIC routes after EOI interception for old routing
      commit: 87e4951e250bbccac47a8822f6f023a1de8b96ec

--
https://github.com/kvm-x86/linux/tree/next
