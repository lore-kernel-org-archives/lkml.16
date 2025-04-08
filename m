Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA23E1DDA39
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744127691; cv=none; b=msmlQdwoFTexTN/uir3tCTfs1+vRMwcAE4wfmtOZ96beEwnawic7RQprhOi00CMM6t+p0/DC07pmqQssV9rABN33ZHO6E52w2CaEZ/XEKiBWpgWVH5RcJh70XjPQOk/TXqotTFJ5HCFzTBWHfRKCSWBrJTjpiWhy9N7b+xsLxdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744127691; c=relaxed/simple;
	bh=pZvZAh9K3OnVLJI51+JGEJzN6vZEjWcdJE1dp3PUYMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhtWQfF9NCIsTdBlfudi1/wzWlw7yNkMP5gwZACfzYXy6KqwrfApvOcRLN7hPyzpawdJjX3xcaaT/xPwKlWWVfelnwJurxWLPNDXDBwpsEJpOmS3A1KC+YYk7ALetulePpCk2VQPuJl/f/8OL0OAsXUjJyChdeI8qoA/CL5mI5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fB7aVGhZ; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fB7aVGhZ"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e39d1db2so334616085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744127687; x=1744732487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QhPGlZ4HGuVcM5RcO6C2P2yzFgj858ooi3NwDhq2GCw=;
        b=fB7aVGhZAyq+Ap4D+ux8szx1vCthEfe1a3MN7vvLCO+foLO2eDN8ZbQevKjIUFCGH9
         Y4pxRa7SbW4twFD6IFqCZU8PMklXarVmCXkknNbgd5do46mMk4S1xuyUwjfCGDptiYjW
         kGTEiPi8mCPMChA1AnfvKD/uM6oFrbcMLnwas6tkK6pRss96u8igCnOZErSO4ZE0J5+A
         6S5WccVjmoh3LoHe0y/58cTbeT+5p9fqatJtb+32ya6rmLXVSyofSnzNHAgdygWgnXqw
         jvvPt7TsOlRY/SFCUe4WMVDbEpPZrvxSj7KO7H941PddpmZ02aonVoxaLNRs2k3Ksq0H
         YURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127687; x=1744732487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhPGlZ4HGuVcM5RcO6C2P2yzFgj858ooi3NwDhq2GCw=;
        b=J0FKG8DGEse5KJayvd5pdWd6fpfasKGZjyMa+69+0JHz3hnN7efCIPdqOx4CELPyhk
         1OCDJYKdjq+Un/YnLeVGKc5CAclSor2vmxjhIs884wGR24ziXlUMnL6NWD6cEKlKHnem
         2xPeC8b6hs9kICXNN3T5b32ncjy5mFAg7gMBcruGM9XlVVTiYsM5e3MAckQxe9ZQw//h
         6hyfImijTzekBNo1EWyBMJf5JfP5YKShJrl2c7h60/w3jVv+pdwUU3orBe2awnPV8+F9
         EuWr0RLnAEKLbzjCx56I/4ejCS36dPKEkxJ1fJU0z9qgNeJCKSbJVd2cPym/uEfezPc+
         1l9A==
X-Forwarded-Encrypted: i=1; AJvYcCVQTcNlVc8USwe5arRSOkz/41Zr5RVPEfKznhh9QmGIY97W0ZHwGkx0wrA2e0LD8ZL+owVAghxpt8nqtmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwB4JKfEU7evFv+8O94yc3h/q46FgIuwuhk0voiPWYAZgjSNbL
	6tsefgZ5cnbtWX2x/VlvU2BfovJQm9vjEPFEjVwQav2nZa+KKA7c6ZtjLxHwoHg=
X-Gm-Gg: ASbGncsqu8PrXenoYCdVF3ZOQwChG4emfWZtIrVWL5lLQJzq32zW4m6SrrxsrhLMSBZ
	f5jmvXRgGa9oCxlhaR5oLLHeNy0y0goT+6GquDRsuAw+81PLyoR0eCCevO0lyPCOpZvB0omRfkI
	FwrVrU2k3Zyztz/glJkfzoR2/g/jsI02k2PEhCgKyeVckLiRSgeEDxMvhjMUJWZkZ02OmiszUjp
	UNRreElNH6XOBTc7NdYIFf/9/ofdBnU/gmFO8kgsOxuX8u1ufUp1EnReov9hY1tGjRcL9Wc7nsR
	FGxrZwFSM3oa5tP84/+LwrcHlhvefhxVk9zglGdPW/QB3d3VTSnSIcyxQcTxd8x10QO3Hy5eWrX
	TCIoBNOdtnJnDKD/qFjc8GZxTrDk8QjMDOUm05A==
X-Google-Smtp-Source: AGHT+IHsAvOryhtVKAHorScpMEhHtZjUA4/F7L7QlQNa5alIriNw3F6inyS9C/MFkRauYugGUFrZZg==
X-Received: by 2002:a05:620a:2550:b0:7c5:61bc:70ee with SMTP id af79cd13be357-7c775aebce5mr2058488985a.52.1744127687619;
        Tue, 08 Apr 2025 08:54:47 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14cd99sm75558716d6.101.2025.04.08.08.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:54:47 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:54:45 -0400
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
Subject: Re: [PATCH v2 11/15] cxl/region: Use the endpoint's SPA range to
 check a region
Message-ID: <Z_VGxdwtsbKvLMr8@gourry-fedora-PF4VCD3F>
References: <20250218132356.1809075-1-rrichter@amd.com>
 <20250218132356.1809075-12-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218132356.1809075-12-rrichter@amd.com>

On Tue, Feb 18, 2025 at 02:23:52PM +0100, Robert Richter wrote:
> Endpoints or switches requiring address translation might not be aware
> of the system's interleaving configuration. Then, the configured
> endpoint's address range might not match the expected range. In
> contrast, the SPA range of an endpoint is calculated applying platform
> specific address translation. That range is correct and can be used to
> check a region range.
> 
> Adjust the region range check and use the endpoint's SPA range to
> check it.
> 
> Signed-off-by: Robert Richter <rrichter@amd.com>

Like other patches, I think this can probably just be folded into patch
5 under the comment that cxled->spa_range == cxled->cxld.hpa_range for
all systems that do not implement a translation mechanism.

~Gregory
