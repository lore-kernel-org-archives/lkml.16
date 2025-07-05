Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009973451
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 12:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751719593; cv=none; b=PbRMN3b2IeqfBgwQiSZAoaDmMUks1BWeqko9TbV4eNWStUvrqvbFXL3qrFmGP+voJgnda3XgTPdy1oDm3DipYjI6k4NEblFq2r5CSYaJk6qBVadCM/+jp95zQQ3Xn+2B/602NTLByKbOn63EtU7FubBbcTw8HBx9pMUlT4TuuVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751719593; c=relaxed/simple;
	bh=+QWiZ3k/zz6MPehIUlRJoQCAmNRvIffiV3ZDmpUjQDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhQSSctUA/MJZyegWUbo9OsyKpjCA39pL8O/QvUhKArdjyrvDmRWmbrEHNRAjXpF2mdeKhL/C7HJ9J3ByuHK4Q0e73KcbH2alVbZ/agceY51gyr8gXX+xpF5OsX/0yc+WWIWH1gUcSnL1lGVdYdh8d8wVagBFXex4EyO1W04EEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VoPZOof0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VoPZOof0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BI5V4026008
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 12:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UYd/QM7kNbzE/0+JdoP0lyMt
	hOowAH6D1Fe3WmozC5E=; b=VoPZOof0xNRKqXrdnvvofYojgiI9T+HjtAWrg8aS
	B3XcsHsjyi8KzxiDTtkGkmt3rtEbf05Y8Ijqnf71yBpYwBqqP0wS5gBb/0zNSQ0L
	2Y0998l7HoU8TFVx112FhiSDWxjW6D8CN8EJguxWHrDTtbwHfDKOSIkDm75I+2Mu
	ocTxI4rrKsbmXoJnPYQsec0j8LlTyRfKejMgyoJwvmL8ic2NRvvSPRh+ypKY64FX
	+neBCxK1cN0Iju3SfLHVjKvVtHmUYG1u7dQQ7wr74ZZ5jw82OoEicGgeiKEulmfO
	+jTLS6cQGkiVv9wlkh7fA+D89ruIML6f8ODdbrQFsNlckQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm926c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:46:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so455023685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 05:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751719590; x=1752324390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYd/QM7kNbzE/0+JdoP0lyMthOowAH6D1Fe3WmozC5E=;
        b=jMicQBjMQ6oaD5LF3e8XcMjpJJvHQZ2e02dpz/crlXpLAL1xrAdUrkKlgHgMWGy/ma
         X/CVgrKBVNI8vodaY3Wt9IerjjrlFHq1Ajw/OxmkNGvXJJqkB4Q4+tMQDcxPytjCDR3+
         pYLcZ6iJz8ueMEdrLplxoP5B6cKI4yRgdIBosctutqAQMjoG4JWJxPtthMG2YWt/T36B
         Qi5Z0kEKD+pBmVdoalq4BvH9TAeNHhaLub0/fFH1jOTMKj0btJcnttk0ZonzXHSpKOLW
         F9fLZmaxZDifmTEtOtHSMAL2oVIbBzuafADQxR9LO0qKTX0mqiyvwxqj964TPyoj9aJX
         RPgw==
X-Forwarded-Encrypted: i=1; AJvYcCUI/HvVi/qMOwCtQ3NmVEGGi/1dGDgtpp/X7b9dK2FEGIkj4OzxIwpmOYkEJsYVhIP2+/9FZQVMMYN8oek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ugxpCVzHLjYBgK2KhplVvLc34d9PoquxL6hA2obw+4Shh+3b
	wmX9KFWPxvlQspW0YpQyd4CRUfXPACJuGLfbXNngYSbsd7+POwvzADyyA9npGToOvdEZZbdUpT+
	KKYcHW+m2hOpgBp7KOzKzky500NXXvonatezPOcDT2Rz92k+ybnWyPOB7nBtstfPaObg=
