Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D311DE3D2
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749307447; cv=none; b=K6idwOvzzeR3RJkD/yy9Wid1e4ZCc5rFZNH+syH7tOBLRfEf2+APkJ3ESmx23Bvhha+9MpuFRJIpa9TuK1EKpr8Qv6zT4ktU5SizK6J7Hncms5ZNm1qREvirWVIsdI3VZWcHLRRU3GjP7U5joJKs32Eg6DgElxIASEaL9frQjJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749307447; c=relaxed/simple;
	bh=06QCCbe7hzLwzefTu1oYClxucg70yv46g5wjQoX3JU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RlocMyhSOomnEeIOMaQf9Zjx9iwkFLKfwg4ySLOCMatMo3fYeVsrfjLFq8onGnFeES6/1EfmjgIa9XQXA7puTDKFXvVB01zpI3RvChRtSHJy+Jed+4B6EQCv0vfwAjsdJCdB8x4P3nwr6OHVRbT7KRydrpILn3hTAjRSeeEaog0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcD6bmaD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcD6bmaD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DTpRX004631
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 14:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AJoV7kJK8wLd0qFjYQ9a0bVzN+q1YKr+TdV+FiHH+8=; b=FcD6bmaDgt/ua2bd
	ZdQdUHNg2LPkXbU44nxJvyiOwq4V0s+KKBcmsGsNFAc1zycL27/UntEhij2/mkhF
	D+/SHsEeIOAnuvBEVH11+Xhhwq993dv5uQaYhdgyOPcwb/7g1vNbTVeWPz+wSVZU
	S/OeBnXzrtq9Sue0CPbwEWLtjWxand1q2K/8O7pIDaGySrfX7NgnWVD19JlXtoo9
	AM517xO6iJ8JfdpzeifdgxqrVPHtwr4gZKqrhxW/8LUnzuKY8VPzrH9BfD6Xnvbo
	cCDe3Fx4tfPzx/Epmo0MyJl3Lm/YXWfbKpV6/FQBjw7CKclULrib775US3AYHTJG
	EohoVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkrrsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 14:44:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30ea0e890ccso2999292a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307443; x=1749912243;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5AJoV7kJK8wLd0qFjYQ9a0bVzN+q1YKr+TdV+FiHH+8=;
        b=qt7ZZ5cvVcZVka1YMh8dIiBpBoD4SIt+zBsqUpLUsIlj6Ptg64mwwDRVIPuzjIZNFt
         E+AdBCblCVS9cw9jsLs8CgiG++QAES67GQsJJ1CCV1Wj/JkMtGStEj5f/h9qEDlmIwiQ
         TwB2w9n1o+2HJb83LjSw6bUC3qnqS66YRB7Kc5KTjsLdncicZy2Be+z+I2VdUhqwFTlY
         i3Rku2rDgX7qkenHgodL5M7zqxYuzsLXNYkP7vJq/1KR3zsUZ/nzbpkuf0MCYcmfw09F
         As43IhKGCz/QXPsKhw2Fgi9hQfqs6EiKqsWoBQuiMu0pLan8PlAoDQYCIUcM2GB+PvHS
         h3VA==
X-Forwarded-Encrypted: i=1; AJvYcCUdW66/zqJoNgLHneasVBk/Chm90Cfy5BIcrefvSLD/1weKBYkYIZIdn4V8dHjc49cBmLs1ieqHEhDCTcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX2YBDvRCoGtLj6GpKCosGYSVgZ0dlgpwc34nDTeLApQxUnReC
	MgGuPiWpLmmmV6zH7+ZheXEtjm71Z4VLGYCWr5wRGFwRe5hEcOlkUjXP1jivmPVs6DsVkOworuP
	kyQstlbVmUK1tQF4I+luNlGl/u0WdK6L9CSEbypNLwnXIK8GxPII396+OAZlUQqFk1Vs=
X-Gm-Gg: ASbGncvNTiXPa7Et+fWijCWygPqv/8MRlQDQlgoKxBWqi73bY9HguehFvGRdazUQFz5
	IvzwzHDszJL4EpDqd5PKB9wnWjG6HgibMhwtAXIZgl8J5tlwPIjS257mGIz+nnZv1ybiMraFv0U
	sA7mX5UKqUQsP12h6NGbGJLuT03QbmSDJnp85IXbVvDDDllCGGl4aew4OEELFmsd2wpyqrNwM3H
	XJoN9GHgUeCxXp/L54zEiWPfetAPTOJR2hwV6gTIDcmG0WUiezURmvs5qdxN6ykjUmoO0otvp7K
	j6tc/Cq8cVhY9tUcY/sTeLGhfTq4MnP892Ch5QujYmlvwLtO
X-Received: by 2002:a17:902:da88:b0:235:129e:f649 with SMTP id d9443c01a7336-23601d01ddamr113333295ad.12.1749307443229;
        Sat, 07 Jun 2025 07:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf5t4bZmgcbYoheZ9gcH9Maf9GoA/v2OUQJJJafoOCAMV80dVHYCz/9D7MSymX39J2T0nWVA==
X-Received: by 2002:a17:902:da88:b0:235:129e:f649 with SMTP id d9443c01a7336-23601d01ddamr113332985ad.12.1749307442864;
        Sat, 07 Jun 2025 07:44:02 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:44:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Sriram R <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Parth Panchoil <parth105105@gmail.com>
In-Reply-To: <20250523-ath12k-wrong-global-reset-addr-v1-1-3b06eb556196@quicinc.com>
References: <20250523-ath12k-wrong-global-reset-addr-v1-1-3b06eb556196@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST
 definition for WCN7850
Message-Id: <174930744132.154748.8693669637865725058.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:44:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=68445034 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=17ir-Gtp1zVAAPY-F3MA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: LhC5qvSOV3gJgFRymreFWUMSxK5Yh0dl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfX7BmTNxx4/O1s
 xASRjYo8ArdgbnYKOIIUD6Kk/wUEtaoaY3PMeLS3TOBJK/E+gN9NzJxU3M+wJKK9/rzmFbgI17p
 F0TaBRGRBfTpuhZWx1zun70p0Q/Hm9m4LByAAoVmE/xkd2ZttsQBes5GGZt9fpDKoIchKyWdogF
 LMlv/8HyRcP4d8ODDqha0enITTPshrvIl+d7BS3HQ2NMYBiwrNjfkrCVHnZAgOtHEI5VMOzts6V
 AQtfweOhM/5pRJI45YPRvPltEHpwhSEdrGoaGDnyyo/FsrDB+MgWYO/CLH0eL+rABN9ZtSVz8Zk
 Qfn2Z5jqCdGPF9eEGg3WqppWS4atZQALaf98XaR/pJi/1spBTriuou5s1oRKGxamguix4JZBPzE
 CIBkpsEDXm2JkzKMq0eYBObWhRs6mPelGfwbNju60NoRdB9q/GBYISXAprTytsx+F6q/TwDA
X-Proofpoint-ORIG-GUID: LhC5qvSOV3gJgFRymreFWUMSxK5Yh0dl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=691 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070106


On Fri, 23 May 2025 10:23:05 +0800, Baochen Qiang wrote:
> GCC_GCC_PCIE_HOT_RST is wrongly defined for WCN7850, causing kernel crash
> on some specific platforms.
> 
> Since this register is divergent for WCN7850 and QCN9274, move it to
> register table to allow different definitions. Then correct the register
> address for WCN7850 to fix this issue.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850
      commit: 7588a893cde5385ad308400ff167d29a29913b3a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

