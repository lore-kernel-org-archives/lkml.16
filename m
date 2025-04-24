Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036613213E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531381; cv=none; b=LljufjVvyMEH/QUnzDhTbP9D5Y+SXcfzGtDLasyAYAqK3fDodEgNwlWuoRplmuKOVPpv1N3/PVQKRknGXr9CJViaL4XOrgPk0hKCegnFVd8wEGJddTxTY1wQWs8jMurASQ/6hOch5Ui1WLHPrB00GtGPCra4h8opq1FDnbQDMng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531381; c=relaxed/simple;
	bh=1aRfcngz3t0Reu+ykpikN3FVUubI/Am/J/BJGdZpneE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw2B0Y4S5A7Q9PNwwPvMwVtUsZZpaDrjVpj/gUdZx1d3mrQeGySKIsjst1ldVhGQzVkPwd14dfUfzcWGbMn7XvrTIlXxUdXROCScUDlLi3b+v+ggKfLO9zU0I8D7ouGiCkR/UlozmNjXFtXXrLBuSlFKEcoips0jgkJhmHS0TfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=A3aWgwSi; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="A3aWgwSi"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47688ae873fso17277261cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745531378; x=1746136178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kNwByNKdG9uz9NysHExE1f7B9TlMZjPyDOEKCrzNzw8=;
        b=A3aWgwSiN/4tjw6+g1w/Fc/ZI9FhbkTa3D7UMEDyaRe6m4OWK12QeSBgvSbgFNuhhu
         /FILCH9AhMnAifzS8znARge8aL54g11FmkBitrByTq/BksdUB1Od8tfG4HzLrc0DeKTo
         24qc72Mw1QOLvmfh5vQkgqB3EkL+RfProy01waRnK3n6RM75VJFLRRTRJsanEAvbnP9d
         zonHss+4parq3ahd88Ac2wFKT3e54rCN28LwLL160F0nFY800G6I57grc4Zz8dZDrxXU
         NVnsgUUZzYRm2m8YckqtD2xGljB1Mxe12g2OlnErY50uTgNDtKOr0pLr3Eby/yNn0HOw
         dzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745531378; x=1746136178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNwByNKdG9uz9NysHExE1f7B9TlMZjPyDOEKCrzNzw8=;
        b=X2dhCcx59CHTMmGXQqWy+eOj++wpaFRMjpbWXMVBfltL/fkGVn6WHM3uU1s4CHQPxd
         7KC1KMtnjVf0HVORuaJMevKVH2kk4hUEQ2GeTxot2SBdN00t6Q+Dw2z/XL7HzutV8xUl
         osX+28s83nTJ/zJtV69w8ECV5+JsjQoI1Zxy9L4ocfv5X2sgc+mS7h84j4gVNgLwOCxV
         eYK78mKNBwtFIM7annuoYHd71HQFAlSmd23ue0KxlQXi9ONU3lVWvw4I5sAr0ioyH/Z/
         CXNkMyjnI4L1fCECPKIDgx6k2ZaIwzsknuUWQllnoGhBzQLS1flJN9LkjrOPgUSOLY1n
         +aoA==
X-Forwarded-Encrypted: i=1; AJvYcCUxKRWMAs7FkQc8PLowNS7RjQc5TVVHCMTS8+j83BEtYKAlXfKMoM8v4YKysgx5IHs27V9ikUmy96EGu0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMsSk4HfHRojT0HCgMuW7Q3nm0S6CCE6iChieL19vW6zUiWu3C
	BV9538PYdnu4W2d1MY9PVqTvFfkQ3Dl4l41Dvd0/Iu6mw1H7crgBOwMQ2bFD7KY=
X-Gm-Gg: ASbGncukmpPjk04xFUknQi1QlU9vUwrrqRe+okdMXw0iDwiSoINgfaMSFiWEQnTTFCn
	h5tATZFEh4jcGQNYKz+PAdIWYxISvZmQcmhBfTHIpnnFYSw8h3vUl6GSl6CbgWxhAbFJjFfS2dV
	llG2GmwptLeMEgtoFaIZKV7VMp55Ufj2Imkl2//94x5eW3O1s4S2BwbRyzp3onMtPrRir79I/mb
	MgZJrC0s7A97V9V45gaCtGF/NVICBrYVRZlOYv0n9u3O6ekA4pBlHQX8lW+KhBcs6TrmbpvJW1Q
	8UMRI2MufEW/a7hKCT7vU9IROj4qIg9K0PeewnI4ap/avZWICu/XDNXo6EfWKs4fgpiAtZQUK4D
	l2SRxiuullpXV87dpyg301EJqT3WCNpymPA==
X-Google-Smtp-Source: AGHT+IFHelggdM4itqUdnMB3pkEhQKzQFiEwTaYzYTxWngWCOBuYKgq96+vIbqTUY+rUr/Si6bJYaA==
X-Received: by 2002:ad4:5aec:0:b0:6f4:c2e5:9dc5 with SMTP id 6a1803df08f44-6f4cbb5b66bmr765446d6.44.1745531378141;
        Thu, 24 Apr 2025 14:49:38 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e9fbcasm137957585a.99.2025.04.24.14.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 14:49:37 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:49:35 -0400
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
Subject: Re: [PATCH v2 06/15] cxl/region: Use endpoint's HPA range to find
 the port's decoder
Message-ID: <aAqx74FWd--8aVw1@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-7-rrichter@amd.com>
 <aAmFk1iQcS7UpslQ@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAmFk1iQcS7UpslQ@gourry-fedora-PF4VCD3F>

On Wed, Apr 23, 2025 at 08:28:03PM -0400, Gregory Price wrote:
> @@ -916,13 +921,14 @@ cxl_find_decoder_early(struct cxl_port *port,
>  		       struct cxl_region *cxlr)
>  {
>  	struct device *dev;
> +	struct mad_context mad = { .p = &cxlr->params,
> +				   .r =&cxled->cxld.hpa_range };
                                               ^^^^^^^^^^^^^^
					       spa_range

Woops, missed this.  Not sure if it goes here or a later patch, but
that's needed to make this work.

~Gregory
