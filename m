Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE1726AA94
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456500; cv=none; b=S5kmdfGjacMMJOt0Y4ZD7tykysQQXuKulLR0f/JUXhovRYZ3CmoHv+2dzmvEFrHz/2iDfXBKssA50zENiqt+liVT9jApoF26VWPXORxa9r5zcmIHSy72z8N+ATo3FBrhrPzruVcXSWT/YwYF4E4tnU9eFW/EhvKy2Yszx/fPvMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456500; c=relaxed/simple;
	bh=pLB/CoHkptOL4qWVMaQUjQV5ZTKskQstiuecHdpzjpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTTPGP8z08X0o0R0iW3s40KA7k8WcGav38pGsOIdfP0FawQyIJBSRt4WFbz1GKa3PZWkQ8MllP0/yQFWZG26NhlB3FNYQivVCl+3fEwhanBlJZE1gYCb65+Il5Em6HSopAlsUdibFTI2eQVSMmNcz31aWObkB3yU/K6/PeyS6/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=XyU9H6Zw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="XyU9H6Zw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso45236075e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751456497; x=1752061297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GzZXJPE+pCDN2n4VgGUurGvnQ9PWiAa/jKqR630GwDM=;
        b=XyU9H6Zw1aG5keWErGbyoFWjRVrTo1hqfUrKHZIfidYmKS87DC/6k0IQg6Ams0l/3t
         6q1+jj51LVxjYD70W5IIlKhH42dzVrdRKagRPDVd7ijGd2ibCwXjlvsl0E4zQxwBumHO
         /ywWF+HffUZrTNOwY93qpX5yZUllgCNU/EwNpxWcmLU9jzXJrpl/vXht0V+O5+8nX3J9
         pP67r8wFXKu9U6d1T32qJZEQl+ag2NyahJpnwiPKmUVCWzD3byVoiX6AuzlOOI6ydxIZ
         X/5Cd8V2c3tZDUldojEldYkQHLzdHuRGPWEP0FzuWC9dzwblexrH/GyDjcTUJhNmTx2H
         EOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456497; x=1752061297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzZXJPE+pCDN2n4VgGUurGvnQ9PWiAa/jKqR630GwDM=;
        b=oOk4IxkNcUyB+S3KQBneQ4JgFc86Hpwwdk620J50S10wF6osV3pD7N8sR4cpNp/F04
         ibGABQckx28Ix5ObmaADYBZeZY286ILZFLFEoadfspqdj1nIU+6PSnhasgtqzauAT8rl
         THWgSSAdM3XWFnp5CLABScTmbChkjnhOzMRojmO7a7Ez8LhKR/SrrufeAJ9PTVgnGLNP
         iyYkryDWI7DuuMvGMA0CSbRO+h8qAuJi8inZZ/DlkVNKMoivHtlKMiaqcJi5qmXG3KRM
         iaADXIuTVaxhzIy+qd/NznuHEqakvn5um/QD2tVavnjrJIEMNgomp5b81J7u5W2z9Y/D
         Aiow==
X-Forwarded-Encrypted: i=1; AJvYcCVkY6zG3/hGoKXe/zC2uB7hs943SrbZoVYoj/6ABuGv1NTV4qpM1k0kL6U4SyZqbecGb0ZtLJ0vgZZv5gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLZ0iZETRbLz/0z1Z3Ex2sO3WOxqMquIvn5AWulH4xqyoVB6l
	h86u8ffJMBj758HtUE7UMPiMehPE8a06KXyzqTo56KuCEi+8adk4G8WGhPqClZe62G0=
X-Gm-Gg: ASbGncsKcoFZ2bd9FIoOHbHL171bhTjSBJT4Xfe7iQqOVqpbLp35xsqBi0LP0mr9e3y
	ecAmCwa//5NSxg+O5hA99jWbJDXfIx1gQkmc4GHLbo/rJgX+DNxzm452cP9ohjMkm2Q3p844psd
	kULaeKXDwLG8SSYBHxrBrND6nriJLhNJnXgZh8dgrS7lA1iyIE8sC+skXGEX+F+3ntTwSXains0
	/87J3F+KAcBo0/P9RCQPwGpB8uQRiBw89SiP01gPZTET006TlvjsUQE33Vo6P5+wzEimmIXjJbh
	J5DDN6uEMxbll0mVfemuCt+53e9bvadaW8FlsrzryHc9Jd8bGLxjdKCA4TDZsKh58zbKT0DSSKn
	geVKx
X-Google-Smtp-Source: AGHT+IEPNXHtekgkaTeh2otpe/2mD8BVkUglqfnjvgS0sOGRxpc82/oHrtuGTxrVpXcyjzzBFMM9rg==
X-Received: by 2002:a05:6000:2406:b0:3a5:7944:c9b with SMTP id ffacd0b85a97d-3b1fe2dde08mr2085098f8f.16.1751456497314;
        Wed, 02 Jul 2025 04:41:37 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59aaasm15549022f8f.83.2025.07.02.04.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:41:36 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:41:26 +0200
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
Message-ID: <vhv3wdiaphtilm7w3v5iro4aojo5go5vlacwfmsycimxnljhsl@itc567adbkey>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-5-ivecera@redhat.com>
 <x23jvoo4eycl5whishhsy2qpb5qajsqcx36amltwkqwu5xuj7s@ghg47je4hbjt>
 <351c8eb7-26b2-4435-a6cf-6dac36e55ad9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <351c8eb7-26b2-4435-a6cf-6dac36e55ad9@redhat.com>

Wed, Jul 02, 2025 at 01:38:03PM +0200, ivecera@redhat.com wrote:
>On 02. 07. 25 12:25 odp., Jiri Pirko wrote:
>> Sun, Jun 29, 2025 at 09:10:39PM +0200, ivecera@redhat.com wrote:
>> 
>> [...]
>> 
>> > +	snprintf(buf, sizeof(buf), "%lu.%lu.%lu.%lu",
>> > +		 FIELD_GET(GENMASK(31, 24), cfg_ver),
>> > +		 FIELD_GET(GENMASK(23, 16), cfg_ver),
>> > +		 FIELD_GET(GENMASK(15, 8), cfg_ver),
>> > +		 FIELD_GET(GENMASK(7, 0), cfg_ver));
>> > +
>> > +	return devlink_info_version_running_put(req, "cfg.custom_ver", buf);
>> 
>> Nit:
>> 
>> It's redundant to put "ver" string into version name. Also, isn't it
>> rather "custom_config" or "custom_cfg"?
>
>As per datasheet, this is configuration custom version.

This is UAPI, we define it and we should make sure it make sense.
Datasheet is sort of irrelevant.
