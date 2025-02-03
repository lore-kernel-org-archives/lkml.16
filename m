Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0B1E8850;
	Mon,  3 Feb 2025 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583254; cv=none; b=HfNBvi5M90LSq2UlcNUfNrxywAtBuM8GPqebCADUz2GqmyZ1UxwJX21RM6D5UV1yLarCtpgB45qelWFrHqnAWXfN/xrZH6XI5fEEjefmUH2qlHLBQwCduHbbfR2loeD1RyPRCxgbipuaCGo91/w3oPM0xo3/97/M7jM9msEovtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583254; c=relaxed/simple;
	bh=zPMRDz2INH9jX/lFvueiiS8S8zDP4h7nmhVfFbg5fp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZ61g4LnDnHPqQ23V0i/kDk4L8JSpUh6CrtIM4er9Uze0jTm7wTPyP3bP7yJk4o7lPyrSRe0rk1jqOEU9XUudMBeCJOMYa770bEbWVtRBx5hQ8hlv4g/8QF4oCBWgn7q7KZxwu822VWQ0S79O1/gykIbFYzlmdlYeUhR36VjeBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UO/NdV/P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UO/NdV/P"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436281c8a38so30250445e9.3;
        Mon, 03 Feb 2025 03:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583251; x=1739188051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ltBpyiKhWLDMdeR0RFMO0jdmpO/BHsgMHlgteaMxyo=;
        b=UO/NdV/PK7bH+Yl8Qt5CJ/WShf7w/5HdPTkdXv5+NNSGcsop6c/eKSE9yZx7iQkZQe
         OLQmFGlrSa5qFURTidhLimP2pkld570yvn8Dpm2eYscHFGRUhphDvTuwL4HodyvuSVg+
         3bRDvfIBMTVam6B82/ws7zRyxsKZQjlaM+hwcj44topLUBNT6PLFfb/+H8SHQkxAD16j
         NZrlxj0qnzaI8hB95eplg0JlHXBo+SHj6RzL5l3+0TJSHZPKLqDLJ1hbPMM0Kqa6ZUqm
         gypQkYr4mgX+5CIO3VmD177b+vD2raQV8W4c2W/gMlI5W1+AGCU/Sgq2Nko9mUc/s+Pe
         FzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583251; x=1739188051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ltBpyiKhWLDMdeR0RFMO0jdmpO/BHsgMHlgteaMxyo=;
        b=A85xJEBUEHHJTPMhSoF2JsVs7AFZm9tsG/JiddYqmSxK0mJ5gu3hkQx6ZSoGzME+y4
         7U02AY4N3Ocb+v8y0jONV915Uq6HmpBjbNXaBqyqfoQa65CovcjAJu/xg2J83zVOk4sc
         +tjrVtLqly64siKyCKTvczQ5ONh2YvWMKIPXbq45rW+jIsZJwAiAMROV6HpmPT/p9gpz
         iRYRSAAb09YAhbtlyFrswk3Li7mWyanLqgmeLhm97bsfITES6Yc+vMdKg6lGaQ8/QyIs
         YYSvwVnITHXXfyY8gbrxG/+RpllB5vwBve4Zs6Dmu6ieqjVQMK8bI42O5GHY1l7pmA4D
         PSeA==
X-Forwarded-Encrypted: i=1; AJvYcCUZCPiTlcHtNqFv2jUnnyS8CuwC1noi4UaSbfMiXpEAIG/xD15zQei67T3TgstM6HhBmYnQSnL251gY@vger.kernel.org, AJvYcCXgbBvOVSNo0VY95qOU6WuA/7/+Q4C6A7sTC4ogwylcN+Wpd4qUoKIqHJPM98y3oBVZ0AUGyQD5IkkbI2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkPHXHrku9/PtIxRjeWWCU5SrDNCqw/PHq6W4NA/X7fMHQV2l6
	HNX7bc2dANtWosngKokavbRibOdCIkHe8F6tseOo8kLSGxOA95jY
X-Gm-Gg: ASbGncs/Hq8A8yus2JqKlWITSCJ3LzdBTUogbTDqS1qQExr8VHdG+Q3J7PApTo+aNeQ
	ETg1gdusirL4m9BH3j6kL1HvR1gnMeve0PeTd905yh4+A/iJhQogdv/0QF7ma9AvsQipXk1CjSy
	AgaWUB7vQT6rrFjSr/BeGi5T0GT/rCkbFUt2KMdUqQjyTBTXt7h0xTRr80Jd/Xt7DnB0KCsgCKT
	PE7ROLpcc3RZWC0n3BCAbpTdBif8n2dXFhzjXdvtWNSgUeZ7ZYUukH6QnbeI4F+JfHYKYxYiQKd
	5kakGf0OKbJ12A==
X-Google-Smtp-Source: AGHT+IHFFpoCD61c98SInLiy8fa5FLO3AxysYZtaJ6tyqWRUNiOyhLZ30ZMbevB2lazbgV1iDQFZ6Q==
X-Received: by 2002:a5d:59a6:0:b0:38b:f3f4:57ae with SMTP id ffacd0b85a97d-38c51949b97mr18900069f8f.10.1738583250520;
        Mon, 03 Feb 2025 03:47:30 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:5eb2:36d4:b5a0:d5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f5a5sm155190465e9.40.2025.02.03.03.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:47:30 -0800 (PST)
Date: Mon, 3 Feb 2025 12:47:28 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Xu Yang <xu.yang_2@nxp.com>, ritesh.kumar@toradex.com,
	linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: USB EHCI chipidea regression on NXP i.MX7
Message-ID: <Z6Cs0PeC2O6enO7R@eichest-laptop>
References: <20250108093101.GA22448@francesco-nb>
 <20250109073500.45gge4abb4h6mmay@hippo>
 <Z3-U1DXdMQ0eZaW2@gaggiata.pivistrello.it>
 <20250110065101.qxajjnu3fek4mmty@hippo>
 <Z4DXUuHwTsbiir5I@gaggiata.pivistrello.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4DXUuHwTsbiir5I@gaggiata.pivistrello.it>

Hi everyone,

On Fri, Jan 10, 2025 at 09:16:18AM +0100, Francesco Dolcini wrote:
> Hello,
> 
> On Fri, Jan 10, 2025 at 02:51:01PM +0800, Xu Yang wrote:
> > On Thu, Jan 09, 2025 at 10:20:20AM +0100, Francesco Dolcini wrote:
> > > On Thu, Jan 09, 2025 at 03:35:00PM +0800, Xu Yang wrote:
> > > > > If the USB port is connected to a USB HUB, and a device is connected at
> > > > > boot time to such a hub, the following errors are printed and the USB
> > > > > port is not functional.
> > > > 
> > > > Does this happen 100%?
> > > > I tried many time on i.MX7ULP-EVK board, but I can't reproduce this issue.
> > > 
> > > The issue happens with i.MX7D.
> > 
> > Then I think this issue is not related to that commit.
> > I also tried on i.MX7D, but I still can't reproduce it.
> >
> > Please firstly confirm few questions in last mail.
> 
> Thanks Xu Yang for trying this out.
> 
> Ritesh: can you help here?

We did some more tests on our (Toradex) side and the issue is not
related to the mentioned commit. We sent a first patch which tries to
address the issue:
https://lore.kernel.org/all/20250203105840.17539-1-eichest@gmail.com/

Sorry for the false alert.

Regards,
Stefan
