Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A927485;
	Wed, 11 Jun 2025 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633440; cv=none; b=rivdZVNcio2R9FyE6DCKZjH2trI3iGqCkKZo6a1LXgNH5cw8SZ2jRNpOB3BtavvdzCMrdqdyVfUdNyrzIS0YTZ9bEPg84K2rO5Ze+Dv+jXd73GXq+OaxV93qvYYMOlOjDDv5z8djRoIEWKt4jhz8XWyaOWuhIVPdz5C5dvTdaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633440; c=relaxed/simple;
	bh=fMGPFgE0q2P8lCWuIVwRyssHEn2zFzKizX286K8ppeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+r6fHtlulMnqdCM3EJa3kE3EJUuzlAeR99UBDrKBWXg2vMk7C03kYUga8b98wifb6YC8zDeL/snLYvPHyMwafSTQEvUrl1O7ZfYi858KynBQxuUFxQ2vTW/hYzRZyjQdq3ucAafkZif2hGgH8NMEEyJmkKlWChoJWAdoLoA4HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=J7t5U1Ss; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="J7t5U1Ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rBVOc7vHR4kZtKiuQ4qQXxVIUQWSopJjHkdge+9ZyYI=;
	b=J7t5U1Ss6cae1xR6YupFxGGc+qxjQdL+pQRIcP5Im26N2vSFZReBnh6wVRGzwn
	+3L47mgAfHX002ize/lKWOogiYY1mC6NOONmsu3EllAhGn+8aTKXgGqTeZbh0oM0
	MFA/U67SqzDHLaXQD9EH0eiG3dxYlrsj6W4t9sFPjbdSM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3zlJqSUlopYxpAA--.30940S3;
	Wed, 11 Jun 2025 17:16:27 +0800 (CST)
Date: Wed, 11 Jun 2025 17:16:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Enable gpu passive throttling
Message-ID: <aElJaVxqUUNi1rfC@dragon>
References: <20250508101802.489712-1-martink@posteo.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508101802.489712-1-martink@posteo.de>
X-CM-TRANSID:Mc8vCgC3zlJqSUlopYxpAA--.30940S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr47Zry5JF13JFyrCr4Durg_yoWxurb_Ca
	y7C3Wqg345A3W8K3Wak39xuwsI9anFvry7Jr17Zr97XrWjqr9xZw18Cry5ur1kWr4I9rn7
	Zas8Xw4aka4I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_hL0UUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQxpZWhJP1YspAAAsB

On Thu, May 08, 2025 at 10:18:02AM +0000, Martin Kepplinger-Novaković wrote:
> Hook up the gpu as a passive cooling device to the thermal zones' alert
> trip point just like the cpu.
> 
> The gpu here consists of 3D GPU, 2D GPU and NPU.
> 
> One way to test would be to set one "alert" trip point low enough
> and watch the cooling device state increase:
> 
> echo 10000 > /sys/class/thermal/thermal_zone0/trip_point_0_temp
> watch cat /sys/class/thermal/cooling_device*/cur_state
> 
> And of course set the trip point back to its original value and watch
> the cooling device states jump to 0 again.
> 
> Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>

Applied, thanks!

