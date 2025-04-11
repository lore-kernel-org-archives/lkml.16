Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28742C80
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388179; cv=none; b=dSV9raU0OtPzZaf0NyU4iH7xuCXYq1BH5/i9EOP63nmklPi9SUzjIZEVcmU6wD+sKZDWqE/RCJRc/cRjxMeLItDgJfxxhDDTkLrM3c2vavxXQUyT3SlgUIcL/KvuHNOl2J8R6t1BvR9jLeNFNlyuDXqomz4mCE4v+Oguhj4lfc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388179; c=relaxed/simple;
	bh=jjADHVXuoeWo3zMXJLAqhnQjIwflie+48BytBxS7vtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeEhDq9DdMnakZSWQ1F2W/iKJhXLxLOM758vA3qyI2aAazSoChzX1c/fafI+GwEsJ5baiJVjKdZRQRmukoWcrSiBGSXiabjLkHUidMiXA7pxtNRZsmERcoEZ6iGQHg8y4oWZDxFH4jBdxAMK17m8JrDgMA2bydNXV23dnzGoXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZUJlcqX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZUJlcqX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BGDh6P031989
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IhlaAVM447bRlfi7RkIp9IzM8AW0t5T8e260lhmWr8=; b=IZUJlcqX3iFQJxmv
	b4Gl6CvM1wCowY4OrpLABeMLNYcfbIPv89CGhTHGgycNT52L9qdKZMbNK0tDNC4X
	iXpeRofYnSQRlVt+E1yvLz2ucDWhx4IFcqdNLtiWFpOTnepfO7o3NHGavGStxon1
	aMaUGCncNbGVivzOiwxfFAiaka6IRkyyr42C/NxkyZ2HfzFAeakE12R4twR77dtm
	hGTABMO1h+SBfdOb/0W5evCiUnBOj29e3r64eAVjPRojImhwcvASnvA0Utd7VME3
	x7Z1rNx0cAZ/svZpxQMVumh/0cx6mI1sB3Z00KncltYHhjiIUaqWbBfrNePDQAFD
	GY6I3Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmjw2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 16:16:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73720b253fcso1725559b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744388175; x=1744992975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4IhlaAVM447bRlfi7RkIp9IzM8AW0t5T8e260lhmWr8=;
        b=wGaTVWyTsyYz2KpJZVbnEhCbQ9ws3ULSRXO/vgyHXgZgi7n95ovLKeu0g8vumlmKjf
         szEk2kL7MFiAxNE74lIl770SefAUtmOLgIbOZWfh2lHksBiGFW332hsDfbWYyLK9q4vw
         i34MfCsxbDoHZLlwtj8r6qiJDIQokHFbpyhZwDGYmGv2QdFqsvTzK/ptHXQ+S8hPVr4j
         aHviOipa83p2aj+TmGan/3yn2CqPju3qBewV96BTHUQ4BccL71Kgb9Y8/Cb0+/WKk0Qp
         Prt0Bl9zVKFfj3ieaqjzf9YAsZ6P1z3gSnOobkMKYg1r9DCgajRrthKT4kO+tdrD4LdU
         LsZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD6u0+GxAnvM0l1evbaaNvHeMJQ9+7x+or0Sdx3RWzqyhuXbBybwUjUBtBe8n6MllDX6J/A3F82EvWJkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+XWzIGWl9Da//pyeR1ex4p7lfcnyYxvbCUzckNeO8xQlwTUkf
	XxpRD63oCpexa9QcmkGNFIZ/UsruhTsBqrSvU9GSdBxEkNtmdVWU/SmcRmn5fWQBcyhIb3i2Jy0
	t/tKBf5iQDl+v1mW2gQsGoLe+QUQCRi+Q93enuVVRKtNfP7RDfekb3/7M/lRLJEKXuYv2xug=
X-Gm-Gg: ASbGncuJFR/Fyw0v/04jVx5iQnpCnbNJOeg6mb9OFpKvJDmIuUqFtJpcFU9oOJsq1eK
	jMRGYB9VyKEEwVc76wlyeDbgrtIb8oUdguhVzL7ekkWdpAyHUR//S3yp3o/9IgecWrz9lQb1Sr5
	OWIexljSqMj6Gj9uzCQERjAVKYaF3VJfZ08L/WQZmOZfPuHRUfgfPRpjKWXhr53vQEi2IXqS/iR
	5fvSYs3q4L1d97AfZXWdNShv6Ki/T46ISv3jFsRGAjX/VNkL4g/1yo3BOREWj408Z6i7UmPLLjY
	u6u+0wMLC0QBdDEFtshjISOzrdofYjoVRB4aTxf2oQ6QogRf0C/Ma2urlWXOHA==
