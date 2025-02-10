Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC58624C69B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226310; cv=none; b=nhMgubwqIKMIk8bE5QcAXj/LKsyzNBIVwZqKslPsG/Ha1QjEIiJJus+7Ht0TWAkS7vG0CalVwB8Cjg2x3471XEDWfLu9Jg/U7iBIkp0y4fUTAwCn6x3+sUc18YhDtc5+7RMVkKWhdNGK0W2P47b6cyWyG24pDBXs8/oIDvdbYBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226310; c=relaxed/simple;
	bh=Uepl2UJMIlpVpz1wpaHJ3ESEndDMavpJqCd3me5Fpwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IThKZUiGnysxCGp2v/6UEZmCay3bLXCi6bPq7b9Rx+6YE/bhW/K34Mr8PFg74zjilRWV53XRGKexw3wzAbI2tbqyPe2gLwNKt0wTqielgPEr1xd9l9RqzEQbHBEYYo5m4AacTmHPsgFOqhcQu14bq84ttOQUylD54AoRK8w+ZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/UDdKdI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/UDdKdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBCFC4CED1;
	Mon, 10 Feb 2025 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739226310;
	bh=Uepl2UJMIlpVpz1wpaHJ3ESEndDMavpJqCd3me5Fpwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/UDdKdIz0LcQI9or0AUGK9sh0KAHlns8b4q+T4ioAvpc22LYdCpIo5GKfQ9BGIHY
	 9zBPtdm3QEMamadUVLIhVvKvQbauPMghDo007t5fgN8LS32NVk0JKdRKXTN94PbZM0
	 4lJ8lSULl+Yalgix39nyFZgjdZmuSUKykC7dYseKF16+zc0ztCL//CQojQMSyw2z9r
	 oDFLEHGWPbE0DtVvnwAl4zouxZxVU9iGzGtFD5LX5qamZfDGSC8FjgWD8M2XGW3lAY
	 d0C/x0NsjO+JjWBDQWppd6/JynBd7C2RR15R1cAdE3m51E8OPgxKUfqnzpUy7Jj/uB
	 u8BBLb85ZC7dw==
Date: Mon, 10 Feb 2025 14:25:08 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/35] x86/bugs: Restructure mds mitigation
Message-ID: <20250210222508.4ezkw4g33i4j42u7@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-5-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-5-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:44PM -0600, David Kaplan wrote:
> @@ -229,9 +259,6 @@ static void x86_amd_ssb_disable(void)
>  		wrmsrl(MSR_AMD64_LS_CFG, msrval);
>  }
>  
> -#undef pr_fmt
> -#define pr_fmt(fmt)	"MDS: " fmt
> -

Why?  For consistency with the rest of the file it's best to leave the
correct pr_fmt() in place for mds_*(), taa_*(), rfds_*(), etc.

>  static void __init mds_select_mitigation(void)
>  {
> -	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off()) {
> +	if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off())
>  		mds_mitigation = MDS_MITIGATION_OFF;
> -		return;
> -	}

For clarity it should still return here, that makes it obvious none of
the subsequent conditions apply.

> +static void __init mds_apply_mitigation(void)
> +{
> +	if (mds_mitigation == MDS_MITIGATION_FULL) {
> +		setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);

The mitigation still needs to be attempted for the MDS_MITIGATION_VMWERV
case.

-- 
Josh
