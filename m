Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1086D2253A7;
	Wed, 11 Jun 2025 03:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610847; cv=none; b=dDBXG8UhHXrInybx24C0sNQ/hiGYyFoCnGFHkS7WPubWUWi3MVc56HQxKqni3xxeHFowAg55Q0PR4XTTz92ekyCRC3cU5OSBf8MvGRasWqjrBS6j6CiAlR7LJ9KS+ZZBtUlk39s598M9y1fccsYgHGMjh58VcQZlUWy1vCrh8K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610847; c=relaxed/simple;
	bh=PI6sDkmKAkCiovsJ+3Bmcgbdp7V7i0NlEWK++v1zyu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoIJm7f4ii2+VQLpqOT9EtG9dGgA8ipICzpSb/EDkgujEqkSVZbeydYlUWAYauqFuFPA1a9fuLTaTcQhEwiLniwunNuiAABSksOnqpjHaI2C8WSSjh6fGacxYdPhQUwl0kWOzd41T+qQm67JdvIF2yJe3o55Ix/g4d/2w7FlQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kzqwNKMt; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kzqwNKMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wnQvkwGgcyocQYZ5N13vAZvfg+eJZRbaALNxFcVziF4=;
	b=kzqwNKMtsQfkoSb4+g7xlmAS/SErRvHoRj7RvKZyBVZkrfdut767/7Wh7MDZ/P
	zpAN8ELhJTKULjghRr8TQTIdRj1lrtEg0AV8vT99PZbDUPZmk2j2ypJrczii65p9
	UuQZwKdlufLiIThN86J8wg4p/B9XwheuUfbD4B1SwXgjo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA3rw4n8UhoKPphAA--.40571S3;
	Wed, 11 Jun 2025 10:59:52 +0800 (CST)
Date: Wed, 11 Jun 2025 10:59:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEjxJ3atSw/8JwNo@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEf/2+3MU5ED2sxE@dragon>
 <emdju6mml2o65hmtiyf5jwlzhudmbpyx433wz5a73lkpinzbyp@2oexfo2ra7xs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <emdju6mml2o65hmtiyf5jwlzhudmbpyx433wz5a73lkpinzbyp@2oexfo2ra7xs>
X-CM-TRANSID:M88vCgA3rw4n8UhoKPphAA--.40571S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWfGF17WryxZw4UKF18AFb_yoW3XrcEvr
	4DGw4DKw1kJryfXas3tF1rGr45G397KrWUXw1fXr4YvryfJF92yFWDC3sFv3Z5Zay2gr9I
	9rn0g34Y9w409jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUppB3UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhlpZWhI2xltwgAAsK

On Tue, Jun 10, 2025 at 07:54:41PM +0800, Xu Yang wrote:
> > However, your change seems working fine on i.MX8MM EVK.  It's probably
> > due to the fact that host disconnects gadget for some reason when EVK
> > suspends.  This is a different behavior from the custom board above.
> > We do not really expect this disconnecting, do we?
> 
> It's an expected behavior on i.MX8MM EVK. The host will see device disconnected
> after imx8mm do system suspend. It's because the usb phy power will be off after
> system suspend. If you enable wakeup capabiklity for usb phy, the usb phy power
> will keep on and you will not see disconnect event anymore.
> 
> # echo enabled > /sys/devices/platform/usbphynop1/power/wakeup

Ah, indeed!  Thanks for the information!

Shawn