X-Received: by 2002:a05:6a20:c995:b0:1f5:769a:a4c2 with SMTP id adf61e73a8af0-201797b96camr6010742637.22.1744388175334;
        Fri, 11 Apr 2025 09:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2C+sSIwxuAmGGQvBGazeQxoErfToQK8MgYWtP1mBFETFneyUCN4Iy+2hWS/Y2/4HLTAN5Gw==
X-Received: by 2002:a05:6a20:c995:b0:1f5:769a:a4c2 with SMTP id adf61e73a8af0-201797b96camr6010683637.22.1744388174958;
        Fri, 11 Apr 2025 09:16:14 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230ddefsm1789764b3a.143.2025.04.11.09.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 09:16:14 -0700 (PDT)
Message-ID: <1c7ed443-a5b0-446c-8689-97fb8319ddb4@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 10:16:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: accel: add device tree for AMD PKI
 accelerator
To: Nipun Gupta <nipun.gupta@amd.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk+dt@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        conor+dt@kernel.org, ogabbay@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de
Cc: praveen.jain@amd.com, harpreet.anand@amd.com, nikhil.agarwal@amd.com,
        srivatsa@csail.mit.edu, code@tyhicks.com, ptsm@linux.microsoft.com
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250409173033.2261755-1-nipun.gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FbbZYsqYhmVSg-zyQJFlhqiN2F8aYlYq
X-Proofpoint-ORIG-GUID: FbbZYsqYhmVSg-zyQJFlhqiN2F8aYlYq
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f94050 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=DZtHtFm8LNTDz7ZeIvIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110102

On 4/9/2025 11:30 AM, Nipun Gupta wrote:

No cover letter?

> Add binding documentation for AMD PKI accelerator supported for AMD
> versal-net SoC.
> 
> AMD PKI accelerator is a device on AMD versa-net SoC to execute public key
> asymmetric crypto operations like ECDSA, ECDH, RSA etc. with high performance.
> The driver provides accel interface to applications for configuring the device
> and performing the required operations. AMD PKI device comprises of multiple
> Barco Silex ba414 PKI engines bundled together, and providing a queue based
> interface to interact with the device.
> 
>   +------------------+
>   |    Software      |
>   +------------------+
>       |          |
>       |          v
>       |     +-----------------------------------------------------------+
>       |     |                     RAM                                   |
>       |     |  +----------------------------+   +---------------------+ |
>       |     |  |           RQ pages         |   |       CQ pages      | |
>       |     |  | +------------------------+ |   | +-----------------+ | |
>       |     |  | |   START (cmd)          | |   | | req_id | status | | |
>       |     |  | |   TFRI (addr, sz)---+  | |   | | req_id | status | | |
>       |     |  | | +-TFRO (addr, sz)   |  | |   | | ...             | | |
>       |     |  | | | NTFY (req_id)     |  | |   | +-----------------+ | |
>       |     |  | +-|-------------------|--+ |   |                     | |
>       |     |  |   |                   v    |   +---------------------+ |
>       |     |  |   |         +-----------+  |                           |
>       |     |  |   |         | input     |  |                           |
>       |     |  |   |         | data      |  |                           |
>       |     |  |   v         +-----------+  |                           |
>       |     |  |  +----------------+        |                           |
>       |     |  |  |  output data   |        |                           |
>       |     |  |  +----------------+        |                           |
>       |     |  +----------------------------+                           |
>       |     |                                                           |
>       |     +-----------------------------------------------------------+
>       |
>       |
>   +---|----------------------------------------------------+
>   |   v                AMD PKI device                      |
>   |  +-------------------+     +------------------------+  |
>   |  | New request FIFO  | --> |       PK engines       |  |
>   |  +-------------------+     +------------------------+  |
>   +--------------------------------------------------------+
> 
> To perform a crypto operation, the software writes a sequence of descriptors,
> into the RQ memory. This includes input data and designated location for the
> output data. After preparing the request, request offset (from the RQ memory
> region) is written into the NEW_REQUEST register. Request is then stored in a
> common hardware FIFO shared among all RQs.
> 
> When a PK engine becomes available, device pops the request from the FIFO and
> fetches the descriptors. It DMAs the input data from RQ memory and executes
> the necessary computations. After computation is complete, the device writes
> output data back to RAM via DMA. Device then writes a new entry in CQ ring
> buffer in RAM, indicating completion of the request. Device also generates
> an interrupt for notifying completion to the software.
> 
> Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> ---
> 
> The patch series was originally submitted as misc driver:
> https://lore.kernel.org/all/20250312095421.1839220-1-nipun.gupta@amd.com/
> 
> As suggested by Greg, the driver does not fit in misc and should be part
> of accel or crypto. Accel is well suited for AMD PKI Crypto Accelerator,
> and thus the driver is updated as an accel driver and yaml moved to
> newly created accel folder.

Why does this not fit in crypto?
