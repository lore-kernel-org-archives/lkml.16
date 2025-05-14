Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBF827A44C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230074; cv=none; b=SBsBRswck7UMeDm1cPlLyP/c83jrYFMGXApwVn499jXjfOHm/15nIzjdUyjpliP8V5NjX795wQUibTVgmI/57Fz8bdUPK1wUN8e1jUdiBL7334j1TpwWCsu1vKvSxqT9wgLuMxf1lwqlz5jaJBfkvkGyO60VQ629c5byr/H7r8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230074; c=relaxed/simple;
	bh=QdpEPJ8gEYzpOoGgSc70hLnLhxzBAJR+99wYqefKZis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ONrt8vc8tJnuMi2eRigHUr8EtT1pLey+2n30oyfz1hkrSEm3WBnrSBfY24yNQLwIHBCt5n4U9AVMXsGgZVGI8DFdZU0foFua8Iv5p0QBs8NCClSV1dt9fRoE+QccvBC/5RcyqnyPc15ml9LQ8feJQ0znU1WTwbEiSE6eKZLrF4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKsKVVPH; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HKsKVVPH"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a96aca21eso6960499a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747230072; x=1747834872; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYjVSGsMHKEcRuY737iQ9jOd94jFmJlbiKkyJxWPX0o=;
        b=HKsKVVPHroYn2U1qNCyo0ZZQD6pCUwxFPocSM4FTwuomPIGelqvPHWhYHF9dKH7v+w
         2yrutxSfNcHi9m4zj4SQuo+GBVx9TvgN5mZGjzZCfEUlHxteHoLcVH1aFuotA6/PoZHE
         +27dZkcNyhh6fayYDmfPU5RAgUW2myD5A1wu3wlKBmpxTvd5GHK3Vj76ZUwutsdKyqvs
         +CiEcr1nYKhj4UvQeTHWr0DCLj5J1418YzjUExmKM5amTJUR9EIEdLfuYtsh6nrA2VLn
         U/VAhBjF64XfUD6bLAtXhGtk/IWD7OL4ZZFz/aygH1ZNWV7soQD8Phy4DIjEWicGalup
         1XFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230072; x=1747834872;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYjVSGsMHKEcRuY737iQ9jOd94jFmJlbiKkyJxWPX0o=;
        b=Jq097p9xtC1p/+dydE1+YFj2oYhmhYzXeZdV8kvytyYiu227lUbOv2PZ+eFBaugkNM
         n7UQLmW4YQrN0enF0YhPxuCzqrDaOLBA6fSiH9ypDVy6N6tFt7qPrHCH/poCZ5Oalkm+
         i9MKOZjNllyPWHF6MzuR208z5FHsLYRn6FghhLCGMOP0NmXwE4i6S1C7kzC+nfE9nXCw
         GPXRA0830VKpJVSrpsx6eBhTgnRAs7hhWgS7Ck8txp+vRa/FSBypkRr3R6CcRhrtqoGs
         SswxcR2zdAYHWcnvM6ZVRwYljfjhHduWMRHJ+6nqMDUcWRves5JPmHI8tx3LPyZxBIuP
         dNzg==
X-Forwarded-Encrypted: i=1; AJvYcCWPddRpfbPvnyGr5J7OZk65Bo6RA62yxnFpeP5jpMqFFRnloWQuCYnM/sjvpAwia4aTY457NLyaOY+WTvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPzQTsEmuKfg+jcmvkOwlWQRpBkcIhvAVHmOq4qJrmGGva4K7n
	6529CJOMEXyURF3IUsIUSalbWIo6RC0tmOr66gXzgoUyF9v+KG4u3zuXQ0gKaeqIRdLxe3VvNse
	iDA==
X-Google-Smtp-Source: AGHT+IErt22KB6Bdmg93RK4s626ZQgvKZVAsGQc1try2WwfIQuCLiAkCsQttfSHfUk5K1Biq89347r4kD1I=
X-Received: from pjbsy6.prod.google.com ([2002:a17:90b:2d06:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c5:b0:308:6d7a:5d30
 with SMTP id 98e67ed59e1d1-30e2e5c9248mr6985235a91.18.1747230072267; Wed, 14
 May 2025 06:41:12 -0700 (PDT)
Date: Wed, 14 May 2025 06:41:10 -0700
In-Reply-To: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502130828.4071412-1-kirill.shutemov@linux.intel.com>
Message-ID: <aCSddrn7D4J-9iUU@google.com>
Subject: Re: [RFC, PATCH 00/12] TDX: Enable Dynamic PAMT
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: pbonzini@redhat.com, rick.p.edgecombe@intel.com, isaku.yamahata@intel.com, 
	kai.huang@intel.com, yan.y.zhao@intel.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	kvm@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 02, 2025, Kirill A. Shutemov wrote:
> This RFC patchset enables Dynamic PAMT in TDX. It is not intended to be
> applied, but rather to receive early feedback on the feature design and
> enabling.

In that case, please describe the design, and specifically *why* you chose this
particular design, along with the constraints and rules of dynamic PAMTs that
led to that decision.  It would also be very helpful to know what options you
considered and discarded, so that others don't waste time coming up with solutions
that you already rejected.

> >From our perspective, this feature has a lower priority compared to huge
> page support. I will rebase this patchset on top of Yan's huge page
> enabling at a later time, as it requires additional work.
> 
> Any feedback is welcome. We are open to ideas.
> 
> =========================================================================
> 
> The Physical Address Metadata Table (PAMT) holds TDX metadata for
> physical memory and must be allocated by the kernel during TDX module
> initialization.
> 
> The exact size of the required PAMT memory is determined by the TDX
> module and may vary between TDX module versions, but currently it is
> approximately 0.4% of the system memory. This is a significant
> commitment, especially if it is not known upfront whether the machine
> will run any TDX guests.
> 
> The Dynamic PAMT feature reduces static PAMT allocations. PAMT_1G and
> PAMT_2M levels are still allocated on TDX module initialization, but the
> PAMT_4K level is allocated dynamically, reducing static allocations to
> approximately 0.004% of the system memory.
> 
> PAMT memory is dynamically allocated as pages gain TDX protections.
> It is reclaimed when TDX protections have been removed from all
> pages in a contiguous area.
