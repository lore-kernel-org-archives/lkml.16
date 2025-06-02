Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B02C3258
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748882562; cv=none; b=PiaW9j0oF1zCM9iLK5T7FEP6Vz7zYZcfVmAa/etr5GWkCKbK+uw7YAs0gjZQM5k8qSwNjb3ZzDPNpEkz+qVp2dv3IzU6TRVKrugE1Q+xyMpX8wDUcoZpCD7dAH6knqiM/E9ncD/Yq7sXQ7BDpm8JgmSJKTodg3YtYifQ3+ZxYHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748882562; c=relaxed/simple;
	bh=BgdhpJZ2fQ3foLwOY9NyLQsZlsT3hmvzC90OuJGB8M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3l0WW7I9xgvj0b/0ZOR3eawRXawLkZuk7Je+C2K2V+9wpZqAQAkJR9sW7tTz1I0d9SCgPdlRi7CrdOp74zdI0aD/ab/1cI1x3wU/buSYcuIcR2Jd1v9IXUTj7bQanFGoLUisiararsJPO1VuMyBlWF3haBM2Ldgdl/WrShPMpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JyNTcwI/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JyNTcwI/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748882559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RG6vQnTXIdy15ySbkmQBFYuQQUnIkIj2HwDJ/GwA2CY=;
	b=JyNTcwI/gepGz4suCmj0cZSHz9SD7gwVE6qwTQdSEPlkGR2a8OYEryhqwbUhtz7ao7QsD2
	n7+j/Dl5hemzfyCp9EfX65LBVSWylPYctL5Hrl/CFjBS/ljhsqGRgoX5JRrv70nOJqND4r
	Q0pAQweEdWSzWdMck1JzTsJIAvKk+QU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-IZNOxd79MomdYzkwCBq6Jw-1; Mon, 02 Jun 2025 12:42:37 -0400
X-MC-Unique: IZNOxd79MomdYzkwCBq6Jw-1
X-Mimecast-MFC-AGG-ID: IZNOxd79MomdYzkwCBq6Jw_1748882555
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43c1e1e6bso78304321cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748882555; x=1749487355;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RG6vQnTXIdy15ySbkmQBFYuQQUnIkIj2HwDJ/GwA2CY=;
        b=DWT8Yi1XLbhWoTPJzrlyx2TF0fLn0OowgtFUsFggpPGoAkIujGlEu1MfIQW6p0Rbqs
         UjtBiKYoAQlFUadXQUzi4Dq4s9YOaRKZCC7NCEqWMlsuRInFEINXfxS+tVOaecEQJ/dc
         SKunCTYwSb/wj5NLdFUGeokyZDSUuLe9MtvND2L+Wpj8BVdZmfnUaD+0xEmhPvj0ka/g
         UvgG5/uX6vqDaTUq1YavGbik6Bon3JLGUtjy5ZU8rY72WM0zS/tB04cO0cqlwJJPSNGH
         gOd+/j03753WGw3Is9yuNUTqV3UurevHlabN077heeATSA0X/5eARsyvB5g4LuPXxc4+
         I0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb5HGugZmKZrB3N+GEQaVEU/24wd9dpHeBHfWhE9IrhzdY7Ya4mplaHQjEHWBEILuirvfOwyNy6LrcFsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo2w2Mu50R1uuRXTSFpXU8keSbKW2RcyUtzWYWGWgwKEK20JGd
	657ImFpVEp20pPHjZ5x04aI6wxChQpbirJIWRwxtx6lKLGAsdd2+t72MOj2GOzQzmTp5VbuF2Xb
	3kp9DvUpwXCPnjSucTWUAzR8c278z6cT+hc+4e3joV1xOodRLIM0baJvVuoBAU3RKxg==
X-Gm-Gg: ASbGncu5D22z9fAoRD46KHYQbhAkxx8bRI5nfBB5XcrIFwWP6NIh05pk2HYSXOWqayd
	zk91Ux5oBw9Fengs2tT2dbFgQFvyzg9NxcidoVl73LTQgtClQBXdaVWVtwhpqCwBERuVPYPrlXL
	Thp9ajtv+ANRhWHOVnHh5mjTNtvigwnfpGpNaVFhDbvNXB0J9XtCU8ZnGz0+Mm8hg2HScTEopdQ
	KPcoMsh8cxBxxbr3J/xVGYYsErbrKiL6RXwyJ4WMuOcx3WujSk5y44a8HPZ/8n7RK77RE8nFdcz
	N8Cj/AckLm8LzCR7NkpTAzTemHfvofCbmTrfghHVpltf6w==
X-Received: by 2002:a05:622a:4892:b0:49b:eb1d:18ac with SMTP id d75a77b69052e-4a4400c9d4bmr223613311cf.46.1748882555424;
        Mon, 02 Jun 2025 09:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENRw+QqNZI3Bi5UrA5ie1HB+zDvD2vqTFq+6w3eusJ9qqehySX6Uw9UO8GHHB6rRtWVJmU2A==
X-Received: by 2002:a05:622a:4892:b0:49b:eb1d:18ac with SMTP id d75a77b69052e-4a4400c9d4bmr223613121cf.46.1748882555102;
        Mon, 02 Jun 2025 09:42:35 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a840bdsm57531601cf.77.2025.06.02.09.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 09:42:34 -0700 (PDT)
Date: Mon, 2 Jun 2025 12:42:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: add a clk_hw helpers to get the clock device or
 device_node
Message-ID: <aD3UeFYUngs_hdmg@x1>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
 <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Apr 17, 2025 at 03:44:22PM +0200, Jerome Brunet wrote:
> Add helpers to get the device or device_node associated with clk_hw.
> 
> This can be used by clock drivers to access various device related
> functionality such as devres, dev_ prints, etc ...
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

