Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4735661
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577824; cv=none; b=CEPKONJIqWEeKPn6YU1/Mc1z/SpKvY9za5EZyLEpYqID6w3QdXUr7H0T90KAp0DWompbSEZBZDur8L0s62GAJXVXF+o7ZIx68y3xmPrxlnJoUtAxOzGRw52sMsvKHcwUQcXQLzIpqXExRf87U6Q+L8Rk+MrYoMGgWLBpHMxrLyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577824; c=relaxed/simple;
	bh=ZBge7jMBgNPb3mHQNiyPpffxlphyMxP+LJ+R76AC2U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgFacXaGn3BBKBSDA0YJUW7rP4M+TdntsIpWbZHhQxQS03dT4Moww/q34oXhgU4KnEZyzWxq18vhVWzaYMCUiSE2y2OkXmspHbvTUeNzZbPMCTfqbUwLVfs0TLOugSRVhCyDV3V5u+RtN11cYET1t/Z0tc6l9mlD7TBw2QH2a/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6mJUPiS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6mJUPiS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546IRvNI002560
	for <linux-kernel@vger.kernel.org>; Wed, 7 May 2025 00:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U6czlrWo7n/eCpa71Z14BBOF
	9eOHw4aaoez+mTmbCkU=; b=I6mJUPiSD9yGGzA5QoKTy/CIvOfDbFnY0fr753Ac
	vvcvMhAoG4ViJ/OzKXKyqWugovwu7mQvjjsWoT+62+tC5DBbDJllecM1PBXYbO2n
	FAmz3DqkKaBplnCs+jFWwiO3LCbam3y4D4GglqBymEwaOiO9vMucAlPGOsOk3xXT
	waoaNLLjMNIZILQzkrc1Y22Hv1ZOsYpemquhlNLrd/bRwHNyb2nDH0uv8yfaOL0v
	MasDLZMaVIbBImfD4GTawp/yOxA2+NI/ZYL8aGMwqiYLAlVTu+IKn/M/46+4DFdu
	pgJrK4yVpZ5RUiBgiY0UaEvWW4sbKnAJBsUf05FcA8pJzw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5w3bwpp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:30:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f184b916so159213216d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 17:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746577820; x=1747182620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6czlrWo7n/eCpa71Z14BBOF9eOHw4aaoez+mTmbCkU=;
        b=TgQO+aFOCkCOcPvDuXnb2WtEh6cSvtrRLh7a4bcXfAx8/IhqqVPlbPuT5XZDXNhPy0
         Fh4P+b/PSJCRkvEUASkbWj3qmeHyMjpWF8W1nzSHhQrJ02z08Xocxb42I35kQ7ecrxVC
         muJjyzMMaZZZBjHpYD9jWApC1mBjYFGmVH+kOkxhaiV6CWflASaPqbBdCw54F/GckuGG
         Qz8Fjf2A6I4ptvf2mQmYuIDQrqfGskoCT+I38E+6gjZfOGD205m/KuZJIim+14mIfA2l
         iA7+T6BWSZRa+kDVodHmfLLQIi0ik+Owv+HnAvVIMfWM928jTJ790Kye8sf9C+l0/ENy
         7q9w==
X-Forwarded-Encrypted: i=1; AJvYcCWD5khqGSuZPxT63GHxDauv6xM1u1wzY+WfVyDKDgn+CrOwvkENCtC8LAVrEe5M5np0IJtho4w0/xvBA3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy6+cSBaA2odc0xgBVzBlbe7D85zwifrFU/bQvfg4TcVdlLoXp
	uQ1EcEbXabEexzoqys5EouRVDS6JWG2IHNo0LmB3si5QK6yIZdIwbqe64f8XQc/NuW60pyWpvMt
	wYAMLlr01zh5V55fmyTKIS0o3flcCowBMOLhNnxVGKNpqBKhlvEOhjKc4uMVn128=
X-Gm-Gg: ASbGncvq501191igiVevm6YPrT14ZwbCepQxkSzWSZLbB0pXSrtWK7+TIcP0Xj0qiFe
	xZ31FjFq2EmhZ9jg7lOVOWjeAc0e5E61Kgg8v3lsED5diUo6iTpcjbwPfv5Fy26+xuFbMwuDj9W
	vZxcdO4Wtn2U+wO3iC0TM/w4ywujV0wWe/j9zud0BcMB4b+m7xN5fTeSXkOURbCtHXqXQlztn58
	uACUeHGeKul0PRUIQc0tAzkf4/pd6cKCze20WBrKZoQfeEyi+g91m/88bJmrsJ2MJJL4qzLm0PZ
	2ZryOhQRYu4zad0WfQknd9H9nJN81vYNgauI1+uzzMSnYTsIrdp0kg0NThC+Ga9gewtztEJYEKc
	=
X-Received: by 2002:ad4:5768:0:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f542a06093mr16546726d6.12.1746577820354;
        Tue, 06 May 2025 17:30:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWm5XgjPTDMCnhvnoYdEiVxjS3Tf90qt6dPg5mitG5DK13+TYZY++IA7Ni8CuMYo239uk+0g==
