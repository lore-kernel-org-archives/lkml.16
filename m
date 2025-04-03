Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192324EAAD;
	Thu,  3 Apr 2025 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689426; cv=none; b=b4txsgPzbuYcII8g6LUZKSI4Nd7G+Ex3y68MFcOAXnJTu/cGCR7HmMCMej93tv2PFeYhGKXCBQgtD2CG+TVR8czuy/FApCxBtUYBFzv9EHBG4m2gp4qWiews3bQZ3VN6NY6GeIJnmpab0sY+mYp4E5OjkV6cCBgmBykCmVFSs4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689426; c=relaxed/simple;
	bh=bHy0xklU554dgJqziTz806cEY0BohuzvSLRt7NdYhqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pw6k4mN83Dc0wS/Q3wP5o062vMsvfbru/IYr+7W1C8JpIu07xccpAcV3BMiuAOULOTnUnZZbAwu6tCaFcKN5NFaaU1n/BFCdfK4nZdshE09d+z1PjoZ+sQnIJqPBtGgTPRXCjf9BWnxakA+bQtNeUkLVaxEly2PdeApXU3MrQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sakD1vnp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sakD1vnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EBCC4CEE3;
	Thu,  3 Apr 2025 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743689425;
	bh=bHy0xklU554dgJqziTz806cEY0BohuzvSLRt7NdYhqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sakD1vnpN0uH4i2bpZOFHQOOWUXvceOAnp+IeML1tJ/vzxyWcQWShGBwWy/ee1Uyx
	 mXT6fUKSF0Ob7yOMriNrUntNSqliFg7FZHtrtUCh9XtM+1fvTJ8pjqrNMyCObMvOVX
	 41DeAHIy16s46w7CFz6EsSKX/OWoD3NH1TIEgeJE=
Date: Thu, 3 Apr 2025 15:08:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: sunliming@linux.dev
Cc: dpenkler@gmail.com, arnd@arndb.de, dan.carpenter@linaro.org,
	everestkc@everestkc.com.np, niharchaithanya@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] staging: gpib: warning: variable 'nec_priv' set but not
 used warning
Message-ID: <2025040310-poncho-armband-782a@gregkh>
References: <20250321010649.10918-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321010649.10918-1-sunliming@linux.dev>

On Fri, Mar 21, 2025 at 09:06:49AM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below kernel warning:
> drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not
> used [-Wunused-but-set-variable]
> 
> Reported-by: kernel test robot <lkp@intel.com>

Please link to where this was reported.  The report from the robot will
have the needed information in it on how to do this.

> Signed-off-by: sunliming <sunliming@kylinos.cn>

As per our documentation, please use your name, not your email alias, on
the signed-off-by line.

thanks,

gregk -h
