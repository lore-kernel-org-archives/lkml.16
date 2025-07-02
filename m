Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A328A725;
	Wed,  2 Jul 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466106; cv=none; b=aILAXZqcwPoqtbSLscvhgW/G9O+jOcGt9z5xsXVI5p1iYl3LtC5tBucVExbryyIQMz+Zhq0XrqxshE7Tagi9s3BXybKqLY/HZw72H+DzkRHxT2vfnzhIRK/f8AVhTjvKpdaHjrJe8VKYqEz/v4GErxYcq1W7KI/eigvkql8/cXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466106; c=relaxed/simple;
	bh=tm6aTTQYt2hswi9o2BKu/XAyCfMaW8rDrN8KpJlIVzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CinA5IANzmkIPRuaPJVav8duXbQbf8J8VB/366VdIKJYMt4mClb7sQmhJd7Ywd/YIrxucjUK6IM4GQS8cV/WbJUDggmfTjCjisiVLSZoTb9tDf9WV6exXcNf3q/JuRfUSsbnpiUaS6s9F38YJutESUAYxGpx0b6aZLbnnK9T8mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jfizz3pi; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jfizz3pi"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74af4af04fdso5052444b3a.1;
        Wed, 02 Jul 2025 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751466104; x=1752070904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QoqW7uLmIq5o6ktQqYTPztNvgZ7wz4g3kzg+DnBETgM=;
        b=Jfizz3piMrh5Ln52O0Djh3Hp/UkQarFCCteVALf8VpWm3gIVJGUPUP4B9chSXcvmDI
         LCYvzMqGP2LpsUhnDKrUn3PNLf2F6659+CClWVz2KloRCatG94x21o8NApjiTg74R69E
         RoRnjhT7saUQl1bOHu7dSM9GApaywMyd/T/u9MTNLD26/6woN75rV3RfyRdMUxm3d27P
         Kku/srusDW9Hki39oZpOmPqoPmv9C5FBgxXMkvzubuP2Dl/R18GI8H4qYQULAlHoxvxF
         vQlsflP3tdUx0gIO5Qf8Vw4zbOjuxe/GCA4b9A/9V2V186e9jOqxHxUKEdbD6M5iVJ2a
         c/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466104; x=1752070904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoqW7uLmIq5o6ktQqYTPztNvgZ7wz4g3kzg+DnBETgM=;
        b=nfDR5p0vKAPMu20JFxQ2selzR/orH5QSi+TDmtpJ6/sJIETU9xqCrT0mMEJK/l7oAV
         YgwlDzAOwhtL80okVpGr2qaz+HF7DQ3FClHdFUuIP06vIHKScijCadgWFPlRofUZn2yC
         KPFenYmyGVm1zZVlF3YKTbmMf81hmjlTVnG4BD/h1qYxYGD7ABqgwSKqa0Zh1/zCD+ND
         8hFLsr9vg/0G6orW9WDsq57OFx9V7iRR8b5lyvxPJbRQPUukEMf0V0OydcXM9fQOW3pV
         TbUA2sq4GPyhGA/xu7DD9LjGLnRSM43Lzb89ilFpQ+0MLZSutkjBnzOhfoSuQ0X5in3h
         0/wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa/KH9o/6PTdg+uLff1w9vZ0/z3hDl4hR76c+OvkzWj68xdYBIflRv2woLLY3eGsDgZyeA7i9NDgUi@vger.kernel.org, AJvYcCX44KYti0E2RSbogcuin3175WfiPWaq9O7Cn7T3wmFITguAxsWu1dPBu0RR4k6IObKKc8F5ZKuuVM0glaxR@vger.kernel.org
X-Gm-Message-State: AOJu0YzToJGoPWmgp7Vx0iiN1BCm7hegVXdTssXWrQwIoHXe4P7weEgg
	jy1zEa5RwwJ0vSbHzoiLMKnGI7TQGBeLPCw0nhuGapH/iJ+QoS3UykQF
