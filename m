Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A31223DD1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979400; cv=none; b=U4WkoWYpqyzRpGNoBuVLXfcjRoyeaeNjllHH7b8OOwKG63fjvjZ0x4YVNFwTrgINwp4H61+BfqqEvlvOiOHqumfIa8npwLUalACcNCXBqFzECvMLM36+i25u/nYMyGAQ0/+vCCioEplhqnN4JyUiitgely1sw3EvncKEqCk0+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979400; c=relaxed/simple;
	bh=3JijB3VKc+J8wQeVMLnJEeSafRk8Jw7gR2uLJ4RHxJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDpa4Q2+KtbyiCdl2c4EryV7+r1VV2THuo1QCO4z2SQ6sNYCrwrWJmMsS47amP5lHRNL9WO43Deb5Xg3obTQCdUZxRmHqiW3p3dwrPDKKI8jaEkYDFFvocTQwcqPpMBunlDZZ6XNPVg4JTA7PNduonuh17d7EVcBQV2o1OPCrQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n8Iule3E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n8Iule3E"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJhYwD021561
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q+8yrNczXC3f3KwEtPJsZsV/
	JxmWaRSIUGPZ0TfcX5E=; b=n8Iule3ExQB8XrkWpS7iUB7XWxO+8ORNvr1lNtFG
	hTfRR01ahTz+RTPHWMMXGfFz3/tyesmq7GGVDFVG5NFR2WMBadbrpoM3yhGBfk/b
	NRKRTfLfr0qfFf/X4RDGSqJYoV5mPk6+1odqZGD2Fj1KoQUTQJwMER0XxVsZnN81
	K6LyYNKrf+KpR3tTJ4Y4V1vJAVwJ4D02I6HZO2GTygGLDMAYf3ayqHpC/XrtpXQq
	ov0vx6iGrJyRfLrjCr1ZCZbtxSiTX7k1UKA87aFLz8+kSsDpZAXFSH72ga4G/xTi
	7Z78kHS0mUF6MPzeS1kOVbBuz8L8/hxWzEiK95UzZk8QNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx34r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:09:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so404243085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979397; x=1751584197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+8yrNczXC3f3KwEtPJsZsV/JxmWaRSIUGPZ0TfcX5E=;
        b=Q/ae2Mcvi1mYgym/YGKCOoDd+QR8lWGswQX/2J2Uu2HAf+9IC11OahTIwKCqjddOh0
         XL3m0xSlEBSAVFLi74gR8JNqmVbXG6AvgoFHA7j9e8NY60t6o/0ijk71JbSP0t+YENJw
         0Vm9ckjBqeyNuc/O+UnUwmDKzu7WNYTtuiPM+SeV3XKI43/3PkZsZ0BtWDzgO82AO0p5
         Hi//RekrDrSXPmt0ofFzY2h6WUEzjodRClkllS0skb6za8Lu56n71l7h37isVPFtJZ3S
         VLkqv6pgjuc6oEpzxQHDpBIrbmzLPo2+ZGnA08mk4GP6aUwhvgRALRr50tSDG3G/ClAO
         G3Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV/hETUVQdHMEzVH9gg3QushAhn7VlPyyUoBlaEHStsCtYQ8nwGr28qtBGGI9D7mTJgf/m1Q4KXC1l0/Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbE8KmGI7yubnc7hxeT1wcXK5VsBDx0h9i/c2A7/Ensu5mZy1D
	tJu4GFgL/QeExRyKUwawD72vgi5RwMTTnWpUY+d822aYEAY9TtV7OYlewyJ41SAqjjb0j24WUCN
	yx81A9pms5xCvXhMP7Bqd/snpTJyhxx1nqRMPckstjQM+oAvco2FCCAU2G/sqfmY/lKw=
X-Gm-Gg: ASbGnctvlxZf/frut65buZNUnYjohRpiblkvJN8wBhJrLT38wMYvmdxLRQ4KnQEf9U3
	bJWFQlaD9GUxcmg4IqvwrkUGvXiKO60teyOvvV3ZWQ6ZG674UT0KjWfwfJAa0VyQatu6qacazIZ
	HPjo3eeRhu4RtondEWu7IL6k9IumoUljYtJRLpXqbRzw8Z1qtT+HD+KhYuQTJVkcxGwak2rZYM8
	sE9T8mhaqtXBEYvORGFTkEm1/7uIbW7RXQYma2NbpFm5xmD0KTnfI6+3Yf6RqSSYZ4tZjERGYU2
	LlNOvZl9KLl2pZ2VNbD/qiHAzB1YJLS+KFC0TosikZ9KAj4+aJrCXzGbwD7D/VFc62KFc55kucX
	eqUOtOkqSUSzM4qj54Asx4A1N3P6BXNtzoK4=
X-Received: by 2002:a05:620a:4492:b0:7ce:f3fd:cc69 with SMTP id af79cd13be357-7d443940e2amr184863485a.19.1750979396721;
        Thu, 26 Jun 2025 16:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaXw/nhsPOlsYeS4SRUp/yEZteG/c+kPFe4zGmOo6zyTuqANon38rBZCd3vkjW+J8ir4/a1Q==
X-Received: by 2002:a05:620a:4492:b0:7ce:f3fd:cc69 with SMTP id af79cd13be357-7d443940e2amr184860985a.19.1750979396259;
        Thu, 26 Jun 2025 16:09:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24028esm192582e87.19.2025.06.26.16.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:09:54 -0700 (PDT)
