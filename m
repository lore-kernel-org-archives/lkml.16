Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07FEEAB
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479607; cv=none; b=s8lbSZ6yIlSQSTcHYXsSYYVolha8cmKezXXynAkoIp3btlvtmv4fOssCsQShKRk0UcVqswjJUVRB9xeI7Vc2EpDk8Ho80rMNZpvaphTye2PBbtjce2Mv+9gkPyasv1QBdHbf2Trv/XxH+IYx+cwhwM1gEn9oRFsRizoKpnsvxD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479607; c=relaxed/simple;
	bh=HP/WhTxziQVM+paBe1lFLnJ6/097Q8CHJV3vzqlwNl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/pAR7VU5z2x9lXitKBFA0C9CyI2nKrYrolmacAn7D3iRqEIP1T35t6UEmHiMYlacSSS2+GLVuDjAEPsCCVfOgFT8gmuHxufcgG//+lctdMfR2foKxkeCWiEu6HapDdyTj4tUojb10EqdT5jcxMDnu5hUtlJw/7bjDsH8DXPSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt4v53mw; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt4v53mw"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e5e6ab7b8so36245147b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749479605; x=1750084405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pPjaX0s13n6k9bjK7KkQT+omwziVmM6GPBjmYv9g0M=;
        b=Tt4v53mwisPOFpoJRuXczMbTUaNmDIXE/8RwWW6+D/RyWtGy1oarMco3vH47UbQVuE
         ocbvGM83v5G5TjE//ITWbYqTcp2XJ3L3SPoNtLkLQndvEGc5gaccQMqo/HDJgdrNfsba
         0azMSxx18s9Qurg170wU1cYDi2v5l8i/zBgHx+APjCJmiE2uznXvlODuH83LaY5jXn+V
         2eR2v3TETi4Ft71pio9tz/2BgGhCI+mhbaU8WBTxJ00MFlPLl5Cix4dXybxUjZzwCtU8
         fI8KEUhxCxTIo3mH9a7h4R3JjR7sHqYfmFyIYdB/oihjRwx1UfkwXmwElkib+6GDqEgG
         5c+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479605; x=1750084405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pPjaX0s13n6k9bjK7KkQT+omwziVmM6GPBjmYv9g0M=;
        b=S3dou8PQ7k5pnQ1i42APUMVHUBiELWBxH2j66vJTbeXhZlHKk9POftQHKJUSJZUOn6
         6H0b1q26+SwW56GAdMa2giy9IQdVhBHxiaTH7UPaFHmUb3EFXNk0p98KcL6cO+he7kdR
         kz845zJKp+9t0v5Y0/4/0iP1c29I45anGtnaNTu+bWIw11jkvoPb4X9E9aWzbrax3w6y
         jHyS7v3eQzwtZ+onbMQWJlXKtUm51Mh1nsbYrc3H+eMifQXrcqhtOybx8PYEnexPrlp4
         xYZ6KHTcL9giM+fuqDsTWFS5QCBVvobgOEh76gZgMI6Fga3FVs1gEO5myEI3KF1MPZkn
         pe0A==
X-Gm-Message-State: AOJu0Yy91/v0bWFc2uc4fITVXODDJUu6hfNlAsXFwJzoOIbogcN6p6MI
	nChZ1AT/1yhRsRx6mUnE1w/5TAxlr+jnv0OjUGVbfFGunAsvQmGlce3Y
X-Gm-Gg: ASbGncuawSAlufoOqAo2NA23c6Dsk5HaczUDPDn8FMx2H9YKXmlBe7B1utPw77k/c1O
	yEgvVRD9gPfMPTZ3Cl+T9iZee8egt0HcgktX/DzuSoZvDUKQi0WrxM+4Kv3UKE54CQxbWkJ225p
	FnhnFKiSg+4LOqX21EMDhyf8bCe++mCRS76+Tp4fotjf38AKICyYF0QFt0o+j6BNF8cU/+Yp8Gc
	TpWROmhfD91Mkfum6vTt2uhk3AxLVXYnJ7hxi7FAj4SYp6fnnOUA1X6wISC6dv8Fe24p8Xy84sE
	pZof2F/zlwinfg/HoFgQoCRpUDiLA0ft9DzEyEi6eiYlbxfJNImPlfHKW8xM+W09oVpKBL2OqYg
	sVjO8pMzIbyuYe/nxz9jtAw==
X-Google-Smtp-Source: AGHT+IFCOAtN9tjJ3BwRzlJY2Hc8JmJKdcDMhMxpbkkDw6X60Vaiqf5UmTiK4UUKpEx7zxZ+Oic5qw==
X-Received: by 2002:a05:690c:4d49:b0:70c:b882:305 with SMTP id 00721157ae682-710f7786d38mr181357167b3.36.1749479604597;
        Mon, 09 Jun 2025 07:33:24 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710fff86d43sm11448467b3.11.2025.06.09.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:33:24 -0700 (PDT)
Date: Mon, 9 Jun 2025 10:33:23 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] clocksource: Fix opencoded cpumask_any_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEbwsyJyqm7WYJkJ@yury>
References: <20250607141106.563924-1-yury.norov@gmail.com>
 <20250607141106.563924-2-yury.norov@gmail.com>
 <8734c9p6z8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734c9p6z8.ffs@tglx>

On Mon, Jun 09, 2025 at 12:03:23PM +0200, Thomas Gleixner wrote:
> On Sat, Jun 07 2025 at 10:11, Yury Norov wrote:
> 
> Why are you so obsessed to slap 'Fix' on every subject line?
> 
> This fixes absolutely nothing at all.

Opencoding helpers is an error, isn't? That's why 'fix'.
 
> All it does is to replace a open coded sequence by appropriate
> function. So describe the changes accurately.

I'm not attached to words. If you prefer 'replace', I can resend with
the wording you like. Please advise.

Thanks,
Yury
