Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88971991B2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672710; cv=none; b=I/zpslwHBK9eQq2MdBmHVtSl2BXyVkIZRppPsoPVUcAIza2H8chNsEtGURtIRrrY99Xt4Ae8Xmg6vD6oXFD+slF0qSNGchuPf72ErT3ouo41SRV9P7kciqEwno987/yMK6kTt1sjncpk0UD/dsxc0/Y7WvJuhwJtnLvhpulc89g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672710; c=relaxed/simple;
	bh=+SF/+s0AwZwFtYJx7lltQg4XhO9govLh68y53K6ZV3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nykqPWWA0GGehb47aT78sDWqe+JuxMH73iXmT8tbHK9/MslFIjoACiVxSBAozSoPhw13Aznqo5X5k5Hb8pa3Suxbt/oWZ+BjCs8aiIa52bdPdbaU21ysXRHQ589gBvbwY/xHcoGwTqQ7Z8xPr29yQCvFa+HBo7sz6L+GLDAhcps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOCvTGHn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OOCvTGHn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53383CUW014785
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 09:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G6Tl5Pc9EaXZPP1t5lfTzxUj
	Kq7BA18xWb1OOnqLLI8=; b=OOCvTGHnB5DwQiUGqSshsQf2RrjhpL95JmqqTOyN
	rnhNDe2uCC/dSGelUOx7YKiPqkBhQ6kKoqFuz9FJ0vbGBZ/U7D+xcHnJkkT86ke+
	Br0dI8lxbdbVCVJ0JROm4KhwVk8J3/0ByOlz8qXULe+CadTw43/LKsqQ4uRxqnpc
	PaGPdGl7GFVZrTfGkBjFPt4ev92lh/3bgqlTgF2OkzOqyw7gQE/lnX7lISqmZQOP
	ctMj47F9Zk97nmkrKk+Tjhc4pEGhLSvFZdsxyGW/hQ7xqZxMutZ/t6eKowAehtCh
	LXoIWUJREEBy8MMfhsDPQjJ8ikTQLIFTHsMa5TikH5QRRA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sc2yskgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:31:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso1061439a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743672706; x=1744277506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6Tl5Pc9EaXZPP1t5lfTzxUjKq7BA18xWb1OOnqLLI8=;
        b=GIIL1V4KPTRgtl2f7pn68wZbRbzurs3NS1Tp2Y/avwxPoRlrIuEI/r05vQ5AMAF6jq
         1yhOBAhQci0ljvMNByk8l69bXhaIRMdTSUwT/Llu9QnWFGwdB65bAiyAvWKnAsd/HHWg
         mQi7Z+Ho9kbbag8TwvNehj5IdZlqTN9tkzgUGQJPCbe+T2WdW0BhOSrwrNAttGDO8dT5
         8n6q82uRKCFBGl5qZc5sUXi2otcWuO3fkCAYiK7gOBlNCbldTv0jxHIiFAzu91DWiLUH
         fGPRCQTB/aIp0bS1GzTHX20VBePV5isn714gYwjcLJpH7fSGMfQPOGQsnsqTfRo4Abxf
         UNew==
X-Forwarded-Encrypted: i=1; AJvYcCWf00l3r/BZrFx3DAEUXvIuVX4pzOEbe/TOk3yuV/eylPckxy4JvWge+hXjvfmRwztGZ0UBUTACparo4Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKC5BPgfXYDx4l/R1gqxMWX+eM9lfcOwMsIoXWNffnM0yEYDNv
	KbN/Z5mZdXmjGFmY70rQ1PvQyQCfq08fHY/KcdAahXVOeXZqOTz1STnpNtq2MSyeuM/jVLYUF6l
	oNjGS4R+l2sxVWkpy+6K/KhBiS/TdeccIS+po+yd6e0yKybDlmGWNu7AgdjKPi2vwVgKrFJpJWE
	Plq6P2zb7R5w2jQIoIJjbu174BNQlTruVDQDoMYg==
X-Gm-Gg: ASbGncugqk7Cx6TQIi2n1AQbKTq5ETd3jzRn47B3eMRohlPYrFadqC8brPix+6dt9dx
	hDEiCxS16XinUmiW1ztHuxjh+e4SweMRpCYibBWIu2P0FbIybGgqHCQiM4YHDhwD9DIAyhRU=
X-Received: by 2002:a17:90b:274b:b0:2fe:b8b9:5aa6 with SMTP id 98e67ed59e1d1-3056ef46cb3mr7654795a91.31.1743672705754;
        Thu, 03 Apr 2025 02:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/pWE0+hoDB10ThQNautj+kM/9y+AplIxhr/WfG3y9TTyMnGbzLP4b2pswwNPJmGrwtexG4Nge1llNQZxXt94=
X-Received: by 2002:a17:90b:274b:b0:2fe:b8b9:5aa6 with SMTP id
 98e67ed59e1d1-3056ef46cb3mr7654730a91.31.1743672705043; Thu, 03 Apr 2025
 02:31:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <2025040143-espionage-poison-2345@gregkh> <47a3a851-f737-4772-87c6-98613347435c@linaro.org>
 <2025040230-showoff-spray-ac83@gregkh> <283ac88b-c8d4-47c8-9ff7-935770eca566@linaro.org>
 <b6e7abf3-b263-410a-8f4c-eb9a8e2efa2b@oss.qualcomm.com> <e8c91706-1a94-4e3d-b2a9-9d670021bbc8@linaro.org>
