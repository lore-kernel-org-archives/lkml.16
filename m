Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3923909F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750455882; cv=none; b=WV5gJlE6oZtoEhjmBGMI6LhmXHuYe6KsKxT6s2vjZKeGMHAWQxIPbFryIelyShXw2zr3+cXJOxiGvyfSOaxIAimKtmA+VGPFRrcF2Jq6Iaxf9xLwg63QIJ2qHCUc23BHcPPiaAtotVo5GnPRBngNF7OO5OkKgz/nFTLOqDW6LNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750455882; c=relaxed/simple;
	bh=YzcmdcxDrTekUG/seNJPMliDEDlcxMooWnagOOkCocw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKyDk/V9WfqgoqWSx4azsYCiNbF7TQK8dSpPO5bkvP/tiCp94kPcUiu5ztyzhXyI54JbQYNhx7vSjJQTdW7ONumld0wUf8Zu2mQFjAFRj6E1yvWmjcsehunVb3/pSFM/cSaOrVj3RPxPZa9ZS1KhWh2sLGDxoDT+iMUKj9+kDpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oj/OnBdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oj/OnBdd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KL9kCc000809
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ctwi2DOqfjI225KB6TOH6mB5
	C8TUDi02E4qF9W2x+qs=; b=Oj/OnBddlpiCI0Z5jn8m/1LaNtcIfXnwUDKZVarA
	8fhvrVFSdvAFaiBYnsfpznrEZZNwD69Gy9fEP5ssJSYSRNzgwNcZKD2Gzae37R/e
	WyKbY1QrBWF/QT+jOwEaUvnOOsWAM9OEMCFXNbGXLOyKCecPrT73RONWFtQrB5Li
	HF1YbVyEc1zwwKhzsbUGqGj0n6fl8QyjGOlSXIxslW3swm17MoV/sn2PjKS1RCVX
	PyFWWqDhpcmu7taBPB9NZLg5QUMH52GvcTasH7sHgFOIpch4Wvi+ecwU52MlqPhS
	AF3hBkoA6Ol08L+ySrLGnBMH6cK66CpAt2K1aNPvl4eCSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dfag01pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:44:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ceb5b5140eso340545685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750455878; x=1751060678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctwi2DOqfjI225KB6TOH6mB5C8TUDi02E4qF9W2x+qs=;
        b=Uky1hTQTU9kVfwDPo8qwFtNt4D50GDP7rQYjmjNlwEbby2aEFwdqKCpcmycLgJFu7z
         l783loZEDJTUiVNDjCNzeAWf9bUGNkKrMtYugS00K1U0mTk5pwQuG/npbxn8fJ3dGKEU
         rwj/U61y6crO7EG9wWiErZxBcU1fBOC0CAmMUjs8HqBSprsP1WlF89PGRVcoLjv4DBY7
         4ucKDtgJwDJOXPzNQ3kFhlilAO+XiGqcwha7VX0SOX7zhEwZAxU/crrHMVbVXyNygpbm
         GjTOqT16jBBnv6x6V7Mb0y1RPCnHkA5YoO9uAdZvAQQDkDol3mOvKePEFQ9fPjbeXz4C
         2W9A==
X-Forwarded-Encrypted: i=1; AJvYcCWncJVwDKoXW+i9izWq5dFIf1KrBkMI+PBRDFvPThSLQncy0L2b3lLS7LD4qW1oz5UPllqTB8Y4383szbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YywDp1WoS36bYqgd4uYZFsAEQP0qwTM+0En5jJQ0O6SH38buQ+k
	+1TX1v+D6HJgozD1Z0vBnHZJWwyKBTz7mx2kQNiGC219FmiTV0t2BDGd5fpi9YKoxnRn6bOFEyS
	I8hDYKt7BJ8NSHJLSc2b/wjMJNsh3wSmXnUueaDVHmURhBVA0Nc4v4SPoNr7n2PB4mqU=
