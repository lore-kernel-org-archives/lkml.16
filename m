Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BB22D7AF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303798; cv=none; b=qINPizfwak3L3DCC1zk8AkFBlWkNpkivkiacZs8eZ++nk8YTOPu22IxOZTqxxrVnKjr+UzgWuE1DobR5Bt+5xOwAQmpoVdx8NarKw9kjTFXVWLipqL4Xxp2LBE7fBLmg96RULoWE3Z09RcpbKSl3PEBHVWNIjUSKOEZlYWcNhyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303798; c=relaxed/simple;
	bh=JTRo1MgH+jjhQRhwZCBUtkLwZhQKlyaAAyAu8hdfq9A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gb5RF+dueyU00gYWinYS3ijwM/uK5B5nRXP5hI+m5D4wCQmxXXqinAjjcu1cKGadWcJMO/D/yfF8hz79rQq/ysGi2z9+YIzvcIp2u4KADaRjPnKk0Rzoi9vzkD0BIaOA361UEFbCHqJIivET47yEMtXLcXH0+8rgLfwdLhnZO80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 1f65a06d-1f44-11f0-8efd-005056bdfda7;
	Tue, 22 Apr 2025 09:36:29 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Apr 2025 09:36:29 +0300
To: David Lechner <dlechner@baylibre.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Message-ID: <aAc47RW0yw97K5sZ@surfacebook.localdomain>
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
 <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-1-ee0c62a33a0f@baylibre.com>
 <aAPQS9xY4603PJmU@smile.fi.intel.com>
 <5df8aff0-2bb4-48e3-b1cf-9c09628ab467@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5df8aff0-2bb4-48e3-b1cf-9c09628ab467@baylibre.com>

Mon, Apr 21, 2025 at 05:40:41PM -0500, David Lechner kirjoitti:
> On 4/19/25 11:33 AM, Andy Shevchenko wrote:
> > On Fri, Apr 18, 2025 at 05:58:32PM -0500, David Lechner wrote:

...

> >> +/**
> >> + * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
> >> + * @type: element type of the buffer
> >> + * @name: identifier name of the buffer
> >> + * @count: number of elements in the buffer
> >> + *
> >> + * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
> >> + * addition to allocating enough space for @count elements of @type, it also
> >> + * allocates space for a s64 timestamp at the end of the buffer and ensures
> >> + * proper alignment of the timestamp.
> >> + */
> >> +#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
> >> +	type name[ALIGN((count), sizeof(s64) / sizeof(type)) \
> >> +		  + sizeof(s64)/ sizeof(type)] __aligned(sizeof(s64))
> > 
> > Missing space
> 
> Sorry, but my eyes can't find any missing space. Can you be more specific?

As far as I can see it's missed after sizeof(s64)
Also I don't like to see the leading operators (like +, -, *, &).

> > and I would rather to see [...] on the same line independently on> the size as it will give better impression on what's going on here.
> 
> As long as Jonathan doesn't mind the long line. :-)

-- 
With Best Regards,
Andy Shevchenko


