Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6B1E570A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298098; cv=none; b=IRfkdnC9d89wPgbjvcHzqSsKydjc/d+MXpZTwsadFG7kAX0KSTEdOVBx9mVFKrxlriBzLXavFgBwB92a00gj2cetmJsFUInB/+l1hRzMECNmypWqBwnwpUk/ZnDMF+/3P4zeNqhdWG7U3ab/JtUqMavMpgRKoMBbqGwKifTp7lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298098; c=relaxed/simple;
	bh=yHzpB75qrt6L9V798dzn3nFGVe17ID9Yz9uDWiN5boM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLRvRGXW2OQbUGVETdg++rptQwgQgnxeQsiv0PUryV+p1rmKBa30conSfcuR0AIrWBFNOc+i3Y0x+H3+3HyjXesOIq72KHRF9z0/00aiyZlx/2z6C4v/fIJ4/1h2wO5oVgFQuIYvK1Qfk/S/eAOIftxIX51LGY2OrDFGWF/gqmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIcVLdU7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIcVLdU7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso2221614f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739298094; x=1739902894; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ltM+a2uxSbqNoll57t/hl+Ny/dwW4fSjhIoNqgR74iw=;
        b=tIcVLdU7FyNx7JJwMtMB2sVdwIH3hPTSeIrA2vXoux4AEZx4LJ9jDMRPMHIax2dWhB
         D120pHi71LGWs9iMtCAWuseBi7iE8s7FaFaoxiwxlXXr5cNgCJs8HIJ+ThDHDHnH+up5
         bLbthEwW+FMcXbFA+7y5RCpnm604YPsLRN8Hcsbs9yT36Y8g2jtNe2YqcOdrASo6ql6T
         RBjYmGR5GmDjfNtsWUxN4vjQeApM0WCJkDZbOqJByp7Jpp1xuMd0EMX+Yh/jpL6poNWz
         evTwbKc0x15XEtNq4WgZ1ZRa2kHMOsfxvLIuX4JmFKyd5Dfx1gNnGZzcIUPNr0+ZP/tx
         g1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739298094; x=1739902894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltM+a2uxSbqNoll57t/hl+Ny/dwW4fSjhIoNqgR74iw=;
        b=nmHbM/mMb36eYLJnX8NdJDj2e28I2DDcAKZgNWDXZR9u/Abq2FqwwGqClBc/+rv0sN
         WR4udY2u2K41NQVaHqIsIzKNHBK5wXBRuu2Mk8X4The+dfiqfBRI5QQjItPmvkEItaSc
         LUUT2uSVJyx/t5xjksrTHhs6Fdz+QKJNayGyZn91UYWyzosDC6iVwR0K5DRXi+555Prc
         R61VEKO5TbDMcxv//VzUnOswsamSWwQg3QY4kRKs57Jt38/d73xdNJyB/at0tnbjlRCj
         b4TiZKThKXzZ5K1aTEkFrmQatlaivMJDOuc8CZ10aoN4wvcGKivDSg2/WaeBWNWgzCND
         l4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBUrwoE0eF5i9L2fZ4z0B6+WSA/bPVviqxR4D4lLEiqYfvHc5cUfxNWLG+TvD1dRPKMT5sozfOleK3T9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhsVQEuPPYyL4cERX7gQtb+cWdiKQNhUdZjBw44Nq6F7nSTwpg
	+HYM6qWJZErXkz6OC1CjCfYNQQwZMVrA+zfsKZya+6uzv1xTPEzLtZOZW/gWmHg=
