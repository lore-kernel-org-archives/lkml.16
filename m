Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CE2189BB3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781122; cv=none; b=hAqoinfbqoQhHRPxmo8v/YVg8KtvqIwcxNG9HIP7INJ4m3inNDWSlv0Ba3308mDwJzYS1nFKX3beg4XRuo+rhMwb3EYUbdas3/zM53OF5G93Fo7yHWlC0/ZQTmbrQDzSQOxluW8u4z00vz2+EMTZLCcpffwKl+uO2lraxIpNWO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781122; c=relaxed/simple;
	bh=vH6VASVfSCJNTEKUEXfzEvUv2LHvkwSnu2Rht1IUPNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=NhdWCKzSwnL1zsrTGCDR1SEupB73FzKqrtuVJF5+LLzZNJO7xet2AEVXDpcdxUBdvtZled406UCnCFhV1V169QfIYr7NbgNjhd1gBkCP/y2WjvPFbKCb/m5Ez6mDHi2IZbcIV0Vbo4eYPDzRct/Ny4Vbgzmj4ocF+dMX33z8VpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KKKc3wuo; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KKKc3wuo"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d04b70fe79so9235ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738781120; x=1739385920; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob6s9tYF5ZtJYStyioBs6l9IVGqgO/LxopNKg4U7Oo0=;
        b=KKKc3wuoNk724z+5Ma/y64Cr550nFgZ04I6dn8bif8NxdBZRzYQSYGSlfCegfhXi9k
         reCjJn++fhAS5YXXS/u4VninmC01n6CumowMNR0qGocGUt7qbbw/ahXSGXKQTRlRYrin
         z4jmS3wIYYxljk8tjpXp+glUoG2SySKP7SjVFZtzQdIINWIykblmHkO4Ww31C9Xf8Z7m
         fISsmNQvWJrY4yVlvctKth8gkx0RzWyv1i/TjtEdJiqO8W+0lCYE89ZdmeZaHWuKVMmm
         4HTtFzIp7Jq6Jtyonp4j6rx8Y8KJ+3iDZXtJJ+5FEPKi2YF+ZAD2EClql22big8h5/XB
         ZP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781120; x=1739385920;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ob6s9tYF5ZtJYStyioBs6l9IVGqgO/LxopNKg4U7Oo0=;
        b=SiDyFZstek9F3P0QuRKdcZ30jEPkFfLg5jiu7EHH9uDVyL/uCil4VXcp4XGVZi4mvU
         7yp/eb3ELOyS3PifgO0e8tuZZXDO7nmDX0H63sAMZG6OqVeTNqCSYgh7FurDnCsYqrEo
         YN4/poP0kXVl3siXIC4e9uQWC0wzJRvOaXjfGGkFF5bpL2yABAumkcNN/xRVvztUlH0g
         kEseaTPCeHLpP0/szcGZjsY28hMxeocNA9SP0ih433KBaCrrnge6W6tQvecvtNXNv0UY
         vIc2rK/SScm0ZCgNvirq5muz1DH+ok32R88umoyf0eSI01upTOPNoK9RX6SvP3HQTvOQ
         pkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnaQQmMV0Nn4h8b2XZAuOyZNXkBvS/kiQZzb3A+mxefgRKL2Hw8oIJP/aYYt+yoa35Q7ng+sn0g3basg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK1dXwsvTCvY+mB6oHUTpp5RYaRBIHIvFRrOcC8WFgl5CLr3KK
	YebSrPTGgiLePLwCgT3Z3/xH5dIUFlQmWUl6gNQlodhmCXt4y54iAEQrQIFlOsXAcqivWJwTUjj
	mqW3JnbRMIhTKeaC6+RcQy++SvbPbVhZuCizv
X-Gm-Gg: ASbGncvnuJgh6aHV7OY2SCJEo05bo3J6AvE3Nu9b5Et3btUB0foYlucnrZtJM94PjBO
	Gv+hWv97Nh7U7/+6VNeFe0R+e3scLwCOLZbJAzAoKCnXSAawjscKZuQm47m0WkmoER4Z+5Jas
X-Google-Smtp-Source: AGHT+IFGpBOvrq1mRFdL0+0b01B1BX5tMj/B4aJQMRqMHgjy9jiSXOeNNy8t6oCuvWF+uUYONn9I+T1DWRHyFyYMxPM=
X-Received: by 2002:a05:6e02:1a46:b0:3a7:dea7:87a6 with SMTP id
 e9e14a558f8ab-3d040f616a3mr8075435ab.29.1738781119660; Wed, 05 Feb 2025
 10:45:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113200150.487409-1-jmattson@google.com> <20250113200150.487409-3-jmattson@google.com>
In-Reply-To: <20250113200150.487409-3-jmattson@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 5 Feb 2025 10:45:08 -0800
X-Gm-Features: AWEUYZmFwc9ferdftM2xHra8Onm6SJC_VwfB7SPT8T1VswTmC5UG5t4j9AxCNWw
Message-ID: <CALMp9eRB025OAi2fpdweKr+fOAovmOKfF7XPwvf8HJKbJSvmhg@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: x86: Clear pv_unhalted on all transitions to KVM_MP_STATE_RUNNABLE
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>, 
	Gleb Natapov <gleb@redhat.com>, Raghavendra K T <raghavendra.kt@linux.vnet.ibm.com>, 
	Suzuki Poulose <suzuki@in.ibm.com>, Srivatsa Vaddagiri <vatsa@linux.vnet.ibm.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 12:02=E2=80=AFPM Jim Mattson <jmattson@google.com> =
wrote:
>
> In kvm_set_mp_state(), ensure that vcpu->arch.pv.pv_unhalted is always
> cleared on a transition to KVM_MP_STATE_RUNNABLE, so that the next HLT
> instruction will be respected.
>
> The "fixes" list may be incomplete.

The only commit I'm not sure of is commit 1a65105a5aba ("KVM: x86/xen:
handle PV spinlocks slowpath"). That commit introduces an mp_state
transition to KVM_MP_STATE_RUNNABLE  without clearing pv_unhalted, so
perhaps it should be in the "fixes" list. OTOH, this seems to be an
independent implementation of PV spinlocks, so maybe it's not a
problem.

> Fixes: 6aef266c6e17 ("kvm hypervisor : Add a hypercall to KVM hypervisor =
to support pv-ticketlocks")
> Fixes: b6b8a1451fc4 ("KVM: nVMX: Rework interception of IRQs and NMIs")
> Fixes: 38c0b192bd6d ("KVM: SVM: leave halted state on vmexit")
> Signed-off-by: Jim Mattson <jmattson@google.com>
