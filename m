Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5724EAB7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585804; cv=none; b=s09At3sAX96RtE9MELZT1c30d5/1qH7UBdfEk5EhOFjB8axlsr70/7/1XWlmImz948pCxAGbsH/xuKZ97tPZScVd7j/9NdN+uWd1Qhzpkw00+qfvstKuBOXVTZYCF2RtWJ0zxobXPUj061N4+1+TjnqBkO+8sK9RJ6bJgIQFXI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585804; c=relaxed/simple;
	bh=B9XUlnCct8tc/29FDG3VFh/1rTnHbWfKF94pbOeTBio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GW5UnRoEsUOI7ajthFIiHB4hNNkFGlXmKqVJDD45yLaEnLFWtjkMbCZw7v1ChA+3wfsxrTtikMIcBNoBrhA2qoTBQnD415hMRNMpV9P+MWDXdxosWQCOFjoel4Y3pb96P3ps+ygrgN9lqY6wvhwIHYdHUwYNiFJrUqpqtUmtTnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=RuzOCjuB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="RuzOCjuB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ede096d73so16186865e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745585801; x=1746190601; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jnvk1TG+dC2zLHnzaIEEd7gpPfBIDKi94FxYK6yvPdY=;
        b=RuzOCjuBbx4ES1urHWJHwvUofERtoDHLxYAk3SKi7t0gpB4NNOWhUqxXtzdDc9WCOp
         bWRCJr4IxO86ibONXnw7HwbG2wiRiz/EflpxSyVFesd/i4rSG7MRKFtMaABOpwnu94f1
         VW70nFGpqI4bm8bvnNNDWnvGobDJdkD9g8zFZ6Wp8U7WCT4CnHwVCGy9tC9HIY1HrfTl
         XNw4WTmmqZZVRuCfypClCNMm7HpZcYhhYtMjnzDLIKcNqRHsa/DYyRauKRzDy6z5MAqb
         Rb5qShfhVMjpYiXwPkUQH0ySirO6QpmWDJwxZewn2xPVDsHyEYzjsT1WztFPgMMGK+Rn
         EJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585801; x=1746190601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnvk1TG+dC2zLHnzaIEEd7gpPfBIDKi94FxYK6yvPdY=;
        b=BQ8Pws+llwttSrroxYEQ7bTtlV4Zbd5i+CAK/IhKDnboYwcFg7ehGS9orHyGaf2WkE
         YfrhVOB0VRapUEZj6OBms0XaOYym/YbkwOnZhgaD6WbXC/OFXPoxNdkjZuOR7olULPlH
         9cCMhZebP9YhCskPm/+M5ji0g3pUOmiNuu0B5MJqMjslYrYqRQcHEReIc+9Vhxm8Y+LM
         bl31EXg/+Km8K3Np2NR0mmsn8AX8uIGoHXinYbrqk5XJ/awFy9EpBBRkvhYemhC6YqNm
         7OPltfqyNNMoCbsQj9+jTRuIPbuYxKqToEA+Glf1+pHmOW5Idj93LqfDJ4b/jkgAbsO0
         dI9w==
X-Forwarded-Encrypted: i=1; AJvYcCXulEvV++h/CbBZoI28HjXpnx8XHzEnBSAlJFUPsDmzWuEPxLb7zEwDntXZmsHarpFRWU01Ca/Pq/srmvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyW4Z/+dDO1qswdgkzpFoCDYPIkA2Wx5u9gU4BI9OyRfoMerU3
	lC5BtLhJcJ0VCvWLFy69GapZTN6Kq4nLe9Quw68s73ik5s90YtvnY4e62ggrWCg=
X-Gm-Gg: ASbGncugEiWjEBKO6DxcDvM5rucvDlCbU6yK6jrhCGttonhsPYBd6Dh4KHET+USUYih
	X+jsI55YdpMJHeRSCyJ7yGn3uv7hOvJbhFoyMCvW913MDu9NNlc6xUVVc7m5PXfMOwm83exQfxG
	EXv1L0SlPTqPLoCMZwoPTPq6sNF6D8QttQaqPUT65F9GbSD0cPj7DkeSvjY6m/9XSMWRkA5XRnS
	ZraK8vZe1XwKSeID3tJs2rh/yEPNueGgERdWk3MOy90rzr9k1bs+5aTyaEBdxYbIq5jY0iZT9NP
	5c6v0R63uwXolslqxyZStK9vctyZfRmAuMf31kQ=
X-Google-Smtp-Source: AGHT+IFmUXNw7ABwk1AMQuio7wlOtcBFgvt+8iHk6nXh+9b35mkhblHJxA2ykHiHusAsYgEzWN0GCQ==
X-Received: by 2002:a05:600c:1c1a:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-440a66aca3fmr17281115e9.29.1745585800956;
        Fri, 25 Apr 2025 05:56:40 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2aab65sm55907865e9.17.2025.04.25.05.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:56:39 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:56:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH 1/5] KVM: RISC-V: refactor vector state reset
Message-ID: <20250425-657823a94b7228b742cbe122@orel>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403112522.1566629-4-rkrcmar@ventanamicro.com>

On Thu, Apr 03, 2025 at 01:25:20PM +0200, Radim Krčmář wrote:
> Do not depend on the reset structures.
> 
> vector.datap is a kernel memory pointer that needs to be preserved as it
> is not a part of the guest vector data.
> 
> Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_vector.h |  6 ++----
>  arch/riscv/kvm/vcpu.c                    |  5 ++++-
>  arch/riscv/kvm/vcpu_vector.c             | 13 +++++++------
>  3 files changed, 13 insertions(+), 11 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
