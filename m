Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6AB82864
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031258; cv=none; b=ZwjsNHFL9qqX80QyInaEZRln3h/rw7mVw3/sz/EhVNzwbcA7bhgf66Qg4uHZ/d3xlrRIo2BxqyYZxgsxfsQZJhYBXp76Syce9AsOHT3NEthOzm8suKHaEpSNpLyFvI1gO3+eVckYzvRkO1JyKnx1Z4u2mXCWgQ281LKU7JXfQ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031258; c=relaxed/simple;
	bh=WSg9CWk5ApKKdBW49u1Rk3H+IopeCVo+D/psH+QEf0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnLyolwARziTNTaVaFnAArxRTmS4IYJI4PG/CkQs8m4O8aw63t9GcbbSeiYRC+pdWGNSltGtorjO8bGJLT69CzX1cQ9dZm03lIIrYw1EQ9b+E9N80t2YVt3LWtYdfIScuvARfU5ZXMulprusyHth5U01L5dpbcwB1/1uJqDnv4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E1oa3V4u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E1oa3V4u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD28C4CEEF;
	Wed,  4 Jun 2025 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749031257;
	bh=WSg9CWk5ApKKdBW49u1Rk3H+IopeCVo+D/psH+QEf0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1oa3V4u6veK7uks/BAQ+p8CLRi0LUCsi4glZVhE8XHjRZsGaS3dqmgNf2iSboNge
	 JaG25DXG2aWQywPQVuY3ioHKQ7xsBoFEzsfUhtClrfm4ddTMiC3zA4Qwe+lvS776UM
	 uc5O7d4ZmHH/aLkYN/iYJejOnC34sSEdWLoVU040=
Date: Wed, 4 Jun 2025 12:00:54 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <siddh.raman.pant@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: CVE-2025-21991: x86/microcode/AMD: Fix out-of-bounds on systems
 with CPU-less NUMA nodes
Message-ID: <2025060459-diaphragm-display-ba2d@gregkh>
References: <2025040257-CVE-2025-21991-6aae@gregkh>
 <793ae4a30ab15d0993ce9152ce91b6b98a05b1a5.camel@oracle.com>
 <2025060430-rimless-splinter-4131@gregkh>
 <064d66133dc11a95f7c5aa647784cf9bb3ede1df.camel@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <064d66133dc11a95f7c5aa647784cf9bb3ede1df.camel@oracle.com>

On Wed, Jun 04, 2025 at 09:54:55AM +0000, Siddh Raman Pant wrote:
> On Wed, Jun 04 2025 at 14:58:03 +0530, gregkh@linuxfoundation.org
> wrote:
> > Doesn't "causing corrupted memory when flashing a microcode update" fit
> > the cve.org definition of a "vulnerabilty"?
> 
> This only happens on CPU bring-up so I don't see it getting triggered
> without already being exploited.

If you can get the maintainers/developers involved with this change to
agree, we will be glad to reject this.

thanks,

greg k-h
