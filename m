Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBDD1A8406
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 07:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738914407; cv=none; b=jBt/cuBLrOb/+zfrQ1w5IBAF2K+IMM+Au1wF8kOLPo179P2M5yFlH8+GFvY1AC+YbrSz+Au8+REcPte/BVbpJK6GLfJel1nfbi/L6BX5ZrDJgws9pA3r3g+VXaK2khtx1jXPaUnJm7FQSJjRw4mbVYL0wt7UvDoIyyESGDMyL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738914407; c=relaxed/simple;
	bh=4WlCS3JeXkjPmLde1zn1z87+Lbmb6/6ubwT13elmIkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfgeLcUE95HY2vH8injDBbIgMPKl6U2Y11VEVW/qcVLY1Q0K2XzAzji0PMUmVFyjorID479qQ1bQBzDsNC2FvTnj/+IV0ksGzk3h75uXf4Xnmb4oMEtpNNvm9Sw/TR1SjmzLTWIngwbQ7UGufg7dsM7sfNECb3jenWss2Eln49M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eP1Yp8ys; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eP1Yp8ys"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so17354085e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 23:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738914404; x=1739519204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XfZew55UaFAS2DkPjmH09kFmgY4u4YTpbMvFSQKziTM=;
        b=eP1Yp8yskVIPa1KcM9JosOjiaLG0bBxAt31C/1Rrk7YLr1eEAAoV6ZZmJg5amKMOqe
         qW4xvYX54kM9Ea1T4/+fIWtkg8VlcfLsCVVVs4poBe7RFgg/5fm4Ia6JruTXhWwhOD6d
         kg8CE/KHeAe7Xe/KcC5A1aMT/px9Web/0Fy4idU3gwhTro6LzDXVZEn9pxp/49QXmBD1
         ILSUsqCx1gJZiWwBs885nfAlTc2tI4nDKqYOboaxjTDpAy+RqadWnyccNtpRfiAKgBjc
         7yDCWg/tSCP7Nho7/9XBH47X0nu2MfaOWS2nLknuqhoJ8eSAEtM/ITNbY26N2JkniHVa
         swqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738914404; x=1739519204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfZew55UaFAS2DkPjmH09kFmgY4u4YTpbMvFSQKziTM=;
        b=IRgrL2Jmi7401CQilfIPZ3YjBLndxqC4VXx6bcfeTsgCAuZqb+HQ8QamaaV+SDI940
         aav+2ZtGe0pHqzkWJJbv2orUhNj6O9bmXGK7x3GhFNl4qpPZZ56OtF1dy5FXOtfOgNn7
         eSyd5Up5onEhKPNmgT70amu99uWDHL/TWhG0Rzynzp4MemJuVkFamnFbcssLJOEWIIx8
         XztOCl6X0+lPHi1NgCx8oBHotjuB5IfjaY+SDaSfxt6d8XfacSTP9E6nZDtc7PLu034S
         Zhv8JcQxQPyN9HR2NYPymKCFl/iP/PDODK5/kvz/RIV7Bfra91m5roG/LO+4bWvGG6/K
         66kg==
X-Forwarded-Encrypted: i=1; AJvYcCVfMHFIP0CycHNaKuZu4LGbK5g0Fr58rvaE7PNmCW+9t/Dbac4ipDCe+FxQIGvuy4d1MX2EMqC8+lUcQ04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6tIno1tAJnPMkn8GsjhMU/VdSQcGvm4K5XdVBaGPfvnMUm+oA
	B0GwfhfsHC0bj6JM28u5DYEKRJEoPMIzwTe5iL8lvUuX93Eqqw8hwq4qlrZOSKg=
X-Gm-Gg: ASbGnctYyDIaOmz9wKL6IpjhObq8Zp+nQWM5MyjnNTw9j103JlJw4LxpPhWI2e6Qfg7
	FHLgVhjF3pmu1A9TNNbSqzKhVMD4JR5EoVIV2hpweG0zbbBc+E9NMuToCsj2fBOjS+P6PA0R3vY
	9nuxsVXEaQyprd3+M0zasjrARMA9UJlE0eiGzR2mnHd7unMpGxKkgoCV7PD2D22xuimHrDiP2aC
	zSz2AG9AaLsEvx6IZdUQwjaSVJTMruH3OzP1pEUq/sq7xgo/fn8CinRCL8FfroAKc71epJmaERp
	qJz1FecIcPpGa2vs3NpT
X-Google-Smtp-Source: AGHT+IEo2yPiCgxBsxpCRN/XebBRYuQDTFrOfCTuJ4SN+z1RTMfh8ojROe+Se5jOtplASZvtuf9R5Q==
X-Received: by 2002:a05:600c:4706:b0:436:488f:4d8 with SMTP id 5b1f17b1804b1-4392498d6cemr23308885e9.11.1738914404200;
        Thu, 06 Feb 2025 23:46:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d96548bsm80885035e9.21.2025.02.06.23.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:46:43 -0800 (PST)
Date: Fri, 7 Feb 2025 10:46:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: less size_t please (was Re: [PATCH net] xfrm: fix integer
 overflow in xfrm_replay_state_esn_len())
Message-ID: <fd6b950f-4d5f-4f8f-b248-52239cbcb4bb@stanley.mountain>
References: <03997448-cd88-4b80-ab85-fe1100203339@p183>
 <1ee57015-a2c3-4dd1-99c2-53e9ff50a09f@stanley.mountain>
 <3c8d42ca-fcaf-497d-ac86-cc2fc9cf984f@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c8d42ca-fcaf-497d-ac86-cc2fc9cf984f@p183>

On Thu, Feb 06, 2025 at 08:06:55PM +0300, Alexey Dobriyan wrote:
> On Thu, Jan 30, 2025 at 07:15:15PM +0300, Dan Carpenter wrote:
> > On Thu, Jan 30, 2025 at 04:44:42PM +0300, Alexey Dobriyan wrote:
> > > > -static inline unsigned int xfrm_replay_state_esn_len(struct xfrm_replay_state_esn *replay_esn)
> > > > +static inline size_t xfrm_replay_state_esn_len(struct xfrm_replay_state_esn *replay_esn)
> > > >  {
> > > > -	return sizeof(*replay_esn) + replay_esn->bmp_len * sizeof(__u32);
> > > > +	return size_add(sizeof(*replay_esn), size_mul(replay_esn->bmp_len, sizeof(__u32)));
> > > 
> > > Please don't do this.
> > > 
> > > You can (and should!) make calculations and check for overflow at the
> > > same time. It's very efficient.
> > > 
> > > > 1) Use size_add() and size_mul().  This change is necessary for 32bit systems.
> > > 
> > > This bloats code on 32-bit.
> > > 
> > 
> > I'm not sure I understand.  On 32-bit systems a size_t and an unsigned
> > int are the same size.  Did you mean to say 64-bit?
> 
> It looks like yes.
> 
> > Declaring sizes as u32 leads to integer overflows like this one.
> 
> No, the problem is unchecked C addition and mixing types which confuses
> people (in the opposite direction too -- there were fake CVEs because
> someone thought "size_t len" in write hooks could be big enough).
> 

What was the CVE number?

regards,
dan carpenter

