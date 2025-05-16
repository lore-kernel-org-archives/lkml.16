Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DA272E69
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417248; cv=none; b=ov9UGkdDKJe9Y8g+KpzBtAWhtBw13j88SJPnAxAGSVPL9kVC8AiWQxA9fnS1/1Z5rMrsrOU0SZhAwDPdgbpMXaaZR3TdDcdCGMTjfA2lACxpk9MYD70CbvkQKXX+BNd2GVwHs9fc1Go9uhZVkMX5A+oVNkMJi1u9yOBGdMpDKzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417248; c=relaxed/simple;
	bh=0c1yrSJrjxCsVlYq4tbr45bgKKiXASQqbAogZUlWQRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pBh11DqB7mzLIzG5fig22fZ+CzA1v0njsyiyce7Jh6Z0yxrIicv3PeUJhSnlCED27qZwTDUB7ZM7T/dFTzI2GVCmhuehsFe1tzj6MwIfoKxdRkDxaMz4ybXM8G7aXMlXZ13XSJqijaZai6mVozh3eZR8crIB5GsrbrPeFll2PEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Og6rGCC5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Og6rGCC5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBKN1k024402
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z2w10jA8jhawj7mJ7gHQ2d+FYBPDhiimjY7HiQ61Q6c=; b=Og6rGCC5PoNgGNyX
	tWn4KKbvRjmChKrDiHMely+CPmhtNIW0Fr85RQnsZECXVYdlE6JsqzjN3pALKZ5w
	jqObYK4zDatp+vrlzMqB1BZxV570ZRxK/2nAGPBHpJDRSJvejPuulJXTOfG4AgDQ
	Z/hWDERlTEG69jVbZ22epvZV1+/Q/gKGjRexfN9efzSbUcrfpAuDTN3TwICDwogF
	h3xdo38hDAjF9Us3e1TXRIjwH6WoLh320zNWPlueuCnvS2xWi026dzQK+pabMq2W
	KGBVdtbP5szSC2zRvrG6VU/z9Ue5xMKotzc0TlVXpyam/cDkI/JEJEQSLGEwqqhB
	Zi0khw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcn2y0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e7f041997so40306925ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417245; x=1748022045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2w10jA8jhawj7mJ7gHQ2d+FYBPDhiimjY7HiQ61Q6c=;
        b=NSgUCyCL+Ct0RtJT+VAhaRJsOKDX06LRnL2dY45lPk6JJsd8dBJ6783Qcl7zCwVvTT
         dnz0DQ+tSqVFXyIg5yowe9GwgCbaACeLH+gS8nZBdy0zPDKzOpFt+xE22J8JWZlbUX27
         N7YBpiPocR/nU0UMYi0U/8zx0JaBD2H3ZTeLfqvrCaaQQ2eCTTAox5XUAn+Po5EbBJhS
         /VAVpiKcieB1B5WWKPHyNZK4lP6b85FP8aLXHem1tV7IqX3XpGT2rv4556xyYy2yMmTV
         ISiStEOph5AwFGAP1CDZPVlyWQtiTIqLckN7jTYGdVlYreaSncoi5GFtPxrw5gcPGdRd
         6Ckw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Tnmb1IpsYBwXszb9ZpMtmciVjBKyxjSjcpRT85yX7JRFMLxwSZvcr3BjMqUPAYI512uCq+N5McF4qkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo9NKclwUzJ8EbdBdEfMys/geRHBb9bVCusuYGxHy1eSkbzDZk
	p/pys8TgEmufl3TOGOKio2IfQPTqDpen0eXc/9Ll8QUCU6KFOzA66Xg/3yudpMmfskr8S0jy70K
	zQkRJT8EKfReUzhGzYFCuEANONkZ57hiDqeHd8GxjMY5DaalYm2R/8wu7vUET+hrm4Xo=
X-Gm-Gg: ASbGncvqG3LmqgPURXAY0bt3Jav6ISX4NOnmh6olOq0yUGML7aV/jvjKpchfCEGO4OE
	SUUME0dwPajY0hbe1NHEQsp54t58G7PjqXjO7QDOdH0+PQahsghtCjFq15WZfl6jbTZB0LG+Bz1
	qXYU275c3qfOygfiozRFOEbtp4cRyxgvzizXDtO3pyyjwwS4niGiB66pW4HiWgM7tR4a67F2t8Z
	I97nlmlQxWpJU6B3oZl9mdM2S2T6/idxZeHK3S8HykVuBrvwczFWd6NobiQenq3q+FV+dQeVKLe
	9S1vefhYMee6XQft8+UK+zqyK6QfJrZLaA6szHqb72/+r77b
X-Received: by 2002:a17:903:1983:b0:22e:62c3:6990 with SMTP id d9443c01a7336-231d44e7182mr57457955ad.16.1747417245445;
        Fri, 16 May 2025 10:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExtF4TLFrrPoEt4gmfmLFTd9XEB50AQ+2oIAkdKuvYSP0egvrOWfC3m/7jstWY5dO6hzURnA==
X-Received: by 2002:a17:903:1983:b0:22e:62c3:6990 with SMTP id d9443c01a7336-231d44e7182mr57457635ad.16.1747417245053;
        Fri, 16 May 2025 10:40:45 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250418115627.534833-1-colin.i.king@gmail.com>
References: <20250418115627.534833-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] wifi: ath10k: Fix spelling mistake "comple" ->
 "complete"
Message-Id: <174741724396.2935573.18125129643312875821.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: 7pzZyuRui0UYTbgSchp7Q4ukc7yJ8ri0
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6827789e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=uQsNN5m5feiSJzJ953YA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 7pzZyuRui0UYTbgSchp7Q4ukc7yJ8ri0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfX9BPn+PnNc82N
 k8vS6TMchvO4M6vwaz5stqfuE++PUDaEPyB2q9+M3iYiVy2tiUYte5pv//mCFQ9f+VUrsTGdRrJ
 mXPf9jwnmFjfcHJCtZ53VQ5iW22RtiF+8EDqEQVvaaMM6IgDcBQf0wIWdAa8Ki1aSctAtORqFdk
 sl+9MGvVUBEWNrkIdr3vtfDvCzg1ueonVKKzGY3yMHKxfpnvrG2cmRZwxPO9XTeNJi9BKrN4O+U
 nw+vYq+N5DCvdmdjtF5oY2oS9SuQmhk4z8DrQTXNazy4C/JcCHFIiGZJTfs1s8rcoQROocBQ28s
 gCC3RFwWLyGT6wiaPQr+xKNbzuD2RfFeTsaBdA5AtwQgBp1VwqMKhg107GZPg9PmBTZewj2gP58
 rMOMSV5xzzA5XjkQISswPV7ed3aT6a9yFqjVKUpgIn3pmS326fzID1TUb6zfkOlMPMRkVK1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=811 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160172


On Fri, 18 Apr 2025 12:56:27 +0100, Colin Ian King wrote:
> There is a spelling mistake in a ath10k_warn message. Fix it and
> remove space before colon to tidy up message.
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: Fix spelling mistake "comple" -> "complete"
      commit: 2ef2d31925f0414ff0f37862b6c33f62b49089c5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

