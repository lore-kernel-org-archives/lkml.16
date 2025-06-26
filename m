Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712320D4E3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936245; cv=none; b=JhmVnVTtxDB7B+/6ItNAwl0hqQR2ATdwacqnZuat+asOg/yXEvFp5aUJUji9pUoymt8c4vcg3LW2CrVkaGW/4q7YUSbjOENTHWaFrFn4vM9id72mxZsXAfbc3VZhExJv9xRcyzZpRe0RH/TVDX0L/MDvE/JNNe3oIGYN76KOOes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936245; c=relaxed/simple;
	bh=+Nh7arEhb4mdiIAA47zJAjhf1JoxtTqPoXIZGzCdPRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtHwJ/51+5n4snCUJ9PRf3aERJ4mwaPfZj4oujJZzx6juLUBJDz74fw5mx5gYWRKV1bYs3rPvLABduY8r6uAI0+K/ZHkX4pIi7tPXVlCZXCJYQXBOuUPYFWDCXaRO7q5gkoLVYjpWfAGkIPFPdORJ1y8P7rPqPu2fgr0+QjF0OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGjtip2j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGjtip2j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9xV8Q022650
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cYqt5KyHbC7L0Vd38ScC2cJZ
	2gNgSimq/dQgr20ruzc=; b=cGjtip2j6+BIXEt74Q7TzPgDNrkfy5s8AZt5O+x4
	XFVjrtqgX4tg8caenZ9UvSKQ9q5rvIEPXEJsebV4dNGllfttOXMEwgM9xBaq2q1C
	Ce+VIv3+o1XziKum5pq9pnyIA7xIAc2G5SBic0KPxXXuQ118IfIdQau3quJTreC5
	AxB/4dZKwK7tlMsZM7jZFASu2Gt2vJdIL3v5nC6SN36Uj6KMICjhYlZOi+WfVjKB
	2MLER2Nf4nWCCwJ/mo4zUSMT52oJwHx+5RfNtrORP1C0U+fIH7xfedWxiuB6eKZu
	yglROC0YOp9sdnFqVXCaEzxjgcgjig7cBaqblsUV/vTzbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx1cq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:10:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3e90c3a81so75968885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936242; x=1751541042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYqt5KyHbC7L0Vd38ScC2cJZ2gNgSimq/dQgr20ruzc=;
        b=D2lkMI3O5/Ly6k+do+LzT46ZoLxdG07hEbRAmQDqsWNh4h4qXtdtIAfiBOQr2jK/qI
         97ZmMeObjJbNnyefQFoT+PvGST/a2xwoNUrl20oxB9ykhjKTCfcVU94ipNuoyHlxny0B
         nPcPY34Zpf6k1iD1VsrKdQMXBQYbl/BqIK/b2BQNLYPmPEWjyNuchkLFeAWIORRW6Bpj
         o4hCOdpTodcwShw1qcqgqN9EQKA+3l3rCo0PcRHhqr9HEGcEVZU+8e43+LTHf2sQwfMe
         lY3lj31MpDwy2Xyer06+GS13jZTArLXsVHvPgCcKUbl4PYvdhYhE+fPKbyn7soA8pn8m
         D/WA==
X-Forwarded-Encrypted: i=1; AJvYcCUxoGdC+b85ke1PKf6LT+juyrjuCOdIgN1JOPErwyV2jk1DXeehzt6NuxPnEirBieRuusCQVeBiO9SHOoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbD7D5y08XiXGej7Yb0ACSl7mIrJivnSAO5tNpz6VvyUJaQCcM
	NYXSIkXaM4N7UdwHaSXdDUyXI3nL45YOoO2Pi4MUUoaqrLz0VY7GJ6VOtnQof20DRjQY5ZkaTUo
	L5se8tom0coMoZs62oxxkhaQbhpjL0R2BCL4zRu5wWp40mYpWGpp2Yn4i8Kvvf+wHg2U=
