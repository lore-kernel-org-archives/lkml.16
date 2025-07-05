Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F375255E34
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 12:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717655; cv=none; b=QDlyli6gp+2z4DDMNCnrpP2lQVSiFwLLVyMNSF+XSSKP+Ttk1jYPyW8El2k7GfdonkqnxV4ZjKOjDFlPRGr9PG3GkZ0koiHPCkXW8ci2pdZoE6TVnBVLqm5TWCnlBtiDcmJA7XTLVHc93E45E8eJpuM8ItbP9KXFW1W6gKl23Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717655; c=relaxed/simple;
	bh=seAMpBnJP2PohLbFT77DTsSpofMUFtCIgoK8sfHBeAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mA964q0vEy6O1iTt2uZfNM77TXX7qAg2q1dx3ZDrYT2XpN2lUmxGhONMxWtANU5IL5iwRi0fZqNaWrFDPOY4s9IrmrvJBw9bLfsMOjOu4kQoH/ZKkPZQ1VVlNWe1JkMQnI04x0pRt33Mezs2ON8iw5LoZC6kn7hJ/KF47wYmoQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFEydif9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFEydif9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5656V9e8003069
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 12:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X3R7m6vhpeMmt42NiP+KAtKx
	CzuhYxM1H5OHZBet0e0=; b=AFEydif9Ss2mTTURcUBU6IQoEkmsuLSccCcnyOb5
	VTfAMp/k81ecdON5/NnXvCErPxZPviPlUFndaAHnQVE4uD4i1Sbzx4ifQtzXrjT/
	Y5K9pJQPF0cw2cYIJj6aT5agl/m6cb+f1/+OH0dFZwITCN+T6nPmB5kOyoDipAXE
	OgSFmpGT6bgkGabaM9Qb3WcYP9Ij5Ve/R0Y1C4LlKCMPb7JHjh6jI4/Rkqeo6Hej
	aHZKGa9gGgO3ybFfVosI4vJb5QvstbSz+XCdH8Z/TzzygoCi68HoYHbeGQb/fwMD
	DbuSfiiic+OgQ1jUzyf150Xk5Uc1EpZLoWvKIloW1Lvf1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd0srv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:14:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990721so347462785a.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 05:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751717651; x=1752322451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3R7m6vhpeMmt42NiP+KAtKxCzuhYxM1H5OHZBet0e0=;
        b=miKcLVJXfFG6zYowdbPzfwTzZDeVHiR2JArkusLtn04nn8kp5qhCahGwZAOYjr+S7F
         JBN6blgE4u1EIBEcWTFD9nHBURjJLcjiP7xlGrbypLDq8Zs9XkvVMvGij6IMXVkY5Qi2
         R8F/6HlaRlLGM+7hNQ1zVbnR4Muu9K1C5aBKdU0oskMFZwJYgj9IsZAmfPhd+rMTdLbZ
         c0xL4UJ3XjUm52RBU2HuZkRLh+WfzOrTxfqhCfLAPr3xd2WkRsYehzw3EXojp+NgmjSw
         CDnohlz25dgeTnWJxHNfYNOolLGIe4QUdeoVC0yViJ1xib8TMs6hsrjiIR4dMRmuiPcU
         EJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCXXH5i02jPo8paGdvDtyElUUvkTIdsJ9U/t/khixfmeq2d7Yj4F3V60hqNHy9AxqdDfMHAQVQnfKFmSKeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1iT0snKOawYqws4NsvcX5/9oF80ZRPC8DirF9wHU/H2XtvW/+
	ZtwnFNhW5STaonKoTGhFaB4ZQLyK2PO4QezsPBEhWkZeEmNfV8DkcW4D7/DtT5+fQdqS1XfGjYS
	+JXkEZ+cqtRVxv1Q5ffZbWPzRfjvetJujtrJJUCLZ3G4x3L15vdTIUvFFVBdU9R+HjZ0=
X-Gm-Gg: ASbGncu1Idly9nnkMvDSVK3k7O9pEffQj1BvHxAOzLxGqXEEL4hO8vAKlU+GjFtYNzo
	sMB02ZtCX84t09xN9D1fHk3+IaPsNTghuZ0YPdevnLxBRt8fWi+xJRJeOUrJurHS+mnYRdEWOWL
	cH+jLcbix53oIY1EI8gScoRe+NxpkaoW6aMOl0p+TCp4m7RxJI1e2iCajGZ6eyqDqhp5mjSEM4m
	Gp9j8zjjCUBtgorUYJJBsUiD5Mnkmepi9i1bohZxyplSTwA4DF/IRtIRap4FPR1zgmVgfE5f07C
	ntxm7IEZxarwX0W3r4ExzbJ9CfYA4O8w0rE8yu9ttP4o85Kz7rE+VjVmLv08mqeRm/IzY+7+i9I
	Qxpaj8eg8Ptb4KDOwYcWq3KljXXsN73uU94M=
