Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E72515ECD7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745879242; cv=none; b=FFnyUfeoFGmW+yRpaYacf6/BUIsZF2b1ahwS0LVb889fvZ17q6LfXnjXv6Ld1BWJ1Ww/Y/BneLOO8/pGWAc4+6NLophmf76ek2EERnRJIteQnMl7rRY8OScohC5BBwZtqmdf+kp0n3MpSoIo+zGnEGd2Cv20zH3qiLGEZjiIcKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745879242; c=relaxed/simple;
	bh=7fnMKjBox+OEBVjxHcU5z6wFRkR5xtmGko53KNWRG7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3i6b2WWAQ/ZCllqA4pXwWp1ayrWkZ21bxOQVtdhoCIpCTDk1qMOI0P01oc+mnqSJPfXNwzARR73Urf01UbpwKe40EkJYVal2JyoXOdhyxC5EycxrbM0S2Yi+1NDhP70pLw5DArm2qtPAtTh3XVKOIb48QRcw1r4tD20hsMF9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KBcOCYm/; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KBcOCYm/"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so69932086d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745879236; x=1746484036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3fuP7VLRjygpUBUrW1Nki1gvJTEsUdPya9I3sGV21Rg=;
        b=KBcOCYm//3TNaWxM4bMwM9e+uOn9GiICvdmseeggJLJ2HXFuFtufikagoqOOZ2/yJq
         cfZH0goP7dvDo8YPLTktsSwskGXG62jAJkg0LL+clXR45xrN+k3O91XnjebyEHybxK6a
         GKWs/vdRu8zl/GOTsuvduuLPEwm9SRBHA/Xlfng1rpMg9fPzUTXAXxrL3M3Eezkagyrb
         IdfxKibT8Z7IepdHkKDo3zY4XoqNio+SW3hILdgTMgX/+htCTlqUi3BUMQoTtPPB/9xZ
         kQeXN2N8fHQhA/nr6RFu7u88t9Ke7UyihNc7o/JIdHKSxTpu4A3L3Eg4IbDlez9WyB5u
         Cw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745879236; x=1746484036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fuP7VLRjygpUBUrW1Nki1gvJTEsUdPya9I3sGV21Rg=;
        b=Cqe5nOMpkOAUhIDag/LpFYa0IfqMYucuoaI5PszhhbRIv/uWYlCdrgO+IxgHLC9x4a
         zIW0QE40G0DtGxxgvI1iXxlX/MjBRBLiPJO/OvYNjggi+Rlp/Gq06OOm4IeO8RnNJCvM
         QEw2HVDCCKA//agGoWZs9wOHPacSxEFMfHff/wR4C7nPbyP4uj7FHBGm4CYVp3QNo8PT
         u9JFzzBf1sAAXvNwgMAcIr6jZQQFRbKvQdz34pJsEEjgEZu+dHS6yNKcNm7ZrAOfky2G
         gb4vdsGSV8Me07XmKOaJq2wj3wlxGMfZRAaFxw0z4Zocqz16iZBJkY2WAkV/T7mYU3JL
         jZXg==
X-Forwarded-Encrypted: i=1; AJvYcCXpPntBsg77ySOW4HdMQvx70fuv2Cxl94gu7B37i5zFA6OITgV1mIkKMhsqKbCcHRWZCPGjRC38+KWK5wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUL2rcK7KMmEOWIt6GNSAUOKenzrs+OQpclUoTdfzdeBUMq/3m
	t/Po0BkOx4e7nue/MveUUkADY7a1x23FxC2+LH2zqLlrb46iPYePKOdWIPpU5BA=
X-Gm-Gg: ASbGncvf8saHpIDmMItKvxDFtv8hciVATLwZd7XYdyRgEu1rivZ+rorYeRQePfWxgM/
	N/JPZYXqvBbuynr2aJr4/TlvkpZUlD0/tHykPRhen7u4umtxgIHunhT7IHbycaVAQXs2ieo65V/
	Z0GsUVr1Z2vaMcZaEgn25ox+eDgS710CfUU3W4e4FJa3OLCOlZN2uITA69xd1hVLdWPIGZTruo3
	xZ4+iASAUW+t2oxXv7LhJkks4/V9OrAu9pBmBD08G4Dqjk/dpbLJIZDvpmYfmHGnecL8vU+6S2x
	SpfbcJ+FOB3aiN7iAlJL8EBtPKUy0WFNVJaV7iZwiXH8/OOZQ+z1HKGj5QimEQRbk24xZ/S2b3u
	78xz/hGHuWH+IJff+vzdhUO0=
X-Google-Smtp-Source: AGHT+IFzppIoEenYmm9CPu0E6btppZX+5Vg+VhrXb8lAiNGRQH1YSHf89Ar9XNk4Jy4VQsxooriCpg==
X-Received: by 2002:ad4:5967:0:b0:6eb:1c23:63c3 with SMTP id 6a1803df08f44-6f4f1aa66a5mr17281846d6.0.1745879236406;
        Mon, 28 Apr 2025 15:27:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf904sm65706686d6.101.2025.04.28.15.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:27:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:27:14 -0400
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
Subject: Re: [PATCH v5 08/14] cxl/port: Replace put_cxl_root() by a cleanup
 helper
Message-ID: <aBAAwnQ8x8235rDj@gourry-fedora-PF4VCD3F>
References: <20250428214318.1682212-1-rrichter@amd.com>
 <20250428214318.1682212-9-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428214318.1682212-9-rrichter@amd.com>

On Mon, Apr 28, 2025 at 11:43:11PM +0200, Robert Richter wrote:
> Function put_cxl_root() is only used by its cleanup helper. Remove the
> function entirely and only use the helper.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>

Reviewed-by: Gregory Price <gourry@gourry.net>

