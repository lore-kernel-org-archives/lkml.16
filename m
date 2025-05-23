Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC4B2F41
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989249; cv=none; b=d5F9TWuA2yEl80t5ElP8gQSuk2exnolSdazcWKIezpNJtAMSRoZoWISoQsKBnmsQJr4ml+vSR5CPmFxbduGm8APIrVQG26bCuAbPRWdrUsKy3j6TNc0IRsOkOwNRbHIxm0Rnf5BP+ff/hZgjlt46pxy1jpfVxQdFxg2OEHMXMG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989249; c=relaxed/simple;
	bh=qrZgN2t3hFaQUBD/KDeC1VkY9t0XErbjd5eB8HFqE4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHExM4TAfzkm4wKM5j9m4z74OzK5fLHPDWWjEawKGT+cF2PBeziDp7ERRL7kjv3m2TUraSajP/UTFnLhqPEYZ3ylkeuNIjfttdLS4/3rtYSN1Nzaof5O4iDTM8zkyrW2MIlik5nw0ZWodB6Wm3p5zwst/wU4X2oOa3QYyC4rD0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZY4mB1KC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZY4mB1KC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N65STU000836
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=98TnTQGT3YQ6JZb18ur1Uyf7
	Hl6Rm+Rw5D0BB53ZaUU=; b=ZY4mB1KCZUGf9WlbpX6ebiSjIqy/K7zZuZzm8RHO
	Hxpor98Jc62QPVchy1hG70joVeZhoU+GUQLYKjmXDUbJhAX8zWfNYkTBAudDX0uN
	IYoyDb5ivIuOtlVWcoO5huf4AAZVmjnqC3c4JKcnFG+mHCf0Z+EnDIf4zoK2zBU3
	nyqhgt6lziqO0CpcNUEYTuWYE7EmjXcqW1YjRJUTsxznEbpI43hKUQFVvPPGkCyH
	Po93tXXBvFiilr8oqyH94Bp9tTaOmyDQnexgZtMa45rrUvOkwxda/PtalvrvDcml
	K7kJtTCavg/tNod7NWMg/u+xN16paz6kmGXUk49AhNwEwg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf7171w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:34:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso1578166385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989246; x=1748594046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98TnTQGT3YQ6JZb18ur1Uyf7Hl6Rm+Rw5D0BB53ZaUU=;
        b=wk9Mo3zBUbQx5jYsMi6/FGBpZK3ijH05ywi8XCS0QWTgx2+PDFG6YOG9W6HkxBG5GF
         qrW4iJeZV3OqFLAqk5ouYFsaES6wWXbjyHrwbXVTZj5suSQUkK50O70pqtKU8S+GrVSY
         1bo842H6OdQKZL5m7iceofMHG/84kPnyxnRCJUKzzwvyeTaQNtXAjNRyi8h6SGhwJ2xE
         4XpWDzoPXBsOj/mJrQU83MqBFC0dw2dYo6kLnC9yaIecZKt7hOS3Q0tEZ5KD9eipws9q
         QYJeNHEXjXrv6o8RPp863E9a/1T1zRGNEhG0ROtzO713R38doiQy1RxDi9eansQrC627
         AiQg==
X-Forwarded-Encrypted: i=1; AJvYcCWywPbINYOdXI5exWcX6na6mrU3pQJZTH7vB5lhTNCslIXHzsedejpFLoG/4cVXZqK3HexJ+RvW4VhBq5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGO3Y4uLuM5eGc4LGzlh5QXh5mk4gv10oCxnpTeHHJl8+nkAPn
	XaJ6rjR08RB6qeNp4d4L63ZqPKZHr1T5DNFXle0OPQTRElT9GzISZMKuSQcVU3Xnx19Tk8JQBX3
	9Zgczagp68V5zUkLp00mkh3xKdWAq2o45l43dfZKtVZdPxg+paGIkqWKyBulmj/JGJ0k=
