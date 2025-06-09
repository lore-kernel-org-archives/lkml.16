Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D4E255F3C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471176; cv=none; b=R1AKd20vPDxyr/ijXnYxdlw5w3WKUSlZF0uAZtQ5tvJY4aNXW8BnpxASehQc4rKEygx3nRUvNfNPRbePIR/UWRNEUTPCl9RdUQpQYm8ubJGamebytBO2NKYLqCoioVGiQVlQsMsQDMIyp3CTxKsZbnPO65hgAVJKKU/i21N6xBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471176; c=relaxed/simple;
	bh=SkYNBp2tGs+KkKatm/7UabgqugkSjHvT8/wNzK4u0vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWRsNYhZB27U/lFYV8u9hKKrTkntn49Qbrym/7x+Llta4fQgyXONIgs2ESdc+Rs21bCFa5uVKntgE60k56ekmZyf315v5tLbaWmB+nK3MKSbsHEC2JiAYFS4UBu0xMAbt3dMC3x3bUiOjppH61WQChZ1YqjTuxiMcMAgVpCqhqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nx/UDdDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nx/UDdDg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55994uP0007352
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 12:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozx1cNx6vaQiGhztUqHI8rPbCJVrrhmKdjb2oMY9jXM=; b=nx/UDdDgQ4IIJ//p
	ECPmR5ls+/cK7p0h5ysYtB8+Ah5eFY1k1VKyBkyOGn+cidcMPDMH3BB7lhedvKdI
	MA4+c7SBa5GRI/ct4Cz9/BT0FoYwFZozhKz3LbKs7uYc6TSiQh5HNhoUybwY7dP9
	BbMWHZ4ayW3vdaFw8BXUPkpKfCekGssxB+ntEhkvhQg3MsrrmzYNMKb7L2fA3Ra0
	q1Npl1g+pd/5OP5EgQjgTt0DKKwv5ocajGSh5bS0UVscLA3rKPLfPZwWzOUKE73Q
	LAFK6Rmf3MDH9EDQMiQ0MjpYhFSv3OouLKcp0IJhLY8ju04G7D2SPiUWhcc/GsFy
	cKX6ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcdqw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:12:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee988153so722083085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 05:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749471166; x=1750075966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozx1cNx6vaQiGhztUqHI8rPbCJVrrhmKdjb2oMY9jXM=;
        b=VzVwxfi7XgDrepeZGeuG5Q0kKp6AFiCVnhIrwyW6y2hcxwJFCqG3DvI5tZpxkfGj8R
         6GXYd8XSSP3A8HoOORaMJo6M7Au6qHoXWr4TIW3asw46uzIaCDkYpLFilIzM3GLOfRq9
         IXkWlKUR8EUIU/wgkQ1yujieH/bvynwteAXTv+nXsisPgeM1D9t+lhqpSpJJt6qLp1RG
         CK0gPiO+2FtLRZ5O0hfE7gbIslPcBSBGisjV6qw77zKbaDsYHe4RvXMTeBBEE0eqJhRV
         u+W34uEikN55QimmsqfHk7yylJV5BpsCV2L9mwR0zPzoGrl8L3KXQnNhn3BNIZcDeIEC
         UQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS2lIAW3bbdi4Cqq+oLvSC8t29+P/zYAu3F83mzjeBepTLvdd4DteWpDOdKKH51ors3eFuxYmZ9dXvvCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwPhj0kmxwKfSOAAyTA+dppB08SHIYJASPi2vamRSSgz7qveoT
	k5C/v+/ATfXFLY3IPZ5Sn8pjadRcEl8DF2q9VRC2FVUETo29DFwoif8bNkFl7gRXQvi7eEehJ3I
	ekcV47qpbhffUBIzJjW4Wslh/D7ev8eaPWMJ5IbCqJKn9+5EWeA3Q/etx897RoKVFr2c=
