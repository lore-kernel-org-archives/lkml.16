Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74BB1A5BA4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745372947; cv=none; b=u9vyrH9ynr8VnKd5LfRXL1NWMWTdlbse7QZBoFmOIFJ06GGfAs+1V7yglkrU1cgmppk6YgAbaKaCLIC9OY9sv9KlWfFun30vhlDlel/MIj1OExZxg9x3bZRA5ul27GjFOJo0TUlA2U+eRK1o1dwuY7+NDXcZxH1bfoA6fCZYL24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745372947; c=relaxed/simple;
	bh=ckkWUT/xderljp85srBq8CewP/4u2qXDhejWjPahdMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPr+jWOlksrKojBu8qFkbLOTU7m6lvzuTLRFZk8HwmakeWGck7qcqjtw92fRXB8WECKP9BC84Jto+TVeHvX7ONeqE1hNGe0e5FZTvvehEdDcJucZWTlLPyWyIiOdzeT8JzN+QiwByG+2lFdkSjYhJ3Hfm1as2MXvuFdOy7JyFGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=FUNpT0BZ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="FUNpT0BZ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73712952e1cso5736190b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745372945; x=1745977745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aratRX3GRbQd0qysev0iEy+ZcM4r/zDaLLFPtb+pO10=;
        b=FUNpT0BZ0z2QT9NPVQGHbyOqrtJtjgHdcCbg7jWHMsq20tWyFGEiCmCgSGIyPZfYpo
         IDIEbzii6Oby4XjOWq67mEqg/2BfzwgEzpqWg0F/1kAQgSmR3DttBiqEJbqNepLsbgwY
         7OMBMrAfY2uYvrQukxZ0RTzg8Yb/pXnS+BSsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745372945; x=1745977745;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aratRX3GRbQd0qysev0iEy+ZcM4r/zDaLLFPtb+pO10=;
        b=KF1P+fcGNEeoeukGa9fybbIrRMihX+BhQN62Fd/yxYFXRU1PbwfyfJ9VYfJCoDlR+L
         0lj+/3dxTdUvE1RjHzcwM+IG6GFJhyBbCLgG6+M0pj2Ob1beY4+uzfhYkNa5kfQXfiKl
         T0s/iJ/cIOzYsxgRvaxeV3lRaIYcoGi3jx/2ALrKXqAXRmdzfIFezRGZJm8B5uuFizmV
         m1Qt//hHuLwrt/5e3uf9ONQbqP/fCk3EPpHodYe2ZFAOT/pkEcRE+F6TxCw6Oa94ydBy
         SiR60Byp2BRGP4TYV/DOB9NedIgK9lUXuw9Zc9HDhZXEzZjAmSwZqq6Upq0LiTfAAPVH
         rIeA==
X-Forwarded-Encrypted: i=1; AJvYcCV1hHGbrsrUlMLsAvJOT3RzfphPlrCJD/BO1qMdMuKavCKFImFsWYP6CwBfLdNdrVc4HWvn0lXYGSjjGS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxp+2xo0cSMACzhQgDaLZ5KBd1rzDDEDq3Y0r1P96vkk7ozTaT
	gLpJLQXyt8Tlz7BA1U4tGwOe6B5jnZ3k/8uJmwWfH5VCjQNQXRZlv2Ipb0xjj7s=
X-Gm-Gg: ASbGncuCBGxllf36Ssday/T9t6vQr+HkbqgFuBCueUFO1FSvU3LQf0hX1tpCYNO0TiF
	qp1gkRcq8t//RgeI1uA7/FetyaPLT1W4x+4JzXiO2qslEUVeqMm9quHjeDliMBvodQrr2LoFuWb
	ff8oX0P3VJ5xIdd1dnudLBxwT+ymiU3hBSIMGU5E6lFJhngUx6SnBOwj4fxHjftAAEjBHOEu7Ul
	IAWwSrsHw5llzrh1lp6hPSFz4SDlJHNd6mDLG+fUuHk7QY6iiDolBtavv9ruFW7ncscbhzeg0t1
	uv7zcNCVDdccUXTC66bY6JH8meFHF0c+elALIP7x4uvI42d2QC0jpjySQ41asgihcg6jZEfCPZ3
	P3kOakXg=
X-Google-Smtp-Source: AGHT+IG1V6w8PoW8HpIHJlOW/cURA2YNsA3KkFsPZNzMXgLxdjhLsNpC/+YYH9kU0qfn3ptgft9YrQ==
X-Received: by 2002:a05:6a20:9f9b:b0:1f5:59e5:8adb with SMTP id adf61e73a8af0-203cba9836emr25980226637.0.1745372944856;
        Tue, 22 Apr 2025 18:49:04 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e3631sm9749625b3a.51.2025.04.22.18.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 18:49:04 -0700 (PDT)
Date: Tue, 22 Apr 2025 18:49:01 -0700
From: Joe Damato <jdamato@fastly.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/6] gve: Add initial gve_clock
Message-ID: <aAhHDTWQ9k6_Eid5@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
References: <20250418221254.112433-1-hramamurthy@google.com>
 <20250418221254.112433-4-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418221254.112433-4-hramamurthy@google.com>

On Fri, Apr 18, 2025 at 10:12:51PM +0000, Harshitha Ramamurthy wrote:
> From: Kevin Yang <yyd@google.com>
> 
> This initial version of the gve clock only performs one major function,
> managing querying the nic clock and storing the results.
> 
> The timestamp delivered in descriptors has a wraparound time of ~4
> seconds so 250ms is chosen as the sync cadence to provide a balance
> between performance, and drift potential when we do start associating
> host time and nic time.
> 
> A dedicated ordered workqueue has been setup to ensure a consistent
> cadence for querying the nic clock.
> 
> Co-developed-by: John Fraker <jfraker@google.com>
> Signed-off-by: John Fraker <jfraker@google.com>
> Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
> Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> Co-developed-by: Tim Hostetler <thostet@google.com>
> Signed-off-by: Tim Hostetler <thostet@google.com>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kevin Yang <yyd@google.com>
> Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>

Reviewed-by: Joe Damato <jdamato@fastly.com>
