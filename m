Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9C26B772
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368334; cv=none; b=mSLOd8bekEbKHiwn7S0R14S3Gbr36g3ObG93X1bnIsBHkQrHH5uUoy69rpCuSOJwTtRAft7XSTtoPrxXZFQtocS9iJcxcOJ56I1lSPKtSRJSe89v0z3X1In7lbxGTEvZMlLXtHH7Hl2+pEu/LUXkaHfr9bP/OfSJVSpWRoutcX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368334; c=relaxed/simple;
	bh=QEZ21qlcwB44HosYYOE2/QtOlPopnVPyTlzTQNsGFuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvi5rzPaqZ8wtc5I5DAy3nW1QJU/gRIR9WLwv2dkYVaWbKBvstghnbKfAIuCGDJjr/5w+328sFmYw7QqDIuEuKWaFcNvFTcfRKHNkD/DyGvpEtqQiTWalDL9jigtOGghUcRG4RoRieHmHofPoz5TOiqeIItPv7+RSkptWD0JQyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcXtpURC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcXtpURC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619Kb0T024827
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 11:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Wn8dIacluJa4oe1kQscHimYh
	2WUFSc+TGJ60KVihadk=; b=FcXtpURCA3rqRaj2db5Nz7QWjZH3PELmVJ1qUYG5
	G2tJp1PIWDe91UC7tCzakD+6FB1WFzT6vF9tONX13TeHQbxfIlRoZkRqeg9lMIq3
	z+/RmOkVBunY+Q+d+Ux+CcGuXj4TzTpOPDlmUVFDay/unbz2SvAUjrlmGl+ot31c
	+9TOFltv71Y1AlBKMepawxccGLO/R+FGF2nSmP7IRqXcISTixBxEbOlP+g3TZfKX
	eEiLHrpd3AW3hAfG0JzHia1V0HCeQdlOk0TDOTbQT8AanPOVBOAJUJXa0YXhbj6C
	g/eR1pNq1CQ2SfZ+/DjRfJy0NoF1Vmx8m0Q/KMHLJdqHfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9gkwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:12:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097fd7b32so746048785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368331; x=1751973131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wn8dIacluJa4oe1kQscHimYh2WUFSc+TGJ60KVihadk=;
        b=o/8uiNctDlDJnvnspTEusToVJm0pW5V4zat/xscVG9l0oC6hxW32Ax9sWhva4y6hkC
         TTHHBXW+d6v81rlJi3FNMi2tKzfb0PuBByfLJHf5g9iF0F3aM4oy+HsCWfVWphANyaa3
         pBEWEv0n2OUpTBAwraJbgIFceOU5NPjnkhGPTVwiVbxuK3q8X1fhcA0vhxBgaasBq5LB
         BHGQFyfHGJKtf9aOsqa7+yt3DI3QV5BfjZS+2OvEEs6MbW8Igkiwzn4NUZiDfmHGf2NP
         22DBq0yhRk3wHQwtZ/j3zHXoyishn9CSMNV++779pwlUN0JFGBnM9cQnaCmFPpKT3E4m
         4ZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3TAsd29RaLlvAesl83+mqZohSwMIVjL1niI8DLo7AuL2pvbJHgWhnWAucDMZMsBfvDXEqm798O+MeMd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4s+sDUEr5xEd5RGOJI0EZQB8RfvqDQ30noXCmhNsVBxz0+rbq
	L2p3FGvFnur14T+6Rg8cr+wmyciaz9kbiIUfTfqBq84Xz1cgwEVr9D/dZhBldxXah6JgS4Rb+OU
	Tzf1KjR3qJST+E+Bg+63RCOYQoy/JU14XjK+sTMKpcCJLTKiTt/nnJQV4VmynEEVYkXg=
