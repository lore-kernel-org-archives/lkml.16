Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B602566C4;
	Mon, 12 May 2025 07:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747033961; cv=none; b=dfoIevLnLCen1nS4GNujv+8P4oHVy0DgMkm0J2h84YOSeng8koV5Bg7NWspbEWUU9Nif1fTJ3gvQHgX9j1o6ZnF/jiSXssICTjclWQn8xUKFIQZbPO+c+U8056JLXGI5hXgRp43TIM6ABGggil7glhnZKXESxl30Qw5OIwgEoyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747033961; c=relaxed/simple;
	bh=d7eR4iam2qZB+M+UdoyPhaDhOOPiEADZuEHlMiFzorg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+eTBHC3n8l/sfOvFe0HognoPT5DeY3emCtb5p9WbZFTouGhOP/+z1IWOPQHee8Iy2tkcH5b7z6CfwsQng+68zefXkFr04mn4Fkc8jVJA397l16NsfTIazg9zzHmTKqv6i/nKORYKdiAQvkekHsdvlLYvl+JrR16tCPY3dS6ggA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=o17NkVG6; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="o17NkVG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747033954;
	bh=d7eR4iam2qZB+M+UdoyPhaDhOOPiEADZuEHlMiFzorg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o17NkVG6g7dr3hPrfuBN1+tCueULJ90xVPC2gxnIEy9VaagKGZTQsewF2NwMY4C1D
	 mHEj0z7cYXPIvOgmqWDp8bq1Q83F8dh23rQ2Gjuk2+aJWqFKRZyVpDFS0jZQd2G9je
	 yZjHrLvUhlkPrlu5NDPp8NsbZNaOAzby0Sd3skWk=
Date: Mon, 12 May 2025 09:12:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Mario Limonciello <mario.limonciello@amd.com>, Antheas Kapenekakis <lkml@antheas.dev>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: Re: [PATCH RFC 5/5] platform/x86: samsung-galaxybook: Transition to
 new firmware_attributes API
Message-ID: <5706c07a-f8e7-4dc8-95a0-b128f1306c02@t-8ch.de>
References: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
 <20250509-fw-attrs-api-v1-5-258afed65bfa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-fw-attrs-api-v1-5-258afed65bfa@gmail.com>

On 2025-05-09 04:48:37-0300, Kurt Borja wrote:
> Transition to new firmware_attributes API and replace `enumeration` types
> with the simpler `boolean` type.

This is an ABI change, using a newly introduced ABI.
Some elaboration why it does not break userspace would be good.

> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/samsung-galaxybook.c | 299 ++++++++++++------------------
>  1 file changed, 114 insertions(+), 185 deletions(-)

<snip>
