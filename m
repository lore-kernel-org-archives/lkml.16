Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4484D2E403
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844967; cv=none; b=C/ouOCNz4cOf0eU0uBLxiOAiUjsmL24ACBz0tZLmAqDx2z1C7VKAFCr/vJO2h6Mp4EL5EgRZAv//fwOvv955IPqzxDDiEbqN0ElqP4Rn+A8JG/c2QwPctEaNKPObEuv4l+4bkGEtwwRD3ICXBaByY6okcmSKKAOw64XKTAULOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844967; c=relaxed/simple;
	bh=MgYGJjcaOy3g9B8ansHeoP+Sr4Le37ZDce4ZltXmBE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQkrbx0NdUF/x1HsVcF5a2Z0AA4wrUUstE+QuYgttl3Orbd5W0lq/srix2rZqq3ZS/lW3QONWwFouBNyctsc7bAO2/iOFLzO4/oAhozoRmElkeMcs6oQ8YFtlGCFVx6ewSmhAbW7/N9OoY7SAzscv145/OHkQy5AXhiwNx/zqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XraCxOmu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XraCxOmu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551Le1Hh030502
	for <linux-kernel@vger.kernel.org>; Mon, 2 Jun 2025 06:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L/r1Qv5RI/jsPHsDGhlVxJ4P
	JGcaISPdQThlQ7RaoCA=; b=XraCxOmuQkm3GjU7crMKmoD2Vi5RRyMYOveQjFAm
	06stOP+tXqrduiiGjySgicTqvRcLkOWJVi9zU72Rw+QHC5LD436OXORNgJ467KqX
	t5aocx0CUjoCV1JS2hbB601bL7iWsyZD3GT1PTvMpA5Uxy1sXbqvp7wLAi9YWhfz
	b7oX5sYbRJFyDLrn4c04K+pCdZk7M5fbDDEw7sf8F+spupZPFEOt8d0Gh2g9+Tdi
	CKiFYy7OFXFesIeoIdg7G92LRtxt9Vs85WeWRHz/uf7UHy0t/GcmpxSdY7OLdTsz
	e0V1xPITXFiinZyOxJuVBT9+l6Z91SAEN+P68lsj22B2ew==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytsduh2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:16:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so577394085a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748844964; x=1749449764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/r1Qv5RI/jsPHsDGhlVxJ4PJGcaISPdQThlQ7RaoCA=;
        b=bwAstRJDK3LYzEYD4VtMRiB5kWNRXVknI1lOZ5QdrP4UKsdFJsCUuxszQ1LrSzU2ea
         5DS1EgUoF53Q/fFG9MnREmzWMtVuNgYTAm6UZvKSTxAN8DDo/hJxMQz1s1CckBX0MTUs
         vwky9fKhy+M5VWdBlqvuDSjno4g8MNdaxDW6eJ36mNT0fFT3j515MKmyYx9DxkO/IMZs
         vphlMToN8oMbpLYoub4G8JZhRy3t/+2pXoeQVU5xhr/AFIM8FAf6z24ir64LYo462u56
         eowCUfcRQKMmiZKqh2eFXmg7GF0lkMpTI881ekmHbBF4XVTpGk7LWzYckrOg7L1s9GL/
         MzMA==
X-Forwarded-Encrypted: i=1; AJvYcCXhXYrNBfkBKqpeRErMf/bcd8d9IFUlQDt7QjmbAsO5KLEhqOXuLR08YhPnmki7sdnJrFf057OHzgcGwOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9JC1pn+tl6iRf7xnhTD4EFyQgNL5UHmvuBHni6kSVIZI/htw
	EhfF65TARunXUy5zVHDmpa/rfNOK+jnQ7JIJP8YhHrjli9Qmw5Wh/k41NbvEOrRRZJ3NJtJLWK8
	vxVECQSg8o7awtoQIeZbiHv6p5z4wg1wkmNKerwbahXAd+FlfW2/FxQqCqJLXO78N644=
