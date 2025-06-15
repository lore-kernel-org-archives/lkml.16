Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183CC1ACED9
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749987543; cv=none; b=tGTH/p7SHbHlfw+ApgcCokSNTsA/wVY/5XXE0ckgzU6P0ven9vY4JYVSXn+8s7UYNkvYq5Z9hWjQml1Q70dTMxX+RDO5soWilzftJpf/yCse/4OnlzItzXZ/U2pgpoZmjdQKWrcJdEWNKQzXFQV2J1VhMjSyiDUDEw36tmjDTmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749987543; c=relaxed/simple;
	bh=1NEF4CuZl6XkHdOPgpRvdy/DJwiozgv/UKWN5RSkn7I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayjqglMZM5naEW9K5L+DT79OEQU3rB92dYMeVSfMkVPFpDZ+vEaJ5Q6LCzVyGkilXvRnLGJSibKgoTVhuBppHGmeGTIBaZxh1sz768+LGjzT7oQdOwFmTc3LL7N1F6+e/OppKEToiU4lo8pLysryrEvPLV7PgIOi0cD7V4sExxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nIxCng89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIxCng89"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55F9MXcd016831
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UBoqX+3Hym0qFKqFeJ3z8WDW
	1r38LQFsqZKGNgNTNII=; b=nIxCng89HHNUp82AHFrMfHUofZpSIEatGzJIRGXg
	nFO/+HPocd/chbvjqDnUcYlen2HvDVF9FLU6q7fhhIajEDut4OI7jzAVN3MP5fjW
	aP6IHiEa9jjAP8ZRlqGKrPvqL4klvk0mUiAJzSyeiurs8Up02cMn5lSrjYOtO5R0
	41QWK7mCzL5vFyV3eaVDyMbxTqTeFv7+OO5OultjDw7U2dkFfFYYbYMRH71Y4Ahl
	uE9v9gYuJZ5SJdncJ9aHWOqTjDLOdfvFmmHgawZS5cwSZ/29NdUTe7XJ0xdeeCkB
	rOqNKa5KWeiCX058AXotW1Tlxne5NAdIWr5XmwI8UHc47g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f71tpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:39:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb3654112fso64576346d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 04:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749987540; x=1750592340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBoqX+3Hym0qFKqFeJ3z8WDW1r38LQFsqZKGNgNTNII=;
        b=KIc6tYsZq33WN7J6FTWaQm7nGqZUGM4cXL+mSK+1c+lauxM47YzCJ8SgUxS0vz2UwL
         gTyIhc3rXWVD77534k+qGbkXj+Kk08fUGseNjUya8akZi1tty9YA+Tm8WZzKCxR2rDI6
         p5gEIZ51eu9HDMm8whqF9RPs1pDIVn9hmaitN1/8SssdHH4SdtrxW3alIJI48JNzi7lj
         dn4/IDYymea6ShLrl/vyVgVlidDp7TRHwP2K3C+4h5YO+eN1P7zODHWjsH9zseYzw4b8
         FN8jqVvzHBMIWl5nhfSYLa56VwN7HOS0tQ5y0xeWQK7C8riUdOaQHc77LG+/21+WJIa7
         CeJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX95npRpvkaLH2owRI8J97zCrBq0xVat/gAaa9DQKhG4Cggwy9nk533r6yW/WpEOciiQtCFRNZ+LiVEPYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW4IcFrppA6gD4Hwb3DHocMgW8aaMv/k4tewO4w+sVbMV7Z0uV
	6U16R9cm1T4emHHRwwU/f0UBVgKdqz3z2ucuemFq7inn4mG9eCtOXOVHcAocGFcIe7Q1C7Zjhxf
	buTkLn3Q1M3OaihG//NOYenq6st4bQxcJnmYBNrTXKtiEH2YLCsm2NNosNi8r7+OOZIY=
X-Gm-Gg: ASbGnctE8LRz3pJp5YGayoVj1vQXBZPsEXZNnVNn6kbThlotzU5kkpF6GMe6X7GaPcB
	XqdKyKTaACXwbhpdPsU1F0Ii82UmBMzYgxnT4OwYTfbnLEweTJrzGj17hz9OeFcokSh5w3H9huZ
	iu0TgS+KAu+DSaEavaM+4ISLnvvRnhYxhh80kTageCmfUnsGAwvrNQD1TZFrovMkg6iGEl94g/t
	6t2k/F40ncetvUUntZTqlQ+5gksOiDKdYuMe9gfNoTgs2xfDVnq9fOyIecnKmLAOL2y/49vYXBo
	vZrbAqnBgE4t3Hg/MbrlI4SAbopzX4W0L/AttdlAutQgFGwa+BuQfoFO/g==
X-Received: by 2002:a05:6214:5887:b0:6fb:25f:ac8c with SMTP id 6a1803df08f44-6fb47776ff0mr105472356d6.31.1749987540196;
        Sun, 15 Jun 2025 04:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnDnD2gFuBvFJWw1NO2xhhVjbSbBgo0uadoGraxhCPWnt0fyCvH3k9hDcI8uklWLjMXFdeTA==
X-Received: by 2002:a05:6214:5887:b0:6fb:25f:ac8c with SMTP id 6a1803df08f44-6fb47776ff0mr105472026d6.31.1749987539808;
        Sun, 15 Jun 2025 04:38:59 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4c969sm7401734f8f.85.2025.06.15.04.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 04:38:59 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Sun, 15 Jun 2025 13:38:57 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aE6w0Ws9aoBYD5BB@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <98cee94a-c9c5-46c1-b6eb-f5141dfceaab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98cee94a-c9c5-46c1-b6eb-f5141dfceaab@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDA4NiBTYWx0ZWRfX5nyZCibwiXVQ
 mVqb4N48Pl5hf40kV3dHSE/fiRxp6bbPfWQKwZHyzWPa1PEkcNwocGPXX29I8ryNulruwtxMTIf
 ZoVTA/faLagvY2Q6pZi6zdd5e6B4JB0NIYWDLQbF91ZtTEwik3T/7+MiYI3l95VCzDroqKCF5js
 mWw81GeE2GeWYeKlNDQCJayWXT17uHYEhxkzqCozsGz8vuNNqJZj0L3jAV/1L+9pFux/xdywyC9
 Tpify/6348ghtht71ig/etkQaEBtNUA3O1GmWIBNsRDNSnH41hapVHr0N070oWmxAqvIsP83VMg
 qdlsSpFXWCR6caa0VFMEJZ3Hv4z9nrBKqb+EceJTN8m3t4nfY3noqYI6Y1RbQHAcCtwznAgasYF
 /1Zqr6yY/gMZ/tfKENamPUHHloDtx0LLpr2+V1P1DhRY7bb9RFdnJxDb2ifjCbfSktWh6cvG
X-Proofpoint-GUID: 2kF9ru3ppGqrSmiRzXGjd59iDNZCbUEQ
X-Proofpoint-ORIG-GUID: 2kF9ru3ppGqrSmiRzXGjd59iDNZCbUEQ
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=684eb0d5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=Pi3DeBJX6SzEokaTFKoA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=852 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506150086

On 13/06/25 15:20:57, Bryan O'Donoghue wrote:
> On 13/06/2025 15:03, Jorge Ramirez-Ortiz wrote:
> > +        video-decoder {
> > +            compatible = "venus-decoder";
> > +        };
> > +
> > +        video-encoder {
> > +            compatible = "venus-encoder";
> > +        };
> 
> Not necessary, drop.

ok

> 
> ---
> bod
