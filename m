Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1F8267F41;
	Tue, 20 May 2025 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739110; cv=none; b=lO5QsjRazacNMNGw1gz7jgfzCjDX/rIg9xhWx9JLup4Xi8uertVCAUHhlsLtSQYAp66NsK0Z/0nICLHmo8zsQe2706nInv+Fc8SobMWIOGPYgGoJXYqxb5eLwra4t1rbFDV0ZvWfZwE9xxDJntGhj2Q8+QFGGDK4eIBMhxNu9jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739110; c=relaxed/simple;
	bh=dqzHqbI45drYiJcBhZWpXVC3zrDHhjThfa+aqxLgwrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kovNdDB1ea6VUCzQfmZIiUziKP7EU05FDmY3I6VP0oZCBSBo6yCp7I5H0TAmNRpHADYypyesUb8djiiy0KP4u1KhXoaKvVW5mrnj7ixiIGqfr9uDh7V2Rqu2VhDOX7/XW5D2n/Ts6RwOgOVWHxOcaLdkp2Y1BAsHRJy/ONCDz70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nrgUP7hf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nrgUP7hf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF75FC4CEE9;
	Tue, 20 May 2025 11:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747739109;
	bh=dqzHqbI45drYiJcBhZWpXVC3zrDHhjThfa+aqxLgwrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nrgUP7hfhz5mXv2m1/f+QzqIHK72xfHiTHCMO0Sau8GbC1B5LyHb3dOKygYBk3yjF
	 1WAGBWIES+DRDo7d8Xq6AcTD6DeCUf1iL55Y7j5jxHkR/L1Sd7loUjy5zMwYHIit8t
	 wV8YCDAakvMjTrDzrVTlYo3C24SCx1kf71Ce/rHc=
Date: Tue, 20 May 2025 13:05:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Documentation: embargoed-hardware-issues.rst: Remove
 myself
Message-ID: <2025052056-disarray-blitz-acb2@gregkh>
References: <8734czh8yg.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734czh8yg.fsf@mpe.ellerman.id.au>

On Tue, May 20, 2025 at 08:28:55PM +1000, Michael Ellerman wrote:
> I'm no longer able to perform this role since I left IBM.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  Documentation/process/embargoed-hardware-issues.rst | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
> index 0e19d2f0d6bb..da6bf0f6d01e 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -290,7 +290,6 @@ an involved disclosed party. The current ambassadors list:
>    AMD		Tom Lendacky <thomas.lendacky@amd.com>
>    Ampere	Darren Hart <darren@os.amperecomputing.com>
>    ARM		Catalin Marinas <catalin.marinas@arm.com>
> -  IBM Power	Michael Ellerman <ellerman@au.ibm.com>
>    IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
>    Intel		Tony Luck <tony.luck@intel.com>
>    Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
> -- 
> 2.47.1
> 
> 

Thanks for the patch, I'll take this through my tree.

greg k-h
