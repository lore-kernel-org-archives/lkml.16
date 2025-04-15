Received: from animx.eu.org (tn-76-7-174-50.sta.embarqhsd.net [76.7.174.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0A1E552
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=76.7.174.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744677336; cv=none; b=nk929jEaDffW26w2E52n3beHdH7KKlXMVDNwLY+nwLIygQgb5MJE3qy1QI1xGeL/mHDxZAf8nu/BtDRP57La/MjT4GpftuZZf1KW/Ilx9nAFb+erfEbfwu7mPhmLB2q9c/14tO1IJXjoNm2rcQukpTitWUPx2lZfAFnRV7wIQ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744677336; c=relaxed/simple;
	bh=VlDWD+tcU+XzK5CrGv1+CLSKYaFa3UIM7cOylNqx7uk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOpfe55BoPj0WeYiprjNXrEPYA3ZIyH1t1doTDv9q5TplxJHttuaWHSrHB6AMZy8iJ11WAFATf9qJwPgDsgqhS7ED9zEcr6Q1k4Rmqr52xprkyjGpUFfxLkRVtBIsVtjNEk5PsMrcUgpXZvmM7mvYkepgongke9gIQ+vaa7gVe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=animx.eu.org; spf=pass smtp.mailfrom=animx.eu.org; arc=none smtp.client-ip=76.7.174.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=animx.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=animx.eu.org
Received: from wakko by animx.eu.org with local 
	id 1u4UGq-00045q-Tk;
	Mon, 14 Apr 2025 20:35:24 -0400
Date: Mon, 14 Apr 2025 20:35:24 -0400
From: Wakko Warner <wakko@animx.eu.org>
To: linux-kernel@vger.kernel.org, airlied@redhat.com
Subject: Re: MGA G200 issue in 6.12 and up
Message-ID: <Z/2pzDAplsZz8AVd@animx.eu.org>
References: <Z/anHRAx3SQWr+h8@animx.eu.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/anHRAx3SQWr+h8@animx.eu.org>

I found the fix that works for me.  See below.

Wakko Warner wrote:
> I decided to upgrade to 6.14 on a system with a Matrox G200 onboard vga
> (supermicro X9SCL).
> 
> I use this system via the BMC.  When the mgag200 driver loads, the bmc
> screen flashes between no signal and the screen.  The rate seems to be about
> 1 second no signal and 1 second with signal.
> 
> 6.12 and 6.13 both have this problem.
> 
> 6.11 does not have this problem.
> 
> I have a monitor plugged into the vga port and it doesn't have this problem
> on any of the kernels I've tried.  Only the remote connection through the bmc
> has this problem.  I have booted the system with and with out the monitor
> plugged in, it does not appear to make a difference.

I found a thread on arch linux forums
(https://bbs.archlinux.org/viewtopic.php?id=303819) where the op has the
same issue.  He bisected and came up with the bad commit.
That commit is 
d6460bd52c27fde97d6a73e3d9c7a8d747fbaa3e drm/mgag200: Add dedicated variables
for blanking fields

I searched this commit and manually reverted it from my vanilla 6.14 and it
works fine.  No blinking in the BMC remote console and the external VGA
works fine as well.

-- 
 Microsoft has beaten Volkswagen's world record.  Volkswagen only created 22
 million bugs.
