Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9458E1D5CC6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749021642; cv=none; b=GDpPHxEaSYkdrgBcV2iALCAvLMRPvYRgb8l04hxXvYcZ+4ix1pLwCr8CM5Q70L2dtpmMGLSlJkNhohQzGuUSYXs+q+s0/yDdo5goUKTxPsBUV6G9F/AN4d+mOjBGiRKBP2TyIehmhNOOOwzGgJ1mj+wghoS7svHtOFLmf36CvLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749021642; c=relaxed/simple;
	bh=eK/qXYfmkdDNTNZwS8NNcgrnII8nMrAYWOrGVUmiggk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGvrdJ2TKC0NMWbOPFqZN1Hnhkj62t3f9L+UcVQUId5mk8BmT0eCy9/zi1Q6I5AgbdOKwCVr2Rcs6xkGwpv76eJA1fgH2zsd0HbmW4Nx8V8e6DW98D96sqPqIC5urt0TfIj76gx9tJvh4YvAe3On5jNIHfSGNpeG83mjlxMolmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFEBF1758;
	Wed,  4 Jun 2025 00:20:17 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEEAD3F5A1;
	Wed,  4 Jun 2025 00:20:33 -0700 (PDT)
Date: Wed, 4 Jun 2025 08:20:27 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Luka <luka.2016.cs@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] WARNING in do_sve_acc in Linux kernel v6.6
Message-ID: <aD_zu4GNfOKxXXQk@J2N7QTR9R3>
References: <CALm_T+0k9oZ-AN+4jk=07DPfLpWM7jZQK9s4KWi5kMiEjOi1Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALm_T+0k9oZ-AN+4jk=07DPfLpWM7jZQK9s4KWi5kMiEjOi1Aw@mail.gmail.com>

On Wed, Jun 04, 2025 at 12:57:30PM +0800, Luka wrote:
> Dear Kernel Maintainers,
> 
> I am writing to report a potential vulnerability identified in the
> upstream Linux Kernel version v6.6, corresponding to the following
> commit in the mainline repository:
> 
> Git Commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa (tag: v6.6)

For clarity, that's literally the v6.6 tag from 2023, not a recent
stable v6.6.y tag.

That also doesn't match the commit ID in the bug report linked below,
where the kernel reports itself as:

   6.6.30-android15-8-4k #1 dc911bbdaa9a863c41e12d277ee63ecb446e0526

... which implies that the kernel you're using is derived from the
v6.6.30 stable tag, i.e. commit:

  5697d159afef8c475f13a0b7b85f09bd4578106c (tag v6.6.30)

... in the upstream stable tree.

> This issue was discovered during the testing of the Android 15 AOSP
> kernel, which is based on Linux kernel version 6.6, specifically from
> the AOSP kernel branch:
> 
> AOSP kernel branch: android15-6.6
> Manifest path: kernel/common.git
> Source URL:  https://android.googlesource.com/kernel/common/+/refs/heads/android15-6.6

The commit ID reported by the kernel in the linked bug report, i.e:

  dc911bbdaa9a863c41e12d277ee63ecb446e0526

... does not match anything in this tree, and the latest commits in that
branch are based on v6.6.87.

Is that a kernel you've built yourself, or something shipped by the
hardware vendor?

I suspect that this is whatever the vendor shipped, and you've guessed
as to what exactly it's built from?

> Although this kernel branch is used in Android 15 development, its
> base is aligned with the upstream Linux v6.6 release. I observed this
> issue while conducting stability and fuzzing tests on the Android 15
> platform and identified that the root cause lies in the upstream
> codebase.
> 
> 
> Bug Location:  do_sve_acc+0x17c/0x3f4 arch/arm64/kernel/fpsimd.c:1479

Looking at this and the report, I believe that you're running an old
kernel, and hitting an issue which has already has a fix upstream, where
that fix has already been backported to stable trees and the
android15-6.6 branch.

Specifically, I believe you're hitting the issue fixed by upstream
commit:

  751ecf6afd65 ("arm64/sve: Discard stale CPU state when handling SVE traps")

... which was backported to the v6.6.y stable branch as commit:

  51d11ea0250d ("arm64/sve: Discard stale CPU state when handling SVE traps")

... landing in v6.6.61:

  f1ab3a1bcbbc (tag v6.6.61)

... which was merged into the android15-6.6 branch in commit:

  cf775c9332b1 ("Merge 6.6.61 into android15-6.6-lts")

... back in November 2024.

Mark.
 
> Bug Report: https://hastebin.com/share/calarosado.css
> 
> Entire Log: https://hastebin.com/share/efepocaxoh.perl
> 
> 
> Thank you very much for your time and attention. I sincerely apologize
> that I am currently unable to provide a reproducer for this issue.
> However, I am actively working on reproducing the problem, and I will
> make sure to share any findings or reproducing steps with you as soon
> as they are available.
> 
> I greatly appreciate your efforts in maintaining the Linux kernel and
> your attention to this matter.
> 
> Best regards,
> Luka
> 
