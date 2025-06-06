Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26552853F6
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227566; cv=none; b=ngD2mDnLFVMn/SsG8uBqeKN16HzH5qiLC/ugkHc48MVf9xmZQ5HVUHJroGEf7wL0k5Fwa6ci/HD4H3V8O2Qcwd4xnawZTSzJQdtIBF8JAbQZUhVuLLoWmdabggUhYNiL+G4GhqIwF0vy6ZW6zhfeLV3uKQMJenY1MJANGHO0lm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227566; c=relaxed/simple;
	bh=NKeBdOPPz5x8d0Tafvzg7xtqJOAb8dtCj2kXRny/hkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaI33/1oSHUm/grZSTNGyiGklXryDV/e06qvfwfa0nAf8WZZDX8+RVhLa7pp7rG6ujhF+uZHcWin/YlPbFtYhhob+O/MOy8MzxE1NykEHD4WCe46kDK/NYiNCyh78BW2WZDd8Cl2sOEOKc8Kk0sesgcH1mQQG8kkLS7FsXBPTyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Aih+W+wU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Aih+W+wU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749227563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aL5SmkAlHa5O+le9ZpY8Lx/lKR2ji4Nnp0dTsL6WtKA=;
	b=Aih+W+wU9YmlX5cl1OME0UWacraTrXmi7ZRzrhmRvbRfH4g/LqQZrpLVs/RpxJoB2+tbb3
	nYh/0+Wiwj7shjOnjI5t8zY2nu5xRoZx3fWf9H+RCCIuPmrrOFrukof4ZDnTlLhBo5aA5J
	CGuN3XtK/g049fubcU/VCVP+3xeie4U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-1C8u22z9MfKyg6LWh0Q4pg-1; Fri, 06 Jun 2025 12:32:40 -0400
X-MC-Unique: 1C8u22z9MfKyg6LWh0Q4pg-1
X-Mimecast-MFC-AGG-ID: 1C8u22z9MfKyg6LWh0Q4pg_1749227559
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f3796779so1658484f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 09:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749227559; x=1749832359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL5SmkAlHa5O+le9ZpY8Lx/lKR2ji4Nnp0dTsL6WtKA=;
        b=mQY+O+2yTZ9PSqLbcbq0s1KwxVpeKw5iIFbb3RDnGZvlE3qYWH2NHxmJv/SeuKHBGb
         Brb3oaMDKKVZT2gRTZlCWfy9L73I3xwzfMThvmo1sq/V+5hEfRBEjqP5V+MFkLdlspva
         WgLS626+tSGpO6DlSqT4//biAnRUOycvjavd4G3zL2oJ75zPNHQFH1hJwZt/fksFW8ra
         7WaHE/EpU4biqnKOqcNCofSi+CbkO8NklmQ4G/9RecWAvJ9iEZ2URYaG+TaKEZy21+76
         Hmox0zt8fz11JCzXY+m9S8wSILiA/+JV0jWwMfJNvuHsngIAO6u+rtHZuRvVNrwe1ZUi
         CmYg==
X-Gm-Message-State: AOJu0Yyz43ZkT5Krn0Pj9pucZGiUBfF2PYYi5eFt3r3t44ZU2yXhNLi7
	HxYjIupYfmDxxOCm/6kBH+2lJkIow/ixd0JD3bC97TjRAjPU6tTjQ+51pDNW78bSDJ/sNcb8MEZ
	bm1fNA7dZFf9hwrLZvYYghm/r1Cvw+HEWA33zxuafGsJ7JbZi42Q0xmHgdjId/uwUiMGMoV6ZZD
	/qLHO6wpM8ZRk3avUKJBVnTVrR1XleLHqL+UXXFBDb
X-Gm-Gg: ASbGncuuh3sLXOKA/O5rJ62AH0LPAFI41B4dkfc+6gOXftwlLm3/QHVAikOnOIKooBu
	Y2igqfu8z4B+NdkFpBKsCJsO4IzLn5fJJFwYDqfRU7uTSHBpDGeBqArRF/2sfR17W3S0=
