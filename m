Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1545425E461
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851663; cv=none; b=X9ZvK3FofIJQM3Pwf8M6BnuAGV8GapUC6vIeLZNbgbrGxWbAJvtozNmGLIiJi8J5ZSw+dClZdbLg97jce0XvaOgDlvhqA2FyAzrsb4FnjiUAJxCKXcVTldQyyrnAfBlYkQhAMZJCOwuH7fy0kALUFhBXhfZGB080rSGrpkeQKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851663; c=relaxed/simple;
	bh=jJJlgaFEJ9g9K6Q8SrNlaqFfTep0VyaYLLhfj8cLj4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzBbtzOgD1GVaEhP41Tyf9mw48ZIXatX5EP0TGnXUac+VFWMtqtvULE7JAIVmM/9QlesHVP/AuwrgBj9MgBNgx0hF2r29WtvPSiAS6qGddhKAMyYi6UDdJ4y/m+SDyZ6WOycaRf+HjUlZp2Y1RvxCFQRYH7GzuibMz2UtEEqylM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e4gy6egH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4gy6egH"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso171913166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750851660; x=1751456460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dG7kxxjRLtrO7B9/s+bXTu7SCYb/AqhokTFr9duMWFo=;
        b=e4gy6egH+LiY5h7RVXdwd3u409F+zYI1f+AvOgELDFBGaLEsfQy0rrdcSrO/frS1kq
         pDfZstmLHf6fc3fgZR7DAOZZOX9PgR+AQybJbsxSEa+Sh8RJTXX6zoirERV6NAqZnUOA
         9ZvRlgKLvWquE9MlKb5Axc6fJnBaxN+uw8zwaunT8AuMfhubz2ClQ3uOCI4IvFEwkNsv
         qHheN+Qsij2lxy4GBnSxjnav86I0kyr5XuQMkg2OVgMkLOeY5RAVz1o1XROPQw7jS/t+
         DvTjst0cYJgzerIsBOkCX6jhWeuj2tj5mJ8tTJK9yoHEnStJgzwWYobSU0RSbYDuBuBl
         16ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851660; x=1751456460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dG7kxxjRLtrO7B9/s+bXTu7SCYb/AqhokTFr9duMWFo=;
        b=j+zH8FcAotpLh2b1KYOAuIZxgBpS6tS90cIX7dveFXiPuoz5wO2fY74yLUoTHBhNV9
         UVyGHQIGD7Go3FJdd6Rbue4xwsFqq/vJ5yHAqRwXx6wLvEHWjTB7fW6Wtb7EK7+TeBRx
         6+EWCL/A0I9JmDtmnmF+H/AYHwu1pvaheRDeNmNos5+jvDl7dkZrx8+uXzx151J8Rns2
         cAYnUCNgXYqsYqXRVaayYaOBvWSEmz2AS5zitLohrW6YtfSNqksKic+eD4v0docoPVsl
         ZwamULWBnBRvO55i+BEfXC9bRRRSdFk9rBCwpqqGN5/fkKXHn0oaTYuySgpNo1XspFnO
         KxrA==
X-Forwarded-Encrypted: i=1; AJvYcCVefzBPd2J3GyL5+zJBhCDsy1bhYKOkr4frzl3GR7s91J5cQR+tJlAuHgaJQhO3hmtNLuAAtyGEnNWFurs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrpu5lZrsh5iZpKpWHrkYkeKnHNGPlqkOtNXWrr6Db4T04jIGu
	4vFi62B+rIkFhPUKVoyM/SicZNG8TSsiMWdE2SnErJHGv++y2gl+017g/o0GhcoWSTg=
X-Gm-Gg: ASbGnctlghXJC2Hd2tj79v+vXmBYnoCapc2Pk9SjfEhbXGojGxh/m2U4dtCPFDuC/ec
	g2cG3cfqjz2SB0e/g9JaE9CPdYtdYA5QXkwctbl5NX9cKWENpC9T6J4XiEPdCCEJqkXIAbuZ6ZO
	QU7P/TFL7xV5eC6P9Hj0tmQMR305B6pR4klGecsEi3YYms0Bgeca/RSaYlbgWluTUlLhx0qG0LJ
	SR53IS2kWFV3cvey80zeK7T2cmpc452VXqnw6sg2sZJg65j4qITL6HBiLkCyKiE2P41JRarvBEe
	aKwodZTu4Xxk/jt2EZzfDy2PW3dQTbkBkD/6DSRAOo0H2zFPZ3v4REAyijA=
X-Google-Smtp-Source: AGHT+IFpDm4RRxvmymupPNfGTqlfEfo8Mbg7duMyL1/t+lekqFEkI+Q3G0VP+nEz3h7kTBtla3r67g==
X-Received: by 2002:a17:906:6a0e:b0:ad8:942b:1d53 with SMTP id a640c23a62f3a-ae0a7473535mr648229366b.27.1750851660394;
        Wed, 25 Jun 2025 04:41:00 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b618251bsm197805866b.55.2025.06.25.04.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:40:59 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:40:58 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] phy: qualcomm: phy-qcom-eusb2-repeater: Support
 tune-res-fsdif prop
Message-ID: <aFvgSjkCNueASD7D@linaro.org>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-2-19d85541eb4c@fairphone.com>

On 25-06-25 11:14:57, Luca Weiss wrote:
> Support reading the FS Differential TX Output Resistance Tuning from
> devicetree and writing the register, as required on some boards.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
