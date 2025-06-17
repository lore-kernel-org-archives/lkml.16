Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B0D2ED86F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169213; cv=none; b=gKNIUpVvXmEbXgw/S3JTEr0VLcY7z4i9zxbqAJdgoUKQmIb7AJFa12lXWf6vyLYp8z8RjpHhsrBXC87We/LzAq86fVJFUWNt0ZVt1YFgVTrvlSU7fj1/Q0kvsgusajw+QBmWWPXxWmyMZeSFhJ1jAGMtCLpUupcR0afd0qpoX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169213; c=relaxed/simple;
	bh=wlUnOlre1cNVXba8vySsEK8Gnhx5BvohpI9fCp7x0k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWTQQisWDNNkT3iKOhh0C6lX4kFyyCrNz6espmPvyzmbMfbeHDbw7Aa2QfBK/UgKtl7jYNAKpS4lUIzDp2KKq0Tyn+0b7d+tFRxkH69HfI+8ilTCJ6DmrxNizE0JDhWavthJ6iXrGWkGG/QCrXr1BVFXc43enxIvZcueqXWVSoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nPRi18Pi; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nPRi18Pi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750169208;
	bh=wlUnOlre1cNVXba8vySsEK8Gnhx5BvohpI9fCp7x0k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPRi18Pi4DYQG45VRPPyhswSu25s6JUZNwulDrN3WlyVjyPouGaumPuVd07VwEeaf
	 NRohT21gBn8fNl3+pmMJupH7B7fwt0UOEVRYwAd12ccXtroFYqTBYmZOlWLola/AS0
	 0+PPLfgkGBWikuJSKIMdLsu5j2ESVDLc/LwyaelM=
Date: Tue, 17 Jun 2025 16:06:48 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] sysfs: finalize the constification of 'struct
 bin_attribute'
Message-ID: <9797efed-0ece-4817-9a37-9ff225a5df6d@t-8ch.de>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
 <fa9b1cb8-28a7-4ae0-89c8-8e3f9f149c56@t-8ch.de>
 <2025061702-retention-lion-48c3@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025061702-retention-lion-48c3@gregkh>

On 2025-06-17 10:48:00+0200, Greg Kroah-Hartman wrote:
> On Sat, Jun 14, 2025 at 08:23:24AM +0200, Thomas Weißschuh wrote:
> > friendly ping. You wanted to send this to Linux at around -rc1.
> > The changes should now apply cleanly to mainline.
> 
> I've taken the first 4 patches into driver-core-testing at the moment
> (will move to driver-core-next if it passes 0-day testing).  The last 2
> I'll hold off of for the next -rc1 as I was way too late here, sorry, my
> fault.  I blame travel, which I had to do a bunch of the past few weeks :(

Works for me.

On the other hand it should be possible to take all patches through the
normal -next process right now. This is not a flag-day conversion. The final
const variants are already in v6.16-rc1, so everybody can just use those.

Thomas
