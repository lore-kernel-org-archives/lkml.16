Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B081E5B95
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626899; cv=none; b=ptHk2mBY/xVz6ryUKA+nyuKTifgwoRappFN++YKNmMcaCl7xmpwINwd1yFxTwmDvhHHrppYlMf+BUmdsc6fY9pTMMG8Vp53wuiAmUP4e5klgqL4nGn0msvIChcCzvuIYay10dqIEgnzj6CJ7nD1Fh4hQq7kdNI6cCHjJBLvJkPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626899; c=relaxed/simple;
	bh=qzAQauYWJ+FXL40JcZ/Z6eQMc7gZB5kWPF2Oz10v3hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tADk+0OlGKIE9dc8uCLxeZQHfkaH1k2it7kOTMvra5+i78CdtkCMaxNBTxMVaXX0L6dA+o4AFo3jjVFYJD922ewsa/AQILyxHn/QI/zcKLD5MJDD1mnPX4LcWV2NHFC72GMU07napyCHElW/2EKeejXxBFvuIfv6h4Lnbh5zUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MH4nKd43; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MH4nKd43"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E80C4CEE5;
	Wed,  2 Apr 2025 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743626896;
	bh=qzAQauYWJ+FXL40JcZ/Z6eQMc7gZB5kWPF2Oz10v3hI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MH4nKd43ulKJaCUcVAyaBJpS1L37zBpFVAhlPVXAk45gYjHpu3hUl9Mm+qybb9R9U
	 RRgU9N+jo+uc8yrPze3DbKehQZR+hx3dKyjUJ8ReO58IQXf/ZF7uIuxzHdhNd7nfTk
	 S8JYq7P1y2htWJ86dqTWaHiQmqP/ey84/6zm1lGbxvwXRET7Jlc14YJHY/+V8ewifV
	 jBoozUaP1wZGcee0ZlKETDwF9z1en+OVN2IUe6X0m9m4RnbSXtRu29GR8J1jlwzlMC
	 B4buuXRazQi8vb2FsOlCsitkqZlXSQq+clTErAp3HSR//3Kn7IU6skbrQet2v9suIM
	 nIfJHIPrh5TxA==
Date: Wed, 2 Apr 2025 22:48:11 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 1/4] x86/idle: Fix argument type for MONITOR{,X} and
 MWAIT{,X} instructions
Message-ID: <Z-2ii-KgGSsMMTvB@gmail.com>
References: <20250402180827.3762-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402180827.3762-1-ubizjak@gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> MONITOR and MONITORX expect 32-bit unsigned integer argument in %ecx
> and %edx registers. MWAIT and MWAITX expect 32-bit usigned int
> argument in %eax and %ecx registers.

Please always include a 0/4 cover letter as well for such series, which 
gives people a chance to reply to the whole series, instead of having 
to awkwardly pick a patch to reply to. :-)

Such as this general feedback:

I've applied this series with edits to the changelogs, note in 
particular:

 patch #1:

 - Changed verbiage from 'fix' to 'standardize to u32'. There was no 
   bug to fix, using 'long' instead of 'int' is at worst an ineffiency.

 patch #3:

 - Provided much needed historic context behind ;, \t, \n beautifiers 
   used in asm() statements. These aren't just random noise added in.

 patch #4:

 - Added in the current binutils version cutoff, to make it really 
   clear why we cannot use the mnemonic yet, and how far away we are 
   from doing so.

I've also extended the Cc: list in the commit to give people a chance 
to object, to patch #3 in particular:

  8ad521aaf743 ("x86/idle: Remove .s output beautifying delimiters from simpler asm() templates")

Thanks,

	Ingo
