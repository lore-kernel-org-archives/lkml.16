Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA728DB6D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947930; cv=none; b=lz6LJXAzKmfDZsuyCbC/yUBOIcwtkr8TVHmt3/vDbY4RduO/xNDm9KN+x3ktOoti4Ihga1fGOeEHoKOWXXX9RJcvhiM+oLQDExlP2JQppwRfx/t+jFQGk/NUFHYoLsjyFle9yfRM3m9TEX1PM7gF0ArT0hDVDPYBoUKucuoxxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947930; c=relaxed/simple;
	bh=UaAjEJBTuFQqZOwclYKXHCLOJefKqZur7hye3tXnyW0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OoVcTOpMXvwpDxz/ZRTo1XfK4xxVRTbYwZOq4GTTcqX0W9RPcKAhkgNqJK4jQK86Rq00W74J+an/4OzbRKbRIARo84twSsEwyjfwIffF5d+n6gnHC2n1RnW/bCi8tEyezznkNIRlklnfrIaOnYfK//ROuIssx3NbkgEuPYG8UAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+uWMRyj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+uWMRyj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9jTVI030142
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:25:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9NBKieE2jXv5JohaadTIjJU9
	wkNY5qr2lfsmoE12q7s=; b=J+uWMRyjsA7wHWdAlfudB9l69MqS0eF4jc0mq/ud
	0kZOxn8JJVOzMYcGn/e2OoFmj0XSJ+t9z//UAG8dnNeo/KZKLIn1KrIMatLfohvZ
	wGl4oTyIIvEtpOiyFUx6EFxJKlN5G53LC7AdJalwYkwPXeDb45t/twfAEQHEoEv3
	K1ao8oaE2+IaU9USMe8f3HFgbZYaOTTYToI0AYRi9wl4XEU9SaNVkLusOzYd/ud+
	Pep4MYbUNr2ZILQiCKgBsSmBKsTRQshiZ6yzXKfyT3PgsNQUfi4DRahQHPjVhXO/
	Zlx9HLT55mpvG3D6s3yhn0e+DUzFAiR9RnCAEF7ZUS/lqQ==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4vvud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:25:22 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ddb9c3b6edso13531065ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947921; x=1751552721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NBKieE2jXv5JohaadTIjJU9wkNY5qr2lfsmoE12q7s=;
        b=OyIHKXbrxogGhBA9UyUJBemNwMmUtq9IReQYvWDmGGbkiv8/SK2Ly39rHqYvg2zY19
         bN9ACejpVMRHs+9abR/lQcgUdCsBeQ8O1UhCgQ19fDsixLOyLs2Dv4yQ9Bo6nvekF+/8
         ecEAiPZPvTwOt0f7p/GyLuvksGEWjq/xY0kt/MyaoHbuibs1hNarJvwYVJ7jpxGqR9uB
         mB+CB1TGau381eLXlQYSg5gperMHSxxHD3AIZniFCw+T7cpyCtVlB01JAgdFEsHrOD+n
         us1xfLNrysWt2gpX/D+tmHGnytgnHKEA1GzcrT1Jg09Ph8jT+Ejs9RKtOI5C9E/kgUmT
         xBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9kfuru3jjwPT9h1zI3SqnJMgSDcMLB7ZPqMG2Pfi+QLF1MrrEfNI7bB80XKiVdKaY2RkkWdAe8ACf3RA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5RXt90LYroLwTnp4ZhyOkN9dK1xYNWrU+knmbAtl/i9qq3g9
	NxT6G9h5aIttuqHlEdmRy/4RmXpkBBEc6T2BgI9P2IeBhgRcRUV2XPLaA93AKvuRS7gqWzjKbdQ
	yl1eweVP9TgcGfLv96hITgaIiIgHY37fj+gdlb3/0me4ec9s10nBdZFupXLLFDkM5UyE=
X-Gm-Gg: ASbGnctaGfloQBBp+PEFbuggXX9oDDNOcUMu/4zHWxpyELAZpyV0jdrReDctoYBueRd
	JG4mjVNaxvEu8WQUsLNm8JoeeHnRqeRH5X/RIIXfaJe9V3rOCLvLhZ/l2kfhZo/PFTmuXWpZJmT
	5UkQpULXgxcvEM4ouzxKgRtW8oXJv04HpFOdua6Kq5sDH8XXmUqTWqgOf7Nv+hU8qvPo4Ng+laM
	PZ+Ad1UlsNcD80092R7E2KUPnuTXnd8LjrCPmH3S4/CGY1jRKs6JvbwBZf3iMBKGe/NQShkoLfG
	o4HbDtvVJiw1B8jORGsrh1X44SQOXe+FX/elVFySk9QJWraKNv3u8ag3AQ==
X-Received: by 2002:a05:6e02:1a08:b0:3dd:b6b4:11ef with SMTP id e9e14a558f8ab-3df329963ddmr85595005ab.10.1750947921305;
        Thu, 26 Jun 2025 07:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZwru9H4uMdVnuVCyUrwh8fkSlplx9chY9TYexo5hJ7asNWlDuOKdQ+3PCVawhe4C+yxM1EA==
X-Received: by 2002:a05:6e02:1a08:b0:3dd:b6b4:11ef with SMTP id e9e14a558f8ab-3df329963ddmr85594565ab.10.1750947920954;
        Thu, 26 Jun 2025 07:25:20 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a407b63sm21209855e9.34.2025.06.26.07.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:25:19 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 16:25:18 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, krzk+dt@kernel.org,
        bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
Message-ID: <aF1YTmxF0pAVDFYe@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <08e3c707-3b39-4b67-ae9d-f9fe65ad210e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08e3c707-3b39-4b67-ae9d-f9fe65ad210e@kernel.org>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685d5852 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=eotat5ZnXjsHnA-9JakA:9
 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-GUID: lTJLdxlHe7G5YKEvWl6GFDmeGX7sKhZg
X-Proofpoint-ORIG-GUID: lTJLdxlHe7G5YKEvWl6GFDmeGX7sKhZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMSBTYWx0ZWRfXwxTRd1wtb5c+
 ozUoxyDsq4lDGNli2bJiJIhdfwOkQPsf3yIOn4Pnf6DUSA9SZjBE3mhKoQmZ0mso9We7UCuWKjx
 x3TxqGy0k17z5ViPUbcmSxYYafHuIgMHoZ6uXdQAzhHqXWkAMfbcd/cltNaekMfI0rzbJXN2MGu
 cfKSY+hKRdtHQCVAt7KFVrzn2ytJ0sIEqb2rIeJhDKwNHefuWbzm14JJAVF3i7dZOfCPV8r/mb/
 hMox9I4tP8/qXgqzk831z8fqXRjpS/j3uB5MdEx2Bzn3/bPp52rYV5pqw1+1PS24amU5RNd7hQ+
 zQEZn9gCa86EObcH7u+zrwlK/Sa4XyS/+20C79FuEly7T+3wlSIOJ4rLHzGqcF5TvDAbLmEhz0G
 2gYcvpRprWa8Wv9wT9hnB2aHypj8+bmCHTbcc6cOEtKH7/CM96mIZhzIUBIJ1YLsTRqbAeLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=753
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260121

On 26/06/25 16:05:00, Krzysztof Kozlowski wrote:
> On 26/06/2025 15:59, Jorge Ramirez-Ortiz wrote:
> > +
> > +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
> > +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
> > +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
> > +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
> > +			interconnect-names = "video-mem",
> > +					     "cpu-cfg";
> > +
> > +			status = "okay";
> 
> Drop, unless you override existing node, but then this should follow
> standard override-label/phandle syntax.
>

yep


