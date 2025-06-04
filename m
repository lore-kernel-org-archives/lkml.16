Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD09D28B7ED
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041206; cv=none; b=YhD5nt9nIFAwxGquLOjyidVOlIkZZaBRU/VZISKq4arcyCJ9f6YudQWb2AWOovehQ/EblpARZtOvqAJ7cPwvx+LUir6dyHijCuPDww27WU6NdnHk4fYxrhaBLSbXfHHrS09eY1u2qu+rORK2LiTTZuHcEuMAWY2geJ5SznDHM/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041206; c=relaxed/simple;
	bh=kGTwydqDMCIPl1CpZID+y6ccqB84UAx9ACYmkDc7hJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2Q9I+ZeCA6AlYaLEmA1gmHyqtUqSnwgb813xoLOYzYXBwmsIIOffasCjJwSF4mrz1Xr9pi14meGu1GcOJ5qqffeq2ym98GJwz2OrNSD3esd+LDeYlbcUVJXkPttnWfpwg6l3g9Ifw5x7qXmKMcM+BaN0qt9tTrO6UIk+P/5GpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ia0N+eAW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ia0N+eAW"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso13151146a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749041203; x=1749646003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6qdJO3p1x1A/ngwXZAm0UCO5G7hC2bDfKwNoG0neIM=;
        b=Ia0N+eAWw0RMn7qQ2DLnwDjzHtu0CoS6kblI8MC+dHTfNxWtYaB64YEQ5Xz5/DGyWl
         CTCe9R5zlkgZji4NQAs0qi2yTSNoa6/dR8OJl2jwvjG3fTiQIxp+TtmgavvCKsa0Hr8h
         7/33rwjR5oUZCIORhShDNvfk5HWNjxuBxepxQGSsmcVODjWDEOE8Fcjw3UHzGyotYyyR
         ZbjWFNQbqVn/WjC4di0odXWufJFU+snScR61sycc67e7GkOYWfxC2jViZggMA8fX4g0Z
         mZtZqg5E7f5KX4YroXJ8ZkWY1zznmWW1tmMfwmSYsxtr672t0b1f0diyeqVWCY479/Bn
         h7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749041203; x=1749646003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6qdJO3p1x1A/ngwXZAm0UCO5G7hC2bDfKwNoG0neIM=;
        b=JwuO/RspRKpgJRKLGKTu8aXU4mTkHEHf0wgR4OV28JsKRaGIHaENKAkLpl0gbpUDaH
         VKgtjKjfnHvvXzDnqOpieRs8oQj7tidXGmMjmn0s5bEVxbgIuUkOXI0wV5bnFC6f54/W
         hJps2lYq+6Vm1l0dw6jZ3t5TEN/wafoGtlAiQQF70TP4GCWJyH+T59gJyQp7krNflKyj
         7+ct2tqWI0AQoXd5qqfLasfxu0hCGGZJKPUfkHQybJnkA7Y0kDpHIZ6NTc16y/kKV8FR
         ABuEyuThbkJxQp2aTWPlPBt6vHl//sJXauoyNaBWcU4RKujha5+D0JVIuoNCkwLXC79l
         xKLw==
X-Forwarded-Encrypted: i=1; AJvYcCW9DH5rZ+ug8H5VA14cUldYn+KnxwBu18fFK7v27J63rf52PYWdhT+qidsxdi1fGuMBVSxucu6we6ZXnQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2D88cde9qy4/BF6Of5p4t0M+BmlZj6HFN2DKDzggtFP8t7Mo2
	0gFOsYaGaLDyDOr9H2ydflJbXzHHqigvxJPijY7BtqJo4GA7O8R2A9NayfX6tKEkj6s=
X-Gm-Gg: ASbGncvctG2y5EGYx9AjkVT6arlkBGqqF2KVos8wmT2yeGdpLPDN4cYPB67kYK+sDjX
	c6vHXmyNtQhiVDyGDTGX6P9p6KKUXLo9qS/dGycchaUzZ+gVr6NX5FmQFXky3aYnfS8jSYSMRbX
	NZijGg5JAr+WPzFgbKb3Phl8zDlhHbn0f58grXYh7YntRgOTOGWPhh3sli2f8E+AkZfJHLDBw+o
	jO42k7/Tg4gFO7KN5VJ6G5IPxBItVP0M5+K3JwkeTs17lFM/gtZrPDr9o/WsU4hYBtKl7H2BLWQ
	E0hVoYUBtlgrfeFnMj5eOiuxVNgUC6NzFagc5M0ECnsfFev+AQY+ELdgRP4=
X-Google-Smtp-Source: AGHT+IH3hjyMtS7nUHzS5hLiFEDH6xWffHB5UpuCedgbYbZsl9L/r1OhGo56kbxkn7IVvP66st9SWg==
X-Received: by 2002:a17:907:1ca1:b0:ad2:2dc9:e3d3 with SMTP id a640c23a62f3a-addf8ffa8d4mr256307466b.57.1749041203137;
        Wed, 04 Jun 2025 05:46:43 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd04551sm1102106966b.93.2025.06.04.05.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:46:42 -0700 (PDT)
Date: Wed, 4 Jun 2025 15:46:41 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: use per-PHY lockdep keys
Message-ID: <aEBAMUdAVPB+cN78@linaro.org>
References: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>

On 25-05-30 19:08:28, Dmitry Baryshkov wrote:
> If the PHY driver uses another PHY internally (e.g. in case of eUSB2,
> repeaters are represented as PHYs), then it would trigger the following
> lockdep splat because all PHYs use a single static lockdep key and thus
> lockdep can not identify whether there is a dependency or not and
> reports a false positive.
> 
> Make PHY subsystem use dynamic lockdep keys, assigning each driver a
> separate key. This way lockdep can correctly identify dependency graph
> between mutexes.
> 

[...]

> 
> Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'm OK with this as a temporary workaround, at least until we figure out
a way to have chained PHYs in the generic framework. I think long-term,
the PHY framework should be the one to call the ops of the child PHY on
behalf of the parent.

For now, this LGTM:
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
