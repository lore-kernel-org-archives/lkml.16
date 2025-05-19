Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC9B1EF38F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652782; cv=none; b=e1ojvmN/5mAeV7IL4EGCm1t2xHhCI2Dwqa7G/79UIrrdYuShjoGNn6QY6alM+q/+7HtDY0Lp+2ynDUm05r86hnEQaxBVXmzp2zoahtiQkC+Fd/QnRJIHAUtdatnkLOxMMBPBk+gY/+37NYbdA+9qep0O4da9OsrK16AQuhl4+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652782; c=relaxed/simple;
	bh=nZTBtXboM2ajlv8DEsBb2GCaa1NC4QDZ3eeC/e3ZIhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJ63QlKAcBwn/L9dNkXHIkTvqUVfJ3tgAgpYDmyuEmmuV3qulsm6lrtIr69AfkpxxoJ+8Fj7hTeepcbcsvDwyEYLHe1lJ8y81XY4XkiJwQb68imbM1yAbCVCSTZjkO5WFceTVZjNrj61ZyeimhD5V/vs2OK1WrX7pPN8tlqfVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JewDuTcO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JewDuTcO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4FDID014496
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUNDWWtPZoGCLyfSP3pq1jbetmnEZ5Ir/gdEY68iwt8=; b=JewDuTcO/sMRs/sz
	BHl7xxScZxq9ahtbeNBmg9j9H1VG6RozyrCBhw0v8RsfaHnjIJyqZbCxmj6ufHov
	H+CndrM1ua2utYRfhwYxPjx6CV+4CKr0zfvcz6Td2vUlryypWkwtm9hYbQj6ciW6
	fpUGA+lwuokrxopJO7FQE9p5gpW75aVsTfi7x8RBdQRKy8coRUbVGvA5XBQbj0wD
	w51V9l16yUQxEFoZgCn15mNmT9JPEK7LRpOboP7nP1zRpjxy646OJw8eYLiHtjCS
	BTDTzHPHnWdhBqiTq0C32TpIkqmJulgTJo6mUwTHgnA066ahuuA9b/FttEO6J1so
	uQITAA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh620-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:06:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b26e38174e5so4106093a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652778; x=1748257578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WUNDWWtPZoGCLyfSP3pq1jbetmnEZ5Ir/gdEY68iwt8=;
        b=RK68U0Uhlxgp3p74NSjRtXoHTkN0AFpDHViRZZo6aT/6tjJbeaaBMQM8IMi56O/pA1
         tlBzHLQiCnyPGsTRrvOJD3rOlt6eVRKmi1cXhQ6Q9E+VMl9Hh1UTQbathflDaaEOcVH9
         M1bW1czXQZRl3NZdJhF6hkgQ5hEgXpIyEuZWOmuach6AWeUvYmiCb3L6ZBzdurVAR7U/
         VJ2vgiLLVulHkTeIiKFMO5i87lgOMOdM/rlTkW6KzdVoVnJM8MLW1iV2jXZ0lAitElqu
         XeL5bybVAhf/1e3wp7f6nM/RjAJqzof/Bu/b/6r61QbLNfaL9cJ1Zqg4qutwUQHLbq51
         +h1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyEPx7z7Vm+DH4UMaSTBZ35f0BYbOkahhA5tDKLi6vUfaFnaA+xDcD8EtscGBmz58z/vwsF+kADrhSf6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51Xe/AqJ2NpuzU2mx2jmXCoxAnyKe5x6DI7W/cuidh3K5DEzU
	hytTcvyk8K39GZHRdpguWJBQRENXyBwAEipoqDzIMbmo73Pejl2iSlhDWVlpBECHDZVg16znxTS
	tgrJCOM0z0lEcE+d1ph9NgSjrY4+kAXr/gLz+NaROaLn3tMjDNZLIpON52kk9jyr5/Rc=
X-Gm-Gg: ASbGncsixxJVzvEOvU1Oi/8Wj5Q7KRrsXQXrfRquR6UZYOlrx2r2on2ydIXK5dnoV5W
	eBd2xbkhD8D7IzztyeYAn72rWqG3e/GcbSVa/BUIYTw4JTz8JQj8yA/bh3jbGAlVqb8H/DAnvA8
	cF7BXyurWOptxNSgBGojEqek3fuHDfsYnGzaCDkZflRUvR3RjSVLf/QDimozyCUlx8Sydc2zIjG
	6dM/oCCPQxUvweLJryPc3D6H3QUL3H4YcrZF8A39ImsK3suQ4XbdYYM7+oilU4I6z5eggbT9pQd
	IKccijXjulTODh290yygLMpMiu4ujQYeATd2yQ==
X-Received: by 2002:a05:6a21:3d8b:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-217ff4bcc70mr13447305637.39.1747652778291;
        Mon, 19 May 2025 04:06:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHW8AIMBrKHP5ulMfETRqfjRJlImNtYkbXRn6muV3ss1e64lSzJgGDOqisnYMXvv+ewYsT/g==
X-Received: by 2002:a05:6a21:3d8b:b0:217:ff4b:cc57 with SMTP id adf61e73a8af0-217ff4bcc70mr13447275637.39.1747652777923;
        Mon, 19 May 2025 04:06:17 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970bb2fsm6135568b3a.53.2025.05.19.04.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 04:06:17 -0700 (PDT)
Message-ID: <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:36:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ywY9co_YAV5WQtDRU9Zf59VilpSRUxIZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNSBTYWx0ZWRfXxZCvDkJbgpty
 g22jI622sG2/Fj/vsGrcV1wF8F0XFaFaU6JLeoiH+PomrN2D7j5FCVIB8dXk5AMGSR4nyQjKXwN
 kO3aIF0TGmLzj8qfRDVyOtY0Iia9rBLvR+GPIKJqUkeKx8cAaHJqi9fZSL/H/s8h7OWBOyMgOV8
 Uz7Zkz8Zd6axCmZWdRemEiJCtEf6daHyp4qD2KescQGf8Sizpy996XsSeGDT/PE8d1oqM6icvqn
 sp+2CGNKSxQ2vCA3TDkAomyJRSKPA9ZW5WIDrajmcb9iiT7hxsqYK037V0s49Yx9aVtiV7GJusZ
 mC1FDwZ48j+sNcdQz+hMS6tv6c0DAENyYczKGk9erxahOJGao5M7HKRk8/J9uKj3meq17HTyrR6
 110TtcnuBz5RJzFNICnHRdSrRD74kA0QW426fcxvXAwtQ4AGZRqgyAfKe++NbFJe3m5nx/er
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b10ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=04P1SzlzcXGIquy7d0wA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: ywY9co_YAV5WQtDRU9Zf59VilpSRUxIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190105



On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
>> Remote heap allocations are not organized in a maintainable manner,
>> leading to potential issues with memory management. As the remote
> Which issues? I think I have been asking this question previously.
> Please expand the commit message here.
This is mostly related to the memory clean-up and the other patch where
unmap request was added, I'll try to pull more details about the issue
scenario.
>
>> heap allocations are maintained in fl mmaps list, the allocations
>> will go away if the audio daemon process is killed but there are
> What is audio daemon process?
As audio PD on DSP is static, there is HLOS process(audio daemon) required to
attach to audio PD to fulfill it's memory and file operation requirements.

This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
daemon as it is required to take additional information and resources to audio PD
while attaching.

//Ekansh
>
>> chances that audio PD might still be using the memory. Move all
>> remote heap allocations to a dedicated list where the entries are
>> cleaned only for user requests and subsystem shutdown.
>>
>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>>  1 file changed, 72 insertions(+), 21 deletions(-)
>>

