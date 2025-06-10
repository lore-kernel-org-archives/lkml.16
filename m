Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB4A25B693
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749521953; cv=none; b=DGZ0DpJqNZAZNaFzKJ206s4NxTBWGc0vIXOxHmnjUymZivzRjVX/YHS3H5ZRLaM7oB404nSVuQHscCJc4V5vv0arySdmgMx87fyaCfTWG2ZrMbiIw/1MHJI1/FrwRfyZyt86OSpGrDGhjkFCavhTwBlHw3wJJecBTA+x0IlOeKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749521953; c=relaxed/simple;
	bh=iWFOP9WZlja72I3isuQU8gJM0V8eA2F3TVvhPtI8VDY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fk+CMM7514yXh13xyj+vGuHDuczZU237KdxZKO3y5Kpw6lyHPCtOIwmEC65Rn0uLkJZj+/DAelgyT/xzYSYvcmOtGqyZTWdjgYrQyOvZ699vD/rK7HQL414B+bopkPLgVm9V9yUKk6iMf3eqx1jb5iw4cnOjdTLCS0aJlZnxOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dSeutUWM; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dSeutUWM"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6facacf521eso52457436d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 19:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749521949; x=1750126749; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LRLnIcpkOxwkeEtbycns6xLH/gYtJX4X9M+po25lPww=;
        b=dSeutUWMZuAUJYK37xTYOTml4PucB5nqFMFt7al7jQR+k9GmPsTscWIbPDelXwPcjI
         q+iLEgaK37yOP55fdMc6Py4DhB5uw6SeRwXXX/tvBhMiqRmf6bytHmfePW6HPWIBWGTz
         TjVxwiZYQ6XCRchupc2gwUuegZajJljn/a9GOk/lwR+9wWXQzASRulzVzFaCYHXoPOKx
         0/49sa6YA8UAgS6ju8Pkb1Oy4pq3Y0ymAeraJAU3nUoAO3+7DiRU9ZU7E865DPdempAV
         KKCJ1b05rET49FesJukpUh96gQ5+0M6kIsJoDWnk0wD82wBtQUkwoepJQfhuqT6cISBr
         Zipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749521949; x=1750126749;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRLnIcpkOxwkeEtbycns6xLH/gYtJX4X9M+po25lPww=;
        b=oGRH3pB4CeLY4rSrysl3TjggYtIS/z0abR0JYr/oPS86MM5EW9ruuPJmuG0jkZAgwW
         KiPkosH1NKkDVXxpdmJlrI4kD+f/Fu0wy2Vs2xtb6jbtqiLpUwEHJWVTzVSe2aA0w/uC
         Ai6MPfJU+z5crTr9XSrJLN/KgzbjM4eOpir0BE98R0WC0WIncYmf78t4OAFOST2nymLX
         fabzzMoX5f6krOp8iFLVdSduAjDR72yQYl43CRsUNDmxNMzm1aQnpkSvXNtaBlR4k2cV
         FxV3bjHT24TSLk/Q9I9sLqGR9bKn3IIVJSTrzEvZSRT1W7NqG1XozejvcnWnmDKYGgVk
         zUxA==
X-Gm-Message-State: AOJu0Yz1twzEby8yE/KrINhh8CJA/qUuNdDD+wGMOXEiRsBqN/8rvIS3
	Mzn4aHsWBTq7lAKo89u4XkaXXCYzP2Pbt1Qa36tZoUnRd/ALtqAoTMh+7avjc6NMFLU=
X-Gm-Gg: ASbGncu8LJLjJyj/V2tMhouUJDSZUupp9Xufp+pZyhiNKhLa9NoXhtDWm0yi9JUtOxv
	8rGCTnggO1n5UoB9A0gnKkzLfbzPDvIc4XePfPIouJEzpz8O1binFM28f3xBSDla/N/5JxW/Zqq
	hNIMnRmAjBsioCNA15miI4mYPZ1Sre3EmAhVYilSlVG8YQ0VYyXE3cXTxHBWzLuPaF4TuGayvL/
	6Yj7h6uIBflAYaCoEvB0m6zZW/3wzsYlZ3yk7VUQ9Xi/QjpsYSZz3bwF2IaWhNpAbBYg31J/aNU
	3cifTeU9joiDoF4akJiKHJFifHyNGr0IglYAZGcHpabgTeUO4AELEbQpyrRIc9PtCT15Pmcc/tH
	qJl8VB2GAJ27GB7fymxcmX6JIhq/be+ESpOI=
X-Google-Smtp-Source: AGHT+IF55VFE5OHV9fkwOW70kmDImiJTC0v7JtnzSCoxcmtKHEv5DFBDHaeZWRIyBnJYWWiQyGQlAg==
X-Received: by 2002:a05:6214:2623:b0:6fa:ba15:e7f with SMTP id 6a1803df08f44-6fb24c4f370mr12979286d6.9.1749521948941;
        Mon, 09 Jun 2025 19:19:08 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b1cc2fsm59712066d6.74.2025.06.09.19.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:19:08 -0700 (PDT)
Date: Mon, 9 Jun 2025 22:19:07 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Randy Dunlap <rdunlap@infradead.org>
cc: linux-kernel@vger.kernel.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] vt: fix kernel-doc warnings in ucs_get_fallback()
In-Reply-To: <20250610000251.282760-1-rdunlap@infradead.org>
Message-ID: <6rr665sp-3q45-66q8-snso-5071q34q71pr@onlyvoer.pbz>
References: <20250610000251.282760-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Jun 2025, Randy Dunlap wrote:

> Use the correct function parameter name in ucs_get_fallback() to prevent
> kernel-doc warnings:
> 
> Warning: drivers/tty/vt/ucs.c:218 function parameter 'cp' not described in 'ucs_get_fallback'
> Warning: drivers/tty/vt/ucs.c:218 Excess function parameter 'base' description in 'ucs_get_fallback'
> 
> Fixes: fe26933cf1e1 ("vt: add ucs_get_fallback()")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Nicolas Pitre <npitre@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: linux-serial@vger.kernel.org
> ---
> v2: add Jiri and linux-serial. Mea culpa.
> 
>  drivers/tty/vt/ucs.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- lnx-616-rc1.orig/drivers/tty/vt/ucs.c
> +++ lnx-616-rc1/drivers/tty/vt/ucs.c
> @@ -206,7 +206,7 @@ static int ucs_page_entry_cmp(const void
>  
>  /**
>   * ucs_get_fallback() - Get a substitution for the provided Unicode character
> - * @base: Base Unicode code point (UCS-4)
> + * @cp: Base Unicode code point (UCS-4)

Please delete the "Base" word from the definition as well.
Then you can add Reviewed-by: Nicolas Pitre <npitre@baylibre.com>.

>   *
>   * Get a simpler fallback character for the provided Unicode character.
>   * This is used for terminal display when corresponding glyph is unavailable.
> 
