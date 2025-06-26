Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0711A0BF1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917790; cv=none; b=dwp03j9lNXJufET06zQZxaxUf0KynZ8xZM8IbBLI+hC/IZPuGoVN0SCcstjoQcrtPeh/y1Weqm8wgG+gn+Lta5Ad0T3rjyeDYKCLNaJtajggeU+XUJ8yx5ZHLj2S4S8DtFnuhcctPBBNLFtitJlrxGeLUWaLEbbP2k/N/qgDIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917790; c=relaxed/simple;
	bh=tVi2SsHlzn6vFv17wmI5jfnTyqTKr1vf8vYFkxc8eBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TT7JDOiEJ9j+6V0zuxDI2I60VizjBLIefEnv+W3sR6kDUlt2fRy2MMDErtuR8ZLAERcSnMpQTOLahQFxLtSHdrrQHwgZ1PYAsgyQhwKr6k7BThIeXCXut4Hzi0KjH07nb4RXgR1RotcPHxVhFWXFYzYYv0r0N4Ypo9KtDc0t1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoYQ+N4T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoYQ+N4T"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DoLP015352
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zAw+vF31/8AdiO+erYtJscx3H3Rf6Jrg7lXaQ6w2fXA=; b=UoYQ+N4TKzXDaRem
	ZxZW0TxsMD9344z+kUc8ZkP0k18npFkuT2dYTehR+fNxXtqMpneI8vmBbCqsjrA6
	Hw8zMw/iJjT/WqvrejniApryT2kyC4CZHSM+1geMpG8wukZ/WJ/x/GemMHtV9xhY
	a68qfrVfSjDoAojM031WMduv7B3StNzThj5ZpEAGg+ZWoTjIuUeLK1SMnZVkk2JY
	NVh7LcJ4mjdAypZg3dHQ1hvK+4113I+ILIzgs6+HImL02aW9g9RwAA+/hADrIDG4
	UvPvJPxhMpi6l0bvRQWJn7bwVzAf63lHPFZ+nbyvaIlheXc889ncPlXXdqR5SjO4
	d3fIQw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fbw6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:03:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3183193374so521274a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750917786; x=1751522586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAw+vF31/8AdiO+erYtJscx3H3Rf6Jrg7lXaQ6w2fXA=;
        b=F7Fol4lesQg/WboGjn1tbK6dsUkArOeSzbY94pXKJcZLcaiDTqLMkwWAUgXz/80+zI
         AfG9YOHidrpqqqXlxqTPQLo0k00wgHVs1mgf+80Ll3V4GUFbXDG+aJDroJUC+lQ1z3+V
         b86PcrqqRG3aF1gl6NxzVVw9TQKHLN4P9BbO84ao+rIYoy2s3IT8PwaHKWZ6OneHpjEB
         KZENmdutHxkRk9MiXZ79VlyaWkOukNCxelmsYdH5C1jgzZP+/oaSUEHcZC9YO+mT9KoM
         kwtXw6dpSTNfymS8//tW/qrvjDrap36md2sEvrcwd722LjrS7nA4qHSCoQ+Z8Pd/FMEX
         O/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQX+pPjp2NxaMGA7Qvoa0roLKEFb2Am5QcnvmxDjtu8zTKYDTHy/FJ1n8e+0IeHiE/tCY8zDBFlD+1kI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNku/N/zTbqEKB4ng/w0nF33zBP5fLJv0S9n7BLJ9PgKnSk4i
	ASiVFDfnKuV4B6CPrODsMwjZNCtWWcLmejsTclZksU74+vUKwMT+M/L70m2RNb5Wdsm5hHd4DDf
	fNhM2QTlhWIZZL6ecTO0+RPu3fBz0Ptt/M/CHL2sfYZUrziNUgcPPJJnGVB3n2i/BmMU=
X-Gm-Gg: ASbGncvSpuADq1Zl6D4JIWWNl9jzgZIpVFNrONjDCkMrk23OFUPBOGcjK3mCPZcy+Lp
	oGxGVIERH6jIg7nE5EnFOrIpoU06t26OSxQf3HwQOigZMBWJSOzzCbL8ppnvwaQYIY4MESQakXe
	VSsaltDRI6ds/l43oyJ981qFCHrQP6ywZut4K6cHD/iMWAv7vDIhMJhAInWKEjyFtj4QMLnGU6n
	PnG1xPepYN7F4Z/1rEiF/pO9KrClL95rdhHVruKsobsMCJ4Kv95ZyQUtypZ/J5YdzCe9KKPVK8t
	hFRAJ/UsH5wd6Q+oLLeVXW6zvV1nndxR7P/BtSiIQJ5voBwH
X-Received: by 2002:a05:6a21:6185:b0:218:bb70:bd23 with SMTP id adf61e73a8af0-2207f35cfccmr9126436637.42.1750917785755;
        Wed, 25 Jun 2025 23:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAZY2KhB8bCl/WbYS2FoCo2Ms0rCSvnA7RI6r9DuVu8+cXGdo4K/PTAhGks9c7EvtK428CXA==
