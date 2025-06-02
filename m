Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF2F4F5E0
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893634; cv=none; b=NdjweRM3dqPO0+M7Cu+a+0jHO3NRRWHbp1zpT2i7ulEmcp7KpAapm0XzeTT1GlK6/2FnnnuKfOrKYFJWA5rey6HjBHcRx/2qCSdTbALKwAXjXzWWB5oHxPrRV+Hm3eHziSodpt2nl2ldyX9ZAC+Ym/ZIeeHdkwg7KnjPpXmPBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893634; c=relaxed/simple;
	bh=T/aMHGXQ9Dvea2CWJGS+C4LVoUSOKu54gzrWsTEtT7c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kjioSEwheV+y/Xks5W5vxd4To+EXJh9ZGhJsUU0vlJkfEG7fQalauMBYYv670RQtm/TXS9mOxVzl21SyMCL1KLxebIBWOcdZSO6GpaV2+WosCFMhTEap8CmqA05JKzmZlsCan/hCbMndKIjd6gr+Z5FrNZsPIJYLQ5Hhf4gEXDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBdzeICx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBdzeICx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJiUx011138
	for <linux-kernel@vger.kernel.org>; Mon, 2 Jun 2025 19:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pv4Gvylo8FY7mjR4b9XsVtGARKI/SKacbF8jlSXtk5Q=; b=HBdzeICxNFwLE18Y
	C2Dg/v1rBYEUP65eqI6/FaYeqN/Ct0cinNTX1DiNk8746RkYf3qwc60F1L6Xq6FN
	Sc27EgduGLIQUcF6RuWGpDGKtwOw1s7MyxyXLKjGDJ1uz24utW+u9Ym0PXDgZMGo
	hNsvdLm8kWcDYwShwLPTsiSFKllzyssaU8CZO2r7oVXPCMZbDibSngGPL72Gnw8m
	qRPc1tg2Dy8LaS/2yQOQUYSTdCfdoorX8Pj8h9je9YWc1zJxRp7yFAam/6Ayn4ra
	LFMx8ZbsePRhPg73AIC17G4G+ZMMy8uv94974YqwHVAP/27uD4KOYbi4EkfJCfgj
	QOGmpg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8srd05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 19:47:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so809352185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893630; x=1749498430;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pv4Gvylo8FY7mjR4b9XsVtGARKI/SKacbF8jlSXtk5Q=;
        b=JSF2ae73wS9KzdV1uqLCuy0JBCK06zKiKwKImTY6MAbV0jy56Jf6oQkmxtTdtR/kaC
         jJBKHSO2cJd7J+IW9PJEeBN1ZBsgwsAKliX8TA4q4JIx6pIEpewoKwkhws8y+KAFNrJZ
         Ce5Uq6VDgpknR6Tiv9oX2Db6DIdYqSU8H8LIfvah8HMW/poIQeJa+pP5SifzhZFxOnRA
         sU1q9+45K8UdPSyaLSjEMdc6VgoEL+eblT/0zkAwloj6sFvWnjCtpOYdmlioojWczqAC
         3UjClF/Lhn0W52M47lcrw0xhDvdcPP4ATwQTmt9YN9hxcPbLJPVFWZbevOt4N6zsi9i7
         5jVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcr2pMZXMc3TEddJazqYJ/d8k8ehkwyjbVvDLHYpFpYWuNrBtxMHRnEnSgSoD42bheuxkxS6hgzLyaIs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCiPJofiGSL9gXYi9+6/mIkZ7yzpf4FtLjCD5NQDk4TE7ZT5W
	5RCAm+1HvR0ivCkaPsraNdI1CjpkIdjCT3OyvqSZ91qPofLQ0nWeB5aK1LIANJ5jsPaiwtPYrXW
	6PfDyg1Wk+4fEm6G+D4/YPRnVYsVLPtJrwzlYyJcaZPGT8Y0EhmeAevm7qu0wSaTr2D0=
X-Gm-Gg: ASbGncuxCYhd3dHJuTcQfB3BpZamxcnKsfRxnuIAIK4ncD3D+unLVTAFeLFgkFKgvdS
	EVZ5U77Q2L9GIjDK/DIS7tJxrErMZ1AI69T4Sfw8Dsa62MUAfjCoCJR3ac/0Q5OeR+ZwgjaFqTB
	3RK7s6Tnt9J3pzsBfFkiMtlLfMFf+FljII8kgEN38BQVsIgrgiSKaE/GGJSQVhYn5A1s/5n4Ugd
	gtDWS/D0vXKKvHt7MyB2XFZU3WaS3yUrr0anmClbW/X+0K7/DC9RrSKGsTi+UU3fT/r0hl7LeWy
	9v0vC8yuHCqXi97ZA8gpgqMPQnqFuKtHYXaYdrLBO4pQe6jJk4p1Jgwzr2d7NIMnorxlYbU=
X-Received: by 2002:a05:620a:600c:b0:7ce:be04:f838 with SMTP id af79cd13be357-7d0eac6350amr1384506885a.18.1748893630139;
        Mon, 02 Jun 2025 12:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEny2RN/ronKKFErzwQjb5Z23+FdZnMifLiGPoWjy39vEUqYNoTBvVufGWzNLvyNJaCwLvblw==
X-Received: by 2002:a05:620a:600c:b0:7ce:be04:f838 with SMTP id af79cd13be357-7d0eac6350amr1384503185a.18.1748893629760;
        Mon, 02 Jun 2025 12:47:09 -0700 (PDT)
