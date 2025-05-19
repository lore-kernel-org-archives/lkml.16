Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79BF2857F2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670011; cv=none; b=mWW9gm/EzBN6ulXoFq8LmiWrwUAA8wfncJrTAEXREXlQuROmdvwFlSZ17B43hnu8dWRf4N0dC5k6J2CHzqJ7D/S/5L7wUvgy2K3ug5+UhDYdSv796evEjFHUjyIFVVsVokJKFwfz/5kteCCSFvnRnAnWxEpMmLKzd9O8FpG+Ae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670011; c=relaxed/simple;
	bh=f59pVrQSzamcQu31ILmhJttkN2VQd05tIodMXLoerNc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uqUtOo1lPFS/UFJwMX6geaMRqe4Yb7w4/QgOvXaDSYKk0l7iAzKquPjNDK1eTC5M+h8Wis8ymyInbBqVxyQoGuqBdlkDqJYZGeRh0TtoSN15m9w/u7M4LZJzlEK2nVJ9dm7B8cHnZ898M2/nruO0EsxNVuuTn1LuJNL9jZ1VYPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LREYk3vh; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LREYk3vh"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30e78145dc4so4701821a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747670009; x=1748274809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f59pVrQSzamcQu31ILmhJttkN2VQd05tIodMXLoerNc=;
        b=LREYk3vh6UQi/QQ4Tb5cOwH8gfD06ERnziOt/UWsDjNM7UHzo4CDXzN7PSTIOzJ/zR
         xejpFKJ94ndQH+AJrRFqatP2jVbJ19bcTUOZQYThv3cyjTHiReZ2HtsvfOf/UgUz7mBb
         t75CE+poFHRmiaVKNfjPjODs9cs5+hIm76BPLUTIvk2uCw6S1hZOLC3ZL+nZvtSgovS7
         5zw0atlefgrahONdeRKAtfz79FH+X4qUX5icNM2EbJMUl8C3FcaD/iDbqxYFX0han66Q
         65epd5Mvyb2JEBmhlWEtvrOZKbW/TYxz+bjCKiWkA278mYXQyzerG+kFZC4EXFSHi2Te
         gYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670009; x=1748274809;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f59pVrQSzamcQu31ILmhJttkN2VQd05tIodMXLoerNc=;
        b=Fj7QaKC19ppxl/5O2+HF8SZHEAdeQmR+0Gnm3963TOAZkkTvNNVC0geHdf5hbHAPdr
         J0wXwS9LclcjB59obVqS8QySkH9y7db9MVgXGk/CSUN7Mk8inY6GRKtFkJ9wcap9peeh
         TcXJ45PAyDCQweb3BpqN15I/8EHgtYqlHUWei+aDyReLuMoOEu+Ybdrkwz8FUkl9bkEa
         Ncaz0xn4uOk2uC4ENxH30XRZRJm4Wv1PDIptrOllS8CRnk3oUtUghHN75ybrE2bOYu6V
         21+2m1T11rhhSc9V5pWZ9I1rPpf/qHicyoHCfIS+jbpHEauZ6iWlULx/M0ARD6PntjO7
         drjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxPvgb59cHSf+abRO2+M4CgVND6omzoElH2B5YKguNKG62x04mO3WjKLpCPA1twJIsCkYIUTw6L0lhEc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyaUqDBff/Tx2wN8sxXpU76OZrOKMbTebGtHhVZe2iYj4yNy68
	r4M7WTX+CXg/anJFElijTsD2Ap1KJSFAOldClewCTeOk1AjIRL15uE0hCooFUXnKFHeNp9lCedl
	M1B70Ag==
X-Google-Smtp-Source: AGHT+IFU/A3VDHWmL2TsR6ssZbZVaj/CD2h7APNk9scNpNaj+ntp365tmw5VsXzeWgj0D39p8KDKm8gRc0Y=
X-Received: from pjbph13.prod.google.com ([2002:a17:90b:3bcd:b0:2ea:aa56:49c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:394d:b0:2ee:d024:e4fc
 with SMTP id 98e67ed59e1d1-30e7d5bb433mr24391612a91.33.1747670008886; Mon, 19
 May 2025 08:53:28 -0700 (PDT)
Date: Mon, 19 May 2025 08:53:27 -0700
In-Reply-To: <34609df5b649ca9f53dfe6f5a134445f1c17279a.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519023613.30329-1-yan.y.zhao@intel.com> <20250519023737.30360-1-yan.y.zhao@intel.com>
 <aCsy-m_esVjy8Pey@google.com> <8f9df54a-ada6-4887-9537-de2a51eff841@intel.com>
 <34609df5b649ca9f53dfe6f5a134445f1c17279a.camel@intel.com>
Message-ID: <aCtT9zsGmPiH2S6L@google.com>
Subject: Re: [PATCH 1/2] KVM: x86/mmu: Add RET_PF_RETRY_INVALID_SLOT for fault
 retry on invalid slot
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025, Rick P Edgecombe wrote:
> On Mon, 2025-05-19 at 08:05 -0700, Reinette Chatre wrote:
> > > Was this hit by a real VMM?=C2=A0 If so, why is a TDX VMM removing a =
memslot
> > > without kicking vCPUs out of KVM?
> >=20
> > No, this was not hit by a real VMM. This was hit by a TDX MMU stress te=
st
> > (built on top of [1]) that is still under development.
>=20
> Yea, the context is that this TDX MMU stress test has grown more and more
> stressful. Mostly it has found TDX module issues. But recently it added t=
his
> case which turned out to be a general issue. The TDX specific MMU stress =
test is
> not ready yet, so Yan added the case to the general test and fixed it for=
 both
> VM types.
>=20
> For TDX, since it's an pretty edge case and nothing catastrophic happens,=
 I'd
> prefer to not rush a fix into the TDX PR.

Yeah, and I'd prefer not to bleed these details into userspace (or into KVM=
 in
general), hence my question about whether or not a "real" VMM hit this.

Thanks!
