Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD7E253B46
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288678; cv=none; b=cuZZANk3YBCUxKyTFBZbmABPFRELLmR89mUD9b/C1VvK2wPFDxzHkPGuYonNbPxQMR420pqBrf9X6UQmU6h996n6o55Et9R9xPGpNuxze1uXyMJukhFwZC5DG/lxaL/DOtAso3tU1iQUd4Gvg/gigU7EUZ3Q0KkleaHVm8xGPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288678; c=relaxed/simple;
	bh=aYrOlTvgbndeptck2n5IxciwutiIcFQpNgYUMDpGdWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l8kQSNn+L/k+5DnAodFZQM2ZgQh17ZoPpCzlHbQOGgRLkVHsdD3WzzEI1J9TJWCl0EOaYn1KzHV9XfxzLvVIpkbqxTtyGjsYqxad1mgUmefG2J3dqKSWWfpJnRYdIz0ZR2DMgdbBVsahENVs2q5kkAlGPfMLwaGGUj7TETQ7d7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCMgbtBh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCMgbtBh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDiLhW008011
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlL5jzWhI6M1DWypiuTqms2s6pTVuYe03e0nspNkVqM=; b=kCMgbtBhnARTGY7O
	ZEnOMH7OasNrz2M+zmrj2Ef8UR2p9x6t2ESqUwvvtvdp/1a+iZO7m6qMJSESk9Ov
	H7uNgnZasNE+7CqljdAjkk+PtXzYylndHDzWu9oycwS8NnfFMFVAdoHQNTYU6pyn
	k5xmxbUJOFTfLlUCFyGoSDKACLl57cRl85JmNg3/pxxJCcuc2iKl0kRQ1nUk50ir
	V42GS35z00Y5QQJv8ClpyP72fui1Fi2Gzy6TG/lbp4X89f1oNUvNql+wNduQRQjK
	mhEvDXlyxdQLZAcghSwqUC2hNuG9goA2kKSDrcLwzFP0/9gIS23HrtL8KOtPGS6B
	gOEfXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qy4d9uuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:44:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21f022fc6a3so122279695ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288675; x=1739893475;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UlL5jzWhI6M1DWypiuTqms2s6pTVuYe03e0nspNkVqM=;
        b=Tbh5I+xEIRAOAi6haSgZyNUGPcqLz1dF8WrpYUZ7hlWnxhG0iG34OXQd7/nZ4D3vUX
         JqITMg/xSiWR1L3yqtLehVJwMknwNLcWe1vD/h6pfWEjNS6SOLi84xG/euy61VZVkN8n
         C6I70l/ZfwZcHm3/4P+NZrqhxxxNA+UmCb0IjOTgZCR7UV6hpZFZDFr/anBOAjILHg9D
         9hcIC2fKWeDns3v4T4oiV0BWARj9VE8/VvZUhGhNMZlIAq0S9gLQ62h6LtyQQljSwHJB
         rQMAH6yvVcDQxx44a2LgRZaPetzSMU2XnF6MSsXvHDZntFvqp9ZtSmMyka9BwwW+WfPu
         h6tw==
X-Forwarded-Encrypted: i=1; AJvYcCU+avHTaCroJbGA4RGD/uOGHZUfO04ayJBc2Q7Olk+e97bG45Zc/HC0bHwnM+TVUcUZ1yFmEFyqm+n5Mt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YziBHoWOa0gVOhWGY4t0fdwtVskM1hn3CWBFYIeTkgNxLwz5xXD
	o0CD84DIGiWhPdCOAd2eiYVDJRbWqIjOZ/ywrrEI/hFTQmFYan2dMlrz4IRhRoX6n3g2GbQkInE
	WAjr+yR2WVMU8SDtPRPk6NWb0Wq+i3jVJ44kCuzz1QTQX8SXMmLcRfRHO2xeRdJY=
X-Gm-Gg: ASbGncu2GipCGdSuhk8xxaZ6ZMeVsbuAEJGk05OKvhqc0cl4cDIJSTO3AXaeYRUoDTQ
	qZft8tpraydd1F/0PX8oMNzitipmezTYF+0LRgeFWWE1X/w95U1WYp9iw7PKWscoqGRT+zqFab9
	LVVOnGOKw11Bbd0YNokaPyvQW0vEszlUu+57UcW4nRfRgkTavevG7PqlBdkJhEsgMp5ZCs/XSk5
	cPI3IM+VaVNRhLjIFin5YyGcDD3L49gOiU5Qg2fD5fzBjWCXpfatpvfNMfook+z/zYFJOyUHZLG
	vq9J56epg5GTN/dtHl2dXRTDX5ds9eDaWvuUUPJidw==
X-Received: by 2002:a17:902:e54d:b0:21f:3823:482b with SMTP id d9443c01a7336-21fb6f54a29mr65682245ad.25.1739288674832;
        Tue, 11 Feb 2025 07:44:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTHP3BuxfPO3ra/69YVt4iP5Bp7MokO6wGbhU+W5xVl2c/0maHagbygDnfGfVhI2DQD1ByWQ==
X-Received: by 2002:a17:902:e54d:b0:21f:3823:482b with SMTP id d9443c01a7336-21fb6f54a29mr65681755ad.25.1739288674397;
        Tue, 11 Feb 2025 07:44:34 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:33 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] wifi: ath12k: handle change_vif_links()
 callback
Message-Id: <173928867318.1115150.2680608610563068978.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:33 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: jg1jdLRVnD7LBaKi5gtZCBEDvmoz5hyS
X-Proofpoint-GUID: jg1jdLRVnD7LBaKi5gtZCBEDvmoz5hyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110104


On Tue, 04 Feb 2025 22:35:06 +0530, Aditya Kumar Singh wrote:
> Currently, links in an interface are allocated during channel assignment
> via assign_vif_chanctx(). Conversely, links are deleted during channel
> unassignment via unassign_vif_chanctx(). However, deleting links during
> channel unassignment does not comply with mac80211 link handling.
> Therefore, this process should be managed within change_vif_links().
> 
> This series aims to add support to handle links in change_vif_links()
> callback.
> 
> [...]

Applied, thanks!

[1/8] wifi: ath12k: eliminate redundant debug mask check in ath12k_dbg()
      commit: cc5faf08aa3afc6f60d7df1a0edf041c4384fc95
[2/8] wifi: ath12k: introduce ath12k_generic_dbg()
      commit: 80f816d07ba0cf80a9b6aa90a30af2b2073c6cb7
[3/8] wifi: ath12k: remove redundant vif settings during link interface creation
      commit: ab6270c4dec3b1a506291c3b0050230b32464781
[4/8] wifi: ath12k: remove redundant logic for initializing arvif
      commit: 8acc7ec53ac43aea8f49573b5a173570f308b775
[5/8] wifi: ath12k: use arvif instead of link_conf in ath12k_mac_set_key()
      commit: 00e4dc11695d48322780812b503314682659e98b
[6/8] wifi: ath12k: relocate a few functions in mac.c
      commit: b81c39d67fbfcaccb33a1fc5494a87b29f2724ab
[7/8] wifi: ath12k: allocate new links in change_vif_links()
      commit: 315d80be304ac1d47da38c2b0c85286c9220c23a
[8/8] wifi: ath12k: handle link removal in change_vif_links()
      commit: 81e4be30544ee7e8da80e9aae7acd69d3be6d05a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

