Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB771C5F06
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054870; cv=none; b=rshIKftvFM5iW4gyG0ZgXJ3hWgCJ9FTWh0mCGXmdteTPgUUTh5+2dCCx5Ag/EH1gj5DMAH6T7YH40RgN+mkmPcO+Gi1MW5D2F6pYkzwKKfsOxariSrPzb61jCU6HaSqBfgTEij8Bqmud0fzIsmZR75y57g8d7t0Y8WUudcjiNDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054870; c=relaxed/simple;
	bh=MkbSXAB5F7px5eilxXRYYWaFWvkDGNxLgdjCFZ2y2nc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QRrUUixDKfH9NSkJmISSpDP8+231NY19c3hRA2Y+xbQy+sKe+CqQa9wb1UmAI6x5gFSBHzFcJDVkLRWwK5kEUCsR67KGWpIO6gkTWH+UlgcpaM5QDfTPCyRQQp80y2x+TW+W5m+q/RXF8iifgFDjqz6/bzYJS2XWJjYatR3hU3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ciFGuBtj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ciFGuBtj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537IY1xB009248
	for <linux-kernel@vger.kernel.org>; Mon, 7 Apr 2025 19:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KscTYQy481PoZuE7Dp2EwtjkJkp0UdcKA2vsrikNWn0=; b=ciFGuBtjzEjnJlQZ
	PwAh98GDTEwJm/0grZ/7fnzsFdqlnGzXr/B/TMm3nD+Fp2Hz6MY2Rd0xmlCY/Kqf
	agD7OYeKbQgVrk669Xw83zBaFZ0OdQOLxAZ6t1TZ81EE9scoCm6hXOoJFEBoyqsW
	EKJ5tB/HXndYLABzXP2xXFbvwMNnd8R+ROtkHGya/OfyiNL8q9YxjVKTHN/STemr
	F+3jpAOOD2vHInnUaB5nhL94qjdwBL3NNDc5LquEs5sFuKDkY/vTNe515GtYbYm8
	F4NT3UG8Fl32BQEHT7kr3cXeSzoU6Jdjd5g2CRylfJGZdnGJg3djfDMHBjiq6jLv
	HttO5g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbudcaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 19:41:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af91ea9e885so4136823a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 12:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744054867; x=1744659667;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KscTYQy481PoZuE7Dp2EwtjkJkp0UdcKA2vsrikNWn0=;
        b=a5Zxk9oVnza+2/CG7OowsswJ0oQ9ZxEHf/MB86FVtoFfFwhFz9ExGDuyDgG5LEdp2G
         IgD1ZNikZ/1/jF90qapMD53olOFM5OCQjM2rvjcuMVEGm3zvWecGgm72GoNpVM2Fxu9v
         BlxFpsMEMmUtsm9KYUB3x/caxhr7txmpZ0xzE1PxMee3Hi/laR/8gnkE88jjv1fhNAHN
         dtDbRAeWPpVmwY0IOpU7mhzSyBZurrM352kxc3YbGLKFN8mWh6PGL5JJwViic4x4JomL
         CM7a8VbpYW6qkICHG3RZEMh+35p+WN9yYiaivlmfsW+Orq+b2h/4zsMPRM9uspCGMuvh
         Uhbg==
X-Forwarded-Encrypted: i=1; AJvYcCWR5b+4GxjWQI1d4NG2FJZ/kXDm9HXMKMKuJEQIeGW3/19Wa68BtUNwMc4hha/uNFJa/gxOhqN18WUhxwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqQg4/tFSWEyaGvUDAwOcHJ+oAxyH6P0UbkjoMDwQdk1Ao3peK
	hnNj2ndlbW51kOyLX9sGW2eAE5G/17I4pZK1kVdHvGM/u3G31Gwk+88i8kZDQarr4dMHqPlCD2n
	yMo5TauLAnU+9CurfPLebl75SN8e6hBK411O6Mnu8C0Vu/vycHgP1InskaCjg0lM=
X-Gm-Gg: ASbGncvLn/pXLjANmeGe9xBwL3UAGgz+pzeDykGzN/J023tF34dr23bEh7M7Za4C5i9
	COFcpyHvv+1nwNxZBp9WQoQRd/BfPbl+mAGvlZme291cJefDX+AJxN+8yHSFpHnfn3VsWYW3fYP
	zSJWTHx+OWJ9HIGA9GoGvCTEbvZUekRPa46fqmp0q6Fr1SVgMVyaqKtNPnNj/3nah9vCfYBRJRg
	S80aXh1ajfKf2sao9nbBc6YMzuYQmOIudKeq8kFnFJV4jf428dOFFQVx0gN9SR5nNJMzoQsP+zx
	IPZdlish5MIvjAjaSSangqBjaECvGq/TgXj346NZwru1O1np++j8
X-Received: by 2002:a17:902:ea06:b0:220:e655:d77 with SMTP id d9443c01a7336-22a8a8b80d0mr159882725ad.36.1744054867163;
        Mon, 07 Apr 2025 12:41:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmGHIXWQeBBp1gmPxy3r2HeeVJ9kG9fvZKoCvwdCeWI7S9RPL6SmBh4Nrj+lTZnGTwahoMYQ==
X-Received: by 2002:a17:902:ea06:b0:220:e655:d77 with SMTP id d9443c01a7336-22a8a8b80d0mr159882535ad.36.1744054866792;
        Mon, 07 Apr 2025 12:41:06 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e6fdsm84822225ad.165.2025.04.07.12.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:41:06 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250407-upto-v1-1-23ca65f2ccdf@oss.qualcomm.com>
References: <20250407-upto-v1-1-23ca65f2ccdf@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath12k: Fix misspelling "upto" in dp.c
Message-Id: <174405486612.2865585.8066461311855235164.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:41:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: WmcFTP7v0yZNzMd5Z5_qS5h34kgIyiEe
X-Proofpoint-ORIG-GUID: WmcFTP7v0yZNzMd5Z5_qS5h34kgIyiEe
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f42a54 cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=iowja3EhBKiS3qvbEMEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_05,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=723 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070138


On Mon, 07 Apr 2025 11:28:26 -0700, Jeff Johnson wrote:
> ath12k-check is flagging:
> 
> drivers/net/wireless/ath/ath12k/dp.c:1656: 'upto' may be misspelled - perhaps 'up to'?
> 
> Replace "upto" with "up to" and split the comment line so that it
> doesn't exceed 80 columns.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix misspelling "upto" in dp.c
      commit: 68218fa0862aaa8fcc5f968663efc781eb4c91df

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

