Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300B31A5B8E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971268; cv=none; b=Gc/ClhGtX1Th4ypEGYbqCXa6q8cnrT57F91JutyFwhpNEuIgkZ6iavtWF99GPkBhJ0rQexLDFiVve2DotGe3oTl8EgfEDF250A4Oy142AbKfos/5SRk4htAURa5o/9wyMrQeVcSCpD25F1pLSZ36gcGcbRPXIQ+rTfP1Uxg0DgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971268; c=relaxed/simple;
	bh=hdPDYix9B164q2pOie++e3UrFBvfcUAtndrW0+JpEuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfr/CEmzlPUbPjwgs51VOVOvBNgQqcM79Q6/M3iYJqTkdXN+Szbn/d5wXcSj7p7Cs+TcfkStYjHuO5YJ4j5jNx7yPvbZHqf6pYJKk1W0Z1PGkc5ZkKs0Pr0M0fjxjM2OvMLykdpth6/vApClOfWJvRU3dPQlUCUEp2Surynm8A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wxn/gRe4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wxn/gRe4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536JfGCB002115
	for <linux-kernel@vger.kernel.org>; Sun, 6 Apr 2025 20:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tz+xBa4zdw4Oc+dGUVh8YIET
	Aw07f2pbn12ucUvO8ZY=; b=Wxn/gRe4usQhSX/tK55e5cwU1WVvWbiHCErt1lWV
	yAobiMO5enO7mf56bzhYOhmEYX1CgStmxlwxTe/4b1In1t81ebqcOCjNyy0Ox0Xs
	8yjhwyRrPkJUulvM2BPncvQtqyHrom9MPK0dmDtVDFWEu81z+ENHlrhO76TzLDWe
	PaaKPmOdbttS1WWBNgwDLASpAlgB98NStNzA8Edf2QpCugtSJQACB/DKGR4WwNUk
	3uMWtyftO+BzVQPh5LOf2g3g9VKEDPAUMmaPvo7dcND07SmwXbhW7tVSSXBoJj3b
	nWk+LnERxQwJP+Z86L5h/s0o9oYUb2lgURZNrtyWcWcj8A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfka98d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 20:27:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e9083404b7so73356336d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971264; x=1744576064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tz+xBa4zdw4Oc+dGUVh8YIETAw07f2pbn12ucUvO8ZY=;
        b=QxfhnxG7jQzdTWvN4kWTr5wkqSZAruP0NlfeSpp2YsrJUf1Hhvh5zEGmsO2L6JVe5R
         KXLKKtz0H5r6gNjDfo7HhjvTX2dN4Xvdfe/FGNs1XmR3Ir7UvFH2xOi2rMwVlw9w6ywn
         6MaZjK9Fo/RFLgZgZxm44MDvg8lISPATLtIQiiz7zRQFT6+J/PMj+ShTlJz4vh8G4jCu
         nRJW5Stk1gYMzFHrmpMHapXRsr+IYOetJisYSPnwWQMhsx/3tdUK+MzyTX2mnRPoWpKC
         CYycHVUQlVGDfj271BtVYFRLzdpE24usVdqq77d32ZvExtG7qAznOTfO/SYP6fhnFDZP
         5nZw==
X-Forwarded-Encrypted: i=1; AJvYcCVr7Wwxrt0hMoZojg7/yH/KO9ZytokIu2pyiRPBF6Ahgc/B3ypQ53UVR0psAaJQGbBbki6f+lTCShBG3Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAYezJPyF40mgGZr1EqiHaybtH1SdvIsziHIzNjX8ZOosDeP1Q
	cfT1yZNOLzglE/ZRKzT1vfmZcNEj6ybFor+6I5C1LN3lwIXDRuEJ+rd5qqPh8st/7lKN6D2Boor
	rKq80809pNd6BrQ0zDv4pNETAycT71dPFaXESZGWXgtfmav2IGXMUR8e1x63qT227XMskoiI=
X-Gm-Gg: ASbGncvoZw8kMLoI8UVcUBj+yPttZ2o6SSflZcTiCA9rY2tg9TYBQ5hIxcPeaSr/++0
	QGxEiQ4ND6GyPiA8BHLPZqcXLanzhA0UgJFvlG932mlopFixTubQYbWLiJqlfpU/IGs+eZsAHxT
	kDdLUmm4bwrmcOFdXbJ0afwQL/xNQAEoQTkyWQOu7xmQ/Op+rCju3vOj/U0n8AJaBtuxkoOiwEm
	bYkUkjkNAGVNuba//lbXwrJGPV/Eob3hVQoGjrCRtz1DmdexfA4+J1Bze+sfKZateONwhA8tsTb
	hofceLabztKQHSN/N+/NxgDqI8wRpq4bSN1BM0nZBc+kEA9gLw1VRkm6xHQrpuO6dKw5MHNF2vG
	OT7s=
X-Received: by 2002:a05:620a:2946:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7c775a0fd8emr1535317485a.18.1743971264546;
        Sun, 06 Apr 2025 13:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAm9GBbnTAo3ZOioqX1ZBA6msW3e0u3q4DiGzxVQgs2AQyA4SvhZ1rIo9q0uLzeQ6JG09pOg==
X-Received: by 2002:a05:620a:2946:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7c775a0fd8emr1535315285a.18.1743971264250;
        Sun, 06 Apr 2025 13:27:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0314abb5sm13408651fa.48.2025.04.06.13.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:27:43 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:27:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] extcon: adc-jack: Fix wakeup source leaks on device
 unbind
Message-ID: <xosjgzwpwz3rnqt4wybekzuaag4na7vbfn6et46omkqyy6nvs7@zqoswpjy6srh>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
 <20250406-device-wakeup-leak-extcon-v1-1-8873eca57465@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-1-8873eca57465@linaro.org>
X-Proofpoint-GUID: 7UoHdt8RrWfPB-U6nbh4nXz3HRRVQyHF
X-Proofpoint-ORIG-GUID: 7UoHdt8RrWfPB-U6nbh4nXz3HRRVQyHF
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f2e3c1 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=-tqK7Jk4VOKOSx7ihNIA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_06,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060149

On Sun, Apr 06, 2025 at 10:16:39PM +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/extcon/extcon-adc-jack.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
> index 46c40d85c2ac89599ffbe7b6d11b161b295d5564..d7e4b1418d7e6b242780b3511f2a49def3acb7a6 100644
> --- a/drivers/extcon/extcon-adc-jack.c
> +++ b/drivers/extcon/extcon-adc-jack.c
> @@ -164,6 +164,7 @@ static void adc_jack_remove(struct platform_device *pdev)
>  {
>  	struct adc_jack_data *data = platform_get_drvdata(pdev);
>  
> +	device_init_wakeup(&pdev->dev, 0);

s/0/false/

It might be better to use devm_ though

>  	free_irq(data->irq, data);
>  	cancel_work_sync(&data->handler.work);
>  }
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
