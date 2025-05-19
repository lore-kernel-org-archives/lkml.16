Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9A0288C10
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675842; cv=none; b=RJ//6+ZiNT8sl1FUiTrrcad9v602Lztt+/tbW62oMZM47jOEs3F0QIuJV/5jD+8D5oeuumgmTU5Hn5tAfsd7D2ytk/UAbpz0kFKxVEndLhRR6lkzNGgz/2EzNuo5jj+AOL8mRaRniJsHTC1fgIydwZMowNsHaCDwBSx7v4p7tZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675842; c=relaxed/simple;
	bh=HnTjrWQ5EVdG1cDBVc6cCdSaoPKg8RQzX8LW5sIft8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MehDBUOBmF/qabFd62vSZE+pQpPB7gYdCtHJBfbbD4Rl6VTBMo1+s1SGTGa0fPr1H7/X0Pl1BvSu5vY8XBEgXCXFFgSU7WQxVlEYvQUhHnVN7AGya2EXptJsq3rjsqIBRAnAD6aUd9Y9rrwdx2K/9HEjmVWDYj1wuk7PUI9q24c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=urHAGUCs; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="urHAGUCs"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6020053cbd5so866432a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747675838; x=1748280638; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Kju3FsnY+thKUhdFoN0W1nIETGgDAQsnSzsAx6S2Zw=;
        b=urHAGUCsNYUWBlFSMPdrOFcwSVcGkj+Sj/X6gC305ByVNKNzs9fNgDGNJcLUnXTbhb
         qWbxB0YbGYy+d2U63BLUr8Oe0Zab5fv5Uqre6H379b2f4EwhlVO7agy/N+inXOnwl7kf
         zInImPxzHIOZ1NjNdOBTcYnEgVBFYnSoTPdifcwZgxNVetuR0R0GWLg8/Ai6ZUwxjE/z
         squ5J9qD7yZW2FXEJ2wbpF6ehyFJ8WdsOilDjhXWFXX9m8IAvzDy44Ar6n2BJpdD+zUQ
         Ln4NlDzHCSnHl5Af6LHp97Cy9aMO5Yn6fdEtHj+ftrimLcJKliZJ9wcYC1eViLGSaXxQ
         wPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675838; x=1748280638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kju3FsnY+thKUhdFoN0W1nIETGgDAQsnSzsAx6S2Zw=;
        b=Ay9xHCJI2vhvLyevqK9R9YX+HmRI47COdSGaFWI0CItStQIBAQpH/9lHCoyYyhLLFH
         6EZAp6WdgLUH5qMPE4RQrm3nvDAQi3uXB2UyZjavCJfXloycjiftJJhA+jqkPEA8/gyl
         WQ0DYvKhSCQChYF8u/VZK6i07qfeXzzp3WC2ggCX1jBcmaKTkktfUhWFm9UA7/PpYQrb
         npUj8HwkDd4YrK8n9WDwwbdwMQr8tJq9cdih83rvKhFAf8tijEqLbKxYG547rY5hWSyz
         E2YVFFEtnhRasJIpQhQYCelfe0u7HvZ6EGKlounGoAjMZsEljzw6higvqA/aYcgXda/O
         gM8g==
X-Forwarded-Encrypted: i=1; AJvYcCUR9LjzTXNbZtw4L2JZHy6cUkszRpYtR78T9Ej/ldslmTR+RkxzZD67eLHSso7llECLnpjyYJ1TxgS+uTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxZBbux+tFjtQqgFFIlbw+JrtQ0E3JAtKjfbmeeHiXB84odUi
	YK5f5xC/U8yBeCOoQd7D6LV9dmGnXYgiFfZ368pgILRsRUmbBKOdxWc4X3XpXAaZgQ==
X-Gm-Gg: ASbGncvlDh8LslbcDTVzQhwxNK0/NdiWrfjSN/MEXVq6wjg8ZfJ4/3XVEmkFTS97l0a
	2kCNoxl+C+lXXazUGhNW9No7+vyoDHwnnpgEAw78KrM0N/Lhol7NJzLXgBDG06k1wF6lWEnHgAk
	Nl0ztqFgx5eT3PxAULfjnaIzWdEZz2gll5w57bHNJLCP9X9hhTIVAh/ryhMP1U+4ZkVITiYEEIH
	K9fIrERyO/p1tcQx63/0p5lZBOtARCImnUxbov+0ARm0oESrq5VOc+3HOkeiCAyYPTbbMwakNZE
	7XSrEYXvthr6IsHtiGr2olD7N07p16rrBcvQrO0BlB3r2QV18uvdUHCNlykjlNN0BaeWCajJYZ7
	rEkB+i75J6caoshUyBgyLaRiSUnQ5m4YJ3w==