X-Received: by 2002:a05:6a21:6185:b0:218:bb70:bd23 with SMTP id adf61e73a8af0-2207f35cfccmr9126395637.42.1750917785321;
        Wed, 25 Jun 2025 23:03:05 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882f5b8sm6388591b3a.95.2025.06.25.23.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 23:03:04 -0700 (PDT)
Message-ID: <245d602f-3037-4ae3-9af9-d98f37258aae@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 11:33:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Fix channel resource access in
 device_open
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@kernel.org
References: <20250619051026.984361-1-ekansh.gupta@oss.qualcomm.com>
 <kk3jvlwjdzy2mfs6bip7dadrnsoxwksyp2odi3rfxkv4crmwtn@x5qyn4sp2gck>
 <2025062424-dizziness-theft-0502@gregkh>
 <2025062434-reviving-grumble-1e53@gregkh>
 <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <golcrcr6voafr3fqsnihyjyut36sii55vzws4josfhkjjg3nie@ur43qq2kvlsv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA0NiBTYWx0ZWRfXxlIAv7MSg7Mr
 7iup89ZTQIKTZAxZal85dV9nWW1U1yiZUi6xD9CK40HQzfI1VZiZ+wtLb4La2fYt1iv2NtFz3hZ
 Paphq9H5dlmCfyLqD2yu0PsIoVzX8/sKnEStB8N89bj7QTBmEwNTr+PbvItWVTzbTkC183myze1
 4RQe+fVBqgqFaIBouejecoVz1Bef0NF/zKHupCYhCKkHCgu8T7WZjEcgxtrX/6n1ADjooUXmjas
 0YrwhbXbwyepFZwIakMgJNEOMbGY2cVTcjQdrMdRxYNFEDqcylZlM51EIR4fP7bTStfm+3GuBRq
 B4l9zWr9QFyNWxJOTjM9bn2QfYWkrmjZocY8NvRazGNQt/38ILKcxrqauZ6TCd/fNbVvpQizFP4
 1nec4oggpDmTMhjmGNYoX1fDCC4HNWiSnf1Saj1X1tbalVNdMag+kW7qvomdNnkyc12pfBeh
X-Proofpoint-ORIG-GUID: qPR-oAAK6xm8TZw266FDXOwMgTVN_yUp
X-Proofpoint-GUID: qPR-oAAK6xm8TZw266FDXOwMgTVN_yUp
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685ce29b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=A2EB1aqQ-V8H35JDescA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=971
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260046



On 6/25/2025 5:15 AM, Dmitry Baryshkov wrote:
> On Tue, Jun 24, 2025 at 04:38:25PM +0100, Greg KH wrote:
>> On Tue, Jun 24, 2025 at 04:36:35PM +0100, Greg KH wrote:
>>> On Tue, Jun 24, 2025 at 04:27:21PM +0300, Dmitry Baryshkov wrote:
>>>> On Thu, Jun 19, 2025 at 10:40:26AM +0530, Ekansh Gupta wrote:
>>>>> During rpmsg_probe, fastrpc device nodes are created first, then
>>>>> channel specific resources are initialized, followed by
>>>>> of_platform_populate, which triggers context bank probing. This
>>>>> sequence can cause issues as applications might open the device
>>>>> node before channel resources are initialized or the session is
>>>>> available, leading to problems. For example, spin_lock is initialized
>>>>> after the device node creation, but it is used in device_open,
>>>>> potentially before initialization. Move device registration after
>>>>> channel resource initialization in fastrpc_rpmsg_probe.
>>>> You've moved device init, however there is still a possibility for the
>>>> context devices to be created, but not bound to the driver (because all
>>>> the probings are async). I think instead we should drop the extra
>>>> platform driver layer and create and set up corresponding devices
>>>> manually. For example, see how it is handled in
>>>> host1x_memory_context_list_init(). That function uses iommu-maps, but we
>>>> can use OF nodes and iommus instead.
>>> Is this a real platform device?  If so, why do you need a second
>>> platform driver, what makes this so unique?  If this isn't a platform
>>> device, then why not just use the faux bus instead?
>>>
>>> It seems that "number of sessions" is a DT property, is that something
>>> that is really defined by the hardware?  Or is it just a virtual thing
>>> that people are abusing in the DT?
> Purely software value.
>
>>> And if you really have all these sessions, why not make them real
>>> devices, wouldn't that make things simpler?
>> Oh wait, these are "fake" platform devices under the parent (i.e. real)
>> platform device.  That's not good, please don't do that, use the faux
>> bus code now instead to properly handle this.  Attempting to create a
>> device when open() is called is really really odd...
> The driver doesn't created devices during open(). It creates them
> earlier, then another driver probes an populates the data. I suggest to
> follow Tegra approach, remove the sub-driver completely and instead of
> calling of_platform_populate() create necessary devices manually and set
> corresponding IOMMU configuration from the main driver's probe path.
Thanks for the suggestions. I'm checking this approach.
>

