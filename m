Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB578479
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 22:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738966795; cv=none; b=cscRDwLAsULSVRbNX5oEAPFwrm9V+jI+eARQskX6Owadg+TSBkxHlhqtxnO+f/DU0CeOkzrgv2b6jFuDDk/CZZf6jvqdjVRWs7688Ut+9m3VRkmVy4QCBcbijIFFvWSInizlMakrIQIITCFRVE832PO20iWuX969mGEJ7voDzzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738966795; c=relaxed/simple;
	bh=ps5EjYggeB2pmCfRj5Y1qHEl1n/SHTtVyuqzfKf0ht8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=me0WFFHTxe0O2Kv3yCz0sXAox9+hqwYsc6XKo4ub4HpGUhgwQG5M0l3Dvw/MnFZc0p4PRTxSR+yFh7Ohv/XJVmMqOXILkneVASTD8tDfm6aackv4BPu/JxNO9MvPPG0aISizNkREzR65r0Lv5JgHJcsSXevGSqmMM0vfRDkcmLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ScZcY2N1; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ScZcY2N1"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e1a41935c3so34388466d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 14:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738966793; x=1739571593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LNYJ3hvEn3WHrM7IryEw3ayHWigT+bDMHa3yuIYsG60=;
        b=ScZcY2N15IHWTxx1YUi5LctkewctjNwvLcXxq9GP8s+82s7Mk5Ne0lkrlBJf+9AdCj
         b6g0YS8ZHUL3MNxGaMkeJvE+7hUVvopjH+pLIZI0itSWr2bDPAb7ABrtb8vbvvptGfEr
         GTuuuggOnXEUpEO5qCaSbGYay6wZQtvoyu2bKhgI1OkBOstmEfsmaTIuIHLQaIKB/aKT
         Pu2lfW2LlbjU1TNwoxgGjfXc9M4M1vMBj3DE7ejJ/WZ9omXbKXrdpcIpsEWlILF50wyV
         F0bkS+XXOHxvDmjkU3OEfYBqnkMMlBhCjpHZL9x9w3Hn6bHpiXxNQLOrxJH2hQbPdmvM
         /1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966793; x=1739571593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNYJ3hvEn3WHrM7IryEw3ayHWigT+bDMHa3yuIYsG60=;
        b=gSYFTeefUXvIi+nRW40/1chyrH+Yo6keZ9njxcaoodE1xfLWmlRRn7148cWw3yYOpf
         /YWAPeZeRcjE9Lr9WHvy0jIlENERdPQc8FqEDeX/qK+MCy13yR3907p7SHveon5+6yuj
         NsVGWS4cZbArQCLEgQe6c8nha9H+LpzNO54N3XoTAOjYKWICMdHy0VYiMUBKZdNAsBEr
         ytgXP+xV36cnXzt01SXvbOyCsLkFwwcNN/k7pq0scnK/P3ECzVCwInnkab3CJXlrOjoH
         x+mxCarJc6uFZg/cah0pBxfM3hD0TTHNlXkkY4k2527jB7woWs/P1RvKDhPCjTphgZuI
         JQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCX/lCPGs8cU/lhmGVsKPTzXb8x2DXGcDF84aPIhGVYm7y8ZH9OoyzSADA3lFTgHd3JXkf0WcPD5tAi6H7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSNrbjVSgxPolu7UAmp3mqORrGKgJ6Fi0uwMY+ldM+E7P4aE2B
	unRjJEg3QqGank1KUydVfk3vnVCTFxWUtBYK25QWy0CBre/EWJ01MpXbb7ADFuU=
X-Gm-Gg: ASbGncvF6Gb9z9UpDs1lx/WMvAKiX4lKQdBiq/XBCMPxuTh8nJjaGIkg8RiOn/l/tWM
	jOY/a1elkF3rYKsf284u5P62C5VYn68eNun5oWXygND3Pv5Uwa9XzR9J3/mAY1D8hTdOEnVsykN
	8P028/r3JZR5LF6tW53oXaUlGMRYes2XQLjJewozE3qhp7ZL7VL0T1vuBhz43foQvbMURxAcz1Z
	xHik7zxRWJ5hQUesvLIqNSjpbQ40qGIljUdzRWUhdLcolcSFJedvEbR2DH/cP0okvCcWDF/IokJ
	QgNzNB4XWBOubwc4n01xEHKvevb25bV5Fh8f2KRoU3PZWl73GCV+fzC5zCT5hTroVvSOLzG2oQ=
	=
X-Google-Smtp-Source: AGHT+IHuh8FZ1mgmCnMmsLjrt+LL4tFHjVCmaSizXKjRSMf8Fg3xlArwjI3h301vYadEZcBHltyvdA==
X-Received: by 2002:ad4:576b:0:b0:6d8:9062:6616 with SMTP id 6a1803df08f44-6e4455d2f32mr79737356d6.7.1738966793258;
        Fri, 07 Feb 2025 14:19:53 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bad5a7bsm21233486d6.119.2025.02.07.14.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:19:52 -0800 (PST)
Date: Fri, 7 Feb 2025 17:19:50 -0500
From: Gregory Price <gourry@gourry.net>
To: Jim Kao <jim.kao@xconn-tech.com>
Cc: Robert Richter <rrichter@amd.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>
Subject: Re: [PATCH v2 03/18] cxl/pci: cxl_hdm_decode_init: Move comment
Message-ID: <Z6aHBuGwuEMy6Kc1@gourry-fedora-PF4VCD3F>
References: <20250207153753.418849-1-rrichter@amd.com>
 <20250207153753.418849-4-rrichter@amd.com>
 <Z6YurVy_K96jet3U@gourry-fedora-PF4VCD3F>
 <BYAPR06MB413558D98731EBD422CF24E4A1F12@BYAPR06MB4135.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR06MB413558D98731EBD422CF24E4A1F12@BYAPR06MB4135.namprd06.prod.outlook.com>

On Fri, Feb 07, 2025 at 09:36:08PM +0000, Jim Kao wrote:
> Do we have any limitation for HDM Decoder Range in Linux Kernel ?
> We has observed that Linux might be hung if range is larger than 8TB.
> 
> Jim
> 

Do you have any additional details? dmesg/core dumps, etc?

Seems pretty suspicious that it happens right on the 44-bit boundary.
