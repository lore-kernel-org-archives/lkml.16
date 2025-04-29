Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79DC224234
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950894; cv=none; b=udl7mAS8QTKTEObTPLb6CdEtDbWkiBPDLsvxfaQnsV+1DzSk5WqvY4zi9ACQGCPhhHolnlNC4nyZQEmwhJwUA5Hm+hNW6bpXufasuLY8OjfZTs4C29KZhQRX7Fz6bMzDQjiBejOSkyfkRGmcKoa8efFmwxOY3GZ4xwUYlaKsGxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950894; c=relaxed/simple;
	bh=RdP3O/juRVH9lxADbiwNKQ/bCCrReDlQbPwIO3aDojo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nOimJY7sGJMlrQAXqe2oHXQAidhs4D0NcGTMJqE4ieeAT4Yh6+Fj21QSZLlifgA6BmaSzq9fgEBGEXvNZBhifI5IUbcIG7Jxq6+2PSK1aIR57pwA44qGLnwblEqNuju8CLbtTzWJ6zj3UQIdXI13XRU0nDExl/qnOWMIXZx5wug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOTpAYgx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOTpAYgx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA27nG019654
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PmqoRG464qsnj0pu8T0c6779
	M0hEG7ElmjAzQA6sfi0=; b=AOTpAYgxnyRsVZRjLRr7VXvigdkz/UwUlNRZ7MPu
	qniHDYs5yr1d8BtuPkqTU/sBWuvBH24kVXmSiAqdM48hGYNC4P9TGyHn4S1IPOX+
	bq5POuQZNvTrrtzgMxXGeXI/mROs3WLNUUY57vTXMmGHoH+Df/y5qSo0hzxJSH4B
	HFaCBTDHCvcxGStbRR225+2yGvR5unAVw26dMVzYFlMy1RqDaDxtBzHmuAqJViDW
	d3KX+41X+sHKyBPn8ZTkwNo8bFBhWuqnR7QVQHHnHuGos4shhcyJs6QQBL5g83Qy
	xJChDYWnI9F2bIYsA5+2advFxHyL5VdS30mWOZS9y7UzzA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jmsuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:21:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so1255180585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745950889; x=1746555689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmqoRG464qsnj0pu8T0c6779M0hEG7ElmjAzQA6sfi0=;
        b=DOt+HQ/cC/eDNR71cxFnP9wPQyWQoXa/j+l2hdtFpHnt4xT9qbcgnTA8n6YcpTI0F8
         DlXtldTLfvqk38CQjA0oXIwMhrbYyD+haRXtsYPFebKkQnZJnbSwQC5N0xLEXmQMcHQ4
         tJ4fzok+AhwrrqNKWLUfBwsfyoNtuwBj0vwVbsXyPzQpXOnwrm0MRafZm003jjbFpTty
         OsZC0ZIZEqzPjWClSgYdHus9Vd2UIctZNBs++oRLZi6mvR9tQUdX+XBNdpVeli35sW1R
         AWuNW6BqdivHuUZRLrE1awkMejHfvBhurAwurU/54DsPGq2KWNNMFwublU16g4qfNW9e
         JE/A==
X-Forwarded-Encrypted: i=1; AJvYcCUHHt7Sz4moSyAKwd8XvG2/zCT8y+K82S02QdrfuJynnFhEv4SUJ1Njv7Zl5eG4B+QGUhfIxQ915hamHmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqMmUX6sHmteZP0TRH+DBSvm/mJq3OjDq6ZzT/7WQPVjkOgzmO
	9BlSX6f/J+pxJFGZVcsnHKqRh/63qvfk1YXWKX4nQ2q/BBCOSX4iGiauLKzKAcbrqBsS9gkYUnN
	ZQTTdiPYws+1MIYz7667Y6V3gBnTVfR2D40j0Z8/jQ0OViTu5caoJ4QwZF/u6gQI=
X-Gm-Gg: ASbGnctpyfg9Yu/tK+LExfVQeGBreOjAPU494in2MoE+47ER9pjcmmbn3ad47FbVWiE
	8xGi2uQUdwa/rLRXQ+Mb2Q7qOAGpGYXaJy1npf7hxnNZQepUqCoa/Zu4XleBpelCi8nAN1AX1rD
	u1aQCn2tvdfKUJDcXhQmIvGRNWz5a+FLLsZ39gl7/DMs8tGrHHCZ962BOohGOQ4jTWaLm3OfJJk
	kX450Ars6EkAuXTWOZWrERFWghWDslctD9kaJwjV7MvUWpJxyvroaUEpi+UjnMnLnFWFVkWfD4A
	hvKGKCPfJ5uL6TyIjQTF3LgsXAsKvq2VQnpnPzVM1z7d4FRDwwmDCcas5zcj1ssR4gYot8v9LC4
	=
