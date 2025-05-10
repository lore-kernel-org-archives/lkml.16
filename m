Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3E1E0E1A
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 06:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858063; cv=none; b=kQd6XkWCKSZ4QmRveIfnh0SO4QaRx96aUWtb9LIjRAGxun0pUJSakRMsC/gb5tfzxdVX1eL9OjPpIr7Wm1TY/DzNxJOixfqRCKzoFUPp+A16iTAEJXahNNkTDSERPLff3yHuYRqVyAZ65X1VNLZKXjREME87vCXONTRYNqgagLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858063; c=relaxed/simple;
	bh=G7abpqL8RvpRlWD+zvtJLyi96mYVrRAzZ2niGWVpHIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8+HDlmeTzZjp4plpZLfSq3chr7DB20FLAWOqJG1V9z+HgxkRb4TCK4hVTBAPFpGHXiUg22c1m0A1Lmydbby9gLbxOjs+iF6GMPqu6cGD6ZL+aFZJ9vsK0+zWzsQu/b2m9ecHcuWGzr1Dy1yPSXGiw2lYx8yXInF2NjV4D1j0F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJjYFr+J; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJjYFr+J"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a108684f90so1554740f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 23:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746858060; x=1747462860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I+RgFtK+DYsqfK+/OY/0o6c1VEud7Ds1bft4JaN/wS0=;
        b=yJjYFr+JTBeCBhcKr6FzN7C0L7dYoN8kPjjIK0h0QN5CaOrTKz2WiYSrNBwZ+j436Y
         WyO5EaRp1Bbo56BzpHbXpatq0zQ3phK+okEqK8hn/XBrBQlNs90e/QBWHRWvQelYGk0D
         4qJS3ZSABFr4wWffyC9XxYn9irgB/ZNRZXsu64caXAScJpSJMzGSgO6/BFQ2Teuvk3SK
         a2Nx6WnlHOYrzL/7a+3sEKf4ORHhr5VZtET61AXL3I5Lb8PJhsXByCgOiM2v/YDm4C2D
         WvwrO3EISOXVpUQa+s5M9REKVfjAh1WmCSoA6IZX2KDFx+Kc10ScWHC/2sKpS8f8Ao7c
         Cvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746858060; x=1747462860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+RgFtK+DYsqfK+/OY/0o6c1VEud7Ds1bft4JaN/wS0=;
        b=jMSKm5c3IBPmMmpIpnmdKqrurEjr+5NYqWeMhZQ9wvImCoKEhvbQEVk7+zLvnGh+oA
         uiPLSTbGxK0OOOsA8K0dtqUVX1lF1GmIjmBlSZMB7S9ryBl/QBl/FBsDWHs+uVxjPxuU
         0wVszxkaIQCEpFKrI7VIpVCMgvRqTkg4foNg+tUoS3eQ16yz4X+I60rUL6w8yl04tVMv
         MOYKbXgjjazTmTC0bGMH1hcNhZE5NRWMSS5hJ7jtO6ELxlC9OAwLTu+2CboEwSNKK9A2
         RZVz4C/woMl+e/mCBDEYVLQrPHb+r5uiMQqZ587OeeB+ITAaW7CMbC7c0soPRZnvo3sG
         pLIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEwKJRdf5wVuCUNC2Vg/g41NtqNYys3sosU9VERz5it4cMOoelfs8maSffV8GLRwui04xj6LD5Q7F5X90=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeB4YI6MNuJ1TXR8fxJzklxSP28fEjhQOTsgSBXAdvnF6ezN0V
	SrYiq6GJeI81eyGCjip658mbDMdfmHPiAGYHiqf8HwyUDY6GxXk5eCvsxekMHw==
X-Gm-Gg: ASbGncvJka3bbkROGnfUQsfa/zuaDVJojz1RNHcur0V65BJVVnXheZrWnHQKeh+HnWx
	APwebuFAvo7jkukA1uuEf7NGMshajqzO8/58vE+CybEDmZlCGTfXtbnIy+GP9od0yK7y6rGAm/9
	dJmFmqvx1YjzKiMPLEmE+j6brWFj4/n5N/AWdUjhDgSnQdbHrv8DxV3+zmiUbfP0vhEUSscKVhY
	AySMnK5EAk4eFHdVPONsArpQohsTRM+vrfsWdxJvhnAwtCnZvIGxpU2B6UVQcoQPru6mfr7U29y
	y9Gd8/A48LhosQ3lr+rtDaloDgUXRt/lgXiXoiMzdTpj3jqZhpAyc57GqmpEk8SdEFjpJOyGOIs
	o63GpDr/wqr9DtzNzALmi3qffp/scNZ23ww==
X-Google-Smtp-Source: AGHT+IG6eqkQasSCxgXWl2HJjaQcUoIhzrtFbVjbO5iMI91GFHnIhLWlBtSGS6/Nh1kUl6LsJ3qWIQ==
X-Received: by 2002:a05:6000:2ab:b0:38f:2678:d790 with SMTP id ffacd0b85a97d-3a1f643eaf6mr5487308f8f.33.1746858060057;
        Fri, 09 May 2025 23:21:00 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfc9sm5377930f8f.5.2025.05.09.23.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 23:20:59 -0700 (PDT)
Date: Sat, 10 May 2025 11:50:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/4] PCI: Add debugfs support for exposing PTM context
Message-ID: <fehrphcqvg5nyusktj7qdxnvve2pt3rj7r7sz6p6r5qenpfq4x@r6a6fqmx5zqg>
References: <20250505-pcie-ptm-v4-1-02d26d51400b@linaro.org>
 <20250505183714.GA990024@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505183714.GA990024@bhelgaas>

On Mon, May 05, 2025 at 01:37:14PM -0500, Bjorn Helgaas wrote:
> On Mon, May 05, 2025 at 07:54:39PM +0530, Manivannan Sadhasivam wrote:
> > Precision Time Management (PTM) mechanism defined in PCIe spec r6.0,
> > sec 6.21 allows precise coordination of timing information across multiple
> > components in a PCIe hierarchy with independent local time clocks.
> > 
> > PCI core already supports enabling PTM in the root port and endpoint
> > devices through PTM Extended Capability registers. But the PTM context
> > supported by the PTM capable components such as Root Complex (RC) and
> > Endpoint (EP) controllers were not exposed as of now.
> 
> IIUC, the PCIe spec defines the PTM link protocol in terms of these
> timestamps, but it does not provide any visibility of them to
> software, so any visibility is device-specific.  I think it's worth
> mentioning something to this effect.
> 

Added this info while applying the series, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்
