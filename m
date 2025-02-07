Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB791AAA11
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738964172; cv=none; b=X1bdDQV49XQp8IdmXdFkM7uNki8KzyUCoh+yqU8kT6KoIYhYSS+F9bI8WodcOgxm7Wzphy64j/SmlEWK8R0f2HFMBY6vjiLXqH5kN+wrx4eV7abtZynWvSI8r2t2unpOkYcRZWnYVtvzUSfbN/NBE5bk58agt6GhY1U3qVNWu0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738964172; c=relaxed/simple;
	bh=em4d7q4/4/lk2sf/I7ehijLHymxDwUlgAoCxq6MRmxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QlkqDhqFMS3N81I3g21igTweSigetwyX/0+jVQkwtl5c5G6G1KFz/OcxGgm5B6ztkGQysk8o1+pQodXdA6YTxJKWKas4sisd5dDkc/8AOzwgbGDdMxCpQERB9SsqzOPCDmlzfTei9kEe1+RYeKfJ5ak6OpJKkz/s8fTmpgsXG8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xconn-tech.com; spf=pass smtp.mailfrom=xconn-tech.com; dkim=pass (2048-bit key) header.d=xconn-tech.com header.i=@xconn-tech.com header.b=Vnv+s0Si; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xconn-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xconn-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xconn-tech.com header.i=@xconn-tech.com header.b="Vnv+s0Si"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2165448243fso63730415ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xconn-tech.com; s=google; t=1738964170; x=1739568970; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=em4d7q4/4/lk2sf/I7ehijLHymxDwUlgAoCxq6MRmxQ=;
        b=Vnv+s0Sir1HuRYK+GUvDExmB5B8OO8xpAQZfvRkt9SP9fD/av/GrcfN0QIktcqTF0z
         eZ8E8C+7ada1BQ9N/9O7yW96jULH90unKa5BnFUEiJxP0eQYrHeculmYVW3lP5f3IyZD
         21P8VJM4WgPwD0bEWmnbY8ZDgWVxvjpfEd9HZO9Yc7G8gbRrjJjSGsyox92JAe9c4mux
         Zq0g2pF8fonvE4MrboNFFH86JkHIP3HOfW1ocAxbI1u5n6FK4UTlc/BBZOw5xAJPyt2t
         hZ4sBmC6TuH0UcWF1fyc5nQ7Y/DbCFgdyMjuR+NMALKwhvWZbXjJq1QgzNsH/ZmMTBf2
         2gAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738964170; x=1739568970;
        h=mime-version:content-transfer-encoding:msip_labels:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=em4d7q4/4/lk2sf/I7ehijLHymxDwUlgAoCxq6MRmxQ=;
        b=QQo/oXGMUl25vzQv/HPR58uy119aJdPjdK9fAC29NsPbHwDmiEXDvmyFkmuBtf6IVv
         8prKmjR9jTusnfGn6jKlovVKAL4THxE8EYwwLpXY+yEMyeRHrnGbLRH6qaeosX2UtYCh
         Dgid/YjZETqDXLq6UNSwQAw+95SI1ikK96Hwg4KB6eyRuTgh/A3uybn2qu+jeQP1Wa8l
         kaXVAPyjVV8lwzxb8Xe0KIkHO9i0pTrowUms9O722Ufy1xdV4iwpX4BqyH7k4ZQkcR8g
         p+SuLgeAgwoEy2XDKegeU+YqrziS+ybtEFqep7cayDSb+OuJBM7+nHSE7eTjlSj2XYtl
         rIig==
X-Forwarded-Encrypted: i=1; AJvYcCWs8dCetu4mcu3mgVyl1jgFQHATKLD75wO51KAtfNZssjOaFacoXpOo1i6cp9g39Cgo54E23ER826hfwqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VupvSqKmyhLRkbZTZ3p0Kaiur18JM0ZNmdCx5hBRFJE1mbHD
	j+5pfGriW3MNtu5zZ2QJsGFDQ530ogkpAE3rYEaUGJUOhKXgRhp6muEi1OXrZH8=
