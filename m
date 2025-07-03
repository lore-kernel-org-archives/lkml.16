Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8F642A9B;
	Thu,  3 Jul 2025 05:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751519569; cv=none; b=eVmPXncZqv4wZrr1csGLO5WU3bOITSBHJpDN0Azw7lE8nOjVAsuUlIkzW9HYyATWypZ6JuSMm4j9qbECLstIqGYC5L83ETO6Pga0Ud3AHEsHmCChjouuQqiMO6Y2h1RDcCEmYkcu2+EGKQ7XDHGzo7Nog6ThDSNqVw+uhKVudkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751519569; c=relaxed/simple;
	bh=epTle2PLW1MUiC4DheH+8FMv1r4ac4VowVWJiJ0cR/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMidYRuh2f769zoQSTU3/hmVRndypGa9XUx9/LkHUHugWesi1gvRcG9Ehot4zXkeQBFYXEcsMyAtJujXqCP3d8fuUOO2N1oscXrc0/cRnsb/biNpKO+PKLf9uiLkCkt2YlQX9jPHxOd90D5OwrO1W/0rbnEw5Iq3BxeF8jDBNew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N1WRQ4wh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N1WRQ4wh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE770C4CEE3;
	Thu,  3 Jul 2025 05:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751519569;
	bh=epTle2PLW1MUiC4DheH+8FMv1r4ac4VowVWJiJ0cR/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1WRQ4whuGVKlSUwUOaYK5rGnzPhZex0uVSdqQTQ4QdGKQ3utEO5eGyPGu+a7u95t
	 Sp+qJwr8eKltnTBcoohwXpNGP7PK0CJuDeCDLvAUEojxuH/iy+AhzS0aYK9HMrSsb9
	 nuGEh69s4zuMBMwCG9k2OTHIOw1zHQmONzDaUCxQ=
Date: Thu, 3 Jul 2025 07:12:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: manas18244@iiitd.ac.in
Cc: Pete Zaitcev <zaitcev@redhat.com>, Paolo Abeni <paolo.abeni@email.it>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@suse.de>,
	syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbmon: Fix out-of-bounds read in mon_copy_to_buff
Message-ID: <2025070322-overstay-compacter-3544@gregkh>
References: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>

On Thu, Jul 03, 2025 at 02:57:40AM +0530, Manas Gupta via B4 Relay wrote:
> From: Manas Gupta <manas18244@iiitd.ac.in>
> 
> memcpy tries to copy buffer 'from' when it is empty. This leads to
> out-of-bounds crash.

What exactly is the "crash" that you are seeing?  What is reporting it,
and how?

thanks,

greg k-h
