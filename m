Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF40149C7B;
	Sun, 15 Jun 2025 23:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750028704; cv=none; b=B1uINMGHnsteKHfLBPG01JGECXrX0E50Nv1j0nQAsiOylibKKX3Rv88kL1dTrsLgl8ahluYTzoXA/gbH1hko/luQdL1qNLteoSt4RWJf9/uBFjPrsCFed/lyu0wFDp2nhOF/jaDXgRoklsFq/NhtovZxvWJMtZTIAQer4QApzo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750028704; c=relaxed/simple;
	bh=E7QG0svnAz7Fz4OC9ZBb8shVk4AK4/6yQ3x+8u9aGhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lm2hbtr34O66sD8Dm64w2z70BY7ENyDlT6W2bGqmJdZqvPspZvnf0dyYkJT+fi5UUrxe905tS3K9O97d6TbHV4zIRP3s+gCdUGHI/+kN959AW30kdr4Bl35bCaMy+WwoziOvEkbdoQIdMchGwH5LweOyS+KFmBTL8BoKg57Uooc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpZbuwwC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpZbuwwC"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235e1d710d8so47026825ad.1;
        Sun, 15 Jun 2025 16:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750028702; x=1750633502; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oh0zjeUznthT42/OOyPs+9soRXl5xHv4z6O7pvLUMcQ=;
        b=cpZbuwwCiN0gpXGjJsl0m+EjwZWhd/0+BAnYg2vT0MkxolU97a43jJnNdNDNSsjL3t
         sZos7IbsiypGTfSbnjmHXEqwYO+CTIdlVk7UfGSOaSduTHNb5OlOswHoh0DCgyCm1qMH
         fyHpq5wcVpYmvHKD1iMZnSKrz8+StrE1w6Esa5HToIBCvzVfQLsqYkeQNGQp/Utx5wLR
         eFdww6zrt25xA6XOlRWEtiai0vC1LOlsDySMp12W24Qf3aBIGksE4msZye/rgoES57M1
         mTZUT8FIR5u09auw+yRSMOjfXi7tmmcMQty9v9Hl4fHX6NYbTl1hTOkjzKT1toxG3ZOO
         QeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750028702; x=1750633502;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oh0zjeUznthT42/OOyPs+9soRXl5xHv4z6O7pvLUMcQ=;
        b=XeJjg8RgXHq6k7xoGYKxhtylKA6g/hCatbnOQC4Xg90BiBXRx1+P1kDNhrnlL6Sa4k
         /VM7qL3QUUwWHclCdWCFNgI3Mj7FHE0L0foJQ/VZbgoEkUU5J4WBhxSopL40TzmqzZm+
         rCG+q8CV9lsROTIJWh+tSSGGh2Q8TDFCjlKUAW8wYFkwbkmcD/Hde14SV3sox9N/3YHr
         RxV1XqZWceaWu5t5uvLb65TaUh5IzYjiKP44GI1wv031J/RTjJYIJvMGn8bdP8eeHpem
         exGqkRJht5xGpLWctYzeY4BrlUL22RjZFMtKTHdAB7HOq3bmVJfSMQP7warl86qLJO6F
         UI0g==
X-Forwarded-Encrypted: i=1; AJvYcCUNbz0D0lKi11VsOx8XFekOn0CyMtMzrFchsSmBK0hj+fNAKi2+H6V6d7XvSOudqVtabd6VSS+SBQNoGbzt@vger.kernel.org, AJvYcCUdpixWW44F1Dfr4wj1ua6wR2KYxCwb2krV3Lf6GtmrJKyMBfHe9c9rMWuLYhTbp5hyG0+j1lFzLO5XHgM=@vger.kernel.org, AJvYcCV4spYhVB1F/GstHp8Soqj1Dat/C5DXBPGLv+MTsYl9N3uJt2WLr8yxoVX5laB7uQcKYoKUcy3aA4XJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYK+d5mS+5NbJrQVTC1STKfKh9GWSHjejFN/r7gfPBif7CoG/d
	dyjtmnqw6C/6RZl5o9N7LI7sSZ8JazPxQKlZoJBJSfV9tWKNRtDz6GPmnPbpvg==
X-Gm-Gg: ASbGncuHA05wW7HJqGoq8qBI04ciYJPfL/tnNBe+wfc9klym/16wYsWRIwMxX76p78W
	1XU6124jsOvzrITv9g/RNpdehrXni3W+RM2g50MCRhhLPZaIW8I1D/YODP00TlfD8lyk24GSbLp
	Oce/g3SSskj1ve1abmAxgcKR2ufNXDv0HfUa6DQh2lyUmmYMHpw7qcNQJdKMm92f4nKexQfv1Pw
	xjexb7tWQp7kY/h4nwwBJa4+NJ9oI6gm7wWmP0q7A+/hUIdU+My4LX+ivncmqLZzE/gb3Zqo/Ti
	UYir4SONGxAeUpfUPSgqRgAvbU9UxzwZHToiUeaMO7TBty0jashbuZ13Edm1H3LVal1fOBW4+rs
	=
X-Google-Smtp-Source: AGHT+IHGIovmY0HBMd3qPEpE1WSAoYDl2VVnZW8IbRRGVnXTEcHmNZ4NsqBy07EyTWw253YDWfK0dQ==
X-Received: by 2002:a17:90b:4f81:b0:311:c1ec:7d05 with SMTP id 98e67ed59e1d1-313f1d86e3bmr9926332a91.35.1750028702425;
        Sun, 15 Jun 2025 16:05:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de7826fsm48724365ad.120.2025.06.15.16.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 16:05:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 15 Jun 2025 16:05:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: amc6821: Add cooling levels
Message-ID: <754e5529-8dea-4e67-a35e-1debe02ffac2@roeck-us.net>
References: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
 <20250613-b4-amc6821-cooling-device-support-v4-1-a8fc063c55de@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613-b4-amc6821-cooling-device-support-v4-1-a8fc063c55de@toradex.com>

On Fri, Jun 13, 2025 at 10:42:38AM -0300, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> The fan can be used as a cooling device, add a description of the
> `cooling-levels` property and restrict the maximum value to 255, which
> is the highest PWM duty cycle supported by the AMC6821 fan controller.
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
