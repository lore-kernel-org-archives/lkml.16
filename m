Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7614F2E11D2;
	Sun, 15 Jun 2025 01:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749951657; cv=none; b=f7e+nwOHDDXvCGZ3w23Tq6HmRnNXxXreB1VXOlz5oF2oNZ3nr/bOy3afD2bptgXiX3lkkSWi34SWZrWsjMlIPqJXHhEBrQe1rKNuUrl78V0n+Vk5o+JXjGKkGI5XGysYHq7sSf0DAw/SA0ya/XBgO1jSiiCkbTXIg6TEy6B7xG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749951657; c=relaxed/simple;
	bh=GMEtceewlD6VKs5/n6rbS64AhkxPBpl2yxdCrLWVOjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEZGZU7Hxho+HOLp108Swi14uKANtLxkHZZvvCYtTu8WJ8EOLBPech1Dm96L05RmxHxwNlaCHrKnIW7Gcz+flrsYpLhkuO6pFNK5qSLO9oA3Rvf7YcHc2P4i1pKGAT98n2P24Mv3KSwSx2N6hKpZ4We16RHTJPXpseCOqX7SwtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUWw9RD7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUWw9RD7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so3991464b3a.0;
        Sat, 14 Jun 2025 18:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749951656; x=1750556456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NBTMddD1EgJ5XqpJb4wGCf6dCboYJMy04qeMI4QwNwY=;
        b=bUWw9RD7xzZ+sPlWfMudfH0f61OA0JM29/h8NR21K2lriyvfZUQUpqfklqOnXNhgqD
         BRUSG/iN2ncDc+74BeIDXL2C5bKQ4Mo1FxZft/slmECshVDqYkuyUdosOohc/IsDTz5J
         IBdyMPO3LWxKE721uO1XVG4YlMZILjdLsL5Z8CveC9tJTriyp1PuLiiWgAGZyLBlOErZ
         TxtAeWmYe0mEIF/HzKzhsdkItNXJd1hcyIb+rfo4Br+Z7V+Wuu4cZUu+WG1NlCaZJBbh
         KNFaRJxE263bkUzdd6hph67daJTXnBvDP6LHntfgbgJsInlzHQlUsi0/q5OIBdjExVb6
         1uQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749951656; x=1750556456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBTMddD1EgJ5XqpJb4wGCf6dCboYJMy04qeMI4QwNwY=;
        b=woq8/Cb5MNx4HYYCysab5dqmIiNr0eW4ZURM4hhGxFGrAUjHYRLoimLkNqmMRmD+lL
         kaKuVX7b2mHVURTR43s/2UDHE/j8pQetkPP4F6Lo1tthSkndNnGBADSBcKCcZEKJWHfn
         vJITUaRFJTeHpeohxSzeo/46Gev/hPHuSELKX5310MqYrhIExAIRYX8mNms7DqwptdG3
         mx15w3XQzb2pO9LA40r9KaK0cCl7U9nmWNMYyrO2JOpc0XJk2sfixh+CGbFT8fxfpfU3
         w4MNuJIK6M5crksaQeGaHaGZZFn64R43Q7V9GYRyUnz3mU1Qpcy5u/y5xKI0fNlXem1z
         +wiA==
X-Forwarded-Encrypted: i=1; AJvYcCWiexEVE0Ms9dUAYtcdEhu3uvMQaNfEta/LdedfFi9+5Wt+Oxr7nYMr3gnZeUgc5ZcrswnWyIrmb5zZ0CoG@vger.kernel.org, AJvYcCXUYZ5oEg51Pyr++/5j2ahkdqlWdkxnexvJmlUnjaD246bPfkTkYK7lAOKOLMnx8orBxAujcnMFRcmr@vger.kernel.org
X-Gm-Message-State: AOJu0YwPIdHV/F5HBVDpNt89VB/VegchC1ST/ucABzOZhUFi+mTWJi0r
	hS6b+jod+B3nMqwaoE2rmvbOeJGcaoxeJ/KgwSps3dLL6K9Dy1xyiHTD
X-Gm-Gg: ASbGnctPF0L5XvbMVsqPMfDjUoTuSORenLcEJSTGSQ5BEX1UUhLEACexBE0R0Ngmjh5
	DyvDtLAAhGp6046NljS9AlMMUUYk5HLvk5fSVYVJOukxLDHK5jc47jioyC8FtPu+iHamKsNFD7N
	HSMuoW4bPh3gtu1A3/pzdC7ekrDlAJJ+R1xg4ggMDuwUfCDiNYX8uGOEU9XgS2gUoUpbj18ye5w
	+xhbo8kjpcRcNctXk2rxdH0zHmmurtK+JRC1uXpFv8rXCW/rsfxQe4bW02x79e93ebyAYdQg3Ai
	9/34bGTWREj5kfgTKXAyri/LTS4U3IudMVpZWzFJAO79tucjVAPakB97TBvRqw==
X-Google-Smtp-Source: AGHT+IFFtgSTT239FlySASeK/tmHjPqITYuVff3RfVuRfyAgy5DMcBJfIvR7fWesb8KRVOi1bJOajw==
X-Received: by 2002:a05:6a21:9ccb:b0:21f:52ed:23cc with SMTP id adf61e73a8af0-21fbc7aab9fmr5594335637.15.1749951655619;
        Sat, 14 Jun 2025 18:40:55 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7488ffeca93sm4005306b3a.20.2025.06.14.18.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 18:40:55 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:39:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <rsem5lx74zhfqmb3adljeesyhqtwf36asacle3jyo5kls4aadt@qmnve7qvctq7>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
 <20250612-siesta-verbalize-6a7768ebc648@spud>
 <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
 <20250613-deflation-aerosol-fed1d566fd0b@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-deflation-aerosol-fed1d566fd0b@spud>

On Fri, Jun 13, 2025 at 03:29:44PM +0100, Conor Dooley wrote:
> On Fri, Jun 13, 2025 at 06:02:27AM +0800, Inochi Amaoto wrote:
> > On Thu, Jun 12, 2025 at 05:07:37PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> > > > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > > > "VBUS_DET" to get the right operation mode. If this pin is not
> > > > connected, it only supports setting the mode manually.
> > > > 
> > > > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > 
> > > I'm having a bit of trouble finding the v3 etc, could you provide a
> > > link?
> > > I think what is here is sane, but I want to make sure that review
> > > comments on previous versions have been addressed. "dfn:" searches for
> > > both driver and binding filenames turned up nothing.
> > > 
> > 
> > The v3 is
> > https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/
> > It is a long time ago when sending these patch.
> 
> Thanks. I think this patch looks okay, but probably worth Rob or
> Krzysztof taking a look, even if you seem to have removed the props that
> were objected to.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your tag. And I will wait to see if there is something to
discuss.

Regards,
Inochi
