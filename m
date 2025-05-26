Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7931D9694
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252173; cv=none; b=dUPE7Qt5BwlilSoTTtjvb4u2MZ1xp8OBFV68wopb3vYUY2l/IxuRDkBibZtJFjkqhJ1E5WJK2kQPFT3Cgi2Ri8/Zk7idpDIAS7YzfWyF7AskGA+y4ULNyuIW2acza9258hMrizSudO8gIEEa88ukGAVo6o6QYIQvVSgvhrb5dYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252173; c=relaxed/simple;
	bh=X9BRM0LvviL+8wFs3cVyB9IuGOiHLgzwjeAZMfe4f9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1pzfEWCT+bMkXlbMuXqCiwVbPmWV02uKPPtl3dRdb0emA7ZzhmSQVRGZ5QyYjbQG+DJpEr/94NvbGAMdhkdn3IV2ithk6Pnd/4sTq/OrEuNWFdHxIJZq2bGAo/0X4V5KFLFpNkMlIhD0H55zCHkIHhYMdTyR5BkpOPUDRALcaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=A+peLNPN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="A+peLNPN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso15274725e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1748252170; x=1748856970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X9BRM0LvviL+8wFs3cVyB9IuGOiHLgzwjeAZMfe4f9o=;
        b=A+peLNPNPt8pr95XxQIWNeCpXcnUWJPuGKZUIV59fEHRoCRomTw0Kj5RtuYVZi+QGG
         U1Z1Z/h+R5+6mSNn7Bh9XMlMt64FSzdG0HBzyQB6SKxEZ4keHIxXrLBwCWEiScZ5ERPY
         5JR3qwlntGoCjO2IR2ACOSc8wTMlxgTnjHcL0bb1+SH2KvFWXzI9YowEvBgm7WzeLo/p
         axWJm9Jto+wbCpWA+iSaZD3NzsEk1NqGXsTOXMXlIXu0i2CLjC4fQOXh57G0WfwlJ7m0
         81mEVjAdSvebd0d8EQMj+kxwnuRxLiKP5ZoPqg0cCc2z2c6VdA6LOoIh7SXAmLGFMrHe
         oA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252170; x=1748856970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9BRM0LvviL+8wFs3cVyB9IuGOiHLgzwjeAZMfe4f9o=;
        b=cvoz6IG+q9wzuWVX4hSKCeMLFzWlaca5lnEkHpw/StswIV2UuLPt1K1c9mNnTBWNa+
         s+yopopWqT2aHAE8NoA/+tFx+9HzhOYsBR0B4o8xc1oIdvV3SBvcURhpHXUb5btBRASh
         igqvSBt8osPgulDJPbTe1vDqLpS5IZQQgVlJ6DB1zZvShKVSruSbkKCscohP1MrQve5w
         rZIurj18ky/I6b/SD85Rt1k/upv8nSY6BPgU/a++WW8Sk3UixWgBXptUjTTrT8Aeq3Ye
         hgvtXiqLDgNoowfZOA3bc8rqj27JU3OnOEXV3SaSgv0Sjqt6QvhmvtcjxBT9Ja+d5//g
         NpWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvhOJLEZKizAgVWR2GZvC6iXkbkRyesjz2iEgV8FbGrEUeG2+lnOmZEJU5ppvJYhQIyLVGHbKg7lOHxLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZv6WbusZjZSc+ms28lr1PFyuDlascpu5T+r52huE8OAmqRjJ
	JTogYlTgiQ5KMAnjg+fqxXpj+D25RJNpjRgukLp5T0zcQdoHnVKQaot8v81uWeYCIaM=
X-Gm-Gg: ASbGncsELuBBkU7OmrartMyx0CokfqKL6DsXVVDaVSsjuxiF9feReVYQUtN6mUItNgX
	8V+s3QIdyYWYtnIVBG62XRP8/D/RNO5DTPPdtuvldeJ/sLh/GIXNIhVeXsT9RIcUy1vi9ldfodd
	lKAtYL/0rnnQ6wI7DfuSjb4sx8xyCLZ86nxK9i4ESxuWxYZnJ5Fip2DH4tkYfvv2x+mChxC5AZD
	iEBWgHOI976fEdUEJAODYQpCsyDGuEvg4X8sLZnc29miCppKE7oShgLaylxNfNoyAKk1sKqOUbu
	6FHV+JS6iuPgMHzxTTPImZUi1VXEWDWc/sP6ZDuQD/LhKV9N+JGgoy4m3KME+8sDaqs0dr8mnNB
	Npzg=
X-Google-Smtp-Source: AGHT+IGDSx/uqIzjPbt/RIIG6sl81DhorcyGxspFB+QasTmVd+rJASc8gBkYSwK9BSg3kAtpjSzzEA==
X-Received: by 2002:a05:6000:2082:b0:3a3:ec58:ea98 with SMTP id ffacd0b85a97d-3a4cb45f1dbmr6352050f8f.22.1748252169629;
        Mon, 26 May 2025 02:36:09 -0700 (PDT)
Received: from jiri-mlt (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm227117135e9.2.2025.05.26.02.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:36:09 -0700 (PDT)
Date: Mon, 26 May 2025 11:36:05 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	aleksandr.loktionov@intel.com, milena.olech@intel.com, corbet@lwn.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/3] dpll: add phase-offset-monitor feature
 to netlink spec
Message-ID: <2xdi4cs4iuvio4mm5qx3ybu2i7ceiwexjgj426uodujgza742y@t7cjhunlpbvd>
References: <20250523154224.1510987-1-arkadiusz.kubalewski@intel.com>
 <20250523154224.1510987-2-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523154224.1510987-2-arkadiusz.kubalewski@intel.com>

Fri, May 23, 2025 at 05:42:22PM +0200, arkadiusz.kubalewski@intel.com wrote:
>Add enum dpll_feature_state for control over features.
>
>Add dpll device level attribute:
>DPLL_A_PHASE_OFFSET_MONITOR - to allow control over a phase offset monitor
>feature. Attribute is present and shall return current state of a feature
>(enum dpll_feature_state), if the device driver provides such capability,
>otherwie attribute shall not be present.
>
>Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
>Reviewed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
