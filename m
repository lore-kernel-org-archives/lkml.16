Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC3222560
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 13:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746883251; cv=none; b=Q9Qn76WFfUEuQwQ08EyTmcr7JYhTQdC+U3Xw05QsrUoxbrVat9PWdi4jm0IXniQ9bHyEcbrkd6ud77SUFBLE+QT8lD8Nm55gIhFsSltWKYG6zyw8+WwOFKWRiCoVzsI2mtj8h2HqrSnKBEMlj1M2GpUpYGjShkEnJqvIq6I0D84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746883251; c=relaxed/simple;
	bh=zg2c/eauYOKBKZGy8qJPleAyBUhkehknpaa3LyR7vMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFzWqi+hms/cd9YNLrgIrfu6i2F8ALFEK5oBeNimW18MtVCk3JOO4HMp7aupk0Uf1fNm/+nt/g+iMg7FgI4UCLXn4V6wviFxmGh5nwN8j6bOscgU904XqQ/Y2WPMUwefHrgnubSzwoju7OAOfVYSvs+c5idgNAn7WzvfPl3zwKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o+IMFZ3m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o+IMFZ3m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE88C4CEE2;
	Sat, 10 May 2025 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746883250;
	bh=zg2c/eauYOKBKZGy8qJPleAyBUhkehknpaa3LyR7vMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+IMFZ3m6Vui0XEPWj9OHLDobeC1zzUdKUnMisSIWJl84Thw8o8oMef69zr7cBdI6
	 Q0baCnZmwzxbzLGNEsJrfKMz+ji3F3MnpmX9gFbRVLqQQ88CttVyz3N/+ZqhLePnao
	 M9msog2ngRMCyaqAJVHu7ChvcIkUHuor0BAaZHB4=
Date: Sat, 10 May 2025 15:20:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Documentation of locking needs when working with lists?
Message-ID: <2025051012-karma-setting-af04@gregkh>
References: <4f405d9b-460c-49f7-91b2-d147d9818369@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f405d9b-460c-49f7-91b2-d147d9818369@gmail.com>

On Sat, May 10, 2025 at 10:46:32AM +0200, Heiner Kallweit wrote:
> Even though lists are used everywhere, I was surprised not being able to find
> documentation about which operations need locking, and which ones are safe
> lock-less.
> 
> My case:
> I have a list where the only operation is adding entries.
> It's clear that adding entries has to be serialized.
> Question is whether a list_for_each_entry is safe lock-less.
> 
> Looking at the code I *think* it's safe, under the precondition that
> reading/writing pointers is atomic.
> 
> Any hint or documentation link would be appreciated. Thanks!

You MUST have locking for your list if you have multiple processes
accessing it at the same time.

good luck!

greg k-h