X-Gm-Gg: ASbGncvv6AgaUu+tIhRmQzb8c0vYiQZ/RyrBGBomU7gharDKtZNW1wgB8WoCkk2DXiR
	Hn0hCh0hndDwtgpNDUe4JoXHL+Kl6HRwk5OeEd4JNWE8MyjNL11Vmx3zSPEv8QnoPiMLyHReBS/
	BLINwt0O7576XLhTRBWwEj08wNXqWiJuTP8pXDI5clbFxt24l7KDqxHM9PdpbQlieidPTEZJpUY
	mFrjj7A33AbwUTsjhfKjIMR7V7rBQ1JoH5zIMDFoeyv0q4dPpEr/g6hw1CPSDTA+JihWKOk+S/V
	7Jxt1XVUAMk7by4iQR7lxksxRw==
X-Google-Smtp-Source: AGHT+IH8s48al3LraqkT+TOIwA1K8sIqTbw55FOvBNGZc+9PMaUyZNyKYXua1A0xWaVLj5G742ETew==
X-Received: by 2002:a5d:47af:0:b0:38d:b051:5a0e with SMTP id ffacd0b85a97d-38dea2ea1d3mr4453f8f.49.1739298093651;
        Tue, 11 Feb 2025 10:21:33 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:70a:7a19:231e:65aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcde66729sm11842301f8f.81.2025.02.11.10.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 10:21:33 -0800 (PST)
Date: Tue, 11 Feb 2025 19:21:25 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
Message-ID: <Z6uVJeQd1DXFFHG1@linaro.org>
References: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org>
 <Z6txevdftVNww0wD@hovoldconsulting.com>
 <CAMRc=McApxN7TKKKAL2OmfkosKYA9gCYZXQZXFAE_A9a5qykmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McApxN7TKKKAL2OmfkosKYA9gCYZXQZXFAE_A9a5qykmw@mail.gmail.com>

On Tue, Feb 11, 2025 at 06:51:02PM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 11, 2025 at 4:49 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Feb 11, 2025 at 04:01:56PM +0100, Stephan Gerhold wrote:
> > > Add the WiFi/BT nodes for QCP and describe the regulators for the WCN7850
> > > combo chip using the new power sequencing bindings. All voltages are
> > > derived from chained fixed regulators controlled using a single GPIO.
> > >
> > > The same setup also works for CRD (and likely most of the other X1E80100
> > > laptops). However, unlike the QCP they use soldered or removable M.2 cards
> > > supplied by a single 3.3V fixed regulator. The other necessary voltages are
> > > then derived inside the M.2 card. Describing this properly requires
> > > new bindings, so this commit only adds QCP for now.
> > >
> > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > ---
> > > Changes in v2:
> > > - Rebase on qcom for-next, patch 1-2 were applied already
> > > - Mention dummy regulator warning
> > > - Link to v1: https://lore.kernel.org/r/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org
> > > ---
> > > The Linux driver currently warns about a missing regulator supply:
> > >
> > >   pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dummy regulator
> > >
> > > This supply exists on the WCN7850 chip, but nothing is connected there on
> > > the QCP. Discussion is still open how to hide this warning in the driver,
> > > but since the DT is correct and the same setup is already used on SM8550
> > > upstream, this shouldn't block this patch.
> >
> > I thought Bartosz was gonna fix his driver...
> >
> 
> This is not the same issue. The one you're thinking about[1] was fixed
> by commit ad783b9f8e78 ("PCI/pwrctl: Abandon QCom WCN probe on
> pre-pwrseq device-trees").
> 
> This warning comes from the PMU driver, not the PCI pwrctrl one for
> the WLAN module. One solution would be to make this supply optional in
> bindings and use regulator_get_optional for the ones we know may be
> unconnected. Does it sound correct?
> 

The supply is optional already in the bindings. It's not optional in the
driver though, because that one uses the bulk regulator API and that
currently provides no way to mark an individual regulator as optional.

We did discuss this on v1 of this patch. I think you did not get back to
Mark's last message yet [2]. :-)

Thanks,
Stephan

[2]: https://lore.kernel.org/linux-arm-msm/f125c7d5-5f85-4ff6-999b-2098ff3103f9@sirena.org.uk/
