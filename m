Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3328D27510D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704475; cv=none; b=kEsSRNGrWNgXAkZ0Nbm1/nYfTgs3BZRvXzE96hpqwXm40VGE629ikhTiMfgZffUg2GE8VqZkIZuTkhFE3vWgPPYnMPFJWWoazoMakTrFW/TfMbb709wvNQl66UJkUdqYRECSf7AM2xkdW/LU6EagIS+XdmGzx/ppKpeC11VeJsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704475; c=relaxed/simple;
	bh=NyNzWYetkJTOEcUyWJ6oeCzC6581aAO1Ja8RqfVJ2gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ko1rJoSIfYae0fbZZ8ByKmY9WSXEq8vkjTXvPG49VoTBEIWkmFvI6MXsMlHmnVXNhEoK0iMSHVT5fWwQd+nMkoZFbdg0N6PuRWmMiZQ2DivYjErJpPOZ37z2KEfC06w0A1xX9jr7luUVwhZCipyVcqfP69B1N61S34ZK2ujH0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBNP9Ppf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBNP9Ppf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15KUg014550
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sfo0CAie457ANf0kjWKsPJLb
	W7vU/MFpplDe4Ai78WQ=; b=BBNP9PpfdhajR2945x3HlPCWnTuhBTegq2vbd7R+
	9EdR0voLPMPsh0+5bfEYHQyUAKrab+o8TEzLe3OCQyK2HwCbBRClz6FudolPF0uB
	buGgss9a83w3QqAh00ABZTcyb2d+a51058OAmKWHwtI1+H8VJeWJhDc5O4noa9t8
	plicwiLrLrwi0Iw5lCsC7lXo72Wu5gg+yTu64OCBQv2AizpSQ7XmFUT+43DSjehA
	3v1vfT6EC0cMe8NWgdBCzBvIy5/61VDCOUkuGo2YTKtW5e0m95dzmwzI+kgM7HCL
	/GrHOjNnHxnl2zYCZui8HH7issfMNVlLf87+FSiRzYMG8A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcy362-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:07:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f99a9524so153880456d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704471; x=1745309271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfo0CAie457ANf0kjWKsPJLbW7vU/MFpplDe4Ai78WQ=;
        b=eUKtC4wZFmfFddMcpu6pavhxzGORoIyJkYTMcE2XhvGJWGgsA5PXd7NzVBimrR/Cme
         3n4coVYTQoJeMTKrZ7dAD5Tw4sHG06/b7v6peV7CLAS6XQHqIDms5j/LxM7VIRzTQ5Ad
         1cGMgh8aINisUSraPY7dAL3wXu4vWUr6EyiISy3DEb/ikxG80MWhquBPZScOrvf+ehAm
         k286IgKOyiCYCWat44urnL7MwbTiwxnRFoybTxLn9MBF0ce81K7mtuq69wsDT/rXPL6+
         M2JeCohHvgFYWgSH3qniL+Kn6+5cLanvd0X0+bbghJ1ZYd6HS/TBWf8sqgYFjByZnNHt
         XZtg==
X-Forwarded-Encrypted: i=1; AJvYcCU87aGtotXc3pzi9tTEb+qnJMAqfyWOwhogl4k5gHXY1eWPFZkxzrXx61daBeHHohWxf3m82zhxZWW96m8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwR3x1Y7lhwP3abTUb3e+J6YoqS8D9c8NVQJimjhpEvgQHwLQh
	gW/yKosvV8x6X96HmUR9CY/XkQDhJ6p3Pkkhm5lBDxNzkeNCY4F17zqahuiy6wd+grmC/tLdJEn
	k/S/Grl/30o12iXjK6hPeHIxSigFpHheoKsItMJDHrhrYQKVD3SsV0MaOjo/11XH3rBmkPE6hg0
	z3
X-Gm-Gg: ASbGnct9POKrSw2CDwVRQ1o9WXa792BTlW4INcu5Pk3HIkA4J7+nTlaTZyygpFq/9t2
	yHovHaL0tADAfbXy1Hzz+sYPs5VyN3ChcahbCGU2+nEUsZiUFli6ipqX8IIRDceYLvlyHnRNDz4
	fLZ5Zs6vQl2JR0YvVxiDs1swZRxcImizlkw36AIzvEzi3pHoJ20Se1jdEOdZRqJ2uf0kvf9ztnA
	fE+dzFvStFWw1QIdxOhmH1RjsYjjQ4qBe1d8/22c3vssTD0Jz/LDQ5f3B6KlZpQCyktpl9H/uXt
	Auwr4ECGRwmvcwbUa5rk6CIn72i8rpjF0zGCbS4NdiiJTCtP9ej4iD1rGAjs19nFxiBVyG8xfFk
	=
X-Received: by 2002:a05:620a:4627:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7c7af0e3291mr2024047485a.29.1744704470924;
        Tue, 15 Apr 2025 01:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9hUvwu6zZUyY6fvtVdyJ4E4LxMjO1kvcyqX+7MW3VKl++jBJZlmvKb0i86KlUbaBirAtYaQ==
X-Received: by 2002:a05:620a:4627:b0:7c5:6df2:b7a5 with SMTP id af79cd13be357-7c7af0e3291mr2024045785a.29.1744704470658;
        Tue, 15 Apr 2025 01:07:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238bafsm1329060e87.65.2025.04.15.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 01:07:49 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:07:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] phy: qcom-qusb2: reuse the IPQ6018 settings for
 IPQ5424
Message-ID: <jli32pwz53xmyymhvud6nsdc4b7gp4mhdpsg63yubnbk2fpv5k@t2jl4btfuq3o>
References: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
 <20250415-revert_hs_phy_settings-v3-2-3a8f86211b59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-revert_hs_phy_settings-v3-2-3a8f86211b59@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe13d9 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=SwJ4zpY-I9peookiyZkA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: sFIeAyhjGy7U5V-GFE_X_I706w37TTFi
X-Proofpoint-ORIG-GUID: sFIeAyhjGy7U5V-GFE_X_I706w37TTFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=807 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150055

On Tue, Apr 15, 2025 at 09:52:51AM +0530, Kathiravan Thirumoorthy wrote:
> With the settings used in the commit 9c56a1de296e ("phy: qcom-qusb2: add
> QUSB2 support for IPQ5424"), compliance test cases especially
> eye-diagram (Host High-speed Signal Quality) tests are failing.
> 
> Reuse the IPQ6018 settings for IPQ5424 as mentioned in the Hardware
> Design Document which helps to meet all the complaince requirement test
> cases.
> 
> Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
