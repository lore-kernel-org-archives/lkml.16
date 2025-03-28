Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BC1214200;
	Fri, 28 Mar 2025 11:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161197; cv=none; b=bXr8x5fgcLjFWTgxmAjJTmC3zSPDIXG5pD/ysE5PIO41X8ZDkGJZ+m6STRucJlooWQqlMnE0zhQ7+ioR4wEPIo9Jlp5e5xSeSSC7et9vCRNBKszNVJ9S0HE1rt98y2o59UYRyOE6+rX4bkNq9zNXSYtwBdip5sUefVJZlmn+iGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161197; c=relaxed/simple;
	bh=i3hZPvdfk5t2gyh3A+ixkJXXG+ItAZRyeyAI7G4hmpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttoT1CwFRVq1u7mdEUWSyhrgo8axlsc3c1TIlMswkVOnbaZhJRhxNNLCqwLoR6+AhDoCz4f1fooZJ/kV2CnUDlP7/9HKgiQdJdaFMcMcwTOwWR+oNExqWq9do/+UzJOcejsSyJmzpEi2nTfDCJVB/vhNQURxnTE3tb9pLbmFOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=riB4glJe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="riB4glJe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D7CC4CEE4;
	Fri, 28 Mar 2025 11:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743161196;
	bh=i3hZPvdfk5t2gyh3A+ixkJXXG+ItAZRyeyAI7G4hmpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riB4glJen51I9dFLSh6trQc1IcmpyRCi3lPv0HOFOzlmwOk6fJgdD/Yl11QQV5jDu
	 aoPkn5cPZzQtNx4aQJgYeH9VJ9uPo73NXCAyROL8nWYPZizZcebNKP4cMZEDD09sMs
	 l+RdprUbYHbeHjDJWs0zoy73rp2rh+duBqJIG6NM=
Date: Fri, 28 Mar 2025 12:26:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: madhu.m@intel.com
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	pooja.katiyar@intel.com, dmitry.baryshkov@linaro.org,
	diogo.ivo@tecnico.ulisboa.pt, lk@c--e.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Add the UCSI commands in debugfs
Message-ID: <2025032811-speech-absolve-a114@gregkh>
References: <20250328113227.554096-1-madhu.m@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328113227.554096-1-madhu.m@intel.com>

On Fri, Mar 28, 2025 at 05:02:27PM +0530, madhu.m@intel.com wrote:
> From: Madhu M <madhu.m@intel.com>
> 
> Added the UCSI commands UCSI_GET_CAM_SUPPORTED, UCSI_GET_PD_MESSAGE,
> UCSI_GET_ATTENTION_VDO and UCSI_SET_USB support in debugfs to enhance
> PD/TypeC debugging capability.
> 
> Signed-off-by: Madhu M <madhu.m@intel.com>
> ---
> Changes in v1:
> - Removed UCSI_READ_POWER_LEVEL and UCSI_SET_PDOS commands.
> - Modified commit messages.

This is really v3, right?

Please fix up and also, what happened to the reviewed-by?