X-Gm-Gg: ASbGncsgiBtkR74XtI8c74y9qSK9Pc3gs3uRWVf3yZa+pUcy0YSBszfB9D3TP3rgt6O
	QePem90msIMyxegjTdiTxhK9W1qltwRaDGtXaqBdDM8z30Ra2zo7yT7stz62860v4nZlG/cxfUP
	vLxIUf7u933sbkRA3rGDPDBL+mJqbs1pN9l3TDFm6JpMrKHcOfpghLxIOpkZ+9xwBkhVqeSYGgE
	924IpePO02r5Cpbv+x3IydFr39iFDYTY+f5ABirvSpAh+Va7MdkkftHViukVwpw1KwDuc1st6Zg
	rIBNjUCPukF6B0rcrmVoG67+bTy6t7B8IshB0qWa1w6E62qAqn7dU+k5GTz3prpRVo7dlBY/ood
	P5EaQ8nCJ3x4BgFDSl8BEsASAa435tP8/w4k=
X-Received: by 2002:a05:620a:6504:b0:7d4:57b7:bbf8 with SMTP id af79cd13be357-7d457b7beb5mr1100027385a.49.1751368330760;
        Tue, 01 Jul 2025 04:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF9diEhxnvxYx9K6OFtUy5pjQeD6hdLrsmwhYyKkExk8FnCoGf4cY0maUEtbdzawGa3/IPCA==
X-Received: by 2002:a05:620a:6504:b0:7d4:57b7:bbf8 with SMTP id af79cd13be357-7d457b7beb5mr1100021485a.49.1751368330318;
        Tue, 01 Jul 2025 04:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24038bsm1797002e87.25.2025.07.01.04.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:12:09 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:12:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_mnaresh@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: Re: [PATCH v6 7/8] serial: qcom-geni: Enable PM runtime for serial
 driver
Message-ID: <tt2crsexdnhlotlo3z5uxyta6jrnnvom7aqwsjvopwueazbuih@2l4h6xjpwlar>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
 <20250606172114.6618-8-quic_ptalari@quicinc.com>
 <d6cr4elhrbh27lmlcv5xzuel75uvsgi7klxjkevm7vg4jcbawe@5ojgetrxkag5>
 <f87807c9-5249-4d97-ab89-898b7d8d260d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f87807c9-5249-4d97-ab89-898b7d8d260d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6863c28b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=Jl-IZ22V7OrDAWU4FEoA:9 a=CjuIK1q_8ugA:10 a=-_B0kFfA75AA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MWIk-5bWO2DGLNuRWi5UgDpK4f856zyP
X-Proofpoint-GUID: MWIk-5bWO2DGLNuRWi5UgDpK4f856zyP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OCBTYWx0ZWRfX7Gq8KIGov/82
 0KAw4vas1nYk6qSSSmQVhTawUOl6T9cUyaV/2C51zjWnM5mmcavCiUnUHGST2BniwGDmhq6UJan
 8K3ln/GwjJ8f5/ugqqx+csQSpvjfSSFkDpn44/vHWsuzNt8K9ZE5G8GTMbpD1p5sDTn5Q3TdvxV
 kM9fjUUc9Si03+/dKR2ael3urjMHs4hyIYLZFRC7Nrd8W+c4BD/T0MCUzgcHDPvQRs0811lh4Q6
 B/XREzvu1iKHtVyHrKQLycOurKWJ5PSyvZjbpY819IDLLUsxyleSPc3/KWqxbaeKgfYQnqIOCD4
 P14Q9gF+f4C8A8LPXeO7tF00SIxn3QU3ZEqi3FXrDvZ1f9zxaihyZdmDMsVojsJuXuxWpisvjBM
 7G/68oVe3RuBvXb91WluIDKRGTM/cVIFYMBdtj1eyhJsMAqM8+lJFK5BdPc6MdEWvZUajIEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010068

On Mon, Jun 30, 2025 at 10:40:25AM +0530, Praveen Talari wrote:
> Hi Bjorn,
> 
> Thank you for review.
> 
> On 6/17/2025 9:23 PM, Bjorn Andersson wrote:
> > On Fri, Jun 06, 2025 at 10:51:13PM +0530, Praveen Talari wrote:
> > > Add Power Management (PM) runtime support to Qualcomm GENI
> > > serial driver.
> > > 
> > 
> > Doesn't this have impact on the behavior outside of your
> > project? Or is the transition from qcom_geni_serial_pm() to explicit
> > RPM merely moving code around?
> > 
> > Seems like this deserves to not be hidden in a middle of a patch series.
> > 
> > > Introduce necessary callbacks and updates to ensure seamless
> > > transitions between power states, enhancing overall power
> > > efficiency.
> > > 
> > 
> > This commit message fails to state why we need runtime PM support in the
> > driver.
> 
> Introduce PM runtime support to the Qualcomm GENI serial driver to enable
> better power efficiency and modularity across diverse resource control
> mechanisms, including Linux and firmware-managed systems.
> 
> As part of this enhancement, the existing qcom_geni_serial_pm() logic to
> use standard PM runtime APIs such as pm_runtime_resume_and_get() and
> pm_runtime_put_sync(). Power state transitions are now handled through
> the geni_serial_resources_on() and geni_serial_resources_off() functions.
> 
> Is it fine?
> Please guide me/correct me if needed

