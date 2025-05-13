Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1712566F3;
	Tue, 13 May 2025 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130879; cv=none; b=dvwzXTZSuOH5VrkpTbo5gFSxcNYHFE5ke8dO5D81V2s1TBvFfzVMK+GVs7vihLetD3stvx7+AQ541KesTSpzOEOllPsu527OGMQeVT4PWNAd1+ahBjME9fUiiytZfczpkvdeW7QZABGXhb9Yp4P8Wdg7bjSA+baa5BdCe1d6F6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130879; c=relaxed/simple;
	bh=zHHPe2RlT3alVG++pzwYl1p0dat//Yfu/0wYDLnttxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvYQU5veKVAn2Dbq9quWpAHu1xEup20cijF9inToPmPsj8iBN6GsIKCrEk4Ew81fksBYJA40+ArReLi8v4emrX2GTAI5keE+E4wo/s10yziicdQzm+CXvAPlrZgaqEwzguYvIwtb2hNoQrxAOBmy+/90UpD5ErLj2Tn0D8BnIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMyycpyt; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMyycpyt"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4768f90bf36so58757751cf.0;
        Tue, 13 May 2025 03:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747130876; x=1747735676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xxTCWdoxxph2uKRlpdzs8tMyten2c/Vtkg5n7lhhiZs=;
        b=hMyycpytx7XRafWItRyjMfGc8B3xbUh4NaTaUkGCQ9kjeG+AR+cCg1FW+OH1RT5QtD
         rkpGfaXSZwj0pjUnxnDsaJQxlFvUU0NA+le69ZM5nEt5vjzq1xOmr+V3+pm3pfDxSIbj
         B24uhqFIVHnbQqTO2QfQZHSJsGXL72mNVj71TJMEEEe+g8GNnEDadEYyNyF8CgInXpIn
         VseYWYmd9uuk0t65uzxv8O0puB/QNUJR1gaYU71YkkNrwvrAzW//7qoTrd60VDF64Pu8
         dBziTX5mCSf08FunalzXJskc29IG6vxHlRCs3yqC+WRQHM678SG52MpNOKE46s4M4Eii
         RK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130876; x=1747735676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxTCWdoxxph2uKRlpdzs8tMyten2c/Vtkg5n7lhhiZs=;
        b=UoND/t3rumIrCNvMQP4f5QkNm/fj8Zqqeb0aLP84CbMrm25APolZxgjrtYmNBWA/Ud
         iE1HM//b/wK8pGk3/1i19eNDQuEoNc/o8KxSzA+QRT6ZKqvsV2blX+2tExzR4V9c6DE7
         q9SMtG6hbXmZ+4Jae1E/a2AZnNWFZdhzkkfMq4rT5E3DAIdY1J+l29O64MqGw8zDULZb
         FEE29kJU89cGBCce7TroDZbXoa5ggkcp7mgR8DvQaWb0UaWDipIrF3Njvm04CQInvcWX
         ntX/ZeCs3+P+85ck6dxofJsjkOLoRyswo/1HLIYfDbBwRw/glZZwBxFxF8AXs0c5AdNj
         ypvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeg0unAKF4tx9lNFtTUolVkKXHOBB5WoJmJdTaOanwh0zWoWrU6YRyBdgYnqBzr1ypjrgtCdSA8Jr3@vger.kernel.org, AJvYcCXAUc0A6GJzXC+i+7HWuTpuPdRPWLK/r1pm/ProNSmK2UymgG/MN0AXIQvx4fzQ1hBnnkuUsEa3/KxknxnR@vger.kernel.org
X-Gm-Message-State: AOJu0YzHMClzD0+HrJBpIOU+XcQLzQHOK+ZFUtzc4bBC6Wfftv8Rfi8T
	qr4HaFJ6kqjlTlAu7rfGbkuRUGvVGwBTf2ClSuPJ1fgPYdlVjsw6
X-Gm-Gg: ASbGnctQlpw0T7lHrhkteIGA2zd20s5jUUqrU3MUVYHgJPma/1NxgJyrcjyxjmQOYgP
	g/99r1bUMN0s1AeuAPNGdjo765x57lxV6JzlT+BIMoWHZ57ToH8Ju1+lX7w8ov41tRTjdqmraJC
	zv5etI1+s1OW2oDbHmkOLTHVdI3vg1F4THKosKOdO8CHzDfln9acKKBfMWzZDOqGW4OqSMzXfes
	3kyd8KNPzrlj6eZ/U8X8kqbNFx2OYTL580ePpGJ59UgY4bFofeVYiXYahKDUu5ivcmRdcb4vW7I
	GpPvVdycO6y7VNyhSMzTCStnX60=
X-Google-Smtp-Source: AGHT+IH2nYMxmNh6Mi7SbRh4cdJMyyTGclEOl+xdQXn3Xj59qNVfbigfG60vlKhSQo/mjolVBqJhqQ==
X-Received: by 2002:a05:622a:406:b0:476:a969:90c5 with SMTP id d75a77b69052e-49452761774mr194593351cf.24.1747130875543;
        Tue, 13 May 2025 03:07:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4945259f42esm63437641cf.78.2025.05.13.03.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:07:55 -0700 (PDT)
Date: Tue, 13 May 2025 18:07:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: riscv: add Sophgo x8 EVB bindings
Message-ID: <ya3mpue6pndlzkmr6bouyrqldysmsfcu36b6lwrgbnvo2xw5ru@7ugamdke32nh>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <59c175c7bccbd4b5ad241c39b66b0303e0facf81.1746811744.git.rabenda.cn@gmail.com>
 <MA0P287MB22621824B2FD5E2A64006174FE97A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9=ROP47hsugf3BS1nXr9oOPHWgjQoGfjAZiwHnXS19Pw@mail.gmail.com>
 <nrtzltuus47rjds3x54e72mtflvjh4najyqdjnagxq5etge5e7@vkikyxa5zf6k>
 <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2262F586320C31A7F887B5CEFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>

On Tue, May 13, 2025 at 05:59:23PM +0800, Chen Wang wrote:
> 
> On 2025/5/13 17:49, Inochi Amaoto wrote:
> > On Tue, May 13, 2025 at 02:48:44PM +0800, Han Gao wrote:
> > > I hope it is sg2042-x8evb.
> > > 
> > > Sophgo is also making EVB boards for sg2044.
> > > 
> > > I think a distinction needs to be made here.
> > > 
> > SG2044 evb has a formal name like srd3-10, but I think it should
> > have a sg2044 prefix. as the name printing on the board has a
> > sg2042 prefix.
> sg2042 prefix? :)

You are right, I have make a mistake.
