Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8CB20311
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413275; cv=none; b=eEmELn4mNH0kg1wr1BqjvYPn0KkrNOnb0iwWMPRiXJ/pc+aIDTet1gN34Mg1gAB8GljDeKoG8VWWvcv1Xiw1ObeJKtcGpKapLPDPQKzdBuimDCh0RrDKEluk9pokBfhSPCRIrOMlLJSkYppkoj4/CMS5Jut3UTtO2pnecPFl4fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413275; c=relaxed/simple;
	bh=wd9BuDyfY2g+YcmDFO0GJF3WmdKVfVi8IfjkUW9YZzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=niqrJKsVgUhm0ylTqAageMsigPh3y0VLSiKkXEweb6Req/IYkUzbukwmHN2GR3gjnxkRO0ULd5P9DqbsYYaoEIQMWIxFhdsFglBoKyC6VnvgOW9RX5djnxsrfSThxDSBsoZYkuLZbQ5shmtdtY8LIYyMGE77f/heANAdsoFIvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jebbOYq2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jebbOYq2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAiRSB022331
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xPikF6CHMtboH8wVgZUcnmTj+ScLp41cXAhI3chWQ6s=; b=jebbOYq2L4NxvuWT
	OgGT6NlsvwUlxEMsseGJeXf+uSDT3Phwfeia/pLvt2f9Mnd3upe0+fLHgPZxcmYs
	cSyStGCmznyp94Ooi/KJGUQXCvp4rv/3pmWuXf2Z4yLlAvoZqHOXUdUnOcIBckFf
	QAMokAIUHz7BXCsvvbKnS195TQ1Uzbpk2Ua2wF4j1BKE3djSoH3htCccvH9nzC25
	g4E7BSfqA7CoIQvAGQemCJrVKhA3dQJb+cavut9Zp+vK54xBguiVItxHrop4Rf6t
	Cd4mng7hAS2DtGBoB5+xU1iTO/pqAKxjQkj76N0GNGSWPCWAB4BMFsf4nhzpv3BR
	65supg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh125h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:01:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c545ac340aso37934785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413272; x=1746018072;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPikF6CHMtboH8wVgZUcnmTj+ScLp41cXAhI3chWQ6s=;
        b=RTPFZsTIdnU2vNXxbcwCf0yPg0z3oJbcjAZ08+FlzsxNeea7YDXoD+LkajXTXqbdzg
         NzCx7TI0xvHxlTPPdfY0p50PVGiG2XlUJ7ABa0b+lDCdb4b7D+4tMsodk6zeOL76qa2w
         JALSkCMBU6MrMkTiZACH1dFmKb44ELjlBm6gMgbsLNxCmVPM8BHmqkoTc9MFrTbBlrYj
         ZQt6gWLpF8hoHdPNQwf/i2A8/JZAfV/GKsQ/CLk0LPHMabTK0EEluTyOkxdbbS7NpGlk
         XclI7QZktgeNUPXiODOJNBTXutJ72Lb2cqAC9SOtUOtgRlxehbOSR/7GLP9/XDdu3HpL
         8M+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2n2QMybdqCehHXHjTbSYshg5qqJFvfL0CjVixY31AvDGaTn2jLlR2PcvaopbMuTxldjGEj0Pg9yvJG20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmjH3ebPgxuTxB8LUdqSoOfQlZfrHTvMhWyhKQUsxQxRSGV41L
	NNSlNEa1fBzrrtixZpdDwPo9DhTzL1i8VVF0gTgTL3K0FnZTzEyPYo8r4FJtNsVVXvHEdyCKPI3
	Rry1wy/3FGabRmic5R/5GsBVvDq0x31awp5XTrU486NpdubIQCtTL8aMGj0VMKnU=