X-Gm-Gg: ASbGnct4jU54J/I5O1vfv7XaYd31jd5n9p+IESJSwk9wpSz826iQDTOFOzcA+YiIAjS
	dhqB12ptdoplEbBgYr2EOxu8fhJj1fokwsfuT1WjJR6RriDUUV3KkwuGj3F+LZ2GHBOmcwsBwsX
	NiSIjPEU4ItEtsc4mG5Xva+dnmIihHNIBQxTJTzBuqIrzUy01LXy1MW80RI2OM4K5xQuWVqlKUY
	TpQ+dUYNXSwbzUaT5rnFL2Vo+t8hwMGdSGpe7tJ7jqjz1dvFErmeLaflLJmhsFXce24j/M8lLuy
	3tAfCzWElbqMTc7fYfFeM1adHyHV84TE9v244iPkDSi1QM5wKm8KH9WPXzGXlXSEm2TIJzW2HaI
	8rQXQ4EuzeITREaIP/CmfQehOZenODAZ7Q1w=
X-Received: by 2002:a05:620a:25d4:b0:7d2:11a:5d07 with SMTP id af79cd13be357-7d3f994c66fmr697119285a.51.1750455878658;
        Fri, 20 Jun 2025 14:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZvdnmqP63O5PRRl19Y/9Q76MA6K05Mv4i76MtyquHA2RkydgG8Ih53vLnCssRj5N3PUcNOQ==
X-Received: by 2002:a05:620a:25d4:b0:7d2:11a:5d07 with SMTP id af79cd13be357-7d3f994c66fmr697116285a.51.1750455878264;
        Fri, 20 Jun 2025 14:44:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a3631sm4223561fa.67.2025.06.20.14.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:44:37 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:44:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 03/11] power: supply: qcom_pmi8998_charger: fix wakeirq
Message-ID: <e523itylvfmikypnic7exgrnrtr6ocjmlvtozmgbhqos4lpcdm@rfsqiezqb5p3>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-3-ac5dec51b6e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-smb2-smb5-support-v1-3-ac5dec51b6e1@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDE1MCBTYWx0ZWRfX4qV2tEgTQJ6P
 eJIh0ZGziyVwrpQnYFMQLv8Kdu2fy7yw4yhNyB6Jdw19alLLkuu4v23nPcVUsyTbFEZMweEbp6N
 s/AZd6CA1Jrgp8rrq5Ek7wz6iifXZE2imr7vBeTMNj5PTpnV5+cOZmIwGJVAI2crixWlNFKWNP2
 wjzGUl6Xwt63UE8nSJU294RzPgwSXlIfsCXQe0qy49Cj1VlOiKzZYafXlF6krJ84t/Y3gIigCut
 IKAVwc6qtfxxWu2gdoxEGTQy90QJpS5Vfy/+wEweZFmKWiwxFaLNGYvaBZvudY2l637D6DwEpeU
 kdA9dpcSUzlcLTIhj0AZ/RDfhBqmcCZ+SReayJQM25hCRX/W8aBcCv7xn89HGMcPNHMcdOVbgqC
 C53BxGRUZ0ZtARDQH6b+DYd+m8D6kjIt9XSI53E12tBVfqwG54JKaH1XPOBoq3TK4QE2SJ6s
X-Proofpoint-GUID: y-Bl9V9ScAbHG-rDTjZI4n2j8QZJScJq
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=6855d648 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=QHKHbuR_x138-IVXrqQA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: y-Bl9V9ScAbHG-rDTjZI4n2j8QZJScJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=848 priorityscore=1501
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200150

On Thu, Jun 19, 2025 at 04:55:11PM +0200, Casey Connolly wrote:
> Unloading and reloading the driver (e.g. when built as a module)
> currently leads to errors trying to enable wake IRQ since it's already
> enabled.
> 
> Use devm to manage this for us so it correctly gets disabled when
> removing the driver.
> 
> Additionally, call device_init_wakeup() so that charger attach/remove
> will trigger a wakeup by default.
> 
> Fixes: 8648aeb5d7b7 ("power: supply: add Qualcomm PMI8998 SMB2 Charger driver")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  drivers/power/supply/qcom_pmi8998_charger.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
