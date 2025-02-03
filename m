Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9F31EEA2D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 22:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622953; cv=none; b=PfLZnOegEzkaC3URMxIJQN7oDPYNwNI9l29F9aCy5ZsV5LyeH4zRc6Un0RERt6nNrSdxDK9roEUGDB2/jWQKyUH+CN1N1SNkDqB2qmfKTD67kVs/rFUh5hRGV7nyIrUrkyeowII+JSSdySChxQ2cjU3vGIZSmxn6Gq5OmyjGsBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622953; c=relaxed/simple;
	bh=2yUs+IM5Pl1W55T4vQoTAtoqlF3k1yeqhi4aT/ur60M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GYxifdp+nC+4MHQYIyQw9tCo0ntm19byMZXTdwqATnUyH3wS2jDQLNNhid6dOOsyN+gnV7UI4p2M2x/wFnK0XuOUNIPXRztoXoudYH5YZaJ0XXmf7SUCLMSCext5+ZZV+jvkyhQcAOjZHnHa7K9nni8m3wXKdKSAV3yNvFeJbzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlsGb3O+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlsGb3O+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513E5Vg7002360
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 22:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hw7bNV05959ms6oss+YF+4qJZNr/KZytbXPLNUurobM=; b=TlsGb3O+0wCAGyyt
	TbjEp2XQVfuCz34of4l0mDy2Znw4AqVHPY0UkUC7Tq+ees+9ILfuCz5yfeiw9QjK
	pZZKErkqZF4RTHMVy/o8fRF0uur5V+hpGWXKHlBKbPX/pXI4wI+BpNmoTdeWwHvP
	sDlcIyGhOWXb6qKDAUD52/RYt1lZuYOZWPtceAL0yAxno5kjW8guhYKl9uGlmJAc
	ClTnYJGU94lE9MiUuxrKJfxqpOctKe0MxeRlJ5UqabeaUTE02x5LfAVulD6PSwvo
	bmQh9VWq3rhh5lgCLDEyqIrlzI8F4gvlyiMhOOlqzRxPhSbsM9V/ZBAb9cjIcqDp
	zaZJBQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jy8s943x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 22:49:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2163a2a1ec2so173363965ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 14:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622950; x=1739227750;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw7bNV05959ms6oss+YF+4qJZNr/KZytbXPLNUurobM=;
        b=a2UvjvesHQxxvo1/sgAiFUHKQCJQ57TqD/w4FEFSWBZACrQTXHMR6DuUj7YR578BAJ
         MG3l7f0gVdrE5LB0DqMDtP5G170SG4gQRWYtg6V5i3dzYfp3ZFvs6yALrFJECMlE4rXY
         BzU3Lf9Aurj+8x3h5qjZy+I1DNPj2F70AfRwLWp6bKyFzkL5Gfc7bB+6iZP0NhHEVDzA
         r/vHNO6eiyLUXGUb++TPstuGpaSHi4MUUn+sm8rPhPS8SOzwMdIHpdlKkrsMRo2AELfH
         fmo0//CU0MlimeBi/nQUg6pXk8toJqDXsgWJhm73+Q8IRDNEFFQ37dpj3b/F90dCXmXk
         rREg==
X-Forwarded-Encrypted: i=1; AJvYcCVdAzHA5fcCaBa8mG+VuE5gpMDAUOjsQJM0weZq+TTn5UZR6VhGKtnKNgUwil34CS/XO+mvsPcM3Gdst5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfWc55rITaAdXqzrDJPiXKGjnTLQfJP5BIYURpt9Vg9GhcwHE6
	FsNW00jwlge/qbJlBbi1jAPf3nmz6bD6vmMoDJ9O3lWp00kAikHfMmBZOjmOv2Fh2CHe9rbJ8F3
	x6IkKlQi81Bg4NuG2jiocBW8W7Gxr8LEvDbQd/kO2QJF8yq7VvcaLpsU9NmeLXRc=
X-Gm-Gg: ASbGncuttrTfMrW4L39jY8xECjhbO8EJRxPbVHqwpyFKdEO4jeIEpfAgdB6g3suSfOg
	CE5R0MpUAa9opbH6R4g0YZ4djX4w1ljefpEY2CWnvATwsJ56f4RP2HMWygrcvFhTr7nrkWn65uf
	ZW+JDNzTCRYbsBs8ewncJC4u/ZM+wMS7G9Y2H2I4iQDyTV47/KagbyGQGZxiZoZLpLknRHTLwi0
	ppXz0ENqu+SWY3fHaTHbF0ifts0bYzeMcKnuGroOAaOnrCjOnm60SKGb3xl3TO4hUZ+hrltf+AV
	9W/sb/wWt2nXUg9fbhK1vwePcTH5E1oGfnxx68drGA==
X-Received: by 2002:a05:6300:8a03:b0:1ed:9abe:c663 with SMTP id adf61e73a8af0-1ed9abec6e5mr15242519637.10.1738622949685;
        Mon, 03 Feb 2025 14:49:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLgkO3wpYZ3B0nMiUJkb7E9OU7kLXT89O26RAqf3BGd34605SKsXiAulB5vO5cyrzb9LtnHg==
X-Received: by 2002:a05:6300:8a03:b0:1ed:9abe:c663 with SMTP id adf61e73a8af0-1ed9abec6e5mr15242499637.10.1738622949298;
        Mon, 03 Feb 2025 14:49:09 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba353sm8887444b3a.112.2025.02.03.14.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:49:08 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
References: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
Subject: Re: [PATCH v2 0/4] wifi: ath12k: add MLO CSA support
Message-Id: <173862294852.3734728.6340802985504252357.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 14:49:08 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: waeVSMr-yRyYo7zRXVycyf3qLDk_QSRT
X-Proofpoint-ORIG-GUID: waeVSMr-yRyYo7zRXVycyf3qLDk_QSRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=913 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030166


On Fri, 24 Jan 2025 11:46:34 +0530, Aditya Kumar Singh wrote:
> Patch 1 and 2 are pre-req fixes (applies to non-MLO as well)
> 
> Patch 3 basically uses arvif->link_id to enable MLO for CSA while adding
> support to update counters throughout the CSA time.
> 
> Patch 4 fixes a potential problem seen when medium is busy. Again this
> applies to both MLO and non-MLO. But this is exposed only when Patch 3 is
> there.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: update beacon template function to use arvif structure
      commit: 4094445969740028f9b637977781b73b64c5bc7c
[2/4] wifi: ath12k: fix handling of CSA offsets in beacon template command
      commit: f9c88d65e805ca06f26806ac99f569a3dfac2229
[3/4] wifi: ath12k: update the latest CSA counter
      commit: e26a6989b10a3dfc97b8c206023a6bf3a3ccb94e
[4/4] wifi: ath12k: prevent CSA counter to reach 0 and hit WARN_ON_ONCE
      commit: 36f002a3e36efd3370f5b6abfc157e7481ecb1e0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

