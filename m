Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609926FA50
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 22:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751409844; cv=none; b=kC5iy/AacNrdDqM/rWKbCOeSiNHrJEsPip4L7VOO2W6jxih8zxbacixfAjhk/uLz9zThDaXJHAB3Zm6Lui2EJmfuTORhoknEqYYDM8tFdQGxGw+6KxVBlbl3AXd4ZiwZKVzoNkmHzuR2kC3ziIO3hVlUSKEX2xYBYeDgdJSCbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751409844; c=relaxed/simple;
	bh=7sr/j6pKRahXta2Ds3J7bgr68QpT8C6nQo/PyJxSPSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tDwO1HzPbxbNGkLIjsaxcJsEEOlkkbseirwXOYnXEIqMPkwpfY3YSOUHM1lt3r+YKq1IWtdJqIx+1aOcubhPbAn7Tmhv5TJcoeBHYkqX08Wi+uuh75OKwc/yt+JY795RyXil0inTaBTPQFxlu0PTWyUtcs2JWY7zbLDxdfvIqK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQXI+N5U; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQXI+N5U"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-711a3dda147so67660267b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 15:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751409842; x=1752014642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4FeRd9wXeQwX3S1+5R3UHzHnQcV70Su/Q1eyBq9q7c=;
        b=JQXI+N5UUu9vz5/fFlyV5Gfe247vDrXCqh5Nx4mvrAEVJzxqpUGDZh6QqcMWziOAyS
         1pkUIBLUO8C3lFpLMSm6Yg3ZoYXAw5eZ0V4dctAWxgVBJavN1d4uR7smnYlYvhwsF7As
         AZqIZOwi/gxoKbAiiMX+GROz7dh3RUCGCZ9J9uGs6uOn5QBnwT1bVpRymbV41OykK8xU
         CekVTalPW/Tk/YBmo3O6K7HwSecC5I/BXoaQ9gbgtp+V2XGLJQoxIiAHbqXwQnaSRjUT
         z53tJOwdW+j/AuE5oIcgMZH8fJU0HUkCOIQr/wUp7XGWP5eDlGJDTjzARkXZDmXIfc4I
         RXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751409842; x=1752014642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4FeRd9wXeQwX3S1+5R3UHzHnQcV70Su/Q1eyBq9q7c=;
        b=ZStFkvh1w6qdz/+bjHjNGT4WBK+hOZqE0YoSNBZAZqN36s3IzGxh8x3IeSXPxJ0rQ6
         1tGTP8CTdVZLAe6kkwrw5jz8xfUZzerADLp9IJI46hybp/JzL3PfoPRhg1Zc5USJSA65
         jC4NO1zz/jw6+EPVe0s/DBlR4IwFXrgTdE+BYo9DgdWjAEPFimHDmGseS6wANFBa5VP2
         6yBDk4ClIA1OJ/2q7Wnxq4CZBahJciFncMZuv2agKQQlGYt7F7xggxvjNP1o1Jz/szh2
         3p7nDbHVJdYNzeGIvT+2dRs3HKiXSYT1nEVyuKbtMDFNPUroIr3xHOlcx9xMJhM0uJsF
         ueSA==
X-Forwarded-Encrypted: i=1; AJvYcCW5JRI9cMkuAEqScLsk81Apf1qrRvfVpEJRPubc+91TNqJsBaBLjIlpyq+lV80z38/KD1VtVcuvNrG354I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqucduX6NuLy2mGSmlJRDC+ISzVo4MUufomeqJPBw3+a9iHOY
	N7CYnPyBRgNb2ogOk240vKh4Mu49G4mo6GljUVwOThpeTv9qbuw+PjXt
X-Gm-Gg: ASbGncv8Ra1Yi+62CohtDQuXN/5ET+lGxt0Giz1h2v79eWrJOzuEVAxdFWNDnpfMZ4x
	nc/PWWbTBaOJGb+ImbptbFHYUxz5KfLBbqCidP9mUaNAI2P50i8Y4JJryCcFBWaY7XkpFjen7zm
	5OPi0kOUpfjwOhPWOFrlwhalHsAcVc6bYsEFrXnizN3dufHCvNg/l5OP1Cuvbhqta1rsyF3MCcu
	ZiyktxIcPYxaya5tkGoij48LSIX7yxUsyt9q+RPRhn8vbBE5gdQZ7PtFaqXPuKh5oXHBFrpodaC
	MZSl5fR6CDeOmdOcRpoLBH4CHNIqUNctsZl742nvKsW3L+QrLgLKfeZ29UrKJWMGbdYcydGD5EJ
	s34BXgauYybIJQughxg==
X-Google-Smtp-Source: AGHT+IHBPTQW25dLkI4nDbmWAJnJmoVAk9KwGoxI3zHd26yMzfgQe/ATjFFJf6m4R4d7cp8PptyOOQ==
X-Received: by 2002:a05:690c:6f83:b0:714:256:7917 with SMTP id 00721157ae682-7164d527940mr7001437b3.26.1751409841578;
        Tue, 01 Jul 2025 15:44:01 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:bdbc:6e11:c9be:13a3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515c0464asm22189517b3.42.2025.07.01.15.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:44:01 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Bijan Tabatabai <bijan311@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bijan Tabatabai <bijantabatab@micron.com>,
	damon@lists.linux.dev,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 1/4] mm/damon: add struct damos_migrate_dest
Date: Tue,  1 Jul 2025 17:43:30 -0500
Message-ID: <20250701224353.9062-1-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250621173131.23917-2-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 21 Jun 2025 10:31:28 -0700 SeongJae Park <sj@kernel.org> wrote:

> Introduce a new struct, namely damos_migrate_dest, for specifying
> multiple DAMOS' migration destination nodes and their weights.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  include/linux/damon.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/linux/damon.h b/include/linux/damon.h
> index bb58e36f019e..d60addd0b7c8 100644
> --- a/include/linux/damon.h
> +++ b/include/linux/damon.h
> @@ -447,6 +447,22 @@ struct damos_access_pattern {
>  	unsigned int max_age_region;
>  };
>  
> +/**
> + * struct damos_migrate_dest - Migration destination nodes and their weights.

Nit: Can this be renamed to damos_migrate_dests?
I think plural fits better because it stores a list of destinations.

Thanks,
Bijan

> + * @node_id_arr:	Array of migration destination node ids.
> + * @weight_arr:		Array of migration weights for @node_id_arr.
> + * @nr_dests:		Length of the @node_id_arr and @weight_arr arrays.
> + *
> + * @node_id_arr is an array of the ids of migration destination nodes.
> + * @weight_arr is an array of the weights for those.  The weights in
> + * @weight_arr are for nodes in @node_id_arr of same array index.
> + */
> +struct damos_migrate_dest {
> +	unsigned int *node_id_arr;
> +	unsigned int *weight_arr;
> +	size_t nr_dests;
> +};
> +
>  /**
>   * struct damos - Represents a Data Access Monitoring-based Operation Scheme.
>   * @pattern:		Access pattern of target regions.
> -- 
> 2.39.5