X-Gm-Gg: ASbGncu4TLXqg2/DMxdZyRXnfuC5O/XhkjqBpEC8C5NqmddBLsPulrn2xhNJgnA47WC
	YNrYJE5mQmTwBCFDMDEaXEF/HjWanDvZTOeGOTva0bbFMu+x5/2cxp9NYWV1g6tcM1QfJzCdhQq
	PLPXoJQne0cpS9DzGAttdcyqwCZH2OlmryIPUJPqzooEbtYJ49W4+rDoxKo3jHzT0JH1GU6wIsy
	drWQ8tDRH+S1nGMO6SYJLQGPjAKoqE7wEask+2hXcfuNykpRElsbs6MUHlayITLYdQh5l0u05t6
	eAz5Di5Plx7quZBVTDAkEoMXNUCTAw2iiztjqNPMP0Ytj6k/6oXpKaqNHNp4T8TU0VqIJfh3y8y
	IBA==
X-Google-Smtp-Source: AGHT+IEWcjeawcc67xQoNXRrnfhYE5btFNPyPq9AzMglKKfStP7mN8XiNHG32+hzgHqIV2e29MeMCw==
X-Received: by 2002:a05:6a21:158c:b0:1e1:aef4:9cd0 with SMTP id adf61e73a8af0-1ee03a24237mr8893146637.3.1738964170273;
        Fri, 07 Feb 2025 13:36:10 -0800 (PST)
Received: from BYAPR06MB4135.namprd06.prod.outlook.com ([2603:1036:a03:12::5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c1623dsm3546663b3a.132.2025.02.07.13.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:36:09 -0800 (PST)
From: Jim Kao <jim.kao@xconn-tech.com>
To: Gregory Price <gourry@gourry.net>, Robert Richter <rrichter@amd.com>
CC: Alison Schofield <alison.schofield@intel.com>, Vishal Verma
	<vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, Davidlohr Bueso <dave@stgolabs.net>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Fabio M. De
 Francesco" <fabio.m.de.francesco@linux.intel.com>, Terry Bowman
	<terry.bowman@amd.com>
Subject: Re: [PATCH v2 03/18] cxl/pci: cxl_hdm_decode_init: Move comment
Thread-Topic: [PATCH v2 03/18] cxl/pci: cxl_hdm_decode_init: Move comment
Thread-Index: AQHbeXZwobcdjmN85EOzIwKkaoKPi7M8AI+AgABc9E0=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Fri, 7 Feb 2025 21:36:08 +0000
Message-ID:
	<BYAPR06MB413558D98731EBD422CF24E4A1F12@BYAPR06MB4135.namprd06.prod.outlook.com>
References: <20250207153753.418849-1-rrichter@amd.com>
 <20250207153753.418849-4-rrichter@amd.com>
 <Z6YurVy_K96jet3U@gourry-fedora-PF4VCD3F>
In-Reply-To: <Z6YurVy_K96jet3U@gourry-fedora-PF4VCD3F>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator:
X-MS-Exchange-Organization-RecordReviewCfmType: 0
msip_labels:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Do we have any limitation for HDM Decoder Range in Linux Kernel ?=0A=
We has observed that Linux might be hung if range is larger than 8TB.=0A=
=0A=
Jim

________________________________________
From: Gregory Price <gourry@gourry.net>
Sent: Friday, February 7, 2025 8:02 AM
To: Robert Richter
Cc: Alison Schofield; Vishal Verma; Ira Weiny; Dan Williams; Jonathan Camer=
on; Dave Jiang; Davidlohr Bueso; linux-cxl@vger.kernel.org; linux-kernel@vg=
er.kernel.org; Fabio M. De Francesco; Terry Bowman
Subject: Re: [PATCH v2 03/18] cxl/pci: cxl_hdm_decode_init: Move comment

On Fri, Feb 07, 2025 at 04:37:38PM +0100, Robert Richter wrote:
> The comment applies to the check, move it there.
>
> Signed-off-by: Robert Richter <rrichter@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

