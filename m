Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70556237176;
	Sat, 28 Jun 2025 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751118614; cv=none; b=mdatbfOqvG2scEI3nGlXVFJ60N2mf+wxSFxdFQBMNprEWrPB/qSqoRGueMwiHOsPJwou77mRCMxy+mvTHaowl8dhP/4Ps3nOE/Ez6g1JR6aBMHLmLzLL4tRs3QoydvcVp7uJgtJ/V60IIufiis4UyxkNnQGK3WttmNZL2H8dQ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751118614; c=relaxed/simple;
	bh=JEDE+6ACI8oP6K6lUb15+A1X2BX99eIpTUJUWjBEWTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPdT4z7POxboXr2qnq7vC3lHyxWnDNxRZ3QP1eTHyDVofJB0rTl7VDFVph3lDAGxjSs28xIjTTCUZxch5S+PUJszVos+NC/CNAyBJ5LNw5Nj0WBxs4zEgkrkQiz7DizuTdWtRWXhurPhwuRLxP4hoA8iQ/Mmyzzq3QvYwLw+91E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XaRa2J0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XaRa2J0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DB0C4CEEA;
	Sat, 28 Jun 2025 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751118614;
	bh=JEDE+6ACI8oP6K6lUb15+A1X2BX99eIpTUJUWjBEWTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XaRa2J0l2wT12y/lUxIHkVugUvMDfJSGITWoGT6vDJoT1xbFFH7LZy+ZuCDSg+EVO
	 wXmlZq/lOBLm4ivTWrqgkrrNtBTtlsSvTIjqMtCSpk140mQJrKJzzwRJLjFtmC8jtF
	 tbu5B5Hb2aghH88X80I3bnsh6vA4cGJNL9hPkYe4=
Date: Sat, 28 Jun 2025 15:50:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zhangjianrong <zhangjianrong5@huawei.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	mika.westerberg@linux.intel.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	guhengsheng@hisilicon.com, caiyadong@huawei.com,
	xuetao09@huawei.com, lixinghang1@huawei.com
Subject: Re: [PATCH v2] thunderbolt: Check whether bandwidth request needs
 asymmetric mode before check whether it can be done
Message-ID: <2025062837-stability-unmoved-42e8@gregkh>
References: <20250628123453.770988-1-zhangjianrong5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628123453.770988-1-zhangjianrong5@huawei.com>

On Sat, Jun 28, 2025 at 08:34:53PM +0800, zhangjianrong wrote:
> Current implementation may cause allocation failures in
> tb_alloc_dp_bandwidth() in some cases. This will happen
> when requesting downstream bandwidth while total upstream
> bandwidth usage on the link exceeds TB_ASYM_MIN (36 Gbps).
> tb_configure_asym() will return -ENOBUFS while asymmetric
> mode isn't necessary.
> 
> Fixes: 3e36528c1127 ("thunderbolt: Configure asymmetric link if needed and bandwidth allows")
> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>


Please use a real name, not an email alias, for a signed-off-by line.

Also, if this fixes old bugs, why did you not also include a cc:
stable@kernel.org line?

thanks,

greg k-h