X-Received: by 2002:a05:620a:3185:b0:7d5:db58:cc3d with SMTP id af79cd13be357-7d5dcd07298mr615685285a.43.1751717650865;
        Sat, 05 Jul 2025 05:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOs97+o0jfR6/wUb9M1mhcYSCb6Xy5iUX7EWsEjWj3V1Go8bZKGmNr9AhrCoaIdHHnYr2WJQ==
X-Received: by 2002:a05:620a:3185:b0:7d5:db58:cc3d with SMTP id af79cd13be357-7d5dcd07298mr615682885a.43.1751717650180;
        Sat, 05 Jul 2025 05:14:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c485esm562505e87.232.2025.07.05.05.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 05:14:09 -0700 (PDT)
Date: Sat, 5 Jul 2025 15:14:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: qcom: qdsp6: Add an error handling path in
 q6usb_component_probe()
Message-ID: <vyr2uogrgggvk3jrzgmvxhqbgj3ble2b2vwsqfrnbrimg37fel@72766uehk47c>
References: <1a3bf0ee02f880919190944e581bef2b428ca864.1751703113.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a3bf0ee02f880919190944e581bef2b428ca864.1751703113.git.christophe.jaillet@wanadoo.fr>
X-Proofpoint-GUID: LtyCngtKS7zc5POjoWZQga5LKuhTKZsG
X-Proofpoint-ORIG-GUID: LtyCngtKS7zc5POjoWZQga5LKuhTKZsG
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=68691714 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=i8X5gpMj71ElepJM6G4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA3OSBTYWx0ZWRfXzxc1g37lSkHh
 +gqdiYNK3/lXyzrXtKARdDG/Nnebtw5YSW9FQlmHGJcncu8Ae90ThSNR28KtZp+dvxeFOhcWk0l
 AY471CaR0p9B+XlYGPsTFAgtWbKVeWsUGLt0RjonkeIUUczu1hMKSLR6Q09tWuiporRhgowYnqN
 dV8MO8H4vYBhcQOIMUTd7C9lNAZNaoMZa6DZiRqZK1txEa8L7I9dBePLs4Y9rgJTwLtlACyYSIx
 8nuJM5UvaxxjfJqriSwJZD59y3OeuOCDkPhUNwbT5JtC30ZI2Rr5uPaejcEaP9zpt6iXwQV5vh7
 hIcgYrx6Y97iZp+xMam5xn8le6ehBDKLH8+dxGRIcqU8QbjmbZ7rKwwT5KEnHq6uz/BntQpG/ye
 G1j7GX++yLp+2daFYcqotaeaFMJbj8iWztVMLKmPOWEPW8A5P3mZmnrA717JkQWbMdL1rlxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050079

On Sat, Jul 05, 2025 at 10:12:25AM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful q6usb_dai_add_aux_device() call,
> some resources should be released as already done in the remove function.
> 
> Add an error handling path in the probe and the missing clean-up.

Well... Yes and no. It's better if we don't unnecessarily destroy
devices in the probe path. I think a proper fix should be to move
q6usb_dai_add_aux_device() after snd_soc_usb_allocate_port().

> 
> Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes in v2:
>   - Propagate the error code returned by snd_soc_usb_allocate_port()
>     instead of an explicit -ENOMEM.   [Dan Carpenter]
> 
> v1: https://lore.kernel.org/all/7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr/
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index ebe0c2425927..0d998e872e82 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -327,8 +327,10 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  		return ret;
>  
>  	usb = snd_soc_usb_allocate_port(component, &data->priv);
> -	if (IS_ERR(usb))
> -		return -ENOMEM;
> +	if (IS_ERR(usb)) {
> +		ret = PTR_ERR(usb);
> +		goto free_aux_devices;
> +	}
>  
>  	usb->connection_status_cb = q6usb_alsa_connection_cb;
>  	usb->update_offload_route_info = q6usb_update_offload_route;
> @@ -337,6 +339,12 @@ static int q6usb_component_probe(struct snd_soc_component *component)
>  	data->usb = usb;
>  
>  	return 0;
> +
> +free_aux_devices:
> +	auxiliary_device_delete(&data->uauxdev);
> +	auxiliary_device_uninit(&data->uauxdev);
> +
> +	return ret;
>  }
>  
>  static void q6usb_component_remove(struct snd_soc_component *component)
> -- 
> 2.50.0
> 

-- 
With best wishes
Dmitry
