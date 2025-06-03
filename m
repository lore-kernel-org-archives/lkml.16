Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F39226D08
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947033; cv=none; b=kPicR98Rl1pyrPE9paO7looTyTQ6VQxtNUnH9axoHIhRDaWfg9z3BEj3ciBwH5Irkjv3ZQgOGduSbg1XNpPp8M+WDVlE+v1+5i0/xSH4DWcn6Se29oT5ZlowQVGMv3tnlGENIWjXaZNZTUmigt8D8wSwxBCik6IpGrUYreZWwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947033; c=relaxed/simple;
	bh=uqpOJv2wigJPKhBBU0tlE5lRcyIvfno4JsOZUYts/FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk+ntwRJAS8b1iGy1+EPZKIGKNH0We3pNhPGtvo/ZJ5EHrdVcJ5cC37IVHST4YOHe2gO+Y/au8DqCqkFXgf0pvwm4zpplPbT1MXn3jNUSVCdblDCUZInOBfym9I+dJtXYFaTN8fCMcYEP2FVPhWfs8iMVAkKziZizDIWCrruo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlcSe1b2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlcSe1b2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JFrY000679
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 10:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9uWNnzZMN7gxXGGetcBuxHkVFtdiwfBWdURBEwcqsI=; b=hlcSe1b2m80sbOH+
	HrmJDeiCebvVITjj3d/gHYyowy3NuP8JYUV/BR5d8mbbzf1KTrwRKFRvXBzzL8uv
	HrhbhuseCaIT2KZe4HGcmug2znR5CnaNSW7jRx6v4bcAO9He3/4vmow2zhOJHBWR
	mZmkryhInHOTzytu69Vh/R0rsIhRX5ta/bM31l5wufZUzxvKvH4Uafjx0XhS9p4A
	Y8jCnyLguivFvriquzrkWchJZO7/c92KkacJ/py5QD8onnTTmI3+OBg5i9LMqcMg
	DX2MnNFuXPgLHNQt5SkdcuIR99f4AANY9XAoSetwDrpq1EVR3I5HxSIOTo6RbqRG
	LPv4bQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q2a1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:37:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso993372785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947030; x=1749551830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9uWNnzZMN7gxXGGetcBuxHkVFtdiwfBWdURBEwcqsI=;
        b=U1wj6UHbf1jtXG+tdOefD9BFb6x84vc66EnoZIy0+ARGyfJvfIEnJG2XZKVfCoduko
         MHblt2tuGXzttyZ+Sz0Vhpp3a4r7fQAxnJ3Owwm8rw8TUd7wx7DwI+e+/mHS3MuO+E7C
         npZiBFg5L+ljBV/Y+ko518Wg26kRTPDFzcjgzF+lem1ZjVCaeRA2BvFb27Bi+AQHWzMJ
         9K9OSen3Om8mtFa76EDC2szRNjMw+2bjLG9swVquq07MEB/4fy63FUBlwjpdwPs/9pZ7
         9QMo4ZAr6FI2W5k/7ObJDyX5LDDIY+TKLHdcNsYrFJas02MsMAP6bG1xZroAEmaM4V1K
         cLRA==
X-Forwarded-Encrypted: i=1; AJvYcCVpLYD4GDgn6We4rzFOeJrY32+Dk2jRdZmqmg4p8tAqAEuh8/uMp25YzcdfkZfobvkIqnQHtP+9UW+kaHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuvLXHo34RTQOV1ziHxnjR7TZFZnZwzta9RhBIrCl4JpKzzw9i
	HLdJ8Qz95nTagUT3k+Bc4CMLrkbK0ZE+HBXrIyiPdGQgwviXKxX1pNZcISGnU4fJJ2WFUQ6CJ25
	4ZYc6ONXlbXgWIbBqk6ukMIw6EMNaV92xqgmcSAWfR/7L6Cal0dXkbhKCRGobN8lMGK8=
