Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA6514E2C2
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945747; cv=none; b=ZTteC6GXan13MKpGrXw3qcemGpgjM0oYbnvQCVLuoOZF1q8+/wDkLAXK1M+ir2Mt9v1hblggUZ+DBfa6IsfPnu7h6VR7eygZO6Q3co1kWcCGXwi99ytH82Uh4HrJWcTq5eQyHmYNCdouxajatR4K9HQpCjDWB5kC/OOhI9Hh7eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945747; c=relaxed/simple;
	bh=XaErmJGNd3qnIEy9xm5OsxWh5sNMP7wTJqbrGvV6l1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqnFtejiV5h4kL1Vlo5xVwTh8bHW2EDMu0BEOR7gqIyORv3bcOBVS/zmn3x0Ma3t3WSPIP+uJdCvcRbqLvT0mFFhUSXFmCxEriCmYZzk+W0+DTx4sSOsB0aquX3jrNzCd2lhLjI0o5O6d3c0dLnnVcYYt3xSWhZZGFs4z0XM/Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Am5OLymG; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Am5OLymG"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467b086e0easo12094161cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738945744; x=1739550544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SuwKjNIyamlXv9GNIw1RStP37nLjo1Z0L3Uzn683JD8=;
        b=Am5OLymGP1mWNAu4sDdyRW/Ud3Iw4M9+k0HcoiZaPIpcpu31LYMFFeXkvEFunorelI
         FBD6OVUAqG5mpss7VB030Z1mbdZE1vsixdZoiLZ2mXcD6MYX5HdzR1OSKKU6UQM1NNkU
         hQkZV6B8BIsCuQ0TNnytcSE4lNPIkMz0AmwjnB5r44OhKuR3K8Cc3zGfZ1wm3cwktaYr
         Q/iGpQGDN8O9W4xv3ExQnqJDVAZH9G0vT1U7xHG7nuOFCDoMs+gY96BoEOj/f2ejppon
         Pgu4I5dP/3/CQ+HqdWBJJUcVsGxNWuRShUPj3dfWK1kzmq7FC9VRZbXNWzFUh/rbo5cF
         Sivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945744; x=1739550544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuwKjNIyamlXv9GNIw1RStP37nLjo1Z0L3Uzn683JD8=;
        b=MIfOgTrGpuJrXnLjrgNqSyjrpgQRMUJ1lml6ibJHpKo2SdQ9CKRcXtwwDBfOrn6ZBI
         TwPoJHOGLceZ6wmiKc2AW+1cjJfEUzrLrUgdloHRDx2tghjEJK0DUiO5Wdv4LbV1IOYM
         nue9H8nrjE6iuDXWayxQoo20jm+y5N9T9Cja7FWB7izV+5DJCquv/VskIrW6+mhsWCBJ
         oU60JEkF0bgLXgvwL76KEvFKTyq5F/lxdopscvPfsKYhknh8S5EzVcmZo3Zf5H5oyLWm
         fczuA+9mOyItK5H+6vaDEpeED6DlHqVgqHV82W/eyYiE0b7UuOkMSYsgbrMF96rk+nZD
         xvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJtHWXzYPg2O+M7bt6PxMzUv6TboxnenWQxYgCGt9+uCElMkqo/UExpFr1wgaOxOR+Ax7lCAiPTpwFaJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDJvEIg4ej9U/IuI80Wp1LW9t+32At/y3g5YnyPn05CbczsWjE
	jiJ6K6vLJqkurDeZi6Dvj97/TTwDSO84Q7fYgD1Y+fInvj5zrgUZQ4NLfYtQ9hk=
X-Gm-Gg: ASbGncssTf7zm4HZ3TZUImioCNhaIILS4R2B59ODJrWT0OgWIaEzV+TyPdBXEFwu4wD
	e2Ky7rsZxCf2JvqTHm/B7goN3vFkd/Kv5Wa3RxnLV47rk2reIt+HfkOT14CHyAWaFXzlH+ZGJ0u
	FMI9w3CBkS/jGYKrDSPUhOzBj7rbppXIfSfbP3GFYgMT4o89w+ejWL9l0zEPID87nuyLGTGxnCh
	ItL0CEudJux1cYUZa3Frcy6ScY9kgHHpzVkOyobgc/4LtQld56H+BSFmxZBSGl1gc24vvZEMxHs
	KY8VFQbK35U8vmCjAOfP+N67nGrXSeSlHURT4ScNL0aBQ8fdYp4HmEEV/W2EeAaG1K942afFYg=
	=
X-Google-Smtp-Source: AGHT+IHQAWmbysLX02YAGwkH8oMiID89cBQFNJKcH9csyPpK0VEmVQy/XH7JC/mzj/dhUwQ7C7TLgA==
X-Received: by 2002:ac8:7d86:0:b0:467:7725:8b69 with SMTP id d75a77b69052e-47167b2ebe8mr53489691cf.40.1738945743960;
        Fri, 07 Feb 2025 08:29:03 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47153bec57fsm18399611cf.73.2025.02.07.08.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:29:03 -0800 (PST)
Date: Fri, 7 Feb 2025 11:29:01 -0500
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
Subject: Re: [PATCH v2 13/18] cxl/region: Add function to find a port's
 switch decoder by range
Message-ID: <Z6Y0zecGPhlHgVMd@gourry-fedora-PF4VCD3F>
References: <20250207153753.418849-1-rrichter@amd.com>
 <20250207153753.418849-14-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207153753.418849-14-rrichter@amd.com>

On Fri, Feb 07, 2025 at 04:37:48PM +0100, Robert Richter wrote:
> Factor out code to find the switch decoder of a port for a specific
> address range. Reuse the code to search a root decoder, create the
> function cxl_port_find_switch_decoder() and rework
> match_root_decoder_by_range() to be usable for switch decoders too.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>
