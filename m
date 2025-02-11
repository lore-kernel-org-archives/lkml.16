Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C331EE013
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295807; cv=none; b=U1y120+hdDDTJefMP4l5a/P+dpHCLswnX7DYQ5GdC9rNFcHQBfsJdSUPnviVVL8gHNw+LBNBBc3+OK+WxK+2OUlTwpvomAguCW/Q3KhbZLGD/osNte6vC2YJnTh/mXkq2w6z6HDTIimH+NRnZoIPcbNLMfdiV0cSgLfshHDpbpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295807; c=relaxed/simple;
	bh=7JLxDrT3W6Nr5nwag7NkXl8otRQTU+qirxdskHYS1cQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H4udFNz1AhXbKuR3prgAjPNgFx2BFRQ0lk0Ru6yUA00k2oTqh3B4BeOVzZ6rghQOaYytVHUfoq39BVf/hDuO1LxsRHrS1R+JGzog8s4XpvSpFVut2b/RcEEj/yEnzRryPl3pHbA/NnRd7S7dLx+EXiHXuMZ9llHGc1sfy2PTBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1kzZjwal; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1kzZjwal"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f816a85facso12244128a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739295805; x=1739900605; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K4mrriPfgsPPxXSFmU/JBzChLIiRw5rZPULaSxSIiLc=;
        b=1kzZjwalaPl8jk092FszygdrR98spkNew2LzHWEsrt59VyjAqtduuEFBcLYkPQC+8W
         2WmKM3zQdlArcP9z2bSmL+97fvObWIPgsSXD29htY9ply93RCGXMO82DWVF6Z8IJhrS6
         WiDeqL+kBXaLiv5PvNwZkKlJwXNU9two1d5D+6x3kCokO0ZUTo5CCziLw48ukK+AyWBr
         syhZfHbg6h6lQMi9gWajakhfuaf+XVDKw1LQn21NTGZBHTjYSLfFhwY8IoGQt888t7ub
         jjnX9ACA/z7s4X40nWT4L+4VyhrBon3T5ZgGqrQnsHi6M2r3kJpK+4UuBJn6uwC46jIM
         C3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295805; x=1739900605;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4mrriPfgsPPxXSFmU/JBzChLIiRw5rZPULaSxSIiLc=;
        b=eTI5u/pKw2M420TzvNFSvRI2sJdRX9ikbwxXO67HDDnl5LOsiDtEAThbrQBl2bI9An
         R9Gfruz0fazcvB8ARTOjEY2o709Y1eejWDbvcNRPvOh5CeSf7KBpT3AXw1kPirJLrclx
         Pfm5nAK40Xkgrk+6keAvpPCWfkWXfzhe9h4YWbu76UXlqFOu9bCt3QEl/7aLo87X0Gj4
         9iX+HRqb3AG0q7VJLMvg7Bu9v++QNdkVdzoBjFGu4oGoekxRInCJohdaIKun+1JsKXoi
         60TshWnBHaKPwz29NwsfC2ivC/WfTkWFY5iLlXpoPyuzwm006hJu/sk1BFaKoHUef51d
         Ha7w==
X-Forwarded-Encrypted: i=1; AJvYcCUkg9UfCQ4Ra3dP0/L4QIyz4ljBCchvXP4tEvDH4GSDggxxFueBsFSxBNHh6hr06u3vgp3b0Xct/w2syzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXUcIZjtynl6Bs0CjuEE02gZz9JmZ20716vGpglJSrznWmmx8k
	U2X2t7HPC1C8Fq009owCMzhR+2d/Mki9yEuqUOJas1B1YgEjX+uz/g7aP/bdyuibd7TU1D2ItP4
	IJA==
X-Google-Smtp-Source: AGHT+IFvsE6NJWsYg5eZawythPvtd1Ryiyh5QdfSD0iYprnIkMmal30fbTQ5swLortjkJ0haAujEqXDb7dE=
X-Received: from pfbbj9.prod.google.com ([2002:a05:6a00:3189:b0:730:8ca0:1f9b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:998f:b0:1e1:becc:1c9c
 with SMTP id adf61e73a8af0-1ee5c7db2d5mr167479637.28.1739295804800; Tue, 11
 Feb 2025 09:43:24 -0800 (PST)
Date: Tue, 11 Feb 2025 09:43:23 -0800
In-Reply-To: <20250211173238.GDZ6uJtkVBi8_X7kia@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-4-seanjc@google.com>
 <20250211173238.GDZ6uJtkVBi8_X7kia@fat_crate.local>
Message-ID: <Z6uMOyHD3C6-qCXz@google.com>
Subject: Re: [PATCH 03/16] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 11, 2025, Borislav Petkov wrote:
> On Fri, Jan 31, 2025 at 06:17:05PM -0800, Sean Christopherson wrote:
> 
> > Add a TODO to call out that AMD_MEM_ENCRYPT is a mess and doesn't depend on
> > HYPERVISOR_GUEST because it gates both guest and host code.
> 
> Why is it a mess?
> 
> I don't see it, frankly.

It conflates two very different things: host/bare metal support for memory
encryption, and SEV guest support.  For kernels that will never run in a VM,
pulling in all the SEV guest code just to enable host-side support for SME (and
SEV) is very undesirable.

And in this case, because AMD_MEM_ENCRYPT gates both host and guest code, it
can't depend on HYPERVISOR_GUEST like it should, because taking a dependency on
HYPERVISOR_GUEST to enable SME is obviously wrong.
