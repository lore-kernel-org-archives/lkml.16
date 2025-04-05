Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DDB18859B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 02:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743820744; cv=none; b=XnqR+974ZJiy/gHwLALk2AfxNxbOufFwIhTPwSu7+hADONTCBfpGY0ck40+J87MJGdDb7CVfz2OsqiWS+w2UpzdTg0zDtfySRJKoN976zNRl/JT4ykSeYt+w8gZJTGhEQo3f8PG/c4sxKowT/xN0kofQBCsc1/m8XJFC6/j/cpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743820744; c=relaxed/simple;
	bh=YDm36M0PZoh2wJalWFye5VmTzcZORjqMjz4J3L1IT9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+z75UgEW22hQTjHfbQjuuUq62Z9RpbRvxbKlXwXrk/jjeqtfV+JjUxrQFGonXAffqWqjnLL3KyvGROttWwr7Q1riFU1RQ52keqr5vBtkmDAdN729KsJYQnngdJzgW2PYdwOyu/T7zzIj/ixKjQoeMu8STThhC+2fHhVxRT9gFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IETT7Z8l; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="IETT7Z8l"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5e2fe5f17so259159985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 19:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743820741; x=1744425541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7IsqKmVEgRJ8CUWYczM7gURcQ3woAE5XWEEXNva28o=;
        b=IETT7Z8l4eqtWmuoYJUD/peo38BNbTTZczqJPscvT+gUakNg5b2nDNMEpGay10zc64
         2BWRhB2FdkFeG3auOAMVfw6Zh+IB4Qsu99Mmv/qfWGIENCc3WfoZzb52mUdnHdoHz+ZB
         +CHDM8SbGB7sq6mRSFO8a5aQ59nICFI3pX9G5/YjS5hpg9LyBrv/7lO2c4UOu+5TmUH3
         N9UNJLk+rAwplY2Bbme8GcA/8julb3T0TEgrmme7T65zkydIJZy76eVAdSYUxEdbOYnB
         Ad8MQ0f5WFLpKycSqJbrzDSVB1OPU4zh+T2e70ZJNCDhDai2WLXcQbJy+rbcHzz8y+W3
         DXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743820741; x=1744425541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7IsqKmVEgRJ8CUWYczM7gURcQ3woAE5XWEEXNva28o=;
        b=Xdt5gnnmPEkWXEKK4KGfcmleNl7CSji8pj6zm9da7jamulnC57un8ea8ZAaNUphZlE
         uZLzk2xGM1Be8KHYdgVZZRZMerC9Tt2hkK2jfJUcUxxJ49lSXmK3DT7StSHvlILKsZIe
         py9X3OOwnyKnxSiDnplZx2qgdTIqJBNnpU8bxvOhZqxt3baezz9HAOKAwmFbxrxaQ/Eb
         0PX56ag/52PJxjPFovK7dWSfH5axG+EUPMWL2sVoOE8J1Y+p+gPNAmst8Tr+NYumCc1F
         nAeWbtgxg8KvdaKE51acF7MN25hSE/rGGHigiSqBVxZn4kb9sI3OMxirCGqf+LZoSr67
         ctPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqoXAiXW0RGDMZdNaYa1SedYfu8Qa+gIuXhpgX8gisnNJc164Pa53+Q405JQK4lAkEK0XoK0IYwjeohPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJHC2G9i8lA279ZisxKPATAeAQ9LzbXn0/20/GJ9m1Erlx3HLO
	F391S9yCgJ6yRkmlgLzI0rU/56ClnD6fvTbJ6e7QZwwc+wX2+9ym6ZBCBpSKdXE=
X-Gm-Gg: ASbGncslkmg0r0/ngqyZilJCmCb25ayhRDZXuYY+EG3wuzN8oUPnMNvE1OoqTU7djGp
	Evu8K+/su+V9d/VeltIsGEmNzS+FmC1fwmxt1XEOc2uJg9LkAEDGdyTKDchShRkYrUHora+GaCS
	dYPAz5BwByFnlj6cM7RqBwL3VtACRyDrB7RVEx4gPbuF99hMUEUvFj87zexpabEYr0dFI8jcgiY
	9o/JggGs5cH+9CA8ccMFcyEVUeJUfUd3WH5nT4yTIu3sgClcRFwqpzSui04s78BPJUOwUT+z2hr
	dAn8/I+v9upcqI62C65gsqwe5JEZ0B8JBBQQzQ+v
X-Google-Smtp-Source: AGHT+IFnJamifOhKJVBVNrAfXybocKxTriUWdF1eOL+oFEZRHhkZ/jQC1+bclnbNTY4UiyVy2rPBOA==
X-Received: by 2002:a05:620a:1a0f:b0:7c7:5387:c754 with SMTP id af79cd13be357-7c77dd892b6mr210748585a.24.1743820741316;
        Fri, 04 Apr 2025 19:39:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:ba7b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75ad69sm289271385a.33.2025.04.04.19.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 19:39:00 -0700 (PDT)
Date: Fri, 4 Apr 2025 22:38:58 -0400
From: Gregory Price <gourry@gourry.net>
To: Robert Richter <rrichter@amd.com>
Cc: Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Terry Bowman <terry.bowman@amd.com>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH] [HACK] drop zen5_init checks due to segfault
Message-ID: <Z_CXwnILDyn3e-v0@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-15-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132356.1809075-15-rrichter@amd.com>

Unclear why this is occuring, but a raw call to the PRM at this point
causes segfaults on my Zen5 system.  Later calls to the prm work just
fine, and modifying the structure to include pci_dev info still results
in a segfault.

Debugging this is not possible on my end since the crash happens deep in
the ACPI prm code.  Seems maybe the PRM interface isn't ready or something?

---
 drivers/cxl/core/x86/amd.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/cxl/core/x86/amd.c b/drivers/cxl/core/x86/amd.c
index 483c92c18054..5e3708f9e179 100644
--- a/drivers/cxl/core/x86/amd.c
+++ b/drivers/cxl/core/x86/amd.c
@@ -227,26 +227,9 @@ static u64 cxl_zen5_to_hpa(struct cxl_decoder *cxld, u64 hpa)

 static void cxl_zen5_init(struct cxl_port *port)
 {
-	u64 spa;
-	struct prm_cxl_dpa_spa_data data = { .out = &spa, };
-	int rc;
-
 	if (!is_zen5(port))
 		return;

-	/* Check kernel and firmware support */
-	rc = acpi_call_prm_handler(prm_cxl_dpa_spa_guid, &data);
-
-	if (rc == -EOPNOTSUPP) {
-		pr_warn_once("ACPI PRMT: PRM address translation not supported by kernel\n");
-		return;
-	}
-
-	if (rc == -ENODEV) {
-		pr_warn_once("ACPI PRMT: PRM address translation not supported by firmware\n");
-		return;
-	}
-
 	port->to_hpa = cxl_zen5_to_hpa;

 	dev_dbg(port->host_bridge, "PRM address translation enabled for %s.\n",
--
2.47.1

