Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D743254B19
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577813; cv=none; b=bQHXT8r/Ll/wdEgU+98TlrfCvdRs8BBle5bx2QC3l+E2GQKPFkjBrQ4XaHdINKb9IwVQfL2M6684HZ4xrqP+olbohYUd7BCsoAEJ02oXU/TzvejuDrVwsfB3QpS6rtSHNzxsixjnYB3hSBlJgm4DGjndTBPqLX77mh0GUqw6+Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577813; c=relaxed/simple;
	bh=cGY2lIGGOd9fq+QNIYFD/MkFVxXi0A3AXTIQeZMkteU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4SjpddpeVun8+Pd2keHouCVMCEgfDm4dndlJk62bkMEpFdubrT1IgT0UCp/Zx4F/4JBbHoTNwtq5Onn4Zi74TR5LkdEM6/uvm8mInUT1BKKO2QKO4chQNEwl+v08M+C++eSxc6J8Lg/FIJP8q5HeyrEplqCZWt/6iFYPVaIzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FlakmxkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlakmxkK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563CH66n014509
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 21:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tzuYAKzYTPeS6aJtUDbc8hLD
	wJO6TUwHTIjzl203uPk=; b=FlakmxkK2s7oBRpQ4fzs1Xq3TwGXbgiEVqev1SWN
	CsyYfOsLrN8c2QmZF0y57eb4aBrMy4zhOnHb/eKqLpxk2ooz9iB+dnTXtIMR9HX3
	s2bwvM0iH99spdJsYof4soYVzM5EARh5/xT3z9k0ykpelhdM9iTjtLj1vTwmjDAw
	o1JhGoWWVlsvKO82ZPe8Sn6czelJ6s7rD4xHWCKeHDLB0Tnu6h8n9ix1+spZQEbR
	3KnQ+z+qUg5MlOtgTehnuF/n6fFwQs4mEg2O+vBr9Ux2kKK5N7h9TsMw8Jld9qKb
	u7rq3aHHtZHE/GSjQ9SopFHoCf3K3hk6SM9HMcFJgaUo0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxstas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 21:23:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so71526485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751577810; x=1752182610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzuYAKzYTPeS6aJtUDbc8hLDwJO6TUwHTIjzl203uPk=;
        b=LTtUtDY8SJcJKDajmsbt7zICAiyQVcgLDmTfE1mT8zY7iRfqQ++kAVHatQSZNDjvF1
         nQ44MHXv83iK3K96ilo6wnyplgo0QAxrtByE+7CdU49ci8qRaAS1KNTt3vi7zqkVBTLd
         HXqAGV0++6n1fadcX2bVL7AZenPfc+Fnpw4NQVQmjnm1H+86Qr/ZBNclZFeLP1YmJnDr
         XR6XacQTrK+14w07L9LMTQHk13L+AA4zv1HwAla5sIS8xgnS3+l5WuTT5Kr7WKrsJ25h
         sbCMjDhGOlrt1cIXWgytOipbBKQmVtna+s54ly8OuG6QCltQ0P1w0Bm2SJN8moQpUgU7
         RF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXrYZnte9mlFZ+lwBX5ED64hMzACd9/niTzWZLz0FGrWibHojSc7Z3/OvXewLpHZKHiZfo9IfmcX5RAAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxAK6Vry5BZpvq1wioldvLj8oWyJjYcdM+vR1pbxMET/dAr9Av
	htzVmwXVhKNrbYjhwpXwAovCf92L2jrjrx+qNijqTl4pW3ciw3FzpSBUEfYHxKh3eNkyrwAStVt
	RSHb1PBY4QQDMRUeiIgj+r0+B8+L2HBMrsSgofDm3hAoPDs1eC2R22r1/ktPuYbtVwjE=
