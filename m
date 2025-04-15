Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0018B0F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726305; cv=none; b=WAG6BMkX5QzVq3iz3yQdyn8d1PxiUahJ45pmezXm6BUx6v2zWgc7EUflQU8BTWgkQG9cg5wSDXBLDSV+Lf+O7s1Ypkw9We9T3eElgXy7PLoHDTh/3duvw8MHlqXBVw1wdEaRnhrOU2YCFEr6IkDqxGHPOybwhq3JoErUlP/PTjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726305; c=relaxed/simple;
	bh=JDJHiVwf5brrhBYVZ4j1Tn1hQWwy/kCCKUq25O+u+UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKyvrLUI69T2XXUHckRFMdR93x3/zkoCa6zP3U2B9tvYrbsjEUj3qB0AAKcwGab2JABfHzUUzb4a3swePBM/kNzZ16moKAjX9TRBagLxxB4YwQr7ENL5VmT4pitNgH83AZZUE4rzpE2N32Pn4fhQhIcJRzNQG5XilpjOBTuikwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VFwaT/tc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VFwaT/tc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009CCC4CEDD;
	Tue, 15 Apr 2025 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744726303;
	bh=JDJHiVwf5brrhBYVZ4j1Tn1hQWwy/kCCKUq25O+u+UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFwaT/tca84MbFzBs3lVpTn0dLhsuW/bhjf2BSC3iHKTfigwYmJzz8+LeZlErQo+P
	 c3+lshpiiIQrkNnwl8MsN21LxJ908Ih570SqFDrAEETrT1vKG3iYV9tFTddcLZrfmd
	 eJvcMchFuLVNSddu7fOq9NDtjn3pI8b8LL7UGK48=
Date: Tue, 15 Apr 2025 16:11:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yidong Zhang <yidong.zhang@amd.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, lizhi.hou@amd.com,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH V0 0/3] Add versal-pci driver
Message-ID: <2025041504-ultimatum-unmade-e54a@gregkh>
References: <20250303044313.679012-1-yidong.zhang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303044313.679012-1-yidong.zhang@amd.com>

On Sun, Mar 02, 2025 at 08:43:09PM -0800, Yidong Zhang wrote:
> This patchset introduces a new Linux Kernel Driver, versal-pci for AMD
> Alevo Versal based PCIe Card. 
> 
> The AMD Alevo Versal based PCIe Card, including V70 and RAVE, is the first
> Alevo production card leveraging AMD XDNA architecture with AI Engines. It
> is designed for AI inference efficiency and is tuned for video analytics
> and natural language processing applications [1].

accelerator drivers should be under drivers/accel/, please work with the
maintainers there to get it reviewed properly in that location.

thanks,

greg k-h
