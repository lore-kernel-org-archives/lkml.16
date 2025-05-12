Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6341B297A48
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747073666; cv=none; b=JN/p5NSIVSFmHJstC+VV/+Jqe0Sa0C9+67bbOvnLW7+1kla5tR8zW61e06XiEa7HC6ysMXyi09rUtj39SaZTKHACUUnKLcEh+Ruc6R15x7lKyzqbP2HnK2z4cMGLw0pyXsSMGdOcwrME5wO6CceUEine3xIANa0Aga3xs8CxGno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747073666; c=relaxed/simple;
	bh=ge8nSwHM2/L0C3/tgG66L21hTU30oQNN1Lla7jkdOAc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XWSWhUimDkxlSVfvdBwJrM+nFNHeg2F5A7QOuHy9n3FKIikmZVCKHlqmHFoPRHzS8axdSgSOtV68SQ9yBo02xOADnFJW/GNhF5uXaVoZMXHLd5WmiU9j47fkXksghIOc/tz+HnfG7NU8eN7UivoPEKpLGgJOYmO+483zPrUGBEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jBiXfOEo; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jBiXfOEo"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30abb33d1d2so7526516a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747073660; x=1747678460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DppjzGuONHUmUt6xrl/Gh7jXlRXjo91ajvJ8cLSO9UA=;
        b=jBiXfOEomwUBjlJ9WAZ5r7XHHI7+2rnwX5D5JFGCpm96UBaGvvQ5jcUiQsRHj2dKot
         +Z8PCaVAGyw1qDLwsecrKWw1w2ZDJ6f7eq5TF6AtjyHMEEvDfbjjuECMWgby9wT/pXeX
         qDx+1CmpwiWD0uosMbiLBxAbTFziz4Bf/StmKyDKHSLD0I9etwYEXMLjyQlZ0R41tCYl
         2cFM4/Rh5MBrq9HB2AYPEaFeiREs/+nmvjUTI3wATJNNUeXLaxrofsePNFrjcfF3KuDg
         zdbmwpPfZSyHdxuVWg9OsKuLF3kvSa+8gisFzuyEYTFHGBXG//lzR7hdkn9HXocZsFsz
         P68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073660; x=1747678460;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DppjzGuONHUmUt6xrl/Gh7jXlRXjo91ajvJ8cLSO9UA=;
        b=K7LwS//PmhaXjv21Ef1x2P6zwChJ5VzP/IMdhyt8ksAmUCN39uPy5eqU5601Xg+GQ6
         +8ANiegbevIr1pITDOv29pBONFNQs8OUJKbwcBjz7CdtQVhNtKrj1J+UhVCI57/BPOIU
         2lcb2lWfxxJHuYmO8VzneNhbzqvJRnNvjgSifr/u8SuT9ozKqy9hR+M/6ZC4M612KD0n
         b7arrEeq13VX4RzPUV8eJGcqUVUwZIBq8pOY0PaLdeMB0iKPFZPlRqAlwhBHfn8mAyXH
         l6wBg1PHvRSZ0vleAtkd1eDYdJ1OK7YuntiCrfEcls+HB2yj1aDJ4pzfnLxnmHMEvIq/
         c5yg==
X-Forwarded-Encrypted: i=1; AJvYcCWfJit9QOQFiusJ5jUW9ThGNX5nz84kehsZIOWEcbzgEqqMQ4R1L+S/68vONoaCvncHYcv1bYKr8DqhMYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YynEkncyrHeNkTpSZM5d/UE2KEcdXxmIsjoKWdgZ86+j2osnc4b
	KzaSJo+Hu2M5vdooNy2Abetk28yYH2tdDn4FemSod/1y2gBgzuJwwPaAN6pLFFrt/zt0qbf0uYA
	aVA==
X-Google-Smtp-Source: AGHT+IFVSP9g1YX6T9SSblQiikemd9gCjFwSJSmUr0xZ8O9g7WsE/PEszOVr+Pcq7V+3+YvAiBJ1tciAERI=
X-Received: from pjbli15.prod.google.com ([2002:a17:90b:48cf:b0:2ff:5516:6add])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44e:b0:2f5:88bb:12f
 with SMTP id 98e67ed59e1d1-30c3d3eb7c2mr18454811a91.21.1747073660687; Mon, 12
 May 2025 11:14:20 -0700 (PDT)
Date: Mon, 12 May 2025 11:14:19 -0700
In-Reply-To: <20250313203702.575156-5-jon@nutanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250313203702.575156-1-jon@nutanix.com> <20250313203702.575156-5-jon@nutanix.com>
Message-ID: <aCI6e6KYXmfi_Oqp@google.com>
Subject: Re: [RFC PATCH 04/18] KVM: VMX: add cpu_has_vmx_mbec helper
From: Sean Christopherson <seanjc@google.com>
To: Jon Kohler <jon@nutanix.com>
Cc: pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025, Jon Kohler wrote:
> From: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
>=20
> Add 'cpu_has_vmx_mbec' helper to determine whether the cpu based VMCS
> from hardware has Intel Mode Based Execution Control exposed, which is
> secondary execution control bit 22.
>=20
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@digikod.net>
> Co-developed-by: Jon Kohler <jon@nutanix.com>
> Signed-off-by: Jon Kohler <jon@nutanix.com>

LOL, really?  There's a joke in here about how many SWEs it takes...

> ---
>  arch/x86/kvm/vmx/capabilities.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilit=
ies.h
> index cb6588238f46..f83592272920 100644
> --- a/arch/x86/kvm/vmx/capabilities.h
> +++ b/arch/x86/kvm/vmx/capabilities.h
> @@ -253,6 +253,12 @@ static inline bool cpu_has_vmx_xsaves(void)
>  		SECONDARY_EXEC_ENABLE_XSAVES;
>  }
> =20
> +static inline bool cpu_has_vmx_mbec(void)
> +{
> +	return vmcs_config.cpu_based_2nd_exec_ctrl &
> +		SECONDARY_EXEC_MODE_BASED_EPT_EXEC;
> +}

This absolutely doesn't warrant its own patch.  Introduce it whenever its f=
irst
used/needed.

> +
>  static inline bool cpu_has_vmx_waitpkg(void)
>  {
>  	return vmcs_config.cpu_based_2nd_exec_ctrl &
> --=20
> 2.43.0
>=20
