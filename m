Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE7429CE6
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236066; cv=none; b=YIdg0DTjd//M+S97J/5mRfq7A+tucNGjK9XkA842PoPCFe7+9PvWtY9IvaSy2HET1ye7N40zKvOLqmq1Gq4c3XRiHexUWqBO7tC9yVl0HZ8OPwhe12jNW3AsicD8BU34RHGejFpS4tZRe+Hi+0i5Lp/ag1tFpv1EhaSUydwDLJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236066; c=relaxed/simple;
	bh=DcpSUeNprvRejPSiKA36FoQV9MJtjWxaUmVNmy4b0cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SW3IyO5dlKLgWycNG8zqrtJmrg8sUPZgC3SQtVbHXCSVUn31rxy7J5l2oiwCqbETjXleNvjHHXRvUuNOD23ZCngxrCqyIeL4ViHp6CBvUk0L4tUpdR/+XRoG7VMhQ0T79tzOCHD2XcqZjj7BsCqdr9khPGBIJXwqf5Lc0stE2PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOtQaCW4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOtQaCW4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7797EC4CED1;
	Tue, 11 Feb 2025 01:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739236066;
	bh=DcpSUeNprvRejPSiKA36FoQV9MJtjWxaUmVNmy4b0cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOtQaCW4ftsFV0kgfP2iyRMj+dw2sOJ7F1QbKdZwd5mfyZzTcIuVBlMBSdXoCdpMC
	 l2UTaPDhiyH+DPjnOgUprNVfRlQMYGw803hEkVIdMYaXJM6CZRgjkuR/BGwrKQDVnw
	 1WgkFGTiU+syfHAzPJzlICG6l1PDj7TjD9uRyxW8wOAOMevUMGc3juOGy1UmWZyadC
	 w7QXPVr0A0Qiv4Wfkm6rQN5EJS0BMuSgGZJWzR7Y19y1Ei9Es+4vH1iw4tkk2D028I
	 WZ7BiYEMxcWLzXsAh48E8IEwPd8+UrJlFUGF0YW8/eXXaDBxJyoNcbBb2KOtdxWeFM
	 hAZ4litqSyG8w==
Date: Mon, 10 Feb 2025 17:07:43 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/35] x86/bugs: Restructure spectre_v2 mitigation
Message-ID: <20250211010743.75kzltegyvhdwkuw@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-16-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-16-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:55PM -0600, David Kaplan wrote:
> +static void __init spectre_v2_update_mitigation(void)
> +{
> +	if (spectre_v2_cmd == SPECTRE_V2_CMD_AUTO) {
> +		if (IS_ENABLED(CONFIG_MITIGATION_IBRS_ENTRY) &&
> +		    boot_cpu_has_bug(X86_BUG_RETBLEED) &&
> +		    retbleed_mitigation != RETBLEED_MITIGATION_NONE &&
> +		    retbleed_mitigation != RETBLEED_MITIGATION_STUFF &&
> +		    boot_cpu_has(X86_FEATURE_IBRS) &&
> +		    boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) {
> +			spectre_v2_enabled = SPECTRE_V2_IBRS;
> +		}
> +	}

This has a dependency on retbleed_update_mitigation() which hasn't run
yet?

-- 
Josh
