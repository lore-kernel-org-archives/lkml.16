Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163124BBE3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682418; cv=none; b=ZY9uX4t/av3gtviicGopKtaccXT+XrObviJ7jmvCV/F2lA0pwlEJfh4rDJPDO2M79ToU2IwPqdNbWZJcOC65qeCL9tb/0VQ3dkMWsAlS16YJP7vaGXjnfRx8BDNGk+CLy84qtbETHYsvPbYL3q8+MuwnO5kD6Lqq7ADqtqlt/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682418; c=relaxed/simple;
	bh=6HBSXgVJQpnXZ2wUeUNsTHZDwNlVPaiPU5s4ReCzWvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWTQYPYACz+h2mWnoWc3Wi1GS9yCrz78tPP33UIh849fbPh0awze/NUDKpTY2oETZ6AtCrjR3bUEgtQf5e732ycXHO3qoLqWayQs4fimiyndPEwMrG52dC5ZkIqcDE5ALFByvg1DAQWH2IxJzcf54QS4Dmjl878MR0ze+LZF62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3BxN9DI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3BxN9DI"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe574976so5075185e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743682413; x=1744287213; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YoPotb8pXLLdqy0ZKPd2+Zf9wmiJLFly+WdaF3/DU0A=;
        b=T3BxN9DI8vCE/lo3HmbPZxgCWEpt0CIJcBAFUDQtnWIdLCHjB7Av4J/zvMD/Sd0BiY
         +N+8shWW4OZh/RGUYRO63+Npge2RMf5UZyxzYKNgbs+1T49JNTX8ZkwJjw+V0Cl1IJt4
         1fHVXSTV4CfWZZTK9+yWrXBN7HdmZeGBRmDxEKAMD7I6nDwezCLwlDqSjurHQhP9jh8u
         Qf2pjitckssRtb+QjqKlEGqo1bmeOIjaDvVPiZQwEN4Rr5GiKmeX6nnwUWc7gBWI7PmE
         vQ6ugwtrB5Cs3em864Yje8uKoCfU7Sp3sWG+rkMWNcL5w2Bc4FH7LQEFXGvOKcXfeJJE
         r7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682413; x=1744287213;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoPotb8pXLLdqy0ZKPd2+Zf9wmiJLFly+WdaF3/DU0A=;
        b=W609CoUF8OEvXBR0a829GPVZoFjQYw6iNO2ZykW4AOLopyBmCiDj6BLNFZnkhT1BRJ
         lephprwh66dk+fiLsRsn6f2EAkj+rxOJVwUSGZouGMeHMBy0iE7VOH8hKdtcYN7D59Sh
         uk1NNFs5Mhe+eeF9+O1nSt7uzKH/67bNEBjlBEz9Xn3WQAFF+0hT2ThzJ9Mzx/fwPFlF
         IpI3EHwd14guLL4VjbM5ADpSm+LbETfCHT9YqYIsy/gjQeh051yP3lN6oEsjOMr6aVYy
         LRUGA/oBPKAbsvuCU4QghKwinx+W/hHjRm0YhVOIpNhURpzNyHklGXNRME8jJqxf/ziz
         JaQg==
X-Forwarded-Encrypted: i=1; AJvYcCW9+gwgWSdfugbR6jKSQUHNgev0ZxfeuC+JeoVhrEfpqLvZR6bpxbcLk9BjaLOIPPcY45ykxehTNy9uxsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdcz+mS9ZbJQ6SA5nUQaNgdorqE7yvHw4/cxjXsS1/MwoWJVAb
	1o3fWXzaW/JJ89vA4jqSwgwVC8ZsuRufbB1Im7WIfTe/nfG1e5OjIK8+L08GsVY=
X-Gm-Gg: ASbGnct9yysgGkgyVZaxZrumQ1mHCEt88UhmL2pSqC8V/gC2h6j4Fpb+6KiD1uyfCCU
	0poFIR00Iq0Rj1zaH5b16acqvRCQhzkwzhgm5VUEZUeI/FvO+SwmuaaLPpEu05eQNMDTKPdRSjn
	pXmD8DsosUWrP8UJGEzrSkzbXHUFR0dDVB9QityInVEFc0uXU+/w2lu0OFd9Rre5DnL9ZQ8uF1U
	HKRPj7L/sLKnAl39/3uR3vdAbly8eKkRR27/V3Cr+/eTgI5RwbrWFsYtKr8p2UpzPqHZNqLiO7/
	xLsip3KoPk/IsDLqoZ0mSE0EmYJC2SBtSirvFAXkznw6yivEYg==
X-Google-Smtp-Source: AGHT+IGBvPoR+oe6zc3Bkj+MZpGdnpSz1Fof/p26ip33prZb/K4xDmqMovA0IJ8E/rXDyTM9UmrROw==
X-Received: by 2002:a05:600c:5117:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-43ec42a00b0mr23581235e9.13.1743682413384;
        Thu, 03 Apr 2025 05:13:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec1663060sm20483615e9.14.2025.04.03.05.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:13:32 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:13:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@inria.fr>,
	Erick Karanja <karanja99erick@gmail.com>, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: Modify struct rx_pkt_attrib
 attribute bdecrypted
Message-ID: <Z-57aR3JYrdpHafs@stanley.mountain>
References: <cover.1743613025.git.karanja99erick@gmail.com>
 <00287fa9f40c643b8451a0d2df8e2fb97235ee46.1743613025.git.karanja99erick@gmail.com>
 <2025040215-confusing-sibling-f99f@gregkh>
 <3c235d91-efd6-ddf8-7c9-d8d35c7585@inria.fr>
 <2025040246-series-tusk-bec1@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025040246-series-tusk-bec1@gregkh>

On Wed, Apr 02, 2025 at 09:41:57PM +0100, Greg KH wrote:
> On Wed, Apr 02, 2025 at 10:34:22PM +0200, Julia Lawall wrote:
> > 
> > 
> > On Wed, 2 Apr 2025, Greg KH wrote:
> > 
> > > On Wed, Apr 02, 2025 at 08:16:42PM +0300, Erick Karanja wrote:
> > > > Standardize boolean representation by ensuring consistency,
> > > > replace instances of 1/0 with true/false where boolean logic is implied,
> > > > as some definitions already use true/false.
> > > > This improves code clarity and aligns with the kernel’s bool type usage.
> > > >
> > > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > > ---
> > > >  drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > index a389ba5ecc6f..fd04dbacb50f 100644
> > > > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > > > @@ -1358,7 +1358,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
> > > >  			u8 *mgmt_DATA;
> > > >  			u32 data_len = 0;
> > > >
> > > > -			pattrib->bdecrypted = 0;
> > > > +			pattrib->bdecrypted = false;
> > >
> > > but bdecrypted is a u8, not a boolean type.  So setting it to "false"
> > > does not seem correct here, right?
> > 
> > Is false different than 0?
> 
> Does C guarantee that?  I can never remember.  I don't think it
> guarantees that a 'bool' will only be 8 bits, or am I mistaken there
> too?
> 

These patches are fine.  This does come from the hardware but the
patches don't change the layout of the struct, just the right
hand side of the assignment.

The C standard doesn't specify the size of _Bool.  It just has to
be unsigned and at least one bit large.  The surprising thing about
_Bool type is that it doesn't truncate anything.  So you can do:
"_Bool x = y & BIT(20);" and it works, but if we use unsigned char
then we would have to add a !!.  "unsigned char x = !!(y & BIT(20));"

Btw, true/false are not keywords in C.  They're defined in
include/linux/stddef.h.

The main review here is if there is a typo where we accidentally type
true instead of false.

regards,
dan carpenter

