Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F1A18DB3A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947189; cv=none; b=bPa20gbKjxk6R2CswIB+k7P1M08nyEeu9YT7vxMOYecdjygVoIJ3kRsh/TxFIqmt7cFAWJCcbdbE7W15987y/0VpoFd9ktYVxlyRSJhdltYVDL7zX1kx4VJ8i8JMXapqGSK+UND1xmyDDbGESQXR2+/nTzcSk9swGqC10iVKdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947189; c=relaxed/simple;
	bh=vaKookLkIMbqbKYg6/kjE6g76pw3+o99rcJ2IrFpCDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUlBLDiy7dDs5hR+WhII2C56ucmEdg9jhCobCRQvuYcnVaPJa6AoO/2+nOD9D90kylmBRyBvHPCH8YK968vu2XKdEDarT66AmgKz8yWAcsAjXu5O5bGPI7VjXmbCntwebiNtakuPGccMyx1HduVjm1SIcDQe0tLpcKWGwEmb5f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jj8dUFDo; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jj8dUFDo"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f2f386cbeso41672575ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738947187; x=1739551987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=07sAhcqH1FxD3dDlL1CQk6YZIcXVY49sZTSbdxtRTNI=;
        b=jj8dUFDo9gi/0ONKCLKZTgeHX8YyVldx7gTBpeTWS0y+XTXWu3MYxP4mijdqJA6kcb
         sQRAC2kwlp0Blrp86Sc3ZXqFp8EjE1/agKUsDYdnI6lUyOqZEqNVILskj/7zBYjodHVM
         1G/hjocVrhWVn/80l+Z/PG1Ye0QB7XOftNh33VqVxcOxmxQcRPAKlvt9UBobARimYpxY
         9JwKNuhddi59z9g9UXPT1u3iWEKTuYlHXhylMNP36YiHjolDosQOkaT3gTgl/UP7dlyT
         hdJbIn5tS6Pn5Lqcv+vUvStE0/glZlSQb9nhl21lqPLHB8jA/UuTcVXdGe9RFQBhJCaZ
         DdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947187; x=1739551987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07sAhcqH1FxD3dDlL1CQk6YZIcXVY49sZTSbdxtRTNI=;
        b=K1YQAYosygsd6y2tDFeuavKCpWiVEco5RBKEzlldGmpBPQgschWTXCg6oci1tJ8bd7
         swqvQbRhFJoIUxQSjinDFBWRTB+mojEbs90Z9iWYw+DMdj0Xd2zMwvihaWoNIyuJMlRp
         ki30BNzHA06v27qvMpy9v6xOqBOiX0uvtU4E0OmRcg/0dbDII+qzOo0n4OIpAGQIKikq
         BTwhtnZdFTW4jvotvRIKLSj9qkfrgMjrA6iXYmSlGlaRNREGJM/W8MSyIkcOCbBtBSZT
         wAFdHPKBNdD9YvFxI849amoS8LgIEuBQ84TDtfIo/tuAYoWTwHDJc4zFu9Eg9HZWOA+g
         rkSg==
X-Forwarded-Encrypted: i=1; AJvYcCUwLSuCjiaJtHpZTw288Rmj8VNQbsxIOz6omuHOhrRbrznqz8od7RbqJqTMrEkkc3AS36rVcYEah6tBaZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnj5DLXWpnb92OGbSEGbcoH7nth5M8zQOehiZYzYJasz7zlT2v
	ZW0FlVU1PCJTKe8CerfooZW2K/cRIG8CDdFQQZD/XXBPRl/0M66iUNnexFH0Vw==
X-Gm-Gg: ASbGncvHYs/XcsEUtqnhXSkQmZ1MC2ZvkUSc6WKVxEpVtzFLZzKsM8TezuVtlDqtyBh
	cZFpSSVhAJu7+9Ob3L15nn3XTRY6T6fXHuhN50r+r7Yd504wMV3w1Mr7Cg77RXcDcwCeAmYBEtp
	1f0egB+T41qJO/4LDdut281Ls0CU2t2TgQm0InmZGKHUr9+4x7wyemRQ5jIsxt1VwZs8Ea0zlfY
	mGxLhzBD5ycf9ZTT4DffALoKYwrdB3SlCGL/aLzvLI1Ftrlnj4Jv/imf4RgbQD8Kt1lrZA1SBmM
	ZIiD3msnWDeHtm916DAOF1H+wQ==
X-Google-Smtp-Source: AGHT+IG5hyI3rT/ohaf6sowh7YAwVBBR7lqLcQSukba3mNR6S4cJBQEjHUOxdtXWVuZ6A+Rd4SRpOw==
X-Received: by 2002:a17:902:e802:b0:219:d28a:ca23 with SMTP id d9443c01a7336-21f4e75e4damr66197745ad.36.1738947187624;
        Fri, 07 Feb 2025 08:53:07 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b5c757sm3577043a91.45.2025.02.07.08.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:53:07 -0800 (PST)
Date: Fri, 7 Feb 2025 22:23:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Message-ID: <20250207165301.eoobrmb6bxxtrv3d@thinkpad>
References: <20250128134514.u7mgxzwxqohzy5oj@thinkpad>
 <20250128161612.GA319610@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128161612.GA319610@bhelgaas>

On Tue, Jan 28, 2025 at 10:16:12AM -0600, Bjorn Helgaas wrote:
> On Tue, Jan 28, 2025 at 07:15:14PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Jan 21, 2025 at 05:11:31PM -0600, Bjorn Helgaas wrote:
> > ...
> 
> > > Let me back up; I don't think we're understanding each other.  This
> > > DT:
> > > 
> > >   pcie@0 {
> > >     bus-range = <0x01 0xff>;
> > > 
> > >     &pcieport0 {
> > >       wifi@0 {
> > > 	reg = <0x10000 0x0 0x0 0x0 0x0>;
> > > 
> > > says that wifi@0 is at 01:00.0, which is only true if the pcie@0
> > > secondary bus number is 01.  The power-up default is 00, so it's
> > > only 01 if either firmware or Linux has programmed it that way.
> > > 
> > > I claim this DT assumes the pcie@0 secondary bus number is
> > > programmed either by firmware or Linux.  This makes me a bit
> > > nervous because AFAIK there's nothing that guarantees Linux would
> > > choose bus 01.
> > 
> > Why do you think so? PCI devices are scanned in a depth-first
> > manner, so the bus number should match the DT order. Like, while
> > scanning the bus under pcie@0, it should use 01 as the secondary bus
> > number as it is going to be the first bus after the root bus. I
> > don't know how linux or any other OS would end up using a different
> > bus number.
> 
> In this case of the first bridge on the root bus, it's very likely
> that the secondary bus will be 01.
> 
> If there are more bridges, it's dangerous to make assumptions about
> their secondary bus numbers because those bus numbers depend on what
> hierarchies have already been enumerated and any additional space
> assigned in anticipation of hotplug.
> 

The enumeration hierarchy should match the DT order. I'm not sure how there can
be a deviation if the firmware enumerates the bridges in order. Or you are
fearing that the firmware *could* do something crazy?

> I don't know of any spec that requires the OS to assign bus numbers in
> a certain way, and it feels kind of subtle if this kind of DT
> description is only reliable for things below the first bridge on a
> root bus.
> 

This is almost similar to how domain numbers are assigned today. For DT based
systems, 'linux,pci-domain' property is parsed to find the domain number if
available. And this domain number is not guaranteed to match the order in which
the RC nodes are defined in DT.

But I guess no one bothered to parse 'bus-range' property for PCI bridges since
it is not bound to change.

- Mani

-- 