In-Reply-To: <e8c91706-1a94-4e3d-b2a9-9d670021bbc8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 12:31:33 +0300
X-Gm-Features: ATxdqUEMguFibUeBVRQVPHCTnU8QB_45FHrgKeB2Mc29jYcXJZn4tRrPEsDb2ms
Message-ID: <CAO9ioeVYYy-10ZBmNLMzZK2+mZ5mKf_ZtGwRVf__Dg8GA=Sf0Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=AMoviu7M c=1 sm=1 tr=0 ts=67ee5583 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=ehZioqFJNv_uvlhhW-oA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9vS21J0DJxobvF0wCiKPey2gl1MIpO1N
X-Proofpoint-ORIG-GUID: 9vS21J0DJxobvF0wCiKPey2gl1MIpO1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_03,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030033

On Thu, 3 Apr 2025 at 12:27, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 03/04/2025 10:25, Dmitry Baryshkov wrote:
> > On 03/04/2025 12:18, Srinivas Kandagatla wrote:
> >>
> >>
> >> On 02/04/2025 12:31, Greg KH wrote:
> >>> On Wed, Apr 02, 2025 at 09:19:17AM +0100, Srinivas Kandagatla wrote:
> >>>> HI Greg,
> >>>>
> >>>> On 01/04/2025 20:18, Greg KH wrote:
> >>>>> On Sun, Mar 09, 2025 at 02:56:50PM +0000,
> >>>>> srinivas.kandagatla@linaro.org wrote:
> >>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>>>>>
> >>>>>> Hi Greg,
> >>>>>>
> >>>>>> Here are few nvmem patches for 6.15, Could you queue
> >>>>>> these for 6.15.
> >>>>>>
> >>>>>> patche include
> >>>>>>     - updates to bindings to include MSM8960, X1E80100, MS8937,
> >>>>>>       IPQ5018
> >>>>>>     - add support to bit offsets for register strides exceeding
> >>>>>>       single byte
> >>>>>>     - add rockchip-otp variants.
> >>>>>>     - Few enhancements in qfprom and rochchip nvmem providers.
> >>>>>
> >>>>> Ok, I wanted to apply these, and tried to, but they fail horribly
> >>>>> because:
> >>>>>
> >>>>> Commit: 1b14625bd6d4 ("nvmem: qfprom: switch to 4-byte aligned reads")
> >>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
> >>>>> raw_len")
> >>>>>     Has these problem(s):
> >>>>>         - Target SHA1 does not exist
> >>>>> Commit: a8a7c7e34093 ("nvmem: core: update raw_len if the bit
> >>>>> reading is required")
> >>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
> >>>>> raw_len")
> >>>>>     Has these problem(s):
> >>>>>         - Target SHA1 does not exist
> >>>>> Commit: d44f60348d8c ("nvmem: core: fix bit offsets of more than
> >>>>> one byte")
> >>>>>     Fixes tag: Fixes: 11ccaa312111 ("nvmem: core: verify cell's
> >>>>> raw_len")
> >>>>>     Has these problem(s):
> >>>>>         - Target SHA1 does not exist
> >>>>
> >>>> Looks some of your scripts or b4 is picking up older version v1 of the
> >>>> patchset
> >>>>
> >>>> None of the above patches have Fixes tags in the V2 patches that I
> >>>> shared
> >>>> aswell as patches in linux-next.
> >>>
> >>> Yes, that looks odd, it looks like b4 pulled in the wrong series, yes.
> >>>
> >>
> >> Even that looked incorrect, as the v1 series only had one
> >> patch("[PATCH 12/14] nvmem: make the misaligned raw_len non-fatal")
> >> that had fixes tag. Not sure how these 3 patches are tagged as fixes.
> >>
> >>> But, that's even worse.  Those "fixes" are now not actually marked as
> >>> fixes of the previous patch.  So that information is totally lost, and
> >>
> >> Its because this patch("PATCH 12/14] nvmem: make the misaligned
> >> raw_len non-fatal") is taken as fixup patch and wrapped into the
> >> original patch ("nvmem: core: verify cell's raw_len"), Also the sha
> >> will not be valid for linus or char-misc tree.
> >>
> >>> again, the first commit here, "nvmem: core: verify cell's raw_len" is
> >>> broken so much that it took 3 other changes to fix it, which implies
> >>> that bisection would cause problems if you hit it in the middle here.
> >>>
> >>
> >> All the patches related to this are enhancements to nvmem core to
> >> allow specifying bit offsets for nvmem cell that have 4 bytes strides.
> >>
> >> Specially this check is also an additional check in core to make sure
> >> that cell offsets are aligned to register strides.
> >>
> >>> While fixing patches is great, and something we do in the tree all the
> >>> time, let's not purposefully break things and then fix them up in the
> >>> same exact patch series please.  That's just sloppy engineering.
> >>>
> >>> Please redo this series completely.  I can take the "new device support"
> >>
> >> I can send them but its going to be exactly same series, I dont think
> >> anything will change as all of these patches are enhancements and
> >> there are no fixes.
> >>
> >> I hope this clarifies a bit, Please let me know if you still want me
> >> to resend this series, which is going to be exactly same.
> >
> > I think Greg is asking to squash the fixup into the relevant patch.
>
> Its already squashed up in v2.

Then there should be no Fixes tags. Is the series that you are sending
visible somewhere?

>
> thanks,
> Srini
> >
> >>
> >> --srini
> >>> patches at any time, and really, those should be marked with Cc: stable
> >>> to get backported, right?  The other ones are written as if they are
> >>> fixes, so again, I can take them any time, no need to wait for the -rc1
> >>> merge cycle.
> >>>
> >>> thanks,
> >>>
> >>> greg k-h
> >
> >



-- 
With best wishes
Dmitry
