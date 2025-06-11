Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FB20EB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749685835; cv=none; b=G4rpzAxalb+huiyKiAOzr5OqikLe9noZ+XCj0mdf79ro/uSOsNCFeaWiAKxWQdfqjP6D9CCnRlfzUYF7Z+OUQyCbacSGd4BYwPVxfH3dZBKOQoAxRxM5HJNL0v/oVVHdlfe7R7+n80vNk1LBmGy/zLY5Rz1vHBeipkafNx28TpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749685835; c=relaxed/simple;
	bh=n0e7INgVxB4HR0E5dtVq3apkvTC42DhlTc85mp9u8JA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe/k7d9cWg8bpoay2Qp1L/YK3i+TJCuc/khnAIQdGN+zWp94YQ6BUaQ7MpaUEDB6kBjczh4b0henQNLl3M25yTaacyMv/OmgodMFKu5ImePVM/FzEdo6qTy4ePZvR/uMxRDq34HU2OO6pD/ZZQ0cCoY3SNQYqv/uiepqhJpq+pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9xHw1ko; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9xHw1ko"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BMFesd000673
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjKLYbO95DLdnG7w+lxTMGvN8HI3D7bK+1IxSfQZCLo=; b=X9xHw1koVLpFyh4G
	fIOl3QFoLERch0lLyavYbajddEtmQM9Hg5RTa1iDpIPaSCHOKok/CVhQHuoBQiwx
	jdTZz82EsAsBB/s9jYgjZ8DxVJW6lwlgkMVsyXhEarnSSBgrkV9vJxzX8JQGUVAE
	YJbe6Dnvxg3DtbOm2Si0+06UlD6Ca60NEsUwDXV4SejyIzZidJTqJEmz/RT1iQQg
	aRdS47aY2uHQ9cvyJWMdCw0axk/caVkmtWN0Hm+BYjllkWP5WefiMJDBz2vC1OLa
	QDv1EeUnO0iILYZNc8KKYdX3MFzVffc9dhZ+SeLfTuBGmy8qU5S/rmQQ82qHEd2j
	Um1Tqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdwr5xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:50:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caee990721so91858085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 16:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749685832; x=1750290632;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjKLYbO95DLdnG7w+lxTMGvN8HI3D7bK+1IxSfQZCLo=;
        b=qPM/DGdR61jyzOYTWgLuRqRgf7Va0q5WudHturbKmkH0h5bdgS+fq038J2E6ahmO5I
         0fUFTGT6beGeZovJmxDxpjl8blYJyGYzv/6NgXqYIMEaXliXsvbi+tj0hdZjrpDFAb17
         1MdCkGWxma/JpKyW3AkepdwirpM+o9XCOHGD+b9PpJuzIvMk47tJ6admJy9Wg7V+RUdH
         s6sSdxrj/ba2tFyec4lerp6QzbhBTn3cL1dBqUjKgTzCDLyuKYQzxFdvJqRRjlyZo6TI
         pIRQ40PAWXNXlfG7HrXxKzrVXHQpfSEScwIRTH7/Mkq3teDF3s5ygqhtaZHdijRiw2B9
         ufSw==
X-Forwarded-Encrypted: i=1; AJvYcCUS4BRr1KH1jOXri/U0+Pcv1Uf+/BAUwU6bVUEofcSXhydxNNTyAVDizBdeFeIHBxqIscG/KUpn6rhnYUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTK5eBgDQi3bl83zKneZqxWCW2S9eXKFvHL2GXKiyNKPcxysHy
	8MCfk8vBnLA8+Xd3Gc8atg6UE7xq+qetUtXxEcUcTVpEixMUBCFfB6siP5mGZxp20nX+0yTnPB3
	kjuhbOjWyWmXQ9SX3nH81WgiYgCgy9G1GZgrsLm6huQOvHflv8A/MPZo0xZw3pGS4v7w=
X-Gm-Gg: ASbGnctdUHr1zjr4cSpHMzA3FVGOkfXufLjGaRIMOOpumohO0GAcrRoBXT/KhgRO2oU
	CdzTqpRh42Opg0bChIWpRpvNYdHbNcA5cUWcrgiJiSV6DNrexmjay6WaUx9uDTfVMZqTu1AXICp
	Ke1SVaVxstv2WrgC/b7TkZUk0C/DVRo9WNba/KNY37ICp91tMT/TXB8bXsZCeNL0cguA6XbrgHf
	ZevBhPPJXWIbTfMIf5pc8K2sx7VM1jkQP0tIhjvmQXT56AnyTCqh8RhMCE0X8hSpjxT3sDTCgeY
	uHWsFxTg0DpSu1oxlUh/N4/H9Jv4aNzG7dGKfn74/gprUUjek7lAvyTu2cw/JYKMRZAd51KtBtZ
	xymh+m79XLUGIgKDw2zWVNWZKBsWsgWYI5Bk=
