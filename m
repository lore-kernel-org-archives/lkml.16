Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D441D5CE8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744304931; cv=none; b=EQXjHZaMfkXVA48zDsxlYaDft0nGQyjPx/h7LJKFMZ0Xl6CYpLjUQb6KMGKKfRN997XfPDBFiDJNsxX9IGdE9fx12UHI16dH3n8M/z/pGU0KpNpbEY7J7qFoKLlgELo7kyuRrx9LYeACwW5KwwpRE9uUhzSL1pxqFAP6O2l6r7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744304931; c=relaxed/simple;
	bh=NLI2VkAb1xPOJ4XzNb+KccXuF5MzPJGHMA4BfMItFvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rIw1gSb2VEU67/agXmk/gC7UlCTZldwe/QCJy1tFDH8u8SSv4RM4b8C/V49F0ZD4Q75Hko8JpKT0OiRO/ZU4cZ7BeYUSCJH6AkrOOBe0pukVfxAxtY7InV3XOvj6xVn1nHkOBcx3ktqAJzrxCpWCQCWZVoZQ/PXWSQ+kdXmMXzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeJxAvSC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeJxAvSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEB4C4CEDD;
	Thu, 10 Apr 2025 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744304930;
	bh=NLI2VkAb1xPOJ4XzNb+KccXuF5MzPJGHMA4BfMItFvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeJxAvSCc82jt2eMiJUWtLInIDdaFDCdY6nlCHdJK9skZzWyw1OOuu/8gvpq1gApT
	 d9HwNM2cMGyq/H5QkruXIitnbju0TWN+mrNU78Z2Ve0BNyArRkhf0+pY/SNUfAaFML
	 4ilQzpzd7p+memN6XBA+/xUruwA8HGOevJKY77IfiBpW2aPG317PFqiXS9TvaLSwb/
	 ZpXdEN36pVRgchwCUkjeBAaf2RyVNYxKYwXITJdIfr/5nXqaSMFX2u3zf7NC5dz2c4
	 eZMPpRl2P1uVK4v7UbLE4Z+k6XVILat+voitEsaBVzy+sdz+WkKNjPaRrqTCv2zr8v
	 jcGTrsjNMnhsA==
Date: Thu, 10 Apr 2025 10:08:47 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 13/36] x86/bugs: Restructure spectre_v2 mitigation
Message-ID: <pl56rfs34temiqmi5guqcnfivrpc7eeq2435btjimtnhaawj7t@2zqh7eufl34c>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-14-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310164023.779191-14-david.kaplan@amd.com>

On Mon, Mar 10, 2025 at 11:40:00AM -0500, David Kaplan wrote:
> Restructure spectre_v2 to use select/update/apply functions to create
> consistent vulnerability handling.
> 
> The spectre_v2 mitigation may be updated based on the selected retbleed
> mitigation.
> 
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 79 +++++++++++++++++++++++---------------
>  1 file changed, 48 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index 96cb2ac70245..b4a72ddf159c 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -56,6 +56,8 @@
>  static void __init spectre_v1_select_mitigation(void);
>  static void __init spectre_v1_apply_mitigation(void);
>  static void __init spectre_v2_select_mitigation(void);
> +static void __init spectre_v2_update_mitigation(void);
> +static void __init spectre_v2_apply_mitigation(void);
>  static void __init retbleed_select_mitigation(void);
>  static void __init retbleed_update_mitigation(void);
>  static void __init retbleed_apply_mitigation(void);
> @@ -212,7 +214,12 @@ void __init cpu_select_mitigations(void)
>  	/*
>  	 * After mitigations are selected, some may need to update their
>  	 * choices.
> +	 *
> +	 * Note that retbleed_update_mitigation() relies on the state set by
> +	 * spectre_v2_update_mitigation(); specifically it wants to know about
> +	 * spectre_v2=ibrs.
>  	 */
> +	spectre_v2_update_mitigation();
>  	retbleed_update_mitigation();

I'd suggest moving that dependency comment to above
retbleed_update_mitigaton() and making it more concise:

 	/*
 	 * After mitigations are selected, some may need to update their
 	 * choices.
	 */
	spectre_v2_update_mitigation();
	/* retbleed_update_mitigation() depends on spectre_v2_update_mitigation() */
	retbleed_update_mitigation();

-- 
Josh
