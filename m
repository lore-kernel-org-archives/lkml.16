Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DEE1E48A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376166; cv=none; b=II5/Q5NV/Ns+doJEHmxGxEKsFndyR4jW2HQwMfcdvtKIXXKwwUVIpWm6KQuGgLDPR5uButR2ceU65iyVXozamWtvTyVUb0xAdPEbaePxXpL64KuSMVf9PHcIECGAWWFsiviw5oSrtPntg7uHpNl10+zvIAORykcicKQtU5kIudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376166; c=relaxed/simple;
	bh=EOY4u6ajkXhEccinlwpEqS4c/ERvs5EI9oFxcBVbeSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N4fc4KAS/K0QD9xJeVAckTypakPpV1TOCSixsSbSWodjg4Cl2CWnOPNNALliGEX70/Wevv9z9AD5kNdEcRxvjp7vkhsI9VLTHg7opijqgWSuZcjEFtLPRTo4ZKarekNsOU4BT82F9M46jB1q+W+67HkhPT1V7ha1IYAijp1xm8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=PlfCJ1nh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="PlfCJ1nh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30572effb26so1794445a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1744376162; x=1744980962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZXRvIQx9hmai2qu2UVknddODDMfbefzwYnqVgV0AUE=;
        b=PlfCJ1nh2rl4RlT+DFK7cVscB9CgALT5e3S8nmTVfwJgiBYnUeP0UbkCPtvXUCAvH7
         l7Iq6vLz/uUiCriaNPnmQmfR1VvlksAm5A1QZo1Vnxbu3XEGgiUcnopycxkr0uowlZ9+
         X4+6YH2BQXqiRSemncYLcZk4eg/s+a73MknNhk+Fgt6DJPW2vWXqB+GG3t7zwfdDv7Nv
         c5AJRweEQYv1ifXKPBuvPeBcD8gJ04cGEDb/xkZDnS8J6L6cI/R1zl+jFWtvrOUXRBvS
         L23Sj8MjdVKIDUNfN+af7iIKSnyHgsH7IfFdVUTbeqSst6ibTIrLLPU4WfQ/GGXQmZ7L
         IGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376162; x=1744980962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZXRvIQx9hmai2qu2UVknddODDMfbefzwYnqVgV0AUE=;
        b=DBTlym7F9sfyPHsrASfqaz/UtcN/rnG7bprMMg9ztzbdx+RYyWKospRJ3VXZNFdwpG
         KfOUpwBwHUU9nvSegkmFxJrCdDo8jsaNXcVQIodg2qB6oAnbyU1rm0RkyXrXOHuUmg6s
         t/ruI/2NiPd5cAtYmyFW4a8RVNtpLr1R8/A7PxbjhypsMVlKAXYuWWNySVrmad57XlNq
         pP2/3wvcSpI01D66bDyY81PGmFZTvSPtc8IzNRsyXkV+oF+XbuwjYz8VNJDORQhheSDr
         fNIhpXrQGVEI0aTqS++dZf6YuS6tj+DkjwDKrtIHd4g0UZwSLF8zR114LFwGef1Nm/x2
         j39A==
X-Forwarded-Encrypted: i=1; AJvYcCXnFydpGGa2vqt1pEqYNaaqw5mNJ39TkRkTvxvAUUOdtvY5tNtuTbQKxhUIRV8tVrmoA82KQhIANT3EcuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTG7gn++ZvmVHpJI/Ltjo1vzamyEVHoNz9GyDEdmgOmXxvbEow
	T3pL8e8mpGzdMdVqSCV11xZDO7FFIHTL3YfOYKoLu41tFBlyPBUh0HNDCfgjuqg=
X-Gm-Gg: ASbGncsXREYKSeNQTFyEDD8yqgFQqdGfJ+kdsjmv6jHBi3SyJHkEIpDFiVkF7QU730y
	+hQowLvsGYxJCEYbXTPbum++2lNCza6ZUnCeMskH0RciVwS7nKAT6UlWb/QM7JndZDE0BC16FiQ
	HmjMrGRPcuGSbkQyhpdk6rpPEuzWfqoFzkaLNNJc/lhICB18uevEKK+ovQ6i1oIJUxwLzmk656C
	qru/Qrl+58rEOjJK7SS39HFZuy8i4IVQLS8fumUGUU1OwkSvXWwjkwSgeVg/jwHYdGZwlOpimkN
	kp+Mwo7wmCSoT00S/ptMDgqjVsnWtsFN8YUo1ctZbn8WgSysRzWWhFYwr+n8oo+gVpfswja2YvE
	yNKI8PyY/Qu93d054BrUGi5SEOSkEaUqCCPjfTaIx7my9J7bI
X-Google-Smtp-Source: AGHT+IG46tEZo8ieZ0vNb2Uk1Cu8cOvhv5PIrzXo2TwNdTuZ5KK7mOieg7Zv+4usOYoyiFdUsbz5zg==
X-Received: by 2002:a17:90b:5403:b0:301:9f62:a944 with SMTP id 98e67ed59e1d1-308237cde17mr4931754a91.33.1744376162501;
        Fri, 11 Apr 2025 05:56:02 -0700 (PDT)
Received: from localhost.localdomain (59-120-179-172.hinet-ip.hinet.net. [59.120.179.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df08f63bsm5471711a91.24.2025.04.11.05.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:56:01 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
X-Google-Original-From: Chiang Brian <chiang.brian@inventec.corp-partner.google.com>
To: krzk@kernel.org
Cc: chiang.brian@inventec.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v1] dt-bindings: trivial: Document TPS53685
Date: Fri, 11 Apr 2025 20:47:39 +0800
Message-Id: <20250411124739.2725364-1-chiang.brian@inventec.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b9379597-2827-4391-88a9-b2ac23227a35@kernel.org>
References: <b9379597-2827-4391-88a9-b2ac23227a35@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 14/03/2025 07:11, Chiang Brian wrote:
>
> On 14/03/2025 04:28, Chiang Brian wrote:
> > Add undocumented tps53685 into compatible in dt-bindings
> > 
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > ---
> >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > index fadbd3c041c8..c98d69facb48 100644
> > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > @@ -380,6 +380,8 @@ properties:
> >            - ti,tps53676
> >              # TI Dual channel DCAP+ multiphase controller TPS53679
> >            - ti,tps53679
> > +            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
> > +          - ti,tps53685
>
> There is no user of such compatible, so how can it be undocumented?

The following link is the patch which I would like to add support tps53685,
and I think it is the user of the compatible:
https://lore.kernel.org/lkml/20250314033040.3190642-1-chiang.brian@inventec.com/

Best Regards,
Brian Chiang
