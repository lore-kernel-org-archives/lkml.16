Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE64F14830F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892784; cv=none; b=b/LrwbeI6L/REEKpsAVnfGCoZw6RDHv5t8K9X5yRX7Zh+hqoBJ3sESjsHs+JheiNtPMPoH/kHxlROdEgG696ULer/94v5AMvLquusmt+Hc6+WfM/bV4Kqy/U71VG7gD72fBTURK1+Du6JX+Ww1Q1V+LYPC5daRGMh+gq3+OgoVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892784; c=relaxed/simple;
	bh=hyLeDvnLTV29+khiprOAmxfCaatpQ++A9+PmCn+j+KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGSJfV2P15YG4nKai5XSF0hdOZzEByKoGDXpYmx+mDzhO7eeKKKNbNppGPBRWowvVyhbka0cKvfrXGszOE5HWVvv4Uwg421Tp/I+wtOhq81SKXkKNqt4+rOiPK0JJabxXQ7vNhRYNfdcE9/bQ2nGfgolf8NvgksJOYkFYK7/96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=Lz5cm0GD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="Lz5cm0GD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21634338cfdso37697005ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738892782; x=1739497582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95W319fF0TuhfADXZYWyhM8ZPI/uC+h6x4fXlzFN76M=;
        b=Lz5cm0GDjVY3zKssrueI3yp6yB6Dj63XoNB8OfiJexs9LQuY7zMNghBaUVtVGCF+A4
         Q56mpqr4xUWGTHzZwvbhgNbPZx0FIbyku4wJOZLAWwfiDJNWU1fY+UntwxvWbwse4cuC
         T5PtKm50gM/rurwBd1E8DGYQvAatzANG84d1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738892782; x=1739497582;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95W319fF0TuhfADXZYWyhM8ZPI/uC+h6x4fXlzFN76M=;
        b=VVuMA8AMAaFxmd4WE+0EYMGqAc2k89coBrT6n1QUWORy1NfVwPf7OdDUIYMzE1RRxl
         8NFt0Lkt5ORK8RsQbwc7U0LRhA/NBt8WFf3MWvaWG9SSphZNHwMwhgaAnk7MsWGGuvg7
         QpFCsyP1Z8xa0/RGpBFy6JrMvBEflRdNPt6/7J1xj0wWTNd8kLK024E7k8WVDunEmSYP
         +Y54z/XJd5HeXI96ZBTKqqMUguu9hXw1VLxbg7Eou6kwJNNK3/Dde3FSWF2Fbh9Gj4cx
         wtPHdDW5nhc/3BqNHFM9Gz0QXT9urdrn/ubjpzmXB6/ULdABzzg06Egy1qpllD2Rm0V1
         RYBg==
X-Forwarded-Encrypted: i=1; AJvYcCUDb8I9g5vB/uQtbh4WHOSOTjlppkUjH/I4dA6/h1djVUdexg0e1R6VCe0zx0eErW9QcvbRWISv7qZ5vYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCQrkc9aX6eBZe5s9ZZHAziay+dY1JNiSIA0B/vjrdHG3JREPD
	7lMrrs4ps8uyGAnPrFEfh0gWWQRlgurebH/ToBd6JLaOh7q20sTwWW1iTw8x6yo=
X-Gm-Gg: ASbGncsyKWvNz5jT6RHY9FxQ6CUR4+YnKoZIWkvFsDaRPyKcAF1m2xvOOHTAVXLAX82
	n5jEbI0FsLTGo9OYKlH3g4GVp07tSyQzBUZRSKERhbsorjS/k3yYYF4+SvWxLM97DsABh7Zv8zI
	0vfkPNL7kYzNddCdTA1pM00noFVHhPOZKrjPk3mCr5r7I5om2q37LfgGAdlkms3xY6FnOTYfP13
	NtJRGtqAnWVMmMbaLIP+pW9K3tQ16RTEj4Bmwadtw7cZ2t0cmB+eQuf0dYKKSuLq+VPNIJa28hV
	lrL3Vcfh8giE0dEHqCjrRU8X6ezMZtXbDuCSLf00wvSHQ0iiPqxKr12W5A==
X-Google-Smtp-Source: AGHT+IEb0fEGfaDmVEdZDvNICNH+t4hrQlDHBujjTzaFy892ln/2xVZtzkVxDOZrFFZTZ5x9LoppSA==
X-Received: by 2002:a17:902:f60a:b0:215:94eb:adb6 with SMTP id d9443c01a7336-21f4e73b2c6mr26502755ad.40.1738892781880;
        Thu, 06 Feb 2025 17:46:21 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653af3bsm19561545ad.57.2025.02.06.17.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 17:46:21 -0800 (PST)
Date: Thu, 6 Feb 2025 17:46:18 -0800
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
Message-ID: <Z6Vl6lcPpj1qBN5e@LQ3V64L9R2>
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
 <Z6Vig04c-a46WScr@LQ3V64L9R2>
 <20250206174138.7de4580d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206174138.7de4580d@kernel.org>

On Thu, Feb 06, 2025 at 05:41:38PM -0800, Jakub Kicinski wrote:
> On Thu, 6 Feb 2025 17:31:47 -0800 Joe Damato wrote:
> > > nla_nest_start() can fail, you gotta nul-check the return value.
> > > You could possibly add an nla_put_empty_nest() helper in netlink.h
> > > to make this less awkward? I think the iouring guys had the same bug  
> > 
> > Ah, right.
> > 
> > I'll see what a helper looks like. Feels like maybe overkill?
> 
> Yeah, not sure either. Technically nla_nest_end() isn't required here,
> but that's not very obvious to a casual reader. So a helper that hides
> that fact could be useful:
> 
> static inline int nla_put_empty_nest(struct sk_buff *skb, int attrtype)
> {
> 	return nla_nest_start(skb, attrtype) ? 0 : -EMSGSIZE;
> }

Yea after reading the code it makes sense that nla_nest_end is not
needed. I wrote a small thing similar to what you proposed above,
but yours is more succinct.

I'll go with that and see how it looks.

> But totally unsure whether it's worthwhile. Just don't want for someone
> to suggest this on v4 and make you respin once again.

No worries; respinning is not the end of the world.
