Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CEB254858
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451973; cv=none; b=FRfRM4B6MFite61kVpAuPt/T0oPXekiPiN+urVFM5MSkgEsmNiw+X5qkpE1uZvN0KbQWLx/rDzVN5K6yBAY57oGA86QsQxCKjkzlBkByYPVHyEiKgMKvnQWaox5D3ECnrNEsQNBCuFU0uBHl9zjQWVq3dya+UBIQZTAscoRis5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451973; c=relaxed/simple;
	bh=A7Ag2M/xCPgnbM81/Ed1DfzL0YgWiPbRTDK/kNWLRz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMzonNnZK+zc/QPvrqzsfMoBMRNowdiosQuiA7Xmfn+3xMYW7k0ZJZMqgHBXppnoAd+rq/hpZRQf6mkKmbDLJ0W27xd7VKDJN14xYqKaUG0J2s0H2+84eJRJRdVXjLtyL2bg0Ln2kvIn0HWGDBlNWXdhk1XjSLvmWZHV2MA/OAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=mGb7Bmlz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="mGb7Bmlz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453634d8609so47197845e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751451970; x=1752056770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yN3/Rce9O/Hh8jlflcA/tOl9nLaEQorrzHfucHxWn78=;
        b=mGb7Bmlz5/GUSD+zaFlQiXe4qbRmr+J7MCz76Kw6ja5yYPuwSBnB/0kEVLxM9abifM
         ZvwkBIcyzD5eaygzZdztn/QN0ZOkXhetgxNo3mn40WWpAEMsuj5Gx4pum/JA69pCOP2k
         +GBT5oJkj0Ga8rXxr1/6mpaGntuhSjAScFxktzwC0ZlhPeZbBNEQrwINQ62lKqXNTPjz
         ZMn3Uj664DcLFuZihjd3bZudbJTDgUAI8yYMrKTzIfsR3y3nyLzxygYfuFHlkUWGNT1e
         UTUuo4MtxoJg4rPu5IwfiMVDw8EOW1mbTyfXRUOAl78sp2DQ8m7MXAANO6C+MM6D3SIv
         NFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451970; x=1752056770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN3/Rce9O/Hh8jlflcA/tOl9nLaEQorrzHfucHxWn78=;
        b=fN8AQRsFZXedY+hD+RP8w6hYnH+uGokF/RNmZYXdDlyXFM2SoKhv1mDNpWp7mCXkwV
         drJAdMIg8BS0zkIgRnoE0LsPBRw9uzKJig9Cpssxamv3L3TryKrLgvdHUNa9DfATlSF1
         NzbxVpm7V/1f59aX5nj4zr3VvfsxjKG9HX1suOW0+uGG8SWxVbk+1ditZUCArpiPX0km
         PgL2/l9WhqPENLsjC1IhYneXMF8Xf2LywBg1WfkJEWMNWVg9kLNhEBK338XW8ezJNbNF
         TmSZ3knaODzHiX8MmvyfoEuqwvr8WWX30hDMcMUOuqzJj8dE9/g6s61RDi5MBpDaXFqy
         7BVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5OluaPcZrCPBi/iClttSxhmanNzPZD7reIpr6bGJmdxTJxh0ivbapeK0T+1T3NtmiovdyND/37770ngg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMMz/DtK2/GlGdAVwVt399wPGaQLVNGbsWKIAyiCvjWNYxk3NI
	fKb6iT4Us/Ro/eenYflWuKKy7e86wZUy8iXXc8ZDIgWCku1HxQQ82Pn0oksCVjrtjao=
X-Gm-Gg: ASbGncuGtFr/kBggrsA2oHgMQy5qoA182AFP1xq4UGhiCjqT/LkKI4a3KSlPk6DvpM7
	6Nlf2gDvQLSsY2qe/SmuCwG1fqYSD9ZcCtHCWmZg0dBPifoNt9+OJ6WoUNfu/tfvHlnBhzN3/A/
	mLyp9mx0yMbMOYSwAGnuaIg48Q3CRJP6IM17cr+2l2kiPYoGL4Ec+sizbPx+ljQaFM084Pje29h
	9BfL1KnO3tM3Xwu5WIgRDOPedKkSq7sfHqgp+DwTgt24kw27PoIKvrFCmaoUE+NxzG1k91QTSLa
	Dj8SsvepHGvqLya56Ui/D/HYtAFakw1/TDQpX7AMIdVOJAi4WhARHSncvhxpcWpYSDsCow==
X-Google-Smtp-Source: AGHT+IE3Ue/jFuqGKk2j82UXQrlkpofLQZxfY4sZQlx7+9veKW80qJCzF944xSFEweUYweW+L+RcHQ==
X-Received: by 2002:a05:600c:698e:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-454a36ec56amr26467775e9.14.1751451969448;
        Wed, 02 Jul 2025 03:26:09 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16191924f8f.17.2025.07.02.03.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:26:08 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:25:57 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 04/14] dpll: zl3073x: Add support for
 devlink device info
Message-ID: <x23jvoo4eycl5whishhsy2qpb5qajsqcx36amltwkqwu5xuj7s@ghg47je4hbjt>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-5-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629191049.64398-5-ivecera@redhat.com>

Sun, Jun 29, 2025 at 09:10:39PM +0200, ivecera@redhat.com wrote:

[...]

>+	snprintf(buf, sizeof(buf), "%lu.%lu.%lu.%lu",
>+		 FIELD_GET(GENMASK(31, 24), cfg_ver),
>+		 FIELD_GET(GENMASK(23, 16), cfg_ver),
>+		 FIELD_GET(GENMASK(15, 8), cfg_ver),
>+		 FIELD_GET(GENMASK(7, 0), cfg_ver));
>+
>+	return devlink_info_version_running_put(req, "cfg.custom_ver", buf);

Nit:

It's redundant to put "ver" string into version name. Also, isn't it
rather "custom_config" or "custom_cfg"?