X-Gm-Gg: ASbGnctW2Rf8QVu8Cgcsht3TWUO8bMuYHZLGHGrzIKJfD1DkQ87KSUhIhMD6tGYf2rO
	nHKemBKqa8P2SRs3fQ4uSzvhoaCewHZ+e5uJdfvDgjGn9npOmM4UqS1XX7mkX1Z7oobAk1TkI8P
	9j880tC7hgYWGtkjWpLHJNzklOpdYgHb93ESn1e1MD4x7a2mQjlMKgv5DIsXnWUaWrotZ4yvn6G
	IPv9Bg34PLIG3nryYceBxcGC/eFPtlLmuIT9CXjNJ8Z8htPQLLOKO8uRGcN7Mdy/nkYE5pshe5T
	1fLTIAObsKA+c9KJrZp3JW7kSc45u+gGkIG7R6bfrdRvfCNf4UOXHYETePHESY8zbNalJRbYXT4
	ig01r16g1R1BUOcXa7spWXbladEMlo8yUYU0=
X-Received: by 2002:a05:620a:2947:b0:7d4:53e9:84f with SMTP id af79cd13be357-7d5ef3ea607mr271221685a.3.1751719590024;
        Sat, 05 Jul 2025 05:46:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsjh50DSBiojtn0YL0uID2TDa0qxeaMgUcWU6CWXdfPuVnZLYCtykVVhhYWDqjL3aJw+mepQ==
X-Received: by 2002:a05:620a:2947:b0:7d4:53e9:84f with SMTP id af79cd13be357-7d5ef3ea607mr271218485a.3.1751719589582;
        Sat, 05 Jul 2025 05:46:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d2fb8sm569861e87.58.2025.07.05.05.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 05:46:28 -0700 (PDT)
Date: Sat, 5 Jul 2025 15:46:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
Message-ID: <fvyx662cayttlyrniyjifu7vi5sflmptzs323wm4a7pey7ethz@o2xq2j4ifwx4>
References: <20250624122933.54776-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624122933.54776-2-krzysztof.kozlowski@linaro.org>
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=68691ea6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=iTZVlg6EzTYP-dx1yXAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: XNNNgdkBQsH0HHF2DAC-SHvpuQNM7R1C
X-Proofpoint-ORIG-GUID: XNNNgdkBQsH0HHF2DAC-SHvpuQNM7R1C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4MyBTYWx0ZWRfX7QcyqHhVv771
 E3UdAA1+gMH7K24a5eTjo7dTbWIUCILmHHz8DTHQdHqjXXc7L0wUb2zIyU7EjXWQjOt24Y6M4NK
 1qh0aYy1Yf/OwsmoOEC+IMgt8t/0ud9jDrTfw7/5fnHtyZ0FzTcFLEoUpYFY5uwTbl2j9E/th12
 F6kYqIcmw57eLAVoLV5FJUFQ7eYCcypkLCQtaBNb2GST5SmmaJUqms9FYhiy3jWQjJxn3xiyhGt
 otwWihtziAbZcP8u3c8xihRDX6Tz9ng83OtPwcYA8AaGJ6DRsVznlanKT4MS6wovyT9LT+JRJqj
 pOTQ2wU8bpzI0eFHdSKp4mgZ0Z+C1eVEscBz2yWIR3VK/pDUn+FbzMix0ACIJT1Gc6NtfiQj5Yr
 jdfthlz/WsRfs14Sz/8Ved+rJwu7Y24anwqKw+pEZiTD+LpXuIXbuaYioaLgP0bshb/DDWQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=730 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050083

On Tue, Jun 24, 2025 at 02:29:34PM +0200, Krzysztof Kozlowski wrote:
> Add support for playing audio over USB DisplayPort (the two left USB-C
> ports on the CRD device).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes since v1:
> 1. Rebase (x1-crd.dtsi appeared)
> 2. Re-order cpu/codec
> 3. Add blank line before status for mdss_dp
> 4. Tags
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 36 ++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

Just for my understanding:
- Is the corresponding topology file updated? Will this work with the
  current topology from linux-firmware release?
- Do audio drivers handle playback if DP gets disconnected or
  reconnected?

-- 
With best wishes
Dmitry
