Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27572238D5C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940629; cv=none; b=fYhfCPgrfbdCFi83pUzpiHFHHZANi83Z3w6tdnKOMAYdx+xRLS9bLB/EF3xUb3buy6na75qPWL84JXEarE7gunDPVPD224YBdu+Ak+l4VU4nZCH8EAewMOiWTrtfK+OyptZzH9hBbiSJ2Uxb04vmpisCCvLAcsOABz6g7na3I64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940629; c=relaxed/simple;
	bh=Tnq+iWeNv5PF9Q3UIM0Kj+tVgX0VNQNuQ+qb/x5h9AE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FdQ6C9znUnIEsbclQzzNxmaG048vZ5OUrcSJmHw3mK1dsAVOGEMGwhgcCsxX2fjDeEaXmHuDQTZ1hlNscPa59AGYbDU6jGCGNZ5TCHzopu3CZZmr47XnQHATXTwwIVgTCpP/YTAAh/biFh6XI7U1394ygqBHK6tumMektwQWQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TCERSPtG; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TCERSPtG"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21f5060ef10so36742895ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738940627; x=1739545427; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kT2Mvmfo2bRlo0ynL00suxVyDkWgb52MMCYo718bdE4=;
        b=TCERSPtGUacK5k34S/6NX+x5cCYlsQTQbJDA66//C23EKX4CNN9ROc10Sx+zhx+PUG
         Z7XGptKHXwiiZpd4a6+178z2Q5XAE6tBw8X6wZxH7RVGR8odirU+gN0lxpaEh7+MQgn0
         HJ9kcN0fC1fJHzs+YDwXE5TpyFXeYWItyExHfZxX3Q7Yg77oTjrEq1FgNQXtEujEwEFp
         I+3JdwU2Wxy+5rUSf/KILlgt2swmbqQPAoLZkGhn0JTp6K3sXLYKIhworDH9J1FIw7Xp
         uVwmqhpJLImfh1C9VIEbNBTcMmXsyhqpLd7cQbGR0IwHuuvPO3kRzs/YarZT7cqD7I1R
         0IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940627; x=1739545427;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kT2Mvmfo2bRlo0ynL00suxVyDkWgb52MMCYo718bdE4=;
        b=BF3PJth1Uv0rv8jfueeQP44MLqZ/q3JVYYB2ZC5zSc+sj+36d0c3ITRiRrd+J1uMKV
         a0Y79JH4AZvRR+h9QF6rcGQYUMb0VDGwO2RFatU3RWUcixwvLidiupo48aiw8PCLK7TJ
         as04kfsJwfIfB2LD8yUwHKleg0ejOq8bFy7sld1tGSmGIp2HSW6LScX6wvsIkAE93reD
         r15k7o8fFqdSa9HZg25/d9F7dbM3NIoD3UfY/G8zce+s3uUH8KuzdoTIPteHxKserzlM
         RLWSPnNNH7S1bTyxW0WUIg5DtjfnQ2lbfYMiQ4Ie7hJBapSUdEebCRRZBuVJe+b19VTi
         47vg==
X-Forwarded-Encrypted: i=1; AJvYcCUZEhRDddUbRUdJ0jjgEh2WzzEZ8BfoxHw0XtI3z+QPl9HZXiFL/ROqbm08k4eABGVG2Jc4jcdNb6zpSZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLdxXLWR4nka5AvMnSUHNvIes7ZNu2LZCYYhSw0lG6LGZz7bj
	rnPdqmQZoA0yRcwQQT2NAAwl8fLFp8Hjx0GuDi+617hiKn3NSSXw3cNYtDbU20dFM02flzT/lNj
	uIg==
X-Google-Smtp-Source: AGHT+IHclpkDXbVnuEMWaCZv4QfGLW1Gd/aXGG2frZG+vje70QRJ+huq6JUPpwqPRvbNv1ilQPUL6pWnnwA=
X-Received: from pjj13.prod.google.com ([2002:a17:90b:554d:b0:2ef:8055:93d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f60a:b0:21e:feac:8b99
 with SMTP id d9443c01a7336-21f4e10da1bmr63882255ad.0.1738940627454; Fri, 07
 Feb 2025 07:03:47 -0800 (PST)
Date: Fri, 7 Feb 2025 07:03:46 -0800
In-Reply-To: <20250207030810.1701-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207030640.1585-1-yan.y.zhao@intel.com> <20250207030810.1701-1-yan.y.zhao@intel.com>
Message-ID: <Z6Yg0pORbMyC-9xA@google.com>
Subject: Re: [PATCH 2/4] KVM: x86/tdp_mmu: Merge the prefetch into the
 is_access_allowed() check
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: pbonzini@redhat.com, rick.p.edgecombe@intel.com, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 07, 2025, Yan Zhao wrote:
> Merge the prefetch check into the is_access_allowed() check to determine a
> spurious fault.
> 
> In the TDP MMU, a spurious prefetch fault should also pass the
> is_access_allowed() check.

How so? 

  1. vCPU takes a write-fault on a swapped out page and queues an async #PF
  2. A different task installs a writable SPTE
  3. A third task write-protects the SPTE for dirty logging
  4. Async #PF handler faults in the SPTE, encounters a read-only SPTE for its
     write fault.

KVM shouldn't mark the gfn as dirty in this case.
