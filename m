Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23288218858
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750203143; cv=none; b=hxdEOvXrxFxWYpi2qJlmifqHl5VUDKWsDlhqTbcBHxYMXYRDkTGSSkrKvnd3bbn5+0Rzv1Tlo9naSlPO/Yv80cLMemJagafPSOc3acRImiNlEtZoqiSJE1//1mm472Bv2o4BZMIBaCphsUsd0zkh9n+0YeNLpx+/QqSW6cZUrj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750203143; c=relaxed/simple;
	bh=nY6KZtnOAtjOwrx2Ms+V8WEvUEU0OGAYjUMU12JZPfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JesnuCycYTwARQ6Zm56XcrMLszwywl5tUWbQfUGChu+LOEJ6MbI92Rc/3yNE70pfXHQakocyc7dr65j4jFPv9JN11xzDG6HnHQmMhzECLRUea79CvvfGqmcFnjvloabyJISEYB3Vn6Bbb7n8xGxGVNldPha966LZJCESEbvigt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OH02isDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OH02isDS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HMXauU019267
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dODIc8OFkSO8WoD+zVzC4mGUSGgBpu7XdBLKDQWE4A8=; b=OH02isDSDD8gvmKN
	GZrwiHPWVfxFJ9KSdroBV6FJwAT21NS9c5E7anB7usEcDX6tpTQWsCeU7QMH4Dwf
	iOw6zjuUz6CggRwKW2e3hYanSR9E78e+1xrcojr+Ki6yu6C2FaR/UQVDHEDxrT+G
	X9+V7y5rf4YFJUp9QVpmVNdUfEQgB/h2b1CR2ceORUsfBNIOmrevw+gnOOCuz2a/
	ARVGSC+YyWJgJNG9UfJ8qtpHr3K4l8eJYC8AssNCawZQcGjxCaS2WsaMgDDJi4+S
	EE6RmSDMkJ6JfgJf4+togpmcrwe4lAW9bQ9RKvGgqb6J2PdPnVzi9RsiJVs38vUc
	iZ6rTA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd2617-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso7258145a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750203140; x=1750807940;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dODIc8OFkSO8WoD+zVzC4mGUSGgBpu7XdBLKDQWE4A8=;
        b=Y5F+RRFNf66ONXN07i/8xneaD+WTpreBmHDKhG4FjjoUtZj0UqOKyep6ohfRDI8iqs
         eE94eLnlkq5DcAvaS5eCpGSIR7Cn6qX/5RcmRerCoqhtg6FYK0dsOtYtTlJ3o0fMHgwL
         UPkEBH3C5H7bJate0rAR/PFgPGRwhZ3RPvhC5m7oyodtS7R5eDSGge0Q0a0fEWHMiCpy
         fWHS8t6q7o+7okygOF7tuX1CZ7o8xTGsefaGihnmUZcGkExiTG9ePuhKIp0y6CwccSGk
         slmp+DBF5aT43fp2Vui+PX4Pq0HKaDaIp5u1n7avJU6DwM/K+zIAeyWGFEiwZf3AbVen
         t9wg==
X-Forwarded-Encrypted: i=1; AJvYcCXBgZ0m4zfVMFUAaV36VUiDICUc9D077YOb+l2zg4JkPTugqNtuaG3f4+1pXd30zyX4azhm+8azEexsOLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2NFzHVrGlnR01Q5ATqCRk+5DHrxEKp13QHuanojRmDBqv3Fy2
	xWqB5yS9hVsapBaLqoquCciQGmWNQhq66e0OqgK2Qfhmk3R/G7Rz3dhHlymayaYlxGPTt6GNOFy
	KwRTtUvgOlHCmdmV4khivSsigU+9kw7347jgDqNHxrbEpo8S9r5Mvil0xA0fdIClqfbk=
