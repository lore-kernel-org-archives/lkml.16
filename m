Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357D8288CA1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676894; cv=none; b=MJpDPbC+y5EVl/dUd0N5Z/+tOFln9Tdq74zTK0muv874w9z/TpzXObl0pnDxSSKsre61nAWlL53tIy2Lkl47s47iSd6SLeJAZkvWL9rzRMC8/VxQ1Fx2a7u/UU264jzxh3r/WrZ1hLTMyPjQuZfwuKSasKLC0m0pVGx2GM8cpoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676894; c=relaxed/simple;
	bh=M97Y8x0YiuGxep1O7/I5Kmqnvcyk1X4uqJZFP7u86ps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sPTrhpMCR/oexCcipMEscCZgTkBqRjRFzax4zeqAAa1gtTI4uBA9WsbzFxtcqNGRdZO1TqR4oVaJmZdaPO3bYKx0Bj57Apqht4gKCtApX3H2e3SimDBOnNyQFbLTnaSRUVbYxXqw0bW3K9vmkL9Ua9LjThT+lpzgX6st6mQBKiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ltm3QLGV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ltm3QLGV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JFR9OF023182
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ki30LBVSh/m/cS8iJTZ5EjzlsryTFaBrVqN1bd9yR+A=; b=ltm3QLGVTYC6ZrI1
	gat0/SKJENLXLXzsmaHfWlLAJ5pZWxoHQ2mKoTva0fZLOgjGWaExNR94M2xru+r1
	c9dBAaXiYZcIbL6Ll+ex5cM7FoqRG38r460lVdRhVI7rkz4tl62kOht3KF480a9D
	hIkCXeFdNAoNc8SwwVxmoA6Dsrss0qb3uX1i5hDkWEFSBTwq7Bp2SVY6K9ZRUYi+
	LaDvAsKNK9un9dbneTJnuzb508vpX6T2SeidkrxhnKiOeqrF57e4uhR9SGVqHtDo
	7wxu7YSz/RoqC5IpX2WLPbkc1Ia7oUxJXRSXKPMrdhG0jZVCMNE/XuwOd5qWLo5D
	XoF1TQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041srm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22de54b0b97so43990135ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676891; x=1748281691;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki30LBVSh/m/cS8iJTZ5EjzlsryTFaBrVqN1bd9yR+A=;
        b=nYNQWI2IVJpyNFtKOYPwvi3U+mrDU+XfG7ckcBkA/qcypj/g2atRxkt0q2/CeYmuhx
         uHM58mHMjHm+UoTe2bMtoSGAYv91cJl6Yt0Vn7j4+MJMY5ppflD7uQXkbZnchHqMArpS
         RNmVnfiP8FKq85C9E2RYw0IHC8fjioZ12lLgUMUYJOLe7hwiWzInPVevXUeCF4h+tfTw
         bUmwXqK9h0zO5XucY1a4Ct2LJ/FVUYrSYvEZk3YH00tj2bWqLTkg/UUoR4OixoqLd6Cq
         WA4Lz8apN8OD+uEpj7P3WkpIdnqVHH8845+EuOYSc3cqjT8LKniHhi8jjAgE2Nk62sYe
         qNFA==
X-Forwarded-Encrypted: i=1; AJvYcCWnACM9kM8GwpJ1TVYgqPMm4jABvwklJNQebfYwXOIaObF5AiBcH4ea8V7O3eYjpce86tORF32Vcqj2Dxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYJZAxJrLDnZM5dKBmfTWmr+BCkoy4ZNhRzeibVK7ZIfw8bdr
	fTmVIIqQCkYlRTlHF5LVoaSq737BYTnELQA9gjpXWPEwKzgbKJIXEtjDkIC67/GnQ2PhCpyzkOb
	Pue2VyFJU+TtWHxkplAe79vtWYy8dRbzLEhkV/FDyyrT9Fq/9crKcxkIihTEwrpFvti6fGfDN/b
	c=
X-Gm-Gg: ASbGncuQ2eLsiRI1a3MaF90mu88i4uJKKTWpYHnVQy6BRHgeCi1rScvdtj78v3DDNau
	p8ydjZqoUHifqGtDATvsAu7a+8isxkh7KjFeKgJNKwjdUxRlRjdN4z7B6xHyB6UK0NiCRizIiEr
	6GTBaF698U974JuvMrNlS4xp9CBVq/IuRgGq01/Wp6AGCKQ298y/Nbamn7mwhPslTLnztQDb7Ld
	KelgcADd2VtY5Nd0WcpWLGG4ucvqGwSJpWqwNwCYh9x97WJ0X4c0Gb8UIKrc16BdG7leHv53t7a
	HXJSWIsOElBncaTrzfmJihFfAOOEMT0dtc4rTrEnvULgFUbE
X-Received: by 2002:a17:903:258e:b0:22e:50e1:746 with SMTP id d9443c01a7336-231de370ec4mr146664005ad.36.1747676891029;
        Mon, 19 May 2025 10:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9IhBjayy6fKJrsILI/AjgXlo4kjWAqCWZJbGImLRI5GukGOA1+tI1EeTwEv6Rxm2rDl08PQ==
X-Received: by 2002:a17:903:258e:b0:22e:50e1:746 with SMTP id d9443c01a7336-231de370ec4mr146663775ad.36.1747676890682;
        Mon, 19 May 2025 10:48:10 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        Clayton Craft <clayton@craftyguy.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20250321095219.19369-1-johan+linaro@kernel.org>
References: <20250321095219.19369-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix ring-buffer corruption
Message-Id: <174767688965.2567051.14391115791572763254.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfXwtYkwGgSpzqJ
 v3D8cGi+iHGRoae9QGHP2MnJVJZhdKeUPyNnJv1h8+h4Af+HZlv+RVew2ZKUoSNBsD+tYAYJ1nW
 AIGIePHfL1on3UfZjOgMON3g9no+m9LvyRlCTkKZmVlZQOaMLjHjfeb6zWclxJuruZVzhHmPBzU
 pyi/GkPmG0a5s/ojCaD3CnDky0jRVkK3CQ7v3FXdA40C07ttdu65WC2ZepXXTS976w+3k7aM5b/
 MPVeKTeDp8yIwqBLE59aRnaO+/Ox5f9IXyHE/vKK22QFt3A1o/5606+PK+ahUZaGcVTBHByW+9H
 7rFJrrWicLqw2tTHWModcHiT6iHufj+hhtskWtd2l1owihkjuoh2h5/FnyHx5z/fs9nqcw9chTj
 XGM4pVqWTrKdHu9nIlP1pXMDeUMec/KzsEv3MKz2IWFOtKkcDdwFyXEIQ7mc+yGF0MJWsK7O
X-Proofpoint-ORIG-GUID: wqkL4RFCLmT0y3m7y7RmX_hIWpSremJm
X-Proofpoint-GUID: wqkL4RFCLmT0y3m7y7RmX_hIWpSremJm
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b6edc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=R867-RJU_ElmTgWIOUYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=691 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190165


On Fri, 21 Mar 2025 10:52:19 +0100, Johan Hovold wrote:
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
> 
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> which based on a quick look at the ath11k driver seemed to indicate some
> kind of ring-buffer corruption.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix ring-buffer corruption
      commit: 6b67d2cf14ea997061f61e9c8afd4e1c0f22acb9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

