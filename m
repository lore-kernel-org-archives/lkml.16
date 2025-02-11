Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFFEBE6C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739235222; cv=none; b=GfREwMJ7ZbcGkjc76vxp6lt+lR48MuVBE/CRaL0/xigYgN4dT0+XYOMnJKm4ZFJjd4a21fqmj8ptHPuO8FP+P+RIXtM+FI0EUPd/NuiH8pS5f9SDVjVrtsQmfFF1EdaElnReW1o55svvDWvCD+OikC3XGVDCxMDoNNbfqqLMT6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739235222; c=relaxed/simple;
	bh=iWrsziksoIjVH73A3wgChorpZJUICB9bTC89pl3xiBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxQ2yaHClgGZyJfAJg+ALVBLNG4pTZCpN2mqq4mc/YBHSlrSieiWys3pTgqqI0YGn+0rPIPazbQQFXIwS5l3o66k0yhjDnwuYGnQGS2tpy9ItU4fDpt//hDDaLzud0zUM1xUXNelbWPMrUCuv1vrkzJNQqeaBMCoDvK2b2+oRxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d94WcSEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d94WcSEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B32C4CED1;
	Tue, 11 Feb 2025 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739235220;
	bh=iWrsziksoIjVH73A3wgChorpZJUICB9bTC89pl3xiBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d94WcSEoeQf+m0B+EIFfPbOgTbH0VsMlpgT3w+6q3bs0cHLQmePmefaGFiAPZWemg
	 WCPXp+qFlcIYW3xOmlLFsCk7dPZq3Ig0KQ/EqVwRR2dvbgVG3IYZcQiTQrDsvFFUyZ
	 bOPru6YzCWsgSvSGFcULtNEUxj83DmfHISLcy/vfdTR/oJZjHFYNfd82v8gsuBJ5w3
	 Qylqywd5ml1qN3UyyDmuPFoMK098BkuaPpDFUAAEw19CBklXxvYbjQAk8Wy8fwEcFF
	 i+YAhYlGnQvRvH4+9cJdYdofbKAg04S5fB8IbDn7f1NdKJrM0UHgojfX5c70F9M5Ki
	 y6p7XxtoRwwrw==
Date: Mon, 10 Feb 2025 16:53:38 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/35] x86/bugs: Restructure spectre_v2_user mitigation
Message-ID: <20250211005338.dqj5sg5sj7repdu6@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-14-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-14-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:53PM -0600, David Kaplan wrote:
> -	if (retbleed_mitigation == RETBLEED_MITIGATION_UNRET ||
> -	    retbleed_mitigation == RETBLEED_MITIGATION_IBPB) {
> -		if (mode != SPECTRE_V2_USER_STRICT &&
> -		    mode != SPECTRE_V2_USER_STRICT_PREFERRED)
> +	if (spectre_v2_user_stibp != SPECTRE_V2_USER_NONE &&
> +	    (retbleed_mitigation == RETBLEED_MITIGATION_UNRET ||
> +	    retbleed_mitigation == RETBLEED_MITIGATION_IBPB)) {

This adds a hidden dependency on retbleed_update_mitigation()?

Also, that last line should be aligned one more space to the right:

	if (spectre_v2_user_stibp != SPECTRE_V2_USER_NONE &&
	    (retbleed_mitigation == RETBLEED_MITIGATION_UNRET ||
	     retbleed_mitigation == RETBLEED_MITIGATION_IBPB)) {

> +static void __init spectre_v2_user_apply_mitigation(void)
> +{
> +	/* Initialize Indirect Branch Prediction Barrier */
> +	if (boot_cpu_has(X86_FEATURE_IBPB) &&
> +	    spectre_v2_user_ibpb != SPECTRE_V2_USER_NONE) {
> +		setup_force_cpu_cap(X86_FEATURE_USE_IBPB);
>  
> -set_mode:
> -	pr_info("%s\n", spectre_v2_user_strings[mode]);
> +		switch (spectre_v2_user_ibpb) {
> +		case SPECTRE_V2_USER_NONE:
> +			break;

This case can't happen, spectre_v2_user_ibpb was already checked for
!SPECTRE_V2_USER_NONE above.

-- 
Josh