X-Received: by 2002:a05:6000:24c8:b0:3a4:e56a:48c1 with SMTP id ffacd0b85a97d-3a531cbe5a3mr3651907f8f.55.1749227558579;
        Fri, 06 Jun 2025 09:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5+TT0rhE4xmHWUYKftJs6TrAvbLLgdNyocMp+5vyk6m5JnvyuO3csBs/J8HFvSM5nMSBZxFst5jCXTAh4sdA=
X-Received: by 2002:a05:6000:24c8:b0:3a4:e56a:48c1 with SMTP id
 ffacd0b85a97d-3a531cbe5a3mr3651863f8f.55.1749227558216; Fri, 06 Jun 2025
 09:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401161106.790710-1-pbonzini@redhat.com> <20250401161106.790710-11-pbonzini@redhat.com>
 <aEMV7awKTSXEkLqu@google.com>
In-Reply-To: <aEMV7awKTSXEkLqu@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 6 Jun 2025 18:32:26 +0200
X-Gm-Features: AX0GCFvRlOMty0FBBhLLtZbbqxj561-GwRRRR4haXEnWrQlxR1VDuUGXvjdiVEs
Message-ID: <CABgObfZyDaJY3EX2HaF8yZTRFQn0v+fEMe6mZNWZTvVu2tz5Ow@mail.gmail.com>
Subject: Re: [PATCH 10/29] KVM: share statistics for same vCPU id on different planes
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, roy.hopkins@suse.com, 
	thomas.lendacky@amd.com, ashish.kalra@amd.com, michael.roth@amd.com, 
	jroedel@suse.de, nsaenz@amazon.com, anelkz@amazon.de, 
	James.Bottomley@hansenpartnership.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 6:23=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
> Rather than special case invidiual fields, I think we should give kvm_vcp=
u the
> same treatment as "struct kvm", and have kvm_vcpu represent the overall v=
CPU,
> with an array of planes to hold the sub-vCPUs.

Yes, I agree. This is also the direction that Roy took in
https://patchew.org/linux/cover.1726506534.git.roy.hopkins@suse.com/.
I thought it wasn't necessary, but it's bad for all the reasons you
mention before.

While he kept the struct on all planes for simplicity, something which
I stole for __stat here, the idea is the same as what you mention
below.

> Having "kvm_vcpu" represent a plane, while "kvm" represents the overall V=
M, is
> conceptually messy.  And more importantly, I think the approach taken her=
e will
> be nigh impossible to maintain, and will have quite a bit of baggage.  E.=
g. planes1+
> will be filled with dead memory, and we also risk goofs where KVM could a=
ccess
> __stat in a plane1+ vCPU.

Well, that's the reason for the __ so I don't think it's too risky -
but it's not possible to add __ to all fields of course.

Besides, if you have a zillion pointers to fields you might as well
have a single pointer to the common fields.

> Extracing fields to a separate kvm_vcpu_plane will obviously require a *l=
ot* more
> churn, but I think in the long run it will be less work in total, because=
 we won't
> spend as much time chasing down bugs.
>
> Very little per-plane state is in "struct kvm_vcpu", so I think we can do=
 the big
> conversion on a per-arch basis via a small amount of #ifdefs, i.e. not be=
 force to
> immediatedly convert all architectures to a kvm_vcpu vs. kvm_vcpu_plane w=
orld.

Roy didn't even have a struct that is per-arch and common to all
planes. He did have a flag-day conversion to add "->common"
everywhere, but I agree that it's better to add something like

struct kvm_vcpu_plane {
...
#ifndef KVM_HAS_PLANES
#include "kvm_common_fields.h"
#endif
}

#ifdef KVM_HAS_PLANES
struct kvm_vcpu {
#include "kvm_common_fields.h"
}
#else
#define kvm_vcpu kvm_vcpu_plane
#endif

Paolo

