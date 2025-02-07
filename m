Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B423C8BA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738944180; cv=none; b=fanqEHGoolBGxzfcttZB3F7j0TQ7lol1jaLVhuCkdXATlF2bH37p8FKGPzdu0z3D2bPruRrfKrtnlYoq0W3vRYCln+YEL+cXV7t0PF0U05lIBYAICo6txCfA0otsFWmH5cxOHr4dBkzvg0Go/1txSnojoToc1YfsiJ8wpw/3EFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738944180; c=relaxed/simple;
	bh=qTTrwmonuoBn114EjCukQAQjX6dYX2f9YggJdvYqtuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzwOCurzBfZoA+akygYd4zZU5MJkhapqObG2ZuZ3Btl9uRx4uauI3o43Y0QOj/7Mdf91nQgKy+nzfrZHce+b8edU1emT3ZDsPu8jqNhZPY3WwLAwofRcyzXpdH3GHM9JXSXxyuuDO0a7ALq6avCB97kV767W5MZ0oJbITP8Hxzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=NVZLtnYT; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="NVZLtnYT"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467a17055e6so27081921cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738944177; x=1739548977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OxwRHe5U4ZPv9/a1cUnE/D3XB6IfxkHhfzV2eY3RtYQ=;
        b=NVZLtnYTNCy/HsHNR4jyUtDWcTlccc1el7eJr6kCz+d/1RkoP5pvQkpYvEvKX0FdYE
         V7B7QWc2rfI8Dnl2R8/O931FJmLWwhD6D/2APi/vQLap1tzbJq5p9Wfr2TMQoOyxBhh8
         9gBVBuj/UdD5NUDVOCTbsUiPBZ8s5FsmlUbp7rtaI6bjvAhSkHA2aJe05jA8mg2WTk4y
         NcqCC7/9MoyorHvCmiNfjBBnrOk/y4uNkA56+tnxs8DSw6BcYBU1yZLl0UHKrXqdGTCS
         bcriPINk4VZuqsW7PYLRdZwj37vnALSnWAtGZVORNDJnlJZScW39C8mXLWag5hkCdeyq
         NPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944177; x=1739548977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxwRHe5U4ZPv9/a1cUnE/D3XB6IfxkHhfzV2eY3RtYQ=;
        b=BZq61oVWjhrQp2SR3I2KOpBC+QCOdGSW5Yo9iaKA0yUthG6ErDtOwF3W0MbXTuVTGq
         QTe7912vgQOlgSgwGNSI5NiMg0NX5JXm6vgM6hkOesRK969l77Zhoaf/zn2Gclpst3zz
         3gF83YykBhVUQGi+qCBFog8C1BSpJjKVwJmYhRJud4HPDJ5MCea3saFoQmE8/V0K5970
         YNtSQvC4i4I+eP0PQD+e13IiG2OwxGdZtoYA788nwbgH5bVU2+Av5CV+p7As7RMjarv3
         wyI3XvG036hme8WL6wDw32lhimM7oS9yVoq8vGmIlg5oezcJ6bP6I5tZ06lu10WbG3go
         iWOw==
X-Forwarded-Encrypted: i=1; AJvYcCUet/1pL83Xa7om/lp7u7e2eXIwPccxoWRc+Bl0x0p0CRq5JE+i1rppra9vtvcjrYNxhPf9fOBhrOCxFRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE4nSE94FL0OMSxSVPFshXjjIROrUAeLPuQAgGRQCwojmwKtbi
	Hp/2XvC0JEKXWpZ/6jmS93T2a9ig8B4o8H/OdyNybcURI4DZXCa5alLwgc++6f7uZd/TXddqc9E
	E
X-Gm-Gg: ASbGncuaDEXWR3jeoVkGrk9qcgN9gCPCMhaDnviUX1fiO+YS3jKQpKC9DmL2xJfLxv1
	4Xk35hnTuE0Vp04q/eHRnrhQP9y9/utb65uBm+gKBIF6cwUhohuFmfzkoQ3EVTQcV6Td70IGniw
	nHA/rs0OkeX0802WVJYEPZDbF8bBc12uBmjmQyNZZ6/f1/r4yl0o2bqlBjSRY3+6Z/NnL938nsB
	Beo98GCp5qfopF/kg1vGaKX/VrBPYd3x7YCgiIHsBzjDmev0Q9KKt/rtQJWTAaVBpyKP9BuQzhB
	Yrd1vSsPb3hFeXhgZP+3+B2s6wxnysETrFehxEueWgXc1DSOnPCsNVLbGqGs8QmqvT5Eh00Plg=
	=
X-Google-Smtp-Source: AGHT+IFgXCB04Lpt0gpJYG7B8kSjZz+kozBjKHRr1ex1n/QVmUZcaq9+qUd7LdBIW8zmfPollMQw5A==
X-Received: by 2002:a05:622a:1181:b0:46d:fd08:7c9f with SMTP id d75a77b69052e-47167aa11eamr47466111cf.22.1738944175429;
        Fri, 07 Feb 2025 08:02:55 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153bc7375sm18071411cf.56.2025.02.07.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:02:54 -0800 (PST)
Date: Fri, 7 Feb 2025 11:02:53 -0500
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
Subject: Re: [PATCH v2 03/18] cxl/pci: cxl_hdm_decode_init: Move comment
Message-ID: <Z6YurVy_K96jet3U@gourry-fedora-PF4VCD3F>
References: <20250207153753.418849-1-rrichter@amd.com>
 <20250207153753.418849-4-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207153753.418849-4-rrichter@amd.com>

On Fri, Feb 07, 2025 at 04:37:38PM +0100, Robert Richter wrote:
> The comment applies to the check, move it there.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>
