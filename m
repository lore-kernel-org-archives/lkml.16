Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1271E26E176;
	Wed, 21 May 2025 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832074; cv=none; b=YZ6AegJUKKhg+PZ5G9zterLPDKaw9+HYHAekEo7oSU6Mj4C1oclvlYE9JZds2PiPK5TriKQ5PrNT0I9oKcN/fcYQEMw7344jrYfjohTFGqV2husmjitM5ViCBg6IfvqRl3xkv1wOPKSwdkkXjObzDDuhXm0ivo5DrISC5gn3vrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832074; c=relaxed/simple;
	bh=VMYoNOJ5wE9KwUkDnF09JicN3hKPriwy1qJHDvdDpM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eep9uhUoqtr7nTEGgLhJbCmteqqYukBuaN/h/fhvUjd9eZcFZFcs1TWD4vhLDwAO4XSokzL1V6hwS92DW2/ecce8Ctm6prqIFTO7oLsbGg4DXLOWVYEuR/0Y+u/3Nlvtb/LlDjSixbJuCSr+vqxpDEQ7BzUJBhv6VHSSM1HaD6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gvp/ed8X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gvp/ed8X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D2AC4CEE4;
	Wed, 21 May 2025 12:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747832073;
	bh=VMYoNOJ5wE9KwUkDnF09JicN3hKPriwy1qJHDvdDpM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gvp/ed8XwFy7sJSkMi+wEhLq2DrCdOEOZN1MX+cDd/vNe7AM6jKoFcB8WHBTJtPeN
	 9mY3wzgC/Oc3LfowIQinrhDL6vabZVT4DQ47R0nXoeZcJ7mZ8i68f7WUmr3+mO7Umc
	 GB/DTmAwF3mOWOpNgh+7YSV1JvWG/carnKG4dHE0=
Date: Wed, 21 May 2025 14:54:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-spdx@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] LICENSES: add CC0-1.0 license text
Message-ID: <2025052118-handbook-dowry-bae9@gregkh>
References: <20250513115912.303082-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513115912.303082-1-lukas.bulwahn@redhat.com>

On Tue, May 13, 2025 at 01:59:12PM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit cbbd847d107f ("tools/x86/kcpuid: Introduce a complete cpuid
> bitfields CSV file") turns the tools/arch/x86/kcpuid/cpuid.csv to be an
> auto-generated file from an input file maintained at x86-cpuid.org project.
> The x86-cpuid.org project clearly states that the auto-generated file is to
> be licensed with CC0-1.0 (see Link below). So, the SPDX-License-Identifier
> CC0-1.0 in the file is correct as intended.
> 
> The spdxcheck.py script reports that tools/arch/x86/kcpuid/cpuid.csv uses
> an Invalid License ID: CC0-1.0, though, as the LICENSES directory in the
> kernel tree does not contain a file with license information for CC0-1.0.
> 
> Add a suitable CC0-1.0 file with the license text into LICENSES/deprecated
> to make spdxcheck.py happy.
> 
> The directory deprecated is the best fit, by exclusion of the
> alternatives. CC0-1.0 should not be considered among the preferred licenses
> in the kernel, nor is it a license exception case or intended for
> dual-licensing some copyrighted material. So, deprecated is the best fit
> here, even if the license and its use is fine and it does not suggest to
> actually deprecate use of this license.
> 
> The license text for the CC0-1.0 file was obtained from the spdx
> license-list-data git repository (see Link below).
> 
> Link: https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v2.4/LICENSE.rst
> Link: https://github.com/spdx/license-list-data/blob/main/text/CC0-1.0.txt
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  LICENSES/deprecated/CC0-1.0 | 129 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 129 insertions(+)

Thanks for this, I'll add it to the spdx tree now.

greg k-h
