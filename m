Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67C1AB531
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745373165; cv=none; b=shQtds3VCBTTv8U2fEiyqGBiZJ8RQxry93DC1hV4DEnPfnIQisYYOI48Vgsy1Iry4RVGDfEliuimK8HLekqx3hIXqIWhFFTpt/l0GguCfvsVEOqo6PAf3WL5yXUOURfiJSjH/y6iUKuF9VUZhrQwRfmBjt3xl2lEU5O/8IRYZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745373165; c=relaxed/simple;
	bh=4wLhV3IbHlgGXoJekz7dNit5CqhCaxM+G6qgYArGhWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKn+qVX83cjhMSxxwxcDwiPmj0h42MyN6XfmILrS58CHVDI6Lxryfccl6HRsTok6qRd7PwnS2fTr6fJvMjvp0p6LEW4oLCHrzmdXjTASaqt4ZmFAjLFKAAZoLR8fUHJmxJkvDhsfNz7bEa0ZQlAHdPIQPsmMfJ5aBIIxYu5UDv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=llUF6W06; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="llUF6W06"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736b0c68092so5022903b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745373163; x=1745977963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3aNxDyiOPHAlWqSU66cOhuYSikR8PHGxfrsyOzZYqs=;
        b=llUF6W06WsNn9CDlbW64n7oxfp5mLCLf/cioUKFyhjbVa1inCrlScn3cgClVHviUIn
         tzTkh5VYdZWpJ2OlJqTJPQtkmB5cvjvC2t3jxceYsFemS36Js1JAlD+ySPaovwgWVLke
         XVlu0Q9IN8RUuIiBel7fL801qK8DN7qpPvSWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745373163; x=1745977963;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3aNxDyiOPHAlWqSU66cOhuYSikR8PHGxfrsyOzZYqs=;
        b=tnH+4RlvKMfStaplIB2ahjP0JhUDuhrl92lY50oFgvnsRCEGuUc/hlB9mgquoUPOcl
         Os0i0tcxdoxiA/4h3tS6GGu2g8I2fDuujVJL+bh7ab+P8qQZ+iniqIckevnsTUgUgUI5
         w00Q5LY4ZvuCZZ+tYJ51+oWgIRuDHvqnU3rockTgNR9cNUrt3/g3iBOxMrX5q9Kv5vF0
         +wq/xrpSBEnmPFfcWQAnXKWLGYVpg1496UYaNJsr2jlXc02tK94huPZkE8PI/WvRPDmF
         H7H6M4NwtE0eaUO/Ogevi7dOYcLEZcs+9tFRO1DSuIBLpByGC3HK3oBFzxZnxIPo5Lg4
         Xz7w==
X-Forwarded-Encrypted: i=1; AJvYcCWQ45oBXRU6GJA4JAtzPfhcIobFonrAu31t9831cznd4ljOjq6HpneG3LDlpFYlBvflViTik4l2lpOq9WA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNuOQ68Lfzd1hBeZc4oSaU3juDLsOV8lEtO6RqXLzxZKL/nShD
	+u1HA1ha8fT4eUBEyS6sqQ8lQyuj3n4GTCILcP7wVmqNqh+x5Pua6aPcM9GrFxI=
X-Gm-Gg: ASbGncvJJ/vq7Tr1zPrew+05HyvBa2qhEa+YzooZ2pw66kIACwuJhvg1WXT6AHWGdrj
	3wBOFunsoRgHqyVV5XpPy8ikkdy1sQaYkAUIwes7Mpfwaa77xzbZLFHvwmtlctySfwnfVWAAJhn
	vE2/nvKgtHGWAuBsoDkEG9/iytdKuLnjxwnvNEEpuJNjNvg5D9hyYODiVwGd4jvDxFV7jeo3odw
	OSnB33Xt8ODlCv3lAqtvj1OzfRQvASmwA241j3hl09ta/aabR8tg1qKAZxQTW641stAiyNxW8O8
	62sfgu6X14P/JNm+msFZdmXgDCIPg31f+u65wwl+sXsz5CZT11Wn68qKnOHPKsCP3DC7Ar0Dxhg
	L0aBi8dE=
X-Google-Smtp-Source: AGHT+IFNcDRLC8JrDRyeuZbCW/ZJZarqcruDNdE2GGwIN74QiRY5cyf1Dg86vye1n8OlLjdTw9Gqsg==
X-Received: by 2002:a05:6a21:9981:b0:1ee:e2ac:5159 with SMTP id adf61e73a8af0-203cbc74809mr23837012637.19.1745373162682;
        Tue, 22 Apr 2025 18:52:42 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa5836bsm9371009b3a.119.2025.04.22.18.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 18:52:42 -0700 (PDT)
Date: Tue, 22 Apr 2025 18:52:39 -0700
From: Joe Damato <jdamato@fastly.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/6] gve: Add support for SIOC[GS]HWTSTAMP IOCTLs
Message-ID: <aAhH5_kFB0Jrf4xj@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
References: <20250418221254.112433-1-hramamurthy@google.com>
 <20250418221254.112433-6-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418221254.112433-6-hramamurthy@google.com>

On Fri, Apr 18, 2025 at 10:12:53PM +0000, Harshitha Ramamurthy wrote:
> From: John Fraker <jfraker@google.com>
> 
> Add support for the SIOCSHWTSTAMP and SIOCGHWTSTAMP IOCTL methods using
> gve_get_ts_config and gve_set_ts_config. Included with this support is
> the small change necessary to read the rx timestamp out of the rx
> descriptor, now that timestamps start being enabled. The gve clock is
> only used for hardware timestamps, so started when timestamps are
> requested and stopped when not needed.
> 
> This version only supports RX hardware timestamping with the rx filter
> HWTSTAMP_FILTER_ALL. If the user attempts to configure a more
> restrictive filter, the filter will be set to HWTSTAMP_FILTER_ALL in the
> returned structure.
> 
> Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
> Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: John Fraker <jfraker@google.com>
> Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>

Reviewed-by: Joe Damato <jdamato@fastly.com>
