Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F242750F3
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627465; cv=none; b=hCPBDqEkSiTWrnw24fbplZs0HW2V39ZVw1oGiZm/2b9M6FMmxKLgedy82XRSCBWZcwldnawvHfXKIVmGsswlGXLsn8CdPePYogRois1ZDIemw/9gTXUzFxS0AJ442Ka5MtHAWwj8FLIXZIuNKn4Wy9GPZt4MPxe5QQpixvV+9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627465; c=relaxed/simple;
	bh=qKEHTJmkgISJ+di64Xg84D1hR6RLj2RPWKKSH2rcvPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVvNhO2iBoQLD0ySj5hEK/oQTVQBHVTU0iyIWuacWfYfL5Mo+dZenNZDDhWHJZB1SQ4/4ZlIWqyVY3I0WwtaMNl2fdNU+S6YBxRSEbjx1ihzvvcmJcMJLgMYeOM92H46nQWDCzuNVuenvoLC6COweVjZhGA0IUMjE9vInFTCgDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W7lEtrD/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W7lEtrD/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAF2NY026615
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQNFg2RO+LuLXzx8pk9NGhNaS/HpbKAbCtu9O+9m2sY=; b=W7lEtrD/CG96Vxv3
	GiGPxu0NcoUR+0qAucrXHsDZLUtNGOWZI5hvunacTBqazvCX6E7EZ3qZFyl9FgFh
	nIr7efHmJKJU0Yz3ZxlofhBdxURc/wCcyEL74ST+mY7qQLAFm50RGfzsf43gqZJQ
	QgCLTo8SXpOxjARtnRrEYSd4LJO3dxVm2yIK8A0lrC3aa6WvVE59F0PNVprr4ZTi
	MHhaXpz7lRNni9UXYOUngJW05NddlRJxe8J31JLv0x5+QfGgjSaLbr5++SmzWLVw
	aujBuH69n+w/zjOOqv9PWxXwTtXQGVl3uO2tngANh4NUW/U5zzD07TX3tQbIObPg
	NlaejA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yarh1bta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:51:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-745fd5b7b65so1837488b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627461; x=1749232261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQNFg2RO+LuLXzx8pk9NGhNaS/HpbKAbCtu9O+9m2sY=;
        b=S1Qk73vW2NxQ7ZyABTP+XoFLhfNC/Q/3OcO5EVvgHUhM6Yn0RsXlq1BqC/hmrNTIo4
         n/BqMjfKChLjN3KN3yczpOCcFcgvcyQyZ2baclblqKLwiXyLZbivGAKkBq9XrIjYGPAN
         nrBGfxM/eHefZ0jYJNtJRjTVEN/lQInHpR4bVCFrSAdDzmvTN5PQiPfYzSQ+Y8u5ZTXy
         oXTTI9kyceJCxw8bfGnyJ4f0wVaYKDcqBWUnctktzzprHfWgDllBRE5gWxgjPmq7q+wx
         qeT3wencG2guMtsvY7ei+ybqO4U6Qnwi0187HNKMRAGC9OKkAo+yaHvnzykeZmlJ3Kqr
         1Kxg==
X-Forwarded-Encrypted: i=1; AJvYcCXFJjmsNALrCF3Tx/rr5BBZk47GVk+1FN76x3B4/dVlwsXSkP3WNPzxYV+00XRfWp/qlPujfk9vC7VZxk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywufxe/vWdW983tH7mBwMxYXykUhtWXwao7U1rAP6H0p+MGMHSD
	jajDjdz6caXDJWhAtefbSlKZWdV7NHXPCPWTHa/5gLzosZKYTgj1PY3RHeTFRpcoGvgzgHL7RoL
	L/lrFCoEGIKWBfHc1txrh1l1U15tOHT56ihd3cgrrv0TE9T/gFAx9Cd2vAGz5xZdfNw6OhOy0YZ
	w=
X-Gm-Gg: ASbGncsNqHeL0L0KLOD9QQGelymJ2QEctCOISx2cPmBO4w8M6Drr5C3cGuX82oF1NaP
	ziFnBQT1cLDkv8bqiksAqxnhOkMH4bWfHUa1ZcujeQTUbs+y6m4I8OSOTZWxnwEvD21eD0YP4v4
	MGHP38gh4V7XuY/XWBsmh9o975QfvF+rZIfd3Jv2QBwrreqZKUhexk9SRWbF554LSPCiSPo/KoZ
	+kcy+SRdNzNeqQWWKAzWNFNUuNUhM4yD5OBoFblKW9dSj6GqUWE2yzLkSw2N1uf7Hytw1doaXGn
	yDFMdEe6d3jC0p86nVwAUoZ+EIUVL77IK0f+uTceUXeOWqNZWycadKvivAzp1ecLv3bzuQ==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr4146199b3a.2.1748627461426;
        Fri, 30 May 2025 10:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0/DxhVchUsP3GUuQR+rz8hEa1EHtonG4n9LVY8g10f4TVSCbT7ApT+IY723JWbTdA27KRXA==
