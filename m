Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BCC18DB17
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743752917; cv=none; b=ADMYQH0fyTheyrOD/EjCYPnHOq1tSqjdCNP6nKc+DGWGDsHI59zeh4+5ZaMhppx1Vs4A8liuyo2GJfhb/nTAfYHZJSCXAPF38wdSVZnLq3KiA3eFDKmIb23XzNzQmMK+wNcc3NOqp4RcM+ekAbUvGrH83b7JS6yLHSfVOEo6xT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743752917; c=relaxed/simple;
	bh=CggumWzxewmLNe6/7zWOIz/yXabrVY8+bwcCUS29nes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlaApDdrbpKSPXmr+K+4ZuMrzngKJ5wV2Bu2iNp5pdwZI8aNjebTkUZsdnSjXzEmQJBDnBR4bH7epIkaC02sJ+tMh0R0mZwYJnrIAom+pQMevhoCR/dMvQJYp6eOFvIKs9fVHwdVxQsmkyK4nDLjQ7HM1pPsa2z+n3b4Yx8EqaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MLDsnxuu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MLDsnxuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F19C4CEDD;
	Fri,  4 Apr 2025 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743752916;
	bh=CggumWzxewmLNe6/7zWOIz/yXabrVY8+bwcCUS29nes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MLDsnxuuEPdlHegCEfs47SZkZEnwIe++gVXWTHG6u9GnbDWts0vxVxEGZNGVv7wNK
	 D1RPgG4Rf7GQK5dJt596A1oFh0/OuxaAn5edtf11ra4jsc4xwqp/0YQ70B1USuFnPl
	 fHAzFSLa86fnw0RAYiF+ie/wUchrs0dUJPLbh+AQb3ZJt6xtnHyIAZU41nqo/zaJZR
	 +p6B+0ELwi2xT1Wr6pYg5sBMZN7FK0XJF61c/StbmG3d9Q1I9NRLgc4giQydlvsm3l
	 GXBCrxf08OPvdGXAsA7N654DGURLs04edIf7H943mmvfslekwxFpy0jgEJboMGgr2u
	 cNu3bH1i97gmQ==
Date: Fri, 4 Apr 2025 09:48:31 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 37/49] x86/alternatives: Move text_poke_array completion
 from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to
 smp_text_poke_batch_process()
Message-ID: <Z--Oz3oz6_xcp4M7@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-38-mingo@kernel.org>
 <65e8ed9d-0fff-4f70-b095-8df52493ebec@suse.com>
 <Z-6PWWyopb86UC6y@gmail.com>
 <a64bc000-4226-4d5c-8486-a230f4ff5065@suse.com>
 <Z-6XkEpiXg4stqLY@gmail.com>
 <b0b87bd7-e104-4c9b-b9e2-0682dfef28e9@suse.com>
 <Z-6pQPDuNkshB04F@gmail.com>
 <b7c3882f-9691-47fc-9e50-267fef9cfc06@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7c3882f-9691-47fc-9e50-267fef9cfc06@suse.com>


* Nikolay Borisov <nik.borisov@suse.com> wrote:

> > Yeah, it doesn't change semantics, but it's a very small
> > deoptimization.
> > > Mind sending a patch? It does simplify the facility some more and that
> > single branch will wash away against costs like the CR3 flushes done
> 
> Given that poke_batch_finish does a cond_resched and sync_each_cpu 
> which is an IPI can it even be considered a performance critical path 
> ?

Probably not, but even if it was, I think your change would still be an 
overall win, so please send a changelogged patch against 
WIP.x86/alternatives.

Thanks,

	Ingo
