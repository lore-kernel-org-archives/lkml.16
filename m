Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C115B0EC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743099661; cv=none; b=kHN20EhlIXubrJ4xkhBvhVVYlKmd8rDSCmg3hk4cN/RxH1VOJhl5Sd8VSaN7io7IheeBQKdS5Io4ECB5z/wK4h1PbMMgYNu5ZQaPub/Qng7lCpWaIxeMEJ3f1hG+M5Egbm12CdwMNgoMjTS8UHCX6cfLYqmamrn13vMctznN8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743099661; c=relaxed/simple;
	bh=jhclNtUgsQQyCzKu4YAx9z0GhWqsHEX5/dnTSkWtmak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIsGWpaEcGQiJ/Otrv7ZOMG+QmZ0lF0cJY5aODwve7f9maHFo9owl6mv5v37fSFrlspy+Ya+zZ7x4SRHVEVOEmndtcY8205WsG7C7mIlM/BfLt1Vi5CAO7w5zugUaiKmuK6Jkt6d65T8BbtP2Ug423+Q+Muu1aU0wYaG5sUIiEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9ehg0Ts; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9ehg0Ts"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RH7LOO026100
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WQitrKmzUpzT5jYzxA6P4DAQ
	r2Y6OfHBDNkpOWQF408=; b=M9ehg0Ts2+zDgjv0Q03SOIbspwBR0dpZCQ0pULnL
	inwqn/njOnN7pJQuOHyyvOh59C+iKepz83sOL1BDbQcFCWvWbm0YS4EfroYlSgfV
	8ozY2dJ7dUy0OKp51qSTmE5yT66FDIpjgI6+w9ZDPw1DZNxHLFQySS87593KHerC
	2wN0eAYpbecOo4b5IVa/8h6g0TyWDen7UEPoyvK0cDVj6dhGkEK75SuRBGWjrPfq
	RafVzzsYiQMPxsU8tJQF2ZqX34w11fYnBePqsTs2z5gP69nx1XAg9TzzTvA03rQg
	QMWIal6yI9NTgJS0QLS1LjkFQpMbJVZUP0hRL5z57EARkg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nat0r6rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:20:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ba3b91b1so248262385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743099655; x=1743704455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQitrKmzUpzT5jYzxA6P4DAQr2Y6OfHBDNkpOWQF408=;
        b=pN8/c7stFWtKr3s+h+oUy4vAdEkzhcbTgRNCKW3DedRtkuG8s4WWc0ZfH3YHU6+XaR
         e0R+nCFaC9fNnqAYEBxbUgMsD5oBPC+0dAzO8wJW5tXkvInncvov//nrUPtQ88utmKJs
         nxm/FZ1gECcjXohjWYcNwAdUwEkFtEEBqoBcKQcJqLfOMs2wBNbeUW9S4axU+pF6X1di
         wNgPaX6/T5q0z1i6bIYeaYWrZIPEBLDStX0Q3Zxo2shQ1MBBZkAUmpiCdwp2khoxWcwc
         9j/ZQtRRZDCcZGGLg2DrGSzyX5fTDkxrmTc/cBsu1ZfwC6MjQePGIvsQpr/LPPExTb/Y
         TNBg==
X-Forwarded-Encrypted: i=1; AJvYcCXSVs2YX2i1eCPnEF1bqdhGB9mtBm9cqF6mQXdMJaP0XXA319WxjgteWFZaIZPBVbjxocRRj98pIDPrNQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QxWVwqRMWLW/tJ5PROz7NgsSsH/FzuZPoMlWUYmkL9Wr2Bof
	89RkwgGZ2u0jQn0zmp0kB0IFUWrbkdgsWWa+kXDEXHpXNDTRABpHX5nNCYuE7+HeRf21K0Zu4aD
	cXiSQOSHMrc5m6ArSFGY6w9HuP/DraJPM9rIegn9GU/cNp3P5BbZcL0NrHQbtSE/yQPUEQuo=
X-Gm-Gg: ASbGncunRVQ0sh31SxwC6nqBpuWU71PR0dphpqFthjS7caFeRwTw6hyoEN+MAIoGRyj
	xRnMe8e6FxDTNyBVRdxg0vdywJ0uF2hiAG87IAeNwWcWRNQxnj4/z5Ptn/FYH8bzFZEqFlBHghz
	Gpb+uGqT3jOYEhgq9iIJXlpkOhBSwxfafShwSSWT6i5IJgPIcpcBF4P07KF542Pn0TyiTPgMQCS
	BrqMat0wScYBaYOYa8s83cBUVFL+YeVQHxb6On60CNK5NxWfCs2OTdET6CVhEti1aZQiMu3E+ds
	VPhB85bZ9q0UohDguobLfMXWFJ8HuPL8Hv60wODYYO7KwWKQJrteU/aQTd7C/3c7WTdERfQwiqI
	14D0=
X-Received: by 2002:a05:620a:f01:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c5f6c0e99amr185158585a.4.1743099655455;
        Thu, 27 Mar 2025 11:20:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLPcEsJfsh5WzbEzZO7O+sP6+vrjgV1VROPutFjOif1TlVMmMX8glRrJxjPfzNOP72PbTFtA==
