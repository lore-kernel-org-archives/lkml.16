Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCA7217654
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749326918; cv=none; b=n1VH8nYoAN4mLsQkQ7NHv3uzrH6Cd7V0A6ShE3ydJBrRLTYdU7YDYe78av5tMN/Ys6Ly4wygPhUnpI2qWqvkd8t4xoIJWwj6nRuH3kS3qdRNgjnPJpGFs6j0jL3h6nfi5aHEJiZ5v8B+Jg6rmwCFuiifhQqQREzjfPv5aBsjbF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749326918; c=relaxed/simple;
	bh=VCmRdOUHHx69BMRY8Zh21+gZfzCtkEfrMaDX1Ai28fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgVnm4G8jKe6LpjGz63Tcvs2Re9zZEcmkLJZP/+Gdg0jBDt9gmKIHY6ZfzsjLzWhyVM4BGIQZrsa0FqQnkX966h++Vya3FHGrkK8Yt97QBFpQh4NJ9JwL97HfIhrIimvzO8h5vwIwbparBZCYXo6tgHB4xh0C0s7GJb4qSNLt/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7dWBebX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7dWBebX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557K01Bw011087
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 20:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LcGfjI1c42cfgKc7S4/kHbha
	JgN+ngahbXwD1Is9qfk=; b=o7dWBebXGy2Cs22/xuJV35Pxmnsjac75jmvdr0S3
	dtGm9z7kVKJL9nLHnG6beiYIxvRYu+LqzPWTLQzF88i/j7voi9xVL346mIrHCvPI
	CDYTeSpDaA7xAQvzQ6mrZERBuJ4q7yKHxn/2OebdZheO10KrUyS7PSw2Wn77ZGX3
	hVrN2ocOs2yjxgl8pNeQueDxjq8RGxy3cL4lWw035nGiKw2DW1NiXrjL/0CidDCC
	smmHUHqxrA2w36Ku5DWop5gvZAFpEnxTO8g7J4Pp3o5d4XCcpdtybvFq+YCpvwyY
	qyxlp5KeUs8rvM20sdLLnww+iJHURWvT2sJULIOyvjB56A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6j8y5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 20:08:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09ed509aaso579465185a.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 13:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749326914; x=1749931714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcGfjI1c42cfgKc7S4/kHbhaJgN+ngahbXwD1Is9qfk=;
        b=dmI6P7vlOtHWha9nxBwb+eGtdplOiTlwTA67qKe73JxWh9OL4Px0xsZqNP9zsWAVBx
         ITZWvvzZ3aLZcI7t8Aq7cHjO9+BYGblH+PPYEGm2c7036bxMKYxoFaHPzHY0RCC1YgQ+
         Mry4u6fazSc5KLzufmFuRdRoxkqIgjDA8lG/nMFq+MbfT20jBqVqn0xu51DtG13gzJVf
         ljNgZ/ShHEjDVmYuG6i1dM147XCzRUhyM3Ecbo4EKAoI5Q6rDG4OH2Ws4BtHqUXfIWmn
         3jYL2Q6ejAEECbSKZratH+4d+Ps/hogmaQ1cR4UpyWcCpOflIYnVKGHGzeWNk3/aMslI
         sXWw==
X-Forwarded-Encrypted: i=1; AJvYcCVqc0xj3sVZyy7aCogpjROGKqCG+Y+MX+hllubszvjnQQrus322jyeO2KY+hz8Zhr+3e/WBDd7FB/OWrM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRYo9Jx7vPxbCCW0L7d3r4l9XfdQ21Qh/Z5fcOqY6CapIAUMVS
	iorHgw7/k61Nc+AbmeeQJYFTX6O86HOp/2uslk/FBCLrxhS8iMlb/FHM44m0q7dplajUlLkA1Iv
	1W5CexUoQCKTv/NN1SBHiRVd3MoWWEVi26ZAaLm8YIiAuoE2mJh0Z9fT/X37s0QxCcd8=
