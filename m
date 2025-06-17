Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8171E3DCF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150083; cv=none; b=nAJHflxHQjNWDZFnhkAmCwbo8clU0D2IcECzT8qeUMUsu7oIg8OoVRNYzxmYaXKFwC7RUG32yOgMaEsCGbEAuy5N/ePB2FUxIICmisxNLmlLZ16zXJB5ab86I+SE8HGISAVkOOu6yA0r4V48E32qPKvpkRgegnXz4o2IB/D2T8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150083; c=relaxed/simple;
	bh=lwZsYn4Ge9MGc7LNCh8JCB93frlnvsXVFfEfZJfaD1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlGx3+tm3q/62Nm3+iINGjoFRZ6A1Q2BQrdI4TuBaKrtfCZIJ8ov+th0Jx/5A9nXdBFRI5mJBleCQRxkH2saBS/xwdApD/jTnqT50kg1lzcq9XfuTEaawNQfudVLLFqlbg3OQrd64wMkvf/9Tj51+usxR7OYngchi+BUoiKByTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xrr8s3/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xrr8s3/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9036C4CEF0;
	Tue, 17 Jun 2025 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750150083;
	bh=lwZsYn4Ge9MGc7LNCh8JCB93frlnvsXVFfEfZJfaD1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xrr8s3/sVTyuu63TAysokFZONxMkXxd2FMHX0wgKfZHSS8u60Whl9yOeZwGQPUF24
	 h4OzyvhbNApvElntPeCbP9lSTEGfxe7W/aGnPwrzIIJ1pcUjJTwaZtwYtU0UESMtOn
	 6D6Gk3NABiv2HjmEnq3UFt1hpWlkbJNIagZjoXEA=
Date: Tue, 17 Jun 2025 10:48:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] sysfs: finalize the constification of 'struct
 bin_attribute'
Message-ID: <2025061702-retention-lion-48c3@gregkh>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
 <fa9b1cb8-28a7-4ae0-89c8-8e3f9f149c56@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa9b1cb8-28a7-4ae0-89c8-8e3f9f149c56@t-8ch.de>

On Sat, Jun 14, 2025 at 08:23:24AM +0200, Thomas Weißschuh wrote:
> Hi Greg,
> 
> friendly ping. You wanted to send this to Linux at around -rc1.
> The changes should now apply cleanly to mainline.

I've taken the first 4 patches into driver-core-testing at the moment
(will move to driver-core-next if it passes 0-day testing).  The last 2
I'll hold off of for the next -rc1 as I was way too late here, sorry, my
fault.  I blame travel, which I had to do a bunch of the past few weeks :(

thanks,

greg k-h
