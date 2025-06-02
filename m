Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A6E43AA8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844218; cv=none; b=GB5Y/+z/eGjovgymY5y30OcLgSCLzMFv2liEE8dxK2aaDHjcvUIiAdHao8WQvtOHAqLiDstvnJlSTzUbDNDrodHnyhPmxTdnAdGOh2RQvoB4s/4gNq9MVOnY1MlbzViyrraSmjEVSVYT5VOj8hE4vWT+LiDNjpFl4LSAKvPTOVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844218; c=relaxed/simple;
	bh=eEW107ipIPy61Sk24Q1qrxcbmZLvd1y/kuKYBUoXKlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU7umH7L+RNrCuwnAowpnatX9Bhn/dJeUmqtDLQ2BPh2MqvzIniWe5Tq/gNaHAbFAsZa4WWQUcUTy1ZPBWaCP9Eh+vy8oAMv9WMFwKMzESnqJnLodxqMRKgMi5IdpvBxk60cRUx2Lj5S52wm/Stf/MbbW7yEVBW0r/T7/92m9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pf+qgvAb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pf+qgvAb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so24406675e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748844215; x=1749449015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VT+t88x6BILNu5xqyX1dO4pc6n5FbFQHrDThePEkea4=;
        b=pf+qgvAb38MKBtH3sGtsAeClqJaum1sp9tzib8AS7ap08n2Y/h+fbuchIDOUr/kCFO
         twqKlS2f3pj8my5bGAJmwky9Zow5DqHiGK5GT0svE2CS5wAC6RvdEkTA65/NxpXRveF+
         oR+KJHbL1dZcKomfvXG8j+0NuWdPUGU7Gw+QyPaDkL0URl2CYYtUT3lDVTYwc19enALu
         smwc4x2DA4vxbw7N01IIErGPJ++InkWrc8RqH/GSIY8ZybKYptHCYjjp1fq6uyk8CCcT
         elYHskdyGkb5cf57wXfOZ7yciUUb5xZuPkwEDRE2p5Hdb4H8z9CA/clgdyQI+c07NHMy
         C8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844215; x=1749449015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT+t88x6BILNu5xqyX1dO4pc6n5FbFQHrDThePEkea4=;
        b=NgmgLPKhJPjUnCE3R2PrzdSzlBdFX5u6LFpEJUIWAeTgZJWvds3iOlAy1MlW56B/M+
         ooqFLJoIkcuD+b8jcO/PzoT4PdwjHlXP7H5TT1OzYm3h8ioEFSpdX1TF7QkrxyLdpL7z
         AnohRiqcEYICswUzXl3TXVa/Z28/7dlTBecnc0DDOQon1DPRpZVI5I7J2MLmMoO8Y40k
         0s/DguMzZku2h+O65ZxfPF8OvD9W4ekBldagTXfPF3z/QthXrOdw+7t89sEroXrsBQ36
         IeGeNerMSooQ8i3DAxi2x/I7UpiRSqBmcSyYTnllK97lEEVIQmMum0agH/WwsX5ehQPB
         /AKA==
X-Forwarded-Encrypted: i=1; AJvYcCUSghSvsRgOtscg9OMZ+XkUKY3U/eaUVj46l2q5Q2+Zy2z1rK7kBjFr+K39kHm04oaRPj0/U5DyEgL7VNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc5FC8ZDq43qGfm0NB22U23TzimGSGTPRpwrmhTMwM/CjyBTcY
	cW8a1XUqh+j6TVYzLTNjeiJWojt4qCG2DnAj8z1SH3w0GFvEXcURrbOnT7MQbD5rQuQ=
X-Gm-Gg: ASbGncsAqN/1bGobXTmmMDu88JSXSgm8nevUf/9tIgYgJxij2IioF5VF4ccItOumIQV
	jO62rn/MupIV1UDY/2ZQMj0jCvFvc22JadbBceC6XGk/ZF/aLkAwFV/8Y8kTyI+NT6QlfYWWitg
	ixNEQ7xpqVJeEYsdbsrS+rmyWWcpQZ1GjH4zdSWmJS/ysB/UgD/k8IOw36sp4qJpJZQalZy190u
	BVXPnoaKUYu3oq8POF/JKyOdvk0dt684ZsDVDwtbRUCPPnYK8St8QA8LvGq4HTfXvWVorCFU7VA
	XxU1fRVtScExYn+s723KWc/EyMc5EEBH/sP9AhFmJaF8taQvivb1NFuxODGj/Uh+Cw==
X-Google-Smtp-Source: AGHT+IFiHvYxhztMfN11RapKmiEYv4gtaP/8gucGt4yDxjSNPii/2nMxpa6+aKJVEioWfWekhwNrGQ==
X-Received: by 2002:a05:600c:3b8b:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-450d8876dd6mr86632475e9.27.1748844215286;
        Sun, 01 Jun 2025 23:03:35 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d8000f3esm109149925e9.23.2025.06.01.23.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:03:34 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:03:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yevgeny Kliteynik <kliteyn@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Mark Bloch <mbloch@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
	Vlad Dogaru <vdogaru@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net/mlx5: HWS, Add an error check in
 hws_bwc_rule_complex_hash_node_get()
Message-ID: <aD0-snUAsqT2_3NH@stanley.mountain>
References: <aDbFcPR6U2mXYjhK@stanley.mountain>
 <782913be-5e22-4b4f-9867-26a6019271d9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <782913be-5e22-4b4f-9867-26a6019271d9@nvidia.com>

On Thu, May 29, 2025 at 01:26:17AM +0300, Yevgeny Kliteynik wrote:
> On 28-May-25 11:12, Dan Carpenter wrote:
> > The rhashtable_lookup_get_insert_fast() function inserts an object into
> > the hashtable.  If the object was already present in the table it
> > returns a pointer to the original object.  If the object wasn't there
> > it returns NULL.  If there was an allocation error or some other kind
> > of failure, it returns an error pointer.
> > 
> > This caller needs to check for error pointers to avoid an error pointer
> > dereference.  Add the check.
> > 
> > Fixes: 17e0accac577 ("net/mlx5: HWS, support complex matchers")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   .../net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
> > index 5d30c5b094fc..6ae362fe2f36 100644
> > --- a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
> > +++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/bwc_complex.c
> > @@ -1094,6 +1094,9 @@ hws_bwc_rule_complex_hash_node_get(struct mlx5hws_bwc_rule *bwc_rule,
> >   	old_node = rhashtable_lookup_get_insert_fast(refcount_hash,
> >   						     &node->hash_node,
> >   						     hws_refcount_hash);
> > +	if (IS_ERR(old_node))
> > +		return PTR_ERR(old_node);
> > +
> 
> Agree with the need to check IS_ERR, but error flow is missing here.
> Need to free the previously allocated IDA and node.
> 

:/  Yeah.  Sorry...  I'll resend.

regards,
dan carpenter