X-Gm-Gg: ASbGncubwbTyMYY9s1kF2I7hb15X4IaBhk3TkFpvLOFk1muh/R8MOrAycXJV2oTfeQ/
	lUIgOGe+8DA620Dg0b+CJcRXc+iAaoqaUZNipBqpzCgoxK5PHWkUT4jKy8baoMT89uKwB/QfP6l
	iuTUDQRQqXHMMADzrvSRfgyNVerTmSZpCs6rf9oOJix5XfCwvOD0Dla1DxPmPixQCm+shF/fX1r
	VtxG/gbOJ3ksDr/gESNuJj8h73P5x8jLqSAC7W+0qqfjR+MEwjQ3RNNzeLOeqnVgPXd1SvKibXM
	enYaXOIev8OVYvByFflYfJt/gUukCw1EWpdqLDKHpcAsOU//oiBdAuCarNm2Rkkzo4Im94ve0Dw
	=
X-Received: by 2002:a05:620a:199f:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7d22988e34emr1206536685a.21.1749326914450;
        Sat, 07 Jun 2025 13:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjhcwfKBxBqhK/w/iqBpz8K5IgFSPkf/a8LQCs/4fz1R0yrkN5KXByabTonhsJQyxPWceGJg==
X-Received: by 2002:a05:620a:199f:b0:7c5:5883:8fbf with SMTP id af79cd13be357-7d22988e34emr1206534285a.21.1749326914070;
        Sat, 07 Jun 2025 13:08:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731785sm595624e87.216.2025.06.07.13.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:08:33 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:08:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 2/4] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Message-ID: <lx6z62sadq5ijteuww3o5mriti45abty64ucmzig5bdaijumzn@dponhgcugds3>
References: <20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz>
 <20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607-tb16-dt-v6-2-61a31914ee72@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68449c43 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=gIeN6KSkFSykCpat-AUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: SZ8Dh2u2EK24DIclj9qagaOkzkrqatKE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0NiBTYWx0ZWRfXxFo5QHAfQ3MX
 U95I5RETBONvtPmCIVfkVccTA9K7Z83m7GgGXAt4MMBHOudyrTwqpZb020kT5b9j2nFDOGbfmNs
 0zUqWZ/pRpF0IfVCxgx8ZRFdg550WpbpzBD6EgJmxHJQlyct9XBtfA9M97xBg3qQMh8Qt+40pVi
 3TRcWB2M+9ETuaqm5WCWz4gJS+HUfU4MEllUFGGhuxL0fcSA8Mmgv4cvxuC2tY67w5xzQ3WyXV2
 3SkulD+C4fRTGJ69YAFiv2BBezHd0+WmUQkIELIoXNLcXGSpH6wHrilLbfgSVFetLdwl5HTEbx0
 QYRmYbx84edLFASHRWj/wfIuETrJiTrPmy6RKU2WmzAtpauMdLBwg4wIW6YqK07HhVtF+poP/dR
 luO8ObOhRTOnEIccj4uqhzzQGEr9DUojDt9rS4yqcK02L7vKwDqE2fBd+WBQ8I552WXkI3lb
X-Proofpoint-GUID: SZ8Dh2u2EK24DIclj9qagaOkzkrqatKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070146

On Sat, Jun 07, 2025 at 09:19:37PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Camera is built into the Thinkbook 16 G7 QOY and directly attached on the
> usb_2 controller (dwc3 USB2 only). It has a separate power supply that needs
> to be controlled for PM.
> 
> Add the support for this device for the power supply.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 2 ++
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> @@ -127,6 +134,7 @@ static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8440", .data = &ti_tusb8041_data, },
>  	{ .compatible = "usb451,8442", .data = &ti_tusb8041_data, },
> +	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },

The list is sorted, so this should be the last entry.

With that fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  	{ .compatible = "usb4b4,6504", .data = &cypress_hx3_data, },
>  	{ .compatible = "usb4b4,6506", .data = &cypress_hx3_data, },
>  	{ .compatible = "usb4b4,6570", .data = &cypress_hx2vl_data, },
> 
> -- 
> 2.48.1
> 
> 

-- 
With best wishes
Dmitry
