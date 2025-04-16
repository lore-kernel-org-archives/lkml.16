Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44820C492
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744781989; cv=none; b=dfkZSRtsT92pzssDyHeCzeas58tkp61Z5PX6KYuJBYGwiy57GutoW6EAQSHBCduqQuyBsAYbuQ90tu5cOs10/yX6fWJN+KGWvCBkaMUpsDYuZce1SBKAb/9CzjZavK/0Uwa4qNcWE6CSCxJOSK5xiLAlMYAsK4u+LA9Cn5ZrOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744781989; c=relaxed/simple;
	bh=Mc239lu9OoAT9UTlxbfCyO2FvhjyOBoA7TaQVLmfih4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCyxdiEMZ2tMDfNvXP0UejlAIclHLRGqA4A7EYA8U34nFvWrWGj5q2L2xzKbxrCGDZKoCuPy73JKtbH5g1h9ygone3B/QX/eiUVqtxsrGhAKMSdHmUk2d+Je1AHr7I9zJtW3kVX/zZzMHKl8qsGhSu4XWwLolan0/kt73g3tjEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFfSV3wB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFfSV3wB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9134CC4CEE2;
	Wed, 16 Apr 2025 05:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744781989;
	bh=Mc239lu9OoAT9UTlxbfCyO2FvhjyOBoA7TaQVLmfih4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFfSV3wB8QEN/4nkzk2E6wR4awknEJqJVJgA2p43uXKp/OpYCpcXTp+nObVzaxqFn
	 yj5WjdccEWWmtPQeGA8FUGFPQ17Q3CPQsQBdb0Jf5tpEOEBAXhLHksWJkoqnxxrouF
	 d9zxB6GGCVZI45+6eOI0NxmGMCpw9cCRmmmkwLdlDtbLo1V+9uRMJqm8vqaaaQ3Ex0
	 t7OY6wkmv8tB7XLAKEjZzXbmgl2910Cuq/AznokFofAkPXLjQ6QdAOrtVFuAqZlU/c
	 7CxuhxonNUGB1nvEuNhs7Ad97FtRpd5bgNLKswyz6U0tjMUoNisuZJXmLpwujjEY48
	 ARMbq3PJaErHA==
Date: Wed, 16 Apr 2025 07:39:44 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Subject: Re: [PATCH 02/17] scsi: bfa: Rename 'timer_mod' to 'timer_module'
Message-ID: <Z_9CoGx9D98CIi-w@gmail.com>
References: <20250414102301.332225-1-mingo@kernel.org>
 <20250414102301.332225-3-mingo@kernel.org>
 <87lds2sjse.ffs@tglx>
 <Z_9A5tXUjVkHZFQX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_9A5tXUjVkHZFQX@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > >  #ifdef CONFIG_OMAP_DM_TIMER
> > > -	use_idlect1 = omap_dm_timer_modify_idlect_mask(use_idlect1);
> > > +	use_idlect1 = omap_dm_timer_moduleify_idlect_mask(use_idlect1);
> > 
> > I have no idea how this is related to the subject or the change log of
> > this patch.
> 
> That was a horrible script fail, but I wrote the changelog for the 
> right patch, which is the reason for the dissonance. I sent the updated 
> -v2 patch 2 days ago already (and it was updated in the Git tree then 
> too):
> 
>   https://lore.kernel.org/all/Z_0oWnbcjsekHXJd@gmail.com/
> 
> Unfortunately you weren't Cc:-ed for Thomas Weißschuh's reply, so you 
> probably didn't see the fixed patch. :-/

Correction, it was this email:

   https://lore.kernel.org/all/Z_zvpgKNKWVmEIFu@gmail.com/

And you were the first one in the Cc: line.

Thanks,

	Ingo
