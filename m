Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B11DEFE6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647811; cv=none; b=UPpf9ocXfYulGJy4ba9eLDAQhYtY1Coc6vJIPq2GPcGLfR9roduxS8CW9hivdznPnEp9acPfmhvHk/xc0A6HGVoZqlWm4OepBWkOG+O4MVutdgQH8Clm7yA9167hCQVFphoNZgu/3Darqrw9kfR23NeHiruccOd6aQNKhuA+KS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647811; c=relaxed/simple;
	bh=csbEb0KENiAbOhaEZqVV0SELhvMQVqF7Txk57mtfHe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv5ImHl7/HQfquUaui5aYgslA+8BlvfImUoxsFLwLEwiETMY3Ce8lOWXUVZ6yQvzq0PU2q8UF/M1Kdvth1+98LETnDWOhi/qf1tGJ8HenKOLzVhyPC7AuSvKlBq0535vxNUqggkrjReqz5HLK86hhkG8RQdBTUnxnTGiEWMybt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nbus9nel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nbus9nel"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564EtPc2000438
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEM4j1XOLi6BZwo1cLv2zjvJBeM0ee0P0ue89+lcOSQ=; b=Nbus9nelbqg4FSna
	93HfDfdeto7B2/ugkW/4Ws0fH/pDoriS1o95UxOs6u6ShkE4zj1iE4iKMLCwrn4A
	clUM2W6i6yGumd3cyWy6koyrmQViLHoDDYM/gKqn0/NA0+1+0+nwT6mmr1Nhqv4z
	9zDVDsCE3eJIG8K2MPNG7PK4BcJkCcHnQotoE3GNnCL0XGbhDf2vetMfObCnRZfs
	u+Uor4qXhiq5WEZarpZblNzsR9bF7NlVJVqDwhpSS36FiHXutebS0HiSriSb5tR2
	XxKc+4/ZAIBdNWyOxEuDW2GWaOC1NAsEwogfaq0ubdX6Bj3IZ32jO8WCcpsCUBdg
	Hj1v6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmmbns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:50:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3cbf784acso285063185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647808; x=1752252608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wEM4j1XOLi6BZwo1cLv2zjvJBeM0ee0P0ue89+lcOSQ=;
        b=WgRtENdb8Xk5lmSzCIICL5JoN815b4XV0fmSC4J4a9/L/1ZvU8bR437UDjNX9smojm
         XtCq9XNGvJBPDv+mPyH0MlLP+yOnqL8+A1bNRj1MkiLXnjFtcN0+t31bB8he8VlFs9+j
         L5S9NWdTLNcwFBfPMeomp9oa43j+JRhC9pPAgw3aeNsJKx6JFZA336Vrq4PonlIkBWRK
         nt/nogX1LR6AsFOEvzFyOaCf1fZKgvcfGPol7gto7DZuJ+rO2g78OOphfdO6ivfPUKNq
         EjLebWeJ9wzdAWYQ7mIUQo0SOlLuk1Gfy5omOmmR+Z2T+1bdYWmdzx4sskPy5SRnG7Hu
         EI/g==
X-Forwarded-Encrypted: i=1; AJvYcCVBgbps58UCf3iyEu8hl5t6F0n1cXqF8jCtd1UyGwE+t3MmNTZzN8lqLMocw+PY7GlfR2V6sscLOt7lFjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyeUycCmitK4IvRXFILXBVrn7efB0vwvd9anTTILJwToEfqE+9
	dMiohdV/j0HW0d01Col4uLsPdDeUh7Rw01t/8UMZ7PEG4BzMhmLKYwy98lObeZbkIFFtGlre9Hu
	L62b9+u2XsohXMQK63O37YGwPRamljOrndUZ8AaSzpyICFi9MuD3tvCwhxuMoGgX9hD8=
