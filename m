Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884281EB9E3;
	Tue, 11 Feb 2025 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739273288; cv=none; b=bgM2ImBoOnpXS/JueLJ6t4OeJYuY3zyqLS2GCXmApguK1hGAyQHYDDVsKdCUPJ/Dr8b29WpHLgTtT+TKANsKmaYXGe7M4SigfKHhEId/7M8mx8pBgulj480JZPxfJViTvFamQ8wcE9nI1o8l90UfbGuqLSyJ7byX//29nko6BB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739273288; c=relaxed/simple;
	bh=VYTh2Dd5YpFdfEp44t+vH0d7Jh/+1s7ZwElHdQz8p/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZX5WZgQXsriypiEDR85+x61USGJQAJbYxdr7ezzNQ8TWpIF9sn1wJfM7akbX8JookpclhA/9pw9KUPcRwBtqUuqTGtPQa1y236vU0gwj3Oe76FuPNcZ6iAVyk0TkeyElmQOMxqmYjtdtcNY7G+BSShJ2WHiC3OR581YuTtOITfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PDDdP85a; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDDdP85a"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so13826395e9.0;
        Tue, 11 Feb 2025 03:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739273285; x=1739878085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYTh2Dd5YpFdfEp44t+vH0d7Jh/+1s7ZwElHdQz8p/U=;
        b=PDDdP85a/7Tr0AGRjLPWj3iKVAMeK4PfKP1mBAnlKBAaKUUYYwiCbPpsrslGIAAUUS
         b3xqNRgsDnXTtQ1YeCQYAhrN/Ye5X0kdDRz8Xxb0rU0sKsUQT162ivfcWxE9p+TLpMJj
         Kf9m1TxaOCYwd6CZoF4v5gcYuRFVmXS2bcKZAXHXDyzDnfLcn4iitv8Rkm85/XsXOYqs
         kdxwLxLRRK+fL/QhyhECoHdh2H+KLe5oTzfRCNsSgiDDTS2z+WlRxF7W+1noOcBdgpNr
         Q87fPYf2Ap5kFPwOar45rmmAIuPHXZsJTqeabgk/t65nDysXx7GW1sagcuDyjQRCrcI2
         lj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273285; x=1739878085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYTh2Dd5YpFdfEp44t+vH0d7Jh/+1s7ZwElHdQz8p/U=;
        b=EeAso59pstjuBsctr0I5aDkXwtaLZotPn4hwvvdPHlhN7ycQRSdU5qJji4/b5Q3Bnw
         Qa9zHRJ3tqQbsjRGNVNmFLQnm6ZMV7MQcIsjitcrzyILie2M3RZ6mm5BMyT+9PVRoJkU
         FrDHNfxtEQd7D+bWA6eibJL1yWs64PXOlzJvw9N6Xs9Q9N9ntGi9YZvfbXvpYZwT9nCN
         Hp5mGJAFD10tm+6y0u9c4JKAa2vvY8l7bNZHhoSK1hHXzI711GgLIAZBrrTQJ5GxjBTH
         REI/IX/cy4/LVw55Bwb/h0cpNG3F3DRjpiMYgNCRIw/KB6Puo+RPk9KQejhFI4O2K8gG
         fNYA==
X-Forwarded-Encrypted: i=1; AJvYcCUitlaPRD7LBfs4fC9mO0vJjiU1y2wXKLUNBcEYYmjZ73bP+MPxdVWcIqRrSRECnrR7fIdmqeJtzVR3yHVS@vger.kernel.org, AJvYcCWpxZXpis/p+mGAcXIJn0vEbj/l6vO8P7lJEnifn0ySenHWqjTMXm9Xe59IAi0Kh7jw1YVuPEZpkC8Ft3Lk+PI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx89sJ52pAecmXDc1DWuI7/Fv5L+lJJYtiSb7fnYsj/81RwRd6j
	Q/h8R6uQdrTgxdnB+Tljn7PEejfIYB+Vs4xdzhr9qhVXwUiPoLXE
X-Gm-Gg: ASbGncsN56EbRfaYSCjJaYy9rTsOGOTermKBFnCpzfVZXh6u8nlv+3nst0H6YtBVuyZ
	r50j8QbJgP34In85ogkxhWuU4UbxPeFFuJ/0pfhv4RzhEckOhyJQ/2scNmH4Xv67KVYhROKTRhs
	Hyd3V0aMwE+Wfa2QMdO1/ERs6UZ5pQQylXs2CyqWPja3c8mBtHMuQWSwmtJYf6LGzpWInVY8xjv
	s1oOY+FTZ9UBWStcLOCiOzbA0n7amR8gKCMLi8VgAOUrIpjffUAFwSOxCnZnoLIk5WeY0M7nY2m
	HPOC5BMzPqc=
X-Google-Smtp-Source: AGHT+IFjtzrrOH6AEcWqOF7uAUp5Krt174vzd2ADL15QEq43Z93qXvsdyAqa4jtx3B2VMmowJ/TvPA==
X-Received: by 2002:a05:600c:34ce:b0:439:3254:4bf1 with SMTP id 5b1f17b1804b1-43932544f7cmr96377755e9.8.1739273284557;
        Tue, 11 Feb 2025 03:28:04 -0800 (PST)
Received: from void.void ([31.210.181.104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394127afcbsm71091105e9.23.2025.02.11.03.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:28:04 -0800 (PST)
Date: Tue, 11 Feb 2025 13:28:01 +0200
From: Andrew Kreimer <algonell@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dave Penkler <dpenkler@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] staging: gpib: Remove unnecessary TTY_LOG expansion
Message-ID: <Z6s0QYoEZf9gJqAv@void.void>
References: <20250210121552.33455-1-algonell@gmail.com>
 <20250211093051.15993-1-algonell@gmail.com>
 <2025021119-unsalted-shrink-1211@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021119-unsalted-shrink-1211@gregkh>

> What is the interdiff at the bottom here for?

Indeed, it is pointless here.

Should have sent as a separate patch as well.
