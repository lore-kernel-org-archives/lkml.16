Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96117202C43
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146447; cv=none; b=L4/SDn3X5wFF7ICqUwQYGs907DYjwNNO5Ggx6/V8WKLPgX0fyhKFdTiCu02pjDBvI5NTSilY/LrKCkC853rHQaAPkZxLoF1ArIWiIXr4kWb2hbHrT72UnNYok3zIHqGpfcCtDvw+DcdGrkZAlxVD2Y+q4HCgqh8BCIuTedW6qQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146447; c=relaxed/simple;
	bh=lgLLaFw+DGiRpN5vtWLkRsjp7dexj3Ed4DWpipUeNIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPz7XhEK48nnEdjKgKMwmv0TcivViA73JBs0JrAITwH/edJwICbTe+UNfXDhOlOGHjGs3eHGWPA+zuXDn6KwYHnm1+xhx4Hh58Fv6sWPASj0tcbN6Edf5YmjWhhs7dagPJjbOJOA2TZRqOU1hvt3OcX2REkGFu7nekpfjZX4nio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uwaPuZZ0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uwaPuZZ0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so33039115e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146444; x=1747751244; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=viRbW34aeCx4jZ8hMquiEOhZCzi3ewdZnltxTsu27hY=;
        b=uwaPuZZ0pzNj6ljJXOiXQA8VNI16ETkn5jlnyK3YRWZ0E0mABezpXqrIrB2OLUpU6j
         yq+PGkxFUfi3sHRQP3LsJpBZ752Yv7Fl+Yf2jJr9h2FaALlozvybL7vz3sUhisQ4Zzo4
         sHIqQlCvMesRjOmpw8xepgWahcq3bt/f4lj/FwFSZXMqnGrmV+1XJk2k+G08AHmqVfHe
         L9zYifxfSeghKIdtIHJpRbxm252b0TH1ddaJKSTDje8ghw4vfx9efXrO1Nk2TB61W0bB
         zeiX/gX+SHd/dHpgv9gwr6vTSj+RPSoHl+9/vuusgJhq8iP/J5wzvZlGa3mxKxEqOK0F
         +pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146444; x=1747751244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viRbW34aeCx4jZ8hMquiEOhZCzi3ewdZnltxTsu27hY=;
        b=Z5sNeThL4WLPNL2PGJOwk9T3OeL1NlST/r4AaRc0XSWUlrVRfvGkZQztm3pXKEUCoM
         iOPSkxkuw1Ibsucj4ZYj0QVLw7tO6zN6iMnRdx8a1pybetj3fwFjLl5T9lrLbCD/jtHz
         LxJroe7cOMakR9PyeVtcujaEqaBTADU4uWmCg7Y9I3/4apW1cXKN09PHqjkGuinpILZR
         eR1fGfe73S9x9//Xl1C9526XeZCjXhMtK1e8SkynV/fvSZqiA9jsxoC7Yt6DIwAhcAAn
         kNHtXp8dxHCkybWDmb9f+//tNTsLjXkLZXg1KBgy7S6Jl8SI+Nj2CHJGWLTs1kwKaKxH
         +pow==
X-Forwarded-Encrypted: i=1; AJvYcCU0i7F6NDXAaLw+Ug1aZhVbpU79MmXcGOVG70eGausW4I2ZSIsStK5FVWrZ8xS6t7wcknMKh1IYLgM22h0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUWzQJS8WyeFfw7KQrZ+9ZQ40Svza8AgtEQA49b3H9iMy2bEz
	8mg3FGqvo8cCDA+K0ijWRcU62hFh/4Eixll2auDcZfx1XieiY/DXK9d1ggs7+BA=
X-Gm-Gg: ASbGncvV3O/z4nxzsauGAwrxzIV2p5bY3/bytvD0eRReWGI9bj3nfqNU/nAg/7+Tqlz
	Ohq34MkF0OqqVslFxaJ37P2NA89eQ2GIleVjwXi3TpyWDhnqgBO+jALv/ELBo8Yxyc81QiFNohv
	zfBR/od8ehiUCltgMx7fUpqkBRD0L0QIviY6gkzq1LD4aULAt09kUX/FN4RISgMH2t5xxsAwEe7
	FUJGEZVIZSB93nh+LISw1xR6TDIeLtzhxJQAtujF2lpMn0GMfTehdHTEVWs+nlkn8r567ExKmrV
	nvk2rCRi3oVOo3StYVm3APfazs+fLMvVJizMAcC2UplUSKRdSsBqrp2TUeSWQ2Jlae7/nWFyKli
	/104wTuxjPcxEIw==
X-Google-Smtp-Source: AGHT+IHh/hXr3C7uQeuwDkBgmFkciCogzqhIeeyghe0EZPx1ZwEoRcQabNz0405E/QeKtC3MsK4qiw==
X-Received: by 2002:a5d:6305:0:b0:3a1:f67f:1bc with SMTP id ffacd0b85a97d-3a1f67f022emr12630885f8f.0.1747146444005;
        Tue, 13 May 2025 07:27:24 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca47sm16511097f8f.73.2025.05.13.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:27:23 -0700 (PDT)
Date: Tue, 13 May 2025 16:27:21 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,orion-timer to DT
 schema
Message-ID: <aCNWybCBUHQ2FKl8@mai.linaro.org>
References: <20250506022305.2588431-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022305.2588431-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:04PM -0500, Rob Herring wrote:
> Convert the Marvell Orion Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
