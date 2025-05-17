Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFE81EB18A
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747487994; cv=none; b=dmJuqlAfrBcn35c12DR1O5xX+nUyJtuFo/whrwTNq9smaCxqH0Rmnt6OTe5/cnfiaP4VUq+c3RC+gcNYXlpxQEGNelX4RLD6GmDN54c84nAxX8i1hDIzCFgfSEj4j5l4EcLKQ06fSMJeDZqiKQq5A8i2WqcTAk8lsaxw/xSb3HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747487994; c=relaxed/simple;
	bh=7oeJj3yrKXjNOvL4EwX7eDpt1ZKyQvpsAj2Zzm3bSu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bus0xUBYhdVzkUXfbpGuDwBf5bGeoLJPAY5Ryfftpa1VFljc8erR8J0YkuwS33tRrd+9Rmf0f1i0myL60oM+z6FlkHJo84kcc5uR9F+LgbG+c7HD31ul1poucNMYv7MLurZk2tFX3CSTjpDyjDDga9dVpImqYRU9mKUaNsa5K04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usfSh5ZI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usfSh5ZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99F9C4CEE3;
	Sat, 17 May 2025 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747487993;
	bh=7oeJj3yrKXjNOvL4EwX7eDpt1ZKyQvpsAj2Zzm3bSu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usfSh5ZIFMr1EwXPdq7QUx8T+c/GIVH3TyOMLBxB+P9M0pDk9X4KdlTxY5pR3BnjY
	 U/T223bkx3QP0OvK85FZCeXxIsfZU9BS9ekVtid8iwJCA1CmFN21sNYALW/zdsQdWG
	 ayeSZf2r7IJuwpG0BEhaGgZx/jZnUvGInh4i6YQK9+UJwTS8vDNUGiVWFTqe/s4ByU
	 pitTiveIK8Ajz/10L9Y3RqIqPyI1+8RA0rVPFVYeEjTgmjdlVEZLSBFpde0+PgJDMi
	 uP9vivRDE2gbHlmIpIMOIYcxXWx2/hmsZmhSEOLXMMJHpUACCfq//wOxIJ+duuSNYS
	 NOWy2PrOMoLDA==
Date: Sat, 17 May 2025 15:19:48 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/bugs: Restructure ITS mitigation
Message-ID: <aCiM9BebdBUEBK3E@gmail.com>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250516193212.128782-1-david.kaplan@amd.com>
 <ba2239fb-6740-42c6-b6aa-e1c7a575b83d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba2239fb-6740-42c6-b6aa-e1c7a575b83d@intel.com>


* Dave Hansen <dave.hansen@intel.com> wrote:

> On 5/16/25 12:32, David Kaplan wrote:
> > Restructure the ITS mitigation to use select/update/apply functions like
> > the other mitigations.
> > 
> > There is a particularly complex interaction between ITS and Retbleed as CDT
> > (Call Depth Tracking) is a mitigation for both, and either its=stuff or
> > retbleed=stuff will attempt to enable CDT.
> > 
> > retbleed_update_mitigation() runs first and will check the necessary
> > pre-conditions for CDT if either ITS or Retbleed stuffing is selected.  If
> > checks pass and ITS stuffing is selected, it will select stuffing for
> > Retbleed as well.
> > 
> > its_update_mitigation() runs after and will either select stuffing if
> > retbleed stuffing was enabled, or fall back to the default (aligned thunks)
> > if stuffing could not be enabled.
> > 
> > Enablement of CDT is done exclusively in retbleed_apply_mitigation().
> > its_apply_mitigation() is only used to enable aligned thunks.
> 
> This seems to be explaining what is going on, but there isn't a clear
> problem that this is fixing.
> 
> Why does this need restructuring?

All other mitigations have the following methods:

  static void __init bhi_select_mitigation(void);
  static void __init bhi_update_mitigation(void);
  static void __init bhi_apply_mitigation(void);

(The _update() method is optional.)

Except the freshly added ITS mitigation breaks this pattern, which has 
all this functionality in a single function:

  static void __init its_select_mitigation(void);

David's patch refactors the recently added ITS code to follow the 
existing pattern of all the other mitigation methods:

  static void __init its_select_mitigation(void);
  static void __init its_update_mitigation(void);
  static void __init its_apply_mitigation(void);

This makes it easier to read if you know the other mitigations already, 
and makes it easier to maintain going forward.

Thanks,

	Ingo
