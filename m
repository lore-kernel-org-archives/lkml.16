Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAE71F5437;
	Tue, 13 May 2025 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130812; cv=none; b=AFS7YIIULteGWV07X6bimYPW7e4+kzuDfoPqk3Cm0fGhvDXMAGFsl9Olc5F8Ehu+18CN14KvltZnWBOIrnF5V20Lg83YkZw1RiHHRZcM3wukPsEjKCQ6VmEXyYxwF84txfKCzwVVhrjbDBbHP64v0QsA48nbqfFs05vQ02WNJ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130812; c=relaxed/simple;
	bh=0vUeglwLr0sRnKHkXv9liSGcGW3532fdMSYsXVgQ9pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uy04KTCMGIzTTPnB8hJRkI+Jd5acIRWmxb1x6+/4IvWZ1xKvcomtoMTnbixokVK3Q5md2xy3wTS2mf7wFL1W7SmdBxHTtxmLwcQSZ9ZmFl+epxtOPbEMZWAPDnYHJD+9hVwfJc3Dr4y1O4o2NDzuFsftAj3XON+CHNGTXU2Nfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=guzNHVLD; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="guzNHVLD"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5e39d1db2so353966185a.3;
        Tue, 13 May 2025 03:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747130810; x=1747735610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=esbxdNvjy4b/7wpZaEF1nYSaUdVOz5XoWiu+PSih66c=;
        b=guzNHVLDBwCRgrI6XNijuth1wxzrfQow0kD+OWyxLBvWUAcfdpEmKLKo70eWTw04vv
         gBKY1yIXgvizlK/l7GFgG9XI9lekN22oBp6MOYjgRNF/CbzI64rJHmAuQLSaOpCG321y
         26drgodXKX5nqQcRE5y5QXz0PGqHC46E3ZUztUB4INuVUG+BU5nmXdVqMMq8fMhpL0ZG
         vd8lQu6VZJdcxQDbqzSc4YdhjzsRoFv+kTQgmbwmL0dIYGM+lv8TAzaSu2nbp85ZLaf1
         T+fyftIc4fpit+Nl1n4Unok3ifMbLwLaE+71qiAlSfZrbqflNkQbQWICqpx0u5KhQvEF
         OsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130810; x=1747735610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esbxdNvjy4b/7wpZaEF1nYSaUdVOz5XoWiu+PSih66c=;
        b=MN8YUBt/DtgefWWcQUPoVGK1rTnX5ZET4Ar6vCgWDEXrzyE3TOgsptlxAdgu+n6JkI
         U1hQWztAY8jPA5N/CohUTk3Jt0QSubm35kmLhLrvVvh661nfsU64v8go5AkfW068eFqS
         BlBAD/aMPFmry7JhUlAQ12q0HzKYEZbHRNUEsT9hR1Ybr9qlgWI3VDh35z9Tvrt5yWnW
         MFam9Fnswb5/2qjp5pZxcMn+dwVKT0UkZqHSgD/uBFJmvnZx9KEkRFawtW5IJcCbGMct
         lJBNturPK+7l/MTpwWpd98fizwQahDO3HXNIpf7Oxe2IxUPB/Lc9DY+Ctn5fLgaM0OKy
         MqeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsoHyFWhqjuDoiVK2jTCMyyT8KdqYVDGksh0FeXcT4I6rndXeg6sxCTseNs+4RR0jtzNNm809KwjmuPEHV@vger.kernel.org, AJvYcCWcnm+uVxL9VTZxE0KkPhIfwbzgKBlnhEaKePFBBiG3iQetUoS9CCIktph4+qdzqOarMfkitgUxjzTE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt144VGZw+jTxnguQj0D/es2ZCvLe+tQfx8qhpLOWxce3mpgUO
	OrYKqKGVg0WUSYMkYBaZ+23WxH6jXMAY801O14cw9dzDbSk9eJaaqaQPCg==
X-Gm-Gg: ASbGncsT1kEa9esYw7qbMwPqQf4hmvOOKglQi6TT3j3/4BeKBUJw9Vv/bqONQ4UyO2/
	YPHAxBx2PWCIuCzn7TcB+QUxNAMYyQM/hMmezX1OChvJpsX2KB1vMWO0QfZppwaNcDql3nT5htT
	3MpMEyYYAbfsAEf7MdpeGstNw6t1lH5cBViQmZIYxj2lSYhIKYvMBDlaJ9ru+JipEbuO59hctXJ
	il+iAhQjeAclvhTQxKHdaftXo0b37foPfNjLaXR0DPsN4D1Ijc1xfO0Qu4gQsVzZDGxba5gv3tP
	+HVH/AtkJ9/+HCxOUyGs5CWO2cU=
X-Google-Smtp-Source: AGHT+IHDCPxylkGBs5YFIF69NQPWPn69nrjCxDe9tRWkw+WoCwAjvrZ/m3yavqIX7i0p+MInqxI/eQ==
X-Received: by 2002:a05:620a:248e:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7cd010d0fbemr2232965685a.12.1747130809769;
        Tue, 13 May 2025 03:06:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00fdc5ebsm691892785a.79.2025.05.13.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:06:49 -0700 (PDT)
Date: Tue, 13 May 2025 18:06:17 +0800
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
Message-ID: <23yyxygtz72mbeebvzjdl2k3us5rjssgeg5k4wb4jvwrlj6bju@s6jxjwf5p6tx>
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

Yeah, it prints SG2042_EVB_V2_0.
