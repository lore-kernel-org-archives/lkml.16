Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABA52DCBF7
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748159905; cv=none; b=E1m3dwkU9rUUja5itjiAg7wahGX2n1cDW/pkr6oi4gp5QiKouCe2XwQKSRb7jKDglk3VnU+iUyxi2vCgZIDr+TQS3Qa9ZEEZ05TGaBX/S2j4bwNa6czjvGSFsO1Ci6Bfiss7lx5KApxYNGIktV35Fi4zEitbyuQLnn78O6tXXEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748159905; c=relaxed/simple;
	bh=f3j4XWibVHV4tRvZckwAtdzTdZVe7JCXa8Aund97Tw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okdOQTCZIF57JeZQC1cAI2cwcsChjH2dFzMMkMvMIl4gF8S3v+M/1MheCJQsI7KL94pn2uzDOqS8miSoCIzfeajmyznWf1+e4UDTp/jd1ziTr5UiOdng6YS0lUKpCcIRdme73XmsfTWtJIoRl39cNj95IqvskVyyORq3jsZP6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tCF96fdi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCF96fdi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2341d29c3bcso5041705ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748159903; x=1748764703; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qnO1NuGahzG2mdNmPSvD3Tqb2hXBIfduG76mUpbTku8=;
        b=tCF96fdivfNMrORqpN/d1KfCd5M+1Wyt0W2UZwhmuZPhfiLyGmwiTYJW180TWbcpRq
         Q50uXGTbv+lpcascPGagrdXm/wjaLZOutsMqVpLgdMt6ZHw3WTYdzwJvko2u9lwUFJhW
         DRMIL4IIkd1pbDp4QFtpfvrm7cNiOErdUg8VFs91JYxwOmli/YdgNYZt4uTrYQ5a1ibu
         UBqnYaHYqPjgaZt2cm0WaCqB+tR88WiMIx4JsyHxgO+cFJgS6m7bUQw/oBefk7uUkNO0
         mZxGURpFaSLjWyEgyDv1HwC638hcs8avjTu1k5dfmCI9aKdTF6ewtsgELxIArtnCGqVd
         2pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748159903; x=1748764703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnO1NuGahzG2mdNmPSvD3Tqb2hXBIfduG76mUpbTku8=;
        b=QoHbiI+ujmW4gnqeuUCfs7kqefLZaIut2wIItgDqlm9uTkTgq/QVIo9FQO0ZDIW0+W
         /cThxnuaif8Z8X+Sb90KCHcdXPZSCz1XV+jp4V9pV66UARRuJY2byhmsvyGsPQZeterw
         iULJPG0+MpSH3j0zM11SHolhIcEWS1czoLKBp7FJIRRhjNl7VQxW0Vac7T+h73kiBvQc
         um0NZeZ+nz0potJtu+CWDN+aqbKfrZ+AzlrrRbFQvikq6LYJhefyBpRH6B7e1VXqTaLL
         mz72Ok4ImehGWM9hmt/aOfvjr0RH36PRTSKFVW7H89zAYMYxQ/FcFsg3tWzoJKpGe07O
         coRA==
X-Forwarded-Encrypted: i=1; AJvYcCU8KawY8TCigGB2afhMje9Mh+dWXFn/YdELoXVSMjFXfNvEBg/k0nadv5ckh4ji9PjobWMWafqys248hCk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dPUlRJ+lNXAqKpYTy2Ss0po/+qGCMua8nd1XT9riKRouY9+T
	TSDIZjRk4bXB1FALmRSy0rqAPQNujmRQQiTKsXU3A3O8MMINUZMoeXzs3gSTA+X5qQ==
X-Gm-Gg: ASbGncvU/1IJNq81iaerw3n5wqXuugTagNDHPTzOji9RCP6vYJi6BXtzjBb//WrHF2H
	lsIIdlIaH0Zgxy6TtASbIUDmuyiGNim3ofZ6lw67L3vqgDkWd3uAhtPbnncCz5otZECpq1Nqy5q
	HatpmMK6pKG7agp3igo2MbBvr9VZNZL2QKrbru7/mdAuHmQ95yXU7oN5tHA37vNBFe62KQG5CU6
	Q166QHJaY/luNVbTylbIWyXwgbquL/kWt/IJa9Dm2EsM7QHRpgGowJmn+LkJOsJYBymqniykQ+B
	I1nH66iF3kEJNuuRTfH5nL+0aYX4FEB/4XiNAN/6v1EiXrcj1i3eGY4VQJ7ToGQ=
X-Google-Smtp-Source: AGHT+IEMRT41ZFTlA+yA9dc7yj6AJ8N+9zXv3PwdNNtc5ynVweV7/6bTw2xvTml3M2T3hjsotCoDwA==
X-Received: by 2002:a17:902:d2c1:b0:223:5a6e:b2c with SMTP id d9443c01a7336-23414f57f54mr86739865ad.17.1748159902787;
        Sun, 25 May 2025 00:58:22 -0700 (PDT)
Received: from thinkpad ([120.56.207.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2344797f610sm5331785ad.119.2025.05.25.00.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 00:58:22 -0700 (PDT)
Date: Sun, 25 May 2025 13:28:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cassel@kernel.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH 1/2] PCI: Save and restore root port config space in
 pcibios_reset_secondary_bus()
Message-ID: <qujhzxzysxm6keqcnjx5jvt5ggsoiiogy2kpv4cu5qo4dcfrvm@yonxobo7jrk7>
References: <20250524185304.26698-1-manivannan.sadhasivam@linaro.org>
 <20250524185304.26698-2-manivannan.sadhasivam@linaro.org>
 <aDLFG06J-kXnvckG@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDLFG06J-kXnvckG@wunner.de>

On Sun, May 25, 2025 at 09:22:03AM +0200, Lukas Wunner wrote:
> On Sun, May 25, 2025 at 12:23:03AM +0530, Manivannan Sadhasivam wrote:
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -4985,10 +4985,19 @@ void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
> >  	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> >  	int ret;
> >  
> > -	if (host->reset_slot) {
> > +	if (pci_is_root_bus(dev->bus) && host->reset_slot) {
> > +		/*
> > +		 * Save the config space of the root port before doing the
> > +		 * reset, since the state could be lost. The device state
> > +		 * should've been saved by the caller.
> > +		 */
> > +		pci_save_state(dev);
> >  		ret = host->reset_slot(host, dev);
> 
> Nit:  Capitalize terms as the PCIe Base Spec does, i.e. "Root Port".
> 

Ack.

> "The device state" is ambiguous as the Root Port is a device itself
> and even referred to by the "dev" variable.  I think what you mean
> is "The Endpoint state".
> 

Yes! Will fix them while applying, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
