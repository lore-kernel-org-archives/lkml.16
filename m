Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E151F2EACE5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046935; cv=none; b=CfQHhhqxCV0R/PVZfeqICFMUbfL5A/o7gqSV+QWH/TFKCxpUFXkif4o5TQMr3F6oQSgCXrDuNnMqVncDkhRqRPOsp4pw9W+DevixayM37VMj9TGceotQLQH/pLqOMSWNYFfnqINgbUnM9AhlVHNAdeDeK7fHsw1/NcHiAUQ3yaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046935; c=relaxed/simple;
	bh=sP55RcNGRtVXAqUW36R17TRg0JabtTdiLcEfMjXZ0rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3MMuIkytknQimdqwNbIAowBVD1N4+7kO0S+To/XmFAQCKnoB4bgpCTj9ONEJhlG6UYoI0Knc3QCjp1oDj4IPLxu9CJNbFraIbnZp3PHc3YcUWXmn/IcsGBq8q/C82jMjPX0o74iixPvNJg0ihnkQ8v/cYuqTYZtwMIHz87dLRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bktBNDHk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bktBNDHk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCoENR011279
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=; b=bktBNDHk6uXDTEkc
	P3hPdPknqjLUHgdbQBnOxh0EkFLa3qjGh0hsd72BMxnmtzFKmSqT3MZn6H5wQFZn
	esyndwzb/ajSbcEuCUFWD6HeppBAWxX45VTf5anMua3JjOjDl+mRUxlIT2fh8DNb
	LFX7XX7JeuSDBYFs12oq1x0qRnbASgbjTqZmYwvKsNNPX9rzMduNHgdttdd4TY79
	htJBfVjiXzKr++u0m8uUbvkV8dJgth9Zp6qf3fbyWl1ej16lGxZrKGOczkqGWWEO
	qMsuPvV296TfDskYUzZ1Cu4EyhSKTYnjECJUlJ25z1D0BUiR4jJOgy6b2GMsZpN+
	HWYIcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgqjjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:55:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a43be59f17so4162431cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751046932; x=1751651732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhtPwHF0fTtys7QWflgWfeVzTXfKtMLTUh3g+imGqfM=;
        b=Q+bkBloSQa+6T0F4FGFAdu2/z4wiQekCIm9t2YLotEerKJlSYI/k0WxNKUbZeAXC5r
         +qdox61smJQVr9UPX9dhi30g6dsnKzfDcvr7IghMm1FKfztmRlW6hujZKUN8+5Ey9amg
         5DgrXbjgvWuoO1fDVnB+LZCehOGJduJpPwity+sSZZZFuYjPnGkufa89bpolj8kosORG
         yE4ziqXE5p33p3zIPDwULP/MQChqu/aLWAnfo653BkwehEzQ4gE1cZObph9C36zaNIHN
         7xf7V9/fidmS3v7VnAp2D4z7gtf6CtMUnaNydxRGYB/IxkIWcEQFuG0B6VEPNzzYuy8G
         gONg==
X-Gm-Message-State: AOJu0Yw8Z1qFECYrfsV/E/k8m8bcsq9R4I9SMUK8YPmX5A/GD6sDQVV7
	8Aq3GcYXs1Dm/JGZv0NksUqbQkWDNeEzlIyKJ5xKLp2yP8P+PJtOQl+tx/93Jsq/DUrb37pX1cS
	FbHHSTrVkpF4BiVoFNRytznd1C+OkYd6sR5v7hdGmDjxqScz/qxWlGMyMl5bVtBj7U9mLY+LPHL
	Y=
X-Gm-Gg: ASbGncu2F9wqL5QLDRYwIA8+XmWzQfJWIu8dwspct3+4iY8OXdJ4/MPOaLGmChAcfpz
	mIi3dc6YUE7+lbgMdEtCC7Xsyty3hxma1oHTNi313vV5ce6alLyAYraRpLU38pg+79a3zOJ4KPd
	H7/WX3/SN8FZPkYcyEvXHyplQeoqsxm2j+qYZ5x3TIlWgouhy845BROTT6HMjY9R5DIaym/rVhN
	QoqraX3zh/YKrYuD1azaMMi5i2TPYOCH5fpQ75gMAFL9/FZu7dpz4RUthhad4fwv+nrMsymgpYE
	oXnx5DzyNT3Ll7SkX+/p5+AQoIgqGTq9PyHZ2wGgStME9k9jf90riCgV7uRnPwtQsr5reI1inA6
	zgrM=
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a807390ff1mr1923091cf.4.1751046931762;
        Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjS6V7nSMnoKIToCQDAP4GKzUa5d91t9ousBqXncQjQ5eyhDeXwLOlzvN8i3GRTqy4F6YNGw==
X-Received: by 2002:a05:622a:1a0c:b0:472:2122:5a37 with SMTP id d75a77b69052e-4a807390ff1mr1922741cf.4.1751046931099;
        Fri, 27 Jun 2025 10:55:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e1a96sm1778182a12.19.2025.06.27.10.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:55:30 -0700 (PDT)
Message-ID: <80912fb3-2af3-48b1-b81c-89bfcdb54841@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 19:55:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp4: Consistently use the "mdp4_" namespace
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b9076268548c52ec371e9ed35fee0dd8fcb46ef.1751044672.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ct0SYqN38Z8hXKD3hQ8kbNAmJ81Q6gzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE0NCBTYWx0ZWRfX1F8f/jn87gYq
 bC4DbrZ6T+XqhMY8HzYOZGvyXKYVBaUk75piujH1Z/Qf6MJW0/VpP7btEGIV8zAXz/osAnYoXy6
 dzi7LEI4spF6P9aweZbhpKNWcNbIbuk3wDo18gcQTBrqTChpPHZLZdJO1RBgZ/8Mn9eVIaSd2r/
 FDYY61Aeh+XrqeL7rNFhfHDtmvqpJSusA+KIH9eFynDa7QxUeAL0BmKyCXQJMOdlFo/+fP7gfGk
 FZByrvevPf5WDQxlYIWZywurp/USq9CnrIVR9RXItiapR5oSmjkJH5O25ahPCKkMPQBhc2/Covh
 jQBVLe+rVksq3d8Soqm6jeVV/FRErymj+a50u0b0ZTTXK/syT6geGS4zirCzjDqefoeVZDmJXmJ
 wRu7WfbtqWMthz1VvhrsurHvcjBItMA+9fl0/Vy4/vSW1MIxwrsi7311L2rKGo5p7wnZnJWO
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685edb14 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5MiDvfStR0l9wvLywkEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ct0SYqN38Z8hXKD3hQ8kbNAmJ81Q6gzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=809 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270144

On 6/27/25 7:18 PM, Christophe JAILLET wrote:
> Functions and other stuff all start with "mdp4_", except a few ones that
> start with "mpd4_" (d and p switched)
> 
> Make things consistent and use "mdp4_" everywhere.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Nice, thank you

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

