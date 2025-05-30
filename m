Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D6F22ACD1;
	Fri, 30 May 2025 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614495; cv=none; b=kXOdeuQ+ZsCEUt4FnWZFPhPbNOqMESFJ1OqS4InO7/O5CLQSzqPGR2fEWG7P/+oPH5AhvsMY2eiizGIXX/pKmdRqcjHzZNAWc9gd8d+9W1052hkQ0l+hXdZxyMM1Z9pmAYQpfRlAxdVm48hVlX2DeqF4ZsyY3HgruKyg0kOCYc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614495; c=relaxed/simple;
	bh=AdjqS8gyUW6qx7Vnep2Hsz4vDFMd56HADhCgHStMpO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ne8L08sLsAAtBvRq5mgI2hT/H8S41FUbJqQpNjhIxk3vnid16CQSxO6R4Fptvrn2fyLnb8+02JMLoNESDeGFTll7JAwHVsX62RJb0M1Slrwz77pldWrA7vPwmSgVvPo5gJ1T5tsH0y6WNBQyvraTvTFR7+HzWbt3GgoAexhy9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hY+yvxxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hY+yvxxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36055C4CEE9;
	Fri, 30 May 2025 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748614494;
	bh=AdjqS8gyUW6qx7Vnep2Hsz4vDFMd56HADhCgHStMpO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hY+yvxxaMD+yZLdvj0WfXN4uryTRJKoZmjmjS3wM5Cfg9ZzSXytABm0bVUXaYsbY9
	 2kKKSs6R8CDRpFUBHZMG8JP13i7tVgcU1MNmFIWxlyIsunOuCZZRMrK/jqsbHyeSV+
	 vVuU9hxMzKEn9eANSkRGKvN6r2OftzjkaUeWGYj0=
Date: Fri, 30 May 2025 16:14:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Giovanni Gherdovich <giovanni.gherdovich@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2025-37832: cpufreq: sun50i: prevent out-of-bounds access
Message-ID: <2025053006-multitask-profanity-3590@gregkh>
References: <2025050824-CVE-2025-37832-e235@gregkh>
 <1db6d340-bfae-4d81-a1d1-dcbd7bc1294f@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db6d340-bfae-4d81-a1d1-dcbd7bc1294f@suse.com>

On Fri, May 30, 2025 at 03:57:35PM +0200, Giovanni Gherdovich wrote:
> On Thu May 8, 2025 08:39, Greg Kroah-Hartman wrote:
> > A KASAN enabled kernel reports an out-of-bounds access when handling the
> > nvmem cell in the sun50i cpufreq driver:
> > [...]
> 
> The invalid data that may be read comes from a ROM in the SoC,
> programmed by the vendor, and is only used to configure CPU frequency
> and voltage in the cpufreq framework.
> 
> Even assuming that improper frequency/voltage settings constitute a
> security risk, writing to the ROM in question is at least a privileged
> operation, and may require physical access to the SoC.

Obviously there are systems out there that have this issue, with device
trees that can trigger this issue, this isn't a matter of "malicious ROM
doing bad things" type of issue, it's a "the DT can't express this
properly, so we might have taken data from the hardware and handled it
in the wrong way" type of issue.

> I don't think this qualifies as vulnerability.

I don't see how this is a ROM configuration issue, but rather just a
kernel bug in how the hardware is accessed on different types of systems
where we previously could not handle such accesses correctly.

thanks,

greg k-h
