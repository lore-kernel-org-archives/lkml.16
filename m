Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8643B1E485
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738891913; cv=none; b=BeZFDIxWoQLqVkT5pxlRU3woCsoGpPIwcPgIYhT5wwysgkPcMSE4SMGF2QgBprXfsd/buqLAs4lHlP5dxdwr/LuRHRtBYzPgkwREN/lTIh3PS593seg4jBZCo6GBst+gxPIHaV+lUmjgb57u5IfNQqO3bgz6WJ+g8n1mombsWe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738891913; c=relaxed/simple;
	bh=GUOj2ZnJFMk8jI4YQw6Hs7Ivl5JzKD3GTW85TdS1UPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fp9IwfdeDGHYReb8HTjwPCOZGG7L2Q6bbPcU37ggOgP6CpdauKNrnopGjYPF3q92LdJo11x32cFIzt15o/vhnZwr1XhGoD5L+OFttIsIb/4/b+PYufr2CeLjdo9mnrmtrmXXlkg3XgeJqTeyXbkPEc+Buzz4bhCEM8Fq7nHqhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=TMcs2V8A; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="TMcs2V8A"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21c2f1b610dso38382035ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738891911; x=1739496711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkdizXVnDff782XdC9GQ7GAh99Z1PbQXJxP3JewgzVM=;
        b=TMcs2V8AEtHfXgEceCWsJCCHvfqC+LK4N6pcubDRs52DW/tQm6N5YnhBPfOuj+KrOT
         t0ZKVvN0VFRU6ZvkGr5I6Q4SlyuiFSsdfmkFHweRhyGYJwonA2vCY0g4ebwJQ3JL0Wdq
         IkJSZ+BBzee6gSQAI0jhzFko9Hok29xop9brg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738891911; x=1739496711;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zkdizXVnDff782XdC9GQ7GAh99Z1PbQXJxP3JewgzVM=;
        b=ptOlODKwmClz30a4msse3lGqP5Mt8Nui3PW/2vyMZ+HNtoYCYuD/oCwRwb/ZrEEmIF
         7ZevoibwITEfsshrnEHtu/vHTr7TlJlBSPHZY04G6VfH4Kgp0uESPt3jSNABie3vfVTv
         sWz/c49aUgESggS0dmnUgbLVFHpiWJqyUdri8SJYi0up2/ZMbmhVka60aNhMlkHB1Ll2
         QhcqXbXpyCDCtDQHrmYKVwBTxtdzflumQGFcAuZVy+ZDkNswYiO7On+BgMt9DDgt55P/
         /vOwKMYPc2IbhxChyWq5yNGs9LogToKAt+yXWUAus3kK2Xb5xU5gPHLBwdQfvB1sL+1p
         5LgA==
X-Forwarded-Encrypted: i=1; AJvYcCUcvop3eajIO+lm4kyXwUmFIqtkoS+kCLSE8vIvhZcF8OX4bjCdxhGbIJmYlWRDJFMUcAAnFYNoaDMX3xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVMRVuJ5g4mwB8ST3pIn3Rm73XiEvEYT7s7t2Xhtbkj0Un3ExX
	0n70MoP50wWoDYL6gjaP/mf8bc9P9n/Qx0rN1RLEfjKfS5r0txhUy4m3Fel/Itg=
X-Gm-Gg: ASbGncu8Eg2SswoQ8aIfgcdJQkzyWJtGkd3hggwwNZo1D7hDeJbKSV+7w2ucSmLfm4t
	qKo6f/jBFFtysd7YDJ/xMyYbod8J5ZH7tICjFKXj9eavKWovgnfVMCGhcDiO0biYRkYWf2Oc8gI
	V+wSDUQ5b/hZj/W0HRobYU71yMib+Y90SYlZMF1XJfgzrQCCmECm3+XUXAT9evWcCtHoEKq6kiI
	16m1FhjtICZhsLoGvHlYNfHpnJDAWPWXqeEjUZEorAlLtbqi1Rm3rIsgG4yY0ktbOZRXUYXzz1i
	b79QEe+ZOCGRV/Cp+sFRAYwJPiuO+zcKjMUrYOeWfrloBoLT/N2OgWNeiw==
X-Google-Smtp-Source: AGHT+IGMVSk0+D0Pm2WrWKIsbJKHGAuK+5twucIHXYMohW7EqwtJaWRIMlCDOxpEZ/uNPENnZ5b76g==
X-Received: by 2002:a17:902:e946:b0:216:7cde:51a with SMTP id d9443c01a7336-21f4e72631dmr29074325ad.28.1738891910784;
        Thu, 06 Feb 2025 17:31:50 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c209sm19268865ad.192.2025.02.06.17.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 17:31:50 -0800 (PST)
Date: Thu, 6 Feb 2025 17:31:47 -0800
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/2] netdev-genl: Add an XSK attribute to
 queues
Message-ID: <Z6Vig04c-a46WScr@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Jurgens <danielj@nvidia.com>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	open list <linux-kernel@vger.kernel.org>
References: <20250204191108.161046-1-jdamato@fastly.com>
 <20250204191108.161046-2-jdamato@fastly.com>
 <20250206165746.7cf392b6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206165746.7cf392b6@kernel.org>

On Thu, Feb 06, 2025 at 04:57:46PM -0800, Jakub Kicinski wrote:
> On Tue,  4 Feb 2025 19:10:47 +0000 Joe Damato wrote:
> > +		if (rxq->pool) {
> > +			nest = nla_nest_start(rsp, NETDEV_A_QUEUE_XSK);
> > +			nla_nest_end(rsp, nest);
> > +		}
> 
> nla_nest_start() can fail, you gotta nul-check the return value.
> You could possibly add an nla_put_empty_nest() helper in netlink.h
> to make this less awkward? I think the iouring guys had the same bug

Ah, right.

I'll see what a helper looks like. Feels like maybe overkill?

Thanks for the review.
