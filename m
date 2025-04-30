Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963F21C9E7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022129; cv=none; b=RSheBUx7N0DRL1wmfJf0o74z3ZW4raKsNestzTPIkGdFI8YlhmiLUOrTE6xBgQBl7N2jcGPal2JnK4Sj2zdtWP5F5csy5Ftn8sTMrNqdEs5dhv+zw601aooj7Lz7EPEHuzT/YnT24+DuphIX/+1GwggkU2R/2knHazNfY+G4fdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022129; c=relaxed/simple;
	bh=nKrVXdFYKMFM9Hem9wdZl/eLQy0Q5+LZKJyIDlAU+yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhYg9aJGorpZ9e1Ntnm+Qlb3KIwn3didtZHEpkDtsMxs1Dj4QJc1PqoiQDfbOVql7hWXia1mTcYbxH9rPrnPs/3a83WAmlTgKnb+IoDPw1/Q6VLx+G53CguF43c3jX/DxtJiP82kjGhsfh9yk/Lahs3Eggg0ZtuPIe5Aru2LEJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=tgM3DU7V; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="tgM3DU7V"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47686580529so85867821cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746022126; x=1746626926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M07YW4+B8fPuXiIo1oP46Lyh2gl/rW1yV/4vvxhVFu0=;
        b=tgM3DU7V/yiErgPmL3sYrc+/gJcBnmdQtqLpiG5ZzpUTO4nB0qhB97tO4t1AeFFjxE
         Uz0RBwvu4FnogpjCgKsXAux8lCljr0Egzz71oPfl4J5uQJM2HUxurHhxlVQBPOb4wEXw
         rlCG3TSL4wm1BaZ2GTXB6rh4n6G6ThCHfOEJPpFeYLouR6QUYZrR7L1aNhSQnjPEEHma
         W1l0fSz4lUnA4INQMUYFEv9jLTS1Kh54xg+/Dyw5YrYCNbx9qLcVJS/0S69kHlC9gowK
         8Uc6FUkfRWkmd0ud/GHUP1HYVyHr/nZ5O2DFbWE3TOkDUYtts1NrXF33PPtETZWEewaF
         iTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022126; x=1746626926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M07YW4+B8fPuXiIo1oP46Lyh2gl/rW1yV/4vvxhVFu0=;
        b=setJaS8INgvQ61UwqhwEaVmT58n1HsnQKTyQcjxkamOYKWkgjCYEyO81I29ptka3oe
         56pNcBfbGcOs5RX/Y9hfxs8ewSX6m/L30ryQO4mca9GLDBB59PK9I7ivnB8ug0KbAK8M
         70sYTgM2SPlGgybq+cFAycCsCm9QOo+IZKFYelkvB8CpAWdduGHNyEXT+xTaNPmpVh9V
         1R8SVIDSY2cNqAREW0+WgVhqjsGfe5iYjdAIn2kxvPLhUrvjjfr4W6Td5AaiD55uQ9Yg
         jH8PFoyw/uAqc1FBJHpNdD23cXB2XR89uaNsQHepLxojTsfsvcsRN8a+bKGqdw2zsIFt
         IhgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdSVU9x0Z944iOSklY05j+Oq5JB7eokdkGb0Dw3fx9+V9CSQkzoGLSNHtX6UrvtrpiHs9vobAkrUD9RhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhhQjB4ofawcQccFZ2WHWuAxVlhMHcXP1dSmUvcHhdMztgDs52
	w2jKleVnM0qR8bsJaIvxQN57wsdCLDiDBFfYZ4ec8h0tf8eo8HBMA1bbfB4Mfz8=
X-Gm-Gg: ASbGncuoHVRGEqhmVTRZgOKGT5k+IXI4XUxUFuwnoXyvc+by1uQNsoRHdm3o+5BcNcF
	g/DTjr1H75Px4Nh4zfTFMF/xJo8nmufylQJMClNfdLrmflt3VXjhStoEhiGZHrKzp5t1HPA7Vxe
	HnrGZVgASlPaqFO9IydwlHJPc9nmyTXnx0cR63l21qjZZou1AjYGudHyrxCbVrrVloMeOnB75LS
	koPiklIiNbnW8b6BiOnmz9AB9CODlXgjFdxBxDPMxlAOCegZx844XI1SqhGXHCbbWg49mXtjH3X
	/kgb57fgGf1o/e+neqfif4BEZdo2vNkcK7W4uvuxZpTMB9I+LM4e9xFaFP1k3sQuzjYrhiONjbe
	dv0A1dKkBFK/x0kVU5PjOFug=
X-Google-Smtp-Source: AGHT+IGv0sXD0ASi/qBfVsdcjg2k+/HQRGhRXeFIhGMFVJWk3UVygxCgFNpA8YzRL2WI7xwLxkotqQ==
X-Received: by 2002:a05:622a:1b16:b0:476:9017:bbf1 with SMTP id d75a77b69052e-489c5701716mr54622501cf.46.1746022126427;
        Wed, 30 Apr 2025 07:08:46 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7ab516sm91730101cf.38.2025.04.30.07.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:08:46 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:08:43 -0400
From: Gregory Price <gourry@gourry.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com
Subject: Re: [RFC PATCH 02/17] cxl: docs/devices - device reference and uefi
 placeholder
Message-ID: <aBIu63MPnZ0bGyIp@gourry-fedora-PF4VCD3F>
References: <20250430001224.1028656-1-gourry@gourry.net>
 <20250430001224.1028656-3-gourry@gourry.net>
 <87o6wdltic.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6wdltic.fsf@trenco.lwn.net>

On Wed, Apr 30, 2025 at 06:32:27AM -0600, Jonathan Corbet wrote:
> Gregory Price <gourry@gourry.net> writes:
> 
> > Add a simple device primer sufficient to understand the theory
> > of operation documentation.
> >
> > Add carve-out for CDAT with a TODO.
> >
> > Signed-off-by: Gregory Price <gourry@gourry.net>
> > ---
> >  .../driver-api/cxl/devices/device-types.rst   | 169 ++++++++++++++++++
> >  Documentation/driver-api/cxl/devices/uefi.rst |   9 +
> >  Documentation/driver-api/cxl/index.rst        |   2 +
> >  3 files changed, 180 insertions(+)
> >  create mode 100644 Documentation/driver-api/cxl/devices/device-types.rst
> >  create mode 100644 Documentation/driver-api/cxl/devices/uefi.rst
> 
> I'm glad to see all this documentation!  One little nit...
> 
> > diff --git a/Documentation/driver-api/cxl/devices/device-types.rst b/Documentation/driver-api/cxl/devices/device-types.rst
> > new file mode 100644
> > index 000000000000..e8dd051c2c71
> > --- /dev/null
> > +++ b/Documentation/driver-api/cxl/devices/device-types.rst
> > @@ -0,0 +1,169 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Devices and Protocols
> > +#####################
> 
> If you could stick with the section markup conventions we have
> established in Documentation/doc-guide/sphinx.rst, I'd appreciate it.
>

Will do, mostly wanted to get it out for content first. Will give it
a once over for formatting now.

~Gregory