X-Received: by 2002:a05:620a:f01:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c5f6c0e99amr185153685a.4.1743099654957;
        Thu, 27 Mar 2025 11:20:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59780sm313691fa.108.2025.03.27.11.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 11:20:52 -0700 (PDT)
Date: Thu, 27 Mar 2025 20:20:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 04/18] clk: qcom: clk-alpha-pll: Add support for
 common PLL configuration function
Message-ID: <zyfr7dd3dwfbcyztiaajr6tac7shn6ecrvy5277bfk2uwh3txp@gt4tbxh6xx54>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
 <ddcaa5e5-b5c5-4d78-b44a-4cea75ec6a77@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcaa5e5-b5c5-4d78-b44a-4cea75ec6a77@linaro.org>
X-Authority-Analysis: v=2.4 cv=PPkP+eqC c=1 sm=1 tr=0 ts=67e5970a cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=qUIExaTrLRACx9kgswEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hr7fPealDahuBnEWmDWE-5IZhCvnrmZ2
X-Proofpoint-ORIG-GUID: hr7fPealDahuBnEWmDWE-5IZhCvnrmZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270125

On Thu, Mar 27, 2025 at 03:51:33PM +0000, Bryan O'Donoghue wrote:
> On 27/03/2025 09:52, Jagadeesh Kona wrote:
> > From: Taniya Das <quic_tdas@quicinc.com>
> > 
> > To properly configure the PLLs on recent chipsets, it often requires more
> > than one power domain to be kept ON. The support to enable multiple power
> > domains is being added in qcom_cc_really_probe() and PLLs should be
> > configured post all the required power domains are enabled.
> > 
> > Hence integrate PLL configuration into clk_alpha_pll structure and add
> > support for qcom_clk_alpha_pll_configure() function which can be called
> > from qcom_cc_really_probe() to configure the clock controller PLLs after
> > all required power domains are enabled.
> > 
> > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> > ---
> >   drivers/clk/qcom/clk-alpha-pll.c | 63 ++++++++++++++++++++++++++++++++++++++++
> >   drivers/clk/qcom/clk-alpha-pll.h |  3 ++
> >   2 files changed, 66 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index cec0afea8e446010f0d4140d4ef63121706dde47..8ee842254e6690e24469053cdbd99a9953987e40 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -63,6 +63,8 @@
> >   #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
> >   #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
> > +#define GET_PLL_TYPE(pll)	(((pll)->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
> > +
> >   const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
> >   	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
> >   		[PLL_OFF_L_VAL] = 0x04,
> > @@ -2960,3 +2962,64 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
> >   	.set_rate = clk_zonda_pll_set_rate,
> >   };
> >   EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> > +
> > +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
> > +{
> > +	const struct clk_init_data *init = pll->clkr.hw.init;
> > +	const char *name = init->name;
> > +
> > +	if (!pll->config || !pll->regs) {
> > +		pr_err("%s: missing pll config or regs\n", name);
> > +		return;
> > +	}
> 
> Seems like a strange check - you are calling this function in a loop which
> looks like
> 
> for (i = 0; i < desc->num_alpha_plls; i++)
> 	qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);
> 
> Can num_alpha_plls be true but alpha_plls be NULL and why is regmap
> considered valid ?
> 
> I think you can drop this check.

I think pll->config should be moved to a calling code.

> 
> > +
> > +	switch (GET_PLL_TYPE(pll)) {
> > +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
> > +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
> > +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
> > +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
> > +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_TRION:
> > +		clk_trion_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
> > +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_FABIA:
> > +		clk_fabia_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_AGERA:
> > +		clk_agera_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
> > +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_ZONDA:
> > +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
> > +		clk_zonda_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_STROMER:
> > +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
> > +		clk_stromer_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
> > +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
> > +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
> > +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
> > +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
> > +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
> > +		clk_alpha_pll_configure(pll, regmap, pll->config);
> > +		break;
> > +	default:
> > +		WARN(1, "%s: invalid pll type\n", name);
> > +		break;
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> > index 79aca8525262211ae5295245427d4540abf1e09a..7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.h
> > +++ b/drivers/clk/qcom/clk-alpha-pll.h
> > @@ -81,6 +81,7 @@ struct pll_vco {
> >    * struct clk_alpha_pll - phase locked loop (PLL)
> >    * @offset: base address of registers
> >    * @regs: alpha pll register map (see @clk_alpha_pll_regs)
> > + * @config: array of pll settings
> >    * @vco_table: array of VCO settings
> >    * @num_vco: number of VCO settings in @vco_table
> >    * @flags: bitmask to indicate features supported by the hardware
> > @@ -90,6 +91,7 @@ struct clk_alpha_pll {
> >   	u32 offset;
> >   	const u8 *regs;
> > +	const struct alpha_pll_config *config;
> >   	const struct pll_vco *vco_table;
> >   	size_t num_vco;
> >   #define SUPPORTS_OFFLINE_REQ		BIT(0)
> > @@ -237,5 +239,6 @@ void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >   			       const struct alpha_pll_config *config);
> >   void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >   			     const struct alpha_pll_config *config);
> > +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap);
> >   #endif
> > 

-- 
With best wishes
Dmitry
