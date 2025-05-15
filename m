Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB192882CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297541; cv=none; b=QpJa+3vovgH5/dzGaF5Zet8DQU1eLP/Q6q0JPJuqii64oAcHc/3IFXpjjPt1qbjxpiflKHXa2PFgZn82V7sjuwXEhQbwGFvHl/11LbmhkF9FeoW5VC1oJa1zx26eXiqI/A04lGxP0o4dGUFrr3kLc2/J2wVjYHAPJUb5EmTwsuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297541; c=relaxed/simple;
	bh=Nx5jA7joJaHbpCJjfgtjQeT80k36GKxDHRooJk/kFCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvLDvPyfduVt5UQ9zJ0EveJYNtuBkJpl53pQ5Ff5/ps6pWzE83vqvwMt8ADgFlbD21czS8C/OuplAOKqjHOgfbO5Fh6XUACkQZ/R2IMyK60hkFBe+XbfgQOWv459QGMZDEh+U9QQf/IVGjR4LyPA6ZCc9ja+4bywkUq1S/U4XUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOACREMM; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOACREMM"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0ba0b6b76so515740f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297538; x=1747902338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsT+Sdgc+srvU/zsdzeRuZ9jSEXeUmhw8phNeOl/X7M=;
        b=qOACREMMqNccDP7tcQwjPJsNL1i9jO4Gak2vJkAxvufj/BJkus+xJ0wtm6GeLb7M+4
         8mB97ci3nmL8fc3ELUiEktZhUuOx4I3Mt/Sa7RooCDEzc/1rzmNyNR6vHXzwy/IUxrWP
         Dtg741tsw/5d3hTFbcT2b3PlpHG5hvB3HHCiLLqBjHy0Z7cUCkxHVkdmcgqmpLUQVFnA
         S9e5ZXb8GUxgLRoQywKiHgawBrNw5jnskVgokuYkGrRFjzf1ftcIfvG/g65WL7jWoY0Y
         vILANlyeldMIvNykLuEZAE10UWOIftoFZX8UUqJz6Agf4M5yQeP4OvC41YDO/NwzsmCi
         HZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297538; x=1747902338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsT+Sdgc+srvU/zsdzeRuZ9jSEXeUmhw8phNeOl/X7M=;
        b=Mz/K+mlmYAtdgUhFOWyJxxaS8NMfO7iVnvcRT4ROQb3haWSPxJvZgPJl3D+Jakfd3g
         X0pBJtJwWKLsDVjQ28yOh+Zr/bwAEayi+ZrewG/H9XR8ADLYOAmIOmaEM6BJjNXmAC0Q
         wvYDafYO+aMsCpozwThOvcUC325/CJ04/7Mj/uoVDM23n9mrvm6AEap3xI5xrtewd7TE
         RbnMy4geBV0VVNUgG5xTWhH3cCNbpDQLgiJw05VjVWEenJsUkggGNFvty4CghoWBuweM
         TmsGj3kzodUSjmXsnLCDhA4nYiANwzpgIrXQ4Gk3mXSsHdUkXBr6B8w7EK+cM/1fc5+3
         byew==
X-Forwarded-Encrypted: i=1; AJvYcCXAUlg82TWcxSPXM908Cs8r5iWxco+bxP6PHYU671xVAy6Tr/Qmtb6JtvC6iFYT1P7uRefPsLiFGDDCnPU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+u/lVBHct8Nmgc+PVjxV3JEzG++4tezkaRFzSnr68HvnfJuGw
	J4r8XCeZ9Fg983H0S9Z0lqYbSXa6ZDz4ts7rxdbHfw1bWkfMME/K9ED9+6FPb6Y=
X-Gm-Gg: ASbGncsB30i6WCjTYSB8ROzKV1lBYsF25evyfQCEG61wZmDZZgYF0ztDoNnK6c0rzOq
	3y0MT731GlawB+9jgeHYcDsQVRy2ax4K7WRG5tFW/BdIRiOcZF84uh9t5EzBs96Eg+bzZaYGcyC
	BW15mMQFXYdy3T/a8ohCCXhLIncbEq2GtiozcrY7yp2CzIWDJ8dutC92F2GUDmyIx22pGaVpFWj
	AU6BFZUwmVe0o+TTmtC15oSxhBKBp7C3EFyFG28plDXYkl05G7YE/UwNAVSBBQfm49Ob8495yDi
	59CB++x+zs2xgblVsBMnLiJQkS4/fMDC37g1IPVuzU0Ig+0Ugf9nIyCXT+eWJaVsioKIoUEHpQl
	3XHdAkckps2+ssg==
X-Google-Smtp-Source: AGHT+IGDaTo8YPwK9HQTdOuAbuWUdVrlxxJDVndzECFMiRaZAip7OLiyP3sIju4DxLUnjDDhc8accA==
X-Received: by 2002:a5d:588a:0:b0:3a1:fc1c:f1cb with SMTP id ffacd0b85a97d-3a3537a0a64mr1403793f8f.39.1747297537817;
        Thu, 15 May 2025 01:25:37 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f337db0dsm59095325e9.13.2025.05.15.01.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:25:37 -0700 (PDT)
Date: Thu, 15 May 2025 10:25:35 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Tang <dt.tangr@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert lsi,zevio-timer to DT schema
Message-ID: <aCWk_7cMy6Mkg6vq@mai.linaro.org>
References: <20250506022257.2588136-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022257.2588136-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:56PM -0500, Rob Herring wrote:
> Convert the TI NSPIRE Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
