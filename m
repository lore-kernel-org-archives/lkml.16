Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616725BEE8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453856; cv=none; b=HJpsegy+xOAGV1h4RkXNkJ74Um4sjpRqRngXv4ULQPuQjKNke3qv7tUgnbhxgDWCQt5JUzRBaKGOWYLXeQXaTGq55l6xD7MfGQBHgPJvGBXKpL5oI251iVB/zWppjQBo7EL9Tf632bWCh2enqwkWPi5VzLa/RZ7AfyzSqSH7vDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453856; c=relaxed/simple;
	bh=IWxUbh4BDZ7bPd8L/dwwB+q8iBVYy1u5irOTFUt+L8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCzXILn2KkgOC+ckZJ+K2Lo+u3IvJPozkw6oFQu1fijG6Cpi7WX628avrkIjuJZJnwucWmvLo950LtWLS2z5esluNJf8zljVVFLT6a+Qh374cOjMSigPf1pbyEu6sEyyG/6BcM30ZelEUZc22/b4hc1CgoOLyGrkTX1faLpalR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Lxqm/R71; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Lxqm/R71"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so4733462f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751453853; x=1752058653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G1Fm2q1qB6Y+ckuWV69fHpAi4zNbor+5BGrf65Mmqog=;
        b=Lxqm/R71/qlMDJ0eVPjPMCiMWcyRwVJq+DsfxJBR3A/Zyq9stlGs2NCPVV66goGmZ+
         mGxDjmYDSO8FXJI3ByzarZvm5+3H+pO/eDuaThx9UWH5zGErhl4ZvBTwf4fbm21RtSZJ
         pkGIizRtBhsrvw0SuS9fE3oGn2a1m83Nyl6Bqrtgf+s7dPg+NaexUVjV0tyQkTVY45PT
         szz0fZOxvhNwSVTGvog8IY7uyRe3gZIWjpFthWx+XFeEa/EKlra6sLMbSgIVpxDiXxB5
         eVgyYe+Hs0Rrl+mF2uZfiS4PFTSFYPqTlNRwYQ/nmPDkAvlw3XnyrSzjHcOutUyEVbpC
         CKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453853; x=1752058653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1Fm2q1qB6Y+ckuWV69fHpAi4zNbor+5BGrf65Mmqog=;
        b=TOcGITVrz5vr/bq5dZJSvU3ctQjo/7EYu1sbnsRaZYDqTZjWySiGaSnQ5nz+I5lR3V
         cUfW0+YNGA+dzzKy6i/Xtc6AuKUfQnLMafy8irAupRP5tdKQ8L7uh+YvoQDjj9yr4jrF
         mMzxMYJVHmyNNGMuMMbktjRe5ZN2GeFv6j+wqZoU39QmFL6/9lI7uSJ4JzG+8/Ie8zNj
         7u0YNIt++YojR5JL9GqRLfYFfkal9vHSFWbOqM1T4v9npSvAsHyTIa0nPP2DLiKYaURq
         60b0ozn9x1yg4SF/jJN/9mU+sHJHmAafi898k5Svqa3BgaTvpUgcW7pVu4i/CG42hS8+
         POwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6YuD+Hb/bI1zfGbDrkyC1i1cx0Z7uZzbthSP/q0yiWVSs8MkPVfcXx1kQbDPvvFv46vJLt1jzXU/tOXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKksV0eCHD9jmr6h2rqiSrYTKE/cnD13reQnhdjKMfLS59vsva
	yWoib8KG8lB7D9sgVBMs2c7yD4O54YN2+CFSJDPBlcWTfEdBk/6w53l4n/LdunhIvV0=
X-Gm-Gg: ASbGncu1/y0JTUPXXXCa8pK47EWktWTprrNPVlC9AdU4WikGyqfJb/Zv82uFFNRJy9F
	w2Rw3EbKjv54lU/AtCYHeMYIALRcPwSGQn9A56Gu5nJnZ1joTBplrlajD3Wfi+S6aX5fj5rKbj4
	ujhISjHYrkzB6idLBHmTzRhGpiCBiw7RJD5JeE8yqUbiUmo/uhTxvrHYQVNaoGSQ0MFxSNO5z/M
	3o65uW0Lk5VBtf1+e3aFSvBDCpIDjG+J+MwpQmcU0AbwNafIyyAkQBCCJqTJGg7H87Ju/TtmHk3
	1Hq3v8etvldsz9HfZc1JDgA57B7Bg1CBRWr2oqPWsgR757zkPADlqGxNGB5HBHALw/9AyA==
X-Google-Smtp-Source: AGHT+IEDVTtMFy2hu992Zcq7801L2H6bIzfHs2qeo81vyzxGHZtPy+ypN/+AhlS2RlBfT5PUx2bs3Q==
X-Received: by 2002:a05:6000:21c4:b0:3a5:8abe:a264 with SMTP id ffacd0b85a97d-3b2001ac737mr1267473f8f.37.1751453852634;
        Wed, 02 Jul 2025 03:57:32 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538f2fec5fsm173817385e9.40.2025.07.02.03.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:57:32 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:57:22 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 09/14] dpll: zl3073x: Register DPLL devices
 and pins
Message-ID: <ne36b7ky5cg2g3juejcah7bnvsajihncmpzag3vpjnb3gabz2m@xtxhpfhvfmwl>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-10-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629191049.64398-10-ivecera@redhat.com>

Sun, Jun 29, 2025 at 09:10:44PM +0200, ivecera@redhat.com wrote:

[...]

>+/**
>+ * zl3073x_dpll_device_register - register DPLL device
>+ * @zldpll: pointer to zl3073x_dpll structure
>+ *
>+ * Registers given DPLL device into DPLL sub-system.
>+ *
>+ * Return: 0 on success, <0 on error
>+ */
>+static int
>+zl3073x_dpll_device_register(struct zl3073x_dpll *zldpll)
>+{
>+	struct zl3073x_dev *zldev = zldpll->dev;
>+	u8 dpll_mode_refsel;
>+	int rc;
>+
>+	/* Read DPLL mode and forcibly selected reference */
>+	rc = zl3073x_read_u8(zldev, ZL_REG_DPLL_MODE_REFSEL(zldpll->id),
>+			     &dpll_mode_refsel);
>+	if (rc)
>+		return rc;
>+
>+	/* Extract mode and selected input reference */
>+	zldpll->refsel_mode = FIELD_GET(ZL_DPLL_MODE_REFSEL_MODE,
>+					dpll_mode_refsel);

Who sets this?


>+	zldpll->forced_ref = FIELD_GET(ZL_DPLL_MODE_REFSEL_REF,
>+				       dpll_mode_refsel);
>+
>+	zldpll->dpll_dev = dpll_device_get(zldev->clock_id, zldpll->id,
>+					   THIS_MODULE);
>+	if (IS_ERR(zldpll->dpll_dev)) {
>+		rc = PTR_ERR(zldpll->dpll_dev);
>+		zldpll->dpll_dev = NULL;
>+
>+		return rc;
>+	}
>+
>+	rc = dpll_device_register(zldpll->dpll_dev,
>+				  zl3073x_prop_dpll_type_get(zldev, zldpll->id),
>+				  &zl3073x_dpll_device_ops, zldpll);
>+	if (rc) {
>+		dpll_device_put(zldpll->dpll_dev);
>+		zldpll->dpll_dev = NULL;
>+	}
>+
>+	return rc;
>+}

[...]
