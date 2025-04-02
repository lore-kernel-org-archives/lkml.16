Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D436AA7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624259; cv=none; b=LdaMxbymI8UDszCEAz4PQzrEPdR+2kRvF+RUc++KNlMkCb4RBv6dE2+qBqV/sTb5B+hi00k2517q/w6LHDaB6Jy28a66OJlcOLVhpSE+icGhnUqBD/+ZXY74KwUHohzC0tBcQMetXF2s9OAylj3zPCNM2UewX2XzoqlVSlhOKSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624259; c=relaxed/simple;
	bh=00pYHGFmVSNMbQwmkn5ktOrYN+xa/IsJzxpzUsONr4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9YgVC89bkTsM0BpiqoswiHMF+diuo5UAAMvO5Kv2njcy3girsme9HVzRXQVwhRQNrgbZ9L9ftk6/iHX63CzCe0NetwnNL068VfIXo2pQ4iMVNifBb0sFAHtBWcoBAWUK5MFiGYX0zeDBiuqjFHuWozJFePzqVLjw+MWmv2rdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9lDs3Ww; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9lDs3Ww"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6123FC4CEDD;
	Wed,  2 Apr 2025 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743624255;
	bh=00pYHGFmVSNMbQwmkn5ktOrYN+xa/IsJzxpzUsONr4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9lDs3WwmLRhKgdFeA4WDH48rDBdSq6f/xnhGyyARXzFhM3VBfS6uUlq2slKa0jsD
	 3ar99iBQCRPcp5vM0BXIVwwq5EVdJsAx7/1zXaAxkdtsqnUb8cZRD79Z5jetXnVfd8
	 VXh/lpGuHk7P1YmXX1PxSdMXILtI7o3KygLr5Ad4hCP8TKysa2/qPV/gmfbj58CqyX
	 hxGWByI8R4/AvGnDBr5gSF2uVOyldEuEx9kwHT6Or4xprH4bxuAe33lJUKKirArep4
	 jT2NtVz9LqJNBM6KX+vyFhBlpvp9pyZfmi0zpsg48sdpZ4/ZL4eXq5rwaXhe5RYInU
	 +GRCp+TuOuMQQ==
Date: Wed, 2 Apr 2025 22:04:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2] x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR
Message-ID: <Z-2YOvIVDfttHFdq@gmail.com>
References: <20250402172458.1378112-1-andrew.cooper3@citrix.com>
 <67274a07-eac9-4d60-9737-c730c25a9fea@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67274a07-eac9-4d60-9737-c730c25a9fea@intel.com>


* Dave Hansen <dave.hansen@intel.com> wrote:

> On 4/2/25 10:24, Andrew Cooper wrote:
> ...
> > i.e. The SDM was incorrect at the time, and barriers should not have been
> > inserted.  Double checking the original AAI65 errata (not available from
> > intel.com any more) shows no mention of barriers either.
> > 
> > Note: If this were a general codepath, the MFENCEs would be needed, because
> >       AMD CPUs of the same vintage do sport otherwise-unordered CLFLUSHs.
> > 
> > Furthermore, use a plain alternative, rather than static_cpu_has_bug() and/or
> > no optimisation.  The workaround is a single instruction.
> 
> Nit: this never comes out and says that it removes the unnecessary
> barriers. But we can fix that up when we apply this by adding:
> 
> 	Remove the unnecessary barriers. Furthermore, use a plain
> 	alternative, rather than static_cpu_has_bug() and/or
> 	no optimisation.  The workaround is a single instruction.

So the title says it already:

  x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR

But I've added in your sentence as well, because there's no such thing 
as too much clarity in a changelog. :-)

> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

Thanks!

	Ingo
