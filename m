Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68317B421
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748886862; cv=none; b=NU4+VXQ6oRH6sqQhtvwzhO/muRJtIuzbZuWyNtJPEo67V5BPPIjSKjcU/LWYwG/w9lW3d0v/t6UiUhHl5X3YHndZrANlVCAZ1AOGoq+RQMQ67A/l258z/2yVlvP3B9uCqM4h17PCfDgKlM+ItMObkZjgyUPcGIKh2eKlNnEqU9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748886862; c=relaxed/simple;
	bh=rQaFfjBFw2cNf12AuPRlV+vlVTZ+cZahtbK7eGhXkZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyvHFvhPu7sFauwcY2ZmB6Tp6q0UKH6DwklPpbrgXw2AzojEqx+pU3+ApCscnv8dEcxYKms3Z5aBrXU9tzeoie2Ot1eTGxiaxfdWgJEujpw5cDRjdULhV2ADqCAJOUOpmKQAEeSX6WX2g2JrhRA72Ejhl5zSbf1H/QgV2W+Ufzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqAM8tVu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqAM8tVu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJpgI018908
	for <linux-kernel@vger.kernel.org>; Mon, 2 Jun 2025 17:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u9XvunIrclrT7hjhuIP9HfHbDT2S/9yYDl5lq8q+7mo=; b=GqAM8tVufg5aWU3o
	Zmu0odxQY1VNvlCf+uN7AKQEugEbd9BIpuad2THHcb7yvWnSxFPzI3kQF+qXNr+w
	YnHlHl3D+4JJLYYIbRe27U3EpVQr9l8YYZzA+8aU/PeaI1TGmdPAZmCcQIZt8qGD
	xKD1w+vMDs8BpCD0OzvnMrmc+Es2BMt1gAo5Nwp6X/7l10VHrLYcdrnUOoSKUlVp
	o6mTyJLFQEGuhuArQ+0llqFUQvDjPI34JOPMdRI9RIxcLwzzQeQPGwpDHMfFdzvC
	TgSjunoWGpVLzrEi2uBAoho4FY6naTF2EzeoTkEuZSc92FD/ZPf3tiIdHvg6zNVh
	HSoddw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8u82f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 17:54:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23546e35567so25532345ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 10:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748886855; x=1749491655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9XvunIrclrT7hjhuIP9HfHbDT2S/9yYDl5lq8q+7mo=;
        b=FDYgSZC09OviUNBHLDohf4Kh9nXfY8FVERMKLzA80zdE/rZtFY21nFqXvFwFfGgdDr
         ikjJuZ6al91oLX6IZjem41cnkGaZLNcJf4+gIbpwGmmKjZfOhx6xHVBhP7ywg/Ek4Xgo
         ZmMroJiTZ0AuFDnXxCFsjQWHck5HivDvF5C+u+5oJGJIcmsOPTRmgzkDhExFYPn5ZTpJ
         df6IuChWN9ZVM9QwiQgarTR1fJhH5ln6a5rzEONUEZktAaEWN8opQoJYYC+UoPzpCXi7
         TZjqx7kSNHTRWZlOvJgG4P10ScX82jv2YWBHy5Ww2xNzaRzVV/8hZtBffSr20JUf4qpp
         uniw==
X-Forwarded-Encrypted: i=1; AJvYcCVszzig/s3ge6VLhLJkdrTgZaiNZ9rVCyNJ1Q7/rfCiHpc7AhfSnzrPKuNBgFLJ/9wfGQwDAX0n7vafNzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPNp48x47spR07Qi/1/r6/WWo6DJ5bjEjWzrI/TqTfhiBNxAsI
	kq5VCjd3AL161zGpgpBZixsWhR3ISKdANLoNHoqlw5T1ktDPzKqmBgw6xEMChzlwsmfNmoxlefR
	wwBG7EDRJ8qnEH8PXqXBQCXsEIOXI55Lh5dxK8ypyrOXSwFQcm+kNnwVgswi0q+Z1P+Q=
X-Gm-Gg: ASbGncuUSVMP9DWZMVZ9eNw2xWX6esg+BvSmcNb2R956a2HYCqJSzv+WvGKiihOCGx+
	DlvRKzJQH1YEqzY+CPiKBV/TV920y21GJ5SDIPcigVQD9nWgZZg9V9saQX1X6Ntd7+ah6z6RmyP
	oee9Vf9aQqBEQ792XAayjRD/8xjCusbdnq6F9v1MRhH/17NtpFQiVf24TvpcqgakO6yRJfu6ND0
	MQgle9xTFSMVkPSk+tsre06g8Xqee3aWGNcBlVNMued94xCY+XNygH7rLd4YrT5CevuQOtBGP8x
	zPYSayCNZjaaQAdlz0TgLF3WQyiuIkL8IjJ8Adh8iqVSY/OGQXaMaq2r29oG1rnwIiGDKA==
