Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072AC22F15C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791156; cv=none; b=kumSCsYOHzGJdXvGlkDVqwJxXkx2rNpLUB3HWRbS+R6m20YoKhIby/uMOR+iTuFxpVQHm3Y0oeTNPuB8NH0T//dYvVed9CI5//ICahxnSek9s3Xdj/otaDpYau0PuXhUmNe8cdQs8NvIYojFr5/Og7qwZpHi8gubK++ZiEUD43M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791156; c=relaxed/simple;
	bh=UqpYDKEGBNrCP4IDpHxnNSRgmJd86ZMFLlHPoSsuwB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRO+4Hk3N5j92z2mR9sENmkm5BGAW1erw99vVXT9HrUjEa7Zftkw7XrI89jvfKHgPn0sn91Bf3MWCda1njNs7PPqjoUVQk2nrxsrYwXfLxkzB5ieexxMjEcNS2ba8XNUDb/aU020WLULHWBCJpQcxBJpiqLX6o6KcWK41//zPUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=a4k/I7Nx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="a4k/I7Nx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee623fe64so128590f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1744791152; x=1745395952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/4bHaraL4n/P0iTE+QqqFajLDyDWyG2jsQgWhbDjMQ=;
        b=a4k/I7NxfE+MLqX6uttNSUyfNND1IYa04gaTanD+jFTxoEmHv1Pny+Kk8nnpZwJuFw
         wfYL0AIECiNy0eiv4FiYtI/a36+rwPoIV/n1iQco6OH8YbpXkdcB/7Kgiv6lePpvb7Qv
         IkhEEMDfgT8+3/MquUa/UR8RgyrBLKhoV6XOil5C7lWa9MqOAthzBKNZONwtY+RW12wz
         47P8ZGGy+BSY1Pl1LSkvdGkRe0ssXeFm4keYjgCQfGf6QDsJJSWS4tY6oLhwSGUdu9NZ
         XPAnpqsFsy1pd2uxdamq9FkT/XfDqtUIOiAgbkjEgdUxG+AQBlyE1ww+Azfi21Rx9oD1
         xQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791152; x=1745395952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/4bHaraL4n/P0iTE+QqqFajLDyDWyG2jsQgWhbDjMQ=;
        b=KqFTjSJvikod0maLgHOxBMTDeKJiKWnyeMYtuebGz5mPcUAiI9LEf/MwskcG7aEv43
         ywlccAAI5t6N4jvT1FooRwZh1IMPwLubMDUdS6PrzeDNlnlhTGMbP0QdpY2zaB55bl7v
         51g/wfLCY1aSPSqs0Jb8GNscT5pbTjw44+VSL15gg4EwYnsg1/P12oJw9RoInhCDIngJ
         DaA0K24a8Li9LEsAGRrO8pfXgnVRP+pvt1C8HofKmpZTjApAWhFznvOLPFhjOrnJzWj/
         9MJvmtJoZKIBr7aHlwk3X9FrHPQU1+zz4OXJdZZ5K24P5rjCl70287Yx8tGaBDSRQG96
         kDXA==
X-Forwarded-Encrypted: i=1; AJvYcCXqf2D6uFRCL+MufAs0v/aFJ50oyLUx5LRLz/Q3gO5QHyglXkP6Pq1vwnh+K577u71FJXbTaGI5FrAxXfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxezwNn1D93jjeaYkdy1f4otaRNrAEyxsXFKKLOz4K0zQn5KHW5
	Mmkl0kiNTOCy/a5DU8yDFYT1UZNPRoPdhlqUD65IGGFIgbnURWpYdxzxbuAo06g=
X-Gm-Gg: ASbGncvzJ+EqXFDdBuZ7bAHi9aCair/vFbQbwaK/bbEmY8kdDkd50w7yt1HkSGtdf/G
	VVKw8lghOJQVVG1GowwXfUiw1H6yn9Lo+EEO8963EpA4ArTlVAOcF5ll2064od7IeiYsvFd9ciY
	Vic3IwQ9Wb96DeGLZYeIO8lBL35mYATn2WIjdA3xqqkm4ywGoz6CSQJpA/yB7UukSd4xrjSg4RC
	M3eKszCOM2bylZq0GTHPnCc5sK3KziRh56I2qOSoBDBFxvNMRWJLo3LWtxP468w+EmBLdNvOfq3
	dX2jtsK+ZBdw/y7iNw3Ijk6++sM3AXnvFYTgYS3pi/rUTpKqQiJXKg==
