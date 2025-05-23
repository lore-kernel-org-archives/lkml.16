Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96E9227B9A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996840; cv=none; b=leGDmcw8dxqUkp2RnKkvFfdElTR01xnrzPlYFIX2eJM8oz6Js8VyX5ruvtikqcFnFn77j2E6oXpyrNTWRwYm36Dz1mL+yP6OOaIkjU3QsLqoLIv21pqhnV/zdh93fMGE4jfp6jRqSzbCuAAzfaU6esXdCN+Q14ms2sML+LXAfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996840; c=relaxed/simple;
	bh=eKIzRl8whYmJWRgMfRk9qQKPfGu9eKHJcVMsUR4mLj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwd/OZXlTI6fj2yf6kX2dFNcnbQHg/vwJ5mcTVx53w0e//vEcf8BOXdoi0H/uO8X1Xm5cQ3qK79XDgeuMlBTbz+SWpwGG3RcqMJiOz3CBJ/6GiCR/82eb1D1j3K6w68ttSsyMq5Aqlw4YgVTqAyDbxopSxuz7SAYyz2daoUoRFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HY+I5ncq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HY+I5ncq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N64G5W000847
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0aghzPgQSrTSjyV0pCADhW62
	t6nUijabrAzu/vTK8Jo=; b=HY+I5ncqvifCWHefGImMTgEXCKpLjrdjN6Tqhhp/
	ZRuVeihl9y7GTPswJDChcclA8ZSfDMt73COkpgH7H5n8HMRARLpfyBjkeMK9N0iJ
	ijSdDU0W8bhD5M0kOL/S3bjaReK2MeLiWBSQURINerCrUcpn9wD7mo+7Ubp9WHH5
	2D5+Li+JjLyvvfDsNAx5vThtu5kI2gmPDltfhEkUWJSJ7KSB1ra6Nm0TuASgMwqH
	y/k4hosLmEMDwhZZIPj6tZQfcLn2GSe/uZeRuvwr2jBjyTlGBrra4x/BU+ZS1E1c
	m1xqoY3pkmfspe6PcAb2PlTtwcXrpkxLSQ8dYtGstyE42A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf71jyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:40:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8cc1c047dso92273966d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747996836; x=1748601636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aghzPgQSrTSjyV0pCADhW62t6nUijabrAzu/vTK8Jo=;
        b=w3JnzZjSuwq7oMGgU8b/i25qtfx+bwd+9n8PhTqd8Un3PIHeEjNt6TeUi+20GdAgT5
         mgL2F9taqxECEJQWUhzSH9QnNm5jYeZwvukkYMm612QMp8vtPKxD7RFAw99jqjfJ4jMF
         FZI1zi4hR6b7IubeCg64GO0dNYEODrGI6Wom5DIo+Y73nw8UbctoquSj4YHBx/wAnoeB
         +q6rv5W0GOhGNGAgzNe9/UlvpQ9mFgxBhmeycq3h2Qk14XX/D4YgrYXRrgCKkMGSNMQ5
         4en5bGVDVlVj2OBozuaTa9UGZGmrmKxmqYs/NJFPPlPB4NGfVuL70Fy2kls3ajf81jRh
         7sew==
X-Forwarded-Encrypted: i=1; AJvYcCVgvq82xwQaQIMyxHsEVXnR9N6jLih1XBn4FkXU5XYiT38+AcETZppRvA7f1wgFRjFwEwlkUX0Jl2h20eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYJMLNkB2/ZMVOsHrxSunKVYWxF5/39lBk9vrGViEn5iKeOmT1
	Qr7or8rxcRxKIvN95y/I4bCGykp9UluppPFjgunTYFA5DnIhujwxAS4f6NbcmrQYm6LAegUZses
	2K2LUFNguVmhYXCRdjlCdgnsj+WEJrtg1TKldOEp5lzTgpX/8n5GfcdDMu2giBanePFor4xOOIV
	U=