Please start by stating out the problem that you are trying to solve.
There is no actual issue description in your patch.

> 
> Thanks,
> Praveen Talari
> > 
> > Also, start your commit message with a problem description, per
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > 
> > > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> > > ---
> > > v5 -> v6
> > > - added reviewed-by tag in commit
> > > - added __maybe_unused to PM callback functions to avoid
> > >    warnings of defined but not used
> > > ---
> > >   drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++++++----
> > >   1 file changed, 29 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> > > index b6fa7dc9b1fb..3691340ce7e8 100644
> > > --- a/drivers/tty/serial/qcom_geni_serial.c
> > > +++ b/drivers/tty/serial/qcom_geni_serial.c
> > > @@ -1686,10 +1686,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
> > >   		old_state = UART_PM_STATE_OFF;
> > >   	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
> > > -		geni_serial_resources_on(uport);
> > > +		pm_runtime_resume_and_get(uport->dev);
> > >   	else if (new_state == UART_PM_STATE_OFF &&
> > >   		 old_state == UART_PM_STATE_ON)
> > > -		geni_serial_resources_off(uport);
> > > +		pm_runtime_put_sync(uport->dev);
> > >   }
> > > @@ -1827,9 +1827,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> > >   		return ret;
> > >   	}
> > > +	pm_runtime_enable(port->se.dev);
> > 
> > Any reason not to use devm_pm_runtime_enable() and avoid the
> > two pm_runtime_disable() below?
> > 
> > Regards,
> > Bjorn
> > 
> > > +
> > >   	ret = uart_add_one_port(drv, uport);
> > >   	if (ret)
> > > -		return ret;
> > > +		goto error;
> > >   	if (port->wakeup_irq > 0) {
> > >   		device_init_wakeup(&pdev->dev, true);
> > > @@ -1839,11 +1841,15 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
> > >   			device_init_wakeup(&pdev->dev, false);
> > >   			ida_free(&port_ida, uport->line);
> > >   			uart_remove_one_port(drv, uport);
> > > -			return ret;
> > > +			goto error;
> > >   		}
> > >   	}
> > >   	return 0;
> > > +
> > > +error:
> > > +	pm_runtime_disable(port->se.dev);
> > > +	return ret;
> > >   }
> > >   static void qcom_geni_serial_remove(struct platform_device *pdev)
> > > @@ -1855,9 +1861,26 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
> > >   	dev_pm_clear_wake_irq(&pdev->dev);
> > >   	device_init_wakeup(&pdev->dev, false);
> > >   	ida_free(&port_ida, uport->line);
> > > +	pm_runtime_disable(port->se.dev);
> > >   	uart_remove_one_port(drv, &port->uport);
> > >   }
> > > +static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> > > +	struct uart_port *uport = &port->uport;
> > > +
> > > +	return geni_serial_resources_off(uport);
> > > +}
> > > +
> > > +static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
> > > +{
> > > +	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> > > +	struct uart_port *uport = &port->uport;
> > > +
> > > +	return geni_serial_resources_on(uport);
> > > +}
> > > +
> > >   static int qcom_geni_serial_suspend(struct device *dev)
> > >   {
> > >   	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
> > > @@ -1901,6 +1924,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
> > >   };
> > >   static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
> > > +	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
> > > +			   qcom_geni_serial_runtime_resume, NULL)
> > >   	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
> > >   };
> > > -- 
> > > 2.17.1
> > > 

-- 
With best wishes
Dmitry
