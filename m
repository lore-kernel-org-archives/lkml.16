Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6B1A47
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751346799; cv=none; b=CwSFJz/UuIBT3dFAh5vg1ljqgcjs5C2CDlc/15noNAsn1WBr5x15tU0djpBGr1RRQLT4txuj5LAaP2xLE7H6r7FyPkg7WSWfYUARYWJrVKUPVpNWOpOKU9m7z/qV6qWJwPC2xNfC1/Hsq6+dVE87ByPb6zweDEl6fVzeHfZJB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751346799; c=relaxed/simple;
	bh=eXNDFfUuBkwwRSnHGZI7BsUlAU1O+J7pvgW5Cw7qLm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4EyRLZCl18UR0CRKQ5QlThvn8nQshSBwXD7D8QDn5O2ftnZe0WVw3uKSHBBxMvEx5sBXDDYzff5x0kq4WA50ji8wkOMIiOsDltW9vZU6U9ukBGsitWOAHTRuy4uV2QeTaIKndhszyeqkUluka2yEJd6z8Z6FaDrgslYM2NfkQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2qv4YvfF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2qv4YvfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26827C4CEEB;
	Tue,  1 Jul 2025 05:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751346798;
	bh=eXNDFfUuBkwwRSnHGZI7BsUlAU1O+J7pvgW5Cw7qLm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2qv4YvfFLqX2nE1XhY6Cuxd+evtqOrA9gbOCLUBXDlRQtVYixlee447x4Wd9vpnA1
	 SLY5VormcqPZ86PpH63Mqt2kItTUyzBbutYaOaIyJnWj/orUCOdUQC8Q/mt8y3hJ/4
	 jWul/7R1xUR+yrVjUqWHT8fD5yhs3qapKHfNPuaA=
Date: Tue, 1 Jul 2025 07:13:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brahmajit Das <listout@listout.xyz>
Cc: linux-kernel@vger.kernel.org, alexander.usyskin@intel.com,
	tomas.winkler@intel.com
Subject: Re: [RFC PATCH] samples: mei: Fix building on musl libc
Message-ID: <2025070153-deputy-these-7ca3@gregkh>
References: <20250630204430.10968-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630204430.10968-1-listout@listout.xyz>

On Tue, Jul 01, 2025 at 02:14:30AM +0530, Brahmajit Das wrote:
> The header bits/wordsize.h is glibc specific and on building on musl
> with allyesconfig results in
> 
> samples/mei/mei-amt-version.c:77:10: fatal error: bits/wordsize.h: No such file or directory
>    77 | #include <bits/wordsize.h>
>       |          ^~~~~~~~~~~~~~~~~
> 
> mei-amt-version.c build file without bits/wordsize.h on musl. I'm not
> sure we can remove the header completely or how it's used under glibc.

Can you look into that instead of just adding a #ifdef that might not
actually be needed?

thanks,

greg k-h
