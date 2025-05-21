Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D59D268FCC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834189; cv=none; b=lz3o4qryXzBEds0V42NHnT67zu4vBUzaiV03rZm7olfuUqLcJYgKew9Eched6ZR1SAUfTEYHCXurrk/o3iDtqD9TkijTeEm510iF+5A8ddHkuKhR/ysvlZwv4ZHJakgW8GRiJn8wGGFhPt4NT+C9KVyQTJMvQTyZRIZr4cU0EAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834189; c=relaxed/simple;
	bh=tlg1lzkYJfIIie1O0gwsHYFTGSnrPtTa21pJSRBZrYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpHg4erlrVaA4N8C86F/DsJVNaYwYceOP9Q3q8i6/ebinriuWmZCU7wTXFqxTwbVULeo6yGouvghH5JjoKafiuaBb2iJX/scqnlPP8xSr/x0CtOChdwf8FrgbeBlczIyp/OeKkr5x1EMZvwSUtn1Q+bT+HQ3fcj7kIif2I8b6qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFeEbAn8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFeEbAn8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XTJO006659
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yB5N65tJppWHuCi8FRw9iMEM
	njhFwmKIAmj2+p8j+Zo=; b=nFeEbAn8AOTdA9soMZv7HzFxDrFHjlARlZbffBOj
	uZ2m0dGbTnMvqD+QonYto89cxPFemG6cRnqPy9GhEMfFbDGTATO+JpJLzJOWk+0d
	NyUb13ItY9BUnIqGBk3JEnnNdFy/SKHNMm852TnthTnKm3PIs9zvl0BkHUi9pLhn
	4+4w7GbYECy2VC1v8ajOymBtmEwJodX2YxYnK60V948naiVBq24SZaPyC9ku4Ahp
	YfoR/5lvFNox68bObaKOk23f5p2ZmGDSYtnZjvGymQZgyRNwN2lvEX4UTzbUjO1E
	bS4nLSyd1kKXFh3iIW+jGtKVCR8MebZwnUalB1tyA2UA4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0k3vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:29:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476900d10caso160051601cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747834185; x=1748438985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB5N65tJppWHuCi8FRw9iMEMnjhFwmKIAmj2+p8j+Zo=;
        b=lMnd9JWYVwc/Q/DmChYFMBGX/r0Opnme9m3bAm92aMXbtfa+4iK86v3otchS5opMx+
         wMkhxDzdc+3pDAjTViQ9uBj4qYp4q6KIHaCAKGzpHsLHDBoDzt9RQ36gIqajq3w0hSXu
         U28lvcmXkjZPrQcTHymfq++5e30pLH5Fe50EbXIU4zOo1HGyU5iKbyXWG2rpCUp/Go1h
         ITrchpN9IClLgGtRAxNkmui1LWxPhaU7yU8lNvVMyoHrGqKZmAxzcdQElf+OQaZviZwV
         oCHqRPV7QVLetZKCdx2Tbhi8qGR7Ez8Uy3Y/+mXcCHNyrwhnHuaTQjzgIVmu4CYnN3xi
         s/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3vx6HTwa34xsl6kHyZTfU/68GuXgw9UQrX5zh4s5WykAckd4zcsozczdlmo4azxbwNAWaLa5Uo7qAFpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3HwaBXPD60BCWr1qK6N845rMc9Uq8yzpPt/cykmR/JXdRZ30
	28NgXtOyxQDMKMYBU2sIuN4+gmlKV0gtHAXpreGyB7vJnzv6Mz3xxzs33dAHeGQsfirfgRbTw2f
	2Xa+i5wKlWeToeyZ21MgTGJFTVHJCp7mv3s554O+UeTXBwhlxcxHVsI5gDuLh5GelblXgvw389g
	I=
