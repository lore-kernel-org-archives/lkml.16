Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC621E5B68
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745233; cv=none; b=PNDAmf13HOpUU96xIrItV4P6AGMTEJaG+H/kthqUIfp1dTrSySiPS3VxXilxdU+EHoiyLPexJZZ6yGhw8VgILKQlBE4qU4L5D91ng8reLZE8k2B4IVEpLu8YuB1a9oj56BYwWd2HroHcJ69Q982HGLC/FuM1yw9G9w2Sl5FicjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745233; c=relaxed/simple;
	bh=X+UdTHXDFMte+vwvhwJwB2Z7tZ1dV9rcTCoM9SVT0hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHd4g1zBsmNCiWBG1rGQb6SKJZ34EVdQXUSz0ukw3iRH+3VXab3llZG4ukyAEBwwWJV7hbamfyummYvNjWK3LjH9yatyxXPvrIEf0MOg+PK4o46UIQc3kdUIsBpRXDDsnMuz+qqbVqkykVlmO6j+Jsw3/GOdSo7K/2/1uMAyh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPyJ2dWs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPyJ2dWs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B66C4CEEE;
	Thu, 12 Jun 2025 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749745233;
	bh=X+UdTHXDFMte+vwvhwJwB2Z7tZ1dV9rcTCoM9SVT0hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPyJ2dWsJbyzqBHD0PMyl8dK0RPs99sGSg01vkmm8hOgV86bNu+pxGug0oIm/y81b
	 jOGoS8UxKiTofeJqilG6Z7djN3h1/Ly3QvOEBlE7VbcP30TF31xEakvNu3FlvgKhlk
	 hHcOIs0/WnVPw+shOtZsK23BdENywcy3flnjnJ67xsr/eKIGYZ53F2Gm7lwV0bXzIe
	 NXPaT6szRw06eFc982fGx7qpmGYpicxKDbE+CSQo7a21SXHThms78ptWkh2iit4Wgf
	 NfXudkexdO2dQtpCvDDuW41+cG9sIrY6UAuzq3vkOD+NndlGjT2hNwRvHScZm/k13l
	 00aPjaTYzYQtw==
Date: Thu, 12 Jun 2025 17:20:28 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <20250612162027.GA13202@willie-the-truck>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
 <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
 <aErokN0vKT3urlmA@arm.com>
 <93a0f043-d5f6-432f-ac37-266dd5bbe899@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93a0f043-d5f6-432f-ac37-266dd5bbe899@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Jun 12, 2025 at 03:51:19PM +0100, Mark Brown wrote:
> On Thu, Jun 12, 2025 at 03:47:44PM +0100, Catalin Marinas wrote:
> > On Thu, Jun 12, 2025 at 12:40:42PM +0100, Mark Brown wrote:
> > > On Wed, Jun 11, 2025 at 06:34:15PM +0100, Catalin Marinas wrote:
> 
> > > > Another caller of gcs_free() is deactivate_mm(). It's not clear to me
> > > > when we need to free the shadow stack on this path. On the exit_mm()
> > > > path for example we have mmput() -> exit_mmap() that takes care of
> > > > unmapping everything. Similarly on the exec_mmap() path.
> 
> > > We need that one to clean up the GCS for threads that had it allocated
> > > for compatibility, you can see the leak that results without it easily
> > > with the glibc testsuite (or anything else that does threads, the glibc
> > > tests just spot it).  Most of the checking for arch_release_task_struct()
> > > is verifying that deactivate_mm() is guaranteed to be called eveywhere
> > > it's relevant, I need to page that back in.
> 
> > Makes sense. I think we should only keep gcs_free() in one place,
> > ideally deactivate_mm() as that's more related to mm rather than the
> > task_struct.
> 
> Yes, me too - I just need to double check.

Having looking a little at the code, I think that
arch_release_task_struct() might be better than deactivate_mm(). The
latter takes an 'mm' parameter which we ignore but I think happens to
be 'current->mm'and so things work. Given that, and that we don't do any
GCS management on the activate_mm() path, freeing the GCS in the
task-centric functions makes more sense to me.

Will
