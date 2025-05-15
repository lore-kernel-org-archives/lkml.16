Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18CB28850D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 21:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747344188; cv=none; b=ovSfzRiQtT7DFcjx+SkCTlLdyG40FDr9tzxX3pKG4U14r3Pd1d1bQHpOk/2mixM/d1fR3iyxea/JpmYrTEm7Dzsoqbo7d1d9MKQPStQJ7cNHUIp4NmM9wF9Ry4EJAv293lazEcGOj+6qOrnqUeJdQmhMPVKL3M4FZYAd08UyFzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747344188; c=relaxed/simple;
	bh=+v2m516QvbGYBKfi/pMhQlfalyotHroa/sj6Ka7JSlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EABYPrTE9FCqXs/1zGTpWpjhoBLrnH7/DaqliHvn55sis+E456CJcue/4xBYQs/jEPESPlyNxi1hB84qTAPvVvr1lOXtVsglf0M31syJ+aImeRbyOqPYbV6PXlkJb18RCotJqyTvwt5IPm9pPSM5PcXrAX9OM+8w3eVViR4OrvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fkozMQSR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0OCGUCVV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fkozMQSR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0OCGUCVV"
Date: Thu, 15 May 2025 23:23:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747344184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5iIFeo6O7a+FmPPxM3+aqXWh6DxJ61TKF8IDMK86uk=;
	b=fkozMQSRDGGeReHeST34I/MXiZItU/IpCCl1Ng6k8G19t6EFN+L7P85FJTGbxbl+UmZZ3d
	L1gcug0UtXxI9r0/aXKCnQytai9Uot1UqMUleeydwC4PPYMWQsCGd+sUExwnXB/HVgoC15
	oaIXS0ULZBVrPIu7zkx258SxZygI1BoVRr4gGXYZRXXU1aXyUrfskVHCIt8ZMGdqdWJSdI
	aZ9odJKsQpcJbMqhRQcXoqldtVIgsqBONh6wXPyofKYeGNbLo+NfXjayfesXbXWPZug42M
	mUt8VNQrs0LEuoKtL6VWdzSBJi7y9IWQUyiWioXLthyplxDxSdzp1+TrU7VWkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747344184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5iIFeo6O7a+FmPPxM3+aqXWh6DxJ61TKF8IDMK86uk=;
	b=0OCGUCVVZxKYLswvMP4IOZxXAD60fyWEmcAcAaUlbgtsr+IbCShB7ALmOe3+0s6dfw0/FX
	j3qpTbCvudzuu7Bw==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 04/26] x86/cpuid: Introduce centralized CPUID data
Message-ID: <aCZbNjoOa5hHQAew@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-5-darwi@linutronix.de>
 <c86a3750-7b5c-4ba9-b1fd-1d8dc41c7d72@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c86a3750-7b5c-4ba9-b1fd-1d8dc41c7d72@intel.com>

On Tue, 13 May 2025, Sohil Mehta wrote:
>
> I am finding the structure names a bit confusing. Can we make it
> slightly more descriptive since they are directly used in common code?
>
> How about struct leaf_0xN_sl_M or struct leaf_0xN_subl_M?
>
> The actual struct names would be:
> leaf_0x1_sl_0 or leaf_0x1_subl_0
> leaf_0x4_sl_0 or leaf_0x4_subl_0
>

The problem is that at the call sites, even with abbreviated variable
names, the lines are already wide.  Adding "sl_" makes things worse.

For example, at patch 23/26 ("x86/cacheinfo: Use scanned
CPUID(0x80000005) and CPUID(0x80000006)"), we have:

	const struct leaf_0x80000005_0 *el5 = cpudata_cpuid_index(c, 0x80000005, index);
	const struct leaf_0x80000006_0 *el6 = cpudata_cpuid_index(c, 0x80000006, index);

Making that even wider with an "sl_":

	const struct leaf_0x80000005_sl_0 *el5 = cpudata_cpuid_index(c, 0x80000005, index);
	const struct leaf_0x80000006_sl_0 *el6 = cpudata_cpuid_index(c, 0x80000006, index);

or "subl_":

	const struct leaf_0x80000005_subl_0 *el5 = cpudata_cpuid_index(c, 0x80000005, index);
	const struct leaf_0x80000006_subl_0 *el6 = cpudata_cpuid_index(c, 0x80000006, index);

makes everything overly verbose, without IMHO much benefit.

I'll sleep over this a bit before sending v2.

>
> Avoid using "next commits". How about:
>
> Generic scanning logic for filling the CPUID data will be added later.
>

Makes sense, will do.

Thanks!
~ Ahmed