X-Received: by 2002:a17:902:ea11:b0:234:9068:ed99 with SMTP id d9443c01a7336-235395b1df0mr187795995ad.24.1748886854596;
        Mon, 02 Jun 2025 10:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnVKXZ0LTtvyZS3lGmVIwCTIOA+EO1ClF4BKT3ba4Q6ILhNwe3yQldHpOCpjXK3ErOrV831A==
X-Received: by 2002:a17:902:ea11:b0:234:9068:ed99 with SMTP id d9443c01a7336-235395b1df0mr187795645ad.24.1748886854172;
        Mon, 02 Jun 2025 10:54:14 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc8a40sm74072675ad.2.2025.06.02.10.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 10:54:13 -0700 (PDT)
Message-ID: <3f386e7f-5e22-4c67-bb3c-202f13c94d56@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 10:54:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/dp: Return early from atomic_enable() if
 ST_DISCONNECT_PENDING
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
 <20250529-hpd_display_off-v1-2-ce33bac2987c@oss.qualcomm.com>
 <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CAO9ioeUPJm1MbqAVJfcQSTAmvY3-TmvtZ+=Js1mZ53JFYHoUhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE0NiBTYWx0ZWRfX40R+Mc0SN0/L
 +hrezHINgnEV63o0yp3iC48E88BI0EU+r3kaLon4XZ754L8iEfTCn/CfLjsyp6dKVqv8gjUl0Jq
 xWEI+TgsrmuR3MfgGDIE+vjC2ywWahYLheuq1wim2TReZZIsaXbp2zcQDXfQaLt7Zdd07gm9mKg
 SwwkljyvjL9K+PHnh90jhCJeKTzmwpujcgU97L0yQJHW+PlwtHK3MQIp59YJxGwIafIUoQBvkGz
 qFd8BtWaDUGv21bn+ZfnkJtX4bO5JhpUHcV1UFSETMCTjuUjmIMtIyzHf6oknJ4rHKsbscu9vtu
 fw2hAIz+bzH8JdEh9xEkPFA/XvypKjFhXw6x9efqiAeQFhGlHQKwxGD51Hgrs8/LCNm2oIL0lJG
 bOc3l1pW3Y0q+F9v+RALPujI5PUkZiMFfcOiqgTSOyre/RcREo97RgKcuFzmGfWMbJBHiNxW
X-Proofpoint-GUID: 7TsDuEQmxUmKLanPnRiC96yPrSWKUCGX
X-Authority-Analysis: v=2.4 cv=EpjSrTcA c=1 sm=1 tr=0 ts=683de548 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=WDWld9wBFKh9IeGoHG4A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7TsDuEQmxUmKLanPnRiC96yPrSWKUCGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506020146



On 5/30/2025 9:04 AM, Dmitry Baryshkov wrote:
> On Fri, 30 May 2025 at 02:15, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> The checks in msm_dp_bridge_atomic_enable() for making sure that we are in
>> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
>>
>> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
>> msm_dp's atomic_check callback returns a failure if state is not
>> ST_MAINLINK_READY.
> 
> What if the state changes between atomic_check() and atomic_enable()?
> There are no locks, cable unplugging is async, so it's perfectly
> possible.
> 
>>
>> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
>> there is an atomic_enable() without a prior atomic_disable() which once
>> again should not really happen.
>>
>> Since it's still possible for the state machine to transition to
>> ST_DISCONNECT_PENDING between atomic_check() and atomic_commit(), change
>> this check to return early if hpd_state is ST_DISCONNECT_PENDING.
> 
> Can we really, please, drop the state machine? I had other plans for
> the next week, but maybe I should just do it, so that by the end of
> 6.17 cycle we can have a merged, stable and working solution? This
> topic has been lingering for months without any actual change.

FWIW, I'm currently working on the state machine rework by the middle of 
next week.

I'm anticipating that the rework itself will take some time to get 
merged, so didn't want MST to get delayed more by this series.

Thanks,

Jessica Zhang

> 
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 1d7cda62d5fb..f2820f06f5dc 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1512,7 +1512,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>          }
>>
>>          hpd_state = msm_dp_display->hpd_state;
>> -       if (hpd_state != ST_DISPLAY_OFF && hpd_state != ST_MAINLINK_READY) {
>> +       if (hpd_state == ST_DISCONNECT_PENDING) {
> 
> 
> 
>>                  mutex_unlock(&msm_dp_display->event_mutex);
>>                  return;
>>          }
>>
>> --
>> 2.49.0
>>
> 
> 

