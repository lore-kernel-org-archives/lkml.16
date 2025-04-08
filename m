Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD17244EA1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145496; cv=none; b=bmAxmr6ScMWhTPgFO1NCvD4diLF1IxpDH1VBKmyXD6n4LfYatVH4uc63H3VytkM97Yab1dk/JSbMEYZxCJQ+Ei6NyqTHdGNErTYCQUHHYKapshEEkMxR5cosaoueESdiNUNB+GABg6d+ZxQZDadKgpkHVS/THWuiPrN+SJHpH60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145496; c=relaxed/simple;
	bh=OMfNblk7e1bqcX5flCxsW4kUHjTHdM3NGhtOUfpBXUU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Icy/QFbCRHtXb9uq67qoO6o3AH6TyCzYAwyxz/cwSKKmJ9DhugMcHJkxg5mVW2cVoZ7tOYAbFn7RJRjQuQS8kit2cj/9YdhzZ2YWOHdtOWimJFLZ0Gp00oxp7mNMM4mmkBmW6gMLoXR51UZvNjrFqVWusRx3YD6IOmDqXaQxA2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ht4RsMjW; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ht4RsMjW"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b00cd79a5e6so1482081a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744145494; x=1744750294; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BTcE6+WHWu4qnclYQMHYIxEySZ/v7P1Al1jdu/317JQ=;
        b=ht4RsMjWVYIBhZOkNjCATDYrPg+qYrvvE10s3cmSdqF2E9s/GJaAQ5dE6L2Xi9aZXE
         42IgKZkQvVPHUa5X9lHGpBbxcYBSLtnoipzpW9FN85SYnNG/3Vv3XQkw0FsK2Qf48KZB
         Fj38ujfN1tS57GGJFI6ni9gq+t8H7w9bntMyxAjuG0Yq+Nml07FyTHAzTlTXJ1Ws8u8e
         uK+zras/Elyq4h7fF+qdHj37WPLlai/pZeR2z3rjfTH0hAi292NYMuxnKw3/PtgsNN4C
         79cXGuNBtEfcWCqb4jA3R8b0gk9llYWJNqs/dzG/vyk49etgz6z1MMJdHPao3c4INck7
         Gg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145494; x=1744750294;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTcE6+WHWu4qnclYQMHYIxEySZ/v7P1Al1jdu/317JQ=;
        b=QHMb04BILE6IbN41duzBV2cjYT7LYkoqWdvJbmR1iDRpQmOWRQwi/neeeOq6PkgAUk
         IGRyyS3AfYjVS+yFTU+Qe9wTfKO9vNyLHvi75U2g+DE5X5N1vgPDGCa4ZEDZhE7WWU5M
         6NMtKv3tTg4Ngc+2ECXy7ZFWxuJXDJ5wIUkU7AwmGPk6pJbRpjYbI3sWjSohhgToTv1v
         mLUgprkw5A1fc9p9yd7z+c1WNB9Q48Ss7cecoU75pYOZCxa6VZhxtfZV6knriWZQsINL
         FOpDVei6Kr7VOuL0dRi/okKO5bIlLizlrUlB3GPsLA1oXBIS2cUXMBdgGDoy5zLAUvwp
         rukg==
X-Forwarded-Encrypted: i=1; AJvYcCU+NniC65npwX2LaiA6f6CmHg5foa0fuJ9MJKGBAPk7sxjOW72hWhOoWMmLlo796j5NaG87ikomhdPlGN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpb6Lfzih4Nn8f0OBPeQOnKi4/+pj9YiLUMoKHOjiEqmnL63we
	jedRU0xMdVwPqM97uNx8iwy3jcTLhGOMJQxmz2Q4d13rP/Ab5aJe6BP4rSVnsQRHrj9JcvxEZkJ
	zCw==
X-Google-Smtp-Source: AGHT+IEkkZsY8ruaiafHFgvGKu+qq4+sFmbSt1BxoMGSqk6S6uLwO7DhByw4VjeW33u71GKRfK37WDJpDHQ=
X-Received: from pjbdb3.prod.google.com ([2002:a17:90a:d643:b0:2ea:3a1b:f493])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d501:b0:223:90ec:80f0
 with SMTP id d9443c01a7336-22ac29a85demr8617275ad.22.1744145493932; Tue, 08
 Apr 2025 13:51:33 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:51:32 -0700
In-Reply-To: <cf4d9b81-c1ab-40a6-8c8c-36ad36b9be63@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250404193923.1413163-34-seanjc@google.com>
 <cf4d9b81-c1ab-40a6-8c8c-36ad36b9be63@redhat.com>
Message-ID: <Z_WFolTVWQtkoNIU@google.com>
Subject: Re: [PATCH 33/67] KVM: x86: Dedup AVIC vs. PI code for identifying
 target vCPU
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 08, 2025, Paolo Bonzini wrote:
> On 4/4/25 21:38, Sean Christopherson wrote:
> > Hoist the logic for identifying the target vCPU for a posted interrupt
> > into common x86.  The code is functionally identical between Intel and
> > AMD.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h |  3 +-
> >   arch/x86/kvm/svm/avic.c         | 83 ++++++++-------------------------
> >   arch/x86/kvm/svm/svm.h          |  3 +-
> >   arch/x86/kvm/vmx/posted_intr.c  | 56 ++++++----------------
> >   arch/x86/kvm/vmx/posted_intr.h  |  3 +-
> >   arch/x86/kvm/x86.c              | 46 +++++++++++++++---
> 
> Please use irq.c, since (for once) there is a file other than x86.c that can
> be used.

Hah, will do.  I honestly forget that irq.c and irq_comm.c exist on a regular
basis.

> Bonus points for merging irq_comm.c into irq.c (IIRC irq_comm.c was "common"
> between ia64 and x86 :)).

With pleasure :-)
