Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E392367A0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 08:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744447389; cv=none; b=kqZIVxqVr59W/3fYEpu4o+PPuoyl2AkggT6biPLE8KvGZqf1DZgQxDF93U1JoiJEf+NGypxPm8Xd72mE7ubO0wSFvDykFak+Uxo/2rdP1qEfo5krKDFLMqQ1ugCFAC3JdkcoRmuYwUUJ1gg8oAOzvhz9NxXB0HCj01R7cbFagoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744447389; c=relaxed/simple;
	bh=BgO8QIkJHresdI/GBMQsdjSdGosWWI6DhBZsh5lefoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8pEwDACZx2XdqQwHj3lsepLl4lNMvOrZnW8VyL+9VyymFnoAF7KuwL9JvvLC9PtySy091Q4WrM7xW2M3RmQIXtg9v23YXXBQjoXIID+ocENkPtN7USPrt87oV0TBs/K8UrxWVtb5MtCpIKfdAHfxZmHSz2UT78qKHnxZoAD+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQettfnt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQettfnt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C764C4CEE5;
	Sat, 12 Apr 2025 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744447388;
	bh=BgO8QIkJHresdI/GBMQsdjSdGosWWI6DhBZsh5lefoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQettfntwH/1cNZUlbFb7thkfzHeiEzEcrcr4kn0HzYQ6R9s+QJ7wrHhlxZ11TEx6
	 fagznv36Z9GEa59pBQngROCZLyxXZyemjdNzGIDNs9hRJ8gH+6sqQ4pNai79FY82Oe
	 iYbrBJLfWey8IrRQFKfF6uNYeGkMlqBBFicbLtjIXJJTiMt/mqhrr43ubNNa04N/1Q
	 HtAPyzL0WNJdHAQ1KUsvDGNxKn6yExkNWowLYL1JTrWsmpht8nDmZ6Rkcu/Qg9L9Ba
	 uAPdLjexD7eEGBEsDdaF3oV2ayR+A2aENmnOchaooM7y2YopIMNjwHGyswreO/a+tQ
	 36UjIQ6suDHDg==
Date: Sat, 12 Apr 2025 10:43:03 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
Message-ID: <Z_onl1QbH9L1-8dq@gmail.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
 <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
 <009062d3-d4db-443f-8337-ae4223efffa1@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <009062d3-d4db-443f-8337-ae4223efffa1@intel.com>


* Sohil Mehta <sohil.mehta@intel.com> wrote:

> On 4/11/2025 11:23 AM, Chang S. Bae wrote:
> 
> > I've attached the patch revision.
> > 
> 
> LGTM,
> 
> Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>

Chang, mind sending a series of the latest version of all the pending 
APX patches you have at the moment (and any other pending FPU patches 
you may have), with Reviewed-by tags rolled in, etc., on top of:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/fpu

Thanks,

	Ingo
