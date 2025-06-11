Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7215022D4C3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676184; cv=none; b=YPIh1pQC2Jk8zWF96yOyc8M8wYgSVkOgzAypSjlViHIGAhfTFkVHoZrzT8CPU9jWC6NBtW2d+9IyikYJEj8Tp1JMK3YF9H5narOWc3MPYy6A5oDTfRBlRvn6DQAVLNqevt60r2WTD1YyFkhtNGl5NYvK5T12WpC2IIaf926769Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676184; c=relaxed/simple;
	bh=aNvWjxK6lyH38L8TrWmLCp5uspZgS1RsSRt2DKL3AEY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eOsG9gdlMc2MueV3aLMWzQ6R5VOsxIJ3b4OvwNSuuPOl2BUdSkpvs5tT6WxVCXRFF/JwgP2RgXy8dOm6cE+slOfZCa1FsZ4221kIc0anGcOp4YmU8J2i9D188VIcy+T7gL4J0Azp9YnAjA9piuM2JfcLixB9sov0eLHHhLrGOLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h9lEO8qB; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h9lEO8qB"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so271864a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749676182; x=1750280982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMQkqCwzmIXYFrrnZkAcfDl3xDOFYF2dYn4KNgsYvkY=;
        b=h9lEO8qBY+12ohCKhfqARq3q5ZLJ7UQcknYEccHmcr/5z+6Nrm0be2okDgjHgXtRTU
         cEnAwDXFYoJEC8TRV9VtcX9ZUsgORtsGLEC3xj06cwlNF4CntPiOwHGkat5vqGg+/RFu
         mKxZfZBmIpZmMtK510r32AU5YpRiaAl0RKrZ9bnxRvz2KMC7T0Rfkv/CgHzYcDSCUN0N
         RYzHgbCrGEi14GEMUQQZOSW3ngCjthS64R+lCDocvytKCkSEt9aFvjC6Mgo2Vka6dXcg
         y4TFyUsr1+aQIjxNLuhnNEUHiN9D0kwpAEPXrDE74tVcXZHKlqKPRJTROmzyPJNVDy/E
         xJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749676182; x=1750280982;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZMQkqCwzmIXYFrrnZkAcfDl3xDOFYF2dYn4KNgsYvkY=;
        b=iIisbIwWBC7MenemrbTO8A7XjJp5CEmpLX+/HDf80J5zemgsU73CX8VmXrG2DCPlCK
         O/cut6dmfJsAYjIDRVEuS8d2IL+IzCw2MSjRtjEyE0XfOpftFnm7xeVBbdKdni/iGioD
         QjjZbmKqRc8mWOwTh+VlnJKd2HQtHShbYL1l4R7OX8yjK68/mIhB8RQk8BuPAWh6/yLp
         HRnwgKxckYCHYSCSFRHNtKDA9OP135tb7e+cFr/8x5XRwmM1Yu0ZBh3atOVfbhOd6DXk
         +yh/s763HS3jihFLquW/CeUF8J/F+pJ1dY94tBDZ5xxiIzu6/1eqlpIjLcquCAP1UkJk
         XJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwLYPP4p+nCVOIfRqonegHUXd0dAWXhqh/h0a3NWfKWjrHWvIg0dbAGe8HKT6dSIEAV08c50/FYDa4Ul0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjDjNcXU3l765eOmwQTcuTYPhGsP8XijoKczSJK7M8uallFu0s
	/67vZVw7KTuykDGk2FZMD3sxZeWNwYPMjlwKC8G874pm8xhTR++iDMvZDGWo9qfZfdIzXJB0ETW
	c8fJQTA==
X-Google-Smtp-Source: AGHT+IEb/UGrw1LaCOx+NlySWUskzO3viqPifHVWpoL14YgOs7Ph7yCuEndM+iEYCbyktI8ZT/I3bf7B8B8=
X-Received: from pjbqi16.prod.google.com ([2002:a17:90b:2750:b0:312:f650:c7aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d49:b0:311:ad7f:3281
 with SMTP id 98e67ed59e1d1-313bfb676f6mr1565236a91.12.1749676182673; Wed, 11
 Jun 2025 14:09:42 -0700 (PDT)
Date: Wed, 11 Jun 2025 14:09:41 -0700
In-Reply-To: <32ff838c57f88fd4b092326afcb68b6a40f24ba0.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611001018.2179964-1-xiaoyao.li@intel.com>
 <aEnGjQE3AmPB3wxk@google.com> <32ff838c57f88fd4b092326afcb68b6a40f24ba0.camel@intel.com>
Message-ID: <aEnwlQtenIEUczVX@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: Embed direct bits into gpa for KVM_PRE_FAULT_MEMORY
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Kai Huang <kai.huang@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yan Y Zhao <yan.y.zhao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025, Rick P Edgecombe wrote:
> On Wed, 2025-06-11 at 11:10 -0700, Sean Christopherson wrote:
> > Back to the main topic, KVM needs to have a single source of truth when=
 it comes
> > to whether a fault is private and thus mirrored (or not).=C2=A0 Common =
KVM needs to be
> > aware of aliased GFN bits, but absolute nothing outside of TDX (includi=
ng common
> > VMX code) should be aware the mirror vs. "direct" (I hate that terminol=
ogy; KVM
> > has far, far too much history and baggage with "direct") is tied to the=
 existence
> > and polarity of aliased GFN bits.
> >=20
> > What we have now does work *today* (see this bug), and it will be a com=
plete
> > trainwreck if we ever want to steal GFN bits for other reasons.
>=20
> KVM XO's time has come and gone. Out of curiosity is there anything else?

Not that I know of.

> Readability is the main objection here, right?

Maintainability first and foremost, but definitely readability too (which o=
bviously
plays into maintainability).  E.g. if we properly encapsulate TDX, then it'=
ll be
harder to pile on hacks and whatnot simply because common code won't have a=
ccess
to state that lets it misbehave. =20

But yes, you're correct in that I don't have a specific use case in mind.
