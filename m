Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52222541B;
	Wed, 30 Apr 2025 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746052971; cv=none; b=A6ogBKVkD4m+9lMXLEeSYRNtZYRT240sZlfeCsiwM/XL4zQqrekuJstEB0A0V+F1bz++o/31PIQpwV0bpCWBgbg6TMzqA3Pvzq68Wmcpx5o3Ydntzpg1KD/LBiZs9mqpewt1XcBU8WcaV+h2EQsxPqXQp3gaE7+JaRwTsWGf7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746052971; c=relaxed/simple;
	bh=vAx5tM3ytfD1+TRnvyxVfibxvfEd8AwTEm5o2BakR6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kOWYSan+OykjC4ra64XjM8hZygRLht2Bu19t9/t9d5Arfx4mMSw4jAayzmT40UG5n0ShcMCjbEhdkkfy1VnuxQIL/nbKG6OFRvBbm7oOTjqe77jmG8nfg/pNRrnGT8w59xsM0SGrhJU8t9rruQAM8C/9EAXQcxv342sIBC1Vl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJOaE/88; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJOaE/88"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4767e969b94so8510541cf.2;
        Wed, 30 Apr 2025 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746052968; x=1746657768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48S3dXdKaci0sGPUxZJCzgj5cjkP8nksM+/jgY0gGYk=;
        b=TJOaE/88QSDMAsBR6l4TQw/4cpm0UvwFH8vyf2DvXayNHlS+oj7MEwJSxF/eHm5WUX
         fJ75e1g91HFiwBwDOU95uSo4juQckRXF6tMi9f/DIjyzKaovfTotagpLQaAhxSvk4fFB
         1xhDWoFU+ym6y+DKC5A1tbqk0tAHzP9J8wjlGv1P9x7HBPUSrK6t/onFGF8unLLuK0Gc
         gZlm9QmyNNlIux4NK7iVleDOWdNDkS9ROAyQBSqBBjR+jL4DbnSdzhHaXZdLEjOXDqDK
         JnpLlZru+Et1inKfgpKr8oivtKV7D58bcA+549rV2DYftVgaQ42TQh1dq4JjMZaYvokB
         dV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746052968; x=1746657768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48S3dXdKaci0sGPUxZJCzgj5cjkP8nksM+/jgY0gGYk=;
        b=XgqiedbS/HqLHDGr8IYO04JDi0JsdTqvRmheJ6bUAu5sbs36LODvuSDzrRqyywCt7W
         +Tns14d6mRA5bIHJykIDB6BSzpPcXawic+3ysMNwxHtLkeJRTVXTqnEYxboutOGSQKPZ
         nHaxB8db/NLyiR6LNxoMFF9Wy9RFQAZBeb4erUbt5tsHf2QqR562SfFvOAQ7JAO5QyVP
         RrH4wJcYPogc96cMeMisBEpL7BAZX3Lq3k2arhiUbIpAhtef9BDQktkGv9WdsZ9kDNgy
         yLhA2VczScQPu61URL6VmnDPLWmdnK9uj39V/oRncOKxaQowPiv6+mqINZQZu8uIl6Kz
         gE0A==
X-Forwarded-Encrypted: i=1; AJvYcCUpj1EeRffeVO42WVJZT6AszC9A5MgZAsGjo2QTv6rsX7Gc13qrpLVjeWVlkdi/DBkhWL5856N4mqnK@vger.kernel.org, AJvYcCW4/TBd59MBkzjfG8iOQBrVwyWvB5TKgBztPFApctmJPNNTDFQgJ881AQ+z8Fwir3ZwtAmcttB4TGWQ@vger.kernel.org, AJvYcCWH3DoB+1H0fD+BR66YPmLEm1gZDbq4yFxqXd+NEhE68tEVcTQXYUiQa4nhzU6AuzFVAC1pVPamQTFELEld@vger.kernel.org
X-Gm-Message-State: AOJu0YzZi/8NQ9zboOnzgMMko8F+ljgEAjcj+BLTesxK7IYUyicioxcM
	vosrRiqTTH6XfjHPRL9kBb5ZLkZcoOvK/pVr74AilTGZq54oc1j4CjXpaUTn
X-Gm-Gg: ASbGncszNgM5+Q1YeXz3ep0GEqGFimEqNQrQb5gpI3B/rYVvxI7Bqtmi3uiH+iFjf5o
	z7BpozwJ+Z+vuyG1l+/euKiqQopFVE75VZFNAtCmkJA1xH+tMSC3eLK7IgkbyPqMAlwAzvnfYCs
	H1PbkmHsUm5sfbcvXnJzTWRWbE7x/ro3+Gs6OBm9NvTMIZ99Ydi5J3x3hBCD3niF3+Fd3TPg6xV
	CAMzzEigl9Yi6bacvfWcvGDabgUBuLBeh3lKGRQETKppgMkkPb0RPi0otE5UEtrUZVAJ/g98TKB
	hvssPrLtoMuNRRnm
X-Google-Smtp-Source: AGHT+IGMVPqZmzGaSrVitA4ALOh6ohgVuCqPO0wiuXVjKCvGxXKUvoU7kotjtbcu86RB8d1T+y/K2A==
X-Received: by 2002:a05:620a:2493:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7cacd79b179mr118413885a.51.1746052968633;
        Wed, 30 Apr 2025 15:42:48 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cacdef210dsm15380785a.102.2025.04.30.15.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:42:48 -0700 (PDT)
Date: Thu, 1 May 2025 06:42:31 +0800
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
Message-ID: <oe26ciwvazn3klvmmw6iyk7yypzrtjzdwui7dw2sf7wslz4wco@kq3hi3ynesfl>
References: <20250430020932.307198-1-inochiama@gmail.com>
 <20250430020932.307198-3-inochiama@gmail.com>
 <20250430-radiance-rebuilt-2caa906d5e6f@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-radiance-rebuilt-2caa906d5e6f@spud>

On Wed, Apr 30, 2025 at 04:33:39PM +0100, Conor Dooley wrote:
> On Wed, Apr 30, 2025 at 10:09:30AM +0800, Inochi Amaoto wrote:
> > Add of device id definition for newly added precise compatible.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/clk/sophgo/clk-cv1800.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
> > index e0c4dc347579..e10221df6385 100644
> > --- a/drivers/clk/sophgo/clk-cv1800.c
> > +++ b/drivers/clk/sophgo/clk-cv1800.c
> > @@ -1519,8 +1519,11 @@ static int cv1800_clk_probe(struct platform_device *pdev)
> >  
> >  static const struct of_device_id cv1800_clk_ids[] = {
> >  	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
> > +	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
> 
> Given the same data is used here, should there not be fallbacks in the
> dt for some of these? For example, 1812 to 1800? 

In default, there maybe not fallback for the whole series, I think.
But it is possible to use cv1800b as 

> Or is that not okay, because 1800 is not a real device id?

Yes, cv1800-clk and cv1810-clk is a old wildcard compatible, not a
real one. As this is not prefered, I want to fix this to have a
meaningful compatible.

Regards,
Inochi
