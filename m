Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C585277809
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330700; cv=none; b=V4kd/MJRlojf/a2+CFK97NR0/QzOgSVjRJZqapf+BV6M2/7HycZ/YUkdeNOigwhSaQN7uYKnahj+k69SdCjNdUjVUEw1vtWc/qJzYuPILdiMTYS2vPpXIbyE/GOQd2leameSDVRlmf+nCyr/pz3KviBVVAo2Ni7o18AFCR+y9u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330700; c=relaxed/simple;
	bh=CnFn6dl7idbTdtr/X4Lf3KXnyHFj+WX4URvdrrUx2FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0+vVveOQ5/9CKX9eyLpGMkvKyyBgLeFrwbnxPbK+huj+XwQhOCQSQU+u86cdQvqaP5h/r551bopEZLZ4w8JjIe7Dy4UdU1KGrfPtVgfoEzMIf/WWSwnoffSwfcBJWWR7vqYfGUyTGrO86z1BRglxCluGLg+GUAYZ4br6HEfV9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4/oToVw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4/oToVw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso950866766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745330697; x=1745935497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HPj38otgPfg1CUWLGvk15FrHBLxa1jnnTKS9SOSBOj4=;
        b=k4/oToVwUcwVUigqZAQ3uQswidA8klvJCr/7shMqoyq5U44IAPEeFXzAQgZt+1cYkx
         evum5XN7R3TCQrPgbqQ6LjZPA9XVkL+EJCk8Z8Kh/38vcE624uA6VjtcXyHUuvfOUfej
         /oeEDCpNOfnwgHL4ityY8hfGRydywpykytbZ93kxehyA4ScJN/wggIgHfecY7mdHIlKz
         Ad+z3G869rNHYJnMhz6xhuCyRM2c3aHfS1N0ua0aFLNRkAPAIkmK+u25qGMbWO0Ww+CY
         QJZq5sKfgKGsjJytpQqK0FSW++vw9HcWf8YLcl2bViqMgzhw1hC3kbA1mc20gbvTlHnB
         L9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330697; x=1745935497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPj38otgPfg1CUWLGvk15FrHBLxa1jnnTKS9SOSBOj4=;
        b=kOIB4HzpGc6TsoFZxE/3X7+/OIFSq7p8o8MtRjNZAR+XZxwsvOgMIPuK3+8uEILYJX
         kpD+vq6NBlIJgFg7YXeUQbsKljP8jvDCEHQxI9MDwEXC1tyXMKhUf4w/v2pxsyM60Ie1
         BIVaAwrBM/0ItJcGISwX2kdCHJ07UHBwZ+lGQfnHGktANzU1X/x42NBO/DT9DPUYgd/D
         zj/F27Zt213ZEazfupsl+U+r+qMQ9oAe63ut/D/gjfL6SCaB9NDMfqoGE722w5uzyO25
         2fTRxlz/D7JP76PfGORvfFBXGr199vrSaapdVM/n7dt4DVDA9FgKcDGNWVv6Aqo0NEOq
         vUEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZsWjhwAPOayJxRNZ29N9j5C9qLDgVqjqETOssEgxuf7WB7FiX8rZn5t36AgMK1VABCJCPWY/d/41iOO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzQW/5EYpcIpBrPfuqYhgykSc0zSnW+dgLTVjHLwyKoHp5CIJQ
	y6x8ti0N4OJSaXUCjBB+DxUMWy07o+UuEZ2VlCjywpFy70u21KL4Xqv0/finWq4=
X-Gm-Gg: ASbGncv/uMlO/PBsxRtrqYwS6a6cg5ZRLFrf0+DeLN0iqSaqBa9WhPI/hx9hgl6uJiC
	csYNFKaAN1VJfSWbQ+alV1Q7j1qVTB6F5pPFUATT2rpNDQtYmU+7UcsWA1Nz7kFEgdWdUjOKYKa
	3HhYg0EajCNnFrn4o73XrwBr4bK2oRSnsNbcw3ZDsasWUxS31v2Eb2BZjMSspQtV3Jw41lOTIwt
	cybU/MwoDuD/Y+ikQM90Y1FZHzWIUpyzfA/cTTlffKoDmXVP/mRbamHWhDTa5xAXmiHKuFPXTza
	MDECPYUu2foaJjCYadOk3OD6pn3S8oOr/FuTDw==
X-Google-Smtp-Source: AGHT+IHdC+QkLw/63IGYXQS6q7rBVNNk2potXnQUurnAaNgoQ1+GXHaWxq0i9ui980YqMIhNIDyKmw==
X-Received: by 2002:a17:906:4fcc:b0:ac2:87b0:e4a5 with SMTP id a640c23a62f3a-acb74ac51f7mr1244467966b.2.1745330697218;
        Tue, 22 Apr 2025 07:04:57 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcf76sm669687666b.100.2025.04.22.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:04:56 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:04:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] pmdomain: core: Use device_set_node() to assign
 the fwnode too
Message-ID: <aAeiBbnWgHUkt/HE@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-6-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-6-ulf.hansson@linaro.org>

On 25-04-17 16:25:03, Ulf Hansson wrote:
> Rather than just assigning the dev->of_node for the genpd's device, let's
> use device_set_node() to make sure the fwnode gets assigned too. This is
> needed to allow fw_devlink to work correctly, for example.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

With Saravana's comments addressed, this LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