X-Gm-Gg: ASbGnct0lofRpqc3qI4fb3m/603lrnvFxs2aYMZoRiPl6jf7Mj/k+pbA7yU9BmbWi+G
	nox+qbuR/DVzTO1tI1ZPXu1jie+WSkjRtPGMMbAYGT3IniahqmjBY519PFDuBDYtuYvakMAjqog
	CMtKRk2Wor5qUifXtOkchia9dfq2+qPl27QOOCi7nYKiD4jTy8Npkf9HMTpP+GYz42UgrrsvjHk
	jaAgxI1muk/ZSiBQ+KYBxfmgDtONSSee11TLJFGH/O0QI3XGiLYf2Xw4xANwBbg+Tagcm3j3Pnc
	rUcrHG9cbLn2ILxIa0PK3leNvlhOpEv0bKghM7p3lj55BLf504VSi5zYam8wnXOFPuHDTA==
X-Google-Smtp-Source: AGHT+IEmEnGhey284f0Ong/chQehRAPRbLYx7zppPrcRzIt0TBFHenlyZKlI15FaEUWNu/0352DJ9w==
X-Received: by 2002:a05:6a20:6a04:b0:220:42a0:7f65 with SMTP id adf61e73a8af0-222ed67fb94mr4237330637.17.1751466103842;
        Wed, 02 Jul 2025 07:21:43 -0700 (PDT)
Received: from localhost ([2804:30c:b15:b200:425a:de22:1d7f:2d4b])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af557591asm14803960b3a.99.2025.07.02.07.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:21:42 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:23:43 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jorge Marques <gastmaier@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <aGVA779eeNZ0zWsa@debian-BULLSEYE-live-builder-AMD64>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
 <20250627-steadfast-ferret-of-expertise-5c8ff2@krzk-bin>
 <tl5fckhrivaqfyzwyb2o2a7gykpigwend7z2nduqgbbej3hqbs@vxxtsadhtdmt>
 <41782ded-908b-46ef-8f75-4d2565476b7c@kernel.org>
 <cfi6rzhco2ba6pcbk57l7tblimuks5jnpgaly7nbedbrpyhtma@u46if22kurwk>
 <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <v2ybju75bpjdqxfkell47nlkeyal36ylmnqt2yvpncxnmp2irb@pygx56jsyxkr>

Hello,

On 07/02, Jorge Marques wrote:
> On Fri, Jun 27, 2025 at 06:02:26PM +0200, Jorge Marques wrote:
> > On Fri, Jun 27, 2025 at 04:49:19PM +0200, Krzysztof Kozlowski wrote:
> > > On 27/06/2025 16:38, Jorge Marques wrote:
> > > > On Fri, Jun 27, 2025 at 08:56:55AM +0200, Krzysztof Kozlowski wrote:
> > > >> On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> > > >>> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> > > >>> core that implements the MIPI I3C Basic controller specification.
> > > >>
...
> 
> I went after the reason of the historically -1.00.a suffix and
> discovered that they came into existence due to AMD Xilinx auto
> generation devicetree tool SDTGen
> https://github.com/Xilinx/system-device-tree-xlnx
> that would automatically suffix with the IP version, defaulting to 1.00.a,
> and for a seamless experience, the were copied over to the dt-bindings.
> 
> The adi,axi-pwmgen dt-binding went more creative and suffixed with
> -2.00.a, while never enforcing Vivado to yield the devicetree with such
> value (Major version is asserted in the driver through reg access, the
> current core version is v2.1.1)
> 
> Testing on my side (AMD Xilinx Vivado 2024.2), it seems Vivado now
> defaults to 1.0, so the previous bindings from the other IPs are not
> accurate anymore, either, (axi-pwmgen auto gens
> `compatible = "xlnx,axi-pwm-gen-1.0";` (`xlnx` instead of `adi`, also)).
> 
> For fun, the current Vivado version thinks the devicetree node for the
> i3c master should be as follows:
> 
>   i3c_host_interface: i3c_controller_host_interface@44a00000 {
>           compatible = "xlnx,i3c-controller-host-interface-1.0";
>           reg = <0x44a00000 0x10000>;
>           clocks = <&clkc 15>;
>           clock-names = "s_axi_aclk";
>   };
> 
> Let me know if we can drop the suffix, or replace with something else.
> The current register defined core version is v0.1.0.

I have no say in how dt-bindings should be, but having the IP version number
automatically generated doesn't sound like a sane thing to do IMHO. Maybe try to
standardize with -1.00.a suffix? Though one could also argue about dropping such
suffixes. Since we were told that the convention is to have the file name to
follow the compatible, I would go with 'xlnx,i3c-controller-host-interface'
(without any suffix) so the file name is smaller and clearer IMHO. dt maintainers
might prefer that in a different way.

Best regards,
Marcelo
