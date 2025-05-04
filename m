Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2931A9B3D
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375403; cv=none; b=hE/WUZz6gSlz/cPtSakGacmeN0n4Lv1NFp0M81F6ZXaT2PEUcoOEWoNFxoaiMVPYnmsPCnWsz96ssqfUYNXTCtUU/AZ+5DX4pswZ6mBba280N6t2zlec9hMU0dHJtD12RnffVL8uqAoqBEq9xvnsbgIKU2GK1bd44Lm7u+oLWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375403; c=relaxed/simple;
	bh=ub6T5r45aocaSqexuVP40keC8qi3fmqutKz9rgN/nE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTwm+NkSqbwrFidV4YkhmR77z6gL7E7EZ+Ve63AfXYmVcXjp0gnwm85CsfmkT9hlUGvelebZpFFfYQ+AriGIjIcfe9yLm8UkCcJ3aBPdnw+U7mSzsTX611v0kTnV/fR8miYd3FH5mnkE6E9XGK1GbmPN6Z1Ld3V4kmwvT9/AGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjIO5Rsq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjIO5Rsq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544BcIhn010740
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EVC3je5HAhssIAnNfZ+XqOXLnIfrV/oZD5AQQ6xe/s=; b=jjIO5RsqjwOL8NcZ
	Qifcx92SBgVIeZQ9Nc4Pg+OJtmB3KHtixWVrzFuxZaztvsMUbkQ/GS+L6ATcygWS
	PYEgNHlYxtF1EcMtZZmS1rQ0GvxQ6yKUOAKsmSKqvZpXEjAwaGSgCP43qkU40OrF
	xORvhu2q9vZsoXxbpUqtC8HV7YkH3RkU0dawPX8ANytBXxaVbZpZL7/0NP8fnkRR
	LFAFhIzI3oElI+Ci8MBru8G/iCOOydwToIajdRl+I/Igiabr6clEnQdWYRp7kBJJ
	dyFmOjv0ldDhNfzX/xJ6NuRirda0kuANJIEKA7X28iD1BJpTc1+E3QnFoRO/nImK
	VfQCHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh7a5nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:16:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff78so337801285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375398; x=1746980198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EVC3je5HAhssIAnNfZ+XqOXLnIfrV/oZD5AQQ6xe/s=;
        b=To5L27otNxH/hHwspteePEaWaZAKcfMH1HyYxJt8vCLVN44IcN9jioJ5r7T8kOFbkq
         iG5x+iDElR4OszvNzBylcDQEK+EG/dSYdKrPOc3vdl4iX9itTcUE2SAtly5z/DQHj4h/
         lrFJmMofSNLCr4zSGZApPtGck82h9ro1Dy2spSZsH8mdPyeOoElKu1T9kQyEvUX82IrS
         XV87yPBEBuGELqonG/pI0Lk/AAxgAT9dAMbP6PamJMpiLtgLFRquI2g6B2VJvg8FFk/X
         Q7qj/8PMWypKXMD8BjYXuQL+HcOKC9leJFvepZK0EEJOyVIDdxfD+6fodP1sM0Qsasgz
         1swQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9uKAjUczDnB2a3SoCeROppIvUlXMVRWnJGmsmnGgwIOP5io/uJ1UPxjX3bm7u52uAPr2bWW7OnBh1Efk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxfvw3SFINfaLsBql8T7Y1Mx01+JUiDT6a5+QlbM2r7yOH4wpA
	BkkeMoE1FYtKAnCbV82yxsOQ2KSgd+/bNzlrwrasy4M9eOyWzkt4Xmb3i6cQ9++2a1ieC5Jrptx
	GdiqtYh2a0OhhzLKKWVz1hzYIQvtbVfXMl6dxkJlpvaeKIY5HgE4J2aajPpl6puM=
X-Gm-Gg: ASbGnctWPS3k/vS/dAcoAqplZ1/Cw/lcS3yfqXduhL95RlAJ6BByQ/X2+B7Wme4BQGV
	Nt421f1y++UrZS5XCJBpANAkbws3X7wVSU6Um0D4am/xvyEsf7exJJgpPITu22typpjgdHdFdvi
	gs604/R8hs8YN0dZq1HZ0Q8j6HiXsPjF2hwShG1p6nbiex49GnYlF/vKM6DtOglNAR6g470jqRq
	J5sUXyDVibg/EsHs8UWenJW4r6o9UjsK33M30G5uGxY5GkuEu37hFmPlsV3iCUt+D/heJuAeach
	okL5IP3IyzDurfhbB8WPOvzzlryEwf9dO+/XGI4EUarkxIM6n9Mafv92ZyGGFheN7QsF/W+QmAc
	=