X-Gm-Gg: ASbGncvdFNc6PEUeab49VcrY+KkSTSsZgfo/QKB5MKxGhE8PYOFlHarHnwZelydoTBg
	AJY6MxrUa8e3aCbHsv5FpTUEbKVspHVr9DlkKQWQP9/cYDWK9bK6jSV3oydOK4AbbHNUOZLhKFM
	r+osRJt0VyCSzFMMZLcchxI2u7D8zyHObirKTcM8kC7+DQtt/UtF4r8Fqjw4E/wOnKFPxG6D5OH
	SBrTyer7FqfGEG/IN51o4xiN+9aCZPRLZxNOdoyFNOW0gTJPzytT6GB8Aar/zjo51BUEu72Ec4Y
	LNGgNnX6VN2U+YVBWX9inOr0wiXda2aqB6Crl/3Tqwt6pkx9HKfLF3aDB/Udpxpw0SZ07q8iQkU
	HU+4mjbqPlg==
X-Received: by 2002:a05:620a:3f85:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7d0a203c941mr2733684785a.58.1748947030002;
        Tue, 03 Jun 2025 03:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcaWHfUMt/J84blqUHOVj38V1G/bCnq6PQ19HYI5oXarRw/p2CQ+daA0/OPAIVimxK24L/Xw==
X-Received: by 2002:a05:620a:3f85:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7d0a203c941mr2733680685a.58.1748947029464;
        Tue, 03 Jun 2025 03:37:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a00d8sm1888642e87.82.2025.06.03.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:37:08 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
Message-ID: <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
 <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
X-Proofpoint-GUID: KIqfhG0d8XKJs-Yu1IRq8opVvtZ63io7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MiBTYWx0ZWRfX/OdHMXa6GkMK
 taSWOl7AkMw+q6RtpyOYl3zRiWqXcHAD864yMQWZ/SApxVRCK573SchHv3ZlsQDF0b7JyPGuFFu
 lBm4IPmE4s3vwXVg/qqlOh1t1UEvF3HbfyNMvXzcWb509Pvr4Th8Q3HepRHQDR2plMEorFd8g9m
 vKm6i0HgQ7Xau2ZT4XavXaUxur1lMZqqDRbBIdMcgV/eov+LHCyVU4NKNr9ulGlXzhBL4vphdGR
 R1l62RS+gQRjxVfbuhI1ZXt5WsewXuqA8TkpG6yE4HYed0T+6hddugeJPTI224MPiMqUmMeYJWx
 OVxce9/Ad1VrMmwLksnMdj7WaXtNx/7jJ7oRPK9BJ8ywEJsKIVk/WSmNwRZXC67XqIEWcYlvylT
 t07n2WCGFdtBuk6DH2Ap+OIa78OhGcoBwry8ILALKp++NxfY7TfRF3CzBj1S4JWbfCo2dp4L
X-Proofpoint-ORIG-GUID: KIqfhG0d8XKJs-Yu1IRq8opVvtZ63io7
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683ed057 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=DVxyIStym39DqTwfPQkA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=744 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030092

On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
> 
> On 5/31/2025 6:36 PM, György Kurucz wrote:
> > > Add charge control support for SM8550 and X1E80100.
> > 
> > Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works
> > well, I finally don't have to worry about leaving my laptop plugged in
> > for too long.
> > 
> > One small thing I noticed is that after setting the sysfs values and
> > rebooting, they report 0 again. The limiting appears to stay in effect
> > though, so it seems that the firmware does keep the values, but Linux
> > does not read them back. Indeed, looking at the code, it seems that
> > actually reading back the values is only implemented for the SM8550.
> 
> Right.
> 
> Based on offline information, X1E80100 doesn't support reading back those
> threshold values in battery management firmware, so I can only use the
> cached values for sysfs read.

Which limits usablity of the attribute, it is now impossible to identify
whether it is enabled or disabled. Is there a chance of fixing that for
the X1E80100 platform?

> 
> > 
> > Anyway, this is just a small nitpick, this does not really affect the
> > functionality, and I would support merging this series regardless of
> > whether the read back values are always correct.
> > 
> > György

-- 
With best wishes
Dmitry
