Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39D1260A24
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739231058; cv=none; b=ErbDy27yBKq596x1ikv7gIfurI0tyggTQ12zWPLXsi2/nn0hLqMUOpXhg82ir+HlJg97X6zzI9d8hM0nPxNXIZ3xWazGH0R8X+717zc37TeUQUnljA5lqJqFDoO0jsPoMGu9adRDOmRHaYzqn9078jVIqDEG42y8E3q18vM4YLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739231058; c=relaxed/simple;
	bh=6fdKWF9VS75w5hSZ9Tcaiba9oHoqZH79sLis/Mke6UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7jMMgvYCSdQcN4WY0jer3l32mkWlzxfsF+dHJVlFjV0CS6Ilen88ONiNYjy0WWys7I/fDi8aZm+ZRzKjsPWERFVEBKanxe6KMf5rUlCludqLQEvhdEk/SutweTk8Z1a8djbhjVbo4nMoTmRQaOVYHrxJ5qL+BgWrn2sGFjYOF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+mYeZMo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+mYeZMo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE08C4CED1;
	Mon, 10 Feb 2025 23:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739231055;
	bh=6fdKWF9VS75w5hSZ9Tcaiba9oHoqZH79sLis/Mke6UA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+mYeZMoMtpBtaGEQDr2Z4b0CO4TF+yMWUmxqRIDfez/0XhwFgHvYH4F7v2/39t4/
	 f92N4zOVr52kMX235wtRy+4BLWKM7apMFl7mka6IEMp/29/bC+0pL+RpBUrQUjla6f
	 9jW5P3A093pnd3BXuFR+IQxBj3ebJjEhK7UvbF2WC879pXfxatfyjhpJqhrhaKQNa/
	 RLNl1gEIFJom9auamO7fI4bO5UZ6L0jkAdNW/mFJyxntQZr1BGahoMsjD/LMtK2Cf5
	 kGUsyauuFem9CoqZckkFUkagDUjNMEk+KiMr6I2x8WkYeadbMEtYKHVcsHN+o/8CeD
	 6qA2zOwpo8EDg==
Date: Mon, 10 Feb 2025 15:44:13 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/35] x86/bugs: Restructure srbds mitigation
Message-ID: <20250210234413.i4vv6wuesxp37hyh@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-10-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-10-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:24:49PM -0600, David Kaplan wrote:
> +static void __init srbds_apply_mitigation(void)
> +{
> +	if (!boot_cpu_has_bug(X86_BUG_SRBDS))
> +		return;

I realize this is just preserving the existing behavior, but for
consistency with the others this should check for cpu_mitigations_off()
so the mitigation doesn't get printed.

>  	update_srbds_msr();
>  	pr_info("%s\n", srbds_strings[srbds_mitigation]);

More generally, IMO these should be printed in the select (or update)
functions rather than in the apply functions.

-- 
Josh