X-Google-Smtp-Source: AGHT+IFQdXd+uR03JzjdJ/zz2g+tjiE8hNNLW3q4qi5/22Vnca/ILj0cjruXvBC5L68agXPI5CtSjA==
X-Received: by 2002:a17:907:6d01:b0:ad5:58f7:6c8 with SMTP id a640c23a62f3a-ad558f74558mr760304166b.49.1747675838502;
        Mon, 19 May 2025 10:30:38 -0700 (PDT)
Received: from thinkpad (host-87-20-215-169.retail.telecomitalia.it. [87.20.215.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4382c0sm625083466b.90.2025.05.19.10.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:30:37 -0700 (PDT)
Date: Mon, 19 May 2025 18:30:36 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Junhao Xie <bigfoot@classfun.cn>, Kever Yang <kever.yang@rock-chips.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
Message-ID: <y246ietlwyaix7q3wulviy7wysqkwczspgtj26gducxbay4qrl@im3iht4kvhuj>
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
 <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
 <84cc6341-a2c1-4e3c-8c9e-2bc6589c52a6@mailbox.org>
 <ne4injlr4nwvufjdg7uuisxwipqfwd5voohktnbjjvod5om3p3@eriso5cw77ov>
 <CAL_Jsq+GdeKFPVpEOz+588QxkF-Uq=oNF5WJU+TK31Q6mkqaDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+GdeKFPVpEOz+588QxkF-Uq=oNF5WJU+TK31Q6mkqaDA@mail.gmail.com>

On Mon, May 19, 2025 at 10:04:09AM -0500, Rob Herring wrote:
> On Thu, May 15, 2025 at 6:57 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Mon, May 12, 2025 at 10:42:20PM +0200, Marek Vasut wrote:
> > > On 5/9/25 9:37 PM, Manivannan Sadhasivam wrote:
> > > > On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
> > > > > Document 'aux' clock which are used to supply the PCIe bus. This
> > > > > is useful in case of a hardware setup, where the PCIe controller
> > > > > input clock and the PCIe bus clock are supplied from the same
> > > > > clock synthesiser, but from different differential clock outputs:
> > > >
> > > > How different is this clock from the 'reference clock'? I'm not sure what you
> > > > mean by 'PCIe bus clock' here. AFAIK, endpoint only takes the reference clock
> > > > and the binding already has 'ref' clock for that purpose. So I don't understand
> > > > how this new clock is connected to the endpoint device.
> > >
> > > See the ASCII art below , CLK_DIF0 is 'ref' clock that feeds the controller
> > > side, CLK_DIF1 is the bus (or 'aux') clock which feeds the bus (or endpoint)
> > > side. Both clock come from the same clock synthesizer, but from two separate
> > > clock outputs of the synthesizer.
> > >
> >
> > Okay. So separate refclks are suppplied to the host and endpoint here and no,
> > you should not call the other one as 'aux' clock, it is still the refclk. In
> > this case, you should describe the endpoint refclk in the PCIe bridge node:
> >
> >                 pcie@... {
> >                         clock = <refclk_host>;
> >                         ...
> >
> >                         pcie@0 {
> >                                 device_type = "pci";
> >                                 reg = <0x0 0x0 0x0 0x0 0x0>;
> >                                 bus-range = <0x01 0xff>;
> >                                 clock = <refclk_ep>;
> >                                 ...
> >                         };
> >                 };
> >
> >
> > and use the pwrctrl driver PCI_PWRCTRL_SLOT to enable it. Right now, the slot
> > pwrctrl driver is not handling the refclk, but I can submit a patch for that.
> 
> There's another discussion about PCIe clocks here[1]. Seems there's a
> variety of options here with spread-spectrum layered on top.
> 

The other discussion is separate IMO. It just concerns how the endpoint detects
local clock vs supplied clock.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
