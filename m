Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35DE3D3B3;
	Fri, 25 Apr 2025 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588722; cv=none; b=Aqw6heKmY9DO2K5byaGSLybBvVj9Tt8lxwhNL4tPqj4RjQ8bLMqICfTAB9Xc6wLDHXIL9CNyMgxNZVA0td958fsY4fmtYSMJf7w7lerTIpeNcUVtVSWzalwrEtLWGNgAESZkrB4JcF9JNvrITG/ClaxlX034VYPe/jmiFq2+rx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588722; c=relaxed/simple;
	bh=s+wGkxQdQOZAumMeKgpW5m+jjq14RmoCE/zy+aB2ZDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqyd3P7zo3h+Cppmj6A78KRZYqQRer/Oc35+I8UofZ5w+tbr6rFAIwxdFKrVFORcXK1zlZwL0aJEGG8kpF0KP42PSFZUpwYMGATo2e74DiBcVwnh1150u5HXYhz/5TRBOXtAZ8IL1CcJbH0eiVd6oThh99eidM9hR7F+rWd3bKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSIz1yXv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSIz1yXv"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso495865866b.0;
        Fri, 25 Apr 2025 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588719; x=1746193519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElIjdAp6Y4lmYtJ6XWCfaS1fwcVpaJWdZTEkWJEeiVM=;
        b=DSIz1yXvDrL+FtMDhXl0D5/cslCieb4QdAdY3AguRhNHWNhsBsHziBMuatMjpIeAkv
         AMgOv+eA04IQUokHTxIR/EusQRSrw++DYYJ6/d1GrZSlw68G333469sYDABDeU58GlIW
         Bn5bldsZG2VDnKaPSAbzxgIW7XeobXfDeUdETp7aljgJUq6ZWPi18ktDUmRRoYN6+50d
         82q+oaL1dAd6+mvNAX8T02WXHkD6O5MwXhNXGF1yIHsZL91AVAvJi76mPvq1pctvPJfq
         5QL3/ZItF7mPi42k/jx1LShgrU4XT7FUb0r65H8AxVnRc8mbArMeVCVSHTWnqQmuIrzg
         /Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588719; x=1746193519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElIjdAp6Y4lmYtJ6XWCfaS1fwcVpaJWdZTEkWJEeiVM=;
        b=aqT4gIXU3qrLhJgrWADmiynCPiMeUq2cFwutL5u6/FliyAtKYdHkrB9cu5lOdY5206
         dGGwq3Gu0vayH2ZXxI6NjoYF2KVqnGvqG6BwfkbiMXAoz0N7FCfH0rLDK3cBJffu5rY0
         EdUWDEkIlLSOmXtsLAZxs9tAWJLmKxN4MSSNYM4zNPl8+c8ZSB5IsnHnYi38Z1ZRCgVL
         st18jZ9hlvSwGwJkrhIaf0bhImfX1on3cATiUebbYNuB+tqpdjmdyYShol5Ef3mGWSjb
         DzBxCudQyBwRNyDOUWRV1CDMa8iLrHoCv+/hJiHxH1LNhcUE1vbN3bRHuVtM0Cugs5dM
         uFtA==
X-Forwarded-Encrypted: i=1; AJvYcCUULwJxKEs55EMfLrT6Kmy9YUox/2HNc30Dyze9eS3UeU4fTAT5a0l3Bb/nE0iomQ0fqjdGUDwTUnij@vger.kernel.org, AJvYcCWYbQOqBR3laXbovY1ZgP/jD6gQqF0042bPpoCZtV1EzVzDFXSzUQJ8PewWVjUDuSOn9PVcbhjaCcZ8QR/T@vger.kernel.org
X-Gm-Message-State: AOJu0YyCrXTvIFGcjiVn9ZoDQYYJu6zlL+2qLTFK0eYV+fgEYDswEJKa
	apYaiGzLZjK4BUr053A0NNXx8xXYvR/cAckO5MbczFTKYcKpPRj3
X-Gm-Gg: ASbGncsopJHuKSdsEyiMEbRLPl5Kd9lJ2FZyOEc/aepLx1NMl72qutQ0I69B2CD1W4D
	ls1cmAMcT6JGtUKjcIEzx6AeCq1u6I0jx3nPjZziDZ15pTIFBhQN8dm9xusXhOhmcSq4xz96W8T
	e3sivCGi598pgp4dkn7FChoDgPHXAvB7Bb8U1kR2UJunRcRSBH5qr0blwcBG/nkCPGmMG2HdnE2
	qM9FRlwq/zzHGwjWej9Z3IW35Kh5IsVn4U6y4gqFnrEgKo7hGvpf2Qtmk6PnpnY5ns3AirIFeNu
	P9VzGb4R8HSKV4ZE7jSbBOzhWQVkjMm5lGXjbBQeb5UfgYljGXMVURI=
X-Google-Smtp-Source: AGHT+IGNWxosw6tYKct4NcUyBZgI0Q/yEcMUb40Dma2Svsw8igWh4KZ3iIt+8W119rSVYItTMA9Veg==
X-Received: by 2002:a17:906:4795:b0:acb:6746:8754 with SMTP id a640c23a62f3a-ace7111ef01mr227275466b.27.1745588719048;
        Fri, 25 Apr 2025 06:45:19 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace6e41cb08sm143849366b.19.2025.04.25.06.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:45:18 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:44:25 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8qm: add ethernet aliases
Message-ID: <aAuRuVq92b1G0T7H@graute-macos>
References: <20250422100239.58799-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422100239.58799-1-francesco@dolcini.it>

On 22/04/25, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add ethernet aliases, they are used by the firmware to set the MAC
> address and by systemd to rename network interfaces to predictable
> interface names, e.g. end0 and end1.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
