Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E73A211A23
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743787352; cv=none; b=NPuDPROxFdavC5eSpi4qBNlNiLQBYhIuI76m3MI9BqqvWu4BA7ElDwStzUzOSON6NaNQo61d1hfn2OawSxMrbs4UFmvbrLDK0lvP7dIN2hbEYZFtTWVMUSPHBnCFx1CKeB0tFRkDrqLSZUbaaxZRJQGHJoF9ANyFQOARu/Y46P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743787352; c=relaxed/simple;
	bh=ZJigoLO0XUuv8rpOLqbma7w6louNn+EBbne/BVcrNrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAYUcK4bngVlzt5Org2q341aVceVqsUPEStkLQTNJ2JV7zmApFntEZJ8WCX4zlANQTSCC+XN6ArJornkEX6Rp2e86a+Ed/Dj5K7AvZJqouDbiQRCp1aaS8a+AnBo7s7x+I216K8NnA0Iw7m+PRCdqEVpmqiWnK3ANSOOI05pOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Pn1Ioa1P; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Pn1Ioa1P"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f94c2698so12293186d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743787348; x=1744392148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PATlcXEUf2c7HZ7OV7dOmgWFjlDBED3/6vIgl63QLNg=;
        b=Pn1Ioa1PfHYTmcqpzBqskwaid4oPLzSx8MT6dmJTmUyU88hkCwBI1WlAwk1e6UZN8W
         9EwI1xbTpEp1gGViLvCEA49BswtHkFaikTn189/YeY9DXxsqPECYoqbXCKZAHwx4mKLN
         S/fnJvQ6Ju9Yhq+o1sbDAsnJyy/ZLLLCLT4+fHDJhK3Ctc2jm9iQgnfMK9ugVVHhozZU
         yiamORU2zpN8LR7d58Nju9ujYgXrZqRNHAVxmSGaO4/KEfzmGGw8zWJ0DkxGiZzVIV1D
         sZ9mNbfmsz60GTRoSRbqSZ/hspTklwn5Ytagjlqpc55VXRZQV8r8t5xO7NS6c74qoKmi
         WfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743787348; x=1744392148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PATlcXEUf2c7HZ7OV7dOmgWFjlDBED3/6vIgl63QLNg=;
        b=RvNUAg3o/fy9+UCQCpf0/YLrsvbZuXYM8ho1RyqbtEDz9t932xGiuRQjgrxe/vYveK
         JnCS9hCzg6WbC9zTxfoHh4KQfcqASaMo5ucpavnZgEqgHAayAJYE9fW6cY1MBehp6Jbn
         NJJ75Zf/H5AM9PLJkNQsKs2RSL4LRLl3EnhWu8Ef6UV/QV7sD5We0jj8nq82qD1T26gY
         K2NAzQBwrTLEJdIUUZfkigvfY4yRE+nNHy3N+CSkyC5fIZNTALxIy51GXAaWy1/HWEKs
         DHQ30ZIQNNKHJ480WJHmgOKlznfmACmJV5H2t+lb2oPGjeP/ndvJfvuKSXODVtih7E1K
         Ekhg==
X-Forwarded-Encrypted: i=1; AJvYcCVusNprbY0wcUSEDaUTp2+OHfAF/0VVjUeMSropgkDWTW+3xW6uJf5mJOV3RDur5+9RkD8Ut/BTaX7yMx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJl3Sl541GZgB1KZgSjugh9/8soUl2Ei/XfZcwBURth2ppw53b
	f9GmBPZdyWXlcg8bgSJEWNlB13hBBeWrvb0z6Ovpn78zZV1IO0NFLgKeh5NdbKg=
X-Gm-Gg: ASbGncuce5hEwLz3KTvu6gsiWe+BFo9utCd19H3PL9ZE3iTd8EYePz8v1MvELj4YXAb
	eC/c/AafR6PbIfXzBRokddVUCa3GXLIJF0TjpZY92Y2hj/PRUPiA6/u2eJwo6vwqZDovCB6twPC
	bvN45Gv7+5ZVXrFkGJZyadFyMEEWQTU48xgi9C0pY6LiLkmxWQs7aNzffLQq7P2M/fzvUawiXsq
	CFXBkPodCGY5HSBEM/XmXGYNREzXG04nbggzGfhrFzqY64kKtfeFBfsqVJchUaUAsOLZUW7LEXx
	V8vIJldhvl1m6BxxyTo6HcyaGOSGLkYNDG6l2sfhug==
X-Google-Smtp-Source: AGHT+IHe60/Uu4PrKphc2rO5BSUpl63xrVt2LuOqa7v9kFyQkG6E0kZxDVSPsYQMFyOC5OblBZrO7g==
X-Received: by 2002:a05:6214:27e4:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6f064b2757emr56473726d6.34.1743787348348;
        Fri, 04 Apr 2025 10:22:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:500::6:3e6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0efc12besm23949416d6.16.2025.04.04.10.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 10:22:27 -0700 (PDT)
Date: Fri, 4 Apr 2025 13:22:25 -0400
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
Subject: Re: [PATCH] cxl/region: Continue recalculating position during sort
Message-ID: <Z_AVURWuOL75DPqE@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-5-rrichter@amd.com>
 <Z-_8kRHep5LVeuvS@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-_8kRHep5LVeuvS@gourry-fedora-PF4VCD3F>

On Fri, Apr 04, 2025 at 10:36:49AM -0500, Gregory Price wrote:
> The auto decoder probe proess overwrites the endpoint position
> temporarily to record its temporary location in the region target list.
> This patch restores the pos recalculation during the sort target process
> so that decoder probe order doesn't affect region probe.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>

Disregard this patch, it appears to break is subtly different ways now -
sigh :[.

~Gregory