X-Gm-Gg: ASbGncsYD73EiTXnsO10sZfNAH16Kp/ivaPRl8LECB5bWyDvavLbxonitJuzegS17Kd
	i4iio5gVQ6MhrOnTbd0PsPAabFvIzTCs2EizVSG35X7+a2/2E8nk8+L0RulrcfhyKXGZCz1TIXV
	A05E6AgOVH/ny1eaO/xeSA+Iti9+shvQ+BDHiGTxVK0jND5/Y0H/8WP2F+GcW/D4nwobSogSMXe
	3Ab3VwfX1cJqlK7qpnmZBgHaZHiRug127OdG9yFknEt1XYMTmKpEIOqVR7EAdlZawD1Dpoe8+Mf
	NwSXkPmFKOTJYpTEQ2duQ++ZGDAv1SvIoP2F0S8doxgQKuRw
X-Received: by 2002:a05:620a:45a1:b0:7d3:914b:abe6 with SMTP id af79cd13be357-7d3914baf06mr669830385a.23.1749471166663;
        Mon, 09 Jun 2025 05:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWvU3u5w14J+qlrmR9XemVZPLaY5kePeOwYsaLUltPqBZJ+np6mmxSmQWTrNQY2VReY/jN3A==
X-Received: by 2002:a05:620a:45a1:b0:7d3:914b:abe6 with SMTP id af79cd13be357-7d3914baf06mr669827185a.23.1749471166299;
        Mon, 09 Jun 2025 05:12:46 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm110438475e9.39.2025.06.09.05.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 05:12:45 -0700 (PDT)
Message-ID: <fb03dd8d-8caf-4861-b56a-2c10b070e2dc@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 13:12:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: demote probe registration printk
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250523085317.11439-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250523085317.11439-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MSBTYWx0ZWRfX+eno98RWz/xf
 dndcfNCRGW3qXd0nLoji4By38OOgtFxN4OF5r4Eut59xJVwBfLwGef76vd7oQv6MSDSDtYtT1Wu
 v5KDo/06bTSaZYv9wsnqKpK/s6rIHllxgFvN+GcW2qmxXJZmerE9l2Y4XjsT1nCuPkA3ERefjxT
 jWvybVwTbq6cATBe+jVW6hOdskDJ3AJqOiXwfDmiTzGMMtdbVD/DFtQzv/iYH3DjuttMQuZN+dA
 W/JAGH1aBL5k24f4CSXwH9l6jNdsF+gd/umnEX5A3sB1e1ES/cE/BuzuruRXxfeWqGmexj2rKqf
 WcfV/7ADALNS/0ozFrNI0A+FMwEtT1j581R+Nlp9z9/DzNuJDkUYBZJx5nek1BQpdrv9io2ZKff
 AP16RC147W1Gv6YCbKDRBcc23cGCFjvEZnQHsqr+oOflU4MmXR9sqp51e6vFRq9FOTSncYsF
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6846cfc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kt4YovZ3MTeTNe02vhkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: xZJ4l3yM_avWBLJtOHGUer6RIy8vvGv9
X-Proofpoint-ORIG-GUID: xZJ4l3yM_avWBLJtOHGUer6RIy8vvGv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090091

On 5/23/25 9:53 AM, Johan Hovold wrote:
> Driver should generally by quiet on successful probe.
> 
> Demote the Qualcomm controller registration info message to debug level
> to make boot logs a little less noisy:
> 
> qcom-soundwire 6ab0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6ad0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6b10000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6d30000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  drivers/soundwire/qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 295a46dc2be7..3265c39e6b51 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1648,9 +1648,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_master_add;
>  
> -	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
> -		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
> -		 ctrl->version & 0xffff);
> +	dev_dbg(dev, "Qualcomm Soundwire controller v%x.%x.%x registered\n",
> +		(ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
> +		ctrl->version & 0xffff);
>  
>  	pm_runtime_set_autosuspend_delay(dev, 3000);
>  	pm_runtime_use_autosuspend(dev);

