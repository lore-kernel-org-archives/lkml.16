Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63263265CCB;
	Thu,  1 May 2025 22:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746138237; cv=none; b=R3yRodIr3aHsCN/5sD453spLDxwN9MJPZ4Y2g4nG66cFXf1tAtgchsd8v9Gugyy7c7sB+J9kGdDzD0l2P0JuttnPiojMiYxhMXusHkKGreLP/961zk0QC8d/Lk6+bzQrlKaP04b+SCBMZK+oI1jTkheTgZongJFEZX1Z2EdEAk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746138237; c=relaxed/simple;
	bh=AdvIjQi/4aXBUrayVTQs3uaVb4+2LoBxWLRuzajDxIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQluXFNjNtiqNuvDBnqwrX7w3pUM4H6gpygKv281bPYidHZsRWvGMLMOfGqtWGk+FNrIICsseyrvoOjS+CWrvxJFmn8OwQN1XIhmNC2vz3VxSfaak8+qwUUszKX4jtYbdL75+YNGegsIXYOd8UcBQNgrZfMrVWkxns9Uy4QXBto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbVxY5yC; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbVxY5yC"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5aecec8f3so249908985a.1;
        Thu, 01 May 2025 15:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746138234; x=1746743034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALJpzUTq/FKpZ6ZIbBrWjDg3p3NoIlcuclCH+vNu1Do=;
        b=BbVxY5yChRomengW5ik4eK1mTYKt1daNuxmjXtFa5Yiuv4E33l19O4P23X1kQgpcvw
         qkxSDYBbH0yLriYJieCa70cUKz7vLn0+lQbtPGJldJ/BYu40kKjzMguQA/nnzRc12eEr
         pGF0/Sq0Au4ZTucLWzgi7yl241k/XiV2MexsBRlpRt7HbaXDY6Dn1B8kahykGzPuZowM
         195jRofAhNVHimnz0M7DB3b55iUwzotwB3hI5O25laStIkIwWwnlPGC+Ly64SNrmw0J7
         +m4pe2CDGhj+fWJZ+cHdQZO9Zs1Z0UAfol4tqF8/YGPSHMQ1cuZc54Hq+bGAacRpCqso
         s37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746138234; x=1746743034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALJpzUTq/FKpZ6ZIbBrWjDg3p3NoIlcuclCH+vNu1Do=;
        b=R1rOqNPV530mzNd1dZqAiK+m6XlvNzv3qhb/5wfAs5gpqgIS8ZAFanrlV2Lifz5ogP
         dOQEGWgkNNKIy3586iTOayXAx62mtx+qgvF7A0hZ8zgiR085wOjK19l+8AZ5Io45Ypwd
         gaZbJvZb7HDeOp4CD/+YUNCmoKsGmaXLFzQRxNK7Fc1JCNobk+SCN08HmoGXs/4LsGQr
         kbzd6D4f1UeyTY5qhKBP1PyIE6o32KpCenza4BGP3WiVE9PSXLqkMsuz1FhjQUh+3lzV
         kSdlza67wCfYtg+KtjJNJA1hxVpyIfOkmGhxjt1F+dPGWWkOkncDi9pFlnbFwZNF1j1R
         k4bA==
X-Forwarded-Encrypted: i=1; AJvYcCUyjEHuesNc5EkeMQ3KVLC44XhaUB3aEdYKM3X9Y4cl8TxgabN1RHuCLmpgN65k8+X3SqvZFISqxqqLUA3O@vger.kernel.org, AJvYcCX0HtVFukeFBYYBfmMzPrzyJy36MD8HzB8kkZabMAa32WxeyD2aJC54J0aN6eMNqSixshR1umyj7Omr@vger.kernel.org, AJvYcCXRPLYkOi0IIryM5L5iXuz7b+mXQAHBVFrQSbsWLADnTFO74P03nxlztBWTn4HCpJlGDKsMSDnzqfMo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/0w8d26PqlKmiV+fSLsZivR8py+miiRzOkfadzmea+7C+s55s
	vEvAdI+kmBVNVOoKAfHOf8lrJ1LyTf2lsDTnBdp+dkj3NHL5Ubxu
X-Gm-Gg: ASbGncvChqJT54LZgtgOFly9sH0Urr26N3zwBt/BlKlCEaDxHu4ulL36DHi46KYZG8Q
	aqbH8CcqKtEeu6dYL9mgj2Ql6D4+wRkacrbVfXUWUqWPK4ijYNED4tG2i3ODd1x9cgc7WHjlQFP
	NzyhGUmBcEUXdNzwU7Jdxx3iCQsUOu+F539oJo/ba6uxNaudokE8ngutVIujHobkVvPKRkA0KDB
	W6/CrxV7bi8+hnjUy/76/jlDisK53K2hI4d6AokMBBwngPf5UMKr4QYRXuZmsMgIK1kX3bt2eXP
	JUs/yI9iYmGjYHKG
X-Google-Smtp-Source: AGHT+IHSSsKyi9FGAPd9UU71QhjqJiaS5ihLbJsB2KEjxOY2dmC2E2E/lDqi0usoLmyGcynJlgTLAw==
X-Received: by 2002:a05:620a:460d:b0:7c5:4adb:781b with SMTP id af79cd13be357-7cad5b2392bmr136857685a.7.1746138234183;
        Thu, 01 May 2025 15:23:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad23c3ed3sm100036785a.44.2025.05.01.15.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 15:23:53 -0700 (PDT)
Date: Fri, 2 May 2025 06:23:35 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] clk: sophgo: Add support for newly added precise
 compatible
Message-ID: <ocbvvu7hmeh372dfvyokwy5saa3l3atjfxwd7i5prif57r3wan@mizv37xwg3k5>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
 <20250430-snort-raider-dbf10d14993f@spud>
 <otuaro3xh2ut3kurcomrq5j3guyyj7uhhwgngqdqqrrcpvlk6t@4wqbxy3m3tq7>
 <20250501-shrubs-unmixable-a2a8a9bedd01@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-shrubs-unmixable-a2a8a9bedd01@spud>

On Thu, May 01, 2025 at 03:22:17PM +0100, Conor Dooley wrote:
> On Thu, May 01, 2025 at 06:43:07AM +0800, Inochi Amaoto wrote:
> > On Wed, Apr 30, 2025 at 04:37:01PM +0100, Conor Dooley wrote:
> > > On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> > > > On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > > > > Add of device id definition for newly added precise compatible.
> > > > > 
> > > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > > > ---
> > > > >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > > > > index e0c4dc347579..e10221df6385 100644
> > > > > --- a/drivers/clk/sophgo/clk-cv1800.c
> > > > > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > > > > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> > > > >  
> > > > >  static const struct of_device_id cv1800_clk_ids[] = {
> > > > >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > > > > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> > > > 
> > > > Given the same data is used here, should there not be fallbacks in the
> > > > dt for some of these? For example, 1812 to 1800? Or is that not okay,
> > > > because 1800 is not a real device id?
> > > > 
> > > > >  	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
> > > > > +	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1800_desc },
> > > > >  	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
> > > > > +	{ .compatible = "sophgo,sg2002-clk", .data = &sg2000_desc },
> > > 
> > > Actually, this one is a better example. sg2000 is not marked deprecated.
> > > sg2002 uses the same match data. Why is no fallback to sg2000 used for
> > > the sg2002 case?
> > 
> > Yeah, It is a good idea. I will take it, thanks,
> 
> Can you point out the difference in the dt-binding patch when you do,
> between the sg2000 being a real device and the others not?

I will, thanks for the reminder.

Regards,
Inochi
