Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB5E23372D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577673; cv=none; b=rZ5ZCFQI0SLYCMidKMEtn3SY32tZ9ZbquaoIOEa8tSLO8L06g3eMwUcrwUwqA3/gNaOCEge/Pg2HWKrJrIlSOWkO5XBYBtHwODDoBMfZ3K/F/0EnEyW0rL2x4uEyUNqoWfs1XzFHk/dVs6zb3py82KyCHBFp3hpQ5FgCJFkw0DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577673; c=relaxed/simple;
	bh=TJ3PZbqHkQs/4tukT/mVpA5HaQGninFtVcz7pGCCY/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdCrNgUN4rnkxtvKlKoiLvzTNULFFZFM1CDXzP5h1SGw3ikgSjWurLrUECvSvJSqcMYynkPgTWMulTp6DzaXPDmrXbqZjcc8wjknAl7al0mnAC9tHCHa/vTT/SkAhUOW9KhEdT2/j0V4ZmjBfalfue5We6keorbFTH6eYLn+u8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f1MxB4dQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f1MxB4dQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA360C4CEDD;
	Wed,  2 Apr 2025 07:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743577673;
	bh=TJ3PZbqHkQs/4tukT/mVpA5HaQGninFtVcz7pGCCY/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1MxB4dQilCYg/3ooTBqzYah3QEO/MnPyJzRWYWPtDLkxsxV0DGYQnx9h5PL9tET8
	 pK+AXPfBr3YG48cutXO+zIdMX0t99giI6xTvZ00Ao6nxtTow1HR80jSu1bqQeJlJWG
	 W+ng2hTQql5oM7axIAtMJ/FwgbgdWOVSLYEevbZs=
Date: Wed, 2 Apr 2025 08:06:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <siddh.raman.pant@oracle.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] published: CVE-2025-0927: Fix up JSON schema.
Message-ID: <2025040248-hut-sevenfold-82c3@gregkh>
References: <2025033057-CVE-2025-0927-1436@gregkh>
 <80cd3f46783cd5702b3abd40c11f3f08f64717ec.1743576485.git.siddh.raman.pant@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80cd3f46783cd5702b3abd40c11f3f08f64717ec.1743576485.git.siddh.raman.pant@oracle.com>

On Wed, Apr 02, 2025 at 12:21:52PM +0530, Siddh Raman Pant wrote:
> It doesn't match the schema of other CVEs as it was not generated
> by bippy.

It was created by vulnogram for obvious reasons :(

Also, please cc: cve@kernel.org for stuff like this.

> Fixed by hand / manually.
> 
> programFiles were added from the info in mbox.

So this did two different things?  Why does the layout matter here?
Eventually it will be created properly when someone gets the fix
upstream, I'm waiting for Canonical to do it as they are responsible for
fixing this mess at the moment, but don't seem to be responding to my
emails anymore...

thanks,

greg k-h