X-Gm-Gg: ASbGncspk7Y7PGwLrdO3L5yDYEz3qP8i2xwBXrGXIcHF2a9GqrZuHb9GADBac+6MYIF
	TiT4MFtQLdYkxk4ruE6/A/rsIDIZnP/6p3DSSmXXv3KKSQ7lr3LozRVyX2f/NEt5kmruev6vd0o
	tqYyct4kMJSv8OG0e5C80VzXjH4ZX7GGe4UuZe54MPxopao9omBe64VQjkBWYHyb0uvhNWFPaWS
	id3Q8oHxI93vmn6j5jNn1/OIWZ0IqIwL9e9xFUJ7Op4ZrsSdRdZljYGc43r6tM45Amg+iPTu/zt
	mPjpbV0CcGT1J8WwtrrOVDw1UcOTviTdkY0bTgmDtCmG7KZ7VgIURKKgezfzSvo9uF3t553z5m0
	=
X-Received: by 2002:ad4:5742:0:b0:6f8:9b78:1bf6 with SMTP id 6a1803df08f44-6fa93a31ee7mr39675676d6.18.1747996835819;
        Fri, 23 May 2025 03:40:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU9W4aT9C7+lHR3MtGWUbLc54LW2rcHq757afZeqo5dpPSrVYSZ/EIPiIYLTkFjN3sddIMoQ==
X-Received: by 2002:ad4:5742:0:b0:6f8:9b78:1bf6 with SMTP id 6a1803df08f44-6fa93a31ee7mr39675356d6.18.1747996835432;
        Fri, 23 May 2025 03:40:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7018349sm3792363e87.142.2025.05.23.03.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:40:34 -0700 (PDT)
Date: Fri, 23 May 2025 13:40:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 02/10] arm64: dts: qcom: sdm845: Expand IMEM region
Message-ID: <fjx7p2ab6c3qvwakrpj3zsjnhvjzwbfszvuwp6edf4rlehxdih@ucovc3r4fdfl>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: 9KObhjWHo3GJDl34nGg56Mlpd7PXd37n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NSBTYWx0ZWRfXzluInrSKlOhv
 djKGImgF3SW2PLJgmp8Uf6aEJQw9DHUv4hElgR0OntXKygjd61jlxe9H7SPhPsB4BospRDHEFED
 HqUZLPP0sAUPB7azNi2Sjgo00tTUx8az3aLYrsFqRbP6VgjLOOhoNdOdPGnm/zN95Lm7VBhZA9f
 D/2gpozuCS+C01qJaR8GdctFrkP/IqWvxiQjc/fL4RRWPGvDs2xH/9h7fxWYNyAPEnO/4Fv0Rnx
 Fp/GHjiDl14ZOhSblKBk9OqhCu2vOwSev2T/xEqkSWAUquMJBOB1EmaAyv/+lCCBsHsvQDvO0z4
 41sUeJE0JpDNYz2mXN7psKV6H/i8HHdA5zcecnHdddhT+902NSOD5runymJ58xf3gprbSf39XHK
 TWNt5wBvk1szGKbuNrgk89/2nFd3Wyx5lslm0oZQvnkmOktrwhrjJP4NrZAM0Sjv1ATgCOrv
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=683050a5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=PIzHpPEWZZtzk44p-YwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 9KObhjWHo3GJDl34nGg56Mlpd7PXd37n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=578
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230095

On Fri, May 23, 2025 at 01:18:17AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> We need more than what is currently described, expand the region to its
> actual boundaries.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Fixes: 948f6161c6ab ("arm64: dts: qcom: sdm845: Add IMEM and PIL info region")

BTW, are you sure about the address? msm-4.9 agrees with the current
one.

> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 3bc8471c658bda987d6fcff3359d63b367148e89..6ee97cfecc705c317164fbba8df426f6be52e932 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -5081,18 +5081,18 @@ spmi_bus: spmi@c440000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> -		sram@146bf000 {
> +		sram@14680000 {
>  			compatible = "qcom,sdm845-imem", "syscon", "simple-mfd";
> -			reg = <0 0x146bf000 0 0x1000>;
> +			reg = <0 0x14680000 0 0x40000>;
>  
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  
> -			ranges = <0 0 0x146bf000 0x1000>;
> +			ranges = <0 0 0x14680000 0x40000>;
>  
> -			pil-reloc@94c {
> +			pil-reloc@3f94c {
>  				compatible = "qcom,pil-reloc-info";
> -				reg = <0x94c 0xc8>;
> +				reg = <0x3f94c 0xc8>;
>  			};
>  		};
>  
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
