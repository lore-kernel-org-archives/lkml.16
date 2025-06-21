Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E744A30E848
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750499171; cv=none; b=i1gYb6p6XGGDYA6nWvO/eKpysSozECqDvMJrcfV2K0vEmZOqsliunv46kysjkGMXa0jHse4M4BS8yFh1zmiwKV9P3xgX3Znv1XLp5GNRCFzilUTLFewA5QGSYXOOxSeuCxzrtk69FtnVFGFj47QM8ThHNHqrQk/GGPsp52lxhok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750499171; c=relaxed/simple;
	bh=HFKZINh5TgeyGaBB2usbyBwS5zbXVVJu61rS6Lpc7zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkXPQDMAi4ZoWmWBLb1IqBwkKMGatzfovtZhYIXVj0nBgrr0CHImEPWD1CZeuiKusBLYYJHIGFG7pZ472nV4Gc7vS3AvejZH48bjUehiwPI8WpwybrY40Q8YZLXGeQm5G68kzOWJ2Z5mfdr3+Zrawawfw9SKpQV901pWiL5WDyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 424172C06849;
	Sat, 21 Jun 2025 11:46:08 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2CF521E4C40; Sat, 21 Jun 2025 11:46:08 +0200 (CEST)
Date: Sat, 21 Jun 2025 11:46:08 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ahmed Salem <x0rw3ll@gmail.com>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <aFZ_YJH30f1WDneD@wunner.de>
References: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>

On Sat, Jun 21, 2025 at 04:55:52AM +0300, Ahmed Salem wrote:
> --- a/drivers/char/agp/amd64-agp.c
> +++ b/drivers/char/agp/amd64-agp.c
> @@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
>  
>  		/* Look for any AGP bridge */
>  		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
> -		err = driver_attach(&agp_amd64_pci_driver.driver);
> -		if (err == 0 && agp_bridges_found == 0) {
> +		if ((int *)agp_amd64_pci_driver.probe != 0) {
>  			pci_unregister_driver(&agp_amd64_pci_driver);
>  			err = -ENODEV;
> +		} else {
> +			err = driver_attach(&agp_amd64_pci_driver.driver);
> +			if (err == 0 && agp_bridges_found == 0) {
> +				pci_unregister_driver(&agp_amd64_pci_driver);
> +				err = -ENODEV;
> +			}

Is the "probe" member in agp_amd64_pci_driver overwritten with a
zero pointer anywhere?  I don't see that it is, so it seems the
else-branch is never entered.

I had already prepared a fix for this, but waited for 0-day to
crunch through it.  I've just submitted it, so that's what I had
in mind:

https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/

Thanks,

Lukas