X-Gm-Gg: ASbGncszGA+uOVQRL1ND/g/RK1jN5EX3cz7esEDsxLkLroSPMTNCcobAT+NiwySUncj
	DjYID1jBFh+zbmavEuSkt9Mjo3WfSYS/XPz4sHs0kblySnZ8CsfLzwDGHDW4ebe+H3j27kYCmO8
	ALphZhq9jTfpgiEzckFbE1Bmf8Swy/rgTqgs7l/mwDiNsruLSoJ6lpQABzxhJ1bMlSiGZ69qXlw
	GHd0x9m7KV357wgotQpsA6HDnsRZdtcqXFUxJQ9N32lE3qe4v6PVi+3TaUWpV/w9bGHqz4ByRVp
	jJ6C7X9detV12j6P6Xomu8RjetPuW2y4uy8XIJhJvNj017W9yaykPk4LLyw=
X-Received: by 2002:a17:90b:17c5:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-313f1d2d2efmr19221088a91.34.1750203140274;
        Tue, 17 Jun 2025 16:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkZl7s1slbbiEI7nNWQRSVCNx06U+xoTDxO2I1beV25xpGDydiPIMLlLVlSbnf7tvxYkQIbg==
X-Received: by 2002:a17:90b:17c5:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-313f1d2d2efmr19221052a91.34.1750203139809;
        Tue, 17 Jun 2025 16:32:19 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm12731527a91.2.2025.06.17.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:32:19 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
References: <20250522-ath12k-sbs-dbs-v1-0-54a29e7a3a88@quicinc.com>
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: handle link select and
 inactivate
Message-Id: <175020313899.3793705.13608281635495302018.b4-ty@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 16:32:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE5MiBTYWx0ZWRfX2q60+V9dez/Q
 PwosZAQFS5mu7xExfDpYFZktkfnU3+mJ8JSquWbR8HTT/JrwJwvImzKtzKM+HA6tWxSYALsDiEI
 Oty/B0wK15XE4X0HHP+bs3ivYf+sAhugFUJk8MvarH4HohzM22GvAHTBKwvAJXtSZTCQPPjNqKv
 4D0oT77OycPO1QDjVsKEUalBC9DYPgruJ1n3b+IbgdkcUsSmN0ZqrBU4k/rcQa/udpuDE2OoU5e
 A7t+3SV3ct5y4BIWVO5nY1Bpmi9CBcvogsVfKxvWV7U3YkfYp0Breg3ZvV2PgctLej0Q3+oLgWI
 jwxsN7JQMBpt508/1mvOEb6zMLxDU3JZsS5GSqdZpGECgUBtD01/iKKFPkwT47L8UV5X97HP2El
 GCzyobs01RvzPCelazakLvQ2v7SLRCBeVki4W8P3eospiOGkF1zEeE8sXouROthOPzkwH7OC
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6851fb05 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KkTelb30UcioZhBSqh4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: l3-D2uQV-_xqFcMIA6jyZAO4EFp1Z0g5
X-Proofpoint-GUID: l3-D2uQV-_xqFcMIA6jyZAO4EFp1Z0g5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=889 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170192


On Thu, 22 May 2025 16:54:09 +0800, Baochen Qiang wrote:
> Currently host activate all useful links:
> 
> 	ieee80211_set_active_links(vif, ieee80211_vif_usable_links(vif))
> 
> this leads to 2 issues:
> 
> 1#: If 2 links are created/activated on the same device, and both channels
> used by them fall on the same hardware MAC, throughput would be lower
> compared with even one link due to MAC switching between them.
> 
> [...]

Applied, thanks!

[1/6] wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use
      commit: 062ade23991e556a14bbb27c1cf873c34dbd9d28
[2/6] wifi: ath12k: parse and save sbs_lower_band_end_freq from WMI_SERVICE_READY_EXT2_EVENTID event
      commit: 241d130f1419fd99923d99aff6e40490a4c34d93
[3/6] wifi: ath12k: update freq range for each hardware mode
      commit: e47b11e3bd34177af6669ef0945eb23dd4da3bcb
[4/6] wifi: ath12k: support WMI_MLO_LINK_SET_ACTIVE_CMDID command
      commit: c36f2cd628f9df6ffb19c23eedaa666440b8f5c5
[5/6] wifi: ath12k: update link active in case two links fall on the same MAC
      commit: 2296038fd35a6e57af77496affe9044293ed2947
[6/6] wifi: ath12k: don't activate more links than firmware supports
      commit: d9dbc6b8b94ab41fb8b9dbb5a7be024029d46309

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

