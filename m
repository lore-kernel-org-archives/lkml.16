Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F3B204F73
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 18:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751741941; cv=none; b=XxE8tBF5qB4SYG9a89FFya0sfouwT5vOjQUWy9mzPYZGtvV7sOdl/jAcPTMO81OSI1fU/NkRX+mOOZr34rI6dRtI32XEEO0Y84dorNcPIqXYEfOxpUsyxFZm3Kxh225oV08gWGOFH+wIdhUWDJDxQqjj1k8xgRrCsBClwaIEVxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751741941; c=relaxed/simple;
	bh=xubNlsYKv4hoBbHWE7gxG0VYpYE2U+e8mccJ4ObL8yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqX0mFWlrLyViQIJNDSjbYAMeBSZJItMVUHvAVoO0voEJg8R/geAb5OAh6dRCkP+0F6MFk+veg3mJ3gajxKOafcKDuFxiQ9RoU6/On9sTmcRk/wV7ds2z7JhuLqXtU8tKJt5GUNjvsx2SGKMPhgBWYf5xuCH2Qk/piCX999nmeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glwbARjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glwbARjF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565IK1CD005534
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 18:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ocaOCMHYE8NDO9OEW664JHC6
	8656egVpSIsX1z3ynhE=; b=glwbARjFKxn/6SSrUX5lqrKzoUw6oEmwe9HpIBw5
	SEhwnJ7qe3Qpu759z9zgz2muJOQMQT4I+w0SSfD0IEAaXyz/UX6PbA+YU0EItnOd
	FI6WQVbgbXtGVRF8Njpb626BChJVy4r+6yAVPliEJl4ybckSLf0weSuhCuWoKquy
	oh55BwDcPXHhDrEi+OqAqnPzJGUjJUvKUdd6DIljgGAJfnGEVWpGw+OwjCLuGFdS
	Ufk6e3KMZq+8HgJBzCDN13+LSO9ia6cAWJrUvcELFdkyz8a5787k0Zd/kTEVwGnQ
	sx+/rwY5KkE2R9SfV2ra9789jTyQxBV+keInD2noWtcelg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun21v92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 18:58:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097fd7b32so394555185a.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 11:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751741938; x=1752346738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocaOCMHYE8NDO9OEW664JHC68656egVpSIsX1z3ynhE=;
        b=FhIXFq6yG7CEI6TCdGp0hIXx4W+8qvb+4E4A6dynrXNkPDUQYy+u1t0qnD/6UcP1AB
         t/cu6ZK3zaLkpV/vRNmVyTK0+nHBANQDT7v0Ss31RYxJTVw9zaQ27s/ywxuS5e6+vkzZ
         iyS/PS3ROQyZPYzH+sFespmXvaqCYcXS74q4ShUAQCeLrkUWWv7Gvgkx+zgnUpoVOeVT
         nCwZw29k+VyApk66TorI/Qe7fi6zRgV/nLkCqkhLqiMCKUD87BOjgis7iNgJvWDGJU0S
         6SJ8CmkCEmgvDkKKHekvKm8MAqd9mCkgwghKlTArLtHoRVXmy43B6mCSj3FIqSRZuK8e
         ZXcA==
X-Forwarded-Encrypted: i=1; AJvYcCVEIm5+qaW0K31B01PA+863PICKyjRaL33L2l4kWszOIaJSXzlS84Jj7eM8h9IphRag1TE3iAphI1ikK5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwemQ3f/5b/D0kh0iiJsz8moGc/LP/O7xpWdDKSGZe0UfWw9G8T
	V5gtrgMETaXbaG8oNtyy1+7+e/FqZBrPVa9dAlPo7pvIO9Ip9Y+4SPvKvUh7rV90U3vpfwYU4Ex
	C1WMa6pGgptfmH0LfLqLEkSnn75zjqpJQ4+OpzSdisLZhMYg2eaDVzWvToaEcJNrStuU=
X-Gm-Gg: ASbGnctb9SuXuRvrhvZK7aETUWfTHQ6rzaaZnE8KnSZEhlqAf2uqqOd4sXaBMjS/XxF
	e67E3+nUi32/l4kc9O7Vp/CkiaHe4qoO7c5xeeMcrU1K/l4AlcillG0FFgVy5nGO0IAIaL11mC7
	L6knInfAOxE4LBGur6t27yQulyytp2YGkXxjofK8I+gH03qPenMmZtaVcOIZm8OhnFRUcO/uNkq
	aByUu04SPxiYT8DdGiXouMzd8P6c/MaCiuAuINwJIx2IXdEZElEHqRdiczGyCCHOOLVLhorbkJG
	w5cX5NUvV6u9M6EHIcKx4N/dqLourUOtrq+mRJ5xpOZmfbr63Q6rkv0MjX/WF5x+MIYv+4OayTT
	lpl0BcBqFSeXHSAkZu+k8WJ+vOLyCl0CFDT0=
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5dcd0a63cmr968454885a.45.1751741938350;
        Sat, 05 Jul 2025 11:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwZuhJDnQ3LWiy5yGswE6sTDPHJMzCTMeoKblzaS2tUrAReL7ylcXFz0S593CShvSIaBFtHQ==
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5dcd0a63cmr968452285a.45.1751741937902;
        Sat, 05 Jul 2025 11:58:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d8dccsm665117e87.66.2025.07.05.11.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 11:58:57 -0700 (PDT)
Date: Sat, 5 Jul 2025 21:58:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
Message-ID: <cueav4uxbhswv2z3grf4qhwualhg3zxknahrhv6uaedit6dgdv@23enbjmj64d3>
References: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
 <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
 <80055981-3624-4165-af0c-3b60c345e8f8@linaro.org>
 <4b9e44b14395ff4c64eba1bd71e63150@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b9e44b14395ff4c64eba1bd71e63150@disroot.org>
X-Proofpoint-GUID: -mx-R9cJ35hgHJEw6BQ0LCW6qwxAnXdc
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=686975f3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=5PY1fqJ0FUbosCpcTIAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -mx-R9cJ35hgHJEw6BQ0LCW6qwxAnXdc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNSBTYWx0ZWRfXy1+Ym602CQco
 WRfnFoA0jZWmz/LfmZckD0r2uJPzI99hE0/+NXycE1Ch1puZD6MF+NZWZoHQXU3Z0NLyPpqKaqx
 6zIwZr9AdyOINh7/yf4AjlVgltvMD5GBeaYbQ500jeiC2m0tiT46YAAQVLQ+VotpQJL5qieIPN0
 6TWJPzlmRlfHgVC+M7OkeKrf+d88VuQ6votyVu4YV6tg8jL8DW0ARVjnFBMDX/CVAWa2+BSS3sO
 b4brgACpMp3hCSotr4jD9khH/05Eplq6bbqILvWm79MwToQRcUAzt4DTftfoqNc9dqXB7Jr26rI
 CfIGN1HDatjceLIGz7ilh2K14YpMJ90twgxerg4R+HfIo4VNSCLD+EeSsOXASU9Bk1sThZ71Pgx
 B73fPBsXuc2Gd1A6bypq9C+O89EWTjoaYJq04D63cjZKacrU9+tDvHG1JTaD82/szL4vx/Ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=971 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050125

On Mon, Jun 30, 2025 at 05:18:22PM +0000, Kaustabh Chakraborty wrote:
> On 2025-06-30 15:29, Neil Armstrong wrote:
> > On 25/06/2025 14:41, Kaustabh Chakraborty wrote:
> > > Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document
> > > the
> > > compatible and devicetree properties of this panel driver. Timings are
> > > provided through the devicetree node as panels are available in
> > > different sizes.
> > 
> > Wait, why ? Why not multiple compatibles ?
> 
> The panel dimensions is the only thing which differs. The model name,
> controller, registers, and functionality are supposedly all similar, so
> I believe this is fine...

I'd say, it is typical to have a controller to be used by different
panels. However usually those panels have different names or IDs. Please
follow the typical way of handling such a situation and use panel IDs
for compatibles.

-- 
With best wishes
Dmitry
