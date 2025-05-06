Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4835026560B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526218; cv=none; b=mTDNHQcZNSkPMzkNF5/jZBcdESHD1mhzgSZ5VDOet/wYgX/5K6y40Y1hg7D7ntZzuMCshbaRCkTnenfPYH+Wiu3c+mWHuVxguNmPxeB2K+vx2HRbA+7HTnRLpSXiU31k8mV2Z4w3IBSkr0ayoiA8/RoPnp2Ym57geN+2IxQ2nwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526218; c=relaxed/simple;
	bh=4ymTURkC2WHBNUaMBm0GbRCjkPcBy8xTuk2uDzpTIdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUTxX0g/5xXOzSzCrPlMye7KnySYp5b/p/keGItTzVUXXmh1r5KiHvWgZRlm7qoyrjhoJD5umGhDDT6FYzmXKJ90XBrUGKcsKl/stbMvQsyRVYN7KdcYDoAgaWgjPNQHQYqC1qu8pKicYBz6fZpRB5qb6lxA2/XDxyYoxHl/3Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dVCX2Pfs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dVCX2Pfs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso52055e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746526214; x=1747131014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Np31GT5x8wgm7/sKQHFUJ4Rm2JmmDAX9KCDSS5Rzjf4=;
        b=dVCX2PfsGpqWVb6D7f3MWVmo+pb4VHX5miqb7RcNgqDuuKt04zJU6psWo5nJcNcY9p
         G5QOPtQmaIjgxOQ4A3J9ZlZ3e5D68GQ2yAC5gLjoVgGQJ4nwtLQDpDFnkNPWjQN5xWex
         IXnzU78FybdISfHMJkWk20gEDwXnh330xCBtE7xypOzZLIvRYVvZjLBU81YIV6lMRdn5
         YyS9Vyn8FlRszfyisRgICpsyQ1n26sB1r7FdaX8d3dtzpx7er6NDcmzZ56lVSfuFlxoP
         g7sB+JG9XThBXFNxTKPSac/69WlXFhCkZBRkiF3ZbYKejuZIIi1ydEqFgqspKoQGzukc
         7i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526214; x=1747131014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np31GT5x8wgm7/sKQHFUJ4Rm2JmmDAX9KCDSS5Rzjf4=;
        b=ukqXrvNG6u4BWB6u9Er7PV4UiT8qPEw9+oDovVRvt7CkmGKO0utfj0neLUJM8VlO01
         nWEavdi2vRo7vLHTTkRNDExfd7RWlPzBngbDUSRe7oPgMaZbPF8VTdwA5lXqLtWzU57+
         kZQV1C33XnGwhyvN5dy0uB8MNdumAnX7I04Hrn198io8Q3G0DX0FrimhP9Ulh4K1PjEQ
         4SoSxY3iGnBoJLRBwxSISnOvrOFR9w6Ox/1jBqO0Sl4JtUNHTQ2e7xyM8/YbTMViDptE
         Ka6zeiytlr+iRJHWTxskWMM33kOuOcnIqytjrxviPir5SXAIe13/B8LOMjXnZsvAaGrd
         iA5w==
X-Gm-Message-State: AOJu0YzZvNWb1Ra3cpcG5jSCjx8pEm+L6zXzJ1dwsN+3oXS342norSoq
	ek8ujBmvdaXwHzwYMzk1dBDxVpC+tJs5nGaXVQh157AISJrOeSUWsx1gx42pTg==
X-Gm-Gg: ASbGncvdqnmrSLan7WwJV6yd3B/x9Zh7Bz4C+32MatndJ4ypBCvHWtzlIbtXn28OIg7
	cqot1iArVINHDCiDkjMJqOKjKsaZdiMH+FfxrOJ8HUsv+GXx12Ocd2GTJGU1PmM/iVuIsu/pZqQ
	zhj0CvCTGVBpE1LrnBBiCp0hWxij3/O3fNt7IhZWcO1LOnUlK0+ErUKn1t0JVaRPIetvhuTPP7m
	3S1v/TuWSoY8DlXHYaWXPe3bW4JU71dTY4XIfFffYH1BNGRXyD+DlnYCgSKARILBRJIClFBMyqK
	s2fHM7nWOow5KNFwqUyL6kG/anZGy2W3uMY82jIxD7pkMWjpknJhwIbifSwUZK6AEDDaNPNmQpl
	ZgRQQ2w==
