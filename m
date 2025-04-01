Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFE720DD7D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524195; cv=none; b=m8ISXZtw190iljyK5lHt87Gnnzl+FJfPxULAHD0hX176DhzFW6eaEZ6DGuYuBctTpAru6lluFkRxKLTXlUrikyI+mSSYiyN920pQxF9CvPBVMj/IFS/HjQh11gfPW/om4zzx7hTrBd6c/l0NjvLDsofm9FJSqMr+X7IMcqep5xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524195; c=relaxed/simple;
	bh=ACojNPPcLx+riOgoNOBywycd9KS0V2VINRTWkpxHi/Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FkfujjW+6W3vVCZNO5oqSGY2BjtFK+cXrxtUf9VDKbOYUC2oRFxFewXyEKzTeNAxm97ptZPHDOI/dPI29mjz3dzSk6+CldHSomLyPaAzzaDh9nSLnKxATdHGLd9eGVCQc0T4uRPZPlhQ3yXUcpm26RK2HF+UD62ir3/gMjtQ+qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xTEbOMbw; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xTEbOMbw"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30566e34290so1008495a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743524193; x=1744128993; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ACojNPPcLx+riOgoNOBywycd9KS0V2VINRTWkpxHi/Q=;
        b=xTEbOMbwOMOxUWy0QipHbk/hHo014Ndrc3rYa4NRxRTfww5Q5CgGT3dgmFaVdDDB6V
         p7y4/yb/4Gha1JB6JE5wuB9AygbCrExj4WX7zfqnyytW1zwFmLkJWbphwrmlhQyNmdsC
         1dgajP70/Afl26qlrbjgU9x3aH+uVGmNrSf+Rhmiop7aDacPQ3sdGcGexKaR6OIIcmg2
         T4nW9UXbP34y8W/nRLNkN0kJ5UesAkck5qcyouGboYckl9YfUQjHnME4iku2PR+9gG0T
         nUOKCikQv6xQi26m5RE3xcl6OGmUbsKPL7xYyqBAXmiuc/85xL1abIF6/mmtCMqZAHL0
         nzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524193; x=1744128993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ACojNPPcLx+riOgoNOBywycd9KS0V2VINRTWkpxHi/Q=;
        b=BnkP1osZvo2VCWzS1/OQapAayZf7Mls8kAowDzvJ64HYnMGvdgb+richIlfaf1d8sn
         EvgUbg6cLPt7l8mWfbLLbvxrEaDyavWzyPanAB1DVRP/y9kaMoGOD+uck63WXhw2Un17
         brynTj7NDxEcfxQG7CpHNkad5hpFd2ZTkGAUKhpewhyWif9ymjFQILZsGX9zeJXONHLP
         e8vTdGjluZWNY3ZwVBzlE0zpj+HrdzKmRyCFCtCcWcl/ooYgs1Ay7Mu+YZtQBt/G2sFi
         0gjZRJYyvaLdmoaat+/wxJVSnVuEuRQQg6So10A1TrctmQrCPq2zQnIAET8j4vHXtzRd
         +q8A==
X-Gm-Message-State: AOJu0YyGg5lfezrOs+KhNo1kjK2JPfEazL1cdgi0xHV5r0kob2QHGfNw
	i4C3hYOghxEKlSU1e0U/Zncug/Ka+XbPQYtEZVN6+IdWce8ZE0E/lx2chbf/fWpC4HGjQP/nXVc
	XYQ==
X-Google-Smtp-Source: AGHT+IHJPhtYxZuKDmgPcRQkJsHfOASSMbRV5HJyG+H3tF3h3o6vlYLvER6i1U7FUEsFVIndNR6h+3JOSiY=
X-Received: from pjkk7.prod.google.com ([2002:a17:90b:57e7:b0:2ff:6e58:8a03])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d007:b0:2fa:157e:c790
 with SMTP id 98e67ed59e1d1-30531f71811mr20666131a91.5.1743524193217; Tue, 01
 Apr 2025 09:16:33 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:16:31 -0700
In-Reply-To: <20250401161106.790710-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401161106.790710-1-pbonzini@redhat.com>
Message-ID: <Z-wRXy4ajK79pxKH@google.com>
Subject: Re: [RFC PATCH 00/29] KVM: VM planes
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, roy.hopkins@suse.com, 
	thomas.lendacky@amd.com, ashish.kalra@amd.com, michael.roth@amd.com, 
	jroedel@suse.de, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 01, 2025, Paolo Bonzini wrote:
> I guess April 1st is not the best date to send out such a large series
> after months of radio silence, but here we are.

Heh, you missed an opportunity to spell it "plains" and then spend the entire
cover letter justifying the name :-)