Date: Fri, 27 Jun 2025 02:09:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <4v5gi2woexvho6hc5enhjg5w2couvw2s6ywyhg7rhz7zdtyouo@fcw2bixmqxoh>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <aFlps9iUcD42vN4w@hovoldconsulting.com>
 <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>
 <aF0WGmnN_8rvI9n1@hovoldconsulting.com>
 <zufyvg4hoxxz4i45pynzta3gyglqvecrmeslnpphsgwmtujivl@t2zbdtejt3x4>
 <aF1Hhs0JAS747SVi@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF1Hhs0JAS747SVi@hovoldconsulting.com>
X-Proofpoint-GUID: l0A2_0KEvc4I8_EbAPZmCVyeaaRJDUfB
X-Proofpoint-ORIG-GUID: l0A2_0KEvc4I8_EbAPZmCVyeaaRJDUfB
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685dd345 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=rEvX1EWfX6HDnhaDtb8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5OCBTYWx0ZWRfX1R7MFZl6dgRY
 xZsaecwd0i4KwHJ+GU+YCadhuGN+uYI8yo8/A1slrfMmRHNPqVhKQI2789WF+LkQFH9xGNYV7/j
 U8/gxFf41TgmgYQkZtNdpKNmBAEtXofZ/R6wkpabQlICiu6ic4EZs9KV8WViodvAMi4QLFagzqY
 ViuBLHKCdRbxn2ukUh789an57Fkk6dIoF7UKF3GHtQmNTqdX9w1FS8veVhShHpssWmLJHljaIla
 UTfaZe8Q/d6/5lQDrdfqY+8C784x5IuvXz6cxAJd9fSyZxePbKf/4yB3eX7O0qn4YN2AZnkKSZ4
 EFQxDTEpLRVFbRqfoZnJ0Z7xPz1GdqI7qkojwoZ+cJyW9mKNfKUs8Cd+yzXJIOGzvvfMrGn+X9a
 KypK1eCK8rR77RvjjtuourXsH7ZGOLCuaUmH9N/yoW/oh5uzKQ416hVdFkEY2VGhX/mmgctw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260198

On Thu, Jun 26, 2025 at 03:13:42PM +0200, Johan Hovold wrote:
> On Thu, Jun 26, 2025 at 02:15:26PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 26, 2025 at 11:42:50AM +0200, Johan Hovold wrote:
> > > On Tue, Jun 24, 2025 at 04:13:34AM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Jun 23, 2025 at 04:50:27PM +0200, Johan Hovold wrote:
> > > > > On Mon, Jun 23, 2025 at 04:45:30PM +0200, Johan Hovold wrote:
> > > 
> > > > > > Also not sure how useful it is to only be able to read variables,
> > > > > > including for the RTC where you'll end up with an RTC that's always
> > > > > > slightly off due to drift (even if you can set it when booting into
> > > > > > Windows or possibly from the UEFI setup).
> > > > > > 
> > > > > > Don't you have any SDAM blocks in the PMICs that you can use instead for
> > > > > > a proper functioning RTC on these machines?
> > > > 
> > > > I'd rather not poke into an SDAM, especially since we don't have docs
> > > > which SDAM blocks are used and which are not.
> > > 
> > > You're with Qualcomm now so you should be able to dig up this
> > > information like we did for the X13s (even if I'm quite aware that it
> > > may still be easier said than done).
> > 
> > I'd rather try to find information on how to update UEFI vars on the
> > storage.
> 
> You can do both, especially if it turns out you won't be able to have
> persistent variables on these machines.
> 
> > Moreover, using the UEFI variable doesn't send the wrong
> > message to other developers (if I remember correctly, I've seen patches
> > poking to semi-random SDAM just because it seemed to be unused).
> 
> That's for the Qualcomm maintainers, and the rest of us, to catch during
> review. And people putting random values into devicetrees is
> unfortunately not limited to SDAM addresses.

Yes. But here it might be more fun.

> Furthermore, getting an allocated block of addresses in SDAM for Linux
> could be useful for other things too.

Yes, but this obviously can't happen for released platforms.

>  
> > > > I think the slightly drifted RTC is still much better than ending up
> > > > with an RTC value which is significantly off, because it was set via the
> > > > file modification time.
> > > 
> > > I measured drift of 1 second every 3.5 h on the X13s, so having an
> > > almost correct time with massive drift that cannot be corrected for may
> > > not necessarily be better.
> > 
> > For me it provided a better user experience. Yes, I'm using C630 from
> > time to time, including the kernel development. A drifted but ticking
> > RTC is better than the RTC that rolls backs by several months at a
> > reboot, because of the missing RTC offset info.
> 
> Does it have to roll back? Can't you just keep it running after whatever
> semi-random date it started at?

It rolls back after reboot.

> And there is ntp and services like
> fake-hwclock which saves the time on shutdown too.

Likewise I can plug in the USB RTC or do something else. NTP requires
network access, which is fun to have if you are debugging modem of WiFi.

> Anyway, I still do no understand why you seem so reluctant to having a
> proper functioning RTC using an SDAM offset.

Because that would be a one-off solution for this particular laptop,
etc. I want something that other laptops can use without having to find
another magic value which suits a particular laptop instance.

-- 
With best wishes
Dmitry