X-Received: by 2002:a05:620a:371e:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7cae3aa64e3mr573862185a.34.1746375398513;
        Sun, 04 May 2025 09:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiT08Hu2FwqUiAAbt7TpcAAf+6cb8td1czl+K5aq9kRsZS87wnWvgBk2BX0BgUjYPWiwBvqg==
X-Received: by 2002:a05:620a:371e:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7cae3aa64e3mr573858585a.34.1746375398104;
        Sun, 04 May 2025 09:16:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94edff7sm1299766e87.137.2025.05.04.09.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:16:37 -0700 (PDT)
Date: Sun, 4 May 2025 19:16:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Andy Yan <andyshrk@163.com>, conor+dt@kernel.org, krzk+dt@kernel.org,
        robh@kernel.org, hjc@rock-chips.com, mripard@kernel.org,
        neil.armstrong@linaro.org, knaerzche@gmail.com,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
Message-ID: <nco27hnwykffzgirhocskltrkcds32tefkix23nfknf3e5m3zd@mkrrbw6kogsi>
References: <20250422070455.432666-1-andyshrk@163.com>
 <9503607.rMLUfLXkoz@diego>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9503607.rMLUfLXkoz@diego>
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=681792e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=s8YR1HE3AAAA:8 a=iQVnW9HZ8WsgGSc_yxwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: P9pKayAFjahUI8tMnuJ_W5hLvUbeTCgq
X-Proofpoint-ORIG-GUID: P9pKayAFjahUI8tMnuJ_W5hLvUbeTCgq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXwAL1XoIEsdCb
 wwCe7cx7SmojgMjiY+PgpQWOu7bAdgCsw8bnB3yNgPHN9l9m3uNIs/tfS0LcrWOrxSU32nuqBtD
 jNsP3CH0tgxhwRcgNkOUWtosWN7xv5/mcsHIR3I3XjrpDSAcke+vE94s9rOHLEoIJdKHj0hnpsJ
 vLp9MXVkfcuusgih3Eyz8XVIrE9JTTyolkdBpS9bb6Kes+WtcMKrLv8SZVqr5Fxc1x758AoY4ja
 +B6FUpe+DtRNVzxOUj0Dcj63Y2MqxcKqB5Wk/yDJgTPSt9ZmR+VQR2E0tfYbFELZwguInG0zumS
 BuWMphf4fk2fXYxAEXXKW/IwhAax38cIJHa676OE73D+bGBcAnn6XbhPByqjxZI9QbNmdjHG010
 FEXk06VyMTR3MOO4HQlhlgbZIOMMFU2wJKao5Ajn6yX0alvp4v5vCuJvArKPbOWJbbCP7STl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152

On Sat, May 03, 2025 at 04:42:04PM +0200, Heiko Stübner wrote:
> Am Dienstag, 22. April 2025, 09:04:39 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > From: Andy Yan <andy.yan@rock-chips.com>
> > 
> > When preparing to convert the current inno hdmi driver into a
> > bridge driver, I found that there are several issues currently
> > existing with it:
> > 
> > 1. When the system starts up, the first time it reads the EDID, it
> >    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
> >    reference clock to be enabled first before normal DDC communication
> >    can be carried out.
> > 
> > 2. The signal is unstable. When running the glmark2 test on the screen,
> >    there is a small probability of seeing some screen flickering.
> >    This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
> >    by GRF. This part is missing in the current driver.
> > 
> > PATCH 1~6 are try to Fix Document in the dt-binding, then add the
> > missing part in driver and dts.
> > PATCH 7 converts the curren driver to drm bridge mode.
> 
> After resurrecting my rk3036-kylin which hasn't sucessfully booted in a
> while, I could veryify this series, so on a rk3036-kylin
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> 
> 
> I'll probably apply patches 1-4 to drm-misc later today, as that solely
> touches the Rockchip (and only rk3036-)side and patches 5+6 to the
> rockchip tree.
> 
> Patch 7 should probably get some attention by people more familiar with
> drm-bridges, so I'll let that sit for a bit longer.

I will take a look later, but on the first glance it looks like there
are too many things going on in that patch, including some unnecessary
fnction movements and define movements, etc. I would kindly ask to split
the non-functional refactorings and the functional ones (splitting to a
library, etc).

> 
> 
> Thanks a lot for working on all this
> Heiko
> 
> 

-- 
With best wishes
Dmitry