X-Gm-Gg: ASbGncuG9md/9fVqgeeSpyjyjlJ9z4rX+necBXzcKIBqWTYv9QwthytI5iHQd+5vPbP
	HbRAnZbLDR0EDrhBIT4hj7UZdEqRXGGuoQcy+7dzbRETQ0cbw7X/EDJc/X7IH8FbVH9wKy1NBJq
	1chdAMUkxJidiVojBQTUwclh6GEFUtB25+c/2VWru7ssKHQm3zXHUNaY+E5sk3TpfpVTcNSuRHV
	/BlV9NMzAdJWxytkEypu8ZKcSSvDBCRbdqYshUQtD4/xYyv52PrCD75LQFFKZ9Qpi9kSnfgLmJW
	vjtfV4izXFGgS/reU/AClJQz51jcGQB9DwbTygnw7NRl+6bLJ6KcXeHnzFIAsXC2wtaJ4v6tyDX
	ZNJX67n9RmokZxvZUhnaLwA7Vt0zy8CHXTao=
X-Received: by 2002:a05:620a:261b:b0:7d4:63a0:e0c2 with SMTP id af79cd13be357-7d5ddae41camr392082585a.15.1751647807815;
        Fri, 04 Jul 2025 09:50:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPoGPvTmGMkFyX/qytnycN+mM326tGMOLxBZbe002Y3SgEer69CCflWTfw/Q2aA0VrRAuyyw==
X-Received: by 2002:a05:620a:261b:b0:7d4:63a0:e0c2 with SMTP id af79cd13be357-7d5ddae41camr392079285a.15.1751647807416;
        Fri, 04 Jul 2025 09:50:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baf0asm304624e87.7.2025.07.04.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:50:06 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:50:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
Message-ID: <efods2cmjrhbjvpffswvsubm52u2hvkd6rry7gjwm3k5c7ezo3@b7wc6p6ieiof>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
 <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
 <qwlhmbsd5gqrgjsfzvaqha43pztq34bxjswske72igg2z37euw@2rkx76ikaclq>
 <CAMRc=Mdk+fGiVOH_Zq0K_gRpo-c2Gyh=SakKL77bL2BscS_PKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdk+fGiVOH_Zq0K_gRpo-c2Gyh=SakKL77bL2BscS_PKQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=68680640 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Xwy0tvpjcyFCf_kMTfYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4AY4oKADv_WODH-tBOPjhkd5lh_QPYHV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNyBTYWx0ZWRfXxK9+S6Oq9tIj
 Ab/eswgfsUkeNueIE96WzTtUBtahjq8rMhBi2RupfnDc0VaPKkxiEXx0HUOkgHor8bCx/d+/FE+
 jcEv/1wpvPt0fHNlMg7ZjadTEXD0CoYYlrWp4k2MacXt+6gfaG8EQzD4Vh2UVoi30/0YLy87sZW
 8kFO1cDAr+eenKjisyfUK/fZ4jFmO+Q75TKwl+piDPbDMMVcNHeg4BRtA0+B3NCZrapqVxU3A2t
 5Xj/BQo4TXQCp8dnQSD8ad8bm5wz30R2/NWk5F7YBUCxNSl7UDBh6HkPO8clzK0CcBih7FXCvx9
 ZQ/BiRZSZBOgZiQVT9nEtcKymEypTbeVpe5WsB3emQq8j1yLo5nw1eXQz6MMARGLGLEYcj5VsHG
 LlzffhVxMVr0gXjuvopQGNDylCdk45X0DvXxQ7Izkz1klhNcCXuS3zWz1te57fW+ZsFTydA9
X-Proofpoint-GUID: 4AY4oKADv_WODH-tBOPjhkd5lh_QPYHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=832
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040127

On Thu, Jul 03, 2025 at 10:17:43AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 3, 2025 at 12:50 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Jul 02, 2025 at 10:45:33AM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Allow pins muxed to the "gpio" function to be requested as GPIOs even if
> > > pinmux_ops say the controller should be strict.
> >
> > This is a strange commit message, shouldn't "gpio" function behave
> > exactly like that - mark the pin as a GPIO?
> >
> 
> They should but they don't. I should maybe rework the commit message
> to say: "muxed to the function called `gpio`...". The "gpio" here is
> just a name, it could as well be saying "dmitry" or "123456", the
> pinctrl core doesn't interpret it in any special way. What I'm doing
> here, is marking the associated struct pinfunction object as one that
> should allow pinmux core to export this pin as a GPIOLIB GPIO.

Ack

-- 
With best wishes
Dmitry