X-Gm-Gg: ASbGncv4Gz7Djby9JO5ULb92XLISO8FU8b2Oi5kEZN+J4Qv2OtRZFmXPt4Yr0T7f6Oo
	08KZtS7XJz8fIXoIYr9/To/gDzyQtfsCakLynjlY2ArT7F1MPeaUTF7zpHnXFRhWdyOLs0FAEtO
	eUS2Um/S/4is44AcGdtdAhv28nT+9MPZiv8o4iJ+fJsRwofYcjM2MMwC8dKIh2v0i57Qr3Yuk2j
	UB2t1d0wD2xICki1Rv30I6sRElYQw4NyvGJypjEfyLgYkfkgAOj7NUBwovm9ceC7/6dJmIhGOPO
	6+2gYSLqno7UjqNkrAhsVDYgwBFFNV1NsGRS2lYrNkQbmXgCPrZ5Lun5E+0VwlAhGmbj7bxR/zO
	OunfyUUjQoAnnCoM1rw2VPzKO+aycGu0XbtA=
X-Received: by 2002:a05:620a:7083:b0:7d3:ba53:d88c with SMTP id af79cd13be357-7d42978f2c2mr996162185a.30.1750936242240;
        Thu, 26 Jun 2025 04:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjtAiIEi52PqDdVHz1fI8lluW9aTCSB2ftm6y/pWoW4VAWz4SzJ2hSwGJSK/pOX00PIVi2pQ==
X-Received: by 2002:a05:620a:7083:b0:7d3:ba53:d88c with SMTP id af79cd13be357-7d42978f2c2mr996157985a.30.1750936241770;
        Thu, 26 Jun 2025 04:10:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414beb2sm2535941e87.53.2025.06.26.04.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:10:40 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:10:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 8/8] arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix
 RTC offset info
Message-ID: <xddgggbyt7dyy6a75dup7dgt6fxy27sopkv6febckstcpamv72@sfbul63yeex5>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-8-aacca9306cee@oss.qualcomm.com>
 <aF0eEWK8d-l1Mxma@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0eEWK8d-l1Mxma@hovoldconsulting.com>
X-Proofpoint-GUID: pq65-9eQp8RdzLljir-6eLOQ_by-g8Kg
X-Proofpoint-ORIG-GUID: pq65-9eQp8RdzLljir-6eLOQ_by-g8Kg
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685d2ab3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=rtKsz54fpWh7oidnevsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MyBTYWx0ZWRfX/qmrTpEUVFax
 1C9uljQjV2967XsmSUWtjApyJ4BZ4OBUy3+5kryM/bHjKI9T6LJnRm/g6wY4vnvWBplXlcIq0/k
 6etrhTDK9g6WCY1/3lPmGt+O0TZipcZErjIQwHosJmyURglb/rE15g3patZ/tr+k41xeuLHeixS
 nRVTFNkjzyhF2AlO6j8IsK10fAfVOc3bHU36WGQRg54in/wkjhOE+3HFHJi4u0biZ7br7snjkOR
 I++pvB2FQhE37Ip9WurZEb2UO24iiw1+ixWqWY+n2YnQvG2veihL0t7aQpG0zL6B5sMyP945TKa
 HrEGwgQz0zVudOdu5XnWuOElbpq0K2sjdf2KUP+bHo7jx9lwC+DILFiwboroFkV2H1L6UIU8and
 RdhLz/PeAyrd2YRziQcAVFKX8LBsHdnowxXag0mVqvlPGKm/rSXMLWfWZpxtEhfXSLUxfFND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=963 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260093

On Thu, Jun 26, 2025 at 12:16:49PM +0200, Johan Hovold wrote:
> On Wed, Jun 25, 2025 at 01:53:27AM +0300, Dmitry Baryshkov wrote:
> > Lenovo Yoga C630 as most of the other WoA devices stores RTC offset in
> > the UEFI variable. Add corresponding property to the RTC device in order
> > to make RTC driver wait for UEFI variables to become available and then
> > read offset value from the corresponding variable.
> 
> This is not a fix so please drop that word from Subject.

ack

> 
> I'd also expect you to mention that the RTC would be heavily crippled on
> this machine as the efi variables cannot be updated.

ack

> 
> Is there even a UEFI setup setting for this so that users that have
> blown away Windows can ever set the time (which may become totally off
> due to drift)?

There is a UEFI setup UI.

> I'm still not convinced that this is something we want, especially since
> you could have a fully functional RTC by providing an SDAM offset
> instead like we do on the sc8280xp CRD.

No, I don't want to go that way.

-- 
With best wishes
Dmitry
