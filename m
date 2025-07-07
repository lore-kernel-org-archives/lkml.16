Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1351E3DF2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882066; cv=none; b=hSSPS+u/CrN/dDaEL1GLrF9WXQWXku3R0SNuVRCIexhLoo2w05DNQmwnkmja7PyY4Jgiq7cpNFpfkJSs/EjCsrJPkIh0iR6HchXGUbgmL+ZMwYNAnPq0PQkI3C//HDDuPSLwxkk3r8t4pWkYNUQrkyzGYF8AYPd+slnQdhkSNw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882066; c=relaxed/simple;
	bh=PMctWqdSUwyJh+vgKsEE3Z5HNCwNGQH1LRJi+dlS/aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBXRW+Y6IcuMFy7Xg51KB32Ge32DKaKU0J4KTfuSy0NZ+jHY+OwbCQmlYSa/sSP5EE82ATh5gmlIUaRbtzImp/Jr6PNVj93GflLLPqAnEJFfJ2Cqv0dv3qECs3RVjtYWyEKTt0nuc0H4ZYANrV9q+zMtbjp5CWAn3Daz7PWOO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AfUibJVB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AfUibJVB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso25001515e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751882063; x=1752486863; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=;
        b=AfUibJVBFIalQoFvAY+0wZdvcNMIJ6yijMzrnKhoO7uWtfTm4X+aIo8mzrUXN0dtnZ
         FPZxweitmEr7ZOUxnFEcu6Z/eK0ycSs8/MrluOjNRp3l8Bn+WzfRPwFotVIAonMpkdIb
         MrcJ8dLcv15/p9VsYjLoSup24sdxKFMPkw1NMPHtMxYXSJswRuWnNer8LHcyrijdHEcl
         ha6qCgJ0xHkuClyib65oy0SOQjg5rFySXfQyimPsvS/PWxvZMpsXIr8ZxBY+oZ5YAWEn
         paFUyhr8cqKTdTQOYHf45onAIfnGbtq+zfdCcz3yxRPI4oh0zDBlSy9z+Vo82v+7wU4i
         CU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882063; x=1752486863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=;
        b=f0uC6qK4dDc20UBWN5puJkbrQyQJEWCdTdWdhrRQ4GzxY6TPtJ04rBm5SxEixBHTry
         uDzVt5ZgbCumdeyvaKkKTxKc+b0buxi2JnIgfJVWIqMr+rMgjH0z5679mi7jcx82Wgy5
         na+KNC/QuSqpwpMrcn9qJHZo3lYen7ggzRqUZ67w8iZJDGOzML8vbKMf9742gFhEc8aw
         A4TQkG7O+iTmKMljApyDjjKX8yVJvl3N9SsuSUJ2N07kU8w6CWfMeg5tMuJVlU0gusVR
         X9xYEp8w2nAFatHc8KIYmUp+nNr3kvwzAQLBQbcI9zXVGMwTgwf9Zo0cNprubCIHkAL+
         Owww==
X-Forwarded-Encrypted: i=1; AJvYcCV3IcqU7pgNQXtIJpx4TlqrWg2yu9eubaBIVCRvyoSgHhajhFx66GiY5gyg4tIOJNKRIQoJg65OGiTkg1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXbdFU2Li2HrjnCGCbLDxELef/kKd3VNnfzVgAapwcxXOLYyoZ
	FEhk7qoeZEA/whYR2Cwl/5tMxzjPCIhRIK3L511PT3+ekQ2b2peKE/mj7gy2FKA/Gyo=
X-Gm-Gg: ASbGncvLQixHcAP1w3EKlN+jlm7QspFlmbx1fovwa04M+Qq83vPqlKHTm0+jDdfdOfT
	FeZdTLq/jQY3WbD2eMIydGRIT3oW9lqEMaxmLLDG71PqzCeJvSR7FX4YLE8z24m0c/g1gncZ9L4
	xJbj5hz/D/cewSC20557iMeuALmW3HPh81Ek8ZxZK7b3i37db25M6ooDMT1Etcqom1xmh7k6euG
	bcTxavj7kxxl66OEsS/Ye2a8oi3fZYP8QUHcqlMYthsnDte3lVUTRARFZje8cl9SNJ3ic0bcJi5
	59WIq0AQQrYv4c4vOrEeCwpdT0lqSF+8bZ2XG70xXiP+Ak6Ko13KUrt/m/kcUM2TgE5QtzErgKf
	ajRHTyD5PfH+sP+bdo1jNKjnv
X-Google-Smtp-Source: AGHT+IGNA0zQonP2czf5X1Jge+pwADtgl7Io7cV8JOwQeqN86Oye2fUbW6LvrQW+jILiqb5VBqE7Pg==
X-Received: by 2002:a05:600c:45cf:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-454b4eb7f3bmr96048435e9.25.1751882062707;
        Mon, 07 Jul 2025 02:54:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a1705ed5sm89436555e9.2.2025.07.07.02.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:54:22 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:54:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wctrl@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sean Wang <sean.wang@mediatek.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 03/11] dt-bindings: timer: mediatek: add MT6572
Message-ID: <aGuZTIP3vo9q7MMV@mai.linaro.org>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
 <20250702-mt6572-v4-3-bde75b7ed445@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702-mt6572-v4-3-bde75b7ed445@proton.me>

On Wed, Jul 02, 2025 at 01:50:40PM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for timer on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
