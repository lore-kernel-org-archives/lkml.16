Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8862741DC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383262; cv=none; b=lIohYmmLZC8yjPJEFG/3Jt1kRFF8mDY9YlFt8ycwcX6PdoSeF9jBaung4uYrfN7r75umRPBMIoODY5HUYMLm8rpM9fpTH/whq+pjXL1YfP1UDcFVe1jUo0BYAfOiJdCSvFFOoMxdDSGU7xOPEsyDxwd+3yPk8mVL2kgzkLVjVaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383262; c=relaxed/simple;
	bh=DmYqBjCiA5PBwNdCUtV6L0uTXBOKuI8YmxQZJktB0Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fT0IFCh34EgOSvyB02RzkUwk0UOk8VWLQ1lyJsiDwZdOIQJJhdO7keSC8VctFtQNk8U5V3PoU5NubAZz+e2sbu/96gt8i2PVvYaEsBgcnTGTkdZLVF33qXijp6ltqpjnT7QBD9p9ghAbaJHaVoUbQDEtDYYdYv+VdDHi1ZCM2lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIlakh6W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIlakh6W"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619kvUM007227
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 15:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nWs/xb1vRSVrZ23orH469KqPX5Uv0VM7XaZIbkm6Jh4=; b=UIlakh6W1MCgTS0w
	dQ8YPd0+SU/cW248W90o4Yn+WukQbWtsRGcboMH8I+RWg6rWgEse+YqacUs29E0v
	oRiJ+a0dDL5ayDgStgmik0I26Nhnx+x/LkFotu4/Ns1kxcPWo4TluIq1qiRj3GY+
	GMxyh6bkcsDfxD9uSWeGtu0qnhuVNtdoUE5NFXmkh2r4OHzpoTXe4KvkuOYgXrn/
	Kul5rvlt4XmBwOigbvoWEZnZOebN8vwkou5DuEAXjhzEij8FbdTYZ/C8Py8qiH+2
	WjLotb9uB8PRQa+EdoKYLd/cAk9vVbNEyj7y1FCM/qVnHKBaQoM5qyqjbxIs9a/u
	bHVwtA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jdr8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 15:21:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235e3f93687so49305595ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751383259; x=1751988059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWs/xb1vRSVrZ23orH469KqPX5Uv0VM7XaZIbkm6Jh4=;
        b=p2rjhEWDJQGcnZOkwQDPdVfpvQWYVx0mR00d+wEAv4Or9MsXrUfxxeDICtdxc9p5NZ
         XN6ZTXTLQHmyvz8PAmohIGSiXZPAjfO4re5lQuKUmTLAmtvdCiINrr7hr6HOAdfz/8EM
         Nf7RrLVd2mmn9NY5BvgU7gpTA9YrXZcN4r9uIGZbJZT5KUuABJHfX+bhatVLA0qhSlkL
         RfJ2rSvhs9oPYT3AJeFCM/stCXxLmo3m96V+csDCCdsKMyUDK3/uaL6ZwHBY3YFxqRrw
         c1BeR80SJk1mzB3fqNhvPWDxaE4/0SqcJTSUeiWbp+vRCrTVYGdBEfr8RkBHlZijXx2J
         6iPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFKF7VItLdo/xgGfSj6zOcmPhvELZWdeE59r13bQy242Sr7hGL8VLaBN/sZ/k43VFZnDfNhZKUWsEFlMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJMsFClKPbAfJ15VLaiH3l+9H+85+yRVMoMgq7zKC7iqiwdxk4
	r2yDZIe2ifzcjqfrjTgmNDfAbN983ZvixBzoRh+6K3FFGkviQxNlrn47GYDSCL/eRJczDlNfW9M
	0hvT6pNp9JQDdtWKXNuVRZjgJWGxqKwNH5CvbkFtWxxJ/HOG+HOi6yC7cGT56GUvVsyyDcIrrx4
	A=
