Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDEF231CB0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577735; cv=none; b=cKIAG0kqgpXLksIg0mtfeq9AheOwnMgCwoDDDNUYiLYOzP221Ex7Ol8Sp438FpPdEGi/e3LvDfM0GdSdbJzIOoCO5PEHhlmbGQq9NXHd5iVNkifnGCv/S/lHUhVipxu86k+J/MWJORbYdacIbVul59hLeT9TzekmGePPpsQbR9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577735; c=relaxed/simple;
	bh=bExcCDmBZlCX1aOgbCveWtXDckRC8NiIN7Cm2e07oiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbmAVJ6C9gNAHzXB2gjswN89dde2boXfnXg0Z+Cmq46d7QiAt1aar41fGAp/jpxljMXgHyukU5BC5VIBBlmeymDxyd5uBn5hWQDITeBxVLXZnD8iWDNWCOBN+cra5Rz2bYewK0zlVQDL7YUb6wyd6J48md3d3+MSvotuNAJOK4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JjtCivvn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JjtCivvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36F4C4CEDD;
	Wed,  2 Apr 2025 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743577734;
	bh=bExcCDmBZlCX1aOgbCveWtXDckRC8NiIN7Cm2e07oiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjtCivvnN/jFBCdr6zznbzvh182sVdODr9M8rlop7XmXj9MUlWN1fwOF6HduY7JvK
	 4G9etlq34sgTsrVqRcTv5uMjDpTvoQIHQV9lzClMG4arB0l2INxu8BNSLokUDGQChC
	 NIjXFLKW6wLgFr0+EQ+XzjDWiEK3y7FCK1cygwv8=
Date: Wed, 2 Apr 2025 08:07:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <siddh.raman.pant@oracle.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] published: CVE-2025-0927: Fix up JSON schema.
Message-ID: <2025040258-props-most-a34f@gregkh>
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
> 
> Fixed by hand / manually.
> 
> programFiles were added from the info in mbox.
> 
> Signed-off-by: Siddh Raman Pant <siddh.raman.pant@oracle.com>
> ---
>  cve/published/2025/CVE-2025-0927.json | 36 ++++++++-------------------
>  1 file changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/cve/published/2025/CVE-2025-0927.json b/cve/published/2025/CVE-2025-0927.json
> index 0a61961ede76..743e70d4b100 100644
> --- a/cve/published/2025/CVE-2025-0927.json
> +++ b/cve/published/2025/CVE-2025-0927.json
> @@ -4,8 +4,13 @@
>              "affected": [
>                  {
>                      "defaultStatus": "unaffected",
> -                    "product": "Linux Kernel",
> +                    "product": "Linux",
>                      "vendor": "Linux",
> +                    "repo": "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git",
> +                    "programFiles": [
> +                        "fs/hfs/bnode.c",
> +                        "fs/hfsplus/bnode.c",
> +                    ]

Also, I think the files are more than just this, so this would be
incorrect to add at this point in time.

thanks,

greg k-h