X-Received: by 2002:a05:620a:c4c:b0:7c9:2612:32d6 with SMTP id af79cd13be357-7cac76deb67mr10119785a.48.1745950889447;
        Tue, 29 Apr 2025 11:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpf9hzPxO+ornriQj5u2UWfhmL7wM+Z3TXsQc5Mtvy+HyZAWYphfNSkz3n79ilJezodpQzrA==
X-Received: by 2002:a05:620a:c4c:b0:7c9:2612:32d6 with SMTP id af79cd13be357-7cac76deb67mr10115885a.48.1745950889098;
        Tue, 29 Apr 2025 11:21:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e8fd2d823sm1322651e87.194.2025.04.29.11.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:21:28 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:21:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Daniel Stone <daniel@fooishbar.org>, dri-devel@lists.freedesktop.org,
        daniels@collabora.com, helen.fornazier@gmail.com, airlied@gmail.com,
        simona.vetter@ffwll.ch, robdclark@gmail.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, lumag@kernel.org,
        quic_abhinavk@quicinc.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] drm/ci: uprev mesa
Message-ID: <rrrquzr4k64e6b74g4foio7z4pltfx3oxrqbrrw5w3frlmyzkd@x45yj42sgplt>
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
 <20250328110239.993685-4-vignesh.raman@collabora.com>
 <CAPj87rOPHqLaFn3r4rkeMMrQ=OSRQUJ2LLrQ4ZDE6eA1S6zybw@mail.gmail.com>
 <3a3107d4-cc59-42ff-b3f8-2280a357208b@collabora.com>
 <4cac94b9-2445-458c-a39f-5eb72537d6f6@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cac94b9-2445-458c-a39f-5eb72537d6f6@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEzNSBTYWx0ZWRfX6+RyxeTmTj0c ufT0T5Cyw2H3AtHkJ5aT9wTXcJxgYxzPAB9WfmNI58/91epF+7i31xuirfp1YRZQfU04bZG85Am 75lnGC5Uso0DadIo0dItKXqyynJiWSSpLHBCd3fumWQh5U7b76Et/90M7ehzEst/dT9/VCgZ6Ca
 qQPvMJjKwPSz8aEiRBKjYyVtIIIQSznZ3PFo2t1hL1wGbwDi3mnygio7M9xNuUeY6h3IocVn9SV YhINoUtNf7ATiy3RZGH95U+GmV6/9GSoP6Ku+KR+mdU+Mmqc10rn6cPww9HLgrlpRTthM1ef/Cg VaqHKsDIRTsWtcZZZPivIpOFH2Q0wJxr/3M+aKJkGRSy9kQOfXIr03LvFP1JhLjcWF+nBezbiTz
 k8WKwF7fk28QIQMGYiI2CrKcZ2S9dEWHoeUkDP1Jo/zOZKLfPq6BGQuiU6MNtk1ENdUT0YHi
X-Proofpoint-GUID: TPe3BUPmO3eCENWVKH3FYsvIP5EZsItN
X-Proofpoint-ORIG-GUID: TPe3BUPmO3eCENWVKH3FYsvIP5EZsItN
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=681118aa cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=QX4gbG5DAAAA:8 a=xA4-SxEZz4SaK2JE-80A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290135

On Thu, Apr 03, 2025 at 11:29:55AM +0530, Vignesh Raman wrote:
> Hi Daniel,
> 
> On 28/03/25 17:29, Vignesh Raman wrote:
> > Hi Daniel,
> > 
> > On 28/03/25 17:06, Daniel Stone wrote:
> > > Hi Vignesh,
> > > 
> > > On Fri, 28 Mar 2025 at 11:03, Vignesh Raman
> > > <vignesh.raman@collabora.com> wrote:
> > > > The current s3cp implementation does not work anymore after the
> > > > migration, and instead of fixing it and propagating the fix down to us,
> > > > it's simpler to directly use curl. Uprev mesa [1][2] to adapt these
> > > > changes. Also replace broken s3cp command with a curl wrapper call in
> > > > drm-ci.
> > > 
> > > Thanks a lot for fixing this. Sorry the fallout has been so bad.
> > > 
> > > You can also upgrade ci-templates to get an s3cp which works again.
> > 
> > Thanks for fixing this. Will use the latest ci-templates and test it.
> 
> We need to update mesa to use the latest ci-templates and then uprev mesa in
> drm-ci. I will send this in a separate series after fixing it in mesa.

Vignesh, Daniel, any updates on this? Currently drm/ci is broken both in
master and in drm-misc.

-- 
With best wishes
Dmitry