X-Gm-Gg: ASbGncsJaG3a/9FT6X1M+w+SZYW7jYGYa3UDYC2vwFDqSz1cssm8o7HRJQqiIdkZhN8
	UyAX0ZsdymdUH/WDRY4U3u04BfOVFFjisywHe+2KAC4aMI/n8eDq+C+W/CMhjUWriZOlBER5jbI
	PnuBPgCBZMtUYVFnYYdKlNAmgRiB+9hnsI/Is28+fLW6y4ZYsbTS3ABAbv8EaJ7vAy0gveWD0y1
	Y/RMs5QMxZMraiIMlS/wL1QssPOm57cTAt90oTurjiL/15NaQNoXTf0x2tdRqrz93y203BNtUen
	jHnnsZ86GdldP2jLxtZFB9DJCr/lcx7pOMZuSiZYoygED5VK5To+7Yf4Jd4PPuTW+goC7KIewT8
	=
X-Received: by 2002:a05:622a:1891:b0:49b:464a:3f6 with SMTP id d75a77b69052e-49b464a0469mr76248311cf.4.1747834182983;
        Wed, 21 May 2025 06:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLno4oDfMSD+g+A5XtQec5aytsPNBkXfe9N89uXd43okFNSnebocYqbtoiXPeNdVJfVlhxww==
X-Received: by 2002:a05:6214:21a5:b0:6e4:3eb1:2bdb with SMTP id 6a1803df08f44-6f8b2d3a73emr302130866d6.43.1747834170228;
        Wed, 21 May 2025 06:29:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703ca85sm2874298e87.217.2025.05.21.06.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:29:29 -0700 (PDT)
Date: Wed, 21 May 2025 16:29:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taeyoung Kwon <xoduddk12345@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taeyoung Kwon <Taeyoung.Kwon@telit.com>
Subject: Re: [PATCH v2] power: reset: qcom-pon: Rename variables to use
 generic naming
Message-ID: <uvqqq2f2mhpuqvtq2yrxw7nkw6e34yf2bv6ulkglutgq5wa4dd@fi5h3m7yibz7>
References: <20250521131116.2664-1-Taeyoung.Kwon@telit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521131116.2664-1-Taeyoung.Kwon@telit.com>
X-Proofpoint-GUID: VQXA_v7zYBVIZpGAb8XvxdO8Oi3Y08jI
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682dd54b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=8xVn4GeRAAAA:8 a=EUspDBNiAAAA:8 a=38eAcjmzj4vKwzUmQakA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=By6hKCY_mHIbKsINY6vW:22
X-Proofpoint-ORIG-GUID: VQXA_v7zYBVIZpGAb8XvxdO8Oi3Y08jI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzMSBTYWx0ZWRfX4gAYaBbYi5kF
 0Yv4LoeX7QrCXyJprSkoPZeiKqT8k0uzYMiFhBaANaqjYVpfE5DO+jrsMqW9SsY3ptf9Rq/uWoG
 acBIYc8Gb+GdAbgCDBzuVp0Thzgoimsmw6Ew+uJe/2RJqI3Sb+BAIpvqcAAXfcjxt/08akEy45Q
 hZpGAWoZ9yo+2gI47tLz4c5+SRQ0I2F1jD/6DoqIJ91oNER0Ywgsqlkg/dHLNzqrwHWaiflpkN7
 b+5fwpB03UepQnHk0qhGK39gD6kxafPmwy3d/SJzKH5L8mJuySmT/wTLH7OxqyNtP4LaGMpQby9
 gs2H0QjDKE6zxc0Fq/TH5kCvtHYUqujv8SDlSzXru7o80m+MFmgKoNv/LCqKppeI6NsR64RliDj
 7w4RTOdHY+FLernu4GGo8Ikz/hnRoYa45TnJMia/HtXeVQk0pvo4huL1FSqj2uUWPAK3FpxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=640 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210131

On Wed, May 21, 2025 at 01:09:52PM +0000, Taeyoung Kwon wrote:
> From: Taeyoung Kwon <Taeyoung.Kwon@telit.com>
> 
> The qcom-pon driver was originally implemented for the PM8916 PMIC, and
> as a result, several internal variable names still refer to 'pm8916'.
> However, the driver has since been extended to support other PMICs as
> well.
> 
> This patch renames those variables to use more generic and consistent
> names, improving clarity and reducing confusion for non-PM8916 devices.
> 
> Signed-off-by: Taeyoung Kwon <Taeyoung.Kwon@telit.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
