Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269B23505E
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 07:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748676329; cv=none; b=sU88H0k8Ljf6YOtg4IogwunnrJlPIBOBgj9TkwEY0+thbcBSrJJP5KecCnyvwm62CgA0/wgTcDxtYuP7x/YjDegypCoFVFJviW2y6FuQQ4cfnwqU/8FF1/9j9SV93nedgp4r+VsznQLcOpAM3X3Z12eGEbIk36mJCtEdBIHLUck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748676329; c=relaxed/simple;
	bh=NagLXxxSyzmFTRRKMhPYoJXTUDNWkfTfgXDNoIv4eeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSYFVG2oXUnM6M/2XvoxvOAGPEc3KQWoRATJM9jjhVL9aDB+hWzn5jvv1Ua86L/3qsRpBBJFl+W3TJOxj9zEUje//2HW+7JYfVbETOGwsqQCcLGUYTjgJh6BCZttNe3qrVB4szdxMG38aUp4YlOuGLOahX+BmtLh1YbpPI5rlUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czlwe8Yt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czlwe8Yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2903DC4CEE3;
	Sat, 31 May 2025 07:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748676329;
	bh=NagLXxxSyzmFTRRKMhPYoJXTUDNWkfTfgXDNoIv4eeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=czlwe8YtSu2aDzsDCw5JszDxe3yxoiianoYYKrbPsDPNJkLszQwXO+1xOCjXzKmqn
	 bxnPyY39tbpMrCcH7TtH/Pz1g5I7EKmwTqnv6lN3rgcYt7vrM2MZufOW7SI/2JM5ig
	 aKSTcmdwlPdkI2NMJZ5si29yleVD0N8on+N356/BZnkiTWs0u3ppSFBFLAix166Bzy
	 gThQ6cP8vTA/0NZx4wJ9+NRRUIUewylFYG8iwFOQedGEKuT7s0X+UJR9OS7tFKld5v
	 l79VsK1TW6nftr8Q/YsPvG/6AFwvrfmyRU4/sRwQInkfNQrJMpzlE/OOxud43t06Jb
	 DMAaaF7SrqSdg==
Date: Sat, 31 May 2025 09:25:24 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/mm: resize user_pcid_flush_mask for PTI /
 broadcast TLB flush combination
Message-ID: <aDqu5Fhbf3mV6Xsj@gmail.com>
References: <20250530174136.61b8086a@fangorn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530174136.61b8086a@fangorn>


* Rik van Riel <riel@surriel.com> wrote:

> [re-sent]
> ---8<---
> From 96958fa1ed02e2434305fc7b0e37374eee899daf Mon Sep 17 00:00:00 2001
> From: Rik van Riel <riel@meta.com>
> Date: Fri, 16 May 2025 08:37:04 -0700
> Subject: [PATCH] x86/mm: resize user_pcid_flush_mask for PTI / broadcast TLB flush combination

1)

Please always check whether the title style you are using matches that 
of the subsystem you are submitting it to. (x86 in this case, and no, 
it doesn't match it)

2)

Also, 'resize' is not the proper verb for a bug fix ...

> - invalidate_user_asid() sets a bit corresponding to the process pcid in user_pcid_flush_mask
> - SWITCH_TO_USER_CR3 tests and clears a bit corresponding to the process PCID in user_pcid_flush_mask

3)

Why are 'pcid' and 'PCID' capitalized differently right next to each 
other? This is completely unnecessary noise that makes a maintainer 
question of how attentively this patch was created.

Thanks,

	Ingo
