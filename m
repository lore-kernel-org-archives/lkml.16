Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535892882CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297585; cv=none; b=CBHZ4iq29IIIyNodl0w/A0SLc5giz+yBMl+FiNnsqKsZuZgGvUPZ+1B7QHj8P6STyscZHxJlnoldEygGEqrf9pKqu5rR1O4Lry1ho2uFH/ZObbaNZs6e+jdOzqhCs7nS4UAwhyTRhBwZDVZiuNdbCk5lwCVRTKMBVbl706JAH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297585; c=relaxed/simple;
	bh=ENrOJDgWFvKCQkM8U1+sfaS07Ost8oWCJy/AbU25QJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlB4CugFgfTMjIoQ8+kgwLrytKhHF9cMcDDFNwhofWK8L6ji5tqyyIUu3+fjLYixnG4VZoxN/C1hkN1KwhPIC3rp5E+Zz2zhilL7mmBMRPfoVy+fo2PgTDaDJ0iGyrbAftJePyjU88sBNxiDMMdIjBCdElBuhTQRKwwEP8+tQEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjHSl30S; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjHSl30S"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0bd7f4cd5so522152f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297581; x=1747902381; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RZBT0B9JbAjbmvz5JEz72qClxMGhTZUJxqqtB//hBoY=;
        b=QjHSl30SYhCVFpoIxhyhJPZyyu0pOpqpO5E8fbLKd+dqDZoGNhRYYWkBxas2KiqJNk
         CcAQPxHusSLK9ehjxvxaIc7Dep8dBtKS5tYzvmEaswgZEtWFQFVp0hxVnD2AfC3iVWWq
         Oqg0fdp2zJu0BwnVHhUdHtwAM7fYNW2HpWcnjaIVRo57NmotAzUfGfozTdoAUugQbzLo
         0k++IioYPsa/VaMldshrKyM5SJPpROq0rHozLU05A4ut86G+Faa0vFwXWgu02JJAaDR+
         IKs5WkOBIjbnmhT4Whx5hVyg12uB+Utsh9tH6ss7Bm3Ut9mfZbGu/3Q8RDg4A3Ckv5+p
         H3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297581; x=1747902381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZBT0B9JbAjbmvz5JEz72qClxMGhTZUJxqqtB//hBoY=;
        b=aoGmZ0A9274sU5F+g9TNjiCQfl91ugXosvt4T4cKmT/8GzzzOtudNzpGxjHT2HQWVo
         7uMCzpK9ycT+afWSpIfMvjOzhsbUd2UpQYz9yjtYUzk88hj62rzssNU3JbDM/FtkVRX1
         J2zZAYXq6NM74vOOHKl8iO5CeO/NYCMXqj9AMyDz+j739JNSPAizJC2McdLVAgwJ4u1Z
         O2DHItsOOLoiGkesdxQbHvjOYGcEXqfITWfXAMm+VH26iHOJRHGYpXypD7JgDeeYmGJQ
         fLolvFT/ZeRwPn2WOG7POqbvifUo7Cp0P+XxMhwWme4hwO3wiTmAsUae1vhzNHe9DkQE
         At3A==
X-Forwarded-Encrypted: i=1; AJvYcCUuvniXMMQSpqOsmRjt2qMJisBYYJc65TCkYkG7raS11wC4TSvi47F/yPZbDWViqJfe2lMY1evGXcHHmtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6X+3tt8C4H6Fxj7FGUTf3vdYvhrF6X6Rw1hsrdkuxffMEkJXQ
	sWqtdAiCR3tSrNh8dB/PZknpblNXqq+tNe9IyRLMOJc6BMImy3fer2+d3LGiOHU=
X-Gm-Gg: ASbGncviRXJdxwyNPF0bnkMjXUgFIXihj7sLzu79nSxONBOLZmS6fkR2ZnHanwoxqh1
	t5TWcHn0v+yrJQekO+MHVu5nXAmz7wNzr7uef5EsYa+0hI6ASxkQQHpqNEkzWjA1YJBING0+EJZ
	Z4lvRhH9C8evkK+DmvejmkL5M4xUSuEqPzhA83P/fAThPB/7iiqIrZYIt5N0ODxfP0uzvIC88F2
	YO327O/7ey17xKnet8awHy01gbgsZQYmpZM6Kuyt7iQOxijQ4DD5qluykRC9FttW1lFWytmt8uN
	RngBw++OzairLu8UHQN1k6VZZ/mNsyTdhBQh9KVvDEdn3C7JKTnk7AL8yn1JXbY98BrurFSFIwQ
	o/E+Xnb855fFnr9vrtE0jtPhB
X-Google-Smtp-Source: AGHT+IFutkGNvNOJLwoaYHsnazJI/e2XvuA6DWj8m8uba5Jv172Bohbp+P6ihvUbNwvbTK8YGNfiyw==
X-Received: by 2002:a5d:5983:0:b0:3a1:f6fd:63fc with SMTP id ffacd0b85a97d-3a34994b188mr5793077f8f.47.1747297581580;
        Thu, 15 May 2025 01:26:21 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368d1csm62594915e9.8.2025.05.15.01.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:26:21 -0700 (PDT)
Date: Thu, 15 May 2025 10:26:19 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert snps,archs-gfrc to DT schema
Message-ID: <aCWlK8H7PtSwhY77@mai.linaro.org>
References: <20250506022309.2588605-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022309.2588605-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:23:08PM -0500, Rob Herring wrote:
> Convert the Synopsys ARC HS 64-bit Timer binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