X-Gm-Gg: ASbGncsBwg3Upc+PWiyeJrcfosC7gqdUe6YI/ElecyEl1YuVbNz+pKEz9aIVgrRikQE
	FVxZffpjMSfoOjpyQ6M2H9ZuwXCcYZGEs/UbZ92RMd55DUJa+8Y6TCgPtiIsCZc3WTzf/ANAuDq
	iCDLWfyc4R3Zsf3WCslfgqdC8tT1Ddm2AksDTd/fGT48+eYJe47xGtk64meSM58rrekJEwYlg4S
	viE1adn71G4msA8iLJssqNwMCTqQ1m9LirSjD3ovxni8YGxdEc7nXA92ScS94bIyta+YW96pqVR
	3o5tY3HzpeCg2zQi5VWgn53QPhfXj2+hsO3HcI1t18g1bosb8IUc/oVuSyG+F7iVZNMjv9RQ
X-Received: by 2002:a17:903:2acc:b0:234:a139:11fa with SMTP id d9443c01a7336-23ac381b1efmr236944125ad.3.1751383259296;
        Tue, 01 Jul 2025 08:20:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFStwjk67YEUI9Oq8heAN5eBmkoywGIh/1YJEVqnxjaukSDuHrgyVq2fd/MD04Ev/pgKWVXWg==
X-Received: by 2002:a17:903:2acc:b0:234:a139:11fa with SMTP id d9443c01a7336-23ac381b1efmr236943785ad.3.1751383258925;
        Tue, 01 Jul 2025 08:20:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1b49sm110555205ad.22.2025.07.01.08.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:20:58 -0700 (PDT)
Message-ID: <04216cc3-c8ec-4782-a021-705f53c0fefc@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 09:20:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/4] drm: move drm based debugfs funcs to drm_debugfs.c
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>,
        "Koenig, Christian" <Christian.Koenig@amd.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "simona@ffwll.ch" <simona@ffwll.ch>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "tursulin@ursulin.net" <tursulin@ursulin.net>,
        "phasta@kernel.org" <phasta@kernel.org>,
        "dakr@kernel.org"
 <dakr@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>
References: <20250701063303.3210665-1-sunil.khatri@amd.com>
 <BL1PR12MB575314D550E85AAB35321DA79341A@BL1PR12MB5753.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <BL1PR12MB575314D550E85AAB35321DA79341A@BL1PR12MB5753.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6863fcdc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=RAJSH83syF66xFRst6sA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 7wf9nyLy5Fv4lslT0j5BpCRhjiEFno-q
X-Proofpoint-GUID: 7wf9nyLy5Fv4lslT0j5BpCRhjiEFno-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMiBTYWx0ZWRfX/7F4qwZvnK9G
 PE3kLqIGkvT3hbNiGGxQ5IqjlvZspkhnzYCAZ/7HNBPNZdH80VP8xgYWERpdr+tsRQP6qefykPh
 0F5BGG5kBXLxGU2N0yQNLjQnby4752dbSXwZIbO3s0kBsvIsNQGxlQekfAVDLr7oyqxiXXAYARU
 R0DrY9WF1oTXw6gU7eMa4UebHbuaBeSWz6ZRVVNvZQQ++cwa5fAeBUxSSl3z8CKvm3lGJUYXKCN
 c7rPYQs5qnWc6MYxpxcMzGx6iGTJwcqwkHFpKqQHg1GRcj//Ql21pBGon6vomQf9vUcK1DgeRtV
 eYScQYhJocrJjaY+mi+HaOIeYg+X1OkJaLobEf6sJbg4/h7E55Y994XVy6o6EQOCuX7+4z+st0t
 3OXxnDnG3M9eUbvlUHyzjTqwRX6HbFXdRrpPPgkMZCCq+l0gLCqWKQdz11s23XbylqzmDBs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=870 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010102

On 7/1/2025 7:02 AM, Khatri, Sunil wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]

I cannot review this message with this restriction.  In my opinion, your 
email client is not properly configured for interfacing with the community.

-Jeff
