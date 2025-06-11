Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0A31EDA02
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749659182; cv=none; b=OTHZ+ErjsbUxsAar1rARydFtyv44+lEud6NL7eoxCC0CUzX05uhfKsWfAMd6KVU1z8U5m9K1UmWQ/6oFwlJmTDI6x70CA+YC/I9PiF9YxpXeElHGfKwLhY6kP0ESqFcw3jA5TGN8wBi8KS8mkq85IF0XgtdjbWGvh1g2aISUlZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749659182; c=relaxed/simple;
	bh=1ATIAtScEwv8MflLrosr1hnS8gOgGORCXCED04okpVY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CpZT7fV7glwi0gUYKgCgEbhm86hme3AJF4rYYrysU8nk8p4y3l84dYPL2HjOLKB4bD7aKqKUBucTvEabLzalPgbMhd3AM/HYZhQR3uoqyYDlJKGM08kYoG8xOxQ0EzqN+lLbnRUAxzl8TEXuiB8u30l3tGi91/gLjBaZt3cWbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zB5Vnq3T; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zB5Vnq3T"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748269c6516so46214b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749659178; x=1750263978; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLjniqHBYepM/xcM6MPcnCZ4VmaaSdZz4NNkRlqyWXM=;
        b=zB5Vnq3TIKsJZ0PuVLbVWa5MedAsB+4N9x92NjZOY0/uryEY7UzqrAZB88N0S/Qs/V
         8RnOGdHPklKhcs3lTt0+Mb0HGD7sZF1HmywWarM0kfCjhsq98DsjEjYlTHVp2Ml/oWJe
         vlX+qI2Y94hoQg6H5To9Z6N/Imm9qflEV+d1UBkhVyhwUrtJK4iAy553+L0AknMP3ouI
         GdtfIIV1NWogQc+vvVV0dY0xxm/cYElEphua8tj6MdObVKykh2Du7a7HpiHbt9g9N4QT
         4urLhNkH8ichYlUXYVE7HyT9g46zZQwMv+awfAmR3nyoxYu5iypRLMArV/iKySiNjOZT
         uqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749659178; x=1750263978;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aLjniqHBYepM/xcM6MPcnCZ4VmaaSdZz4NNkRlqyWXM=;
        b=T/Zxyk1suwtH6q3YvbS7LMwfGprXfPMjRfB7HOSgt58P3M1mSaupvlYe02XHxYwC5p
         E1coa5n9SI6kM2YHuFIY4QGj0UUNN5/wyEbIKHKTcb70t6N1/6UB3caFYtHdO6fW6ti3
         DkA+gSiaLpxwG08pAUJkPVpi/nMUcDymx5ScSHMBUZ6lPIDS9uHwwMuz+lPmr6cw36kk
         N+ZsPtopsEgv29z9UfVktkCu5x91ewFqDNc1qc6fA7tguW794K0oU70OTOG2NLqlIJ/G
         HMzpG2VtLIwbKaWjrvr7+7IZ8jShwZqraMObf+RjCGXmhl3KRx+cmilan8oscbK6R6qB
         U4iA==
X-Forwarded-Encrypted: i=1; AJvYcCULDFtte8kjMCRwVgb82bBiFrVN/ASG27gQ6JTv1TB2nI8FRJyeqXRKB1VeHdpF7W25tTQycwLu4mBaywQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXFrPvfw0jcD7uXj6WOpf7R74c0FHUW68BkwYIp2ndzJS1OlCe
	Ov3MMraaoKw9nZxE/xgH5m4qG2pqHatj0NylhmkDJCynK9J5LRkfJpu3XMjrfFRKxkclkbK7wYn
	p5Kj3Zw==
X-Google-Smtp-Source: AGHT+IEw5I/HfvQsgS82ZS/cuurbOuN425fhtHwxIgk3ZRi/K6leOQnkqnKRfQf0SFlrP0Qu9NQy4NaWX0c=
X-Received: from pfbjt31.prod.google.com ([2002:a05:6a00:91df:b0:746:247f:7384])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:c8a:b0:742:a23e:2a67
 with SMTP id d2e1a72fcca58-7486cde17b0mr4859975b3a.16.1749659178368; Wed, 11
 Jun 2025 09:26:18 -0700 (PDT)
Date: Wed, 11 Jun 2025 09:26:16 -0700
In-Reply-To: <effb33d4277c47ffcc6d69b71348e3b7ea8a2740.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610021422.1214715-1-binbin.wu@linux.intel.com>
 <20250610021422.1214715-4-binbin.wu@linux.intel.com> <ff5fd57a-9522-448c-9ab6-e0006cb6b2ee@intel.com>
 <671f2439-1101-4729-b206-4f328dc2d319@linux.intel.com> <7f17ca58-5522-45de-9dae-6a11b1041317@intel.com>
 <aEmYqH_2MLSwloBX@google.com> <effb33d4277c47ffcc6d69b71348e3b7ea8a2740.camel@intel.com>
Message-ID: <aEmuKII8FGU4eQZz@google.com>
Subject: Re: [RFC PATCH 3/4] KVM: TDX: Exit to userspace for GetTdVmCallInfo
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, 
	"mikko.ylinen@linux.intel.com" <mikko.ylinen@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Jiewen Yao <jiewen.yao@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Tony Lindgren <tony.lindgren@intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kirill Shutemov <kirill.shutemov@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025, Rick P Edgecombe wrote:
> On Wed, 2025-06-11 at 07:54 -0700, Sean Christopherson wrote:
> > > Let's see what Paolo and Sean will say.
> >=20
> > Kicking this to userspace seems premature.=C2=A0 AIUI, no "optional" VM=
CALL
> > features
> > are defined at this time, i.e. there's nothing to enumerate.=C2=A0 And =
there's no
> > guarantee that there will ever be capabilties that require enumeration =
from=20
> > *userspace*.=C2=A0 E.g. if fancy feature XYZ requires enumeration, but =
that feature
> > requires explicit KVM support, then forcing userspace will be messy.
> >=20
> > So I don't see why KVM should anything other than return '0' to the gue=
st (or
> > whatever value says "there's nothing here").
>=20
> GetQuote is not part of the "Base" TDVMCALLs and so has a bit in
> GetTdVmCallInfo. We could move it to base?

Is GetQuote actually optional?  TDX without attestation seems rather pointl=
ess.

> Paolo seemed keen on GetTdVmCallInfo exiting to userspace, but this was b=
efore
> the spec overhaul.

If GetQuote is truly optional, then exiting to userspace makes sense.  But =
as
above, that seems odd to me.
