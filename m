Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742527E1DA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399935; cv=none; b=RYrn3BH0mhpsxCygZNWAas0zbbWnoXQLnrOB0+Pd4Y5AIM8pLUVkCvReACo7qlXuhrKUi9oGLQTbT+vIcs4V8UwG/LAYDxIA0pq2PLIytL63eCrAF4qFLVo0T4VQ7PvlNF9aSk4TyLxilgq4gZsklKe42UlrFqO2z1tTZmfS1QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399935; c=relaxed/simple;
	bh=OYfHEfa8QuOBnyzwI+6jqRFVv8kLSMlrRiyOwBu97Lk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ruy83x950SV8CiCiIMXSAa1uwH/ME/XH2yEeOhOhJb9gq9wrNpHb84pR9HgLtHWQ4UQn1//CIxGrgnNYcQuJwdAqRShEmO2i7HZvhXovGWgW0PHaPzeOdSVUdDe2OyX68mHmrj/ZntRdkW8a5m4bP/9ulxQGIxNAnyP/y0tABm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 9238f596-170b-11f0-963f-005056bdd08f;
	Fri, 11 Apr 2025 22:31:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Apr 2025 22:31:30 +0300
To: Alex Elder <elder@riscstar.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	benjamin.larsson@genexis.eu, bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk, devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] serial: 8250_of: add support for an optional bus
 clock
Message-ID: <Z_luEj85iz5n8vhQ@surfacebook.localdomain>
References: <20250411154419.1379529-1-elder@riscstar.com>
 <20250411154419.1379529-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411154419.1379529-3-elder@riscstar.com>

Fri, Apr 11, 2025 at 10:44:17AM -0500, Alex Elder kirjoitti:
> The SpacemiT UART requires a bus clock to be enabled, in addition to
> it's "normal" core clock.  Look up the optional bus clock by name,
> and if that's found, look up the core clock using the name "core".
> 
> Supplying a bus clock is optional.  If no bus clock is needed, the
> the first/only clock is used for the core clock.

Okay, it's slightly different to what we discussed, but at least it looks much
better than previous version and acceptable in my point of view.gq

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


