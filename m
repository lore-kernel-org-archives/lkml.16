Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AC226CFF;
	Tue,  1 Jul 2025 10:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365661; cv=none; b=OeIdKMiUmXexDsT6mED10GZ7Aa3NhyctbwUm54vUZ6/35CXo/2RaAgBtissRdWq3ICU3X1oYl1Jj8HWADojWiMp4wXTN/RMOUd0Z0C858cB4xsVpee5MBFpY3yRP/eKyXPSIl0UELXkv2GZdQO+hu26exWbmN02CdAS5NLkw/hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365661; c=relaxed/simple;
	bh=19sP23bsK99W1AcJFFH51CLgtA+sa5qJ/F80eXKbnMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fP1Z2kE23UrBjXcAZL4wcTrEu6QITGyBSPJ1vrtCtKU0g1VgWPTVLX1m7mOJbtyHm2bEfq25P8OCAnGVfxK2wGaCElErrMOcm0+cLx1KcWIr+dNNRMzLtiiRI4xGMQWfw4UCsx8Zo30P63tB+NX8EKdjgKHr08+UMKiVj1REGk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iEMEXlei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iEMEXlei"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA98C4CEEB;
	Tue,  1 Jul 2025 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751365661;
	bh=19sP23bsK99W1AcJFFH51CLgtA+sa5qJ/F80eXKbnMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEMEXleizLksIRzLMK8Mmnl6spwN49E+cunuZ5xYUuPmsBCNZ+CjJ6ZU5+ZHaEHJq
	 QZUlU0cXpyjyVtEZhMi/zr0UegUMDEYjOVR7G5n3QoBiSocCNfZnGoA4zXOQ2NN5Ss
	 3EuMoavT78yyTAbaKnXdCNoYJJ2Zg1JO3Jy1MzOQ=
Date: Tue, 1 Jul 2025 12:27:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: linux-kernel@vger.kernel.org, chentao@kylinos.cn,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] firmware/memmap: use scnprintf() in show funcs
Message-ID: <2025070154-cringe-tidings-20f5@gregkh>
References: <20250613134449.7459-1-pranav.tyagi03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134449.7459-1-pranav.tyagi03@gmail.com>

On Fri, Jun 13, 2025 at 07:14:49PM +0530, Pranav Tyagi wrote:
> Replace all snprintf() instances with scnprintf(). snprintf() returns
> the number of bytes that would have been written had there been enough
> space. For sysfs attributes, snprintf() should not be used for the
> show() method. Instead use scnprintf() which returns the number of bytes
> actually written.

for sysfs attributes, sysfs_emit() should be used instead.  Why not do
that here?

But what is wrong with the current code?  Is it not working properly?

thanks,

greg k-h
