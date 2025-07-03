Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138251C6FE9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571937; cv=none; b=Hn/wjKoXrio7+twE5QmjZfP+4UXWhtPigrG/yBXPrdwSqBiVjTEj3N1RAaZPv1T+m/ey0fLjN6Kk2uMUFjMZgw9JtgPam4IaWkHH16OD+nAL3K/jZ3i4h7rQxTFqoqe8tQu9lwKkpAYfVzH4RHqPf0XIH15OAD5kjRiM4WYrYm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571937; c=relaxed/simple;
	bh=kSqEzppJv1vT8MFMr9lyH8GgwoqoAgSmPlT5BjUdQDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ts3xuE+DM3rmoyK+0QnrLkausR4/c/WSo3CHToEaVC/uAOcqnBUeu4yyMmeeYEa8rHbRJhWfRNzD8yMCpQsJhEtt3LpvobaWOSCgDYeaKTjeagOWiioUbiShCUUoFrG2zGOfOBHa/6wWdBoUBLETM5lWo0/wT9aKtu7CrP6c/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUQiy/Az; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUQiy/Az"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563Bk3xH022671
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 19:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vpm/8/blPnVQJ2JqTB/4vup7
	1un8wdZkh1pHtFspQj0=; b=bUQiy/AziUvgWs8sAbndrYWYtYVCEgWeL+0ZUkr7
	dLIGP5bap2LG4Cqt8xdCLSq0Fbhsw9bYTklm0GbYRIEPD1IJ7hnREy891O7XxP1+
	4ksnuQ53VpixxZVF3e4jqOO0IxL5X92SGdGcW6iio3cZDqq7HNNBzsg6njj5EPOq
	AlY8SUvDv+OLNJMxH5KYVd4qSyqrDHDv7ZlKLI52g4krg5pYPzUZCypsuan9/1dC
	oBMWWkwHq1e6oh5OSTxy4gMYcUTj7XyeIqYluQftnhsChMGZUfQAcbcKyIVVyWxb
	e0hXXYrs0YYRDp+1Bw9e+MOBueohhjFU4sW1mANnUhKXlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn87vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 19:45:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40f335529so209909985a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751571934; x=1752176734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vpm/8/blPnVQJ2JqTB/4vup71un8wdZkh1pHtFspQj0=;
        b=AdWBoeMDiYaU+RI5YVIDaj2Y6x54YD391Km1ygTlKpEB4Cw+l7vN4nkVE5b17YfFHl
         N/NdHUSoHupdKzEINUqeG0i4iU18xrqJJgPPSNfg/1910ci0S6grxBtb77QUKOtzRDiQ
         Gejf9Cdq/TRR5H7PVS7txrdZHcmWienEX70cuLnbs7WOa+FlEDJVXxIhYdZmY0yKpS+W
         TylhbomfOB7jbDk+8Mdb9OQFNmUs2spHauTfVd4qS95hUqyMXKKtpSs/pqpVr54QgQH+
         7TIsMtevNKbxJfqPv4UHyo+oAaAlbEpmOgZH6JL/Utv4PvdQyGwaYCw7ufn43xoukHSj
         3VYg==
X-Forwarded-Encrypted: i=1; AJvYcCVco2xVJk1N9yx+iSwu2GpwLbMzWZzqGn67nSmX1e7nBBHC0RLoPX2JRyQ3zCWfi2/k67Gz6cvBuAKMCnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCt0MLndwGEB36jSP9MUcAkE5GwqDEAjtx07R6MitFFAL4Q6hT
	NIKI51W8TonAlS9TMvQ5VTj5neXwWoJTcbJP+8s0UIUIuJ4zrMLCiwYFViDjeJEyqoCxhjXtgn5
	PYA5O08X64+9yNx9oESQSZ4WzA01XyV1V7v/EEU3yDyvHKb7ssq3Nuib7iQeXHb4iGf2+eDXbfs
	InVh/G
X-Gm-Gg: ASbGncsxCO0GNU8keOBHlp/JHXdv8Fb1M7923psrflhCFazit93zKp2ed1ZjsyhykZg
	6tTeHKRMipm6S+CcgsJ0I0l+2sOod6r2r+roo3l+GQB3zyYaMc8GrfT0VNQlsn4M9cUHD2VqlcV
	xj+2H+ZZAE4AqBoHKRi2Tj4sciq42nvkB8X4eN/+Y4971VqssQ5AaVVveDMD5XodHbNLnHqibud
	lI+E74lw+WA6zracpii/y2XP5ICoG/Mnrt2cSa7BOzERLoyG/0580IAYerBu3Xir53dZ2cp18ME
	HU84dX00sJwQIPYpReP5LE/6WL40Mc99WypEhFJngWWpAracGKB3EZyLG9nvdfwIJqneZTa2k/P
	/qvCtoNhs32VNCD91KkmON4OXKg98B1raMec=
X-Received: by 2002:a05:620a:40d3:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d5dc6d1439mr68784485a.21.1751571933523;
        Thu, 03 Jul 2025 12:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE2Tkd8SIj2e0FW5ub/c/5lxoYYP+U2g7RlQkzD/Ph62/PI8j/lbSO1AAEZvodVq3joV8+IQ==
X-Received: by 2002:a05:620a:40d3:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d5dc6d1439mr68778785a.21.1751571932911;
        Thu, 03 Jul 2025 12:45:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d57a9sm52843e87.257.2025.07.03.12.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:45:32 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:45:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Message-ID: <nl6qf6btlkr73ozw6psh4hyt5ke4o6hlctbgzcjukmr4dojbes@rj3zqv32nn2e>
References: <20250703183455.2074215-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183455.2074215-1-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2MyBTYWx0ZWRfX2+c8hFqzrBvG
 4ez2X4lB2FTKBqhGZPc5dSYMt4CdiDWHQGmMFaZq0wfCJzWlgfLobEbMMA/VaOPuKXE8XwSFq4D
 nHCKUTPcWl9AO+FkpHdDVG627XjyU/hZT9D3KTdpuLsaZZKUwC4LX560d24RXrfOe8mYHb9HWoG
 jRzj+M4fkJNq3jygpIbK9qBCET8Oe5L+kOyNsqDp8BmwwzY9CutzSMdy7x0teK5aRWogiRfZNdx
 5ZPcU7L4oN+h7lHgmK4ons36dG+M/vA92yxQompq+TFI6+o1EY+m8EGao8b8SOw8tpxEpz5zoXB
 EwjO71sn3ShFlxQ5zgCUx8IzQe45cJ9LGeBaPHHQACzFKyhe++OqvJw8YZk/1UGQTvDgu9ojQWa
 Jnxs+0u41r6y+Hr+eG7XP6sIEnVOHC5Lc/3i6v2h09TyTzXGwXbaVFAvWCefaEmv+dDsNuTn
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6866ddde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9sTWCGXqcYbA0vK5jiAA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XeY6BKAwsKA8x4-CLdNgQrwXor9h5s4C
X-Proofpoint-GUID: XeY6BKAwsKA8x4-CLdNgQrwXor9h5s4C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=570 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030163

On Thu, Jul 03, 2025 at 01:34:54PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different. "memory-region" is optional, so
> failed lookup is not an error. But then an error in
> of_reserved_mem_lookup() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/misc/fastrpc.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
