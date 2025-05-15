Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3D1E3DF2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298123; cv=none; b=qeQLwelBSTI2znndFL9le9D5+VQ7he/FiFKv6aJ2RQaqL4ZwFpKXYpCGqer1F3J0n7ru79XGfh98oyPxU3t44I72QuTGxaPZRFwvpy3FXsIDZCj/cvzxAt3VeflMFZERpb7C1TUWl0vJ41wEory5/VyU0HhsM3U6WTage3+reGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298123; c=relaxed/simple;
	bh=9pbatmL7aL/vj8ZUFAV6MU/4LtyoSBW0BcKNN8jXnCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxNIBMl1JQnPa7OlfzlnNLSlYMcOa7JsQcUUpON353E2Nq9eeneKzn7vJzxsO4RoPBljw5Kqnd4NQfaLfk/p7iIjuUr3MmhJrspu0RmfskvGKd9ZwRzDROHfWJ3+oOa2zVIUCkW1da6SeyRc9vdKppLZ1afIJ4XM1RlVODF8fFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pyMAA+tf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pyMAA+tf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso6984695e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747298120; x=1747902920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=06fYRQosONYXgKhGU9k/rO3oNTjga5PPDQkysxE6Iro=;
        b=pyMAA+tf4Jfw/LMBzsN2hYO2y0UsNgxojDpw3cX2zyLNmBfDxe2HgHsRwE7iQDpo7c
         D66gx9GD3wIJgUhwR0so5EaQtNqVPo31cWLBRFzesrpKDQHqcEyDVttBATAkpuDPtEF1
         gO6cct/M44rOGONA9JKESjBEWzZyFRHNaKls7eKHaLjcPElGvsReCGQy+4OAj/V4K+Hb
         zd74JE6GhVc3Pz0xBjFQG9Y4x221kwo2dxkEZIE28v7GgteWvIdSf3wZrlLhHHnCqHU6
         CzRbrjQmpnWDlP7RQhSxJS45NqbwV9KQVn9jqNq6BBKtmj9JPkPXXq/gzQ1Kg01ORVKs
         awTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298120; x=1747902920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=06fYRQosONYXgKhGU9k/rO3oNTjga5PPDQkysxE6Iro=;
        b=BD8sQGlASYyt4gUEpEeuozDZ/mcj8lT3yn6nY7msbqxg7kYQFew+US/+xlO2qpxbud
         4fmqHF3KM7NDCxex0rW/qaLcpZOoeY+cb4f31DvQPsc8wz3MnqPnsNPU+6z5KB26H6ZB
         ph5j5YJ9vkQcmAeSrB5zPi5P+/71SP8cod6CgjSQ6k6gGFCX55MiaTKf3NkvzUUNc5Rl
         WwFXb0I+4qDbX4VHoG2Dp1dHjDW+UZ9ZBcijfMNkK68S5GTLLhE+YEqXK5ZwWfV4qux1
         Pz708htEjV0Mzu8bYHXrMwQBCd8VWCirj7PRYrLqmjgGy02fq/n/tvM1cPwzNi372WqL
         JoAA==
X-Forwarded-Encrypted: i=1; AJvYcCU2lW+5yiKzczRK+vTo8CUKRMiCg3J0CcO6Yvv/2ecA6oW6+5eOgnZYnJVJAe+/NThYFTuelubR2xfq/qo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8dv6Bae/1kADEYdX+KLaDu2EXxuRL1T1XCsqBSxgILBdEIrBZ
	1u84Pa/KBBBo56IW0T2DRKEqE3V+bD6Pux4D56UZMpcQ9/V0ggc5qdOiTVXCppo=
X-Gm-Gg: ASbGncvZD8xsEl9VNRvZxliFW6+V/3YRtc1bjG8Sy8mQA7yfGIm6xPYD8uvTUhNSD1q
	SvQHYcNz4/JF0vcBSo4yrL0+fAsm/7cCIgtAu6Tu3q3jHVjvC9E601Pg1i3TB3D/MYVLLB5AQhY
	9TxL7fjWB3GElpOZn/62sZWRLSr64C6zwG4jrMahQndb69Duow8lzuIaGVV9JpYA/ItOMGi26g1
	Na3Lqdsg5yKhXl/1SguKL7SyDGgzfr55DUL1HYJkMoBJ7qndcuOAA1bAYV+k2DiRisdocaq+p6h
	XjtONtruAnGvyUD9M8aEkm3WR3elAFHGDtBDsajNT4vHK390jOQiQq9cQWFxdEP/JW95y0y1UCM
	DU1K2IvTLFKJQeg==
X-Google-Smtp-Source: AGHT+IHu2s9sa92qmesl5veI+oAS03nFjtQ47vH11ArCbrSF0HDjcyh6IGTJen7CR8wkKp03sRpn5g==
X-Received: by 2002:a05:600c:c0f:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-442f2179271mr73566765e9.30.1747298120445;
        Thu, 15 May 2025 01:35:20 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf0esm22131999f8f.79.2025.05.15.01.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:35:20 -0700 (PDT)
Date: Thu, 15 May 2025 10:35:18 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to
 DT schema
Message-ID: <aCWnRtoXHfDKqOSP@mai.linaro.org>
References: <20250506022301.2588282-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022301.2588282-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:00PM -0500, Rob Herring wrote:
> Convert the Marvell Armada 37x/380/XP Timer binding to DT schema format.
> Update the compatible entries to match what is in use.
> "marvell,armada-380-timer" in particular was missing.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
