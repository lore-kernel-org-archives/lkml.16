Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D7251796;
	Mon, 12 May 2025 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068110; cv=none; b=dAEniNYU4Fy8ubjiclwmmsSWCEIDMiTHhSzdHdodeRGU7774YiwG0lIw23pYhScmQmobQR+z7K7Gs+w1E8I24KB+0oAbUNs8a4ZXJHUTMHV+ZP4sW/As8M1oNgT3yQnAkt9myoNYky1sccwAlIh3yigZoAvBxoBMg35GmW4O0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068110; c=relaxed/simple;
	bh=MVEKVvU8wln4WeikOwg5MCVLzaoZkDBaYedxbUKGv2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4LsFh4+MEJdOcX1qNhtH0mXQsyFzdiM0NdiMfBMZJ6kseTSH9T5MzGTWk6SlXs2T+pDIJU/ksAIHj6jQqxTBQ0H5kUwTFjdhZAScBqGU58wOpULk0K+1J29eQ6V2EyLf0UK28Wq3UCTJVl5VBNB4hkKWZMrng5B5m+ZnHW3hDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glk/wsK3; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glk/wsK3"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30df7c98462so801952a91.3;
        Mon, 12 May 2025 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747068109; x=1747672909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ho1+sWUxrZunIm7xVJaVhyOUyUjDCcQuzmWPi/TOO0=;
        b=glk/wsK3g19atcpFI7ZCtnwnMAyNt+LBON5UAw/yv07BwZTOTmVXuGXP+w2UovKjBr
         nK4BdznG+Fh7xiVVYEqA7G9WoTHQ44yR64D7SFNiljhekr3yN/Q57prGbOIvHnFHzysa
         aXi0lTsMuw1KAmXoNzFYqwJsaAQbRmQiS/C8m71EPJLkkWYRd/4biPfVjGHetkEQIsY6
         N7VzpqD5v+mS5ucQy2uGl9cdWdm15gswT0Hkk50+cn8+LVvK4Sv86ag6WXumr+qAfbRe
         mFx9GobtvBpDbqC4fYpYy0HeKY1t8iy4QLZ8+wVp1ZLwGBeUfmpVV9beEesOYikVkBpV
         MGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068109; x=1747672909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ho1+sWUxrZunIm7xVJaVhyOUyUjDCcQuzmWPi/TOO0=;
        b=wBPudUaslna9hAQ9N+BxsVIFceWK39O5zVCDVrDcRBC6232yWF4RzwKY/O+qPjYvJu
         6/MYdefHF4xB4i7IqIxa1ksOAyU/zI9Hs7xuQ8uEmM9ybN1op+4Si7VDao7CnJp7FAOW
         UGTzof5kAzJA/aQ2BtcsGtxggOM6FjPwSlyN8neIw9x5V6g4BG7G+IJOuNDB2tEmMIb7
         iXBa22SbQQqQ74aUxmLKtZHMRXF+HLvgFzbH7lHtdlO8Lq2Oicw3XbFnRMtDo5XZ2D6v
         vimPUDrPAMrKWDrLCvBAXeOgHPAhHR5ny6TuVjwO0QfBmnzetvIRoXt59VBMeAKzmaKL
         rkMw==
X-Forwarded-Encrypted: i=1; AJvYcCVPXmzVxoI4nugNwVf9QRWzcVfWLdo0y7CCe8YxDv3h1asd4JLiNRVOazjOVT/blfqdOvvRvH+3w7Rd@vger.kernel.org, AJvYcCX4danvgFiA/x548bJsOK/YVxgT7TjqQiEfXPNhYMMSIDhA3betbfSThpB6An9worR4k8OqFC0BKhYD/Adh@vger.kernel.org, AJvYcCXuucBgsB16viOymyS/oP/QH/6jIfFlGwXODW3pc7avryXsw0sZFKKaDcYjOa1Mb85A28dI6l/H0Pq/@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKtRkW4mjXzbZMBrXkKAfAJ8A0n5JhFrJBJ1f9YOQDKn6Oji8
	Gnrbn2OFeY+LhEpl2YrwJT8c5d1yjTF3k3ajWOc0UkJEr5EOMNkV
X-Gm-Gg: ASbGncuqHwFhzcGSpmYBwlmAsiTUY45/+K8awpl5vgCOr2Hjzhcn1KsxlVyjewpeBpK
	ESLsd0NsCjs0t/MudJEReqBWaFx7VM8XDUT0Teji88Zmi6SI8tehzurw+I+aS0zU5AhFTWbqd+J
	gxm7NYJ5Fymz74SoJfGRNnKFD/qy7/tpKXJjYagnguzht830dZLLxsnH604K7fhJYz7PIiPn4Vc
	dZRJud0kalb55zkN+PR2iZHwJXLRIJpF+XKoWvY6r4d8pp0pSAexYVN/MM+fVlyZQnjvpAfAkC6
	iAPFy1LGWf6EtNp1TsttX7G+Lbm0b/TfzPIYH9pBdxX/KgTuhpj7p6ed3ZHZoIBJ
X-Google-Smtp-Source: AGHT+IGyV6kzMmUJlWY64hon5equcz8iXxorRqUeTgzorRXqzNsma+/QO8tm6yVrzqDARqUHdHc4FQ==
X-Received: by 2002:a17:90b:3fc7:b0:2fe:955d:cdb1 with SMTP id 98e67ed59e1d1-30c3d629f6amr18579099a91.23.1747068108694;
        Mon, 12 May 2025 09:41:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad483f438sm9028830a91.10.2025.05.12.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:41:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:41:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pawel Dembicki <paweldembicki@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Fabio Estevam <festevam@gmail.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Michal Simek <michal.simek@amd.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: hwmon: Add bindings for mpq8785
 driver
Message-ID: <5327a94c-1080-49c0-a442-90ee92b2426b@roeck-us.net>
References: <20250511035701.2607947-1-paweldembicki@gmail.com>
 <20250511035701.2607947-2-paweldembicki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511035701.2607947-2-paweldembicki@gmail.com>

On Sun, May 11, 2025 at 05:55:44AM +0200, Pawel Dembicki wrote:
> Add device tree bindings for Monolithic Power Systems MPQ8785, MPM82504
> and MPM3695 PMBus-compliant voltage regulators.
> 
> These bindings also documents the optional
> "mps,vout-fb-divider-ratio-permille" property.
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter
