Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5B22A1E6
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748946949; cv=none; b=GjUI6i7mUeSf7pnhsefpfaO3gx6gSPN/d7ZCe3sBL1+rZIIh3jFagNUlFNcL0kCawFz+lbyrxYnmlg22hXyMgq8M1TyzEI9V/96SH4sSh2+6gM9KWOD5EQhQrybwlGuZqVyBugxhHWPguMw1nugfZaKlrJE02qAfNpWIypDkWe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748946949; c=relaxed/simple;
	bh=8BSx8hG7e+Sa8wiL1xLVnVmH9RmhWOKPCzG1Q2KWa1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZaResnu84ao7WDeYstWTf3Eb/IuLGnueGU6VgAzUPQ5/YRW61eYwPVTMyNuhZhhQ2wJaDwrepwBrxqKTMlcw3/0VaL9Q/XHgdDf9pW2HJcBlCe7cCWhaULEzOPtGzfke+GJi0bl9O0bEN4riwe6YUP8idfwY3pw+ACA8OTgsSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMFYrqY+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMFYrqY+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JFrS000679
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 10:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ENKaMLcnNd+HsLvJhufWlAMm
	Y2ISC1qjYbmzZ02Ak3U=; b=VMFYrqY+ND1+jxv77tSBuqVeY2Krl7EEQjr9Jqjz
	vTaT7wgPsyY3cJ6VI12gFDtHLMKgaQOfHNfaJdriKnhB1fRn6dUfhVYfOMUInPZA
	+LrG7ltCNcEolV4aYwIiNjlS8zuiMmy4qmLcQC5HJ6wzLEBXgyl4lyC2ETWxnFnl
	LQdTyzw+wR66fC7nOOdhfeU3l+i7Lyzf7bWsab1wvQjtuKH7Jm8MgnWkHJuggWpG
	as7g3T09Hn6OIvQmvrKXVmc0GMJjV2VnLp1X++m/yaIDwWZbvcjPePVRicG8RBkX
	RQ/VIy0axCOIx9v1muMeBpIYjik5cLmLaPUmyojUQsQPuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q29wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:35:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so1433828585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:35:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748946943; x=1749551743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENKaMLcnNd+HsLvJhufWlAMmY2ISC1qjYbmzZ02Ak3U=;
        b=iQ4q1jYbkRJQtJvgKIdEeTcfoMHgqab58Z2orQCmD0E32dBzHmq/mOKOhxrJADTuCi
         AhnohUXpllBsyqVQkc0Mi1Xw6YnV1OCtPEWCsPq8KfGNMNoA8zkuNSjc7WAgfmG+dp6a
         msONjJCZhuNOFRlJ5GhX0/HeD9hLtKUlrR6EjeokE5NayzDSybHfLY73MKcTFa5hPkxd
         WEoZMLC7XrQSJivtDxOvwd5Qd+9iE2EYyJCcWgZaCcyzXU4q2HjrvnxMOVsZtT8YmQ9H
         X1xr9hXSl6IbwdfT9GKfYo1l3VxVoZ2FB2m4Z/XRR5Z+tDHIZE4m05Mux3H2RYwbiZlN
         RAYA==
X-Forwarded-Encrypted: i=1; AJvYcCX3zXzXIeeDzoIzCkDrohaK9ti7E5Q0C6LIhBzVr6zvJyWaRWxGe6bMRZmeRxXk4vDN6uL7/CX2D+Pn9Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJcx/P2bZfwaNX/KduWeckoICM2FywZHEMHFxMLVrhdI30nF76
	sIFyZbbEY7fLj1AdhL//6QUjvb/XPNbOWIIipZavkpXACAG1sXrvAhvTbtY8VDViucgKuw9Dj8P
	xqSGYEUJeHBlSq1fxsYbj2IX28qTITDzznx4axYMt47dg9mJAb+LzZmwQ+dF3cRdymEI=
X-Gm-Gg: ASbGncsLUgYYVtlekSOSZsFP8Rj9cAG4KkXbfZpYPY2Rl8ffudjG9wqYyBJR8qI78vV
	HrAX8u5DRWPKcakb6Oa+udp4EKgxU+tccETWTG66bYOAdjIASJPRGdGZNY/LOXMSLQGkXTs++Hk
	Jnw+o0StiJq0dBD+wiJjtnMSwmuQUKQkrv2MKUiej08gY9clq4Figa6CC7Ni9A4NdJNj31tCHsZ
	LGMZvyf03FYclyAyBOWWnEgVlcdmmbs0IIBJXIyqIxmfBdcCE8ti3ogTbJgUm4TBChvuT2hiGM4
	Wpn4+jsGZGCqShsDKGJ2xIxP+zUnO3ZZ4GFeoBcrc/bMSiHKjHTsRHzNtPuhk2QGO2wUXy+nJwc
	=
X-Received: by 2002:a05:6214:2a8a:b0:6fa:cdc9:8b01 with SMTP id 6a1803df08f44-6fad190b279mr276523746d6.19.1748946943305;
        Tue, 03 Jun 2025 03:35:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6+xnPN44BmihhZOTq8EzlP77OCBjKRSNvGyN14bFyu6GdHg2oZCIDt0Ztgee2827hAufidA==
