Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28A41B87EB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751700795; cv=none; b=EroTMcFu3A3xmtvVsbPxwSegSdx9V2tQnIuuN5vaZ7fT100fMHaszNFFMzUXG1YcIns4EctayTB4s/dcIpS/hnTW/K392I7wUOqKJDgiseHGlMR82vAofDTPIToI98JF94JOvf71gHnvkoxnQ4F6hS8P5d6KC0z80WLa6y97o4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751700795; c=relaxed/simple;
	bh=dV8yKwn1s9RPq/fJzhyLBarLvoB7DcL37DKhMvTOZX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BkQw+QlRn6KjzAAsd8xsgZAwHWzeWzP5Yfr/De4SGtDVZVHJssnEk2IOSGgk7tySSa7EF9sK79ZkSRfJKjFhZf8uJIc5Q5OROdMg2KKSVX/d8OqmNPM9Asj4gS0ZfRQFFJ54PYTpz4gvhTFnFcZ3Te61jn5VbTfZCOVlspOMAYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jduw7J5p; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jduw7J5p"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade5b8aab41so307710066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751700792; x=1752305592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BzfNtLpFJK/1rL9CXjpJI51Ye7+7b3LCibh0EaiIaI=;
        b=jduw7J5pKMeyNN3N9qvafDLNWiQp3YAG/NtuCZtpdU3WQDuBwMxQIdwIhIxODAGSzg
         QgOM+pFU2heUmZDclTfl2eFtP2AbRn75ry7qW0QzVbE9tn87MFk4nVCtawfAg4FomGcs
         T4FjMFTFEHJLVEkVYiDpsgyNg8KsT2xTv8Irb/ZFhH7pF4w7T+BGTCNR5coTV3vh6zxE
         qZJzOVA990LFGQI9FrpkVE62lYWSw1uQv5BWF920bF2Qx/YserYjd36gX8DoYMzF5OSu
         hqpE59xAtayPlDu/kv64MR7BAn5salkx6ueyjzlDz0dxXl9Lg02tViXiP1lMnY754qiv
         oqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700792; x=1752305592;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BzfNtLpFJK/1rL9CXjpJI51Ye7+7b3LCibh0EaiIaI=;
        b=e3lGI4x1UOP9l/ySln8u99RnQ2HSJ9Hr1oc2V4JyW3pv7VnSnDo7jyQi5Y1IFB6pTI
         DQ1/yE6kCatVugy7p6eEHI7S/6vJ3zi3mOkdbhfch/7AnBdnnEYs4wdpfvbQGKgDVmjw
         or1nGX7vinVIzEXpGzVat9Mws+bF/FzMJgZ4Fn8SLQGGsFBN+G1WPRhpH4Xe83Mf5C07
         VGvNfIb6TKC/7GHO81cah55NgfxGlSdKhk6Z5JDs0l6yd//dklfmONkASLSd4zIDFBJ1
         dyik1OV8u5ECiYia00jiG/Fjp5msRJYKWIoSOj3Kgegfol7bcLy2ak65EHIfpjG+s+aF
         JX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxvSC1pGfSC7beGeSak6AvHLH15u4P2MnVfUtCHlR9xGAzc/jfFwcoC12Ml3+8Ta82Ojso8ws+pHRx/Is=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl9pP/FoNaXfTvyPas7h0xy+uMAl+/jpl9NG2PPzS9/bSqfYzF
	3RuIhW/x9QrlL4XUggbx7pJem4oXjCqpk8AVK5rbzdyt9Ov2tIwCYY9PG1/VTD/amMI=
X-Gm-Gg: ASbGncs6LFkwUhX5rmQeMFgplqIoXSIoqdgfqp53f+gegMMxEERr/2dUGE0R5i1Ft5B
	7A8JXt3o3yCyMtexslYfpZk/C6t4zVAbMkLfTjhPXDrC1z+ELyncyUZLCEGy2UqtDQVgYK40PoC
	PCJWT/a+QXz6OCe+yjmW6TwhT8AVddLb9imkpTAZemp3TF78CHIZn+b/0p0tqcDpGZe3i1Tw0nv
	Fb4YLQjmUPzVWIDE/4dN15EtV2AAp1IDAB1ntYpux3yszsgcRZPs2DyonphSMyUMd2ARIyWoNNK
	p0EGnd1ToKNoBDuek1VeJPToTOUCVBjWUAEIHewGCVK9qMIpA+vADfGRZvJPzsw3LAXKSA==
X-Google-Smtp-Source: AGHT+IEyjZg5XLjSr836IBwSt2gYJioyHjqnWyfO3B2HFhMs77WWIN1RLtUFlIyuT+MplatiWpCWmw==
X-Received: by 2002:a17:907:7ea4:b0:ade:44f8:569 with SMTP id a640c23a62f3a-ae3fe73f353mr500816666b.42.1751700791818;
        Sat, 05 Jul 2025 00:33:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e7d5sm301895766b.151.2025.07.05.00.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jul 2025 00:33:11 -0700 (PDT)
Message-ID: <0f6dac77-14d4-4bf9-a622-1f075568051c@tuxon.dev>
Date: Sat, 5 Jul 2025 10:33:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: microchip: sama5d2_icp: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-4-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 46a8a137d8f6 ("ARM: dts: at91: sama5d2_icp: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>


Applied to at91-dt, thanks!