X-Received: by 2002:ad4:5768:0:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f542a06093mr16546406d6.12.1746577820007;
        Tue, 06 May 2025 17:30:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6915sm2175431e87.231.2025.05.06.17.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:30:19 -0700 (PDT)
Date: Wed, 7 May 2025 03:30:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] pinctrl: qcom: switch to devm_gpiochip_add_data()
Message-ID: <mz6kajh7jkn5ly77rah2yxefgferlbpn2zngzeifgaoh5h4k57@iqojnv73sp4b>
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-3-da9b7f6408f4@oss.qualcomm.com>
 <CACMJSesbNz1Q5S4EDDk_O+oUfw8c6MQdovUAA_q2EZzuG2+i4Q@mail.gmail.com>
 <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSeuRDNo6Si+U-ACCgGnmW5H=D7Bcf32hqxxaLObt+_geew@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAwMyBTYWx0ZWRfX35DBhzSf+Yxh
 iPaYk8TylAwlz0L0d1m6ghsSKMNxhiuLbplC8ZJhqT4/Z2s+tUe1BQcb4vQppZVtlfx0ZYMzs2W
 g55fQEDuYZq+q7cTzcl5SJjVqN5i0gnN9H8mfJrRF+0CzFjwunVeQJ1x1iv7DBIZI1yJCAhExgI
 rIU4FyI6PrpEDkimSMi837osA8pglDb1a0PR2S9bbEfkAEcWYO2MlTIo65/vefCzbvQ5NunSFHO
 mtpj4Vx8eOFm3F988e7414NL+ZFKZJn55JoF/uY7Agea8e926V0A9oDL4se6SvK68F0o4p7Svg7
 ARMuDdSn9mK04UEHem8KwUa26CITZ0ET+sinTxfIskuhC3GLy3RXmJpLg+my/fI0WLq3aY9iCde
 RAlLuw1sOjRiLGL5j8JLf30H4s3yYA7akz6CSzTe1VyPJS8/oo5aqEQ5ZrEea9FyWD4xDEQI
X-Proofpoint-GUID: EurlQrXQ3t_vRqOLEsQ0VP0AVaWBaH_t
X-Proofpoint-ORIG-GUID: EurlQrXQ3t_vRqOLEsQ0VP0AVaWBaH_t
X-Authority-Analysis: v=2.4 cv=W+s4VQWk c=1 sm=1 tr=0 ts=681aa99d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=m-dU8d_lu5hDCtaHrWIA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_09,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070003

On Tue, May 06, 2025 at 07:23:10PM +0200, Bartosz Golaszewski wrote:
> On Tue, 6 May 2025 at 19:18, Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
> >
> > On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > In order to simplify cleanup actions, use devres-enabled version of
> > > gpiochip_add_data().
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/pinctrl/qcom/pinctrl-msm.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > index 88dd462516c76d58b43d49accbddeea38af8f1ec..b2e8f7b3f3e3d5d232b2bd60e5cace62b21ffb03 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > @@ -1449,7 +1449,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> > >         girq->handler = handle_bad_irq;
> > >         girq->parents[0] = pctrl->irq;
> > >
> > > -       ret = gpiochip_add_data(&pctrl->chip, pctrl);
> > > +       ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
> > >         if (ret) {
> > >                 dev_err(pctrl->dev, "Failed register gpiochip\n");
> > >                 return ret;
> > > @@ -1470,7 +1470,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
> > >                         dev_name(pctrl->dev), 0, 0, chip->ngpio);
> > >                 if (ret) {
> > >                         dev_err(pctrl->dev, "Failed to add pin range\n");
> > > -                       gpiochip_remove(&pctrl->chip);
> > >                         return ret;
> > >                 }
> > >         }
> > > @@ -1608,9 +1607,6 @@ EXPORT_SYMBOL(msm_pinctrl_probe);
> > >
> > >  void msm_pinctrl_remove(struct platform_device *pdev)
> > >  {
> > > -       struct msm_pinctrl *pctrl = platform_get_drvdata(pdev);
> > > -
> > > -       gpiochip_remove(&pctrl->chip);
> > >  }
> > >  EXPORT_SYMBOL(msm_pinctrl_remove);
> > >
> > >
> > > --
> > > 2.39.5
> > >
> >
> > If you're at it then why not remove this function here and the
> > callback assignment throughout the pinctrl/qcom/ directory?
> >
> > Bart
> 
> Ah, it's in the next patch. I'd make it one commit though, no reason
> to split it IMO.

Up to you, but from my POV it's cleaner this way: first patch removes
the contents, second one removes the function. Otherwise it's too easy
to loose the functional changes (of gpiochip_remove() removal) in the
noise of updating all the platform files.

If you wish, I can add a note to the commit message telling that the
actual function will be dropped in the next commit.

-- 
With best wishes
Dmitry
