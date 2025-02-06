Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BC621CFF7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738845935; cv=none; b=C2GWcc6ltLRF6EMXoDS7ISoIyoAy3lITBVWvtyJ2jNMXwRyYvQH0NWuP4lNSQMDMLgccdNfTJ4d0DtCIA9uhwGPxzxUZBP+38m+cwqKYJl1S9H1sSskwICJKSPuVbO3yMhliVv5/A4GX+QfZOJr7isz6RUuXWXcXEkaUvLmfuRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738845935; c=relaxed/simple;
	bh=KMl9eVQKXnotHYNjQ0Ja1YvBxSkzHW5c8bITk0fe058=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tVbnmfEkDAKBRtxpRlwzNoZN/m36GExBnvnmNzSfDlkBq1d411m4O7RJTyu+uQ3U9SvJH3pqPdsah9c/Uhr//wrtrWQ1xzJwoq74FXhkVNSp37EYcazyA7THt/DjWSDJZZYSuT1MQRbLsqEduP3T6+9uCYYvFMPPPSEVEc2KpWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E8pNIZSk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E8pNIZSk"
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84B821193;
	Thu,  6 Feb 2025 13:44:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738845858;
	bh=KMl9eVQKXnotHYNjQ0Ja1YvBxSkzHW5c8bITk0fe058=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=E8pNIZSknmRNKrsljsdYOT+Z4wdx74yVpzRhjdUeFRxnuBaBhNLLZ2uyD7GPbseBm
	 l95MWP/BOrQsPM2hsv64LHLCIQ8JLuRqr0+Vl7FOqF77PM4+ppA/mC8plFozSgn2cb
	 K7kfB3gN0T54Scfra3YzODcJk0Q0PfRQKokn+rME=
Message-ID: <2a0f24c61de73f7bd2bb495d697dcedd8462f4c0.camel@ideasonboard.com>
Subject: Re: [PATCH 1/1] regulator: ad5398: Correct the SW_POWER_DOWN bit
 number
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: michael.hennerich@analog.com, lgirdwood@gmail.com, 
	linux-kernel@vger.kernel.org
Date: Thu, 06 Feb 2025 12:45:28 +0000
In-Reply-To: <c29affda-e769-4658-bb74-3b8c273e8262@sirena.org.uk>
References: <20250206122459.197985-1-isaac.scott@ideasonboard.com>
	 <20250206122459.197985-2-isaac.scott@ideasonboard.com>
	 <c29affda-e769-4658-bb74-3b8c273e8262@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark,

On Thu, 2025-02-06 at 12:28 +0000, Mark Brown wrote:
> On Thu, Feb 06, 2025 at 12:24:59PM +0000, Isaac Scott wrote:
> > The datasheet for the AD5398 regulator indicates that the Soft
> > power
> > down bit is bit 15, not 16 as represented in the driver. Correct
> > this to
> > ensure the functionality is implemented correctly.
>=20
> This doesn't apply against current code, please check and resend.

I have checked, and it applies on top of linux-next next-20250206,
which includes my previous patch you have already applied:

[1/3] regulator: ad5398: change enable bit name to improve readibility
      commit: 19d022d67d7353f0e6e9ba255435d3de93862ac4
[3/3] regulator: ad5398: Add device tree support
      commit: 5a6a461079decea452fdcae955bccecf92e07e97

Have I applied it to the wrong branch?

Thank you very much,

Best wishes,

Isaac


