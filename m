Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4082C8635A;
	Fri, 11 Apr 2025 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380142; cv=none; b=QMKrPBfolNcexEVuGB9qXotmRyrCzdNBqnUljPUliZR7uJDhNfWo/yDrEGkArGwl5IToqUXlRP8bXpbiuXkd0/Ux33osExm+qz7K0g/Tom8x4gHmKjhR9uBQVGILDFUX6dA/OaNJ4NaraG2OlNpJKDH0DheZLA4ZjiP+apkAbi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380142; c=relaxed/simple;
	bh=6gZYC8dYoQ73OQgYvOUcUOQs/hk7/YC48r0jnFZSK14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NV+0mY+Fji5OZxLMuw1CEFPmfkY3O01Pkz+C+f3yx6n3RtFt+Q7S+oMfmNm38WmBzGEZTIanPXoSDYekd1V3h77h3m7Go26ylTPMpSbCCX/OShgMAtifpGfjAZIMxY/yspCd+HcKDV2jo6RhMfz3Mg6yzpvnHEmGXmDLpquNC5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X4jfO+uL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X4jfO+uL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E8DC4CEE2;
	Fri, 11 Apr 2025 14:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744380141;
	bh=6gZYC8dYoQ73OQgYvOUcUOQs/hk7/YC48r0jnFZSK14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4jfO+uLKXDmb4EKG4z/dQdCKfVL0iYVZL9uA2HYnM2r7sqscNWkTZJxk+lTN7+pJ
	 zHQGB4Eed8+FTO+iBMA+SPVhltK4lLTK7WnZgY9v6b0ah2q/0ShypZjtEALhqlGG9V
	 OOD7NEEK28yji5SnWF+KzGbuqW9G9fZgcDRU3FE4=
Date: Fri, 11 Apr 2025 16:02:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	gargaditya08@live.com, kekrby@gmail.com,
	jeff.johnson@oss.qualcomm.com, elder@kernel.org,
	quic_zijuhu@quicinc.com, ben@decadent.org.uk,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/4] usb: host: enable USB offload during system sleep
Message-ID: <2025041140-fernlike-reconvene-b2e5@gregkh>
References: <20250408035833.844821-1-guanyulin@google.com>
 <20250408035833.844821-5-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408035833.844821-5-guanyulin@google.com>

On Tue, Apr 08, 2025 at 03:57:24AM +0000, Guan-Yu Lin wrote:
> @@ -736,6 +737,7 @@ struct usb_device {
>  	unsigned use_generic_driver:1;
>  
>  	refcount_t offload_usage;
> +	unsigned offload_at_suspend:1;

Please take a second and think about how the memory is now layed out
here with your new addition.  The tool 'pahole' is your friend...

thanks,

greg k-h
