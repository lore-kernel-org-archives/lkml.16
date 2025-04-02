Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55823B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593562; cv=none; b=lj5ejZQaQIfYskKmqQ6z1+0peOIt7w9frlLv5HIrxr6eHaL4cV4p7TZ6xg3TIQ82xpk5/XYrA2ty0tGqnRJbEgt/mjfL/Qw0RCiGNseHlkCmX6rVBDk1HS8ZYuu7PnxiVEPd/G7/JP7WcLDVOwnEHres6fHEvxHoqoWM8GtJuD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593562; c=relaxed/simple;
	bh=gNk/zMMaqpLafbWxUi/179z92vD/Vp4e8IIgTDjRBjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEb4hjMcDJKPii6zaiVmbN2SCG5z8tUaOqdvifnl82+oTP4YUYJwIVkDaHnGZh+I5QZe2VjG79+HVWx+JQrIJF4axalp3DHFbGkav2YmciIlD9u1qLy3JQIlSYeuG36mr8grPsMJYShdQ3szhmSMc+nIpBRpIHMf4XNTwLX+Y3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w81fkxkT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w81fkxkT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975D2C4CEDD;
	Wed,  2 Apr 2025 11:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743593561;
	bh=gNk/zMMaqpLafbWxUi/179z92vD/Vp4e8IIgTDjRBjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w81fkxkTblcTNXlJngwnCkdoDtSDivqZegHb6Y0PtWz2D9uG1Vkv5B2iaWrpLHzT6
	 lxaSxEy3NNbzi6QvOJc+CnEMnPHAtzAAKRRTJsBUR9vJFnNtZLX1fkp/YmTLxfjwLj
	 dw8yi8nj2kHF9fCgQaGnAOigZRDBIUGYlM33rdbo=
Date: Wed, 2 Apr 2025 12:31:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
Message-ID: <2025040230-showoff-spray-ac83@gregkh>
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <2025040143-espionage-poison-2345@gregkh>
 <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a3a851-f737-4772-87c6-98613347435c@linaro.org>

On Wed, Apr 02, 2025 at 09:19:17AM +0100, Srinivas Kandagatla wrote:
> HI Greg,
> 
> On 01/04/2025 20:18, Greg KH wrote:
> > On Sun, Mar 09, 2025 at 02:56:50PM +0000, srinivas.kandagatla@linaro.org wrote:
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > 
> > > Hi Greg,
> > > 
> > > Here are few nvmem patches for 6.15, Could you queue
> > > these for 6.15.
> > > 
> > > patche include
> > > 	- updates to bindings to include MSM8960, X1E80100, MS8937,
> > > 	  IPQ5018
> > > 	- add support to bit offsets for register strides exceeding
> > > 	  single byte
> > > 	- add rockchip-otp variants.
> > > 	- Few enhancements in qfprom and rochchip nvmem providers.
> > 
> > Ok, I wanted to apply these, and tried to, but they fail horribly
> > because:
> > 
> > Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned reads")
> > 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
> > 	Has these problem(s):
> > 		- Target SHA1 does not exist
> > Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit reading is required")
> > 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
> > 	Has these problem(s):
> > 		- Target SHA1 does not exist
> > Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than one byte")
> > 	Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's raw_len")
> > 	Has these problem(s):
> > 		- Target SHA1 does not exist
> 
> Looks some of your scripts or b4 is picking up older version v1 of the
> patchset
> 
> None of the above patches have Fixes tags in the V2 patches that I shared
> aswell as patches in linux-next.

Yes, that looks odd, it looks like b4 pulled in the wrong series, yes.

But, that's even worse.  Those "fixes" are now not actually marked as
fixes of the previous patch.  So that information is totally lost, and
again, the first commit here, "nvmem: core: verify cell's raw_len" is
broken so much that it took 3 other changes to fix it, which implies
that bisection would cause problems if you hit it in the middle here.

While fixing patches is great, and something we do in the tree all the
time, let's not purposefully break things and then fix them up in the
same exact patch series please.  That's just sloppy engineering.

Please redo this series completely.  I can take the "new device support"
patches at any time, and really, those should be marked with Cc: stable
to get backported, right?  The other ones are written as if they are
fixes, so again, I can take them any time, no need to wait for the -rc1
merge cycle.

thanks,

greg k-h
