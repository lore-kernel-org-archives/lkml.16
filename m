Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E4A23C505;
	Tue, 13 May 2025 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129796; cv=none; b=jpmdnHFLioCyJ9hdXhDSMLY0WervQd4NF7rRK57IX7IpRI/9ns75scHFVMknlQew7SSfQu/KtOKjIXZCiGnBSydAfxVmT+Pm0DUN/R9glUjootHsFW+Zwx5d2f3lBbW1W6AOUMstrjozfE7cMRTPX71iJpgPEognrMtQJLsbkLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129796; c=relaxed/simple;
	bh=jLEcQdxaBIo0IFx8ScLJlopIP3/VozkL3YtBCJwJK1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhV83BxQndxCPbZodFQjoTjNfsymS3EkX7Au48M1zZFqhwAmgTibfh1RmoP8htAwk79zCujeDjOXmXkaGa8CLRmtWqWV52GxpxMZ17WF9zBsujDESY7KRrcreL9Z65N9CsII2+E8ltMOUY+HSR5BVzgo37WhL5r/DJdz8c9VNNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXBBnLIe; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXBBnLIe"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7311a8bb581so4097130a34.0;
        Tue, 13 May 2025 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747129794; x=1747734594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnZockJ70/T+GtXsZfpPOO2eLVD0AecxOn25kqzU6Z4=;
        b=BXBBnLIeu3BT+pJQ8BjRbHGcvdJciftzQCTr0Y5tENp6L6seRimqG43WEZJafsdOdB
         DmBfwf7sm2cTSFWZHb0M2KoQoeDKQU0BN9SIfrMTCDSTfiEpnwidppgTLot/5ivO+m2v
         ivgkjXoCQcbhLGd7KhxEcaiwrM76634tVpQNNWCI+e4tIR08pwYq9jWu8++Gzw6Yy6ot
         NfJ+NPLsUkf75VPy3uyaaEL3Lj0Snb9JgjJE+zbN1a56zuW4Ir0MAivis8c3fRjCWG2f
         XLe+rxxcuaD6fi3lQ2ly58t/kiL36cKS7X+crVAxXYmzGwanIdhf0W+j/UHMI3bWIJS6
         PtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747129794; x=1747734594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnZockJ70/T+GtXsZfpPOO2eLVD0AecxOn25kqzU6Z4=;
        b=SJTCnDf3aI597rjou0iTjQh+zFEszAzK2h5RGsMM+4JapRhkIsLBrrlG0wlLfkwPgE
         XLI4/fLt69ExvLe0LRIYuOhL8N9Qox72dqiLlCiLuK67hvAGwQlmK8nxsdH16oEhtXrw
         qhtHvlZr/ZfcNQrNNa+9bWOWr/V3m/tRGwW4EJF/OU2mvOsCv5xA7vudTZWoF99PD44+
         I5G77/iys344hk3VoC0cBENcUo6ZyhmqEguV9N3d6XZkZiWFp003eTFvLoOapguctbn3
         /2hQukV09qEgP8PjQAysK30ncBFhny5R+vns3/nSH4GLwApnnvVS2rPWVFiqOswAsAM4
         vqVg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1BoYjzYrY5Ch+OIl7S7CsA/nSXofZiOcPM1xU6fgRJEsIF1AtAaDcjekq4P4Yg1X6PtZTcWbTsgW@vger.kernel.org, AJvYcCWF75bwi5dJ5s5bQVai9x8BFQCIUu9bgRHVjUkoKNZcnCv09+sd9juSnnLN+LYftGDQl9dRYWUMgIKmVKvT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/KrWh+wivelo4U7mHOsDm7J7yv43LMsMRZhtHW6THeK7tbh/
	NuMxTnBN5Ifmrder398gC9HPZ4s1MBix+5frS7hmcIMgMBUEgEmHwJaqfQ==
X-Gm-Gg: ASbGnct1Sh5ifV50Af7GW5DWFuYUPyBbi+JjKkAxLuuVL3PCQHOZCrwk0apAek9bCI4
	RMezu3mKnLild+V8U67ZMXazjNFkbAVBPmCuONfH+fmcYmTY7dcWgUEvC0Ngh+dWq2YVYV2DZmO
	hfXP9YcfaXXFT43hsH0Y1JEjwbMwTKj3npdoZhmE7tNYaqecjLbHTkCW0Vt+Ev7po3vDZml8lEh
	6LR5HI8TiVyjvc6cyIAHkr6SLl0GjEHZuI3IoYFDUnavJd67jHyQuU8qVqV1t2ZqNweUZcGiTym
	QVPVJCd4b34GS3nZod9OhK0D/CV6wdsPnBBt7Q==
X-Google-Smtp-Source: AGHT+IFfVzrPfmR9lhEtNYtojZqrinHsEnhJ2AYCSsKT7gOS5sntpmd7YHRO4LY0VUAQsGIuQN0HTQ==
X-Received: by 2002:a05:620a:5ecc:b0:7cd:145:d652 with SMTP id af79cd13be357-7cd0145d750mr1574381485a.12.1747129782941;
        Tue, 13 May 2025 02:49:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fe6dc4sm691084985a.90.2025.05.13.02.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:49:42 -0700 (PDT)
Date: Tue, 13 May 2025 17:49:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, Chen Wang <unicorn_wang@outlook.com>, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Message-ID: <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>

On Tue, May 13, 2025 at 02:48:44PM +0800, Han Gao wrote:
> I hope it is sg2042-x8evb.
> 
> Sophgo is also making EVB boards for sg2044.
> 
> I think a distinction needs to be made here.
> 

SG2044 evb has a formal name like srd3-10, but I think it should
have a sg2044 prefix. as the name printing on the board has a
sg2042 prefix.

But there is something needed to be checked, like whether the "x8evb"
should be "evb-1.0" and "x4evb" should be "evb-2.0".

Regards,
Inochi
