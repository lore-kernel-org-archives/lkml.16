Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFEB86358
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897745; cv=none; b=Ha/uJPA42+CmWPCw2ciB0XGoVuUSEXBnvxSYFAf9mtOGrXvsDxqStCoINnFB7aCHgKoo7S1nPHI2j9bSSiX6LSRYZVR0FGhb6W5zAFVzHstclkE/iRkHi5nhHAvHCN1D+p97CceXQH84KUyJVahoqhqfBhfidJY1qdFpuAfv9vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897745; c=relaxed/simple;
	bh=/G8aJT+2T51yuf1WMDS23rZs0mn1rjY5FgNlcDdfeVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ln1Vb7rCtwBYmzg8LJU8BkRFEaAz8bUdPhQLa8t83HqE29kzN7rHOBgyn3D/lp+gpCEkG4aRMgyQYCeGOpgvg+sfgfnj1f9tiCOdrgLNhDHfKxxPUzNgv2bfP4bUEaSXs5LZkU2nXPtuUBggRG4S4KAiieuEox06GW8gBaK7gRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=HQuLgu7y; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="HQuLgu7y"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so9778196d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744897742; x=1745502542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TCJlmAze3Kym1WnCOQVGanklH0i7woN3rI47oROiF2o=;
        b=HQuLgu7yWdAWzRZwzRVfrFpyE8udjgf4nbyz8nte29Hu4PtLkW7Xki86R55JZZtY82
         BL6OQy6iBrPkQyv1d/nw+jaKCdarKuo6AipAcALwI+54w1DvqnW8XtQf9oGQ2dg/h8bt
         TLy/DSgaPnoaKoTjOohfMSjm4SiRIaKFmP5oP7d8CHC5++X+XXxkktQe5pY8jLbGbSCp
         bkIe1ysVMmTrhGTmJl29aC1gj+ZapMsXq+V+q25JdFHh7GAgC9vEXnJ0bRf7fHymvG3W
         yR3MjeH11r0LKAXwrYPqvNDvuZvTcGii+GPN5ImqTkQTez6zpa0KsT3ouh8djALm1luX
         WS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897742; x=1745502542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCJlmAze3Kym1WnCOQVGanklH0i7woN3rI47oROiF2o=;
        b=jd7ezjgwjaC4Lp1x4g+TUTPEZE3lc8cpFWnUFwrC3KnlQxINCR/jDWIfIfZ8un/gTU
         lhP7G0U8iaRHCNvTai4EgqqGJiCX3nSl/AyfD94q/ImNGNQdofbsqI/4j5mLtbtV/1sf
         UbOcvgVBjJETA4Dqa2NckR5J4vx9vWwNJGWpOHtHWoQBnGjDqvx9ePPunAzTpDpAUyMH
         WKCsRUQFpMBplEoX3OYxfy99xKlUnbgvPn6W9AZPwVlcfmHhtrCjGidXU9FftApPdYGF
         w+UdijPFF1G4MUaW85CW6LnAWs0z9FBd04dmxNMmwkM420EX4EYRUcwi9PpGIxnx1dwP
         jp2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTMfo8yJMDmH8BCPe7Sttk5MiV+XBKN9Mm4QIaacRNOrG6C8VnkFTjtwkFXoqhWgtmBGd3l7el0R6gD5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykvw36Sb+5Qx0O8d56rt27XRqi4NHYdvjNyqPF1Q1ug6Lz9lvk
	KJ8IZlC7SJ8hPEWde1EjW6nQ6CNjtCU7uLcBLlei+jOuF3mpqIoPlZRy6k3kcqg=
X-Gm-Gg: ASbGncuAuF4eOK4fmCJa1IAWf6rqRm4uN48s6DVv0mlDyZp9D10H44fuRxuSxSA1A4L
	m6liVV4PtcQy5Q9HhnS0AStCcesOeWbezk/5/bpaUQLNwcErWnsrv5Kl0c58Do5IBEACC14HBo3
	KIHLSIkfG6RGOBtvjhVJWgWF7Z5yyQr0zvxHfys4/4FG29sHzGFTVmbWBOKHoHjcHfJ7MQ+vb1s
	wEgBIxRI2JcxsjqLhweSKbBWcP2Yd4m4C3VbP2IgvYlG9eS7E+c+jbKS2VgHRQPAas9NtWpm1BK
	BJlQtRu9Ll3ZBBQm+Rp2IGfQ4DduPyC1+laTff0MJN+ae5fKHg01wMRoU67/98bkqK2IaiopZxE
	6N9C4a8eQcWqEduW7j9aQ4cg=
X-Google-Smtp-Source: AGHT+IG+vwdBOW78hJS2ARBoaeXcloe4PsBtjCQ3PHFHML6iqoEhTKREvxrGmJBv6hdomksBTVCVDw==
X-Received: by 2002:a05:6214:5093:b0:6e8:fa38:46aa with SMTP id 6a1803df08f44-6f2b303673amr89566246d6.33.1744897741965;
        Thu, 17 Apr 2025 06:49:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea101c2sm127614776d6.94.2025.04.17.06.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 06:49:01 -0700 (PDT)
Date: Thu, 17 Apr 2025 09:48:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Robert Richter <rrichter@amd.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v4 03/14] cxl/pci: Add comments to cxl_hdm_decode_init()
Message-ID: <aAEGy6Lyt1WH5QgQ@gourry-fedora-PF4VCD3F>
References: <20250306164448.3354845-1-rrichter@amd.com>
 <20250306164448.3354845-4-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306164448.3354845-4-rrichter@amd.com>

On Thu, Mar 06, 2025 at 05:44:37PM +0100, Robert Richter wrote:
> There are various configuration cases of HDM decoder registers causing
> different code paths. Add comments to cxl_hdm_decode_init() to better
> explain them.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Tested-by: Gregory Price <gourry@gourry.net>

Reviewed-by: Gregory Price <gourry@gourry.net>

