Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564CE1C8FCE
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236867; cv=none; b=BWHNxw6TgKtUir4osOJfSuIUoPqIIM102wjdKz/AE7I/vs01scWnRlaZ6UjFk6nZhMf+kbs5AYvhcEMQxBSihPIxH2gAmeyHEDD8HHUV6RWszlK5yUfPgA1g5xJwhCcekayi7tyaAvIg/TthCmCAso2UeX8SObx0Gf+oXy4gVac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236867; c=relaxed/simple;
	bh=iRLEbnQ97SUScJVSVjUaV7C+da230giu3NGUuXUtzoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlbdBdCyqfQrsWoGGW/BtXEth9bSPsJLztJjDg3hgO0p5b3u7R0NJjKCo7FsJkElu3Yp5In2gHIPWGdJl93Dfv76VMhBCjrk6hR5/abNGL8sLkL6S9CIR32/uuR/vaj1RCWz/w0CT9+/IvhniRDu3heXqhHJMkPMQSWp3ab4BZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkPErpUC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkPErpUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8EDC4CED1;
	Tue, 11 Feb 2025 01:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739236866;
	bh=iRLEbnQ97SUScJVSVjUaV7C+da230giu3NGUuXUtzoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkPErpUCLGgOPQPkOgIzgww3m9qOyyiLrzdlE2bRzs0QWo6Uqg0E29jf/49B+rtBo
	 laCF3nVoYVfEAQA1xZLi8NaTKqJiYmZ3gwFY8F+wyRrjyVuAo2QNH5OykkLUUXXqYd
	 xmfqEAtxk9NalBqnnDGKVN8ocemqPXj33yzP9aWc0GK2LfAUJtXRSNeQCOJTSItUuD
	 twyaJ5Bfn6lduMrvEljlSR/PDE4INGD3QizeV01ZVEDSuQDV7SYVa85XprAz1bk+iO
	 v8AH1FtqWCt3cpWNlHKZrEMLglr7I7zWjC+EtRJr77zI5sqs4NbAxezPxrMrmUxEUd
	 OWKryLaYB2REA==
Date: Mon, 10 Feb 2025 17:21:04 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/35] x86/bugs: Restructure l1tf mitigation
Message-ID: <20250211012104.mxhmvghlmyf52uaa@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-18-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-18-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:57PM -0600, David Kaplan wrote:
>  static void __init l1tf_select_mitigation(void)
> +{
> +	if (!boot_cpu_has_bug(X86_BUG_L1TF) || cpu_mitigations_off()) {
> +		l1tf_mitigation = L1TF_MITIGATION_OFF;
> +		return;
> +	}
> +
> +	if (l1tf_mitigation == L1TF_MITIGATION_AUTO) {
> +		if (cpu_mitigations_auto_nosmt())
> +			l1tf_mitigation = L1TF_MITIGATION_FLUSH_NOSMT;
> +		else
> +			l1tf_mitigation = L1TF_MITIGATION_FLUSH;
> +	}
> +
> +}

Extra whitespace.

> +
> +static void __init l1tf_apply_mitigation(void)
>  {
>  	u64 half_pa;
>  
>  	if (!boot_cpu_has_bug(X86_BUG_L1TF))
>  		return;
>  
> -	if (cpu_mitigations_off())
> -		l1tf_mitigation = L1TF_MITIGATION_OFF;
> -	else if (cpu_mitigations_auto_nosmt())
> -		l1tf_mitigation = L1TF_MITIGATION_FLUSH_NOSMT;
> -
>  	override_cache_bits(&boot_cpu_data);
>  
>  	switch (l1tf_mitigation) {
>  	case L1TF_MITIGATION_OFF:
> +		return;

Note the PTE inverstion mitigation is already done unconditionally, the
X86_FEATURE_L1TF_PTEINV bit is just for reporting that.  So this
shouldn't return.

-- 
Josh
