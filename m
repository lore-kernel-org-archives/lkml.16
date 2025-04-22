Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7ED1E9B20
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745299355; cv=none; b=d77gZ5RsHxoDgiLOuLRY9JU9JSl6oISW8GgI90/gQd40Y/0qvZfdhtCbecG4LfnxZ+C4Euj5X1sLw63DGXSyFeZH8T2rOkUy48eJoFAl2Ck+t0GWdabfkte9Lp+lJHKuxzBKSiH/0shpDh2Sxu6lMvR1dkHxu6IMyYR5HUuQUq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745299355; c=relaxed/simple;
	bh=GAGQG6NT3AP/5rZVSPZodJqqXQsMFbWsRXzW6mHL4AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBRSaG/91npbA86alzUFe9Z9Ymurlr7tzPh4P8DFcA9smS8yLDZ1nPeBXsmO6eNKR08Csr5XBCttneksPruOy/FJtui2Zo2clc25EFdIWbRhwfWu5mGSTr72jFzqd+J5h2FDg0LJTCcS6YDyZFbxxO0WHfpUEabSpkKfCehCFEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahA8Y4Se; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahA8Y4Se"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88D6C4CEEA;
	Tue, 22 Apr 2025 05:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745299354;
	bh=GAGQG6NT3AP/5rZVSPZodJqqXQsMFbWsRXzW6mHL4AQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ahA8Y4SePpw3xlpj329X/t7+9CPTDNpAHrLECk0n1T2uVML2eXHdnca/W6uDePzab
	 12MALMPt4LExQPJLrOMfcF+AcxcpjF3Qc34Es/sg7AEakPr3DCHLg5Y+tRqZQD57R8
	 80Tky7y6SMCzvTRJa3+zXjFIgBfZY4YSP58/Cam74K4JmwpYGfhUpGPOEZ15KKYE4E
	 cI7DUfingQQSDAzaqWuJfcHOCQ5Yi7dPcehutqmV6QIWwchiNS5Xs71wHOYdZmCBlM
	 Un+mXBLMWN/rO8ekBZ+J65p4VqXIzQfcyzF8JNw5Wk4ZFxhCEbu58Ic5VNB1c8sSSh
	 +2s7X8b0UqeYg==
Date: Mon, 21 Apr 2025 22:22:32 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/16] Attack vector controls (part 1)
Message-ID: <atsc4gd3spwbus2o2di5dsdhaxmyzdquxin46ba5tj2appjxt2@uab35ctqk7op>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418161721.1855190-1-david.kaplan@amd.com>

On Fri, Apr 18, 2025 at 11:17:05AM -0500, David Kaplan wrote:
> This is an updated version of the first half of the attack vector series
> which focuses on restructuring arch/x86/kernel/cpu/bugs.c.
> 
> For more info the attack vector series, please see v4 at
> https://lore.kernel.org/all/20250310164023.779191-1-david.kaplan@amd.com/.
> 
> These patches restructure the existing mitigation selection logic to use a
> uniform set of functions.  First, the "select" function is called for each
> mitigation to select an appropriate mitigation.  Unless a mitigation is
> explicitly selected or disabled with a command line option, the default
> mitigation is AUTO and the "select" function will then choose the best
> mitigation.  After the "select" function is called for each mitigation,
> some mitigations define an "update" function which can be used to update
> the selection, based on the choices made by other mitigations.  Finally,
> the "apply" function is called which enables the chosen mitigation.
> 
> This structure simplifies the mitigation control logic, especially when
> there are dependencies between multiple vulnerabilities.
> 
> This is mostly code restructuring without functional changes, except where
> noted.
> 
> Compared to v4 this only includes bug fixes/cleanup. 

Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