X-Received: by 2002:a05:6a00:2e04:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-747c1a48890mr4146178b3a.2.1748627461002;
        Fri, 30 May 2025 10:51:01 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafbedsm3439014b3a.102.2025.05.30.10.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:51:00 -0700 (PDT)
Message-ID: <3b5fa433-e3a3-4c77-b502-096576ecc2e3@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:50:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dp: ST_DISPLAY_OFF hpd cleanup
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson
 <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com>
 <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUi59PNmRSYzyVbxcifhPKxYbtW9EuouOVXkT84SPOuwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NyBTYWx0ZWRfX7xhFa3IJgMpS
 1NriFhGUN9XRN66aRQIgpTrgg/BZ20epWw0N0aK7vah+gh6vBqsvkYNvfSEp4pCNhdC2s1eT6k2
 ALXd2PSEqNb3pCq/T31ByGSwMvIcdCPmHycBMWrr38CWPf2BMvJiM+mfDvz4FIODf6UOUrhw/z0
 oNoX5bkEvJ3twS7ZICXP6Y8SQIbQlm8T+vyvzJoauoPR7Xa0qp9WZR1uEP8L9Rz4LcyvIE1ty7Z
 GNfKSrpdfFU4zRFVVHUHZ5hzfmI6LilXjo9lGalQOxZtes6rbCQUt8zx0UcUccD1M9dUepmgVhh
 M7G+ojfNtbkit5SyRDa7P86wsvG89nwbVuM9bc74Z0tJfjpdCXTOWmyDwpVMVqCGYrLwM6ictgZ
 4bSPJrFFtNVyS+zQ4ybiUxjGRsxobXIKlTMffQI8b+OMLYA4eZSN0yJMkSwe7n50BiJSsnfz
X-Authority-Analysis: v=2.4 cv=EfHIQOmC c=1 sm=1 tr=0 ts=6839f006 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=ryANHwUXtzQLBLkujfsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: CTLybuFEISqL3sSl5ZTGE2cCOxyXiQgk
X-Proofpoint-ORIG-GUID: CTLybuFEISqL3sSl5ZTGE2cCOxyXiQgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300157



On 5/30/2025 9:05 AM, Dmitry Baryshkov wrote:
> On Fri, 30 May 2025 at 02:15, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> HPD state machine in msm dp display driver manages the state transitions
>> between various HPD events and the expected state of driver to make sure
>> both match up.
>>
>> Although originally done with the intent of managing userspace interactions
>> and interactions with compliance equipment, over period of time,
>> changes to this piece of code has become quite difficult to manage.
>>
>> Although, unwinding this logic will take some time and will be spread over
>> various changes, to start things, this series tries to get rid of the
>> ST_DISPLAY_OFF state as firstly, its really not an hpd state but a state
>> of the display overall. Coupled with this, there are quite a few checks
>> in the current code, the origins of which need to be re-visited OR are unclear
>> which seem unlikely or redundant. With DP controller on newer chipsets supporting
>> multiple streams, this has become increasingly difficult to work with.
>>
>> This series removes the redundant state checks and simplifies the logic as an
>> attempt to get rid of this ST_DISPLAY_OFF state.
>>
>> Note: This series has been tested with sa8775p and sc7180 devices with multiple
>> monitors and also multiple dongles with no noticeable regressions.
>> Both of these devices use native DP PHY though. Hence, if this series can
>> be verified on some devices with USBC-DP combo PHY with the help of the other
>> developers, that will be great.
>>
>> ---
>> Changes in v2:
> 
> The series is not marked as v2 though.

Hi Dmitry,

Sorry for the confusion -- had pulled the v1 [1] using `b4 prep -F` but 
forgot to force the revision number to v2.

[1] https://patchwork.freedesktop.org/series/142010/#rev1

Thanks,

Jessica Zhang

> 
>> - Rebased on top of next-20250523
>> - Change atomic_enable() to return early if ST_DISCONENCT_PENDING
>>    instead of completely dropping the
>>    if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) check (Dmitry)
>>
>> ---
>> Abhinav Kumar (4):
>>        drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug/irq_ipd handlers
>>        drm/msm/dp: Return early from atomic_enable() if ST_DISCONNECT_PENDING
>>        drm/msm/dp: replace ST_DISPLAY_OFF with power_on in msm_dp_hpd_unplug_handle()
>>        drm/msm/dp: remove ST_DISPLAY_OFF as a hpd_state
>>
>>   drivers/gpu/drm/msm/dp/dp_display.c | 19 +++----------------
>>   1 file changed, 3 insertions(+), 16 deletions(-)
>> ---
>> base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
>> change-id: 20241202-hpd_display_off-6051aa510f23
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 
> 
> --
> With best wishes
> 
> Dmitry