X-Google-Smtp-Source: AGHT+IGtRPKB/+Q9Ge4udRxLhd2o6sZguJW0tmzy+145XL5MDm4emH9nCDY7KueOSoFmJsSuDoU+rg==
X-Received: by 2002:a05:600c:2111:b0:43b:c396:7405 with SMTP id 5b1f17b1804b1-441d123f7cdmr702955e9.7.1746526214349;
        Tue, 06 May 2025 03:10:14 -0700 (PDT)
Received: from google.com (207.57.78.34.bc.googleusercontent.com. [34.78.57.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20a70sm211382205e9.31.2025.05.06.03.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:10:13 -0700 (PDT)
Date: Tue, 6 May 2025 10:10:08 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Per Larsen <perl@immunant.com>
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
	james.morse@arm.com, jean-philippe@linaro.org,
	kernel-team@android.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	qwandor@google.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com,
	armellel@google.com, arve@android.com, ahomescu@google.com,
	Per Larsen <perlarsen@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
Message-ID: <aBngABDE-wtpM9o6@google.com>
References: <20250502092108.3224341-1-perl@immunant.com>
 <20250502092108.3224341-2-perl@immunant.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502092108.3224341-2-perl@immunant.com>

On Fri, May 02, 2025 at 02:21:06AM -0700, Per Larsen wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> FF-A implementations with the same major version must interoperate with
> earlier minor versions per DEN0077A 1.2 REL0 13.2.1 but FF-A version 1.1
> broke the ABI on several structures and 1.2 relies on SMCCC 1.2 is not

The wording here is a bit hard to follow. Why don't we re-write to
something as simple as:

"Prevent the host from re-negotiating a smaller version with the
hypervisor. Once the hypervisor negotiates a version, that should
remain locked in. Fix the current behaviour by returning NOT_SUPPORTED
to avoid the FF-A ineroperability rules with ealier minor versions which
allows the host version to downgrade."

> backwards compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
> 
> If we return the negotiated hypervisor version when the host requests a
> lesser minor version, the host will rely on the FF-A interoperability
> rules. Since the hypervisor does not currently have the necessary
> compatibility paths (e.g. to handle breaking changes to the SMC calling
> convention), return NOT_SUPPORTED.



> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> Signed-off-by: Per Larsen <perl@immunant.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 3369dd0c4009..10e88207b78e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -712,7 +712,24 @@ static void do_ffa_version(struct arm_smccc_res *res,
>  
>  	hyp_spin_lock(&version_lock);
>  	if (has_version_negotiated) {
> -		res->a0 = hyp_ffa_version;
> +		/*
> +		 * FF-A implementations with the same major version must
> +		 * interoperate with earlier minor versions per DEN0077A 1.2
> +		 * REL0 13.2.1 but FF-A version 1.1 broke the ABI on several
> +		 * structures and 1.2 relies on SMCCC 1.2 is not backwards
> +		 * compatible with SMCCC 1.2 (see DEN0028 1.6 G BET0 Appendix F).
> +		 *
> +		 * If we return the negotiated hypervisor version when the host
> +		 * requests a lesser minor version, the host will rely on the
> +		 * aforementioned FF-A interoperability rules. Since the
> +		 * hypervisor does not currently have the necessary compatibility
> +		 * paths (e.g. to paper over the above-mentioned calling
> +		 * convention changes), return NOT_SUPPORTED.
> +		 */

I would drop this comment as the commit message should be pretty
descriptive.

> +		if (FFA_MINOR_VERSION(ffa_req_version) < FFA_MINOR_VERSION(hyp_ffa_version))
> +			res->a0 = FFA_RET_NOT_SUPPORTED;
> +		else
> +			res->a0 = hyp_ffa_version;
>  		goto unlock;
>  	}
>  
> -- 
> 2.49.0
> 

Thanks,
Seb
