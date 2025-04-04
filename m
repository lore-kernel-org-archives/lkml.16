Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8282E62B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 01:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731450; cv=none; b=Xakhq2/FVCTjtNGDNrzsD+YCH0eqng7eBkxPAIsc5guFNbmrl6Hma3ytqP3pNbG/WN4zCALuhCrKHeA+rIeXqrSpei5Rjgsy7zclWEhPO74VYz/BKDYCBmXioLS8rUgNZlLusxx0iXE4nXozB5icdp2abgna04adT9462NqHmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731450; c=relaxed/simple;
	bh=V2YWFuijqlJ+cy7CyrQuedjLS1wJNZm36ZMN5Euzk6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7INHH94aHwsf/g2/uNgtR1nZucA6+eEYfsE8QGfqqB8m/m+p6xnxYqW/y2aDrOsKUpKotkWwSUF6WCKgtmva8oHstPaw0gLvxt/WR3/9G5dMpxuxVL8OyHrCI+XnLRJNqlyW0aOv5XerbGmHToXl8lU7fI2zCeW3HRcmYGYBuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LR1ECD5H; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LR1ECD5H"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22403cbb47fso16574115ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 18:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743731448; x=1744336248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xkYgl4zr3nXqdErHUjkuxoKSDXxbWnctKWg4ernvjFw=;
        b=LR1ECD5HmN6r6qZgk6nl/6cQCMfntHfukxF+bzKkJSRs3frph3R3shD309Tjq5+n/k
         d/t7ilmmOIABaGtbVmaYQq0SJ3uzmRM3GSEskT5UAEB37jCMfK55ZjfG2HvM1X2/7d46
         SPWojG+zjLKL8cAE1saJab4ZbxNI+m+g5OGWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731448; x=1744336248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkYgl4zr3nXqdErHUjkuxoKSDXxbWnctKWg4ernvjFw=;
        b=UbZkMMwKZv//Vh44RGPqgK/FHCuErlgBcbZ/gKcvUaNdotOgkUUPyCUm7MYa4CXZaC
         wHR8XvfIaoQJ1a5M3isEPnm4bqdOdYlm+xqSfjF5cnQ9Ju2GjW+gtDwVPKEG2idcyKwj
         uzKGlkk2440AFoMgu3U/FRdAutiCyq1SfETRcLmgBIqRSVsxBWGypjNeHTd2LjcW/pnO
         Q6loY7Og6J9udatoJdoAy0zbnUlJRLRPR7gqE4xP1dLo8C35Lc8NcvBJoFwu5v3yEHu5
         63Z+UR5E+gYT5iIWShgIEtzR4Ui3IG7NAAeOWQ3TVrdhAoEHpRGu0PVy/UFFwvRNNq90
         9tHw==
X-Forwarded-Encrypted: i=1; AJvYcCUOfSH9xlx5v/cV6FYIKpAe1YB8JA1y+h/rldPbXh1CKe4W4xBMjAEcrQKMA90zGtYPmI2YrwW5LFwMtE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaOsnRUPp5G7NxOTQdAz/tPvqwmOdxcmu1H2D9z+Ji7iBF/Vag
	G27tv/jeMpCdUNSHa1ptaM3jYZSdn4AKkVuJsH1gH97O7qoOViH0vcc8nfb7kw==
X-Gm-Gg: ASbGncs9x7jwHtWCUljhoKZfT4AW5aftev2rCA+JxrCaItWqqZIFBG4TYddjKUe6LId
	eAKn138+1rQhBh7IPQobTjsrfwHxeWAx2nXJLB0HO4yvcykYzyY8zoMPWs4RGL7D2Kq8O8mFFCT
	Cda4xwt15+0lWv9ZGRfPAOoXtDl3yNzwg7fpixo3/E3G3+xG4GwJ8lKeSJhbOHQuUVRkVzRS077
	1xti7H44oT4+0CCdITetDkxzA8EOTdMx9FDoJcfN24Fi404HlkomWyjVXDR33jzhJ6U0pR8VoB6
	YtRZZPFUuKPXfdJ1TQPL3n+fwhSDHOQWNXbKQ5C9SFp+2pKQICaKEgVqs1w=
X-Google-Smtp-Source: AGHT+IG+VhyB5g//5WwnbEL9f4OcluPDZI0996O3JkznfBYQQ+pMS3M04Xzgt1Qg/Yhacit6cq/t4g==
X-Received: by 2002:a17:902:ec8a:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22a8a8c99fcmr14437925ad.40.1743731448493;
        Thu, 03 Apr 2025 18:50:48 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:addc:e770:41f7:fb85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865bda1sm21348525ad.131.2025.04.03.18.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:50:48 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:50:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Brian Geffon <bgeffon@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Richard Chang <richardycc@google.com>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	sawlani@google.com
Subject: Re: [PATCHv2] zram: modernize writeback interface
Message-ID: <6555ksohyt2qvigdxpcdg3holtxurmoot4ocdahdtyunaaxx4b@jwlzy65jm5ob>
References: <20250327015818.4148660-1-senozhatsky@chromium.org>
 <Z-7yAWG3IE7dnOKi@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-7yAWG3IE7dnOKi@google.com>

On (25/04/03 20:39), Brian Geffon wrote:
[..]
> > +static int parse_page_index(char *val, unsigned long nr_pages,
> > +			    unsigned long *lo, unsigned long *hi)
> > +{
> > +	int ret;
> > +
> > +	ret = kstrtoul(val, 10, lo);
> > +	if (ret)
> > +		return ret;
> > +	*hi = *lo + 1;
> > +	if (*lo >= nr_pages || *hi > nr_pages)
> 
> I think you can do just:
> if (*lo >= nr_pages)
> 
> The *hi > nr_pages check seems superfluous given the
> assignment directly above this.

Ack, thanks.
