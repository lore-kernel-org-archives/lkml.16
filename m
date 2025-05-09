Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4BC238D22
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808199; cv=none; b=j/usTnaNFvS9N21Bd22PWFh0SgZSDwST10NOZcGoh5QXPCJx73XExjFa17HRrpAlnhJ5+OJW8oPc31sWvRUeTVSno+wP66eZjlhus9hWzgrip/kES7RZZxUTzssZbCZta/TdpgDhLgs3NtGOgisRpvmvM2NzaYvIWtK8datcbjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808199; c=relaxed/simple;
	bh=HYHioEyqW8mZmmUrE6OVt2ezIQqZaf+AB1VpSgRB678=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxhAkJI4/xwOi3h6VJs9AoSm49TtjBEV6VjRF/O3AvWJV6QEfa1KvhR0p5oweKI4yb5uVY9XFID+JyO4hBmtd76I1WaOjCiDoJtIqwt9jDj7OeUxfJ68gIg4id6cak4qW69866d/AYpkBoUnO6waGL/k20wb7sn8fGOeDVdKYII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=CV9P3vh7; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="CV9P3vh7"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so29340006d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746808196; x=1747412996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5785CgqURmvakdTUlqL7nzZfk4PDQP9h580Dg3FiPk=;
        b=CV9P3vh7rMAhECyTq8bmdYAtRdrNxtVHIIeLBpqPM3GXPLyXBAu9nHsS/mhlwT2hPi
         ZE+flyIE4CDmF+Qj/G8/V/lSKMfWNpVj/eZu+bry7Lg277NxJHmt8ebzvIFne/mkfMUD
         FtHhvEwZqf/B/xJjWZ0RgfVR9aMdMRpTTl+ha7XsIU/PD3cFLnij1tYuOJg6Myoi59Cl
         RRthIR4AQ9YQuiSUJJ58dje5ja4DLO5pyutm5yWYFNoUpDo+tI0KRso+yzQgeEA/6iPh
         SCGkVSQvyfi1I7ZUfup38VGry54aGUItpRVJoaL5p2Qsx/FFpb4FQ09VrROH3g8wL+tg
         +VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808196; x=1747412996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5785CgqURmvakdTUlqL7nzZfk4PDQP9h580Dg3FiPk=;
        b=HC07zaSjrPqTgEM8Kbpx6oYCo5mhbLMfRW7G+S1eGOSzBfzQBuMj3toZKqJhfAgxvx
         Z/41M531TPoVdjL3qIgRVZjJD16JGIoHFosj0TgrPnA1DhjtzQ8S9RmORymIzjkLW4XY
         xS58Y4f3NLnTlpRkzx6AyYLBtE8Oq+s/PP2AKL/zJ1eipCzxjoy/ciP8wSwJfWgyOYux
         CdSo9YU/ghqJigL1QGDEdFcgtGyzkddzQ40ZLDWIUPw4cM3HQ4jikA+MDpyQut7ElaMz
         cAn/NDoRBsUndNEe3DcczxkNdjJq/Wam7UO8Me+P3ooLY4AdobwgAutOE+3TZtKjv7JD
         V4Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVECObqRrBVSSNPZyZQgB0xZnkLtTKBl6tP/pxT9ztMoPOudOmG/XMJxgwYeHgdcbFbjj/aMdwYTiHnNCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkE6b2D5pRYLPLxyYGgWndi60yLEeJ+Qa6gpcgRejHITxj7A9N
	gadYkyviuiIBmi7Gt4xwxGnKQoKoR4TctNi4MYrpRt4wxx4xEIKEWuRx8G/xezwlX2oWjeirRAI
	A
X-Gm-Gg: ASbGncsW5YA1uGZXz4BNQyuMCVflOjTfCiVqupVmQfdvS8X5bYC0lr/R/5MYSQqdHJ1
	DGF62XBPHa+pJ/CHoQFoxfBv9jk8+mWykDFh4rusfWlLCqF4eJbH3tbmHHh3xeGhZfIHTZAcX9B
	ft1E0mSFkUt8WlzL+C4wq486bMB43eaOHkdS9jFwclAP7prREjedIn4geLobvB2xN7pUsP+WuVi
	P2NfSQRPCTb2Luh+xumurc5gc7UywRIzNbEPaYW6gWJXX7w+Xw4+7e0w2kEXWrPzv2LH/JPOgAK
	6azXuUpTWzpH512r2AxQdrZHJGfSdUmpG/O1gDS2zgIsWcCrywUJxfJ51kFKgf5adJZkHWvHoyG
	wUwYvw+lnydL771hm10IB
X-Google-Smtp-Source: AGHT+IEWBlMz599IZQBAgkkKK9fYMS28rPCOCRFZ9kIcKUmFGu5/3dfLbCNRQQf4+cfmw8Kfeubc/w==
X-Received: by 2002:ad4:5cc1:0:b0:6f5:fb5:35f0 with SMTP id 6a1803df08f44-6f6e482d000mr52198896d6.30.1746808196114;
        Fri, 09 May 2025 09:29:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a0bee8sm15632866d6.54.2025.05.09.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:29:55 -0700 (PDT)
Date: Fri, 9 May 2025 12:29:53 -0400
From: Gregory Price <gourry@gourry.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Rakie Kim <rakie.kim@sk.com>, joshua.hahnjy@gmail.com,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	dan.j.williams@intel.com, ying.huang@linux.alibaba.com,
	kernel_team@skhynix.com, honggyu.kim@sk.com, yunjeong.mun@sk.com,
	Keith Busch <kbusch@kernel.org>, Jerome Glisse <jglisse@google.com>
Subject: Re: [RFC] Add per-socket weight support for multi-socket systems in
 weighted interleave
Message-ID: <aB4tgSP2r-2s-1ce@gourry-fedora-PF4VCD3F>
References: <aBuMet_S1ONS1pOT@gourry-fedora-PF4VCD3F>
 <20250508063042.210-1-rakie.kim@sk.com>
 <aBzJ42b8zIThYo1X@gourry-fedora-PF4VCD3F>
 <20250509123131.0000051b@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509123131.0000051b@huawei.com>

On Fri, May 09, 2025 at 12:31:31PM +0100, Jonathan Cameron wrote:
> Anyhow, short term I'd like us to revisit what info we present from HMAT
> (and what we get from CXL topology descriptions which have pretty much everything we
> might want).
> 

Generally I think if there is new data to enrich the environment, we
should try to collect that first before laying down requirements for new
interfaces / policies.  So tl;dr: "This first, please!"

(I know we discussed this at LSFMM, dropped out of my memory banks)

~Gregory