X-Gm-Gg: ASbGncsVB/1bKgdlY/j/Rlsz17U6B0d3szG1XuLr8yHpb+i5xLG+VNnV2NqP9c62kDF
	cr7/zHDiB1luPusGqlx68otTUYL4vnCpKmqshiqAL+93/COv9YEfevKjNfzJ9CJGXp7YA/jik7T
	qR9lms08h+JBDiRJON0oouFdI7xpkilY0T85KVYgM1QQ5hIPGF0lh5k3Bh8Cni1AUfzA1buFdew
	qtAPrPm11X29W3utbcgpJ6xuDp191VrpY1RblrByLWcAjt+KU6bHu69+DJMdfgKm1aEcou36j93
	86OTWCUfCD+HllxrcI4z5Qo1+SIEGnnWjzhYtf2aepP4gHzXxlGIlXx0WP/rrQEtkXyJm9P2ead
	SMZ1tyyf6dk1Uajkr0SKFSJwMgosoNuRRyqM=
X-Received: by 2002:a05:620a:d84:b0:7d4:295c:884c with SMTP id af79cd13be357-7d5ddaa7f06mr3373285a.7.1751577810127;
        Thu, 03 Jul 2025 14:23:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFINdfgxbyPqUdf883k4+Vr9NRdf7g6WnrukLw7A52eYGFZP2R7fQunjPHXE2kuAq6Nvq0M5g==
X-Received: by 2002:a05:620a:d84:b0:7d4:295c:884c with SMTP id af79cd13be357-7d5ddaa7f06mr3369185a.7.1751577809730;
        Thu, 03 Jul 2025 14:23:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c638csm70543e87.235.2025.07.03.14.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:23:28 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:23:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Message-ID: <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
References: <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3NiBTYWx0ZWRfX06xZkVjycxmu
 dVRXm8wuPS1FuGcS/pYjn/0I46ToKlPHNW1WFmE6vVB1cDDWs0Pr3XSkbhdl3ncdY0MxNyHl4Uj
 /Cs2BdMGnyP3LnMk+qa1O4OCN91xGzq/NzR3bioKlhqB7tGrxdiXsURA+H/aNRpKbqnLyWrBEWU
 fQKXNPC7aFaHR2EB4XYigqRyVSIadetuURpZ/iQU4SU0M3R3LUNdjxDmUl+Opq7ilEJwNb1ArEo
 /5ISaJqnbsMr93zUp5ez3IAAsQKrN0/HJd2g/tPx8O6ZFNdCA3/JEDgsxTjIfL3Ja3+kVcBtkwL
 SrL9sTa47hKSG+XKRYy8sC1oGuhQMF5xLqK8fyoXPXY7/S3VHd6imFKkk2tZ9wH7qitzZMN3awW
 HSCIxTFmStTTBw5LYtma3onQksInMJ7qBOkxEO3Lq6v/JFaYrvWMlZ5XMV6Gub8Gmt93eUGd
X-Proofpoint-GUID: xg7iW4OYXKoXmExrXlNLPcuk-C5AofS9
X-Proofpoint-ORIG-GUID: xg7iW4OYXKoXmExrXlNLPcuk-C5AofS9
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6866f4d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=Ipd-sNmO_c9uXuzhwosA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030176

On Thu, Jul 03, 2025 at 09:28:12PM +0100, Bryan O'Donoghue wrote:
> On 03/07/2025 16:28, Konrad Dybcio wrote:
> > Back to the point, I actually think what this patchset does is
> > resonable, especially given the address range and SMMU SID requirements
> > that the OS*must* be aware of (or the device will crash after a
> > translation fault / security violation).
> 
> I still give my RB for the series.
> 
> To me the only question is should it be applied to sm8550 or to new SoCs
> from now on, sa8775p, x1e and derivatives.

I think we need to apply it to _all_ SoCs, maybe starting from MSM8x26
and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
once we do that, we will realize that it also changes the ABI for all
SoCs that support either Venus or Iris.

> I take the point on ABI breakage on 8550, so to me it seems fully consistent
> with Krzysztof's statements on ABI maintenance and indeed the need to expand
> the features of this driver to do so from the next submission onwards.
> 
> That can be as simple as
> 
> schema.yaml
> 
> if compatible newsoc
>     minItems:1
>     maxItems:2
> 
> 8550's ABI is stable and new SoC submissions will support the
> secure/non-pixel method.

-- 
With best wishes
Dmitry