X-Gm-Gg: ASbGncvRFOp+ZCIEEI6sKWWp2ZO5+5Y7inWo6kkycRWBti+vUYSjEcfA6LT74DU2a/K
	TSyoHCgcA/9KABKK/g9CLGUptWfbYRSF7zLw0mDGwJtrXmdgaJ5lXlqzlHVQekKhzgiIxkNj/gC
	7WouD/apbex4tqgZVTEPhOr82WMtg9KCkgEFpfEguJC60gb/O+10q8YhSex4f5OdbAX78ci9KyO
	qxDCImjikZn+Wyeig7q9QWJxXuFmeXJ2dVMEOpM06GUPTlUVMlq3yDjNL5FnlxFzp1sfSPPnhka
	9znyZhQZiT0pg5iZO815+6y3mJUlWL051ROqPXvMFeF+4ImBlVaPZeKi3RPtGSkYswc=
X-Received: by 2002:a05:620a:2584:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c94d234d2bmr199585085a.3.1745413271771;
        Wed, 23 Apr 2025 06:01:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvC0BBlTo+m5g1Fq3RkWdluOAVAwUmBFljOPIeXR01i5VEzyjJw3LAtEQjfmCHpr6YmNfHig==
X-Received: by 2002:a05:620a:2584:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7c94d234d2bmr199580785a.3.1745413271071;
        Wed, 23 Apr 2025 06:01:11 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefc72fsm809912366b.101.2025.04.23.06.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:01:10 -0700 (PDT)
Message-ID: <6662b275-6b8e-40be-b62f-c17ae8e63dfa@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 15:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Enable QUPs and Serial on SA8255p Qualcomm
 platforms
To: Praveen Talari <quic_ptalari@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250418151235.27787-1-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250418151235.27787-1-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OlycTGwy4ggMjBxcL5Rwp3O3QUsW6uWX
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808e498 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=TM_zcG2lH5YfWnRg5aMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: OlycTGwy4ggMjBxcL5Rwp3O3QUsW6uWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5MSBTYWx0ZWRfX/7E7GbWl1HLd nmY+RMftVVMLXAlt60epB+fPXYnj87H/ydIgtjSTbkgrROlNgSIpbcZk2JtV53IyveVtGppjCWc WzOzfphel2N6AaGcSTt60eyvF4JxC+OuKqe8eZBmW04AKoFeF86sSoURXCGiaGT41t24xunAMjI
 EDYEK355Dicuv3V22lXEejuDezilZvBM1Ky2tfibMhMWXsJ2/qTIW1t6kcby5293q8htPE2FqHp +mhwcdTiUwwa6KND1Hpi9BtqqtKuT0aYXuzFAtIuqITKaUzMlcnKDiGB3oh/Y2pkgmpt+bbOXgG r6t+1d3nrXWuntmEhoMXoDlFPdj3HkPqPBKhvZxMZ1ouRDKLODOUSH2lbTqowDYWNBGorIPEOdU
 PguZpD48FEGe3Ttawzy3BPiJp/SqupDFYf2SFaZpZAy15jKCJv2rqlDeZVRCTPR/FTNPyYWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=928 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230091

On 4/18/25 5:12 PM, Praveen Talari wrote:
> The Qualcomm automotive SA8255p SoC relies on firmware to configure
> platform resources, including clocks, interconnects and TLMM. The device
> drivers request resources operations over SCMI using power and
> performance protocols.
> 
> The SCMI power protocol enables or disables resources like clocks,
> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
> such as resume/suspend, to control power states(on/off).
> 
> The SCMI performance protocol manages UART baud rates, with each baud
> rate represented by a performance level. Drivers use the
> dev_pm_opp_set_level() API to request the desired baud rate by
> specifying the performance level.
> 
> The QUP drivers are SCMI clients, with clocks, interconnects, pinctrl
> and power-domains abstracted by a SCMI server.

So I recently started working on abstracting away power controls from
the SE protocol drivers into a single place, among other improvements

A snapshot of this work is available here

https://github.com/quic-kdybcio/linux/commits/topic/single_node_genise/

(not yet 100% ready..)

I think it'd make sense to get it done first, so that we can condense
most of your changes in the common driver, where we'd swap out the clock
handling for perf level setting instead

Konrad
