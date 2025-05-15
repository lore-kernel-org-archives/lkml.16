Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD1283FF7
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297486; cv=none; b=mgeVeGRhI9P/bUdHKDyCYeqE1loeQs6paeJ/LsydquMiGQiuwd43NDBBqws+6cd1Oo+bykYc9hH1VlRoRx47OAES9lFccKqPHdN0iaawZuMUGl6pYNbKTYoz3+dUztxcqpKXsgj26thPRZNy0qj+Zvmj0DQ7TlZq23iF6fSZg/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297486; c=relaxed/simple;
	bh=KgUR9atHD9EoC+AHKgpYJFQF6nUcaQ47eqj3r7hDCaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwJjBSzka0Knc9QUdiWw7+0ADT8nvHfquC+Zrp0340Mu+Yg4/MrxF7vX8zQ+ulLXHLlHKiNw0sXZjtgwwLPWaufRbEkTe5/fveMP/mmHawwXND4ErFoiIULQJjSUHfp6Qb/uus5FBuQ0+C+cQ8u8rgOLe/6xBd8ZO1F1Nv9Qx+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgxvaevS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgxvaevS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso6500375e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297480; x=1747902280; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9TOXFbxB4gXS6rSRvpDw06Fiq0FaaZGd0rOHK4RajQ=;
        b=lgxvaevSbO8a+jmYMY/f481htzUFwdPfY/iW/Tye5ns16CEPcGwDYbqKq+SpFNHux2
         q2GT414+mhFvqTPUVFLkcLyk3lKT8iKTwSrqwDt/Jry1EgCDxH6vON/ioohL/S0jSl/9
         kcs/sitSYv7hH0nYCu0++ws6eZmnN4O7iMwZu19nBJZtiDK/oUo2XcMluEZy8ED8Tt8C
         HCyVU0DppMjSdlHswT06qeZnuemfkKTpc5ZMCQOx6psVH35KHm98MylRhV+2/gfBoW/7
         Nbcqh4gPRvD6IURTc0XP7nhtf2SmpkiIcSwxeip1dDb1RZSFedW5g4LtIRJ2uHIxB8MB
         GvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297480; x=1747902280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9TOXFbxB4gXS6rSRvpDw06Fiq0FaaZGd0rOHK4RajQ=;
        b=PfMDYUzGs4NhxFbVOTEdpfGgi3h9Mx1RSUJXWdC8ToZoCDKQ4XFnubJPyW5HALenIR
         uhAiCRnXu4PeRzJQNEyd3mm1MloJXPFG2sne0JaWatf+PYEP+1v43S3MMtqoeAQaXr2T
         4NlVJdiXVW+0MuNo+xF6K9CMgQNd+CVm6AUc+TTk4Bh29n948D1E56o41/8qvJIS4Qko
         HUyXTFNWWXis4JNlER148+d9sE79hJ03JmVjriC5jG5ckMzj3js52T0cm2Sc3xwghsVb
         dr5zrOuFS1jIALlDxW0RjNfXENq0FiJ8BXvpSxjEGWmqgAh0ItCWEP7gNTLo8CIEPVFE
         bZiw==
X-Forwarded-Encrypted: i=1; AJvYcCVWVkrBGhSxciJGl+gU73y8YpADFQv47bLuchiNWoecVl9Bis+csjg9osdx8xAjiDKWP4gwi45xnzk8+L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw248bPgXuO7QLYvy56I3CShH7sSKwHqvSrfcCPSiv3su1U3N0d
	kAoNa8L4iZDuVoGQ1b9Mz1k5/kaDlKgegAnfKfyD1iFRzcXY7nswY15ai059V00=
X-Gm-Gg: ASbGncsca282vgQsjB21ZECllYBnrfpKB6C2p5Zq83bTCQslO+Zvohlq7v2He9q5JkJ
	psQjeoQn1gblg548+YsKCESxepnmPE1joAg3ldYWK46XgriiCw+FO801Yo3UXsJZf4rmZXElO8K
	54GjBHjchid5Sq6fPxuaOkB3K8QFKZ6QGEcvQr+9EQrz5uJP7dFHwuf5u0CgQNNKXuqS84KewuW
	N1WH7bxODA5XeB9FXaW7wSYQakBAR5bSxKedqTN6mTy7eEHXzB3ihiJHx0zhJe1lEZ6md06qwDk
	NwEDJGtflYEI+vwuySC0CvraVw7cq3DMROlWPeZ2CXHnyYBgzGRCOgXP84rozDqOy6y0P11KjDe
	9T+r7+jeswP+Fcg==
X-Google-Smtp-Source: AGHT+IFtajYBnPkcPBFn3hdS78WYd5S34uRjgYSaYCBwBb2RfYh87GsI2wHpA2J2uqz82C0rmzts+A==
X-Received: by 2002:a05:6000:184d:b0:3a3:5ae4:6e9e with SMTP id ffacd0b85a97d-3a35ae47003mr163747f8f.1.1747297480573;
        Thu, 15 May 2025 01:24:40 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a358316ba7sm627280f8f.51.2025.05.15.01.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:24:40 -0700 (PDT)
Date: Thu, 15 May 2025 10:24:38 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rich Felker <dalias@libc.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert jcore,pit to DT schema
Message-ID: <aCWkxokrJJo5bvLk@mai.linaro.org>
References: <20250506022253.2587999-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022253.2587999-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:52PM -0500, Rob Herring wrote:
> Convert the J-Core PIT Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Since the 'reg' entries are based on number of cores, we can't put
> constraints on it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
