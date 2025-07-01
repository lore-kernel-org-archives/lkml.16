Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BC826AAA7;
	Tue,  1 Jul 2025 08:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357785; cv=none; b=maMOWOZpJUM70DuHsJzEzxxpiJgVdoQOWNfO8TSM2CmQS1sZFMc4TVe8VczPRQX+v6kwRD5CbCAehtruT1lmslA/s/A9vgQB66XPN68v812+cwHJSU3FVLZ1zcsCTaWxvVPG9gYhgVQM2Qedlp5J1PCRv75oocAF26Mz6sbdZJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357785; c=relaxed/simple;
	bh=yqRhPYUfqvfd5430wEfH350b2uQ3CQ1Qmr1zftDuApU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmaXtC5Q4u5QYgy9erb1IzuX18RVoqO3Og3ppxbwZkI3cK0D8blhCUQ2aBx1EqXRNBZY0gUwHwiMSTjxrE5AvK062MWL/ypUb+nqh7i6SKpFPLM3tN9sTuDjPI4RZGBuBAISeyv0y3pJQ3JlAcZRZtSQu/2HmvQVU5VvZM1WoSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M4J+j0Nr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M4J+j0Nr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB510C4CEEE;
	Tue,  1 Jul 2025 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751357785;
	bh=yqRhPYUfqvfd5430wEfH350b2uQ3CQ1Qmr1zftDuApU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M4J+j0NrqpKdl/nrKXBtP7KjJdeLGs5N2Qnf189uh+KV6vNK81l2DH6rvNF2Zegtw
	 9SxU9BBPmmqDn/oFr//QPbMJb9U5lzyRrUjleK45XOPrRhXu+AK0P2itv50NexEq7h
	 k71v9Xncgefq91L1jewN0faLZhrUX8DJsLADb4hM=
Date: Tue, 1 Jul 2025 10:16:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcos Garcia <magazo2005@gmail.com>
Cc: philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org,
	karanja99erick@gmail.com, rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH staging] staging: rtl8723bs: replace magic numbers in
 rtl8723b_InitBeaconParameters()
Message-ID: <2025070110-unroll-hurried-ac37@gregkh>
References: <20250701074243.1300186-1-magazo2005@gmail.com>
 <2025070117-poise-busily-bd0d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025070117-poise-busily-bd0d@gregkh>

On Tue, Jul 01, 2025 at 10:02:54AM +0200, Greg KH wrote:
> On Tue, Jul 01, 2025 at 09:40:49AM +0200, Marcos Garcia wrote:
> > 
> > 
> > Replace hardcoded values in rtl8723b_InitBeaconParameters() with defined constants
> > TBTT_PROHIBIT_VENDOR_DEFAULT (0x6404) and BCNTCFG_AIFS_MAX (0x660F) for clarity and
> > maintainability, addressing the TODO comment in the code.
> > 
> > The values were sourced from the following documentation:
> > - REG_TBTT_PROHIBIT (Offset 0x0540): Bits [15:8] = 0x64 (100ms prohibit time, 1ms units),
> >   Bits [7:0] = 0x04 (2ms margin, 0.5ms units), as per RTL8723BS Datasheet v1.5,
> >   Section 7.3.1.5 and RTL8723BS Programming Guide, p. 112.
> > - REG_BCNTCFG (Offset 0x0510): 0x660F sets max AIFS (0x0F) to prioritize beacon
> >   transmission, as per RTL8723BS Datasheet v1.5, Section 7.3.1.3.
> > 
> > Hi Dan,
> > 
> > Thank you for your detailed feedback — I truly appreciate it. I tried to contact you
> > earlier, but it seems my email didn't reach you. This is my first kernel contribution,
> > and I started by addressing TODO comments, thinking they were straightforward. I now
> > realize even these changes require deep hardware understanding. I used AI to assist with
> > parts of the commit message, but I didn't review it thoroughly enough, and I take full
> > responsibility for the vague comments. I could only find limited references to these
> > values, and the documentation seems restricted. I apologize for any oversight and
> > promise to research more carefully in the future. Thank you for your guidance.
> 
> None of this needs to be in the changelog text, please read the
> documentation for how to properly submit patches, especially second
> version of patches.

Make that the third version of this patch.