X-Gm-Gg: ASbGncsfIW6u24BCKZx2rXtankOULCEIE8yk/D+uW198ZMSbsWKOVj9GoTsFXKLbL20
	Xk8E2c3yNjF233Em8SW/uAjefTJpT9lQHpkevNlqpHd+WaSjuGZB6cFlodf8PJZZE1iDtMSecLa
	xUsKek3C7y+3semIQxXG6RWz6DwjKtbSwT84KxnRpF3rko/C3SLDkJVUHGUlqFQh6DfqKkKKuPA
	TX4akemOeeYlIiosJj10w76lRYZ8sRsIjJ4pA9A5NOKZczFEy5gNmfszf9sJSGRpa593PSkBawP
	9QC0MJC5bbKxGVF+RjbEY99V9zBN7IT4hpxBvXKak+8ncZOGmhiYZuqpaTbVGxMaTMw/RC7WIrA
	=
X-Received: by 2002:a05:620a:4446:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7cd4608d095mr3375464385a.0.1747989246161;
        Fri, 23 May 2025 01:34:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGkJDi12WZRBVitXUDlGpAUqxYMF3TznuI38s1jPuj8NZShfppobBgqghwXbxCkkMYxXT4Ig==
X-Received: by 2002:a05:620a:4446:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7cd4608d095mr3375462885a.0.1747989245824;
        Fri, 23 May 2025 01:34:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5520da5716fsm815731e87.19.2025.05.23.01.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:34:04 -0700 (PDT)
Date: Fri, 23 May 2025 11:34:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: fix endianness for QMI header
Message-ID: <usk7l2y3o7vutmokh3dlc3fwtmxy3oxljaskymzd6rokt5bsyy@3ftinq5xwet4>
References: <20250522143530.3623809-1-alexander.wilhelm@westermo.com>
 <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522143530.3623809-3-alexander.wilhelm@westermo.com>
X-Proofpoint-GUID: 9x8JdmuOBj7-lpP8LvzV0fbye1hA2wZb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX4ZdSLq2QaYFV
 AmOh2qR3jkPp3b//7lwomM2BkHmVrppzmOwQ4e5x2DkhjC9E4W6NulalmoF/TIFhg57hD3NPe0U
 GDDjz/tWeEYIxDTnv5yhOP9N5/pq7HE1r2dFp5R5GbZcANJ3DZUapw0/y5CfhGfWzPF9E65yxHf
 IG6MX9SlmgYUTDNbqm/bOHgGg1jBCiQHyQaAuHSpcRHZs7a04FKYBhRZ8KGIYVvuE0qI9muC33V
 MgtvlkU50Fuz4D+DalqlsLEPT4eVsjZbr+JuBlSbu7k4fAdTH3yiI6AjMZStNDd275pQC6tdJDn
 1CHveNqkPV8K10/6L8gw2T/Q8m2Ok+tIGOJnFxjgaopmU/4RnzytPzXc8Y9jpQHcyQ4OoOznGdX
 r5/3n+WIXWfnTzD3TAnHx2jStwQ8Pu+RqZ5J7zCijiJyg6YP6phWK4Ns++X+Jmt/I0p5dv+p
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=683032fe cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=XW_CCpt8tLB4Xc_L39sA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: 9x8JdmuOBj7-lpP8LvzV0fbye1hA2wZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=839
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230077

On Thu, May 22, 2025 at 04:35:30PM +0200, Alexander Wilhelm wrote:
> The members of QMI header have to be swapped on big endian platforms. Use
> __le16 types instead of u16 ones.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>
> ---
>  drivers/soc/qcom/qmi_encdec.c    | 6 +++---
>  drivers/soc/qcom/qmi_interface.c | 6 +++---
>  include/linux/soc/qcom/qmi.h     | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)

Fixes: 9b8a11e82615 ("soc: qcom: Introduce QMI encoder/decoder")
Fixes: 3830d0771ef6 ("soc: qcom: Introduce QMI helpers")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
