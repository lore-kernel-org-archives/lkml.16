Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2503F5BAF0;
	Wed,  2 Apr 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600105; cv=none; b=GA0xytcD6pdr7pfbsF2pbiVtY6I937T9sLLDf4Ofx2jrjj3Gous3aoRh8voJPTDkuKBSz9NqXl9CdL77gkCOnCsD0kD56NUclrS6AAVn6CF7R93qeQ4Wo3Za18X9yBONfU73HMLnc2y33nNf+aC0zLf11t3a6cPrVdTmV/QHodo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600105; c=relaxed/simple;
	bh=FX0CnmQqGwrk2bkPsK9IogoP3JOc1+5ShtlmALI4jD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqtwichXY1B2Sq1wcTmyxpsqTsTPijqeCknqEhbEuf4bbVo/PBS29VGTWV/7QtkavE6IvoXB/0BwV+eVbW7JTgasDLMWup6EQyZ+EtniZTBxJ2MO+5n2oIayuIM3OcqF9+36H0jo6EoPr3StMZp8maQkEjEJg5CzADVxNxOYMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krmep7QP; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krmep7QP"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2279915e06eso135008285ad.1;
        Wed, 02 Apr 2025 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743600103; x=1744204903; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ORMOjCHQ/Ycvm6fkSvAtXGgmug70vdQxaMsVkAp+GuE=;
        b=krmep7QPX3xDmIwCs7RAXmjqLkI/GnobjVjCo2YNmzJjFt50alhu4JpnEf+a8kT+3g
         G3XMjk23LkbeiTKlIoPP+q4vXxp/6GPe94TWoqArGcQ6FeZq5fKGcufGrIBDsNa9tas+
         LhK1wKLx8RF7Z7/OGjQCA0ZBT0gj21dXBZydAYFpD4mUCK+cY8Q0gQOHSy/hy2CXKD74
         /VAjTg/tj/Eg86y8mwBGfuwqMenQm05v9ReCK9vSYQNrv61zdM2BQCby6CbGxmvXXYXc
         mk/W4gDS1VIJIQehEXJHNrBs+9emQl/tmLyTmRZSJSBcZ5TMAK2M2UBF37jow4WSdh4g
         eGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600103; x=1744204903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORMOjCHQ/Ycvm6fkSvAtXGgmug70vdQxaMsVkAp+GuE=;
        b=g4POqEoi6iWeilGRhHxVe424qx/6Kpoq1cZj/iNt6RWoAz+cHEJQAdPBDVRNtLqN7t
         Kk/a5Kecf4BqL2HVAM5XcKj8J0NEs3nuFES3d2qdXklNO9hbRfxP1EP7E1S5fSIJGfsG
         H0tOlaUDcZiP/IscxmhvFCq+BND4h78Aw6ypHodwqa3DNJNSDa6sk+GOycSkSF8pZh82
         19tVP6N0QPgoe1ECM2tP5SvgvMRMhv42DmYYvtlyS7gOoZxf/9ZOEK5Cq/Kp5Rijl2nE
         2ANIP8vck5xIjcbfULIHBmXv4MqBIgx6mMunRzjtwqHe9x8IDUOsTUh4yRWox+KWGz6e
         GAUg==
X-Forwarded-Encrypted: i=1; AJvYcCVSd7iD8w1gAw8D/TpLMnj7yj5W7BOTFq6qwep/pnGuAptCGWuKipIeqGlEpgL9ziJkl0xd+NcsIhDu16lt@vger.kernel.org, AJvYcCXf50Wsol5imMk8Q5zr0N0tv8vkPPYng6owEPjUwe0P231ZqqW9/IPUhpbQG8YQxwclEbvZWmFZLKOF@vger.kernel.org, AJvYcCXjs4tX7ORoA0jlIhPutyRYSMEc6f0fuRkIn3ooZCT/5AY44MXsH+o/UKXotbQvLJ82dCWuA/RZSn5MW7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLkT/23ajlXGM22ymvcTQqhEZuVe6ptBEeSR08EM5IIAxswbV7
	TiGxM6eVMJIUPh+51vSTz99jD/llPs9mWF1xeSy7LvfZP0HsmlV2
X-Gm-Gg: ASbGncvYyE1wb4tuqaw6yGrfEiQ4c08F18C030gu9XMj7si3CjF5dX4NwEdGXuXDtET
	Hx92+rEtSua7IJqeT3vjWZGO7AtUExW/d8ah0dyUlcdPTzivtEesCp9JHdX43L9JqlFFcfDKH8L
	caPvgSPbIbMBkanrplF3gPrQsCHsBzFybCnsSgzcCtQMAqAktgu8xy1IIhc6LENmsihp+iZNJ92
	xGjksZ1DlVhKFIcPEBsTso2aiAyZkfLrKEEYvNcGHCQCoNOtXUn+pyFdLXSsYTcT1zoSb53pBGU
	ddIeby/X556M4uCSdu+TZAtbuFP/DyUqFW1nl4vL8vy9ZQTDmIQFv+sP3aCXiUayTH+pgW9IAOx
	QtpZPbJWQnMjS1PynZw==
X-Google-Smtp-Source: AGHT+IEo2GNuK5Ncvh1Mn96UCydQ0exmAN765xZxLKmLnRc17NECb2B7XHFXywsHJwfEkF7LcM8BeA==
X-Received: by 2002:a17:903:3d05:b0:220:e1e6:4457 with SMTP id d9443c01a7336-2292f974b94mr258110945ad.26.1743600103275;
        Wed, 02 Apr 2025 06:21:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cdfb0sm107164985ad.142.2025.04.02.06.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 06:21:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bfd36e46-7056-403a-9242-8ca7cda1c6de@roeck-us.net>
Date: Wed, 2 Apr 2025 06:21:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: (amc6821) Add PWM polarity configuration
 with OF
To: Francesco Dolcini <francesco@dolcini.it>, Jean Delvare
 <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Farouk Bouabid <farouk.bouabid@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250402102146.65406-1-francesco@dolcini.it>
 <20250402102146.65406-3-francesco@dolcini.it>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250402102146.65406-3-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/2/25 03:21, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add support to configure the PWM-Out pin polarity based on the device
> tree. The binding would allow also to configure the PWM period, this is
> currently not implemented by the driver.
> 
> The driver has a module option to set the PWM polarity (normal=0,
> inverted=1), when specified it always takes the precedence over the DT.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