X-Received: by 2002:a05:6214:2a8a:b0:6fa:cdc9:8b01 with SMTP id 6a1803df08f44-6fad190b279mr276522996d6.19.1748946942829;
        Tue, 03 Jun 2025 03:35:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791034asm1871748e87.108.2025.06.03.03.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:35:41 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:35:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
Message-ID: <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
 <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
X-Proofpoint-GUID: bBxzOf9FQnROMWQU14KguIG_GAViA9BI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MiBTYWx0ZWRfX6cR4j33aNyd5
 v90pA8sEyN5NYNMb2FKeBg4AeC+++RYBf16WpkuLcC1Tgvol0JMvVnw6RdVlSaw11fJkCzt0grd
 c6snajS8Qxtg7OzQCwp9lWaMWGvHTIL51WlRUVfJDhfprnYP3xoAAjbRUlFu2isjQ564Gg9Ip8H
 QnqoVj8UtZNcjgfKzRGe0yr8RBxkprS6iDRtnpyFPywOHx6I9AhyNMeBqFEtRN8z35BClQ4D48f
 n5O9pche4e+m6kelO88GF9eUFJuYQplv4k6r2IFis8UfKhBWZOSrKlRy/WRL+BywIrYbeW2/g4G
 s/8MUeBohfzWQVVzDfBVwGqJux0x5Gqyu6jnxsOe0IgAZNC3LhBX1kXxBq2EU6vSLZ4AApBJDsn
 3EaydXZp/VWaPQvkOjwU0/qVhZmeTKeR5oUbB78enIBg3YUj8ZsFhyOcFmJfsvpKtdOQwXiE
X-Proofpoint-ORIG-GUID: bBxzOf9FQnROMWQU14KguIG_GAViA9BI
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683ed000 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gC4Pu52S1TLJhMqEWYgA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030092

On Tue, Jun 03, 2025 at 12:50:18PM +0800, Fenglin Wu wrote:
> 
> On 6/2/2025 2:17 PM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 03:35:07PM +0800, Fenglin Wu via B4 Relay wrote:
> > > From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > 
> > > Add state_of_health power supply property to represent battery
> > > health percentage.
> > > 
> > > Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> > > ---
> > >   Documentation/ABI/testing/sysfs-class-power | 10 ++++++++++
> > >   drivers/power/supply/power_supply_sysfs.c   |  1 +
> > >   include/linux/power_supply.h                |  1 +
> > >   3 files changed, 12 insertions(+)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
> > > index 22a565a6a1c509461b8c483e12975295765121d6..74e0d4d67467500c3cd62da3ae0b2e4a67e77680 100644
> > > --- a/Documentation/ABI/testing/sysfs-class-power
> > > +++ b/Documentation/ABI/testing/sysfs-class-power
> > > @@ -562,6 +562,16 @@ Description:
> > >   		Valid values: Represented in microohms
> > > +What:		/sys/class/power_supply/<supply_name>/state_of_health
> > > +Date:		May 2025
> > > +Contact:	linux-arm-msm@vger.kernel.org
> > > +Description:
> > > +		Reports battery power supply state of health in percentage.
> > > +
> > > +		Access: Read
> > > +
> > > +		Valid values: 0 - 100 (percent)
> > What does it mean that battery has 77% of health?
> 
> I will update this to explain it better:
> 
> Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.

Which basically means that we don't need it in the first place, as we
can read capacity_full and capacity_full_design (or energy_full /
energy_full_design) and divide one onto another.

> 
> > > +
> > >   **USB Properties**
> > >   What:		/sys/class/power_supply/<supply_name>/input_current_limit
> > > diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
> > > index dd829148eb6fda5dcd7eab53fc70f99081763714..12af0d0398822ff23d8970f6bdc8e3ef68081a1d 100644
> > > --- a/drivers/power/supply/power_supply_sysfs.c
> > > +++ b/drivers/power/supply/power_supply_sysfs.c
> > > @@ -221,6 +221,7 @@ static struct power_supply_attr power_supply_attrs[] __ro_after_init = {
> > >   	POWER_SUPPLY_ATTR(MANUFACTURE_MONTH),
> > >   	POWER_SUPPLY_ATTR(MANUFACTURE_DAY),
> > >   	POWER_SUPPLY_ATTR(RESISTANCE),
> > > +	POWER_SUPPLY_ATTR(STATE_OF_HEALTH),
> > >   	/* Properties of type `const char *' */
> > >   	POWER_SUPPLY_ATTR(MODEL_NAME),
> > >   	POWER_SUPPLY_ATTR(MANUFACTURER),
> > > diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> > > index de3e88810e322546470b21258913abc7707c86a7..dd0108940231352ac6c6f0fa962d1ea904d81c7a 100644
> > > --- a/include/linux/power_supply.h
> > > +++ b/include/linux/power_supply.h
> > > @@ -175,6 +175,7 @@ enum power_supply_property {
> > >   	POWER_SUPPLY_PROP_MANUFACTURE_MONTH,
> > >   	POWER_SUPPLY_PROP_MANUFACTURE_DAY,
> > >   	POWER_SUPPLY_PROP_RESISTANCE,
> > > +	POWER_SUPPLY_PROP_STATE_OF_HEALTH,
> > >   	/* Properties of type `const char *' */
> > >   	POWER_SUPPLY_PROP_MODEL_NAME,
> > >   	POWER_SUPPLY_PROP_MANUFACTURER,
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > 

-- 
With best wishes
Dmitry