X-Google-Smtp-Source: AGHT+IGxaQcIkGTI0aBQCrdg5Mdz1bajPY1DljdFhlFnwzhWRIuUx+MIrx6GZMLHMpwt9t1FLRkhxA==
X-Received: by 2002:a05:6000:18a7:b0:39c:2c38:4599 with SMTP id ffacd0b85a97d-39ee5b9ee51mr819435f8f.48.1744791151941;
        Wed, 16 Apr 2025 01:12:31 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ee6010449sm515446f8f.9.2025.04.16.01.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:12:31 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:12:21 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	aleksandr.loktionov@intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next v1 0/3] dpll: add ref-sync pins feature
Message-ID: <6ss5qghishcbbbmj6ifitafl6fnbfhnw6crrkitgunays4qtqv@ixvlqemyij6x>
References: <20250415175115.1066641-1-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415175115.1066641-1-arkadiusz.kubalewski@intel.com>

Tue, Apr 15, 2025 at 07:51:12PM +0200, arkadiusz.kubalewski@intel.com wrote:
>Allow to bind two pins and become a single source of clock signal, where
>first of the pins is carring the base frequency and second provides SYNC
>pulses.

This is not enough. Could you please provide more details about this.
Motivation is needed. Also, from the examples below looks like you allow
to bind 2 pins, in async way. Would make sense to bind more than 2 pins
together?

Honestly, I don't understand what this is about.


>
>Verify pins bind state/capabilities:
>$ ./tools/net/ynl/pyynl/cli.py \
> --spec Documentation/netlink/specs/dpll.yaml \
> --do pin-get \
> --json '{"id":0}'
>{'board-label': 'CVL-SDP22',
> 'id': 0,
> [...]
> 'reference-sync': [{'id': 1, 'state': 'disconnected'}],
> [...]}
>
>Bind the pins by setting connected state between them:
>$ ./tools/net/ynl/pyynl/cli.py \
> --spec Documentation/netlink/specs/dpll.yaml \
> --do pin-set \
> --json '{"id":0, "reference-sync":{"id":1, "state":"connected"}}'
>
>Verify pins bind state:
>$ ./tools/net/ynl/pyynl/cli.py \
> --spec Documentation/netlink/specs/dpll.yaml \
> --do pin-get \
> --json '{"id":0}'
>{'board-label': 'CVL-SDP22',
> 'id': 0,
> [...]
> 'reference-sync': [{'id': 1, 'state': 'connected'}],
> [...]}
>
>Unbind the pins by setting disconnected state between them:
>$ ./tools/net/ynl/pyynl/cli.py \
> --spec Documentation/netlink/specs/dpll.yaml \
> --do pin-set \
> --json '{"id":0, "reference-sync":{"id":1, "state":"disconnected"}}'
>
>
>Arkadiusz Kubalewski (3):
>  dpll: add reference-sync netlink attribute
>  dpll: add reference sync get/set
>  ice: add ref-sync dpll pins
>
> Documentation/netlink/specs/dpll.yaml         |  19 ++
> drivers/dpll/dpll_core.c                      |  27 +++
> drivers/dpll/dpll_core.h                      |   1 +
> drivers/dpll/dpll_netlink.c                   | 188 ++++++++++++++++--
> drivers/dpll/dpll_nl.c                        |  10 +-
> drivers/dpll/dpll_nl.h                        |   1 +
> .../net/ethernet/intel/ice/ice_adminq_cmd.h   |   2 +
> drivers/net/ethernet/intel/ice/ice_dpll.c     | 186 +++++++++++++++++
> include/linux/dpll.h                          |  10 +
> include/uapi/linux/dpll.h                     |   1 +
> 10 files changed, 425 insertions(+), 20 deletions(-)
>
>
>base-commit: 420aabef3ab5fa743afb4d3d391f03ef0e777ca8
>-- 
>2.38.1
>