Received: from [127.0.0.1] (85-76-98-209-nat.elisa-mobile.fi. [85.76.98.209])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2790sm15451371fa.102.2025.06.02.12.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 12:47:08 -0700 (PDT)
Date: Mon, 02 Jun 2025 20:47:05 +0100
From: OSS <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_drm/msm/dp=3A_Return_early_fr?=
 =?US-ASCII?Q?om_atomic=5Fenable=28=29_if_ST=5FDISCONNECT=5FPENDING?=
User-Agent: Thunderbird for Android
In-Reply-To: <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
References: <20250529-hpd_display_off-v1-0-ce33bac2987c@oss.qualcomm.com> <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com> <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com> <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
Message-ID: <41C69F0A-605F-4B87-89EE-FE86A8DC71F0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xqiXUpdhiwVxmHC9HxME8UrdSxe65JeU
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=683dffbf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=kLrF3Jeiykx/AYV6VMbcyQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=puQWGBksFvoA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=WDWld9wBFKh9IeGoHG4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xqiXUpdhiwVxmHC9HxME8UrdSxe65JeU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE2MiBTYWx0ZWRfX+zSuRpxT71MS
 nJG7HpAj1/AleibF7PKGLuj/QFxho29T0Evafs8/d1B2c5Hn/e2p47j65zqirMTYOvfSTecLCP+
 Nnae4PwqQGMJLAm443R8xpxb5DoKhLtF2e0GE2/Nhhgg9gJZNrtW5VD1mBphMpiUlL17INW0MIV
 atzTBHLsh31K7Pr2cwZoLvl0NAXDc7Ccm87Et+WHHkKoXq7z7RpJ8GuJeinsM83bW3Y8apnazEU
 KL3G8MOA2DwFaB4awc583VcFqniW/zFaMMd/TfiSaRqYwBSefUf9nT3g6OLT1KuO1r7VjTimyYO
 0DClPjBywudplMvb+GECC8j1OshVi8H3Kts/eIQIk5ZTA0YqmdWFBaznmGam2dxq4gK5fP8+2Ar
 vBsWk0v2+MVReAyFQWDLrsNJo1gtPCikIrJlGMjKUkaHzD3XoYl8ol8iUCsL2KY4Oh18+wDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506020162



On 2 June 2025 18:54:12 BST, Jessica Zhang <jessica=2Ezhang@oss=2Equalcomm=
=2Ecom> wrote:
>
>
>On 5/30/2025 9:04 AM, Dmitry Baryshkov wrote:
>> On Fri, 30 May 2025 at 02:15, Jessica Zhang
>> <jessica=2Ezhang@oss=2Equalcomm=2Ecom> wrote:
>>>=20
>>> From: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>>>=20
>>> The checks in msm_dp_bridge_atomic_enable() for making sure that we ar=
e in
>>> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant=2E
>>>=20
>>> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY =
as
>>> msm_dp's atomic_check callback returns a failure if state is not
>>> ST_MAINLINK_READY=2E
>>=20
>> What if the state changes between atomic_check() and atomic_enable()?
>> There are no locks, cable unplugging is async, so it's perfectly
>> possible=2E
>>=20
>>>=20
>>> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario t=
hat
>>> there is an atomic_enable() without a prior atomic_disable() which onc=
e
>>> again should not really happen=2E
>>>=20
>>> Since it's still possible for the state machine to transition to
>>> ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), chan=
ge
>>> this check to return early if hpd_state is ST_DISCONNECT_PENDING=2E
>>=20
>> Can we really, please, drop the state machine? I had other plans for
>> the next week, but maybe I should just do it, so that by the end of
>> 6=2E17 cycle we can have a merged, stable and working solution? This
>> topic has been lingering for months without any actual change=2E
>
>FWIW, I'm currently working on the state machine rework by the middle of =
next week=2E
>
>I'm anticipating that the rework itself will take some time to get merged=
, so didn't want MST to get delayed more by this series=2E

Yes, that's fine=2E I really want HPD to be merged before MST=2E And if I =
wasn't explicit, the state machine must be gone=2E Link training should hap=
pen from atomic_enable, detect should be reporting whether there is an actu=
al display plugged, etc=2E  Current code must be dropped=2E


>
>Thanks,
>
>Jessica Zhang
>
>>=20
>>>=20
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc=2Ecom>
>>> Signed-off-by: Jessica Zhang <jessica=2Ezhang@oss=2Equalcomm=2Ecom>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_display=2Ec | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display=2Ec b/drivers/gpu/drm/m=
sm/dp/dp_display=2Ec
>>> index 1d7cda62d5fb=2E=2Ef2820f06f5dc 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_display=2Ec
>>> +++ b/drivers/gpu/drm/msm/dp/dp_display=2Ec
>>> @@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_brid=
ge *drm_bridge,
>>>          }
>>>=20
>>>          hpd_state =3D msm_dp_display->hpd_state;
>>> -       if (hpd_state !=3D ST_DISPLAY_OFF && hpd_state !=3D ST_MAINLIN=
K_READY) {
>>> +       if (hpd_state =3D=3D ST_DISCONNECT_PENDING) {
>>=20
>>=20
>>=20
>>>                  mutex_unlock(&msm_dp_display->event_mutex);
>>>                  return;
>>>          }
>>>=20
>>> --
>>> 2=2E49=2E0
>>>=20
>>=20
>>=20
>

With best wishes,=20
Dmitry