X-Received: by 2002:a05:620a:3195:b0:7cd:31ca:d76 with SMTP id af79cd13be357-7d3b2a58bfdmr198251185a.33.1749685831924;
        Wed, 11 Jun 2025 16:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFseGq/J3dqksP8dXd/cymzXG9fmBAoH7irwZknLQOdL01xeRG37+7d7pXMTZO5pGH7IJ6dww==
X-Received: by 2002:a05:620a:3195:b0:7cd:31ca:d76 with SMTP id af79cd13be357-7d3b2a58bfdmr198248085a.33.1749685831517;
        Wed, 11 Jun 2025 16:50:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3304f39csm321391fa.20.2025.06.11.16.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 16:50:29 -0700 (PDT)
Date: Thu, 12 Jun 2025 02:50:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2] dt: arm64: qcom: sc8280xp-x13s: amend usb0-sbu-mux
 enable gpio
Message-ID: <bjh5q4kmctc6umyg6iti6j3el5iuaaweqxqk2mrzlj35h263lc@wkdecz3pgltc>
References: <20250610-x13s-usb0-mux-v2-1-598454e6ad64@oldschoolsolutions.biz>
 <aEffYQND8eUgJbua@hovoldconsulting.com>
 <64d963bd-b38c-4f14-bb1d-f7e89dad999a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64d963bd-b38c-4f14-bb1d-f7e89dad999a@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDIwMCBTYWx0ZWRfX8NI6+2FKP/Bo
 yNNHLvVDNQSVOvllrPFvznPJBKKygL9E6jQLyDzBlZgV8SOftGS8+rNEpo2u43+lZLbamGYf5ay
 jeJ7om3M4hBIahikje/tlidOePwJaKzch8hAPEE+Eb5sz0IhITSoR8I4QLLRXVo9qxse84iDCa0
 trakQgdTkTwQ0fn8+hl05Kf7LYX6OGc+EGNUu2S4ySnPLNRNWRhyproSfesF8MflGUN5pq9kLUq
 OhpzdpXCrykqZI2QUnt9Z6Ry3+V5COzqBP9Ewcc5Y6FRWAek0E2woWT8237P5GQrmTQzVmIZSpU
 LQ+UfrX7Dq+aoHgJaXs+QLQRJt0XbmegfLEPS7xNAaZt8b1TSlwMD1CJm1/MIWNKZ7R27YfesNT
 7KEydYRcT7X500+GtS9hhSyA1pMJ2gK/zs3MlOqBqfjUMNACS5unvDp/U614h9hvW06EyJiQ
X-Proofpoint-ORIG-GUID: z2iDmWn8jr9JalSFKoo_jREsjlFZokvy
X-Proofpoint-GUID: z2iDmWn8jr9JalSFKoo_jREsjlFZokvy
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684a1648 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=lRGrZvPa4QksXueXqpIA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=717 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110200

On Wed, Jun 11, 2025 at 09:25:20PM +0200, Jens Glathe wrote:
> 
> On 6/10/25 09:31, Johan Hovold wrote:
> > On Tue, Jun 10, 2025 at 07:04:46AM +0200, Jens Glathe via B4 Relay wrote:
> > DP alt mode works on both ports of the X13s and "resulted in
> > gpio165" makes little sense so this commit message would need to be
> > extended.
> 
> Well, that was the problem. It didn't on USB0. without and with the 4 lanes
> patch.
> 
> Observed on Windows Dev Kit 2023 and X13s, what prompted me to look deeper.

I have verified, on my X13s (21BXCTO1WW) DP works on both USB-C ports.
Moreover, according to the schematics that I have, GPIO 165 is not
connected.

> 
> > GPIO 101 *is* the OE_N pin, while GPIO 165 is not even connected
> > according to the schematics. The mux may still work after this change,
> > but you'd be relying on it having been enabled by the boot firmware.
> > 
> Schematics trump any other data, of course. After a lot of tests and some
> wild
> results I could narrow it down to the display I used for testing, iiyama
> XUB2792QSN.
> It works with HDMI adapters on ~all other displays I have - with and without
> any
> 4-lanes, lttpr patches. And the original GPIO. The issue with the display
> appears to
> be something linked to how negotiation is done by it on that specific port.
> 
> Do I need to do anything since its already NAK?
> 
> with best regards
> 
> Jens
> 

-- 
With best wishes
Dmitry
