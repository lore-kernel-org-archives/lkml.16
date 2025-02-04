Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69CA20409A
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654518; cv=none; b=YopIMGAKfRXTto83HDoDX+fBsLf6PNfMHtVqG1GqAb/S/Sug25uPZlKdtChpqQz8ZD/uByzcPGTdy/2abO0RXYBgUUXhhn7X1PT5qhkrGWnwaQFj3DPNBnxiMmzyHzaWU6DS6wUmxas0DN2q4XXaRwiuNLD+amgOsU9iqllS5xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654518; c=relaxed/simple;
	bh=xQAGdSbSIYSyiBdU3C21sOz/sN3QXi6wsOZNmif2uiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1kdcU4ZuujiwlFN++YCYacUdAw+JaOILEUTXUknsLSKCSngeBMWpC2VPoiony+7+YXqBr2phPHBsIAC0spE4TRgqDCSyb7v5eI6b+CZ169MO+XDDHeD/gYpC5NNzaUa4CISyYxQVHnxjKCZwu4+mA+Nk0RDgfTHAJrgQxCykmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVe2M62G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVe2M62G"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51457g4Y006990
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 07:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8CC3DNaNwstjCL5UYvX2ni2+zBNkZ7cSI4Dr0j1vnk=; b=HVe2M62Gi7FCp1Eg
	xkDyMnd0EX9PAyRkjey7X980MzYXFE3PsrG1XG56MRgZVPciPAOyl0ibTu6/CkiJ
	QtPYLck2Vg+Db+NOOC9qqW7JkpoExK9TbPjec8WC0DxKxq4eXb4iXWIMM0yvpKtk
	cnX3Ru1OHMfXK+s+icundJ7T3c/i8yl7rAO+42ioqeqdLVxHwNjzhZLjGJKKohmJ
	1W81NE2WLTuAcA5Cwzh/5KgeAyqcelsoMy3m+hY5x6mSpNlJ0BrWkoHf9CZMHqTd
	PoG/rY2Hbx+SIULiGjX+iRJ2nt1E6w7vJzZL9B0V/IH4CvRtowfQ5JqbQBpxyUjR
	Qf2kWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kcfp09dg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:35:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21632eacb31so76909325ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654514; x=1739259314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8CC3DNaNwstjCL5UYvX2ni2+zBNkZ7cSI4Dr0j1vnk=;
        b=kO8elOG3LYH46muEYxRvva92uQOFpAAW39f3Ft/9xaLiX5h+orBIosgjodoVsUhLep
         tNEQLFAz8NUhkYy8UuU9eIjdbxXVzE9M75AgGUEES6qGC15sRvu0d/tmEpWPZlZT2JeE
         yjJXF1d/s4P6SwiXdtiRoi5kE9LZ6sfV7/aVgYE/Yeq1FLT0vusPY+FH0IDgWT568sEX
         WZMouPT+5XaytBh1ON7trqIhO164jAebqvvRi5utMHDFCawGWtbUqGkk1aaQwrB5Y7jz
         /NKDEZ4RdC0j0cnf9T0qWtNAKKrfhIJZQyBCCgBQfAkz42Uuc/cQ7TB/EKn0+LbgpQZg
         W7sA==
X-Forwarded-Encrypted: i=1; AJvYcCWE8KP3fOpbTXMKLFm8BElFHqb6HiO1/GqZ86Bqtr4KFEXKYBOP5mrVpamMp1KoSVaryqYax+jZTHJnDvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6fIbiRWRHV6MCHqTBvS0iL0fnri862M8II/oY7M/eBV3mslBp
	dwCyRpN78met9eK7hmV8+y0bizBzTXNjUCx7Qz2ukI4Bo9kxyk1hgJMQH+fVzCGjpqP0K0SSG6T
	9bPs4JN39UrgcAEz6bu1czK02mK3eBiu09bWyC0a74UXFOhmFfPsCV92aQAfab9U=
X-Gm-Gg: ASbGncvxD1rDVw8wbk8OC2MUBZ9l9FLig117k3mHrribkM/LdKyBgCIUSbO9NHo5J5W
	KpQ+LQ/ouEGw2ccQB0pJrFv5/woIlOObPqWCH/ArwrQNi+FoRJAFDeosL0lMHdhJSxE0KspGRUM
	1bjBJEQJdtiaWDDvEMYOz50YqjqgFZCaugUiVxvgsFlOjbxhu4kvJpyCrpEx/AOGc+jHtQObXI5
	aVEwwxN8WPE57wi/81sIF7HQSA8Mbv98Pd8CJg/Ext3tnYSlW+Wsn42gCCM9pf+2LSntZ/6RtRz
	xdxUTFvKGCNvDBL+CUL/N307HUIASZ51RZ86JqHAj/+Q+us=
X-Received: by 2002:a17:902:d4d1:b0:21c:1140:136c with SMTP id d9443c01a7336-21dd7c3558cmr363849565ad.3.1738654514269;
        Mon, 03 Feb 2025 23:35:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4gw5bm/pgvM7hItOIb2mRVVbANXJ5lA/uYMkezaugLu7QXPhkzFwO5gbkOyIlpplWZcOdgQ==
X-Received: by 2002:a17:902:d4d1:b0:21c:1140:136c with SMTP id d9443c01a7336-21dd7c3558cmr363849335ad.3.1738654513798;
        Mon, 03 Feb 2025 23:35:13 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33032absm88861265ad.187.2025.02.03.23.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:35:13 -0800 (PST)
Message-ID: <18856414-c05b-a737-5567-e8669b2349a0@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:05:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/8] wifi: ath12k: eliminate redundant debug mask check in
 ath12k_dbg()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-1-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-1-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4-KKd_YZBbOsTTCtLDc9YnMLflE2th0H
X-Proofpoint-ORIG-GUID: 4-KKd_YZBbOsTTCtLDc9YnMLflE2th0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 mlxlogscore=720 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040059



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> The current implementation includes a debug mask check both in the macro
> expansion and in the function __ath12k_dbg(), which is unnecessary.
> 
> Simplify the code by removing the redundant check from the helper function
> __ath12k_dbg().
> 
> While at this, rename the first argument in macro from ar to ab since the
> first argument name in the function __ath12k_dbg() is ab.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
