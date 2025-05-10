Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2097E9
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746895645; cv=none; b=nfNxBRhJGLo6mKqLr57z+B/bsLJSgQsCoquc1fGP5bwpU49qSaHrjxQ2uN9c/jSFEJIe+y60jLJTduKbpUWEFC9SsMa8S4tH2OfwztGdpOw37CYhnX6cfVLeepcskvDOdBdJWUaJKdOB6phWVNDNboHAPcLxYuhq104zi01we58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746895645; c=relaxed/simple;
	bh=mg3OcMFEgpfETz3xUeF5o7AyPcYACz6jMNcotR9mcvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqLH/qN8KMIKuSQbVPKbtXSrW8utAMvRkggJavX7nsRU12K7hZrE972uTFSuaSiz2sWGTqyZ5wQg++xc/YcaSP/AL/Jaiov2pd6sFHdkwCA+JxaPnTXwc6Kqs053KaIdezj2cSx32LvLRucL8tmlXqMs7rGUNafwn6LxRbqSWEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pk7u4q6A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pk7u4q6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53313C4CEE2;
	Sat, 10 May 2025 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746895644;
	bh=mg3OcMFEgpfETz3xUeF5o7AyPcYACz6jMNcotR9mcvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pk7u4q6Au/EaFLC0B+yFLJ+NDbAMr37IZj5HpMTfR/f19/kKaNaKJXX9/gqFGEH2C
	 yqZq45nSWwj1wCwnQLAkbWuONXJ7Yn+swpe3Ze1vuJbBFRhn2WXXlTuj4kLPJ2qT9H
	 1WUii2M68tgaG+rppA/R+U2ubGiL3IYPWunik1bs=
Date: Sat, 10 May 2025 18:47:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org, vegard.nossum@oracle.com
Subject: Re: [PATCH] Add vulnerable commits for few CVEs
Message-ID: <2025051059-knapsack-imbecile-9bb0@gregkh>
References: <20250510161043.473006-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510161043.473006-1-harshit.m.mogalapalli@oracle.com>

On Sat, May 10, 2025 at 09:10:43AM -0700, Harshit Mogalapalli wrote:
> CVE-2025-21872: Re-mapping the entire mokvar_table is the problem and
> the re-mapping is first done in this Fixes: 58c909022a5a ("efi: Support
> for MOK variable config table"), so this is the broken commit
> 
> CVE-2025-21833: The fix moves dev_pasid dereference inside
> WARN_ON_ONCE() as there is a possibility of dev_pasid being NULL, this
> dereference is first introduced while adding debugfs support per file in
> Fixes: d87731f60931 ("iommu/vt-d: debugfs: Create/remove debugfs file
> per {device, pasid}")
> 
> CVE-2025-21832E: The problem is that iov_iter_revert() is done before a

I don't think CVE entries have "E" on the end of them :)

I'll edit this when I apply it in a few minutes, thanks!

greg k-h
