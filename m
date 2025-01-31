Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61586153BC1
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738308050; cv=none; b=qOJ4IXluX7jpPSH170dJ7oCEyAZTM0f55M4+rk1yt1G9zkW1KVicTQZVW10RyQ2h9mOLpTPyIbisoFkMlGSyk/otxiynvxxEz2ZyDZcyYxKUEUzNBrEaSL9yNYP6yNhGuHJDX2BSZRGi9Fk6WWQ1OdIBfouV1ahBoe2g5nmJ4GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738308050; c=relaxed/simple;
	bh=DK9ZTB0l0vB4Aj3VYPcRJlPUlZQrcm5PnsPdhVhcS9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFm2deQ/Gju9k7/S91ZxWxT7v0bQLTPV+za3Js1PSD74TeEL5rvN/9FtZYbNc1W3ozTOtd7Op4O5z+ufBDqtdMoyKOvma0xMQQwG/3vH8/Kp+IlUSJpkFUrs0AgCfZeNrt3OnedgeIl2JlGlUACM7L2Gcr1R4e3DWJ+Xz9277Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=iDZ8hcpw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iDZ8hcpw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so996327f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 23:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738308046; x=1738912846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2lpuXw9XPLRPbvNS5Bw5c4ZfI8/OoJg8oaMTOnKaNs=;
        b=iDZ8hcpwm1ql3/tGJGxjFMIaDIFsAnkKP+RSGoEV2/Fv3bPT/L+7Vr0exkYfCRdIl0
         aUd7UwmlrdZQXcUMRNN6naGiSAoezeIDADPMV1V79C2OA+mmp0Zk37Wo+7cp4U6KVzF/
         hSee3ZglTjm/9p5y5t6iGaZeo+WlOwtQfSZxlMkywQG0jnYaHEz+EBS16ESLjnS0aD7n
         0oaNEn6BG4WXguRVKfSnd+6Ura+yvUEm+1PtNVE9xFsuiJ06T2JMvRvzUR1vQ3KgEGvo
         wowupXlSmLuvvwydcRx0nkxB9yFhcqRteFGzovK7cnwbINBwMdeySRk58oNzm8MDh3pe
         6NJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738308046; x=1738912846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2lpuXw9XPLRPbvNS5Bw5c4ZfI8/OoJg8oaMTOnKaNs=;
        b=KBzjFNPk3UvZvsBsR0qnHTkJZraMOrDVcFBuNNyBc9NHoEDyw85sRTWtiEcnoUt5Mg
         qpBiLLUglfmMSPLVpyRX1NwnoiXeVkvi6kfaaQogip7wD0bvTPmoPipk52Olo5jOvUET
         vS7flG7Gf4Zp4NTMqxfjyVpn4NNTr138rgHCQCKmtQU62KoWv1QIWLu+Co9LHtmFfMOP
         ImaBSv5u8ct++hPWSH0psihdY96sQS1HZSv2UlKjmnH9Gvr29Gz4LCpcTeQgjoUAhPgc
         T+bbSDJdfXI2qjVNN0+W6cDXV7oG5PkmP2v24ZPjuBE8IewAN05sU/p2QQbYRhj9h3D5
         jRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd64RL7FUNnRlbvtt7SUKFn5dP2KRgwCJo4FfQKssg6ojh+8p9WAt5eOAGSP4sdCEhcXoMoa+UYrBLenQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF82NijrrxAdjP2uyscyS1eKCAkqe/TLBY1PzPWe+qGWdDNhRW
	qEctmfDbD6MUoKBXKdmoh7mPW2iY1Z8lqSY03+AAhGjXj8nQmjWy8XqmdVqmE0U=
X-Gm-Gg: ASbGnctz6SgrnMNvqD0Hd1PKJgyKk7z5BNh2riPRM5VbdVHAqHMmo9totwNoMb11T21
	rULjJexrHp9RsuJNsNm6X7yHfHiVbyso6nWqL90yVJ1ey/O+A8AU6y9egjAxKPkpYxVKxmZ/qS3
	OvOMJHYnn2yYjwXHdSt2UitpujMq6uCphfVsX0vlgoW4M17lADFKyb0kxt4YhI9EdT8AWXAN5nN
	gmaOFRXdHtVYYZd2PYGGgEg4H4xx84ePFSU5IDK+7FR9pFFlsoyT8iYOvxpfcXRlDjUKC9Uzm5w
	ghDCqCvpAtG1IClsj9hz19FB1vKmewBJIsP/osBl2Q61
X-Google-Smtp-Source: AGHT+IGRfxjMkTqEhRIMBV+fsGJAYVQ8sx3PjOb7qCx6efCdQQ2O7kVBZoPCP/rCNG4l34JXqbtMJQ==
X-Received: by 2002:a5d:64ec:0:b0:385:df17:2148 with SMTP id ffacd0b85a97d-38c60f657admr1863229f8f.20.1738308046544;
        Thu, 30 Jan 2025 23:20:46 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf40asm3874927f8f.83.2025.01.30.23.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 23:20:46 -0800 (PST)
Date: Fri, 31 Jan 2025 08:20:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christoph =?utf-8?Q?M=C3=BCllner?= <christoph.muellner@vrull.eu>, linux-kernel@vger.kernel.org, 
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <20250131-3286dd5adf8e5ff083bcbda4@orel>
References: <20250129131703.733098-1-arikalo@gmail.com>
 <20250129-museum-slider-3bb634d124de@spud>
 <Z5wEKS9q8-nYPO7h@ghost>
 <20250131-unknotted-yoga-bccacad0c6d3@spud>
 <Z5wgZHnvu9EeE4xq@ghost>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5wgZHnvu9EeE4xq@ghost>

On Thu, Jan 30, 2025 at 04:59:16PM -0800, Charlie Jenkins wrote:
> On Fri, Jan 31, 2025 at 12:43:12AM +0000, Conor Dooley wrote:
> > On Thu, Jan 30, 2025 at 02:58:49PM -0800, Charlie Jenkins wrote:
> > > On Wed, Jan 29, 2025 at 04:19:58PM +0000, Conor Dooley wrote:
...
> > > > Why don't you use the same implementation as the !tools
> > > > copy of the header? (I'm not sure why they're different in the first
> > > > place).
> > > 
> > > It is different because the headers in tools are userspace so it doesn't
> > > make sense to have alternatives.
> > 
> > I assume that's an answer to the first part, and not the bit in
> > brackets since the "first place" difference is about using the .4byte
> > versus having an ifdef/else and you're talking about alternatives.
> > That looks to have been some sort of sync issue or oversight in
> > 6da111574baff, no?
> 
> Yeah it was a response to the first part.
> 
> As for the second part, yes it look it was a syncing issue.
>

I just forgot to update the tools copy at the time of 6da111574baff. We
should first sync it (but with s/RISCV_PAUSE/0x100000f/ to avoid the
need to include insn-def.h) before modifying it with this patch.

Thanks,
drew
