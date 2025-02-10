Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74441C5F0C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182668; cv=none; b=JjWVPBLBWAlADuAv6ADNTo4hRV/Au0FdzTI03Gfc+vZ+6TjjuCR3O4nU+r6hu/FcH3O5Rme0K1JHG7awjjH9kJg4zM9HZS+8MW3sXphrgwkTC56PDDSCz5cZpZH33Bt7ajSowrYYCe16aU+7vvvDUBKR0V0J4vRpD7wFoOYljnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182668; c=relaxed/simple;
	bh=ZSL/qGmugR1ce7doF3eXwejZY+twQt/eF8UuLMVs69g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mo3xG22AJ/srOXF2G1nEAqBrwnw0teHf+JAQv584fVUPfbFlRHxHdJ89sO0Qy+7sONfAmXiu2nlt/BXt3mF1I3WfTq/iT/5vr9RhjGtMbSb0JZY1CjgHqvMtUVG3pTZuCJ+SbW+YNXcdEgJpib9hkd6s9SR/exdXsV5squ9CWwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GqnTQWaG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GqnTQWaG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21c2f1b610dso102260675ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739182666; x=1739787466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9i0AGLd99zO9PPisviE6AdnYOR4wb3NHpW6/eGahu5k=;
        b=GqnTQWaGhtt+GHvSTFH7ON2QjZeiiRTGSCFdZrklAqD6pq1z7vPNkCkoWHTjXrINeF
         +NYR4haXF0YQXjyRr7MOrWg+iJiHYuMyZJq8n9IlZUjgkM/uv9QWrOcwYtP/Rrj5f8je
         SfporwACFPgrTUqaZdUJarF0qzzSZtrJFPo7qJdD26eAcwUqeBVYp32pOzyI3Ykse5k2
         CrvSYjjNGp8rw5CToh7TlkDU8+AHlCass+G7Tc3qrvYnxB5a6iECbCqy73bXSk+zY8Lx
         Fg1pvaeINBWmNt8NmMY5PEms/OFDN48vbkcpZXj6I0kOQTDZycjguI/yc2weQYNsliUg
         lItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182666; x=1739787466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i0AGLd99zO9PPisviE6AdnYOR4wb3NHpW6/eGahu5k=;
        b=U9AnN9kKLXMAGWd0CN+89q4FKZQsuCYBQN4XjkpWKqaMPRV9G20pdjzFe0jG6djSXr
         dPN2XZESraLjZT+/avb3/IA4NbEMHyFnRHjsnCdH9w0yjX2Yp3epNvDoCOwJmii2a8uu
         3ud6t0B9COv6ldxI6sj8k6uWIPSgcSwceK9hCAB0uh18upTgZ0NKejxGLgxE1yDb7VTX
         7idKBX8GqaVNynJy8GlO9MdPOYyD4xBeTxxweVGwakk4mh2Tj3qATnF9we44/Q2jiAQI
         xXGx/cZWMpV8bMYFFrVDi+zmaMZr+iZo9QoVNxsMS+Z42d324dgm51e4tFR/3jtl976F
         eh6g==
X-Forwarded-Encrypted: i=1; AJvYcCVe5hEq6gKVsUbbaSbE4wEd6IPxcxQiAof5n2RMZ1PiXNCsW21jWCCy8Uxolma8yvNcIkgTW+9sgfkf82g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2DcIUlAzzbgqFitv5N6cvzWoILCWUgbShoAccEaDdr07hBEAm
	E+2MSVj4qXvOEn85BP/Nc/dqqmxSvlfvWcnI3wV11u8F14SkNVEqIHD17PcWX/M=
X-Gm-Gg: ASbGnctX21LuuIXZ4Q/JhRu9MyG/fLUJXzNoQCaQpwz3zorqZb/deaqux89ASwP7wev
	E7wBJpGlD/Y4DPpyC7dE+mAhXx7MIJmGgp7lt3UQq1dtUpigdHnGLEFb3Tl0SPcjBQDm4ofVpXV
	mceHQBwhfypChCQ1hWmaerOXtI50KUk93hv68WZBtLoIhyAqKHIZSCFl2NCFGmcogeJaLglfCTo
	38inHDyUzXTInbgOPAt1Z54xBtiyj3MOx4j453c9HDsScgaLkoEvOR4emwRwq4GP0WTZHAkmoAq
	hfTmrxUy9SlwAE/IUQ==
X-Google-Smtp-Source: AGHT+IGNZ1LdwSLrAygAeyU2l4PUTGtgEddlFC4BdeZIasrbNWW51em0a2J4IYoXDABwR1ybMH65yA==
X-Received: by 2002:a05:6a21:9985:b0:1eb:7da4:305e with SMTP id adf61e73a8af0-1ee03b70cbcmr19829114637.39.1739182665838;
        Mon, 10 Feb 2025 02:17:45 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308540cb30sm2399099b3a.115.2025.02.10.02.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:17:45 -0800 (PST)
Date: Mon, 10 Feb 2025 15:47:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/18] firmware: arm_ffa: Add support for handling
 framework notifications
Message-ID: <20250210101743.aqbhqqkdbvka2i46@vireshk-i7>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
 <20250131-ffa_updates-v2-17-544ba4e35387@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131-ffa_updates-v2-17-544ba4e35387@arm.com>

On 31-01-25, 11:24, Sudeep Holla wrote:
> +static void handle_fwk_notif_callbacks(u32 bitmap)
> +{
> +	void *buf;
> +	uuid_t uuid;
> +	int notify_id = 0, target;
> +	struct ffa_indirect_msg_hdr *msg;
> +	struct notifier_cb_info *cb_info = NULL;
> +
> +	/* Only one framework notification defined and supported for now */
> +	if (!(bitmap & FRAMEWORK_NOTIFY_RX_BUFFER_FULL))
> +		return;
> +
> +	mutex_lock(&drv_info->rx_lock);
> +
> +	msg = drv_info->rx_buffer;
> +	buf = kmalloc(msg->size, GFP_KERNEL);
> +	if (!buf) {
> +		mutex_unlock(&drv_info->rx_lock);
> +		return;
> +	}
> +	memcpy(buf, (void *)msg + msg->offset, msg->size);

Can use kmemdup() here instead.

-- 
viresh
