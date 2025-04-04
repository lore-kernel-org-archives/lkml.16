Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C98282EE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743781016; cv=none; b=mDBippKCb2xaXr6Hk/IRyKAdB77Lk1M5SxMMEd0YYTkMMyrHjz7u52tAxy6eLLHFzDtkKmZE9PA/G5xN8LOf1zGugTTvDSkWD6H5B+FdwyNpjY2s6gHvRS2zSedOCLf1N1kUIsucH9OafrsnSMlDhjA8fJAwHbpTvstQQHm8TAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743781016; c=relaxed/simple;
	bh=g+0h4aQ5Z70IQPz+rQ/77kw7q+wdFaAD9l7dNG9FGbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFOV3uT3quuYWTNg1ssHGSSNvOLUvW5zfz6b7+x5n1K4X0Rsggy9jfeXPdRcEn7sUoRdADztSZdv1uENI7+ZIJwi4bwoCXHDCj72NncwWaeP2bRF0ZHPAtOo/pHG+FKKRvLl2WxEiOyV7jXx1uc5alLHUid/9VJbSN7hRnYmPkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XW0si7me; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XW0si7me"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6eb16dfa988so21720996d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743781012; x=1744385812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B43g9c/o/rHrH7JhcXRPYa2+wmwxTP1Eq/J3fv7ix5U=;
        b=XW0si7medXYMH1akXerlW+mAmFPq58TS6+AvvXR1ls++jbvBFHIlAawhVHOal22VTD
         WvcBmnReOZfN6EOGQLmlrZ/MoSYuiN/1UszsFhDHtv3pLMNq5ZkYIvptOKZiqJ9szZXl
         BzLCvhkqj64PS/NoW/9jxMoviD/WYmrOHNA0LILvDylzangvBjKdxm2XEWLj1VQD/wbT
         FywYuB21hGPcAy82DNL8rdfFdBJwxjml7rKYWT381XmosA3D1kxJOEEXyUi0VPJ0Y1hU
         fKDgsJHMuyqJjrI3Q+KsAJON1Z3txkdhoYR2IO1Goo2zxU4CvQ3gTeCPscA1JjlXu1rb
         xFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743781012; x=1744385812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B43g9c/o/rHrH7JhcXRPYa2+wmwxTP1Eq/J3fv7ix5U=;
        b=hK71EpYansD9nFsMO/2A3c36dXgvoFB8Nnxeq0DV791TzT7wXpV5UGqXJ87FylI+/F
         f7w9jKwGETWRCk/O9nFHXiB2cBNRErEw0jRCMlVcchmIZWQK2ErmKT5NeAbjNVYBNpgB
         BnnRUxsxiN8AQqYFsK5NvtuUs5tp5dnoYrYBGUl+pDDfkkLQK/4wpW+lYluZpNHD9zwj
         huqeuVKX09f4/6kqANca4O/1zvTtMipZljs1014o61FUEGkthlHOxSsU1AHHg9ERMdnX
         mzztGGIb+/yytfl2+zIKp4iFo5hwck4UT2Rfz64LTY0qyoyFCrgMgsi81cn1VLpeApXF
         tZIg==
X-Forwarded-Encrypted: i=1; AJvYcCWXz/dEnKwH27rx9XuUHMMEYPGz8Z/SPF5jVt5R10aNx8HC2S+FN540dXTk74FsN78dMr5sd1qE3azkCMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYUhU1XD1bSPQrNMLIk/3gB7cQ62ah6KL8C9M1jvMYp0QnA2Gh
	XzVbR85CaBLaN92rN9zYpaBoP10TrOpn11w1u0BLu9ymCBTHINPsMgcTbAtiP5A=
X-Gm-Gg: ASbGncvCLS7H0DDvqTDfmZ2Uar0S86ameFM5kz6/YdXpj8ny5UYjYc1Vr7d8dR1c7vC
	AV9bvqTRpNGhZjrNjmdkClEVNc8R9YbPj/CP0WTZkQfJrNFLFSHzRLfY8S829mpX/L2f9f/S2yS
	zcZYfvZBRdiz8MYD7MxOFhEk6ZjHZx1ExmvzEZ+V9Xu5Mg2CWHYzuA8h7AjMNxfL1hy39fD7vee
	LqOA+EOp7AkyD1be/X8HcqdZVKCD3p7hqWAA/Gu+76u8YYWqsCrX0bZnZC557YfMbIhSGGO5flm
	8BqiIEbZ7NBShiPeMZKk7ND9x2cqdjBe0LlcMcuG6A==
X-Google-Smtp-Source: AGHT+IHzsl/rGB5TpApac3V8REUo608kA5vX5R7bGjjtuDduI5bJPlPMS8A6Ptby0Z2FAVJ2aWmSPQ==
X-Received: by 2002:a05:6214:f08:b0:6eb:26ed:4d87 with SMTP id 6a1803df08f44-6f064aef3abmr49700076d6.31.1743781011733;
        Fri, 04 Apr 2025 08:36:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:500::6:e00b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f047c9asm22850266d6.59.2025.04.04.08.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 08:36:51 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:36:49 -0500
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
Subject: [PATCH] cxl/region: Continue recalculating position during sort
Message-ID: <Z-_8kRHep5LVeuvS@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-5-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132356.1809075-5-rrichter@amd.com>

The auto decoder probe proess overwrites the endpoint position
temporarily to record its temporary location in the region target list.
This patch restores the pos recalculation during the sort target process
so that decoder probe order doesn't affect region probe.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/cxl/core/region.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index e1ef0d577b35..8c79c0a39d56 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2061,6 +2061,7 @@ static int cxl_region_sort_targets(struct cxl_region *cxlr)
        for (i = 0; i < p->nr_targets; i++) {
                struct cxl_endpoint_decoder *cxled = p->targets[i];

+               cxled->pos = cxl_calc_interleave_pos(cxled);
                /*
                 * Record that sorting failed, but still continue to calc
                 * cxled->pos so that follow-on code paths can reliably
--
2.47.1