X-Gm-Gg: ASbGnct0C+Nx/YbZtNjtCvjsO2/tG6FbM5642gBrjROaZf9sq6Amn5w/78rk4PdgCFV
	q/hDaLa0Q+Stnqsy3Or9JofhyYamKl0uMkrQc9ti8MufdjOzm9ywlIDldhYBMzZ21P5SW5gzwAB
	5dX390ksKilytjKByq44SgCDWqWtsv/e6OmumHqDSQjQs2wXK4q5K2j/lqX8AUrj1OiWT5zdUfJ
	vqV0/di9bpfbNiVpCv23gltlHvZBg4TB0yXEwlhYuLL9wGVWpMiW2HETKgBSg6ZYQY5Uwia6Iu2
	mat0fU15oNVFEgXNXwD94beamnvbgfUe2guxSxGqDdvTRl185nbDoI7QNC3qXJ7lqtlqqrsunCY
	=
X-Received: by 2002:a05:620a:28c8:b0:7c7:a184:7cb1 with SMTP id af79cd13be357-7d0a1fa53e4mr1883017585a.9.1748844964002;
        Sun, 01 Jun 2025 23:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ1bSQahLqe557WjaS0ITXAp9SVSOpdyV0vMovbwK20i8iAjbOrnNSBp++Bxin6ICbH3T2aQ==
X-Received: by 2002:a05:620a:28c8:b0:7c7:a184:7cb1 with SMTP id af79cd13be357-7d0a1fa53e4mr1883014485a.9.1748844963605;
        Sun, 01 Jun 2025 23:16:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b1b549sm14081971fa.10.2025.06.01.23.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:16:02 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:16:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
Message-ID: <t6niql4jfotjnbducypwxkdjqt3or7k3rwmltvbhifmpphsiwy@er56ey4v2pzo>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
X-Proofpoint-ORIG-GUID: llgk6GQyRBMjnoRAVutou18tZNi4EXH4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfX853VA8SYrJW/
 FaHMKcz5mRTdzcf8QL0HsxhLIP+KSESm7Qve9P3DCo7/jtyeDYZT7z/UG1JJS03URMrK144X29z
 J1Zd7gNVhzKfzXosY2bQSWTEAM4F3eH2NT9ICtv+i2lAtpP4SzTW9GJtpnJu59kaKT9meWvitJM
 vRPSIGFN86C5ZIqCuiBiJKpKR+Tb2JJo7yrO5kVwCyfPNf7z9q2tVqjzBgLNO84nq+54Wcpu7lc
 FayQrh9XBEqmmT0/paOCZ5oEHSgdiu4ZE4BwoXJkmRbX3NO6dpelhbDxq3rjCa+lHKk25F2iuew
 40G+YXvV0KfakFGllWOC7tnPGcT/kiC7nvdW/fABitojql5CZOoMr3NZS3ZBqkunNHEpcgyQaCt
 7Kw2tVsLqZ2TOZXe6fI2ZgWyBib5mO+ATdTwx5ysVOqTUhvDiVf/BYVYEZtAOr9OsRQ14SWK
X-Proofpoint-GUID: llgk6GQyRBMjnoRAVutou18tZNi4EXH4
X-Authority-Analysis: v=2.4 cv=bYJrUPPB c=1 sm=1 tr=0 ts=683d41a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=811R0v4fTQpBtjd_nOcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=530 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020052

On Sat, May 31, 2025 at 08:05:24AM +0800, Renjiang Han wrote:
> 
> On 5/31/2025 4:27 AM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 09:32:12AM +0530, Renjiang Han wrote:
> > > QCS615 uses the same video core as SC7180, so reuse the same resource
> > > data of SC7180 for QCS615 to enable video functionality.
> > > 
> > > There are no resources for the video-decoder and video-encoder nodes
> > > in the device tree, so remove these two nodes from the device tree. In
> > > addition, to ensure that the video codec functions properly, use [3]
> > > to add encoder and decoder node entries in the venus driver.
> > > 
> > > Validated this series on QCS615 and SC7180.
> > > 
> > > Note:
> > > This series consist of DT patches and a venus driver patch. The patch
> > > 1/3, which is venus driver patch, can be picked independently without
> > > having any functional dependency. But patch 2/3 & patch 3/3, which are
> > > DT patches, still depend on [1].
> > I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
> > on QCS615 over(?)clocked.
> Agree, so we need to make sure that the driver patch is not picked after the
> DT patch.

Worse: we need to make sure that the driver patch is present in the
branch which picks up DT patches. Otherwise building & testing that
branch (which is not unfrequent when doing git bisect) will fail.

The easiest way to ensure that is to merge driver changes in v6.N and
then DT changes in v6.N+1.

-- 
With best wishes
Dmitry
